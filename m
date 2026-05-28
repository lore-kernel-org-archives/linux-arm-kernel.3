Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4552DCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 05:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q73WX9HWItM842HL8te6BLbm9UQjrRb26yA0hD3pI7M=; b=ykkqER0UZzahaX/RWaJ2jLxELW
	SI2hd+708PGBrqERPiEwQd92bbFui8A4F1sty0ElyyywJ7hbxlS+J9lewi1ln7UU/SgGzKxe4LIf2
	NMEhndU8cIUaXdKQtCT9FRIM6EqOWlwCVbcTs4dK70EZ1cm4Dwfn2o05fh43ZWX3iDhCuMxP+2HaK
	BaNTylgvllv7ZYbBUs7hkYX3Gh/3GzocpOaBNEL37sLr7li1UYsOmpP/f2QaRbv/D2qR6X79dYwvB
	gwbqTOOEffrKL8+2h8/8DI5d2QNCkItyJL0ahIyiaOiOi3NzjnOwa21xxo0ihETplJSZjSJeNKtCo
	ByY99Y2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTKI-000000059Gm-3dy6;
	Thu, 28 May 2026 05:30:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTKF-000000059GA-3QS8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 05:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779946234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q73WX9HWItM842HL8te6BLbm9UQjrRb26yA0hD3pI7M=;
	b=Qa6Gis8BG1wUGDSH62+t+2Tlwjygubw1RSeXwSNm5LryKxXY0WB95vzYad0xD3s8fSqzRb
	ghLLKYGzhlndFD/dE0XT5m+EaanMLlyJil0Z/Gt6XpHgLNl2QhIg/006MIQ8vhiZrMx4Fh
	054RR9oi7fjT9RrI0m2ukVAFXWz6oXY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-DyRuiLnpM025lFgQyYXV_A-1; Thu, 28 May 2026 01:30:33 -0400
X-MC-Unique: DyRuiLnpM025lFgQyYXV_A-1
X-Mimecast-MFC-AGG-ID: DyRuiLnpM025lFgQyYXV_A_1779946232
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b99eb06178so37068045ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 22:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779946232; x=1780551032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q73WX9HWItM842HL8te6BLbm9UQjrRb26yA0hD3pI7M=;
        b=RaTLx6XaH4ixdJ4UeU/i5CM7xT30z8S9OlnCUzGfXbU7Lbx33UbVpaxlr7dGOKOoxU
         P/URn9IbPx2huEqw1x/8GABnw47UwI3DXvgMY7MZTVNLgSUaZFa13UrrRG9CthwVVoJj
         W0to0IR+gFY5KEyVjyFNKOQJ0fphxGV+eHVUzou6Ct6vMmwgvDjzoEP4x+7t+tk8uqow
         ajph5J3lnwxO5TamZeOfCTM9iT3seAk7MuVzwmGYSdP+7ArDFWYIRU/OFC6AJIC+OU/a
         jduQ5q4NW2MuldK0DbdhEctlTYRA1FqGasO/IcMAVel0YZObRchxdzO4HdT6ePYhBm5x
         0Txg==
X-Forwarded-Encrypted: i=1; AFNElJ9tu2Y0wQxr6R6XG42ptq2hebi/Zm7Q5DH5hKBqFqil+lgnZd8468Zal+c8RiDKlurMUrlg91jBdP2bT7hs8XpA@lists.infradead.org
X-Gm-Message-State: AOJu0YxkHVAdz5kQesknBWrxXTEeqPkfF2ILpTMzb1U28UCiaVLPgfmD
	YN+V5QRajltQiXPMmE0cOfP+hSLf9r7DRgI3f/EodLQ3ls3DlHMWRJIGB390l34Vi5wSj2wfhMq
	20bV+oStHtPWfc+EBhMH5eitphr24wWjbwH1oxNl+D707P5J54d6p+ukFmQLYZdyfIzFkGPdq0z
	X0
X-Gm-Gg: Acq92OFp09t81th+lpV4eJIlm9S6tlaO1mSdMe593+t9PZXe3mEeWW172sMT3vCon4F
	WrSNTIT1Z9iywxEP9uUqcIfIv/oO7HZYLSMqCCZWWAV67orpWDXfRhwMD7abkFSEs3OUoq7e1eo
	eYwj/6MN8ehVUP0879w3EB8sstPt/uLPTSxM5Xc6eY0MmlGn/Vn8zYYI5PCbapZ/IQHtxFclKn8
	cy9ZZqpw+sLRoyCUgoCZTAuszgRGRkQCJ5E+oJfPpheeOlqNPyVfTpSjo0B8YhSDgWWGvZL7NQ2
	YMteJmNQG1coWwaAQoJtFcAtTqHpT87wKnYKZ/Vtk/R/2LdV2dCUe2I960EGFnKwFcmelgNvuvQ
	gGnMu9dwkN7rp98Phkn4OXjlC8l+29AUI2fl5rP8aKkVAuIWq/OU+13X+vFHmz7Um/hBgTy/4E2
	o=
