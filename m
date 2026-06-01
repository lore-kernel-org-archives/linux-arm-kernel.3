Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBEFCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 09:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRRfPVi4EwVZIHCExLSylYrDcSDk+EWjJ7iY8GJ8iRw=; b=rH09/QEUgCFho1fhR6gkY7Ubvg
	Z4Oq+9xQ9J/GG7V5QP4U6FbxI1JXeKhFntjV144A/I0o6DBCiAYa4852XSAtwXn+V2n21VNHOQwaQ
	JOYtW7T5HjiqU/khM/eDvTiH89OtrUr/QnQ9kevaHsWHw5wi6VSqobpAfUA9OJ/szkEfuPQ1EmAOi
	cF7wAtpJKVVPGXytkKaEaEi086gZKV8MgHsv3sYjnQj7WePJM19jyE2l/DiJd1D5hHDU58pRexdwl
	NEnvh4KJQXpL3txQuCkNI1vweSt/mviDm+LIZRisXWMYp7iBwKUcAEhqYBvEo/hSRqv2XY9ydvcWQ
	mfFq6Vtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyak-0000000AS4T-1Qly;
	Mon, 01 Jun 2026 09:05:50 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyai-0000000AS3j-069z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 09:05:49 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8422f148dfcso581167b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 02:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780304747; x=1780909547; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KRRfPVi4EwVZIHCExLSylYrDcSDk+EWjJ7iY8GJ8iRw=;
        b=j7wBDOvoWDhxdBfThaSE/5B8h2KCKv1nSzkpJ3oQCBUBdZhkPZ1ta4KaToinqZN8cG
         skK05g2gHYL1JdX0vketnXDnb4zsgCawPE/hkhkc/os9y9WP6BAxAyYiWXM2TMKjIxSe
         d6FI/4m1KwcZP44C8XqCvqESS1LPUJ9MDjUSKtlGCRhAu2igF32dAonVc4BJmV1dcang
         6Pkrk1y3ZHCNwxwgT1GgPx4yMyvAmAdnSRntKJMu5Oi5wMx2zAwO9hpNYkdx7MA7wKmB
         1Zltq5T9jQrVL4iiLZDqLetp9bHvx6WiNXTugIM5Am3tWPz1pjL2xmu8pvwEoUM3wwyR
         meFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780304747; x=1780909547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRRfPVi4EwVZIHCExLSylYrDcSDk+EWjJ7iY8GJ8iRw=;
        b=gmHrkF60BaGC/wzwyV3IcFiCFSXdYQaomP4MTwfODqVLKv9l5AmwtnvY9+WVMDCJqR
         fD5JH9SqM0/0tUYLouDA0f55xuC4UcncP62UPDq/ogdRCiZSwRvSiyjrNtpGnipmZGkv
         yHvCGpd/ml/DYntroc8jGSD5Zc4DxfhtuzO+wxd+f4S7EPbLYOd6f6UvReQZX6n5D/uF
         VKEGE+25GR9WXo++TZ3SSqTvcipzbUChHl/jg5Avz9x0RFveQRIOcTflb4hBlWrRj01f
         fvZMwgoeuqohBP9MnRgLQ4X6NeJahGf7XsZIHoutb+LK3Q0qNfrsVDtaVKBPAvoHtkzV
         uyQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/y27GYnTE0Dr+8Qw4iWX0yTD2llmoPFVBCA9GtZ4uybyw3rViLgTqWElgImxCGtJZceeDSH67BiO5PPJ1mGNyK@lists.infradead.org
X-Gm-Message-State: AOJu0YwpkBzsS0Ridv6pTCYhK/H2V7lBnwTLmrPEEJZcXRS58ntzndoz
	Q4GS9S+KuzO33YfjtsttyF8mm2UaisxOUV9lmFyRJvFlcfEbzMvT22x8
X-Gm-Gg: Acq92OHPcrJtRjSN51WBVsl34c1VFN5hIjSjERDFMVEy/Zmlbt4+JG7tG5f5U/6rGS1
	WFOUWnRF0kTm9uxQ0Ue559L5sOPNXpUfo+3LqUv6Q8Z3UAnGDluXf2ZWm0qkjYlfijkc1RiaUMS
	fdZOPAILgaCOtIr4EtptAp02TP3VDqT9oOQA2uizrnZ/Lv0+N7x61RCU7Am2CbvSjQ2BAsJ4cT+
	KnpQ9XJuIHi3RnkrrhEQUhcRs8qT6b2afrb1I/flNQqtrIFJtGSUv66ZJ2YZ5qqREjkGNnt6LVy
	HeIQueTZ/39Pa3rMDosbmoZiL7C0uV0zU9nCyJBy7e3YofXcynK44LhQclpWboeSq3RsO8+Ej07
	PLzPjz6I6+mImVMFKoq3MN2Bh65gCrY+3TF+q+G3MM47fIMGqmDrkEDOuTssZimcLZ3JJtgF9IC
	HW+veHcOUcKvv1pHKMVD08NO7JgSAXcYqUcw==
