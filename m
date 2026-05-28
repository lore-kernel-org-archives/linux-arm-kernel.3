Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B37FCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 06:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mmDhoG17mw4NgiWZMgx23xHdUQBzuYviNZS63oMCAI=; b=40WvjpB/3+Z3cF5cWmOIV+UVPp
	2Vtkncyc5aYAmAiRVG1y1ZHynzGvxo37iZF9DsbNf6UhKWW11U85NpDURn2/wehpMfmp70pKaXXgd
	PfDcL9+PlMcUF9QpSH6iESwiC//y4L8XV6xb1VvMmnrpI6A5y4DiPrA8AGFSFef7E0M4p2OwdU0OO
	amEJHWTEEX9qlXLl8xsVBKQdWz5p56EWvDYxIyrdLfncX4pSA+SHfO1/oTXEIWUORVJa5hO4EfGfu
	ZIk5lSPYbl5LQJdnlQJSbREUqUyBMVlxvfKG45q0velV4VWfTBWL5SdyGhLJAYADbmq6wyZ0kYC84
	L9K+RVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUeL-00000005ERN-34Fi;
	Thu, 28 May 2026 06:55:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUeI-00000005EQr-408K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 06:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779951321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5mmDhoG17mw4NgiWZMgx23xHdUQBzuYviNZS63oMCAI=;
	b=KwLoRPhvQNGrBSFMTwsyRynXML2CBXGc+HacSxn2fxDFWLQbPN1zz8yHhWcE3/BFkwBveY
	JDc/IGN+8XjIC2ogkCMHQoxVuRu9qbWc8+lkHavZ30IOdyGkpnEU7/GQmix0ZddiM60MJ5
	vhLwR0XXbg7AXP9HeLrCt468hsxcRDw=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-uaU_ls0iPP6eut-t6NVKMQ-1; Thu, 28 May 2026 02:55:19 -0400
X-MC-Unique: uaU_ls0iPP6eut-t6NVKMQ-1
X-Mimecast-MFC-AGG-ID: uaU_ls0iPP6eut-t6NVKMQ_1779951319
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c829366cf25so16148076a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 23:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779951318; x=1780556118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mmDhoG17mw4NgiWZMgx23xHdUQBzuYviNZS63oMCAI=;
        b=cceSGwrRh76NKE34zYhC+vDqswpo8lWk+3I1SUQEa+dbmbLQ12fCAM3BoCSgSdQ5Nm
         qvlqvBTC7Az/LjgYbq2gMe2/laTPBN9R3DbJypcpSp5/oJxWdK1f30AkvZ0CVo50rCWM
         83RFT2QpuxeNk11qPVNgoNPJORXkZXQNeGT2d7pFjWdRFdjSAX/QibBRL0q6ONAiqEMc
         Jbo80gXEG/XzusmIw9JcGeAn0wWO0ht3XgXdFVgfL/MS60PG8qtd5guI3wnft63NvWXg
         +dseqmezhuz5Cz4PY3WgpHPIZkMx25C6byaeonHNs5qlYLt/4+XPpVyW8pDO0CdH5N5N
         eYQA==
X-Forwarded-Encrypted: i=1; AFNElJ8LWan6+wHQP2tN/EWyd2KVUmLSuSFMvxpHwgof/Nyto3TTLQgKV2hvJewVLx8NA7HEaANWcu4clIiQAvDN3Pue@lists.infradead.org
X-Gm-Message-State: AOJu0YxC3dA/Slk+GD4UmSb5cenf+0mYXOZaRc3xzZ/g/ZF7GEBfKDRm
	4zxRHtxVo8Z/2rUU0cXfDGQCcGwZC382lYVv8SKxF29121/9ZGGsOmg3BmYYlgvnlTHAEu6vVVY
	+SSaZ4EVj4dPjjjaWNt+231/2qx9O29QAxOCkX7JTXc5CUv7XCfLIdJ1ygV/rnwdV3iYNVfKFO/
	GN
