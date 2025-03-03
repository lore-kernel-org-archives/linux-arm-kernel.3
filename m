Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657D6C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 04:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bT3NNS/Dtjig2F+g725um6EB7JLWxqo2+V7HPlUk08=; b=hhY2OoAG8l5f9LzAk+yQnUZgA+
	OO+5Zi/PDIiQ6W5UynT2ONTHMTwRLn/7kaCubEwTiX0SRZe4fcTKurIT03uM7VENqQy0pXM3+78AW
	MDfGhakOXZTM2MQ8Kh9XTTC8mTML3Q9KQN1XnhQwqUu1UAFXr3mOnVlmHHeBMZJ3nyvSZOXdzZE80
	gDGO5DsfZ0bjdWcVK8b33ipQN47nSXfKfKESGPNNgmLvpZfmhW1HetSHVrbDzn178GmLztsHy6MGk
	QwfrigUvNmT8Wi1v9A9Q4YX4yKi0E8OS2+o6VQ6+G5wBYjeyEUGuK1y7yYgIo7Y5MsMp7Db22AO7N
	vOpSdeXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tox1q-0000000H8HW-00tf;
	Mon, 03 Mar 2025 04:03:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1towx1-0000000H7mv-434J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 03:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740974323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0bT3NNS/Dtjig2F+g725um6EB7JLWxqo2+V7HPlUk08=;
	b=UydxqHLJ6FV5k8C6iTQA9TPL1ptM3bnrLoBbl03aLTNd9Vpj2uy7I6NbU0eAyYbldIsjL4
	EO9pMDIVC4WJ/3N79t02YHg1xakua4kDAPy/2ew5fIZcWdw7gVDjALfVVCC+Gu9zv/qMXc
	ooF0ue+EmwGryfysNjFjMLkejCFI74c=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-PZQF047MP1q_MUQNR7ggBw-1; Sun, 02 Mar 2025 22:58:41 -0500
X-MC-Unique: PZQF047MP1q_MUQNR7ggBw-1
X-Mimecast-MFC-AGG-ID: PZQF047MP1q_MUQNR7ggBw_1740974321
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-223863d0d94so21197995ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 19:58:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740974320; x=1741579120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0bT3NNS/Dtjig2F+g725um6EB7JLWxqo2+V7HPlUk08=;
        b=Er3U1NeNj7aIGLq1jSKILG91DJI9mmld45x4AfFi59/MsSDK2RSaBCty1rSFEworJw
         nTJKOO14y1p8BttaMDO+StrHkdWUvmgbI2g/LT0nAzOc3vjLIoLlj6oAdjJMs0luBn9R
         IITzU8vFvgnTZDyQ6E0Rz3HjrgQSUH9AVHEavSPodUY3D8gOiCbg0NKRXpadR9qHa4UA
         frTmMrgc1bOGaJf2ShEeK55o6NIjqq4JbVDFmDZZl5CZ6PFSCpj3nywvSGp1anwvfrBw
         6XuaD1ILXuuOXnovBbFq/Ql0boZZLU2NFDjghxixG0Zwd+c++N58WyA9a4vk0151Lako
         VW9g==
X-Forwarded-Encrypted: i=1; AJvYcCXqxIUhD5nNHePpoBpjwyUJ5RahCpwWbDmxbpc10aGlC6NrXjqseQJeSdqeTTrAIvNKd7VDClMDAy6+C7s7F503@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6A2uLCOXdDD1nYUJWIHrSp6BoveEz9z0qLOvU2tEVOgxO35Ou
	+jPLBS1mhTpCn8nBFat0yO0laZ23jmXHTr+0FuPJR7oQNUD33V9YHMYUcyauWARDUr8xEqti8C2
	1gaIQnrpkDg5BJIJkiXU8Eujtvfwe9/JgdHQV6jeazCJVse8V197dczCEHgNXhWLrchZlAYv+