X-Received: by 2002:a17:903:4b07:b0:2bd:5b20:a5b5 with SMTP id d9443c01a7336-2beb066cd73mr260282125ad.37.1779946232108;
        Wed, 27 May 2026 22:30:32 -0700 (PDT)
X-Received: by 2002:a17:903:4b07:b0:2bd:5b20:a5b5 with SMTP id d9443c01a7336-2beb066cd73mr260281545ad.37.1779946231485;
        Wed, 27 May 2026 22:30:31 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d2702sm173761155ad.31.2026.05.27.22.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 22:30:30 -0700 (PDT)
Message-ID: <ea4be6c5-9506-4253-80c5-c76c9ac3b77d@redhat.com>
Date: Thu, 28 May 2026 15:30:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 26/44] arm64: RMI: Allow populating initial contents
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
 <20260513131757.116630-27-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260513131757.116630-27-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RALcHGtZ1V8q7cKdtGU2UKMFHCfbMrtoM_ptJFtL5b8_1779946232
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_223035_937280_09AB0EB5 
X-CRM114-Status: GOOD (  31.39  )
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
> The VMM needs to populate the realm with some data before starting (e.g.
> a kernel and initrd). This is measured by the RMM and used as part of
> the attestation later on.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v13:
>   * Rename realm_create_protected_data_page() to realm_data_map_init().
> Changes since v12:
>   * The ioctl now updates the structure with the amount populated rather
>     than returning this through the ioctl return code.
>   * Use the new RMM v2.0 range based RMI calls.
>   * Adapt to upstream changes in kvm_gmem_populate().
> Changes since v11:
>   * The multiplex CAP is gone and there's a new ioctl which makes use of
>     the generic kvm_gmem_populate() functionality.
> Changes since v7:
>   * Improve the error codes.
>   * Other minor changes from review.
> Changes since v6:
>   * Handle host potentially having a larger page size than the RMM
>     granule.
>   * Drop historic "par" (protected address range) from
>     populate_par_region() - it doesn't exist within the current
>     architecture.
>   * Add a cond_resched() call in kvm_populate_realm().
> Changes since v5:
>   * Refactor to use PFNs rather than tracking struct page in
>     realm_create_protected_data_page().
>   * Pull changes from a later patch (in the v5 series) for accessing
>     pages from a guest memfd.
>   * Do the populate in chunks to avoid holding locks for too long and
>     triggering RCU stall warnings.
> ---
>   arch/arm64/include/asm/kvm_rmi.h |   4 ++
>   arch/arm64/kvm/Kconfig           |   1 +
>   arch/arm64/kvm/arm.c             |  13 ++++
>   arch/arm64/kvm/rmi.c             | 106 +++++++++++++++++++++++++++++++
>   4 files changed, 124 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
> index 007249a13dbc..a2b6bc412a22 100644
> --- a/arch/arm64/include/asm/kvm_rmi.h
> +++ b/arch/arm64/include/asm/kvm_rmi.h
> @@ -88,6 +88,10 @@ int kvm_rec_enter(struct kvm_vcpu *vcpu);
>   int kvm_rec_pre_enter(struct kvm_vcpu *vcpu);
>   int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_status);
>   
> +struct kvm_arm_rmi_populate;
> +
> +int kvm_arm_rmi_populate(struct kvm *kvm,
> +			 struct kvm_arm_rmi_populate *arg);
>   void kvm_realm_unmap_range(struct kvm *kvm,
>   			   unsigned long ipa,
>   			   unsigned long size,
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index 4e16719fda22..d0cd011cf672 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -38,6 +38,7 @@ menuconfig KVM
>   	select GUEST_PERF_EVENTS if PERF_EVENTS
>   	select KVM_GUEST_MEMFD
>   	select KVM_GENERIC_MEMORY_ATTRIBUTES
> +	select HAVE_KVM_ARCH_GMEM_POPULATE
>   	help
>   	  Support hosting virtualized guest machines.
>   
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index ed88a203b892..073ba9181da9 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -2131,6 +2131,19 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>   			return -EFAULT;
>   		return kvm_vm_ioctl_get_reg_writable_masks(kvm, &range);
>   	}
> +	case KVM_ARM_RMI_POPULATE: {
> +		struct kvm_arm_rmi_populate req;
> +		int ret;
> +
> +		if (!kvm_is_realm(kvm))
> +			return -ENXIO;
> +		if (copy_from_user(&req, argp, sizeof(req)))
> +			return -EFAULT;
> +		ret = kvm_arm_rmi_populate(kvm, &req);
> +		if (copy_to_user(argp, &req, sizeof(req)))
> +			return -EFAULT;
> +		return ret;
> +	}

s/return ret/return 0; The variable 'ret' can be dropped.

