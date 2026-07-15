Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0DDC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSkZawG7pcsTcJF66DLNdFJcFWhB9tSjWpIVbvD9zzY=; b=k0u8wep0R6aQeCmo3VoPi1PDET
	c+LowtJ9zHJCcCUmPsbiogM2IvN6+InBJsdUAV4U9wROdvFhWM+fx94n/C+JQvwY4/I4ST24PksHM
	P1Bena2y0n5N7lEA507ITIuT6Cq2iARDIuK8PAx+xJCGXXj+xPcS9ln3jJtCJKGzn2bYUgKr+OLsE
	M6Z1vBp9pGuRnu6iE45W0uBIT6NU5CZjJ7EctWejI815BRjEjjjFSU3n782cFW79vlvJ1Qju4MjHt
	Rdppk2CfUDSlMXx9e13L2EOyxANtlgC2B+ST073G/kef0FEHv9ubh3/Hsa2pn5XLb8xMTZdzEmb+h
	CWw5XXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzyu-0000000EzS2-0hkC;
	Wed, 15 Jul 2026 13:49:00 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzyq-0000000EzQl-3coZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:48:59 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47f3e6cc44aso2974518f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 06:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784123335; x=1784728135; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OSkZawG7pcsTcJF66DLNdFJcFWhB9tSjWpIVbvD9zzY=;
        b=BgnFIizlXqCJnDzISO0Ip1PpgXcSRf28s2ftgKN5kxEzYcVlnGqfzKBHhVOEXaGqbD
         Pu06cC9elvtEOIjcHjFgFa4v++o4NPQh2XsGUCnEfMMc1M0FZacgMSRbUYc651T+YZln
         8013eawiKuF4/iYRy5blbhWjmjeiaBdur/RRMn/YUW5hcv/ipgm4eeFQYC5BoueRablV
         yORrIVqOsSz5+r5dU+esuhZoyQlq65jm38Skc6g4J6PzOkVcXm2dP8uzlUJHZPgV/BIH
         IDGxSZ+PWxHnr+ByToXv4f11/UbMax+NRIOwCRUyY4BdCVPV8Tt8BZk5nFRZ0GZDyN+i
         wRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123335; x=1784728135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSkZawG7pcsTcJF66DLNdFJcFWhB9tSjWpIVbvD9zzY=;
        b=QYplNFquq3nc7jouCzNawFJ7pmHQIR0ukkZbGZt7FtvfjVcT4f938+ykO4MGVjaMGL
         hjkkSgSRiLmpnRVPoRwHxi3JIB7TOB6sFgV0r7BG9dfs4KXEZ20fv7NzYQwGe1j7kldn
         yF7w4q38smMkJ6+SojX5ASz8LD5SnJsc3iTzdYrC/t7V3yx817PdgX2yQfpm0GccW1y/
         88a3d0LjZn3htkqMH/A8Z1eqZFLFfpEsLtRHYnrfBmuBBjlUol4Xgd12KKd/8V2usxHg
         goECLSF/uhKx/vqMa1ZLDXPF9sq/gKWiRF9M7gvb6xs1Jyu5LAV8X8hOuSkQEdzB9x7g
         E+TA==
X-Gm-Message-State: AOJu0YxIJwHykn6b3rxNHpOBeCOkEJ7l12/qTzlnn9SUefhH8+w0y7aq
	HbAOM2atBs1hKwOQUYL7OnuTd9lR5CioG6b3pJoufi/UrsanedNklz04afTWqM6CbA==
