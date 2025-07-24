Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FC6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 00:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9pHNlMcULZlNjE49XxOwz/TS8VMaOnq1+DW9RLI+HU=; b=L5RfdJ2aEqyM8CvN7jO8BIZ5Mg
	M0LHBhNOUxZE40vYB2Hmt7lvq67e6V1PmcIl+fV+oWX0xC84kDTrGLMzpBpOZLlGGcHKgXoS6YpI0
	2/JQuMgQ3nvhXt7m6JyH41/JyY5KEnOUvTmW5nO3XZ96x8iHyziCkWiTR3rgWoMFQxPQAjicTEGgT
	CrPsP5PsNRHzeTTXvJqkw/EQVYfnOpTJ3yBSYA/GANPrTUlFMCcD/waP48OgEzAYb8i8tB6prqVYv
	Qq5u6nm7WLw1CBHEpkXRyPWO20Wz1+m+BqECe9Jo1y0L02GZdRoGgOuCKljg4BmO1aJJOD5J797H3
	IaGKdGKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejxq-00000006FiM-2d8Y;
	Thu, 24 Jul 2025 00:37:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejgd-00000006EO5-3orj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 00:19:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98AD460206;
	Thu, 24 Jul 2025 00:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD4BC4CEE7;
	Thu, 24 Jul 2025 00:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753316389;
	bh=NtHxaMnN5aPuveNsuyUdcuILPJrVtVSf0qXi3bKHF/g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CDWZ22OpxTaQfb34su+edsg9+mDZy9BbyeKsWF2RRppprjH2vrNCfuuAOljkQVObA
	 Z/vPSSlcxUgpManz4hDTufyZ5t8zw5kCINf9XjrpCK8xPrMOANGbjokkNaSEUhFx8L
	 a+CsTVI6yD4AoZT4E7Kh+vPXYQWpmJaYJenz8Bh+XqD1DBQbsDoomKq9qwjHIrpLzV
	 Awbql54Mf0GIuIfuC+EEzzHWVB6HF/zx2bESvmwNkUicswxoxhhii61eW6MF/2mkcX
	 ALN9PBesmIsYesPJ5GtKHllzB4714FoKz+86/tj2maNTa18VUkWMb+HRvtTdKwE0SN
	 PQLglTEQPB4Dg==
Date: Wed, 23 Jul 2025 17:19:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <namcao@linutronix.de>, <jacob.e.keller@intel.com>, <sdf@fomichev.me>,
 <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
 <ast@kernel.org>, <pabeni@redhat.com>, <edumazet@google.com>,
 <davem@davemloft.net>, <andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH net] net: ti: icssg-prueth: Fix skb handling for
 XDP_PASS
Message-ID: <20250723171947.76995990@kernel.org>
In-Reply-To: <20250721124918.3347679-1-m-malladi@ti.com>
References: <20250721124918.3347679-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 21 Jul 2025 18:19:18 +0530 Meghana Malladi wrote:
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
> index 12f25cec6255..a0e7def33e8e 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_common.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
> @@ -757,15 +757,12 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, u32 *xdp_state)
>  		xdp_prepare_buff(&xdp, pa, PRUETH_HEADROOM, pkt_len, false);
>  
>  		*xdp_state = emac_run_xdp(emac, &xdp, page, &pkt_len);
> -		if (*xdp_state == ICSSG_XDP_PASS)
> -			skb = xdp_build_skb_from_buff(&xdp);
> -		else
> +		if (*xdp_state != ICSSG_XDP_PASS)
>  			goto requeue;
> -	} else {
> -		/* prepare skb and send to n/w stack */
> -		skb = napi_build_skb(pa, PAGE_SIZE);
>  	}
>  
> +	/* prepare skb and send to n/w stack */
> +	skb = napi_build_skb(pa, PAGE_SIZE);
>  	if (!skb) {
>  		ndev->stats.rx_dropped++;
>  		page_pool_recycle_direct(pool, page);

I'm not sure this is correct. We seem to hardcode headroom to
PRUETH_HEADROOM lower in this function. If XDP adds or removes
network headers and then returns XDP_PASS we'll look for the packet 
at the wrong offset.

We just merged some XDP tests, could you try running 
tools/testing/selftests/drivers/net/xdp.py ? 
Some general instructions can be found here:
https://github.com/linux-netdev/nipa/wiki/Running-driver-tests

Not sure how stable the test is for all NICs but I think the 
 xdp.test_xdp_native_adjst_head_grow_data
test case will exercise what I'm suspecting will fail.