X-Gm-Gg: ASbGncv3nZQKq8vZQpqNpbywu2L9Nh4D9zQ03kNJTWoeB7PClT5WDrS8RHaaH6UIbD0
	c0dtjMH/vLnEpBtHDuIyfLoi+uO2p2OZ83wB0GD602qRI2TrtZ8zepAV+3Qf28aF2dLXDbmwBLN
	9PzV/FiprQtdMWohKOra+TKOA2y/RsngmtP1qPHt9S5PNm26HoXL42D1xnENUdA/Sz/qcfE6FsK
	KqoEx9AYlhyMOqeX1AmmQhF7jt+skEuZoAf1vCpxY2FnRWHtGytd7jAwwIM5hEWAa5XvRz8ciKH
	FT+L8h9pCmU1v6pdUA==
X-Received: by 2002:a17:903:2990:b0:218:a43c:571e with SMTP id d9443c01a7336-22368fba44fmr198572715ad.28.1740974320592;
        Sun, 02 Mar 2025 19:58:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqxI9Mvost7AdZYVBARMmzV+zMeNyiF17A+hAYLID4ebKywG48SoiE0P59KMBywZaWp4wy2w==
X-Received: by 2002:a17:903:2990:b0:218:a43c:571e with SMTP id d9443c01a7336-22368fba44fmr198572335ad.28.1740974320191;
        Sun, 02 Mar 2025 19:58:40 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fb05bsm67615055ad.96.2025.03.02.19.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 19:58:39 -0800 (PST)
Message-ID: <f3b31f6e-7960-432b-a522-3ec5f5ac7c6f@redhat.com>
Date: Mon, 3 Mar 2025 13:58:31 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/45] arm64: RME: Check for RME support at KVM init
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-7-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-7-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AdeJPD6VXoEIwMzhJE8P1Y3NTuiDhNGTfboP04rmKa0_1740974321
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_195844_086858_AF5EA0D7 
X-CRM114-Status: GOOD (  35.48  )
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

On 2/14/25 2:13 AM, Steven Price wrote:
> Query the RMI version number and check if it is a compatible version. A
> static key is also provided to signal that a supported RMM is available.
> 
> Functions are provided to query if a VM or VCPU is a realm (or rec)
> which currently will always return false.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v6:
>   * Improved message for an unsupported RMI ABI version.
> Changes since v5:
>   * Reword "unsupported" message from "host supports" to "we want" to
>     clarify that 'we' are the 'host'.
> Changes since v2:
>   * Drop return value from kvm_init_rme(), it was always 0.
>   * Rely on the RMM return value to identify whether the RSI ABI is
>     compatible.
> ---
>   arch/arm64/include/asm/kvm_emulate.h | 18 +++++++++
>   arch/arm64/include/asm/kvm_host.h    |  4 ++
>   arch/arm64/include/asm/kvm_rme.h     | 56 ++++++++++++++++++++++++++++
>   arch/arm64/include/asm/virt.h        |  1 +
>   arch/arm64/kvm/Makefile              |  3 +-
>   arch/arm64/kvm/arm.c                 |  6 +++
>   arch/arm64/kvm/rme.c                 | 56 ++++++++++++++++++++++++++++
>   7 files changed, 143 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm64/include/asm/kvm_rme.h
>   create mode 100644 arch/arm64/kvm/rme.c
> 

It may be worthy to add one comments in the change log, something like "struct realm"
and its states aren't used until the ioctl interfaces are revised to support realm
and REC creation and destruction. Otherwise, the definition would belong to that
patch revising the ioctl interface.

