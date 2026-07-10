Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A661C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ld/XzT4yLi3Bj0NOD+nEBxEpkiiGab87Y26X7/8DxIM=; b=cJV6ZOS5y3Om1KyxP9+Ap2MqZV
	Ak27UA+CjzXexxjqprUR9ERL6vbs2vYKwPXlNsY5GyWX4ykWApzQh/6HjgQnlBILypcibzWEGSfoB
	PKNfv5obkYwlC6ZITZrWwZGJcY3+Zh6CDEfr8B8OpByFmidq51xiwUmlGq1MDbkawaLXDt8MjQS3/
	FZAKfelJMgqC7dr3r6JZ6Fj2N+LSrMnnXX3/3x/VgNFsQvj0yFwm4FgAJPOO6Ro9Kin/Ce2LULtCc
	jfZj6TEMnBUFtDsaszs3SFgrpDT5Hz6EzQGAU0swSjn0TcoKcMfgRzpdf3HNSWheLfZVZT0kATouj
	/GF89Aew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiC5D-000000054TD-3wux;
	Fri, 10 Jul 2026 14:20:03 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiC5B-000000054SP-1GfM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:20:02 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so7178145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783693198; x=1784297998; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ld/XzT4yLi3Bj0NOD+nEBxEpkiiGab87Y26X7/8DxIM=;
        b=Cu1Vbl8hE4byZDgc9lwd7ZQuYi6KVvjgZNkw9mZMRtCuRnyb2G2OElAihzPIZXnIJ4
         B3GNEvR1TdBbEOb/xuy74wJ54v24vAfEUCAfLxw+hOSe6j8FZQVeeNMZCujaNWdJDOs8
         RNCovZY4CCfr1CBvNoBkzdidbEL8/gTw64FG5QLBVpo58HoDWh7i4l5EgmmS4pisvtI9
         Z57vTXvnUWqHNzUaOz/ITvOI5KTnROo8cPbr+cj9ZaVkGfzDg32mSAlWDu+gMwk2pk6t
         CxZYgjCU9LOGKT9BIHsvRHwjxmGSEifrrAAaS1HgJlc+OKR2erkZauPHDIXR/+JY9NzK
         zxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783693198; x=1784297998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ld/XzT4yLi3Bj0NOD+nEBxEpkiiGab87Y26X7/8DxIM=;
        b=OA/Z5q0hnAVf0BpBUZ9FzR1Lk7WHC7dgbq25iyS+nI7HJpOTFt0R1TiPd/Phst76Tv
         pnTAEZckmbIC2qk5mi5aQaOMThKJH8dcsaWmoyBLYaRBZ7AmRuszUjiYv+wSQmyPqeFF
         lM+ke8vkZUwLbmx7uclZnuKUQpJ+wrGW/W+5y3qn2Wk47zXPVpIQ2ZBkHQmWMFkSwL11
         pO+eUN2I3ZCrMsLmnA0Vo//MkeCJmbAXa+PH0jD1NJWtIOW6JgkwwdDVUR9FiNPM9XDB
         oOoHBdKOgLQkzRbVGUlh3Itt6tpcFKVwEJL/WdD0f9MBf0o4ajyO0Ii4omNfPrlSo5D5
         m06w==
X-Gm-Message-State: AOJu0YwcZl8oPj+oWtf/pG6DTK9Yk0pviTdnT8NqiUpYhI4Jo5+55UGb
	juvJl8IfQ0O11dUsa8FvEtET71VVBxhydE8eJQQ/343AUtUK5JY1PrxEdJeDC71Fr80UIwytNyO
	6iQNwvg==
X-Gm-Gg: AfdE7ckt63U0jYkKgUeh0A+KppLXObkG5Vg7t3GwMUGaySzR1z17mxintiPUAdTqlS+
	Rqf4tq0lmh+cJj91t7ohAnOZVCUUWYfyevYyDf/ZynF62BXIrtMGY/vNazw1Bkug6Ps74ncDmGx
	pDGvIOxjO6xWhxd+iZO9bvw4izrbyiHveTHuFNfeAdMNgP96mXHVLonLjRqoK+GAkiSE1PbO1F9
	kKma65J1JGBUzRVCSJCdiUimCQ8um+MR4RiH8urO1JC9wIoQy4saciukdXI9lyWqqsp3obi/fK6
	bar86mGRIeXMuJ1F979cAGIinKIA59eawJlp+WWN8k9Cc0Bn1ij/le2Eo1Rp2SO3AQ5Md6vaWWe
	sab0DLxl/9CVj032V4XXRbSRg56UAAeKexieEGEpUxmotHa6T4WvL210NkrIOXb4mxgkeP9FojD
	muJL8jL/4+8xU+2eDXVyx0oR0t8LYgJRq3c+0pnPE/EW+iX/kiNrY=
