Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07223C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 04:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dahlzWRlI1LALktUzZgSkyoAKZL8GDjGaQgiyJ8JjL0=; b=HcsXJNByclUt3cs+h0r//mNpED
	vhg1rNsz9RROYzgFjCO+lmOWU8N0QcDano7lKVGJBJ2S/XrtXhQx3Suc7BaXW361/TUD3Z+TnIL9G
	mlAG0YyZ5CPRt8EZaB+jw2b4d8P/oq0sokYVSPR1Tvg8ZmujyX7DmPF81Mt87e7vmpAwzPLQrZuah
	tVvQVM68p5TxoUXtMWGEocWwGmz5WvUGZjlKviPX7qzsCzhXSZt3e/SEhoX/lZ1ajgTw5jyMv16hq
	qRI8h8+eIPjleCRIK5Z49etMuWHE8Nex4//2sLdZOl2xXEUdkxlz+6fTP/cAK0j+DietdExJl9ck3
	vnznb6dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdMLQ-00000008CNp-3cva;
	Thu, 30 Jan 2025 04:40:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdMK6-00000008C73-17O3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 04:38:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738211917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dahlzWRlI1LALktUzZgSkyoAKZL8GDjGaQgiyJ8JjL0=;
	b=V3PblGue3BvrKb+Drjwa/UNFwBdcbTNS8y0hssYvb5fbV8ZEDD/SSfsfoqydDt/4099qyI
	MlRZIkdqM6Pn0VFmHIEbvLKgoSQYVffC3r3FZxCnqz+FL+b7T36ei4ElsRAtB3PIpn++rC
	DB00XcuV3EA27krvg/nTIbC2FFs8xno=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-a0c5YZ07OmSaw1RdkDjXog-1; Wed, 29 Jan 2025 23:38:33 -0500
X-MC-Unique: a0c5YZ07OmSaw1RdkDjXog-1
X-Mimecast-MFC-AGG-ID: a0c5YZ07OmSaw1RdkDjXog
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21a7cbe3b56so6132455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 20:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738211912; x=1738816712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dahlzWRlI1LALktUzZgSkyoAKZL8GDjGaQgiyJ8JjL0=;
        b=DeZMECMuzOoGgsDOIPCG2FY4fM/aCACdny2ZUMXY+KH+9z/vLKVG5Uk010U99xyqAA
         WnRvr4CYqp56VWmrAPzFteSmFlEih0ZGuVL1lB03d2Q0CmpHTuMq7SsFMjqDvTPu59m7
         x9Syl46N7VSTxsKp1gVenFCUiiE2D+laTV+KIg0abPzH/UgK+aYzOyz/79KTAsnHQLFw
         O2fy3VzAaNlfg/oueKwL7NbYmAf1pB/3jzGorRuBhpTjwH5gukf0T+l3Dx92W7nrQN+1
         o6Il5xQBlV9dpGfiG91q3V/JeiNLCif7ZmHoTMgw1RvjPO4PHmwwjuU9IJwN7R+FBa5t
         S7Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWiFJTx4UpXvKBvIXpgZjdWU3dSRc7X/OfZrumu9e/+kr5dU+W0FN1THQZCjMRBbzi24U5gS2fJunW84YS3nmHW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7iMuuTdpAyC+hw+uiLxYAQ1YViPC9VhOg1LmTUbH9xttwb9h2
	ttbU+eh+ORJwSOO9Ip3vD6e/JUUp8Y0WbcFIemiT3e0oD8Bb1kWXoI7l4ZLrw4jh6z+qHSZD3Su
	Q20TLgyQokhfx5g95JFEyiIpzFk1WoPirpys7PQeXSGxJur5ulh48pNfNz4RIx5sVOQTYKhhp
X-Gm-Gg: ASbGncsaCjIDL7MGuwJ7BzSc4i85oWMGmlLkynIWqe9Ec2l0TcP/fx0Uk6qGQQdRk0N
	Hz7vzWtFWLSjHWAjX67+Ua9TYx3xHodaJPJEjcpFzCOGy4bw4PzcC7etzN8vCC8OwCFXb8xXajZ
	ke0dCNkt0n57VIFjoqUXdt5NYImtwMqU3pcf6RUUavCAm+06tf0g7y+m4KoN0qgETVKeUwJMm4L
	6aCidksRRE8UKm+rzZjyUELolANN7ZSkrS1jOO2lyFcXMc4TpQYnX0SPpyPO5KpTt+iY092f+GW
	POe8iA==
X-Received: by 2002:a17:903:188:b0:215:7b06:90ca with SMTP id d9443c01a7336-21dd7c57d68mr81484505ad.17.1738211912353;
        Wed, 29 Jan 2025 20:38:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiahIoPowSM27YGSPI2cloGv/kse1h98lrjSMBvVFsnZSHDm3HToPBIRU42xVvRKjySslt3w==
