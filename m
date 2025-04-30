Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805A2C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 04:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/9ZIpgit3K5HEouvbiwaznyb2ZT+dyMuQHH+dHlTBs=; b=34rfHFf8lU6ApUPtzfKQgh62Vm
	AylqGCmZ6K76JZW70VpuF6bo+3/QzqvUVKQ0sdCwn4eQBn/kQ6E9jpwFH4lIB9doRB0stvdPqRNzT
	yt+5eVVQrnuYJCvfqkHzNqyc2hE8Rkqb4WxRpqPrHQJCXEZfJAT3CtnXSK86bzBmx1aZS4Z0R18t8
	6VH81vS+tRP+eQDGSl7RLNbOicN5lDL1bKYnkVso2xCe+Uyqm8hZdrn+MB0mIvR6uYHnkaLjjepLV
	U5dojuig2Y6pC5IklqNasyXW4LNRmMhOlrUl5LUR+bzzFmb6LKVkEgCyt1YhjVMrrlMgeid9oXCpU
	rGk447Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9z49-0000000BffC-3o2a;
	Wed, 30 Apr 2025 04:29:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9z2F-0000000BfM4-1vuK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 04:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745987221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5/9ZIpgit3K5HEouvbiwaznyb2ZT+dyMuQHH+dHlTBs=;
	b=DAQyZtRVfnw6rgQ+VO6Eo0vnBDe50/0Ezv/cmHQek5rG567dupS8915norX8U1V/TUdAkc
	RJVpg9OysMhMkxUYm9W1Amih0SMaqWq9u8ZewTMuJzIS7e+frv6Srf9Sy+rlGihAG3353a
	5ZFn1gBIfePy0VszjttF+WuMKD2wbaI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-AvRXOoYEM4CSJVvBIn4CwA-1; Wed, 30 Apr 2025 00:25:18 -0400
X-MC-Unique: AvRXOoYEM4CSJVvBIn4CwA-1
X-Mimecast-MFC-AGG-ID: AvRXOoYEM4CSJVvBIn4CwA_1745987117
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-227ed471999so58160735ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 21:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745987112; x=1746591912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5/9ZIpgit3K5HEouvbiwaznyb2ZT+dyMuQHH+dHlTBs=;
        b=QXyrSpEp6D4mYubylHrkH54wqUUWN+ADwuXnNF5MUo7a4DzaQMzt+OLKEmSSYyZpGs
         tSKhsHqiWesq/QXTETa2zTrKMJAP8MNn5fjJ3ZxoxdaAKsaQv8OKSdTwL3kTXRmF59Q9
         MWuRLAdjjEyQiBChVQrI0hNVB0eqRtOxbQfLEzbrThuCGg7+kI3rReFU0lnk+Hb7Ro3n
         wz+ARdthESaS0JymL8cWo48WGrOpXm4T3+AMqkmr3z4gTo0NfqT4OUWpPOoJwGgkZsQ3
         rt7FMSC40lR291xgO104agFTAssnzIP7mgnX1++zyop0Rscmz2LOsg4D38RRJThDwIjd
         D2/A==
X-Forwarded-Encrypted: i=1; AJvYcCXO+ZPXtaKzJbFvsqkm5+exKjmEUQyZgtnQGBzbcv87pIQGDViDunMGZk88VwmNMj2V1GYDoXl6gZncAhZs9oTp@lists.infradead.org
X-Gm-Message-State: AOJu0YylU1oHHN67tC1nEYi5CPF4HqEIJ0vi3+/2r117inTDeW6serrL
	XylsrUApy+rke35bKDNfU2w+RX3TH3CQYmvTjcewFcw2int+j8GDsrQMxApLkEB4lfgz14+zYph
	1pzWMZqXgUvEP+uBiBGhh4HuJzVUvdTzEaTefU7BOXkFZ7HFWYQda0beRpo7+hnUjyWsYLS4J
X-Gm-Gg: ASbGncvMbyNZ0NU3XOGV03KWb//RPWH5LdxXDVPisLJR5FIGgqSTAXjzH7w/gMY9JR+
	KASDg6XC+rxeUfmyo8FwuxTqtl1dBRHjq2ZT2xCSJlXLMq6K1UhKtBDgaGQEZNvUgjnDk8JRXOm
	49fyCVA5gxcWWx/orHRDgu35LL2b6dUnWSpqTccrfhXGJIBzoiYHnGv/LKc2Rh8Sb2pOr+JOEac
	MRnqXDuqpqjySQ3QwDxZUrR3QWAETqBSjiR9tEe+Uz8AAW6/SAOrTr0eNkGywBXhoRQIaNAA5Rj
	eSmSgzxW7vro
X-Received: by 2002:a17:903:1a6f:b0:223:517c:bfa1 with SMTP id d9443c01a7336-22df3590ef6mr30860875ad.38.1745987112431;
        Tue, 29 Apr 2025 21:25:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyXj2p77AmMx3N+ITVW1jQFy+1LPquQePsvvxXex3oWiwLfzusXWyW1Gs0Qv4M8sW36jIdYA==
