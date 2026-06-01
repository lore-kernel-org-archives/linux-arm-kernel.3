Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97C8CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 00:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cg6Y3xqfBKjzaemeU2L9Q5dBdOV9FXfEg49CMyYPN/s=; b=JHih5CwJVy/m4jzMRWE4uYGEri
	5aydiAldMoq7byPtewRCdNbbvl8eT1dI7tejP1Z1itPc4b3mXBCpYho3Y6YGgir6WTwA5VlwIR/zX
	XOSDA7mj/OP3rxy2ptnZgZqfs/3PevaYW014k7tGA+pVRCO9OOVbFZOgjMEBrBb8OCjDsqaCTiekr
	zL3nCVgBL2FAr8Fy67xmrZcyrs8ECYNAWz2xCnkj5Knf5PQiJP3GvmzoCKDsdFNvLF3ktCw9iTDrS
	yoER80QlQNuwaJoB92T+G2TB98+MPxvkkftcvceJAauzz5wzCyE/P03+H39dOi2zscZroEMR5Mmw4
	lXn3sfyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTqrZ-0000000A0HT-2c2T;
	Mon, 01 Jun 2026 00:50:41 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTqrX-0000000A0Gy-1zWl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 00:50:40 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-36da8439078so492320a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 17:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780275038; x=1780879838; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cg6Y3xqfBKjzaemeU2L9Q5dBdOV9FXfEg49CMyYPN/s=;
        b=bwUiLlI5yZw+YgCwtt2vdYaRjZcK/+rvHGjcXrHynqkp62kEAo7+oTzBqWGEK+4Sc8
         c73jFJwH2tnnvCoESbILbbYRPA31opy16xGSiBWiVBgyJ2ekMRdmhAEdOA4vJT5zbZot
         MK4Y1KLFVrKav1zfCnqj6q2LZW68NOb5g4JtITDKFUxEcvNLsxojG+9yTrfWfwXKLKBc
         s/+7XEYT1n1qFFtQd8f1rNp1iFcH2vK5zWxitoOvuXbI/gpIFix+nigoEJ771MH+wCi5
         UvAxO01ysE22eOwk5nOcOco3eaRUn4tfO76YqNqJWIVcgOLMsr9kQR0stiT71geTfEiG
         cRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780275038; x=1780879838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cg6Y3xqfBKjzaemeU2L9Q5dBdOV9FXfEg49CMyYPN/s=;
        b=V+CkNKdXlGu+JYW96R2NbstmG4Ye19vpOfMA8FekOjZphkVrpPR/YOKDHhJPP9a7Ze
         g/bVih7QIRtRAKTiWfgWD89+ob3ni7V+S1BKrxnxHu+N/aDIcmH+CmJ6ER+qsTTfZxLQ
         1XIqsEwoIX+jjdzKQ3ohFNo6A72cTMJS+iKkOuQFWkQdoZGogqCVV9Fi9wZjHNRamjoM
         s828ntTNUHNxx1mnvaFOMcLEq5Cjcoxh15hiLpWKrcYZJ0efrVcfjz4tRwrZgzkweULJ
         1qUSCddrqInPtNFyFBDe+hI7Z5L1FK1o1X2UsG9aY5vdmBPk/fQx2tMHrWjpngcXot0h
         tq2w==
X-Forwarded-Encrypted: i=1; AFNElJ+/6M8qr/0uWW/irtqpZ4SoaS+45HbnxgayA36OIltK50y9OhaW+M9bV3coLOdzV/NrLy3VcCZ9ZsTRWNBrNh5Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzWNKaLwIIfNDiNjagkbtREhAEhwNCbAfHmIFM2WrqyW2LgpPyl
	0Ii6EIr8Yo7mo4A7ECgze9oATgNevwIy5W23rdroCpC1ynqOH8XOW76f
X-Gm-Gg: Acq92OHChjxfT2jhEAEKVPFwxS19FSFDiGw2yTZEP1Vo7XeT+A4kP1zSv6G0taXg3tM
	BCJngB2Z6cyI2ik5kID/eunghhqqDvDWfzjQq/XT1SfVDv+AFjBZaocYGIfOgfscCDKVpXMeRzO
	bRHzrvzF+gcy0NaipLgElVXuvwFDrI/Sxx9kYZvTwdCTeLuLFh1KKKSToP9BBW4+ICIMjVSGVsi
	isNyQTp8aN469uBqwccNXtBOiOA0YiANDSgiHO/HuTSZMbDhwmRSyaEbdJ0QBC8efKljFSaXgwi
	LZyuJVwZIqKaqpgN9zzN61OicvV86R6z+uwJ9IbBkMc2ETnU8jpXuo31MJ+22kesvkOVaSeiHGz
	Fai6iokLeU0aL/s3FLsEWbTHXwAb33qpdGgWxNWRCN6SCZQcj8uFMcuS27hmktIOIkyVzk/Kiop
	51XmWdvQ4+1CoWNWTP89pUvFVxJI+9KxLCBA==
X-Received: by 2002:a17:90b:2586:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-36db4245eb0mr1990613a91.1.1780275038259;
        Sun, 31 May 2026 17:50:38 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdb5c91bsm5313469a91.1.2026.05.31.17.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 17:50:37 -0700 (PDT)
