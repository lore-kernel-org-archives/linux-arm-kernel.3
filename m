Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E411CC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 05:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8NQ+qKZ44E29enCPM7Eb/wfq67YXGlkr0AyFJChf4s=; b=vp8KLUCxdEhqypOJ6KxUXf1LF6
	qUD4TrzZMzo7uCYwdcUbnxsc+y9NsoibsP7Z9FHLGAPYIq1PkC1WkTO/V1Gz9qD0btSjzB+Q0HjEy
	pegkr86gzyqT+WIX2IS6jwF7FlumcwOs2GOWgKlE6u4V+8GMkBAG6iQNjHu0qixzC0s4bpzRkYha7
	+FhNG60B/6tPp5HHFyqwZhfzR4/k/oDtjL54lbmTMBj+w4A8ln4Y/JoJUdII8O1n+f5r+W4rjTKsx
	CDMo7o4ZTyDn12ZPuA/9bAQ4EVzpxDCVAtDwiZ1I3Ac5ZvLbvGuiLkxCg7zjwDGmu0XP+AbTsUVli
	WsBpdcuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKno-000000038JM-2lgd;
	Tue, 04 Mar 2025 05:26:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKXm-000000035ij-0iCp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 05:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741065012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U8NQ+qKZ44E29enCPM7Eb/wfq67YXGlkr0AyFJChf4s=;
	b=V9jnYijiXnU9qgnav4EdlqgYSO287yZ6l420/NPVpt9PPJ18dgBP7mPuAoNV585GWbPjtR
	CluNaCqL7PNJkFrK4Cw3w4E5hffORwilQ7qk+vFv+XsDXkHp2rmVjJlMKR+VRXHi2533Gd
	Bc/7fnERMw4rz3wEEsyb2u04LQgMWKg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-dU_S1VJfNEO-UrFMDwwUPQ-1; Tue, 04 Mar 2025 00:10:10 -0500
X-MC-Unique: dU_S1VJfNEO-UrFMDwwUPQ-1
X-Mimecast-MFC-AGG-ID: dU_S1VJfNEO-UrFMDwwUPQ_1741065009
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2feda472a7bso4772403a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 21:10:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741065009; x=1741669809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8NQ+qKZ44E29enCPM7Eb/wfq67YXGlkr0AyFJChf4s=;
        b=QTlIAapvgsV+0C65RDoXFY79ltXjaWGaigf8l+It/Npv41DeXurT5P3IkXaj9SsB84
         dFsVAVzBc5UQT+q1NTl8Cdj9gKrdb9FVlJ2WJUzDK9O481ZRq+NxQNJU/kOYD/Xny6mI
         XMzvKtLBqdQD+ED0HP5c6vgN1y2RGCnJRTRSxILNbtVvngrclY4yQZ58hKoUfhSJPTN0
         +YPh8YzS6KecL7wligAWM5oVB2RJNy1U7/S+2HVbItu4LEhq+THLCXekgDn61IeUpXOc
         qyEDmLZFHyBTy7FWH4ZyuOs2uzQ/Fucie/IsQ9TK/bQYQmyiVrVQs2Q/X3ta8K+8YC29
         RYBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtiX8uUUQs67ynAjSuQKsXWIKRBPYB+NyrOJPpaeBszhOLl0lIrsdpzSkkHWsfnb8Wyyd5uy4QNzzqDmhLhp0C@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6/WwzQTN/YC/MG4DReeHLB2RTzPF1AALLYdWlYwkiSvPOV0jy
	YgSpq6mbwsxOYAB5fXzHoGgNnuDDVszdP8XtESF/fivyK7Gr67429a54U0siBuyhgYEXuatFm1b
	tZkGlGmgEiVpL7Vs+kdPwG8jAtsNIfStxILqOLWFtwBoRB3k9j+wVWshsOV0J7AoRBF7dyUfG
X-Gm-Gg: ASbGnctc/C6b6YVVhF3BTEZMXGRScF0ax1OyIOvhLhfiHrXIE4ZrnH/QZCI9e6yIEi1
	WyIHFMZaoQOx28nGq+cAv8b6vp2Uxjc3z88Si6TXrb7LhRb0ntY+ws5ZN7aROnm7rwJMEgHSMBF
	YOmZUfSznpgC9kAji8iJS45Tg4O95anph9fSUxgWAmuJmUCJudMdCvOTLl+rC+TV2ZyGsN/lyS5
	yeXdRDKyWcEqUVIL/ceeY3gK/a7ZRQTxLyCx9Z4z7CeIbDXi9dgcayS9vAqb/OfpY572xGDl6U5
	Kln6Th7iPI3bYrMSfQ==
X-Received: by 2002:a17:90b:4c4d:b0:2fa:e9b:33ab with SMTP id 98e67ed59e1d1-2febab7878bmr27494275a91.16.1741065008848;
        Mon, 03 Mar 2025 21:10:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiZnTyS+PczRxTvLSMdHTFs/jB2+JERIbLYMAxRPKra+AaKI0Fes/aNpheWezo+oJpvWNtmw==