X-Gm-Gg: AfdE7cmivgo4lq7hF0y8c2Q8MmM9vA5cKYGaNvQ8vU5ffJgWb77gOkg2c7vswlXJBQ1
	6czd2pPLPcdgh0Ily0Vwkqof02tbf8sN2rdWou9YQMG1bFxDpJiE12zvPsG6caf62AAkBYe/sUk
	MNyGxrV37QOoyLxFFKpQ4Qct2CibPadghZQWjYJuGXpMT6IZNouMOsGS/lO+KSow+j/4MmOTSnc
	W7Qd2+JQDAgRcCM2I5/g7LBwp8JTMGAwMuMPbtntDVm6Zyj7hoPj9x5BOi+IQR9BxW8sSt92xfD
	tcYZBB6lFMVoFqSeE3v1ZHbKwBZTPWUsmMNHzgNef9LitN/HO3LzXiJKXuHrZ8RxNQmEeIeL0DY
	387pk+NmxJuCRCKVujnxqxduh8LXSq9qLlVz0ribYeJkqYpu7N5YJ8WnOQsLeIYe4qUVr0Wjgw4
	+8eOxqVV7eMHLWQ+pjn34l/+kIluJVl8YnHIxeGlQrMv0mZoUHm6c=
X-Received: by 2002:a05:6000:491a:b0:473:24e3:fa8f with SMTP id ffacd0b85a97d-47f488a7656mr7712739f8f.47.1784123334603;
        Wed, 15 Jul 2026 06:48:54 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f476e9d02sm16837588f8f.19.2026.07.15.06.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:48:53 -0700 (PDT)
Date: Wed, 15 Jul 2026 14:48:50 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v7 01/24] KVM: arm64: Add a generic clock
Message-ID: <alePwq2eKV5g_7Gc@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715115906.2664882-2-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_064856_934723_B24800CC 
X-CRM114-Status: GOOD (  20.63  )
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

[...]

> diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/clock.c
> index f3e2619db4e4..43d2cba4f810 100644
> --- a/arch/arm64/kvm/hyp/nvhe/clock.c
> +++ b/arch/arm64/kvm/hyp/nvhe/clock.c
> @@ -8,7 +8,12 @@
>  
>  #include <asm/arch_timer.h>
>  #include <asm/div64.h>
> +#include <linux/math64.h>
> +#include <vdso/time64.h>
>  
> +static u32 timer_freq;
> +
> +#ifdef CONFIG_NVHE_EL2_TRACING
>  static struct clock_data {
>  	struct {
>  		u32 mult;
> @@ -66,3 +71,27 @@ u64 trace_hyp_clock(void)
>  
>  	return (u64)ns + clock->data[bank].epoch_ns;
>  }
> +#endif /* CONFIG_NVHE_EL2_TRACING */
> +
> +int hyp_clock_init(void)
> +{
> +	timer_freq = read_sysreg(cntfrq_el0);
> +	/*
> +	 * KVM will not initialize if FW didn't set cntfrq_el0, that is already
> +	 * part of the boot protocol.
> +	 */
> +	if (!timer_freq)
> +		return -ENODEV;
> +
> +	/* Timer freq can't be larger than 1Ghz by spec. */
> +	if (timer_freq > NSEC_PER_SEC)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +/* Return time in ns. */
> +u64 hyp_clock_ns(void)
> +{
> +	return mul_u64_u32_div(__arch_counter_get_cntvct(), NSEC_PER_SEC, timer_freq);

IIUC, this will overflow the u64 mult very quickly (in few minutes) and also I
see that we don't need such small nanoseconds accuracy.

So here we could always fallback to 128-bits mult... or update the epoch from
time to time. But I have something completely different to propose:

Instead of using a "clock" how about we just modify smmu_wait?

#define smmu_wait() {
    static u32 window = arch_timer_get_cntfrq() / ARM_SMMU_EL2_POLL_TIMEOUT_US
    u64 timeout = __arch_counter_get_cntvct() + window;
    u64 cur;

    ...

    while (!(__cond)) {
      ...

      cur = __arch_counter_get_cntvct();
      if (cur >= timeout)
          __ret = -ETIMEOUT;


No risk of overflowing u64
No init necessary


> +}
> diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> index 75b00c323310..970c5cf342f5 100644
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
> @@ -320,6 +321,10 @@ void __noreturn __pkvm_init_finalise(void)
>  	if (ret)
>  		goto out;
>  
> +	ret = hyp_clock_init();
> +	if (ret)
> +		goto out;
> +
>  	ret = fix_host_ownership();
>  	if (ret)
>  		goto out;
> -- 
> 2.55.0.141.g00534a21ce-goog
> 

