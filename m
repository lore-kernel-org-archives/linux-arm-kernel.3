Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4922FCA0EFB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 19:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9U1uO8AtQUliXX0wjmgmmKhJ9oQ9SmRtCqujH5RqgQ=; b=insRoxsDMqROOjL/Vw+OjqpaiG
	BMUM716cAtpvs6A2n98FRyigcmK1zduphbUjZUbozCMcWNE2v/OZmSSntIx2hs2kOYIk5eimPW1jA
	WSr5FYmkz2hwptTwVyFUY65Br2GqiD1aC33kNOkGpKcdmX+Rxby7MGi8MylBrN6Li+fDwAlGe96uH
	LrwJMhovBYMh04ZVMsEy9StatjKtqgBo56Vm7K6XUp807fIbYUNf4lAPkrlF/hRCJmTd2+dZAAXpg
	GaPg511l1o9A2R+Js3kR2NniY65TKhMv1UuI5F5cUUyRr+mjXSTieg9B3lAitM6S2JXZJohGG31cS
	pOiigA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRup-0000000BONu-44MP;
	Tue, 19 Aug 2025 19:22:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNRS-0000000AloD-0ZpI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 14:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CEAC61428;
	Tue, 19 Aug 2025 14:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAAFC4CEF1;
	Tue, 19 Aug 2025 14:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755614161;
	bh=BiHe/FguZmNKLQFvQErwkmhZShCmEsuov9mR9CCAK10=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TaO+KUqTMSIodh39ZJ/nPQgGEHgwsyFzbEZITzVRRHFdJkJK4wIirxXwoU5f/8FQv
	 d8Y3m/ELPmUqtK4bLDl+zd56vViPX8vjh1VTrX5aJz4/G8pIZ3tVEU7eMS1PHiTBJG
	 exWybiL3Eh9a1r3RSw6SLJoOlFWlnT4AwvgYWibYapB0qPiaS3L1kJQb6/6NHjT2e0
	 nz5kWH0P8sLmQrwe8zFJASoFkeNpVKcr9BduukCOTNWYgKL49J1xuwIKHSd/OiNVGe
	 ntHEdK6OnQ4AvIbZF8fGt6SWosAGX4WIkxpQ64bc+7gRCD7ZplQ82Nd85ofT02gzPP
	 dRF1C0SzgUveA==
Date: Tue, 19 Aug 2025 07:35:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <namcao@linutronix.de>, <jacob.e.keller@intel.com>,
 <christian.koenig@amd.com>, <sumit.semwal@linaro.org>, <sdf@fomichev.me>,
 <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
 <ast@kernel.org>, <pabeni@redhat.com>, <edumazet@google.com>,
 <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH net-next 5/6] net: ti: icssg-prueth: Add AF_XDP zero
 copy for RX
Message-ID: <20250819073558.2c996b6d@kernel.org>
In-Reply-To: <20250818112424.3068643-6-m-malladi@ti.com>
References: <20250818112424.3068643-1-m-malladi@ti.com>
	<20250818112424.3068643-6-m-malladi@ti.com>
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

On Mon, 18 Aug 2025 16:54:23 +0530 Meghana Malladi wrote:
> @@ -1332,6 +1350,13 @@ static int prueth_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
>  		}
>  	}
>  
> +	if (flags & XDP_WAKEUP_RX) {
> +		if (!napi_if_scheduled_mark_missed(&emac->napi_rx)) {
> +			if (likely(napi_schedule_prep(&emac->napi_rx)))
> +				__napi_schedule(&emac->napi_rx);
> +		}
> +	}
> +
>  	return 0;

I suspect this series is generated against old source or there's
another conflicting series in flight, because git ends up applying
this chunk to prueth_xsk_pool_disable() :S

Before you proceed with AF_XDP could you make this driver build under
COMPILE_TEST on x86? This is very easy to miss, luckily we got an off
list report but its pure luck. And obviously much more effort for the
maintainers to investigate than if it was caught by the CI.
-- 
pw-bot: cr