X-Received: by 2002:a17:90b:4c4d:b0:2fa:e9b:33ab with SMTP id 98e67ed59e1d1-2febab7878bmr27494245a91.16.1741065008475;
        Mon, 03 Mar 2025 21:10:08 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d2b85sm12057524a91.26.2025.03.03.21.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 21:10:07 -0800 (PST)
Message-ID: <8e852bc0-9a02-42d9-8d56-712c11508626@redhat.com>
Date: Tue, 4 Mar 2025 15:09:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 20/45] arm64: RME: Allow populating initial contents
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
 <20250213161426.102987-21-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-21-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ytEHLgWHqBL-4J8_lTQxbR9LlPBnbcl3a-DyNsqgM4U_1741065009
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_211014_309213_8F5C1F2B 
X-CRM114-Status: GOOD (  29.34  )
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

On 2/14/25 2:14 AM, Steven Price wrote:
> The VMM needs to populate the realm with some data before starting (e.g.
> a kernel and initrd). This is measured by the RMM and used as part of
> the attestation later on.
> 
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
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
>   arch/arm64/kvm/rme.c | 234 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 234 insertions(+)
> 

With the following comments addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index f965869e9ef7..7880894db722 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -624,6 +624,228 @@ void kvm_realm_unmap_range(struct kvm *kvm, unsigned long start, u64 size,
>   		realm_unmap_private_range(kvm, start, end);
>   }
>   
> +static int realm_create_protected_data_granule(struct realm *realm,
> +					       unsigned long ipa,
> +					       phys_addr_t dst_phys,
> +					       phys_addr_t src_phys,
> +					       unsigned long flags)
> +{
> +	phys_addr_t rd = virt_to_phys(realm->rd);
> +	int ret;
> +
> +	if (rmi_granule_delegate(dst_phys))
> +		return -ENXIO;
> +
> +	ret = rmi_data_create(rd, dst_phys, ipa, src_phys, flags);
> +	if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
> +		/* Create missing RTTs and retry */
> +		int level = RMI_RETURN_INDEX(ret);
> +
> +		WARN_ON(level == RMM_RTT_MAX_LEVEL);
> +
> +		ret = realm_create_rtt_levels(realm, ipa, level,
> +					      RMM_RTT_MAX_LEVEL, NULL);
> +		if (ret)
> +			return -EIO;
> +
> +		ret = rmi_data_create(rd, dst_phys, ipa, src_phys, flags);
> +	}
> +	if (ret)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int realm_create_protected_data_page(struct realm *realm,
> +					    unsigned long ipa,
> +					    kvm_pfn_t dst_pfn,
> +					    kvm_pfn_t src_pfn,
> +					    unsigned long flags)
> +{
> +	unsigned long rd = virt_to_phys(realm->rd);
> +	phys_addr_t dst_phys, src_phys;
> +	bool undelegate_failed = false;
> +	int ret, offset;
> +
> +	dst_phys = __pfn_to_phys(dst_pfn);
> +	src_phys = __pfn_to_phys(src_pfn);
> +
> +	for (offset = 0; offset < PAGE_SIZE; offset += RMM_PAGE_SIZE) {
> +		ret = realm_create_protected_data_granule(realm,
> +							  ipa,
> +							  dst_phys,
> +							  src_phys,
> +							  flags);
> +		if (ret)
> +			goto err;
> +
> +		ipa += RMM_PAGE_SIZE;
> +		dst_phys += RMM_PAGE_SIZE;
> +		src_phys += RMM_PAGE_SIZE;
> +	}
> +
> +	return 0;
> +
> +err:
> +	if (ret == -EIO) {
> +		/* current offset needs undelegating */
> +		if (WARN_ON(rmi_granule_undelegate(dst_phys)))
> +			undelegate_failed = true;
> +	}
> +	while (offset > 0) {
> +		ipa -= RMM_PAGE_SIZE;
> +		offset -= RMM_PAGE_SIZE;
> +		dst_phys -= RMM_PAGE_SIZE;
> +
> +		rmi_data_destroy(rd, ipa, NULL, NULL);
> +
> +		if (WARN_ON(rmi_granule_undelegate(dst_phys)))
> +			undelegate_failed = true;
> +	}
> +
> +	if (undelegate_failed) {
> +		/*
> +		 * A granule could not be undelegated,
> +		 * so the page has to be leaked
> +		 */
> +		get_page(pfn_to_page(dst_pfn));
> +	}
> +
> +	return -ENXIO;
> +}
> +
> +static int populate_region(struct kvm *kvm,
> +			   phys_addr_t ipa_base,
> +			   phys_addr_t ipa_end,
> +			   unsigned long data_flags)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +	struct kvm_memory_slot *memslot;
> +	gfn_t base_gfn, end_gfn;
> +	int idx;
> +	phys_addr_t ipa;
> +	int ret = 0;
> +
> +	base_gfn = gpa_to_gfn(ipa_base);
> +	end_gfn = gpa_to_gfn(ipa_end);
> +
> +	idx = srcu_read_lock(&kvm->srcu);
> +	memslot = gfn_to_memslot(kvm, base_gfn);
> +	if (!memslot) {
> +		ret = -EFAULT;
> +		goto out;
> +	}
> +
> +	/* We require the region to be contained within a single memslot */
> +	if (memslot->base_gfn + memslot->npages < end_gfn) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (!kvm_slot_can_be_private(memslot)) {
> +		ret = -EINVAL;
		ret = -EPERM;

> +		goto out;
> +	}
> +
> +	write_lock(&kvm->mmu_lock);
> +
> +	ipa = ALIGN_DOWN(ipa_base, PAGE_SIZE);