X-Received: by 2002:a17:903:1a6f:b0:223:517c:bfa1 with SMTP id d9443c01a7336-22df3590ef6mr30860675ad.38.1745987112018;
        Tue, 29 Apr 2025 21:25:12 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c13sm112249685ad.162.2025.04.29.21.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 21:25:11 -0700 (PDT)
Message-ID: <dac9f2c6-d46e-4232-abbd-8aa097f012a5@redhat.com>
Date: Wed, 30 Apr 2025 14:25:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/43] arm64: RME: Define the user ABI
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
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-7-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-7-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YM3xfa4_bprWKS6ShVgtk9sJaEOLEW89RsS_PQ-6nXs_1745987117
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_212703_583861_338154BA 
X-CRM114-Status: GOOD (  37.20  )
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

On 4/16/25 11:41 PM, Steven Price wrote:
> There is one (multiplexed) CAP which can be used to create, populate and
> then activate the realm.
> 
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Add documentation of new ioctls
>   * Bump the magic numbers to avoid conflicts
> Changes since v6:
>   * Rename some of the symbols to make their usage clearer and avoid
>     repetition.
> Changes from v5:
>   * Actually expose the new VCPU capability (KVM_ARM_VCPU_REC) by bumping
>     KVM_VCPU_MAX_FEATURES - note this also exposes KVM_ARM_VCPU_HAS_EL2!
> ---
>   Documentation/virt/kvm/api.rst    | 70 +++++++++++++++++++++++++++++++
>   arch/arm64/include/uapi/asm/kvm.h | 49 ++++++++++++++++++++++
>   include/uapi/linux/kvm.h          | 10 +++++
>   3 files changed, 129 insertions(+)
> 

With below comment addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 1f8625b7646a..99ba6c82cf37 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -3527,6 +3527,11 @@ Possible features:
>   	      - the KVM_REG_ARM64_SVE_VLS pseudo-register is immutable, and can
>   	        no longer be written using KVM_SET_ONE_REG.
>   
> +	- KVM_ARM_VCPU_REC: Allocate a REC (Realm Execution Context) for this
> +	  VCPU. This must be specified on all VCPUs created in a Realm VM.
> +	  Depends on KVM_CAP_ARM_RME.
> +	  Requires KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_REC).
> +
>   4.83 KVM_ARM_PREFERRED_TARGET
>   -----------------------------
>   
> @@ -5098,6 +5103,7 @@ Recognised values for feature:
>   
>     =====      ===========================================
>     arm64      KVM_ARM_VCPU_SVE (requires KVM_CAP_ARM_SVE)
> +  arm64      KVM_ARM_VCPU_REC (requires KVM_CAP_ARM_RME)
>     =====      ===========================================
>   
>   Finalizes the configuration of the specified vcpu feature.
> @@ -6452,6 +6458,30 @@ the capability to be present.
>   
>   `flags` must currently be zero.
>   
> +4.144 KVM_ARM_VCPU_RMM_PSCI_COMPLETE
> +------------------------------------
> +
> +:Capability: KVM_CAP_ARM_RME
> +:Architectures: arm64
> +:Type: vcpu ioctl
> +:Parameters: struct kvm_arm_rmm_psci_complete (in)
> +:Returns: 0 if successful, < 0 on error
> +
> +::
> +
> +  struct kvm_arm_rmm_psci_complete {
> +	__u64 target_mpidr;
> +	__u32 psci_status;
> +	__u32 padding[3];
> +  };
> +
> +Where PSCI functions are handled by user space, the RMM needs to be informed of
> +the target of the operation using `target_mpidr`, along with the status
> +(`psci_status`). The RMM v1.0 specification defines two functions that require
> +this call: PSCI_CPU_ON and PSCI_AFFINITY_INFO.
> +
> +If the kernel is handling PSCI then this is done automatically and the VMM
> +doesn't need to call this ioctl.
>   
>   .. _kvm_run:
>   
> @@ -8280,6 +8310,46 @@ aforementioned registers before the first KVM_RUN. These registers are VM
>   scoped, meaning that the same set of values are presented on all vCPUs in a
>   given VM.
>   
> +7.38 KVM_CAP_ARM_RME
> +--------------------
> +
> +:Architectures: arm64
> +:Target: VM
> +:Parameters: args[0] provides an action, args[1] points to a structure in
> +	     memory for some actions.
> +:Returns: 0 on success, negative value on error
> +
> +Used to configure and set up the memory for a Realm. The available actions are:
> +
> +================================= =============================================
> + KVM_CAP_ARM_RME_CONFIG_REALM     Takes struct arm_rme_config as args[1] and
> +                                  configures realm parameters prior to it being
> +                                  created.
> +
> +                                  Options are ARM_RME_CONFIG_RPV to set the
> +                                  "Realm Personalization Value" and
> +                                  ARM_RME_CONFIG_HASH_ALGO to set the hash
> +                                  algorithm.
> +
> + KVM_CAP_ARM_RME_CREATE_REALM     Request the RMM create the realm. The realm's
> +                                  configuration parameters must be set first.
> +
> + KVM_CAP_ARM_RME_INIT_RIPAS_REALM Takes struct arm_rme_init_ripas as args[1]
> +                                  and sets the RIPAS (Realm IPA State) to
> +                                  RIPAS_RAM of a specified area of the realm's
> +                                  IPA.
> +
> + KVM_CAP_ARM_RME_POPULATE_REALM   Takes struct arm_rme_init_ripas as args[1]
> +                                  and populates a region of protected address
> +                                  space by copying the data from the shared
> +                                  alias.
> +
> + KVM_CAP_ARM_RME_ACTIVATE_REALM   Request the RMM activate the realm. No
> +                                  further changes can be made to the realm's
> +                                  configuration, and VCPUs are not permitted to
> +                                  enter the realm until it has been activated.
                                                               ^^^^^^^^^^^^^^^^^^