X-Received: by 2002:a17:903:188:b0:215:7b06:90ca with SMTP id d9443c01a7336-21dd7c57d68mr81484165ad.17.1738211911962;
        Wed, 29 Jan 2025 20:38:31 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3320edfsm4454775ad.229.2025.01.29.20.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 20:38:31 -0800 (PST)
Message-ID: <68e545c8-57a3-4567-9e96-b46066cf6cee@redhat.com>
Date: Thu, 30 Jan 2025 14:38:22 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/43] arm64: RME: Allow populating initial contents
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
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-20-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-20-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LnmmuOSsEfrNdil3ernbZEcOWJgt4BJRsCqQSPRf9zw_1738211912
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_203838_393588_EF3EC960 
X-CRM114-Status: GOOD (  36.36  )
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

On 12/13/24 1:55 AM, Steven Price wrote:
> The VMM needs to populate the realm with some data before starting (e.g.
> a kernel and initrd). This is measured by the RMM and used as part of
> the attestation later on.
> 
> For now only 4k mappings are supported, future work may add support for
> larger mappings.
> 
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v5:
>   * Refactor to use PFNs rather than tracking struct page in
>     realm_create_protected_data_page().
>   * Pull changes from a later patch (in the v5 series) for accessing
>     pages from a guest memfd.
>   * Do the populate in chunks to avoid holding locks for too long and
>     triggering RCU stall warnings.
> ---
>   arch/arm64/kvm/rme.c | 243 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 243 insertions(+)
> 
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index 22f0c74455af..d4561e368cd5 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/kvm_host.h>
> +#include <linux/hugetlb.h>
>   

This wouldn't be needed since the huge pages, especially hugetlb part, isn't
supported yet.

>   #include <asm/kvm_emulate.h>
>   #include <asm/kvm_mmu.h>
> @@ -545,6 +546,236 @@ void kvm_realm_unmap_range(struct kvm *kvm, unsigned long start, u64 size,
>   		realm_unmap_private_range(kvm, start, end);
>   }
>   
> +static int realm_create_protected_data_page(struct realm *realm,
> +					    unsigned long ipa,
> +					    kvm_pfn_t dst_pfn,
> +					    kvm_pfn_t src_pfn,
> +					    unsigned long flags)
> +{
> +	phys_addr_t dst_phys, src_phys;
> +	int ret;
> +
> +	dst_phys = __pfn_to_phys(dst_pfn);
> +	src_phys = __pfn_to_phys(src_pfn);
> +
> +	if (rmi_granule_delegate(dst_phys))
> +		return -ENXIO;
> +
> +	ret = rmi_data_create(virt_to_phys(realm->rd), dst_phys, ipa, src_phys,
> +			      flags);
> +
> +	if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
> +		/* Create missing RTTs and retry */
> +		int level = RMI_RETURN_INDEX(ret);
> +
> +		ret = realm_create_rtt_levels(realm, ipa, level,
> +					      RMM_RTT_MAX_LEVEL, NULL);
> +		if (ret)
> +			goto err;
> +
> +		ret = rmi_data_create(virt_to_phys(realm->rd), dst_phys, ipa,
> +				      src_phys, flags);
> +	}
> +
> +	if (!ret)
> +		return 0;
> +
> +err:
> +	if (WARN_ON(rmi_granule_undelegate(dst_phys))) {
> +		/* Page can't be returned to NS world so is lost */
> +		get_page(pfn_to_page(dst_pfn));
> +	}
> +	return -ENXIO;
> +}
> +
> +static int fold_rtt(struct realm *realm, unsigned long addr, int level)
> +{
> +	phys_addr_t rtt_addr;
> +	int ret;
> +
> +	ret = realm_rtt_fold(realm, addr, level + 1, &rtt_addr);
> +	if (ret)
> +		return ret;
> +
> +	free_delegated_granule(rtt_addr);
> +
> +	return 0;
> +}
> +
> +static int populate_par_region(struct kvm *kvm,
> +			       phys_addr_t ipa_base,
> +			       phys_addr_t ipa_end,
> +			       u32 flags)
> +{

At the first glance, I was wandering what's meant by 'par' in the function name.
It turns to be a 2MB region and I guess it represents 'part'. I think this may
be renamed to populate_sub_region() or populate_region() directly.

> +	struct realm *realm = &kvm->arch.realm;
> +	struct kvm_memory_slot *memslot;
> +	gfn_t base_gfn, end_gfn;
> +	int idx;
> +	phys_addr_t ipa;
> +	int ret = 0;
> +	unsigned long data_flags = 0;
> +
> +	base_gfn = gpa_to_gfn(ipa_base);
> +	end_gfn = gpa_to_gfn(ipa_end);
> +
> +	if (flags & KVM_ARM_RME_POPULATE_FLAGS_MEASURE)
> +		data_flags = RMI_MEASURE_CONTENT;
> +

The 'data_flags' can be sorted out by its caller kvm_populate_realm(), and passed
to populate_par_region(). In that way, we needn't to figure out 'data_flags' in
every call to populate_par_region().

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
> +		goto out;
> +	}
> +
> +	write_lock(&kvm->mmu_lock);
> +
> +	ipa = ipa_base;
> +	while (ipa < ipa_end) {
> +		struct vm_area_struct *vma;
> +		unsigned long map_size;
> +		unsigned int vma_shift;
> +		unsigned long offset;
> +		unsigned long hva;
> +		struct page *page;
> +		bool writeable;
> +		kvm_pfn_t pfn;
> +		int level, i;
> +
> +		hva = gfn_to_hva_memslot(memslot, gpa_to_gfn(ipa));
> +		vma = vma_lookup(current->mm, hva);
> +		if (!vma) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		/* FIXME: Currently we only support 4k sized mappings */
> +		vma_shift = PAGE_SHIFT;
> +
> +		map_size = 1 << vma_shift;
> +
> +		ipa = ALIGN_DOWN(ipa, map_size);
> +

The blank lines in above 5 lines can be dropped :)