Date: Mon, 1 Jun 2026 08:50:22 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Tian Zheng <zhengtian10@huawei.com>, maz@kernel.org, oupton@kernel.org, 
	catalin.marinas@arm.com, corbet@lwn.net, pbonzini@redhat.com, will@kernel.org
Cc: yuzenghui@huawei.com, wangzhou1@hisilicon.com, liuyonglong@huawei.com, 
	Jonathan.Cameron@huawei.com, yezhenyu2@huawei.com, linuxarm@huawei.com, joey.gouly@arm.com, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	suzuki.poulose@arm.com, leo.bras@arm.com, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v3 3/5] KVM: arm64: Add support for FEAT_HDBSS
Message-ID: <ahzUUDAMoHtDFJD3@inochi.infowork>
References: <20260225040421.2683931-1-zhengtian10@huawei.com>
 <20260225040421.2683931-4-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225040421.2683931-4-zhengtian10@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_175039_522768_940EC1CD 
X-CRM114-Status: GOOD (  26.41  )
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

On Wed, Feb 25, 2026 at 12:04:19PM +0800, Tian Zheng wrote:
> From: eillon <yezhenyu2@huawei.com>
> 
> Armv9.5 introduces the Hardware Dirty Bit State Structure (HDBSS) feature,
> indicated by ID_AA64MMFR1_EL1.HAFDBS == 0b0100. A CPU capability is added
> to notify the user of the feature.
> 
> Add KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl and basic framework for
> ARM64 HDBSS support. Since the HDBSS buffer size is configurable and
> cannot be determined at KVM initialization, an IOCTL interface is
> required.
> 
> Actually exposing the new capability to user space happens in a later
> patch.
> 
> Signed-off-by: eillon <yezhenyu2@huawei.com>
> Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
> ---
>  arch/arm64/include/asm/cpufeature.h |  5 +++++
>  arch/arm64/kernel/cpufeature.c      | 12 ++++++++++++
>  arch/arm64/tools/cpucaps            |  1 +
>  include/uapi/linux/kvm.h            |  1 +
>  tools/include/uapi/linux/kvm.h      |  1 +
>  5 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index 4de51f8d92cb..dcc2e2cad5ad 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -856,6 +856,11 @@ static inline bool system_supports_haft(void)
>  	return cpus_have_final_cap(ARM64_HAFT);
>  }
> 
> +static inline bool system_supports_hdbss(void)
> +{
> +	return cpus_have_final_cap(ARM64_HAS_HDBSS);
> +}
> +
>  static __always_inline bool system_supports_mpam(void)
>  {
>  	return alternative_has_cap_unlikely(ARM64_MPAM);
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index c31f8e17732a..348b0afffc3e 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2124,6 +2124,11 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
>  	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
>  }
> 
> +static bool has_vhe_hdbss(const struct arm64_cpu_capabilities *entry, int cope)
> +{
> +	return is_kernel_in_hyp_mode() && has_cpuid_feature(entry, cope);
> +}
> +
>  bool cpu_supports_bbml2_noabort(void)
>  {
>  	/*
> @@ -2759,6 +2764,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, HAFT)
>  	},
>  #endif
> +	{
> +		.desc = "Hardware Dirty state tracking structure (HDBSS)",
> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> +		.capability = ARM64_HAS_HDBSS,
> +		.matches = has_vhe_hdbss,
> +		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, HDBSS)
> +	},
>  	{
>  		.desc = "CRC32 instructions",
>  		.capability = ARM64_HAS_CRC32,
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 7261553b644b..f6ece5b85532 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -68,6 +68,7 @@ HAS_VA52
>  HAS_VIRT_HOST_EXTN
>  HAS_WFXT
>  HAS_XNX
> +HAS_HDBSS
>  HAFT
>  HW_DBM
>  KVM_HVHE


> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 65500f5db379..15ee42cdbd51 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -985,6 +985,7 @@ struct kvm_enable_cap {
>  #define KVM_CAP_ARM_SEA_TO_USER 245
>  #define KVM_CAP_S390_USER_OPEREXEC 246
>  #define KVM_CAP_S390_KEYOP 247
> +#define KVM_CAP_ARM_HW_DIRTY_STATE_TRACK 248
> 
>  struct kvm_irq_routing_irqchip {
>  	__u32 irqchip;
> diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
> index dddb781b0507..93e0a1e14dc7 100644
> --- a/tools/include/uapi/linux/kvm.h
> +++ b/tools/include/uapi/linux/kvm.h
> @@ -974,6 +974,7 @@ struct kvm_enable_cap {
>  #define KVM_CAP_GUEST_MEMFD_FLAGS 244
>  #define KVM_CAP_ARM_SEA_TO_USER 245
>  #define KVM_CAP_S390_USER_OPEREXEC 246
> +#define KVM_CAP_ARM_HW_DIRTY_STATE_TRACK 248
> 
>  struct kvm_irq_routing_irqchip {
>  	__u32 irqchip;
> --
> 2.33.0
> 

Instead of having these architecture specific capability, I wonder if
we can add a generic capability like "KVM_CAP_HW_DIRTY_STATE", so
other architecture supports similar things can reuse this capability,

For this generic thing I suggest, the getter returns the max support 
entry count (or the buffer size) it supports like the dirty ring
capability. And the setter just let the architecture set the parameters
based on the user request. 

This should do no harm to this implement, as everything still depends
on the architecture behavior, and leave room for other architecture
to reuse this.

Regards,
Inochi