s/has been activated/is deactivated

I don't see where the guard is applied to prevent vCPU is added after realm
has been activated. I may missed that. Otherwise, it's something to be improved
n the subsequent patch where a vCPU is created and added to the realm.


> +================================= =============================================
> +
>   8. Other capabilities.
>   ======================
>   
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index af9d9acaf997..b57712880605 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -106,6 +106,7 @@ struct kvm_regs {
>   #define KVM_ARM_VCPU_PTRAUTH_GENERIC	6 /* VCPU uses generic authentication */
>   #define KVM_ARM_VCPU_HAS_EL2		7 /* Support nested virtualization */
>   #define KVM_ARM_VCPU_HAS_EL2_E2H0	8 /* Limit NV support to E2H RES0 */
> +#define KVM_ARM_VCPU_REC		9 /* VCPU REC state as part of Realm */
>   
>   struct kvm_vcpu_init {
>   	__u32 target;
> @@ -429,6 +430,54 @@ enum {
>   #define   KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES	3
>   #define   KVM_DEV_ARM_ITS_CTRL_RESET		4
>   
> +/* KVM_CAP_ARM_RME on VM fd */
> +#define KVM_CAP_ARM_RME_CONFIG_REALM		0
> +#define KVM_CAP_ARM_RME_CREATE_REALM		1
> +#define KVM_CAP_ARM_RME_INIT_RIPAS_REALM	2
> +#define KVM_CAP_ARM_RME_POPULATE_REALM		3
> +#define KVM_CAP_ARM_RME_ACTIVATE_REALM		4
> +
> +/* List of configuration items accepted for KVM_CAP_ARM_RME_CONFIG_REALM */
> +#define ARM_RME_CONFIG_RPV			0
> +#define ARM_RME_CONFIG_HASH_ALGO		1
> +
> +#define ARM_RME_CONFIG_MEASUREMENT_ALGO_SHA256		0
> +#define ARM_RME_CONFIG_MEASUREMENT_ALGO_SHA512		1
> +
> +#define ARM_RME_CONFIG_RPV_SIZE 64
> +
> +struct arm_rme_config {
> +	__u32 cfg;
> +	union {
> +		/* cfg == ARM_RME_CONFIG_RPV */
> +		struct {
> +			__u8	rpv[ARM_RME_CONFIG_RPV_SIZE];
> +		};
> +
> +		/* cfg == ARM_RME_CONFIG_HASH_ALGO */
> +		struct {
> +			__u32	hash_algo;
> +		};
> +
> +		/* Fix the size of the union */
> +		__u8	reserved[256];
> +	};
> +};
> +
> +#define KVM_ARM_RME_POPULATE_FLAGS_MEASURE	(1 << 0)
> +struct arm_rme_populate_realm {
> +	__u64 base;
> +	__u64 size;
> +	__u32 flags;
> +	__u32 reserved[3];
> +};
> +
> +struct arm_rme_init_ripas {
> +	__u64 base;
> +	__u64 size;
> +	__u64 reserved[2];
> +};
> +
>   /* Device Control API on vcpu fd */
>   #define KVM_ARM_VCPU_PMU_V3_CTRL	0
>   #define   KVM_ARM_VCPU_PMU_V3_IRQ	0
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index b6ae8ad8934b..0b8479985581 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -930,6 +930,7 @@ struct kvm_enable_cap {
>   #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
>   #define KVM_CAP_X86_GUEST_MODE 238
>   #define KVM_CAP_ARM_WRITABLE_IMP_ID_REGS 239
> +#define KVM_CAP_ARM_RME 240
>   
>   struct kvm_irq_routing_irqchip {
>   	__u32 irqchip;
> @@ -1582,4 +1583,13 @@ struct kvm_pre_fault_memory {
>   	__u64 padding[5];
>   };
>   
> +/* Available with KVM_CAP_ARM_RME, only for VMs with KVM_VM_TYPE_ARM_REALM  */
> +struct kvm_arm_rmm_psci_complete {
> +	__u64 target_mpidr;
> +	__u32 psci_status;
> +	__u32 padding[3];
> +};
> +
> +#define KVM_ARM_VCPU_RMM_PSCI_COMPLETE	_IOW(KVMIO, 0xd6, struct kvm_arm_rmm_psci_complete)
> +
>   #endif /* __LINUX_KVM_H */

Thanks,
Gavin