X-Gm-Gg: Acq92OFv6vnbH6YDLVRYojQ+QtFzv57YWjFk1bhNO1q/41HCsa9LUouEHct6UCki21p
	1bf45d1ie5JRuv8iH5RvwV3/Wkp0w/4xzG7J+XgF6ETBBMowgB9rxyKGql/LZhtxZng69FqRQct
	e7FbHd3OveJB88m/XqIut04jJ4oFrxNyEDactOulha4CnpuhPkEr8RIgB+2ypXOneyXhn4GeAnY
	Dg1fqrlAQtT00YsewJB0oDf0IBMXKaZ3gYmdWSBpfKi9/ttWaUJnLNqhwHR+ItPXEF5T4ocSy5m
	NGcwhu1YAFht1Vh5geL1iB8W7MKRv9NyiQcnXDrkOKUZHKTWjICXdQ17Qx6G4ZHUVP58uQEzDeA
	df9f6i3yM0RPfrWWK5mZMZX9gnAwvrTYUer0dM3/3n5gL+Hky5Ym4gRhww8BJwps0FVjtE0QTKU
	w=
X-Received: by 2002:a05:6a00:13a5:b0:82f:6858:3f6 with SMTP id d2e1a72fcca58-8415ef53fd6mr25752355b3a.0.1779951318541;
        Wed, 27 May 2026 23:55:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a5:b0:82f:6858:3f6 with SMTP id d2e1a72fcca58-8415ef53fd6mr25752335b3a.0.1779951318036;
        Wed, 27 May 2026 23:55:18 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7301255sm4623141b3a.57.2026.05.27.23.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 23:55:17 -0700 (PDT)
Message-ID: <775a0d29-4d92-4ecc-96dd-5b0eaeff1528@redhat.com>
Date: Thu, 28 May 2026 16:55:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 32/44] KVM: arm64: Handle Realm PSCI requests
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-33-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260513131757.116630-33-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hQJTB85CSxacCPixXGx5mW1lFXZgy2_QZ8cZSA-8qJg_1779951319
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_235523_071862_5E089074 
X-CRM114-Status: GOOD (  31.78  )
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

Hi Steve,

On 5/13/26 11:17 PM, Steven Price wrote:
> The RMM needs to be informed of the target REC when a PSCI call is made
> with an MPIDR argument.
> 
> This requirement will be removed in a future release of the RMM 2.0
> specification but is still required for v2.0-bet1.
> 
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Chanegs since v13:
>   * The ioctl KVM_ARM_VCPU_RMI_PSCI_COMPLETE has gone. The RMI call is
>     made automatically just before entering the REC again.
> Changes since v12:
>   * Chance return code for non-realms to -ENXIO to better represent that
>     the ioctl is invalid for non-realms (checkpatch is insistent that
>     "ENOSYS means 'invalid syscall nr' and nothing else").
> Changes since v11:
>   * RMM->RMI renaming.
> Changes since v6:
>   * Use vcpu_is_rec() rather than kvm_is_realm(vcpu->kvm).
>   * Minor renaming/formatting fixes.
> ---
>   arch/arm64/include/asm/kvm_rmi.h |  3 ++
>   arch/arm64/kvm/psci.c            | 15 ++++++++-
>   arch/arm64/kvm/rmi.c             | 58 ++++++++++++++++++++++++++++++++
>   3 files changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
> index b65cfec10dee..eacf82a7467d 100644
> --- a/arch/arm64/include/asm/kvm_rmi.h
> +++ b/arch/arm64/include/asm/kvm_rmi.h
> @@ -109,6 +109,9 @@ int realm_map_non_secure(struct realm *realm,
>   			 unsigned long size,
>   			 enum kvm_pgtable_prot prot,
>   			 struct kvm_mmu_memory_cache *memcache);
> +int realm_psci_complete(struct kvm_vcpu *source,
> +			struct kvm_vcpu *target,
> +			unsigned long status);
>   
>   static inline bool kvm_realm_is_private_address(struct realm *realm,
>   						unsigned long addr)
> diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
> index 3b5dbe9a0a0e..a2cd55dc7b5b 100644
> --- a/arch/arm64/kvm/psci.c
> +++ b/arch/arm64/kvm/psci.c
> @@ -103,7 +103,6 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
>   
>   	reset_state->reset = true;
>   	kvm_make_request(KVM_REQ_VCPU_RESET, vcpu);
> -

This change isn't supposed to be part of this patch :-)