With the following nitpick is addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 47f2cf408eed..52c7a8923c65 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -691,4 +691,22 @@ static inline bool guest_hyp_sve_traps_enabled(const struct kvm_vcpu *vcpu)
>   {
>   	return __guest_hyp_cptr_xen_trap_enabled(vcpu, ZEN);
>   }
> +
> +static inline bool kvm_is_realm(struct kvm *kvm)
> +{
> +	if (static_branch_unlikely(&kvm_rme_is_available) && kvm)
> +		return kvm->arch.is_realm;
> +	return false;
> +}
> +
> +static inline enum realm_state kvm_realm_state(struct kvm *kvm)
> +{
> +	return READ_ONCE(kvm->arch.realm.state);
> +}
> +
> +static inline bool vcpu_is_rec(struct kvm_vcpu *vcpu)
> +{
> +	return false;
> +}
> +
>   #endif /* __ARM64_KVM_EMULATE_H__ */
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 7cfa024de4e3..992eb2a6f56f 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -27,6 +27,7 @@
>   #include <asm/fpsimd.h>
>   #include <asm/kvm.h>
>   #include <asm/kvm_asm.h>
> +#include <asm/kvm_rme.h>
>   #include <asm/vncr_mapping.h>
>   
>   #define __KVM_HAVE_ARCH_INTC_INITIALIZED
> @@ -383,6 +384,9 @@ struct kvm_arch {
>   	 * the associated pKVM instance in the hypervisor.
>   	 */
>   	struct kvm_protected_vm pkvm;
> +
> +	bool is_realm;
> +	struct realm realm;
>   };
>   
>   struct kvm_vcpu_fault_info {
> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> new file mode 100644
> index 000000000000..69af5c3a1e44
> --- /dev/null
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 ARM Ltd.
> + */
> +
> +#ifndef __ASM_KVM_RME_H
> +#define __ASM_KVM_RME_H
> +
> +/**
> + * enum realm_state - State of a Realm
> + */
> +enum realm_state {
> +	/**
> +	 * @REALM_STATE_NONE:
> +	 *      Realm has not yet been created. rmi_realm_create() may be
> +	 *      called to create the realm.
> +	 */
> +	REALM_STATE_NONE,
> +	/**
> +	 * @REALM_STATE_NEW:
> +	 *      Realm is under construction, not eligible for execution. Pages
> +	 *      may be populated with rmi_data_create().
> +	 */
> +	REALM_STATE_NEW,
> +	/**
> +	 * @REALM_STATE_ACTIVE:
> +	 *      Realm has been created and is eligible for execution with
> +	 *      rmi_rec_enter(). Pages may no longer be populated with
> +	 *      rmi_data_create().
> +	 */
> +	REALM_STATE_ACTIVE,
> +	/**
> +	 * @REALM_STATE_DYING:
> +	 *      Realm is in the process of being destroyed or has already been
> +	 *      destroyed.
> +	 */
> +	REALM_STATE_DYING,
> +	/**
> +	 * @REALM_STATE_DEAD:
> +	 *      Realm has been destroyed.
> +	 */
> +	REALM_STATE_DEAD
> +};
> +
> +/**
> + * struct realm - Additional per VM data for a Realm
> + *
> + * @state: The lifetime state machine for the realm
> + */
> +struct realm {
> +	enum realm_state state;
> +};
> +
> +void kvm_init_rme(void);
> +
> +#endif

#endif /* __ASM_KVM_RME_H */

> diff --git a/arch/arm64/include/asm/virt.h b/arch/arm64/include/asm/virt.h
> index ebf4a9f943ed..e45d47156dcf 100644
> --- a/arch/arm64/include/asm/virt.h
> +++ b/arch/arm64/include/asm/virt.h
> @@ -81,6 +81,7 @@ void __hyp_reset_vectors(void);
>   bool is_kvm_arm_initialised(void);
>   
>   DECLARE_STATIC_KEY_FALSE(kvm_protected_mode_initialized);
> +DECLARE_STATIC_KEY_FALSE(kvm_rme_is_available);
>   
>   static inline bool is_pkvm_initialized(void)
>   {
> diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> index 3cf7adb2b503..ce8a10d3161d 100644
> --- a/arch/arm64/kvm/Makefile
> +++ b/arch/arm64/kvm/Makefile
> @@ -23,7 +23,8 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
>   	 vgic/vgic-v3.o vgic/vgic-v4.o \
>   	 vgic/vgic-mmio.o vgic/vgic-mmio-v2.o \
>   	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
> -	 vgic/vgic-its.o vgic/vgic-debug.o
> +	 vgic/vgic-its.o vgic/vgic-debug.o \
> +	 rme.o
>   
>   kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
>   kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 646e806c6ca6..6d371a2b648a 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -40,6 +40,7 @@
>   #include <asm/kvm_nested.h>
>   #include <asm/kvm_pkvm.h>
>   #include <asm/kvm_ptrauth.h>
> +#include <asm/kvm_rme.h>
>   #include <asm/sections.h>
>   
>   #include <kvm/arm_hypercalls.h>
> @@ -59,6 +60,8 @@ enum kvm_wfx_trap_policy {
>   static enum kvm_wfx_trap_policy kvm_wfi_trap_policy __read_mostly = KVM_WFX_NOTRAP_SINGLE_TASK;
>   static enum kvm_wfx_trap_policy kvm_wfe_trap_policy __read_mostly = KVM_WFX_NOTRAP_SINGLE_TASK;
>   
> +DEFINE_STATIC_KEY_FALSE(kvm_rme_is_available);
> +
>   DECLARE_KVM_HYP_PER_CPU(unsigned long, kvm_hyp_vector);
>   
>   DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_base);
> @@ -2759,6 +2762,9 @@ static __init int kvm_arm_init(void)
>   
>   	in_hyp_mode = is_kernel_in_hyp_mode();
>   
> +	if (in_hyp_mode)
> +		kvm_init_rme();
> +
>   	if (cpus_have_final_cap(ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE) ||
>   	    cpus_have_final_cap(ARM64_WORKAROUND_1508412))
>   		kvm_info("Guests without required CPU erratum workarounds can deadlock system!\n" \
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> new file mode 100644
> index 000000000000..67cf2d94cb2d
> --- /dev/null
> +++ b/arch/arm64/kvm/rme.c
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 ARM Ltd.
> + */
> +
> +#include <linux/kvm_host.h>
> +
> +#include <asm/rmi_cmds.h>
> +#include <asm/virt.h>
> +
> +static int rmi_check_version(void)
> +{
> +	struct arm_smccc_res res;
> +	unsigned short version_major, version_minor;
> +	unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
> +						     RMI_ABI_MINOR_VERSION);
> +
> +	arm_smccc_1_1_invoke(SMC_RMI_VERSION, host_version, &res);
> +
> +	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
> +		return -ENXIO;
> +
> +	version_major = RMI_ABI_VERSION_GET_MAJOR(res.a1);
> +	version_minor = RMI_ABI_VERSION_GET_MINOR(res.a1);
> +
> +	if (res.a0 != RMI_SUCCESS) {
> +		unsigned short high_version_major, high_version_minor;
> +
> +		high_version_major = RMI_ABI_VERSION_GET_MAJOR(res.a2);
> +		high_version_minor = RMI_ABI_VERSION_GET_MINOR(res.a2);
> +
> +		kvm_err("Unsupported RMI ABI (v%d.%d - v%d.%d) we want v%d.%d\n",
> +			version_major, version_minor,
> +			high_version_major, high_version_minor,
> +			RMI_ABI_MAJOR_VERSION,
> +			RMI_ABI_MINOR_VERSION);
> +		return -ENXIO;
> +	}
> +
> +	kvm_info("RMI ABI version %d.%d\n", version_major, version_minor);
> +
> +	return 0;
> +}
> +
> +void kvm_init_rme(void)
> +{
> +	if (PAGE_SIZE != SZ_4K)
> +		/* Only 4k page size on the host is supported */
> +		return;
> +
> +	if (rmi_check_version())
> +		/* Continue without realm support */
> +		return;
> +
> +	/* Future patch will enable static branch kvm_rme_is_available */
> +}

Thanks,
Gavin