X-Received: by 2002:a05:6a00:3985:b0:83e:f228:b112 with SMTP id d2e1a72fcca58-842254930ffmr9458175b3a.34.1780304747105;
        Mon, 01 Jun 2026 02:05:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842487f60f9sm3717745b3a.8.2026.06.01.02.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:05:46 -0700 (PDT)
Date: Mon, 1 Jun 2026 17:05:29 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Marc Zyngier <maz@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Tian Zheng <zhengtian10@huawei.com>, oupton@kernel.org, 
	catalin.marinas@arm.com, corbet@lwn.net, pbonzini@redhat.com, will@kernel.org, 
	yuzenghui@huawei.com, wangzhou1@hisilicon.com, liuyonglong@huawei.com, 
	Jonathan.Cameron@huawei.com, yezhenyu2@huawei.com, linuxarm@huawei.com, joey.gouly@arm.com, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	suzuki.poulose@arm.com, leo.bras@arm.com
Subject: Re: [PATCH v3 3/5] KVM: arm64: Add support for FEAT_HDBSS
Message-ID: <ah1KLrpYBXSMM91H@inochi.infowork>
References: <20260225040421.2683931-1-zhengtian10@huawei.com>
 <20260225040421.2683931-4-zhengtian10@huawei.com>
 <ahzUUDAMoHtDFJD3@inochi.infowork>
 <864ijmvdpy.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864ijmvdpy.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_020548_074350_29176CE2 
X-CRM114-Status: GOOD (  40.63  )
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