The aignment operation is unnecessary since the base/size are ensured
to be aligned to PAGE_SIZE by its caller (kvm_populate_realm()).

> +	while (ipa < ipa_end) {
> +		struct vm_area_struct *vma;
> +		unsigned long hva;
> +		struct page *page;
> +		bool writeable;
> +		kvm_pfn_t pfn;
> +		kvm_pfn_t priv_pfn;
> +		struct page *gmem_page;
> +
> +		hva = gfn_to_hva_memslot(memslot, gpa_to_gfn(ipa));
> +		vma = vma_lookup(current->mm, hva);
> +		if (!vma) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		pfn = __kvm_faultin_pfn(memslot, gpa_to_gfn(ipa), FOLL_WRITE,
> +					&writeable, &page);
> +
> +		if (is_error_pfn(pfn)) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		ret = kvm_gmem_get_pfn(kvm, memslot,
> +				       ipa >> PAGE_SHIFT,
> +				       &priv_pfn, &gmem_page, NULL);
> +		if (ret)
> +			break;
> +
> +		ret = realm_create_protected_data_page(realm, ipa,
> +						       priv_pfn,
> +						       pfn,
> +						       data_flags);
> +
> +		kvm_release_faultin_page(kvm, page, false, false);
> +
> +		if (ret)
> +			break;
> +
> +		ipa += PAGE_SIZE;
> +	}
> +
> +	write_unlock(&kvm->mmu_lock);
> +
> +out:
> +	srcu_read_unlock(&kvm->srcu, idx);
> +	return ret;
> +}
> +
> +static int kvm_populate_realm(struct kvm *kvm,
> +			      struct arm_rme_populate_realm *args)
> +{
> +	phys_addr_t ipa_base, ipa_end;
> +	unsigned long data_flags = 0;
> +
> +	if (kvm_realm_state(kvm) != REALM_STATE_NEW)
> +		return -EINVAL;
		return -EPERM;

> +
> +	if (!IS_ALIGNED(args->base, PAGE_SIZE) ||
> +	    !IS_ALIGNED(args->size, PAGE_SIZE))
> +		return -EINVAL;
> +
> +	if (args->flags & ~RMI_MEASURE_CONTENT)
> +		return -EINVAL;

It's perfect to combine those checks:

	if (!IS_ALIGNED(...) ||
	    !IS_ALIGNED(...) ||
	    args->flags & ~RMI_MEASURE_CONTENT)
		return -EINVAL;

> +
> +	ipa_base = args->base;
> +	ipa_end = ipa_base + args->size;
> +
> +	if (ipa_end < ipa_base)
> +		return -EINVAL;
> +
> +	if (args->flags & RMI_MEASURE_CONTENT)
> +		data_flags |= RMI_MEASURE_CONTENT;
> +
> +	/*
> +	 * Perform the populate in parts to ensure locks are not held for too
> +	 * long
> +	 */
	
s/populate/population ?

> +	while (ipa_base < ipa_end) {
> +		phys_addr_t end = min(ipa_end, ipa_base + SZ_2M);
> +
> +		int ret = populate_region(kvm, ipa_base, end,
> +					  args->flags);
> +
> +		if (ret)
> +			return ret;
> +
> +		ipa_base = end;
> +
> +		cond_resched();
> +	}
> +
> +	return 0;
> +}
> +
>   static int realm_set_ipa_state(struct kvm_vcpu *vcpu,
>   			       unsigned long start,
>   			       unsigned long end,
> @@ -873,6 +1095,18 @@ int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>   		r = kvm_init_ipa_range_realm(kvm, &args);
>   		break;
>   	}
> +	case KVM_CAP_ARM_RME_POPULATE_REALM: {
> +		struct arm_rme_populate_realm args;
> +		void __user *argp = u64_to_user_ptr(cap->args[1]);
> +
> +		if (copy_from_user(&args, argp, sizeof(args))) {
> +			r = -EFAULT;
> +			break;
> +		}
> +
> +		r = kvm_populate_realm(kvm, &args);
> +		break;
> +	}
>   	default:
>   		r = -EINVAL;
>   		break;

Thanks,
Gavin