>   	default:
>   		return -EINVAL;
>   	}
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index a89873a5eb77..209087bcf399 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -486,6 +486,75 @@ void kvm_realm_unmap_range(struct kvm *kvm, unsigned long start,
>   		realm_unmap_private_range(kvm, start, end, may_block);
>   }
>   
> +static int realm_data_map_init(struct kvm *kvm, unsigned long ipa,
> +			       kvm_pfn_t dst_pfn, kvm_pfn_t src_pfn,
> +			       unsigned long flags)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +	phys_addr_t rd = virt_to_phys(realm->rd);
> +	phys_addr_t dst_phys, src_phys;
> +	int ret;
> +
> +	dst_phys = __pfn_to_phys(dst_pfn);
> +	src_phys = __pfn_to_phys(src_pfn);
> +
> +	if (rmi_delegate_page(dst_phys))
> +		return -ENXIO;
> +
> +	ret = rmi_rtt_data_map_init(rd, dst_phys, ipa, src_phys, flags);
> +	if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
> +		/* Create missing RTTs and retry */
> +		int level = RMI_RETURN_INDEX(ret);
> +
> +		KVM_BUG_ON(level == KVM_PGTABLE_LAST_LEVEL, kvm);

		KVM_BUG_ON(level >= KVM_PGTABLE_LAST_LEVEL, kvm);> +
> +		ret = realm_create_rtt_levels(realm, ipa, level,
> +					      KVM_PGTABLE_LAST_LEVEL, NULL);
> +		if (!ret) {
> +			ret = rmi_rtt_data_map_init(rd, dst_phys, ipa, src_phys,
> +						    flags);
> +		}
> +	}
> +
> +	if (ret) {
> +		if (WARN_ON(rmi_undelegate_page(dst_phys))) {
> +			/* Undelegate failed, so we leak the page */
> +			get_page(pfn_to_page(dst_pfn));
> +		}
> +	}
> +

	if (ret && WARN_ON(rmi_undelegate_page(dst_phys)) {
		/* Leak the page that fails to be undelegated */
		get_page(pfn_to_page(dst_pfn));
	}

> +	return ret;
> +}
> +
> +static int populate_region_cb(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
> +			      struct page *src_page, void *opaque)
> +{
> +	unsigned long data_flags = *(unsigned long *)opaque;
> +	phys_addr_t ipa = gfn_to_gpa(gfn);
> +
> +	if (!src_page)
> +		return -EOPNOTSUPP;
> +
> +	return realm_data_map_init(kvm, ipa, pfn, page_to_pfn(src_page),
> +				   data_flags);
> +}
> +
> +static long populate_region(struct kvm *kvm,
> +			    gfn_t base_gfn,
> +			    unsigned long pages,
> +			    u64 uaddr,
> +			    unsigned long data_flags)
> +{
> +	long ret = 0;
> +
> +	mutex_lock(&kvm->slots_lock);
> +	ret = kvm_gmem_populate(kvm, base_gfn, u64_to_user_ptr(uaddr), pages,
> +				populate_region_cb, &data_flags);
> +	mutex_unlock(&kvm->slots_lock);
> +
> +	return ret;
> +}
> +
>   enum ripas_action {
>   	RIPAS_INIT,
>   	RIPAS_SET,
> @@ -574,6 +643,43 @@ static int realm_ensure_created(struct kvm *kvm)
>   	return -ENXIO;
>   }
>   
> +int kvm_arm_rmi_populate(struct kvm *kvm,
> +			 struct kvm_arm_rmi_populate *args)
> +{
> +	unsigned long data_flags = 0;
> +	unsigned long ipa_start = args->base;
> +	unsigned long ipa_end = ipa_start + args->size;
> +	long pages_populated;
> +	int ret;
> +
> +	if (args->reserved ||
> +	    (args->flags & ~KVM_ARM_RMI_POPULATE_FLAGS_MEASURE) ||
> +	    !IS_ALIGNED(ipa_start, PAGE_SIZE) ||
> +	    !IS_ALIGNED(ipa_end, PAGE_SIZE) ||
> +	    !IS_ALIGNED(args->source_uaddr, PAGE_SIZE))
> +		return -EINVAL;
> +

There are more conditions missed here:

	args->size == 0, return 0;
	args->base + args->size < args->base, return -EINVAL;  // wrapped range

> +	ret = realm_ensure_created(kvm);
> +	if (ret)
> +		return ret;
> +
> +	if (args->flags & KVM_ARM_RMI_POPULATE_FLAGS_MEASURE)
> +		data_flags |= RMI_MEASURE_CONTENT;
> +
> +	pages_populated = populate_region(kvm, gpa_to_gfn(ipa_start),
> +					  args->size >> PAGE_SHIFT,
> +					  args->source_uaddr, data_flags);
> +
> +	if (pages_populated < 0)
> +		return pages_populated;

pages_populaged is 'unsigned long', this function returns a 'int' value.

> +
> +	args->size -= pages_populated << PAGE_SHIFT;
> +	args->source_uaddr += pages_populated << PAGE_SHIFT;
> +	args->base += pages_populated << PAGE_SHIFT;
> +
> +	return 0;
> +}
> +
>   static void kvm_complete_ripas_change(struct kvm_vcpu *vcpu)
>   {
>   	struct kvm *kvm = vcpu->kvm;

Thanks,
Gavin


