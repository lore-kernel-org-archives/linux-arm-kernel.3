Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CFEC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 04:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8Jpi5dvbsyJ9QNrNx2h/R0ed7l3DEYZ+0/PjrpQmlY=; b=YeyzeGuiGTA4MIyXbHI62HQD5x
	VOX35SCFzcg6cMSlxvbam2KmlEo/60TGbRfiBD+OwLgZsXeAOpPyh2IItc8wSjufHhQOmQvjy9M0g
	0+4Xq2xkCMqD4Vox3l2Fy/s2N6E6zc466JuV8NvGeUDMXyGjQM1NdL4T4jHAQHnHDvfRKsrsB6aFh
	PILq8G15zlRk1/nMMDQ/qjvODV9wC0qAfGmshomxM5dNNmp5yl8n/lr7VoMZldiCKH4b5KeETERra
	tJOMwkPh7k9GdSehGG6bd+iQWkk7TpSC9+PUHICg4Y7akwfIT/bILL4UaWBqeXWMVlVuWY26KPiK9
	D/UahSjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toxAD-0000000H8mB-0heG;
	Mon, 03 Mar 2025 04:12:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tox8d-0000000H8g2-1Dd6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 04:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740975041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F8Jpi5dvbsyJ9QNrNx2h/R0ed7l3DEYZ+0/PjrpQmlY=;
	b=Eta9XoIS0bJ/Mg7IYBqHf6lxXXy22zc34EhpmdHctqCPu6d8K3tIk22Fw4uN8ztOYoyZQJ
	6/WSJnkyy5nyvO3O99h+sLG1yKSXe66X+u0lHa84zyTYDvmGAYE704WWzqwIj9kYSmWN7C
	tbDyr00a7+tGm09LZ6k/LN4wFp6fx/g=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-FcN6DAAgNeCI4rCIKLAhDA-1; Sun, 02 Mar 2025 23:10:35 -0500
X-MC-Unique: FcN6DAAgNeCI4rCIKLAhDA-1
X-Mimecast-MFC-AGG-ID: FcN6DAAgNeCI4rCIKLAhDA_1740975034
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22380c707d3so24296575ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 20:10:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740975034; x=1741579834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F8Jpi5dvbsyJ9QNrNx2h/R0ed7l3DEYZ+0/PjrpQmlY=;
        b=qyFBD6xHkkHgL5UI1vuta3urY8nlObhIUbnvF76IgAsKiLWchM7tmzppl/gPwxLK2r
         DCwwSInaRkgnFC2xKi77H1XYESn77f8bCfBHQp7qrBEXrHYV7E1/UTu7goEdGgwXHPAX
         O7EZK64ccPo6TfRuvxB6FDyqW1it0HGdA1/VvYk7JJp338TuWehNPG5E8UgVQMAcfvhb
         1SUEi8R6rlTeRr1znvN/LiA8pxmdZm5E3jP9FSwMGsnAIaegHRpiQzg9SvbY/6myCKKG
         wxN9GTVgj1VSS+K8oRHyLSLllsTwhdCAxHXd6Z63whx5YUqAg1DPnBSw2NDCHqGKC5MW
         Ub8g==
X-Forwarded-Encrypted: i=1; AJvYcCV5cDpIp1KU+X0+QPoY2K7yvTl2mFzqH3suwMhvOWg4p5+wVequRKUurKhxUJ4ca97oLrWogyGt/ftVOwGi5d8p@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5exethSZ3Y/dKemDdkWHyUHGZLwuMsjKko8miFJj7hOUUIVm9
	dA5Z0vHxegOZo5m119/SV68/8iJ2v6jjtKE4ICU4kBFdWKnP/4psTt+4+/Qsy2ztqYsV46LHuxn
	q+HIvlTNGqujjRDK6aplu+r8apbjoqGIOJTP2s6brCuMGQFulWtbf8tD41CSi67bSOqJUnKvp
X-Gm-Gg: ASbGncsOKENIkzw1isYD2yUO4cI87iFSL9bAV+wqKe+5leG8I8OclKiW8Utudts4SRJ
	RLbX7dO3GyH1PXB1ZEbIw0E3CGT5sZGXtzwVFmb2rh4QTgXAQ/cXiDOXyyK/mWWqkWqmprSBfUk
	9G8J+wj8/Q5lurycXOMbwBuHHIxTsy+jXaAcBt7KjT344vh2mj4BICyPawteB2dbB96s+aV3O/4
	Nwmuk0XpDx+kjkc9kwbOE/QCMTSwvSYnY7Ia7si+oT6kd92AymtgDMc6sBaGUZPJF07ylMbd5mu
	XYdf0g/gxEMimD9SVA==
