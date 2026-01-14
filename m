Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116ABD31A36
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 09:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kap4gu0a51WoqK/VPbkwUanlik+X2vGOaSYLGv2cqSA=; b=47/5Kujt12tE5DpxE1kRRi0MLk
	NYyBs59h3TzLHtjejq+Sraf+5VkrlOW+CPEJQrVKrFa1rYK53cZpbA+uisKwcFDvCEp8r+e3l8wPl
	EOPaOpB4z/UI2B1mRqCpqq2HJhM960oZfuzGGqjWypIMQpoWv8yCYdeWMYqmVZorVUBHsIA6nRYdE
	Kc7RjVk4r84TCGb4sdPArdfSFNCl4YX6ILAS8Gc1YARijKNmZWtN14CdVa9PMe9alNaPuOVFbjmhk
	tjxxrLrnxLU14ufM8Bq2r/G90ux4XvPFGROBosiTUcEbAS0oVB3Mig1csPISdXawSeVv8ZUPqWn6c
	ucmeNAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxAR-00000008Y5l-45Aw;
	Wed, 14 Jan 2026 09:27:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxAP-00000008Y2X-0xCf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 09:27:54 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42fbc305552so6292792f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 01:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768382870; x=1768987670; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kap4gu0a51WoqK/VPbkwUanlik+X2vGOaSYLGv2cqSA=;
        b=Udhqv5EW+zJVllVJwdROkkQEd7a/nnLCPmJxZ44yamaUGjgxp0FoR0prAuUQ+gBFn6
         Xq7+VBQ+rIZK8ft2dT+4l+gxeHal1kjgkI+h3L/77KwblH6oEQAHysmz7DvRBZFeoHRH
         +ARGzYqRcxWm+67T83wXRhkgTerGIUzcFhJd3g+CG/fj7NYzkLUP0nM7d6esWGWAHOZ1
         T/FTlG/8WxGGYxJX/8Gpqp66e1oTbPyX2cZVwWapAmktQcARt69oMf2+x8aTbf3yOTU4
         bYiI50JMYTzffuM3XR0ellRoAezeS+avijySr7Pf2NKHHXKm2j1NtaRIwNjuIRlfVFpM
         Gubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768382870; x=1768987670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kap4gu0a51WoqK/VPbkwUanlik+X2vGOaSYLGv2cqSA=;
        b=Lty07/blhnLMIRcRCHVvOVnag6zNlPGvI7nAZehW5m+bcKlZoIGpZAqMYSR+/BwG0i
         GAhCtfJbNMJdxAAQYgppioeGTsfKKBg0qk0P+OljzuZzJLhUJOunDC28V2lWXqCqEBTH
         /7pB2JmhRjpv7uyLXlS1yLx+gPGiupDdhwc9kMh9OjkLuk/51beYa6FUKbp+YVdS8JV5
         KOESTs/3mhwOnjwo1AI7BAswXb8Un5jjhm73EZIjT1Ja1nwoNe+7DL9kOjjXWTzJiaz+
         Ps0hfrGSqQnwzTanld1wPYjE/jL3T/fO8r+E1lxRY+RUJbISScE/rdrV/auHM1ZXUn/k
         3Pbg==
X-Forwarded-Encrypted: i=1; AJvYcCUYsEzhw+M5A1Ga3lo6foY6otYAn19VRxkdnkEZEPMBb9e2BK6xlCY/qIMMajbnvKiimz+OF/r6Sm8mmq9HO8LF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx8pfaP/dXmG6ybFkXVpM+FqbszAAMcp0VMzf5WvMipV+LMk3Y
	7QuudYNUvKUkD346qRbLT76d6tomgUseZ4sVjH2R1KCsf5YV6CkV/yZyqWzPuU9hOw==
X-Gm-Gg: AY/fxX4IGKmVl/dP1yP/Rv1+wFgJXR9PRba1D62Kr+u2xXo0TMAVDAXp1572MWEnEEA
	tGvCurAZwgPTtodbbjuP51Sfzgct2jKblYgSpY6zeCTzVRx86FpO8xArZXFXTx37urYmuB+NmQS
	TjRI/3MPffvQnV00Bwm5iuWojK53WK0UDarZ/8adJGFQQYj96VX7vv4OTN7jEQ0E6zoNXzlK5Iy
	nqvUXf5j4spup6efWxxChx17xfY6KK2QxxOAO494gHq0bat61Cvhh6PlKGyDo5O8VF7CDW5amcQ
	S5zM6kzbL5XctssyI9+R7gCUrEymgZCg1ktIahCe1nYjyDcW7BxQI+CG5Cg3uSqoyKrOYRytTP+
	7Q+o8B8ZZU3G7yANskeB9a0LqdqWIaucxcuY9jFiq1bycYV/fJ+dYGZHyY/yIiN51vrhuNJXYEp
	DxW0VYVGnwMx5zbDIOm3LQzP7JiWHk+U/VYCKnwYVCnyXO1Pta+w==
