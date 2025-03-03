Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE395C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 04:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZWlrNkWyyIdXT2p4tYOkQhHrguS4IQ3yj366dONwt0=; b=uqcbQKiB3XzBct++yThyA6OIJt
	Pfh9HT6YOcFJQ4c8pjcUE8x0JRs/mHviKcyOMG4Y2pggy3hXYbuC6k1ruSHqFkIkMVcH4zP36haSe
	sCj29lkncqcPl/4shY3xWJ4+9dAv6XOYENZ/j4Iww3rT+1iMX1Ojw8m2bCt3HHnR8zxnmMEuas5KE
	amyXwZVq9hM+5EMdjer6rypfLNaJyDNkATvwkymCbc1rAwIfYwG1VzRDVq/ABbFlNhrpurCreo4U4
	Jgyve+9ENV7HuukHmtCiVz2DVRWpMhucLDoeWV52v9NGHxGoJkWh4jHqboClz+9n6+FqxOyFbNLiL
	0AAl2lig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toxem-0000000HAbi-3XJf;
	Mon, 03 Mar 2025 04:43:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toxdC-0000000HASe-0fvQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 04:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740976936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZWlrNkWyyIdXT2p4tYOkQhHrguS4IQ3yj366dONwt0=;
	b=fkpZnxyiadWGeoVHc1GNtQ+IubAzueaTw8niZ4Q120AaewPwaFH07rGZ3vjWFU2z0fhyGn
	BPjlQHwmht1xbmhft9sTTVDYJYJljSQcRmH3Sl06z9Md6RgIq4guOQXdU5lNxR3+Nc41Pa
	9qDaJxS8Uuf7ovedLetiWlqCFK/8pco=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-frOH5awXOmqlV2-wnOF_WA-1; Sun, 02 Mar 2025 23:42:15 -0500
X-MC-Unique: frOH5awXOmqlV2-wnOF_WA-1
X-Mimecast-MFC-AGG-ID: frOH5awXOmqlV2-wnOF_WA_1740976934
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fec1f46678so8205052a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 20:42:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740976934; x=1741581734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZWlrNkWyyIdXT2p4tYOkQhHrguS4IQ3yj366dONwt0=;
        b=d/YfJepRZylC1Fc5h++caWqXwenDVIk8A1fjPQLbK1YLs5OOO3koQJ5Qlyxvxt1PXn
         9d28q6WYLik9+NqmjpupR3pr549G3r0n1r8vzJZX+JrGnIlGT/JARITn5qF63MJGDrLN
         wQ5jZhqrKGk1QK/YvIAC0rOkXiGZmDdfwX1XkH303ZdhcERBprhLb6DN3q/oSc9yX+QY
         P1H2m7aHe8DQ6rlM1k2K10dmbgX8SQnAHn1dCA/f+sZ16T6xCrCQjffjj5CHYrzxwWLL
         Bdsw0c7AkJ96BEKo9dgh03MChgwImP0EGp8wh9K9OyvfiYlHku37PA3UM7vRp7xy5abZ
         /teg==
X-Forwarded-Encrypted: i=1; AJvYcCUJMVrPVxIsR5KCcQRaADH1GUO8wvRAYjdbNuYgK8hS4mZIIX73715BH9j7dWDTLpdAAr32SDCyAPkDEoQNOgWd@lists.infradead.org
X-Gm-Message-State: AOJu0YxaLouPK2LLSfAwz+wBabMJ3NTyNofJEqFA0FfUl4/M8qE5Z760
	J8Z7+qslNIPH98+4YlYJf0S6P6Z8hNhiUpYkgQ3ZUscUBfqNt3zrc/rASXNXQLzq8PivQqIBp8Z
	ez+CEKPY9WNwO/LJxRahZdmQ7Q89nWFz4+153GIhi9qk/bukn8d1V8n+8SXfZT1gsBgVyP2Al
X-Gm-Gg: ASbGncu1e87gheyi0ydjWB0YWD4Z/fQFIthHihGMdrvdw0H+CpqQ7SpW45SMNjgqpEg
	1amZkn9JfPhlx7zaxodwMSmDc3VseVBdg+2gtmj9ssx7Ie5dC8U61bH9D5sTuNp2Wy6S5Vfr424
	hpnKkXYGAA3f42ZNmLCDQsvDvc8YWjQeC89AS15j1K/dxBGft+DfsJ6wSOiOr2YAwQflhRThILd
	5K/3/mobX+hE63ycRlDKRdCuivy7GQvcyCFFMRKssXYCxwKuQN5adXZRSOu/bddSfiiPmXfi8Yd
	2WPoRK6vxBvNv++DuA==