X-Received: by 2002:a05:600c:8119:b0:493:ee34:d875 with SMTP id 5b1f17b1804b1-493f2b3369fmr37932565e9.10.1783693197951;
        Fri, 10 Jul 2026 07:19:57 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ccdbbsm147470855e9.3.2026.07.10.07.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 07:19:55 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:19:51 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 01/25] KVM: arm64: Generalize trace clock
Message-ID: <alD_hwRhUZ0IPTte@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501111928.259252-2-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_072001_411718_BD081D0C 
X-CRM114-Status: GOOD (  40.68  )
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

Hi Mostafa,

Sorry I should have looked at this a while ago!

On Fri, May 01, 2026 at 11:19:03AM +0000, Mostafa Saleh wrote:
> IOMMU drivers need to track time, mainly for timeouts.
> Generalize the tracing clock functions in the hypervsior, so they can
> be used from IOMMU drivers.
> 
> 1) Make the compilation independent from tracing.
> 
> 2) As drivers might need to use that quite early, provide default
>    values for the clock data based on cntfrq_el0, the driver can
>    keep using these values without calling hyp_clock_update() as
>    they don't need to sync with the host timers.
> 
> This is mainly used for timeouts, so a malicious host can DoS the
> system or cause premature timeouts which likely end up in hyp panic,
> that should be acceptable as neither of those would undermine the
> security guarantees.

This still sounds very risky if the usage shift, and as I explain later I don't
believe this is completely OK as regard to mult/shift updates.

> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/clock.h | 11 ++-----
>  arch/arm64/kvm/hyp/nvhe/Makefile        |  4 +--
>  arch/arm64/kvm/hyp/nvhe/clock.c         | 44 ++++++++++++++++++++++---
>  arch/arm64/kvm/hyp/nvhe/setup.c         |  5 +++
>  arch/arm64/kvm/hyp/nvhe/trace.c         |  4 +--
>  5 files changed, 51 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> index 9f429f5c0664..e6a0e43af88d 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/clock.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> @@ -5,12 +5,7 @@
>  
>  #include <asm/kvm_hyp.h>
>  
> -#ifdef CONFIG_NVHE_EL2_TRACING
> -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> -u64 trace_clock(void);
> -#else
> -static inline void
> -trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
> -static inline u64 trace_clock(void) { return 0; }
> -#endif
> +void hyp_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> +u64 hyp_clock_ns(void);
> +int hyp_clock_init(void);
>  #endif
> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> index 62cdfbff7562..89d0533921f9 100644
> --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> @@ -26,10 +26,10 @@ hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o
>  	 hyp-main.o hyp-smp.o psci-relay.o early_alloc.o page_alloc.o \
>  	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
>  hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
> -	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o ../vgic-v5-sr.o
> +	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o ../vgic-v5-sr.o clock.o
>  hyp-obj-y += ../../../kernel/smccc-call.o
>  hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
> -hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += clock.o trace.o events.o
> +hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += trace.o events.o
>  hyp-obj-y += $(lib-objs)
>  
>  # Path to simple_ring_buffer.c
> diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/clock.c
> index 32fc4313fe43..53d0bd55e866 100644
> --- a/arch/arm64/kvm/hyp/nvhe/clock.c
> +++ b/arch/arm64/kvm/hyp/nvhe/clock.c
> @@ -18,7 +18,41 @@ static struct clock_data {
>  		u64 cyc_overflow64;
>  	} data[2];
>  	u64 cur;
> -} trace_clock_data;
> +} clock_data;

I believe this should be separated. the trace_clock is "unsafe" but synchronised
with the host. the clock you need must be "safe" but we don't really need to be
synchronised. 

So overall, I would keep all the trace_clock_* interface unchanged and introduce
in the same file a hyp_clock, with its own hyp_clock_data.

> +
> +#define HYP_CLK_SEC_TO_NS 1000000000UL

Not possible to use NSEC_PER_SEC?

