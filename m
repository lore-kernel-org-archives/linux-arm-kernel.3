Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903BCC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7M+JZ5+ZYsHqod/I/4Vkiqjo5oKVWRPuFLxlf/Hvols=; b=Ljit44eKoHImHB4DLYeHfxFoBo
	cJrEIZyOVU3R0tG6sWJYHd4elIfIN08kJ2wx4mIDABkW4RFyxY/J/hgVzJ+1wcvK+oqZbUqlf/mZb
	GjjcN1xJ0MubDRClnPETkCmn06EdyZX7xoccq96VlEfue83sM/jKAk3eHh56nft2z6qaZDrKYCJCT
	mhufY9EUBDrv7zKzkSZpW2Gi2uZkVc/Xqnkr29T2zGETRhJFQGALp7i/ge4+heXXh+M2dGeIbp/hZ
	eXK+BCK5eKiaESXIw5Qzm/mHVWUlMQXktoIB8XAt4WJziSjkZwqP07YZPvOSiMc5CJSO9mAeGTilI
	iGUmrQ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBx9-0000000FGrY-2gWt;
	Fri, 27 Jun 2025 16:29:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVB6f-0000000F7cV-0LMh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:35:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 962B644384;
	Fri, 27 Jun 2025 15:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D029CC4CEE3;
	Fri, 27 Jun 2025 15:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751038512;
	bh=OuDqtH329R7jVww3ij8Cd5RT3mO2gDplnHAvTcot2Bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LCelI3cqZer05JQ4Fg0VfAJdtjX0sQV5YUgQoGtTlCMGw89Ma5KRHOU7Nhm4NKgR/
	 3RvmuLakEM1qB7IB7VX/y9roNwVgkEQka3Bwj71JvpkFJpISJ2GwMmQ4TRW1WHsCsp
	 bVhuP/xC2sE9OZU/xAEl5yYo4phTfiJJ0z/B16qSrrJr4G+ya4/IEDvlF6teDgkHoC
	 oocM7pSflCup4jVh5FSkNxAsvL5LkXbGVrVWtP5WhkVATpHVIz03Qn2W5evo/vCFYk
	 oD6WptukPGCThzauTb//WBupI+AdBXrplfuD/ksY+JbQV/cIDwB5QvxOkumB3oerby
	 Q5qUjF8oFRucQ==
Date: Fri, 27 Jun 2025 16:35:06 +0100
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, akpm@linux-foundation.org,
	dianders@chromium.org, sumit.garg@linaro.org, kernelfans@gmail.com,
	lecopzer.chen@mediatek.com, tglx@linutronix.de, song@kernel.org,
	linux-arm-kernel@lists.infradead.org, jonathan.cameron@huawei.com,
	zhanjie9@hisilicon.com, prime.zeng@hisilicon.com,
	yangyicong@hisilicon.com, linuxarm@huawei.com
Subject: Re: [RESEND PATCH v2 1/2] watchdog/perf: Provide function for
 adjusting the event period
Message-ID: <aF66Kk1qhcs9U1Lw@willie-the-truck>
References: <20250619114805.16968-1-yangyicong@huawei.com>
 <20250619114805.16968-2-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619114805.16968-2-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_083513_162945_7D701A97 
X-CRM114-Status: GOOD (  21.30  )
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

On Thu, Jun 19, 2025 at 07:48:04PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Architecture's using perf events for hard lockup detection needs to
> convert the watchdog_thresh to the event's period, some architecture
> for example arm64 perform this conversion using the CPU's maximum
> frequency which will be acquired by cpufreq. However by the time
> the lockup detector's initialized the cpufreq driver may not be
> initialized, thus launch a watchdog with inaccurate period. Provide
> a function hardlockup_detector_perf_adjust_period() to allowing
> adjust the event period. Then architecture can update with more
> accurate period if cpufreq is initialized.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  include/linux/nmi.h    |  2 ++
>  kernel/watchdog_perf.c | 23 +++++++++++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index e78fa535f61d..0a6d8a8d2d5b 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -103,10 +103,12 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs);
>  extern void hardlockup_detector_perf_stop(void);
>  extern void hardlockup_detector_perf_restart(void);
>  extern void hardlockup_config_perf_event(const char *str);
> +extern void hardlockup_detector_perf_adjust_period(int cpu, u64 period);
>  #else
>  static inline void hardlockup_detector_perf_stop(void) { }
>  static inline void hardlockup_detector_perf_restart(void) { }
>  static inline void hardlockup_config_perf_event(const char *str) { }
> +static inline void hardlockup_detector_perf_adjust_period(int cpu, u64 period) { }
>  #endif
>  
>  void watchdog_hardlockup_stop(void);
> diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
> index 75af12ff774e..41c299e63fab 100644
> --- a/kernel/watchdog_perf.c
> +++ b/kernel/watchdog_perf.c
> @@ -186,6 +186,29 @@ void watchdog_hardlockup_disable(unsigned int cpu)
>  	}
>  }
>  
> +/**
> + * hardlockup_detector_perf_adjust_period - Adjust the event period due
> + *                                          to cpu frequency change
> + * @cpu: The CPU whose event period will be adjusted
> + * @period: The target period to be set
> + */
> +void hardlockup_detector_perf_adjust_period(int cpu, u64 period)
> +{
> +	struct perf_event *event = per_cpu(watchdog_ev, cpu);

Given that this is always called in the context of the current CPU (and
has to be to avoid the race you describe in the next patch), why not
drop the 'cpu' argument and use this_cpu_ptr() here instead?

Will