X-Received: by 2002:a17:902:fc4f:b0:220:f509:686a with SMTP id d9443c01a7336-22368fbeaffmr188469635ad.29.1740975034357;
        Sun, 02 Mar 2025 20:10:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEw8k64wqsi9xaJMniYJ96OZyxXCWbCHDZik8qo7jA9iBAMykPZRI5AC4LCj7ThWiPsfJiuoQ==
X-Received: by 2002:a17:902:fc4f:b0:220:f509:686a with SMTP id d9443c01a7336-22368fbeaffmr188469335ad.29.1740975034020;
        Sun, 02 Mar 2025 20:10:34 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d26acsm68417915ad.9.2025.03.02.20.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 20:10:33 -0800 (PST)
Message-ID: <e130dd51-330e-43ef-b86f-41fd96cc9ec3@redhat.com>
Date: Mon, 3 Mar 2025 14:10:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/45] arm64: RME: Define the user ABI
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
 <20250213161426.102987-8-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-8-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g4WL4eyvLOl3VzOiqUBxorCo7AJRoUhYAA6-WLkza98_1740975034
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_201043_414008_7707AB4F 
X-CRM114-Status: GOOD (  24.38  )
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
> There is one (multiplexed) CAP which can be used to create, populate and
> then activate the realm.
> 
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v6:
>   * Rename some of the symbols to make their usage clearer and avoid
>     repetition.
> Changes from v5:
>   * Actually expose the new VCPU capability (KVM_ARM_VCPU_REC) by bumping
>     KVM_VCPU_MAX_FEATURES - note this also exposes KVM_ARM_VCPU_HAS_EL2!
> ---
>   Documentation/virt/kvm/api.rst    |  1 +
>   arch/arm64/include/uapi/asm/kvm.h | 49 +++++++++++++++++++++++++++++++
>   include/uapi/linux/kvm.h          | 12 ++++++++
>   3 files changed, 62 insertions(+)
> 

The newly added ioctl commands need to be documented in Documentation/virt/kvm/api.rst.
Section 4 would be the right place for it. Other than that, it looks good to me except
the ioctl commands need to be fixed as suggested by Aneesh.

Thanks,
Gavin

> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 0d1c3a820ce6..06763d89c0d7 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -5094,6 +5094,7 @@ Recognised values for feature:
>   
>     =====      ===========================================
>     arm64      KVM_ARM_VCPU_SVE (requires KVM_CAP_ARM_SVE)
> +  arm64      KVM_ARM_VCPU_REC (requires KVM_CAP_ARM_RME)
>     =====      ===========================================
>   
>   Finalizes the configuration of the specified vcpu feature.
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index 568bf858f319..7eae0b1a482e 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -105,6 +105,7 @@ struct kvm_regs {
>   #define KVM_ARM_VCPU_PTRAUTH_ADDRESS	5 /* VCPU uses address authentication */
>   #define KVM_ARM_VCPU_PTRAUTH_GENERIC	6 /* VCPU uses generic authentication */
>   #define KVM_ARM_VCPU_HAS_EL2		7 /* Support nested virtualization */
> +#define KVM_ARM_VCPU_REC		8 /* VCPU REC state as part of Realm */
>   
>   struct kvm_vcpu_init {
>   	__u32 target;
> @@ -415,6 +416,54 @@ enum {
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
> index 45e6d8fca9b9..fa8f45029dff 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -930,6 +930,8 @@ struct kvm_enable_cap {
>   #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
>   #define KVM_CAP_X86_GUEST_MODE 238
>   
> +#define KVM_CAP_ARM_RME 300 /* FIXME: Large number to prevent conflicts */
> +
>   struct kvm_irq_routing_irqchip {
>   	__u32 irqchip;
>   	__u32 pin;
> @@ -1581,4 +1583,14 @@ struct kvm_pre_fault_memory {
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
> +/* FIXME: Update nr (0xd2) when merging */
> +#define KVM_ARM_VCPU_RMM_PSCI_COMPLETE	_IOW(KVMIO, 0xd2, struct kvm_arm_rmm_psci_complete)
> +
>   #endif /* __LINUX_KVM_H */