X-Received: by 2002:a05:6a20:7347:b0:1f0:e7e2:b295 with SMTP id adf61e73a8af0-1f2f4c9c884mr15086796637.5.1740976934433;
        Sun, 02 Mar 2025 20:42:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMQAnjp3aPLIp+JkScadGYw1k0nhzSpzFpRULDgvvNejMSWpiBemFKZIbJFmyuqZgvHibZmA==
X-Received: by 2002:a05:6a20:7347:b0:1f0:e7e2:b295 with SMTP id adf61e73a8af0-1f2f4c9c884mr15086777637.5.1740976934109;
        Sun, 02 Mar 2025 20:42:14 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af221346042sm3304724a12.28.2025.03.02.20.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 20:42:13 -0800 (PST)
Message-ID: <3413f278-2507-4bb5-8904-550abe93e459@redhat.com>
Date: Mon, 3 Mar 2025 14:42:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/45] arm64: RME: ioctls to create and configure
 realms
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
 <20250213161426.102987-9-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-9-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0PhuttT5L7hm4E5MrBOznFXHnrCmnOcYhkMRmGLcHwg_1740976934
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_204218_284966_C6E31B32 
X-CRM114-Status: GOOD (  36.10  )
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
> Add the KVM_CAP_ARM_RME_CREATE_RD ioctl to create a realm. This involves
> delegating pages to the RMM to hold the Realm Descriptor (RD) and for
> the base level of the Realm Translation Tables (RTT). A VMID also need
> to be picked, since the RMM has a separate VMID address space a
> dedicated allocator is added for this purpose.
> 
> KVM_CAP_ARM_RME_CONFIG_REALM is provided to allow configuring the realm
> before it is created. Configuration options can be classified as:
> 
>   1. Parameters specific to the Realm stage2 (e.g. IPA Size, vmid, stage2
>      entry level, entry level RTTs, number of RTTs in start level, LPA2)
>      Most of these are not measured by RMM and comes from KVM book
>      keeping.
> 
>   2. Parameters controlling "Arm Architecture features for the VM". (e.g.
>      SVE VL, PMU counters, number of HW BRPs/WPs), configured by the VMM
>      using the "user ID register write" mechanism. These will be
>      supported in the later patches.
> 
>   3. Parameters are not part of the core Arm architecture but defined
>      by the RMM spec (e.g. Hash algorithm for measurement,
>      Personalisation value). These are programmed via
>      KVM_CAP_ARM_RME_CONFIG_REALM.
> 
> For the IPA size there is the possibility that the RMM supports a
> different size to the IPA size supported by KVM for normal guests. At
> the moment the 'normal limit' is exposed by KVM_CAP_ARM_VM_IPA_SIZE and
> the IPA size is configured by the bottom bits of vm_type in
> KVM_CREATE_VM. This means that it isn't easy for the VMM to discover
> what IPA sizes are supported for Realm guests. Since the IPA is part of
> the measurement of the realm guest the current expectation is that the
> VMM will be required to pick the IPA size demanded by attestation and
> therefore simply failing if this isn't available is fine. An option
> would be to expose a new capability ioctl to obtain the RMM's maximum
> IPA size if this is needed in the future.
> 
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v6:
>   * Separate RMM RTT calculations from host PAGE_SIZE. This allows the
>     host page size to be larger than 4k while still communicating with an
>     RMM which uses 4k granules.
> Changes since v5:
>   * Introduce free_delegated_granule() to replace many
>     undelegate/free_page() instances and centralise the comment on
>     leaking when the undelegate fails.
>   * Several other minor improvements suggested by reviews - thanks for
>     the feedback!
> Changes since v2:
>   * Improved commit description.
>   * Improved return failures for rmi_check_version().
>   * Clear contents of PGD after it has been undelegated in case the RMM
>     left stale data.
>   * Minor changes to reflect changes in previous patches.
> ---
>   arch/arm64/include/asm/kvm_emulate.h |   5 +
>   arch/arm64/include/asm/kvm_rme.h     |  19 ++
>   arch/arm64/kvm/arm.c                 |  16 ++
>   arch/arm64/kvm/mmu.c                 |  22 +-
>   arch/arm64/kvm/rme.c                 | 322 +++++++++++++++++++++++++++
>   5 files changed, 382 insertions(+), 2 deletions(-)
> 