> +
> +int hyp_clock_init(void)
> +{
> +	u32 timer_freq = read_sysreg(cntfrq_el0);
> +	u32 shift = 32;
> +	u64 mult;
> +
> +	/*
> +	 * KVM will not initialize if FW didn't set cntfrq_el0, that is already
> +	 * part of the boot protocol.
> +	 */
> +	if (!timer_freq)
> +		return -ENODEV;
> +
> +	/* Timer freq can't be larger than 1Ghz by spec. */
> +	if (timer_freq > HYP_CLK_SEC_TO_NS)
> +		return -EINVAL;
> +
> +	/* Simplified logic from clocks_calc_mult_shift() */
> +	do {
> +		mult = (HYP_CLK_SEC_TO_NS << shift);
> +		mult = div_u64(mult, timer_freq);
> +		if (mult <= (~0U))
> +			break;
> +		shift--;
> +	} while (shift > 0);
> +
> +	clock_data.data[0].shift = shift;
> +	clock_data.data[0].mult = mult;
> +	clock_data.data[0].cyc_overflow64 = ULONG_MAX / mult;

I don't know if we want to update this from time to time, but we can't rely on
host provided data. Perhaps the call to that clock could self-update?

Worst case we fallback on 128-bits mult. but perhaps this isn't a problem for a
wait loop()?

And as this is wait loop, perhaps we could reduce the resolution quite heavily,
so we reduce the risk of overflow?

> +	return 0;
> +}
>  
>  static u64 __clock_mult_uint128(u64 cyc, u32 mult, u32 shift)
>  {
> @@ -30,9 +64,9 @@ static u64 __clock_mult_uint128(u64 cyc, u32 mult, u32 shift)
>  }
>  
>  /* Does not guarantee no reader on the modified bank. */

 ^
And here's another reason why you should have another clock. It works because of
tricks in the tracing interface.

> -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
> +void hyp_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
>  {
> -	struct clock_data *clock = &trace_clock_data;
> +	struct clock_data *clock = &clock_data;
>  	u64 bank = clock->cur ^ 1;
>  
>  	clock->data[bank].mult			= mult;
> @@ -45,9 +79,9 @@ void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
>  }
>  
>  /* Use untrusted host data */
> -u64 trace_clock(void)
> +u64 hyp_clock_ns(void)
>  {
> -	struct clock_data *clock = &trace_clock_data;
> +	struct clock_data *clock = &clock_data;
>  	u64 bank = smp_load_acquire(&clock->cur);

The whole bank system is not necessary if not updated by the host.

>  	u64 cyc, ns;
>  
> diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> index d8e5b563fd3d..8041f6e80cd1 100644
> --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> @@ -10,6 +10,7 @@
>  #include <asm/kvm_pgtable.h>
>  #include <asm/kvm_pkvm.h>
>  
> +#include <nvhe/clock.h>
>  #include <nvhe/early_alloc.h>
>  #include <nvhe/ffa.h>
>  #include <nvhe/gfp.h>
> @@ -312,6 +313,10 @@ void __noreturn __pkvm_init_finalise(void)
>  	};
>  	pkvm_pgtable.mm_ops = &pkvm_pgtable_mm_ops;
>  
> +	ret = hyp_clock_init();
> +	if (ret)
> +		goto out;
> +
>  	ret = fix_host_ownership();
>  	if (ret)
>  		goto out;
> diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
> index a6ca27b18e15..e30de840e6c2 100644
> --- a/arch/arm64/kvm/hyp/nvhe/trace.c
> +++ b/arch/arm64/kvm/hyp/nvhe/trace.c
> @@ -35,7 +35,7 @@ static bool hyp_trace_buffer_loaded(struct hyp_trace_buffer *trace_buffer)
>  void *tracing_reserve_entry(unsigned long length)
>  {
>  	return simple_ring_buffer_reserve(this_cpu_ptr(trace_buffer.simple_rbs), length,
> -					  trace_clock());
> +					  hyp_clock_ns());
>  }
>  
>  void tracing_commit_entry(void)
> @@ -285,7 +285,7 @@ void __tracing_update_clock(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
>  	}
>  
>  	/* ...we can now override the old one and swap. */
> -	trace_clock_update(mult, shift, epoch_ns, epoch_cyc);
> +	hyp_clock_update(mult, shift, epoch_ns, epoch_cyc);
>  }
>  
>  int __tracing_reset(unsigned int cpu)
> -- 
> 2.54.0.545.g6539524ca2-goog
> 

