Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677EDC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Syf1DUgVsklfoUbcinEl+UlxP/kOThIldFslux1DC8c=; b=cj0kmfej2Mj+iNN/Jvq6o1HwIo
	b4BcXAW7SsRtGKGwf/iBi5X079kX6I7zSO7f0JjiRSZAsQN834KCDbf3f+D5li3l+irj4gYPHzwNT
	pKHmxIh720Kmg5Sfjd8cDazQMnTq0s6nr9dRLaG5pSTLxtRPfDInQL+wvtuWOp0chTiX4mAyzpGKZ
	vybfavHzi65hp9GBvbQ/kZhOmYqvHmDYnETZ0YEXZjO9Ps7B9FMP6IXjbL2FiAv3egQWAKH4w72Ty
	ZjXbMWQfo//3Aunhv8DaUYhOzahDeFBjQkofIlWw6eOen6JiwiuOkcHqWdwQQKOvz1Dffgv7xzIfv
	t0HKKeYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrmO-0000000A6FZ-0rCg;
	Wed, 18 Jun 2025 12:20:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRq2b-00000009n1U-1nNH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9FC85A5250D;
	Wed, 18 Jun 2025 10:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54EC6C4CEE7;
	Wed, 18 Jun 2025 10:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750242552;
	bh=hA1/C70zCQRsqeKpAGRD4HPcwrD8fzW+BRyIETNDT7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=darTD0yqfMgrbx+HnGO21HdmDFDVdmoRh3QrxdE04Ryew6XHIHaiUh6mViTqBnnku
	 XivU09Oo12aZEaTi9ayWPuJbB4AOi8cXTGTSy7WJLVHidGlJfyQhhq73d3pBSojp4z
	 vpBrVB5DtvMd30MRu9GtTmGK9BmmtYHtJt9fJO8+1jq3/wZz+lVCQgbpQIJJEp//yN
	 mN3qAzvtII/PI+89uTaW4yT/8fmvFpJQeTtK9fNHhYoqlvhEjLrDsUF0dmFAlyuaD+
	 S/q92aOCERH9RCQZoWygGS4GVZp/vANpJlSfuhycHlUVzpBNXBrlMhr4xxthY5MWwW
	 Zef7oJXQuICUQ==
Date: Wed, 18 Jun 2025 11:29:07 +0100
From: Simon Horman <horms@kernel.org>
To: Himanshu Mittal <h-mittal1@ti.com>
Cc: pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com,
	m-malladi@ti.com, pratheesh@ti.com, prajith@ti.com
Subject: Re: [PATCH net-next v2] net: ti: icssg-prueth: Add prp offload
 support to ICSSG driver
Message-ID: <20250618102907.GA1699@horms.kernel.org>
References: <20250617101837.381217-1-h-mittal1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617101837.381217-1-h-mittal1@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_032913_531029_C49B9A23 
X-CRM114-Status: GOOD (  12.42  )
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

On Tue, Jun 17, 2025 at 03:48:37PM +0530, Himanshu Mittal wrote:
> Add support for ICSSG PRP mode which supports offloading of:
>  - Packet duplication and PRP trailer insertion
>  - Packet duplicate discard and PRP trailer removal
> 
> Signed-off-by: Himanshu Mittal <h-mittal1@ti.com>
> ---
> v2-v1:
> - Align with recent firmware name handling updates made in:
>  https://lore.kernel.org/all/20250613064547.44394-1-danishanwar@ti.com/
> 
> v1: https://lore.kernel.org/all/42ac0736-cb5a-4d99-a11c-6f861adbdb5f@ti.com/

...

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h

...

> @@ -349,6 +352,7 @@ struct prueth {
>  	struct icssg_firmwares icssg_emac_firmwares[PRUETH_NUM_MACS];
>  	struct icssg_firmwares icssg_switch_firmwares[PRUETH_NUM_MACS];
>  	struct icssg_firmwares icssg_hsr_firmwares[PRUETH_NUM_MACS];
> +	struct icssg_firmwares icssg_prp_firmwares[PRUETH_NUM_MACS];
>  };

Hi Himanshu,

Please also add icssg_prp_firmwares to the Kernel doc for struct preth,
which appears a little above this hunk.

Flagged by ./scripts/kernel-doc -none

Otherwise, this patch looks good to me.

-- 
pw-bot: changes-requested