On Mon, Jun 01, 2026 at 09:58:49AM +0100, Marc Zyngier wrote:
> On Mon, 01 Jun 2026 01:50:22 +0100,
> Inochi Amaoto <inochiama@gmail.com> wrote:
> > 
> > On Wed, Feb 25, 2026 at 12:04:19PM +0800, Tian Zheng wrote:
> > > From: eillon <yezhenyu2@huawei.com>
> > > 
> > > Armv9.5 introduces the Hardware Dirty Bit State Structure (HDBSS) feature,
> > > indicated by ID_AA64MMFR1_EL1.HAFDBS == 0b0100. A CPU capability is added
> > > to notify the user of the feature.
> > > 
> > > Add KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl and basic framework for
> > > ARM64 HDBSS support. Since the HDBSS buffer size is configurable and
> > > cannot be determined at KVM initialization, an IOCTL interface is
> > > required.
> > > 
> > > Actually exposing the new capability to user space happens in a later
> > > patch.
> > > 
> > > Signed-off-by: eillon <yezhenyu2@huawei.com>
> > > Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
> > > ---
> > >  arch/arm64/include/asm/cpufeature.h |  5 +++++
> > >  arch/arm64/kernel/cpufeature.c      | 12 ++++++++++++
> > >  arch/arm64/tools/cpucaps            |  1 +
> > >  include/uapi/linux/kvm.h            |  1 +
> > >  tools/include/uapi/linux/kvm.h      |  1 +
> > >  5 files changed, 20 insertions(+)
> > > 
> > > diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> > > index 4de51f8d92cb..dcc2e2cad5ad 100644
> > > --- a/arch/arm64/include/asm/cpufeature.h
> > > +++ b/arch/arm64/include/asm/cpufeature.h
> > > @@ -856,6 +856,11 @@ static inline bool system_supports_haft(void)
> > >  	return cpus_have_final_cap(ARM64_HAFT);
> > >  }
> > > 
> > > +static inline bool system_supports_hdbss(void)
> > > +{
> > > +	return cpus_have_final_cap(ARM64_HAS_HDBSS);
> > > +}
> > > +
> > >  static __always_inline bool system_supports_mpam(void)
> > >  {
> > >  	return alternative_has_cap_unlikely(ARM64_MPAM);
> > > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > > index c31f8e17732a..348b0afffc3e 100644
> > > --- a/arch/arm64/kernel/cpufeature.c
> > > +++ b/arch/arm64/kernel/cpufeature.c
> > > @@ -2124,6 +2124,11 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
> > >  	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
> > >  }
> > > 
> > > +static bool has_vhe_hdbss(const struct arm64_cpu_capabilities *entry, int cope)
> > > +{
> > > +	return is_kernel_in_hyp_mode() && has_cpuid_feature(entry, cope);
> > > +}
> > > +
> > >  bool cpu_supports_bbml2_noabort(void)
> > >  {
> > >  	/*
> > > @@ -2759,6 +2764,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
> > >  		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, HAFT)
> > >  	},
> > >  #endif
> > > +	{
> > > +		.desc = "Hardware Dirty state tracking structure (HDBSS)",
> > > +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> > > +		.capability = ARM64_HAS_HDBSS,
> > > +		.matches = has_vhe_hdbss,
> > > +		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, HDBSS)
> > > +	},
> > >  	{
> > >  		.desc = "CRC32 instructions",
> > >  		.capability = ARM64_HAS_CRC32,
> > > diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> > > index 7261553b644b..f6ece5b85532 100644
> > > --- a/arch/arm64/tools/cpucaps
> > > +++ b/arch/arm64/tools/cpucaps
> > > @@ -68,6 +68,7 @@ HAS_VA52
> > >  HAS_VIRT_HOST_EXTN
> > >  HAS_WFXT
> > >  HAS_XNX
> > > +HAS_HDBSS
> > >  HAFT
> > >  HW_DBM
> > >  KVM_HVHE
> > 
> > 
> > > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > > index 65500f5db379..15ee42cdbd51 100644
> > > --- a/include/uapi/linux/kvm.h
> > > +++ b/include/uapi/linux/kvm.h
> > > @@ -985,6 +985,7 @@ struct kvm_enable_cap {
> > >  #define KVM_CAP_ARM_SEA_TO_USER 245
> > >  #define KVM_CAP_S390_USER_OPEREXEC 246
> > >  #define KVM_CAP_S390_KEYOP 247
> > > +#define KVM_CAP_ARM_HW_DIRTY_STATE_TRACK 248
> > > 
> > >  struct kvm_irq_routing_irqchip {
> > >  	__u32 irqchip;
> > > diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
> > > index dddb781b0507..93e0a1e14dc7 100644
> > > --- a/tools/include/uapi/linux/kvm.h
> > > +++ b/tools/include/uapi/linux/kvm.h
> > > @@ -974,6 +974,7 @@ struct kvm_enable_cap {
> > >  #define KVM_CAP_GUEST_MEMFD_FLAGS 244
> > >  #define KVM_CAP_ARM_SEA_TO_USER 245
> > >  #define KVM_CAP_S390_USER_OPEREXEC 246
> > > +#define KVM_CAP_ARM_HW_DIRTY_STATE_TRACK 248
> > > 
> > >  struct kvm_irq_routing_irqchip {
> > >  	__u32 irqchip;
> > > --
> > > 2.33.0
> > > 
> > 
> > Instead of having these architecture specific capability, I wonder if
> > we can add a generic capability like "KVM_CAP_HW_DIRTY_STATE", so
> > other architecture supports similar things can reuse this capability,
> 
> What of the existing stuff doing the same thing? x86's PML, to start
> with?
> 

In fact I think the HDBSS is the first one with non-fixed size.
Although there is a in process RISC-V extension for it, there will
be a long story to make it ratified.

> > For this generic thing I suggest, the getter returns the max support 
> > entry count (or the buffer size) it supports like the dirty ring
> > capability. And the setter just let the architecture set the parameters
> > based on the user request.
> 
> This looks wrong on a number of levels.
> 
> - If you want something generic, there is the existing dirty
>   log/bitmap. How this stuff is populated is none of the user's
>   business (trapping write accesses, dirty bit collection from the
>   PTs, or HW-generated log), and we don't need an extra feature for
>   it. Performance will obviously suck, but that's what you pay for
>   something abstracted and cross-architecture.
> 
> - If you want something architecture specific, then it can't be
>   generic, by definition. You get the raw speed and compatibility with
>   other arch-specific extensions.
> 

OK, I agree, it is better to keep this thing arch-specific. Doing a
generic thing does not benefit too much, I have made a mistake on
it. Thanks for your kindly explanation.

> > This should do no harm to this implement, as everything still depends
> > on the architecture behavior, and leave room for other architecture
> > to reuse this.
> 
> Again, the generic framework exists, you just have to implement the
> backend you want.
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

Regards,
Inochi