> +		switch (map_size) {
> +		case RMM_L2_BLOCK_SIZE:
> +			level = 2;
> +			break;
> +		case PAGE_SIZE:
> +			level = 3;
> +			break;
> +		default:
> +			WARN_ONCE(1, "Unsupported vma_shift %d", vma_shift);
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
> +		if (level < RMM_RTT_MAX_LEVEL) {
> +			/*
> +			 * A temporary RTT is needed during the map, precreate
> +			 * it, however if there is an error (e.g. missing
> +			 * parent tables) this will be handled in the
> +			 * realm_create_protected_data_page() call.
> +			 */
> +			realm_create_rtt_levels(realm, ipa, level,
> +						RMM_RTT_MAX_LEVEL, NULL);
> +		}
> +

This block of code to create the temporary RTT can be removed. With it removed,
we're going to rely on realm_create_protected_data_page() to create the needed
RTT in its failing path. If the temporary RTT has been existing, the function
call to realm_create_rtt_levels() doesn't nothing except multiple RMI calls are
issued. RMI calls aren't cheap and it causes performance lost if you agree.

> +		for (offset = 0, i = 0; offset < map_size && !ret;
> +		     offset += PAGE_SIZE, i++) {
> +			phys_addr_t page_ipa = ipa + offset;
> +			kvm_pfn_t priv_pfn;
> +			struct page *gmem_page;
> +			int order;
> +
> +			ret = kvm_gmem_get_pfn(kvm, memslot,
> +					       page_ipa >> PAGE_SHIFT,
> +					       &priv_pfn, &gmem_page, &order);
> +			if (ret)
> +				break;
> +
> +			ret = realm_create_protected_data_page(realm, page_ipa,
> +							       priv_pfn,
> +							       pfn + i,
> +							       data_flags);
> +		}
> +
> +		kvm_release_faultin_page(kvm, page, false, false);
> +
> +		if (ret)
> +			break;
> +
> +		if (level == 2)
> +			fold_rtt(realm, ipa, level);
> +
> +		ipa += map_size;
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
> +			      struct kvm_cap_arm_rme_populate_realm_args *args)
> +{
> +	phys_addr_t ipa_base, ipa_end;
> +
> +	if (kvm_realm_state(kvm) != REALM_STATE_NEW)
> +		return -EINVAL;
> +
> +	if (!IS_ALIGNED(args->populate_ipa_base, PAGE_SIZE) ||
> +	    !IS_ALIGNED(args->populate_ipa_size, PAGE_SIZE))
> +		return -EINVAL;
> +
> +	if (args->flags & ~RMI_MEASURE_CONTENT)
> +		return -EINVAL;
> +
> +	ipa_base = args->populate_ipa_base;
> +	ipa_end = ipa_base + args->populate_ipa_size;
> +
> +	if (ipa_end < ipa_base)
> +		return -EINVAL;
> +
> +	/*
> +	 * Perform the populate in parts to ensure locks are not held for too
> +	 * long
> +	 */
> +	while (ipa_base < ipa_end) {
> +		phys_addr_t end = min(ipa_end, ipa_base + SZ_2M);
> +
> +		int ret = populate_par_region(kvm, ipa_base, end,
> +					      args->flags);
> +
> +		if (ret)
> +			return ret;
> +

cond_resched() seems nice to have here so that those pending tasks can
be run immediately.

> +		ipa_base = end;
> +	}
> +
> +	return 0;
> +}
> +
>   int realm_set_ipa_state(struct kvm_vcpu *vcpu,
>   			unsigned long start,
>   			unsigned long end,
> @@ -794,6 +1025,18 @@ int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>   		r = kvm_init_ipa_range_realm(kvm, &args);
>   		break;
>   	}
> +	case KVM_CAP_ARM_RME_POPULATE_REALM: {
> +		struct kvm_cap_arm_rme_populate_realm_args args;
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