With below comments addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

[...]

> +
> +static int realm_create_rd(struct kvm *kvm)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +	struct realm_params *params = realm->params;
> +	void *rd = NULL;
> +	phys_addr_t rd_phys, params_phys;
> +	size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
> +	int i, r;
> +	int rtt_num_start;
> +
> +	realm->ia_bits = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
> +	rtt_num_start = realm_num_root_rtts(realm);
> +
> +	if (WARN_ON(realm->rd) || WARN_ON(!realm->params))
> +		return -EEXIST;
> +

Two WARN_ON() can be combined into one.

	if (WARN_ON(realm->rd || !realm->param))

> +	if (pgd_size / RMM_PAGE_SIZE < rtt_num_start)
> +		return -EINVAL;
> +
> +	rd = (void *)__get_free_page(GFP_KERNEL);
> +	if (!rd)
> +		return -ENOMEM;
> +
> +	rd_phys = virt_to_phys(rd);
> +	if (rmi_granule_delegate(rd_phys)) {
> +		r = -ENXIO;
> +		goto free_rd;
> +	}
> +
> +	for (i = 0; i < pgd_size; i += RMM_PAGE_SIZE) {
> +		phys_addr_t pgd_phys = kvm->arch.mmu.pgd_phys + i;
> +
> +		if (rmi_granule_delegate(pgd_phys)) {
> +			r = -ENXIO;
> +			goto out_undelegate_tables;
> +		}
> +	}
> +
> +	params->s2sz = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
> +	params->rtt_level_start = get_start_level(realm);
> +	params->rtt_num_start = rtt_num_start;
> +	params->rtt_base = kvm->arch.mmu.pgd_phys;
> +	params->vmid = realm->vmid;
> +
> +	params_phys = virt_to_phys(params);
> +
> +	if (rmi_realm_create(rd_phys, params_phys)) {
> +		r = -ENXIO;
> +		goto out_undelegate_tables;
> +	}
> +
> +	if (WARN_ON(rmi_rec_aux_count(rd_phys, &realm->num_aux))) {
> +		WARN_ON(rmi_realm_destroy(rd_phys));
> +		goto out_undelegate_tables;
> +	}
> +
> +	realm->rd = rd;
> +
> +	return 0;
> +
> +out_undelegate_tables:
> +	while (i > 0) {
> +		i -= RMM_PAGE_SIZE;
> +
> +		phys_addr_t pgd_phys = kvm->arch.mmu.pgd_phys + i;
> +
> +		if (WARN_ON(rmi_granule_undelegate(pgd_phys))) {
> +			/* Leak the pages if they cannot be returned */
> +			kvm->arch.mmu.pgt = NULL;
> +			break;
> +		}
> +	}
> +	if (WARN_ON(rmi_granule_undelegate(rd_phys))) {
> +		/* Leak the page if it isn't returned */
> +		return r;
> +	}
> +free_rd:
> +	free_page((unsigned long)rd);
> +	return r;
> +}
> +

[...]

> +
> +int kvm_init_realm_vm(struct kvm *kvm)
> +{
> +	struct realm_params *params;
> +
> +	params = (struct realm_params *)get_zeroed_page(GFP_KERNEL);
> +	if (!params)
> +		return -ENOMEM;
> +
> +	kvm->arch.realm.params = params;
> +	return 0;
> +}
> +

The local variable @params is unnecessary, something like below.

	kvm->arch.realm.params = (struct realm_parms *)get_zeroed_page(GFP_KERNEL);

>   void kvm_init_rme(void)
>   {
>   	if (PAGE_SIZE != SZ_4K)
> @@ -52,5 +368,11 @@ void kvm_init_rme(void)
>   		/* Continue without realm support */
>   		return;
>   
> +	if (WARN_ON(rmi_features(0, &rmm_feat_reg0)))
> +		return;
> +
> +	if (rme_vmid_init())
> +		return;
> +
>   	/* Future patch will enable static branch kvm_rme_is_available */
>   }

Thanks,
Gavin