>   	/*
>   	 * Make sure the reset request is observed if the RUNNABLE mp_state is
>   	 * observed.
> @@ -142,6 +141,20 @@ static unsigned long kvm_psci_vcpu_affinity_info(struct kvm_vcpu *vcpu)
>   	/* Ignore other bits of target affinity */
>   	target_affinity &= target_affinity_mask;
>   
> +	if (vcpu_is_rec(vcpu)) {
> +		struct kvm_vcpu *target_vcpu;
> +
> +		/* RMM supports only zero affinity level */
> +		if (lowest_affinity_level != 0)
> +			return PSCI_RET_INVALID_PARAMS;
> +
> +		target_vcpu = kvm_mpidr_to_vcpu(kvm, target_affinity);
> +		if (!target_vcpu)
> +			return PSCI_RET_INVALID_PARAMS;
> +
> +		return PSCI_RET_SUCCESS;
> +	}
> +
>   	/*
>   	 * If one or more VCPU matching target affinity are running
>   	 * then ON else OFF
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index 761b38a4071c..2b03e962ee41 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -3,6 +3,7 @@
>    * Copyright (C) 2023-2025 ARM Ltd.
>    */
>   
> +#include <uapi/linux/psci.h>
>   #include <linux/kvm_host.h>
>   
>   #include <asm/kvm_emulate.h>
> @@ -127,6 +128,25 @@ static void free_rtt(phys_addr_t phys)
>   	kvm_account_pgtable_pages(phys_to_virt(phys), -1);
>   }
>   
> +int realm_psci_complete(struct kvm_vcpu *source, struct kvm_vcpu *target,
> +			unsigned long status)
> +{
> +	int ret;
> +
> +	/*
> +	 * XXX: RMM-v2.0 doesn't require the target REC address for completing
> +	 * PSCI requests. Temporary hack until RMM implementation catches up
> +	 * to the full spec.
> +	 */
> +	ret = rmi_psci_complete(virt_to_phys(source->arch.rec.rec_page),
> +				virt_to_phys(target->arch.rec.rec_page),
> +				status);
> +	if (ret)
> +		return -EINVAL;

		return -ENXIO;

> +
> +	return 0;
> +}
> +
>   static int realm_rtt_create(struct realm *realm,
>   			    unsigned long addr,
>   			    int level,
> @@ -1004,6 +1024,41 @@ static void kvm_complete_ripas_change(struct kvm_vcpu *vcpu)
>   	rec->run->exit.ripas_base = base;
>   }
>   
> +static void kvm_rec_complete_psci(struct kvm_vcpu *vcpu)
> +{
> +	struct rec_run *run = vcpu->arch.rec.run;
> +	unsigned long status = PSCI_RET_DENIED;
> +	unsigned long ret = vcpu_get_reg(vcpu, 0);
> +	struct kvm_vcpu *target;
> +
> +	switch (run->exit.gprs[0]) {
> +	/*
> +	 * XXX: RMM-v2.0 doesn't cause RMI_EXIT_PSCI for AFFINITY_INFO
> +	 * Temporary hack until tf-RMM gets the REC to MPIDR mapping via
> +	 * RD Auxiliary granules.
> +	 * For now always report SUCCESS
> +	 */
> +	case PSCI_0_2_FN64_AFFINITY_INFO:
> +		status = PSCI_RET_SUCCESS;
> +		break;
> +	case PSCI_0_2_FN64_CPU_ON: {
> +		if (ret != PSCI_RET_SUCCESS &&
> +		    ret != PSCI_RET_ALREADY_ON)
> +			status = PSCI_RET_DENIED;
> +		else
> +			status = PSCI_RET_SUCCESS;
> +		break;
> +	}
> +	default:
> +		return;
> +	}
> +
> +	target = kvm_mpidr_to_vcpu(vcpu->kvm, run->exit.gprs[1]);
> +	/* RMM makes sure that we don't get RMI_EXIT_PSCI for invalid mpidrs */
> +	if (target)
> +		realm_psci_complete(vcpu, target, status);
> +}
> +
>   /*
>    * kvm_rec_pre_enter - Complete operations before entering a REC
>    *
> @@ -1028,6 +1083,9 @@ int kvm_rec_pre_enter(struct kvm_vcpu *vcpu)
>   		for (int i = 0; i < REC_RUN_GPRS; i++)
>   			rec->run->enter.gprs[i] = vcpu_get_reg(vcpu, i);
>   		break;
> +	case RMI_EXIT_PSCI:
> +		kvm_rec_complete_psci(vcpu);
> +		break;
>   	case RMI_EXIT_RIPAS_CHANGE:
>   		kvm_complete_ripas_change(vcpu);
>   		break;

Thanks,
Gavin


