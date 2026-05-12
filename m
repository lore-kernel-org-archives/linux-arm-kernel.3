Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0050DCD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zneASltas0oMQlIELljv5Hk5HU3jIgnWrTTwatdNdKk=; b=P2YBEWqALgN/inj1L68d0cZiPM
	5VDo4KqkXjVtmDZG3WzCHgo8n7nalifhruhgr4+gXwtFJgx9RnfSY2yka0iQ/GraFdYmuGlX+VCNx
	wmurb+tR/mqLtrQQwjVM49ius/bB/USUQgiOMUyFusEV19fNqmgLKBe2ofEQHh2w2sGTDJ/aaGL53
	IFZ5kBP9o7AmzSmRR2Q+mkU0TK0BruTJ04nI2N4dVLym4yTb2lKTGWX6IKgCAzSW7tBZf1PG9tIn6
	RKJf6iCWICrkk6keYlOKhITUTc6m58c6Am/4f1Rk8EbLzyUBKJJM418DDaQpGFxKcFJccCh56rA34
	KBRa2iEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhdi-0000000FwJg-28cz;
	Tue, 12 May 2026 07:34:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhdg-0000000FwJ9-2GG2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 07:34:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4D2944071;
	Tue, 12 May 2026 07:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E27BC2BCB0;
	Tue, 12 May 2026 07:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778571287;
	bh=T/Fjk+Ia8FeTP20elfFPSEy0lY7bZ7cUA3AKIwU37ZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b41QgKN8/pvSDbgptQLL7kDNut1BOUGA+W90IztVp/QJIz4DmjpHViUqgm/gWcQBz
	 /9/D2QNqr9SK4X+RbqudiJWkDEEVS9L3KwnOM4JC44SXAvdIFvUj7OSxK3CGgaRwDJ
	 nXTiq364Pe3yj5QXmN28eoof2LFc4DHIM8kFeMD02s2BfGrXaGWt1cshwD77t1G/07
	 MpzPeeblgO2xG2d5a+l0zl/boS90vAeUnnrnrfx4V7Zp1J8MfLyy+lzezR/GiLquHm
	 3en05WEMaCYfwHxwequ5zjGWKhCJV9dTxl6TKSXAnKpavL/VP33QA7T4GVZiKypF+D
	 +HPwrkBZaQQeg==
Date: Tue, 12 May 2026 16:34:42 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP2+: Make OMAP4 finish_suspend callback CFI-safe
Message-ID: <20260512073442.GA570003@ax162>
References: <20260512042341.1452-1-bavishimithil@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512042341.1452-1-bavishimithil@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_003448_598418_6BF5AA24 
X-CRM114-Status: GOOD (  22.23  )
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

On Tue, May 12, 2026 at 12:23:41AM -0400, Mithil Bavishi wrote:
> With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
> because omap_pm_ops.finish_suspend points directly to the assembly
> routine omap4_finish_suspend, which lacks the expected KCFI type
> metadata.

It sounds like omap4_finish_suspend() should be defined with
SYM_TYPED_FUNC_START then? Is that the case for all of the other
functions that are added to omap_pm_ops?

> Add a small C wrapper with the exact callback prototype and use it for
> finish_suspend.
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---
>  arch/arm/mach-omap2/omap-mpuss-lowpower.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap2/omap-mpuss-lowpower.c b/arch/arm/mach-omap2/omap-mpuss-lowpower.c
> index f18ef45e2..1c51b2f97 100644
> --- a/arch/arm/mach-omap2/omap-mpuss-lowpower.c
> +++ b/arch/arm/mach-omap2/omap-mpuss-lowpower.c
> @@ -111,6 +111,11 @@ static struct cpu_pm_ops omap_pm_ops = {
>  	.hotplug_restart	= dummy_cpu_resume,
>  };
>  
> +static int omap4_finish_suspend_wrapper(unsigned long cpu_state)
> +{
> +	return omap4_finish_suspend(cpu_state);
> +}
> +
>  /*
>   * Program the wakeup routine address for the CPU0 and CPU1
>   * used for OFF or DORMANT wakeup.
> @@ -437,7 +442,7 @@ int __init omap4_mpuss_init(void)
>  	}
>  
>  	if (cpu_is_omap44xx()) {
> -		omap_pm_ops.finish_suspend = omap4_finish_suspend;
> +		omap_pm_ops.finish_suspend = omap4_finish_suspend_wrapper;
>  		omap_pm_ops.resume = omap4_cpu_resume;
>  		omap_pm_ops.scu_prepare = scu_pwrst_prepare;
>  		omap_pm_ops.hotplug_restart = omap4_secondary_startup;
> -- 
> 2.43.0
> 

-- 
Cheers,
Nathan