X-Received: by 2002:a05:6000:2011:b0:431:4c6:724d with SMTP id ffacd0b85a97d-4342c5487f2mr2035382f8f.29.1768382870113;
        Wed, 14 Jan 2026 01:27:50 -0800 (PST)
Received: from google.com (44.145.34.34.bc.googleusercontent.com. [34.34.145.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df96asm48157294f8f.28.2026.01.14.01.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 01:27:49 -0800 (PST)
Date: Wed, 14 Jan 2026 09:27:46 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Petteri Kangaslampi <pekangas@google.com>
Cc: kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] KVM: arm64: Calculate hyp VA size only once
Message-ID: <aWdhkpXRLEek7AnL@google.com>
References: <20260113194409.2970324-1-pekangas@google.com>
 <20260113194409.2970324-2-pekangas@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113194409.2970324-2-pekangas@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012753_329641_8CF9D44E 
X-CRM114-Status: GOOD (  34.72  )
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

On Tue, Jan 13, 2026 at 07:44:09PM +0000, Petteri Kangaslampi wrote:
> Calculate the hypervisor's VA size only once to maintain consistency
> between the memory layout and MMU initialization logic. Previously the
> two would be inconsistent when the kernel is configured for less than
> IDMAP_VA_BITS of VA space.
> 
> Signed-off-by: Petteri Kangaslampi <pekangas@google.com>

Tested-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/include/asm/kvm_mmu.h |  3 ++-
>  arch/arm64/kvm/arm.c             |  4 ++--
>  arch/arm64/kvm/mmu.c             | 28 ++++-----------------------
>  arch/arm64/kvm/va_layout.c       | 33 +++++++++++++++++++++++++++-----
>  4 files changed, 36 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
> index 2dc5e6e742bb..d968aca0461a 100644
> --- a/arch/arm64/include/asm/kvm_mmu.h
> +++ b/arch/arm64/include/asm/kvm_mmu.h
> @@ -103,6 +103,7 @@ alternative_cb_end
>  void kvm_update_va_mask(struct alt_instr *alt,
>  			__le32 *origptr, __le32 *updptr, int nr_inst);
>  void kvm_compute_layout(void);
> +u32 kvm_hyp_va_bits(void);
>  void kvm_apply_hyp_relocations(void);
>  
>  #define __hyp_pa(x) (((phys_addr_t)(x)) + hyp_physvirt_offset)
> @@ -185,7 +186,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu);
>  
>  phys_addr_t kvm_mmu_get_httbr(void);
>  phys_addr_t kvm_get_idmap_vector(void);
> -int __init kvm_mmu_init(u32 *hyp_va_bits);
> +int __init kvm_mmu_init(u32 hyp_va_bits);
>  
>  static inline void *__kvm_vector_slot2addr(void *base,
>  					   enum arm64_hyp_spectre_vector slot)
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 4f80da0c0d1d..4703f0e15102 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -2568,7 +2568,7 @@ static void pkvm_hyp_init_ptrauth(void)
>  /* Inits Hyp-mode on all online CPUs */
>  static int __init init_hyp_mode(void)
>  {
> -	u32 hyp_va_bits;
> +	u32 hyp_va_bits = kvm_hyp_va_bits();
>  	int cpu;
>  	int err = -ENOMEM;
>  
> @@ -2582,7 +2582,7 @@ static int __init init_hyp_mode(void)
>  	/*
>  	 * Allocate Hyp PGD and setup Hyp identity mapping
>  	 */
> -	err = kvm_mmu_init(&hyp_va_bits);
> +	err = kvm_mmu_init(hyp_va_bits);
>  	if (err)
>  		goto out_err;
>  
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 48d7c372a4cd..d5a506c99f73 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2284,11 +2284,9 @@ static struct kvm_pgtable_mm_ops kvm_hyp_mm_ops = {
>  	.virt_to_phys		= kvm_host_pa,
>  };
>  
> -int __init kvm_mmu_init(u32 *hyp_va_bits)
> +int __init kvm_mmu_init(u32 hyp_va_bits)
>  {
>  	int err;
> -	u32 idmap_bits;
> -	u32 kernel_bits;
>  
>  	hyp_idmap_start = __pa_symbol(__hyp_idmap_text_start);
>  	hyp_idmap_start = ALIGN_DOWN(hyp_idmap_start, PAGE_SIZE);
> @@ -2302,25 +2300,7 @@ int __init kvm_mmu_init(u32 *hyp_va_bits)
>  	 */
>  	BUG_ON((hyp_idmap_start ^ (hyp_idmap_end - 1)) & PAGE_MASK);
>  
> -	/*
> -	 * The ID map is always configured for 48 bits of translation, which
> -	 * may be fewer than the number of VA bits used by the regular kernel
> -	 * stage 1, when VA_BITS=52.
> -	 *
> -	 * At EL2, there is only one TTBR register, and we can't switch between
> -	 * translation tables *and* update TCR_EL2.T0SZ at the same time. Bottom
> -	 * line: we need to use the extended range with *both* our translation
> -	 * tables.
> -	 *
> -	 * So use the maximum of the idmap VA bits and the regular kernel stage
> -	 * 1 VA bits to assure that the hypervisor can both ID map its code page
> -	 * and map any kernel memory.
> -	 */
> -	idmap_bits = IDMAP_VA_BITS;
> -	kernel_bits = vabits_actual;
> -	*hyp_va_bits = max(idmap_bits, kernel_bits);
> -
> -	kvm_debug("Using %u-bit virtual addresses at EL2\n", *hyp_va_bits);
> +	kvm_debug("Using %u-bit virtual addresses at EL2\n", hyp_va_bits);
>  	kvm_debug("IDMAP page: %lx\n", hyp_idmap_start);
>  	kvm_debug("HYP VA range: %lx:%lx\n",
>  		  kern_hyp_va(PAGE_OFFSET),
> @@ -2345,7 +2325,7 @@ int __init kvm_mmu_init(u32 *hyp_va_bits)
>  		goto out;
>  	}
>  
> -	err = kvm_pgtable_hyp_init(hyp_pgtable, *hyp_va_bits, &kvm_hyp_mm_ops);
> +	err = kvm_pgtable_hyp_init(hyp_pgtable, hyp_va_bits, &kvm_hyp_mm_ops);
>  	if (err)
>  		goto out_free_pgtable;
>  
> @@ -2354,7 +2334,7 @@ int __init kvm_mmu_init(u32 *hyp_va_bits)
>  		goto out_destroy_pgtable;
>  
>  	io_map_base = hyp_idmap_start;
> -	__hyp_va_bits = *hyp_va_bits;
> +	__hyp_va_bits = hyp_va_bits;
>  	return 0;
>  
>  out_destroy_pgtable:
> diff --git a/arch/arm64/kvm/va_layout.c b/arch/arm64/kvm/va_layout.c
> index 91b22a014610..2346f9435a71 100644
> --- a/arch/arm64/kvm/va_layout.c
> +++ b/arch/arm64/kvm/va_layout.c
> @@ -46,9 +46,31 @@ static void init_hyp_physvirt_offset(void)
>  	hyp_physvirt_offset = (s64)__pa(kern_va) - (s64)hyp_va;
>  }
>  
> +/*
> + * Calculate the actual VA size used by the hypervisor
> + */
> +__init u32 kvm_hyp_va_bits(void)
> +{
> +	/*
> +	 * The ID map is always configured for 48 bits of translation, which may
> +	 * be different from the number of VA bits used by the regular kernel
> +	 * stage 1.
> +	 *
> +	 * At EL2, there is only one TTBR register, and we can't switch between
> +	 * translation tables *and* update TCR_EL2.T0SZ at the same time. Bottom
> +	 * line: we need to use the extended range with *both* our translation
> +	 * tables.
> +	 *
> +	 * So use the maximum of the idmap VA bits and the regular kernel stage
> +	 * 1 VA bits as the hypervisor VA size to assure that the hypervisor can
> +	 * both ID map its code page and map any kernel memory.
> +	 */
> +	return max(IDMAP_VA_BITS, vabits_actual);
> +}
> +
>  /*
>   * We want to generate a hyp VA with the following format (with V ==
> - * vabits_actual):
> + * hypervisor VA bits):
>   *
>   *  63 ... V |     V-1    | V-2 .. tag_lsb | tag_lsb - 1 .. 0
>   *  ---------------------------------------------------------
> @@ -61,10 +83,11 @@ __init void kvm_compute_layout(void)
>  {
>  	phys_addr_t idmap_addr = __pa_symbol(__hyp_idmap_text_start);
>  	u64 hyp_va_msb;
> +	u32 hyp_va_bits = kvm_hyp_va_bits();
>  
>  	/* Where is my RAM region? */
> -	hyp_va_msb  = idmap_addr & BIT(vabits_actual - 1);
> -	hyp_va_msb ^= BIT(vabits_actual - 1);
> +	hyp_va_msb  = idmap_addr & BIT(hyp_va_bits - 1);
> +	hyp_va_msb ^= BIT(hyp_va_bits - 1);
>  
>  	tag_lsb = fls64((u64)phys_to_virt(memblock_start_of_DRAM()) ^
>  			(u64)(high_memory - 1));
> @@ -72,9 +95,9 @@ __init void kvm_compute_layout(void)
>  	va_mask = GENMASK_ULL(tag_lsb - 1, 0);
>  	tag_val = hyp_va_msb;
>  
> -	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && tag_lsb != (vabits_actual - 1)) {
> +	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && tag_lsb != (hyp_va_bits - 1)) {
>  		/* We have some free bits to insert a random tag. */
> -		tag_val |= get_random_long() & GENMASK_ULL(vabits_actual - 2, tag_lsb);
> +		tag_val |= get_random_long() & GENMASK_ULL(hyp_va_bits - 2, tag_lsb);
>  	}
>  	tag_val >>= tag_lsb;
>  
> -- 
> 2.52.0.457.g6b5491de43-goog
> 

