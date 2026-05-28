Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBECCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 05:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaJmUdTEXFkt0b6LYeGSP6p56fd+jhXHb8g1dv7VOCM=; b=JBDU9vctNkCdYTUe/V8msrCR+W
	uUxsm46pQOinR3P0v1kwXcHf0YxX5MPNimQxgwPbqGVBbgMukGx8CjOHCfXmc8wAjuSLfABTzXdXS
	fPuvwTpzLcJG1OnVTEUu9vFrfP6h0ruBBvJuJcRMgG3tg+A+8TafBuTpmZyu4iKlCrxpT7PHCn+TC
	mkSatK5qWdj6aqaM0/o8FUb2BZkOrE8c2RYbwNEZjYWMRT9IAEZTE6CrYHvjsUVpV559gJ/sMHhJo
	3cBmhRh6mCBYwq11MxatFK73Mhe5JKUfdAHpb0dnjxXx9BcMh4Is19V8txs5sENYabh7Sx1OuiUYP
	ZNFKOgNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTeL-00000005AOA-1TTz;
	Thu, 28 May 2026 05:51:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTeI-00000005ANp-3DXI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 05:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779947477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yaJmUdTEXFkt0b6LYeGSP6p56fd+jhXHb8g1dv7VOCM=;
	b=gFpAil3yYfGvB1yZyNmZ6B5wuGxv+IEJgNRT8FXGatMCDcrKOEUfpVwCuLUhZcxQ5O+a60
	vwjdXBZFMFhrzJQulkpGf4jYGmVtDkp68QTc7LFhc4zfem2vAxfRZisZYD6CeFSPlpP3QD
	iAu2V4LzTpKyEx5MHxAYdZal7PATNs0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-V5CMFN7WMAq9qBiltif-yg-1; Thu, 28 May 2026 01:51:16 -0400
X-MC-Unique: V5CMFN7WMAq9qBiltif-yg-1
X-Mimecast-MFC-AGG-ID: V5CMFN7WMAq9qBiltif-yg_1779947475
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-369467ab5bfso10653216a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 22:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779947475; x=1780552275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaJmUdTEXFkt0b6LYeGSP6p56fd+jhXHb8g1dv7VOCM=;
        b=rkPL4RhimTevTqA6Av+LDsX1UOemF8/DNtoErmRCGtgcONPZL6YXhkBQWkRaR54vwl
         vzzHpj2oTwmHpvHJYiNRnQKYehz4nw7VghcXFjFjoudskk7aFb5BQhCKRkeJ/6sCCQGL
         knjgBlEJ/I13hr5vqqTbnaABF8yth2pGKK6GX8eSKm4SnNg7rRdPSX0bKNTeXdb9ez4W
         Kr8bdCxeEpH65bjGj1BZuX7+APmMGT9K7T23k3GVOZG1Y3tOO6YsQRB8chZoVKopFFBI
         kmXwxxLRtC8r8vIzF3aIqTjfawPvLqkkbv9dFO9KpAMwDSTTbnmj/F7Ub2XgpGDTESp8
         TqtQ==
X-Forwarded-Encrypted: i=1; AFNElJ8e8zUYqN7llTwBGf6K67qw1G+aXvrE0nkWazR8OoWwzj9p80eRwbsIwYacH8zQXUvUmtdIehdTt+fHvHUAOAsN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6B1KNDggXzqEnbnPt6bKO8TrIBbrz/H7T5a/qpGh7GH1YEgUB
	yso1lekGumHRkbBmoivp3opYx3N57Scyn0cmtyLX3k964q2yzEjlNFYTfy1Wy6SdAz5Um5bGHDB
	LdjmPTyjrGlNVygcJvaWS/i0LRDZwhhftjk/DhDIK630oRtIsq6y+rJRetK3eqwexqLSKlL6E0Y
	SG
X-Gm-Gg: Acq92OF6ETIpf/8v2rjxD1H9unouX4x6mlpPE8iK/hv1acMzkTZjQZo8VMdySy7mcDl
	Rf9RO5FaM69YQudtKp6eShcX6Q/L5AHfpJVhxWUkGkaHoqoag9dEK3ZTTWZAVuVtZw8qbwwdLcY
	JsYAJY6xE0TSX2wkvtLgpZTSUhDCSP+iwTh9mtpNNUHn65HlTT8XWgl8G4zAhitmund8kYUJ5Gg
	7/6O1TbUNARK5Y75gqqwzKIRwLUf9XeklzmaRjVH1OX9hJZmpc5/gjSlDtMWrE3kfdpaN7e344G
	TfW2GRqlAzXecPKqRN6P9cTbt53/8264vVZPMjKduWduxXy+1DxTpDBRC1Bv1j7RODGg1QMnUG9
	RF3UVNj92SVdUkNIY5Aw9eOz8zQqTdmJYlMFY82sfWwtz5k8Hw/ZUbTR3yoH9JddKcaT0JH/0R9
	g=
X-Received: by 2002:a17:90a:da8f:b0:36b:98a3:4a85 with SMTP id 98e67ed59e1d1-36b98a35a8amr592439a91.27.1779947474730;
        Wed, 27 May 2026 22:51:14 -0700 (PDT)
X-Received: by 2002:a17:90a:da8f:b0:36b:98a3:4a85 with SMTP id 98e67ed59e1d1-36b98a35a8amr592407a91.27.1779947474246;
        Wed, 27 May 2026 22:51:14 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b9096a918sm660809a91.16.2026.05.27.22.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 22:51:13 -0700 (PDT)
Message-ID: <80b6ab2d-1a3e-4c15-b06b-00aaa23fcf74@redhat.com>
Date: Thu, 28 May 2026 15:51:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 28/44] arm64: RMI: Create the realm descriptor
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
 <20260513131757.116630-29-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260513131757.116630-29-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xs1tl6d8g049URHBo3EaScL2fRp5UJjI5HCKI9-gmY4_1779947475
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_225118_907037_7C0449EC 
X-CRM114-Status: GOOD (  27.06  )
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
> Creating a realm involves first creating a realm descriptor (RD). This
> involves passing the configuration information to the RMM. Do this as
> part of realm_ensure_created() so that the realm is created when it is
> first needed.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v13:
>   * The RMM no longer uses AUX granules, so no need to ask it how many it
>     needs.
>   * Adapted to other changes.
> Changes since v12:
>   * Since RMM page size is now equal to the host's page size various
>     calculations are simplified.
>   * Switch to using range based APIs to delegate/undelegate.
>   * VMID handling is now handled entirely by the RMM.
> ---
>   arch/arm64/kvm/rmi.c | 88 +++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 86 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index fb96bcaa73ed..cae29fd3353c 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -418,6 +418,77 @@ static void realm_unmap_shared_range(struct kvm *kvm,
>   			     start, end);
>   }
>   
> +static int realm_create_rd(struct kvm *kvm)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +	struct realm_params *params = realm->params;
> +	void *rd = NULL;
> +	phys_addr_t rd_phys, params_phys;
> +	size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
> +	int r;
> +
> +	realm->ia_bits = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
> +
> +	if (WARN_ON(realm->rd || !realm->params))
> +		return -EEXIST;
> +
> +	rd = (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
> +	if (!rd)
> +		return -ENOMEM;
> +
> +	rd_phys = virt_to_phys(rd);
> +	if (rmi_delegate_page(rd_phys)) {
> +		r = -ENXIO;
> +		goto free_rd;
> +	}
> +
> +	if (rmi_delegate_range(kvm->arch.mmu.pgd_phys, pgd_size)) {
> +		r = -ENXIO;
> +		goto out_undelegate_tables;
> +	}
> +
> +	params->s2sz = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
> +	params->rtt_level_start = get_start_level(realm);
> +	params->rtt_num_start = pgd_size / PAGE_SIZE;
> +	params->rtt_base = kvm->arch.mmu.pgd_phys;
> +
> +	if (kvm->arch.arm_pmu) {
> +		params->pmu_num_ctrs = kvm->arch.nr_pmu_counters;
> +		params->flags |= RMI_REALM_PARAM_FLAG_PMU;
> +	}
> +
> +	if (kvm_lpa2_is_enabled())
> +		params->flags |= RMI_REALM_PARAM_FLAG_LPA2;
> +
> +	params_phys = virt_to_phys(params);
> +
> +	if (rmi_realm_create(rd_phys, params_phys)) {
> +		r = -ENXIO;
> +		goto out_undelegate_tables;
> +	}
> +
> +	realm->rd = rd;
> +	kvm_set_realm_state(kvm, REALM_STATE_NEW);
> +	/* The realm is up, free the parameters.  */
> +	free_page((unsigned long)realm->params);
> +	realm->params = NULL;
> +
> +	return 0;
> +
> +out_undelegate_tables:
> +	if (WARN_ON(rmi_undelegate_range(kvm->arch.mmu.pgd_phys, pgd_size))) {
> +		/* Leak the pages if they cannot be returned */
> +		kvm->arch.mmu.pgt = NULL;
> +	}

In the latest RMM implementation (topics/rmm-v2.0-poc_2), rmi_delegate_range() works
with the granularity of granule (4KB) and it can fail on any granule. For example,
we have 16x granule as the root RTT and rmi_delegate_range() fails on the first
granule, we're going to undelegate all these 16x granules, which were never delegated
to RMM. It eventually leads to error and memory leakage.

For this, rmi_delegate_range() could be improved to return the number of granules that
have been delegated. The return value can be used by the caller to handle the erroneous
case by passing the correct range to rmi_undelegate_page().

> +	if (WARN_ON(rmi_undelegate_page(rd_phys))) {
> +		/* Leak the page if it isn't returned */
> +		return r;
> +	}
> +free_rd:
> +	free_page((unsigned long)rd);
> +	return r;
> +}
> +
>   static void realm_unmap_private_range(struct kvm *kvm,
>   				      unsigned long start,
>   				      unsigned long end,
> @@ -647,8 +718,21 @@ static int realm_init_ipa_state(struct kvm *kvm,
>   
>   static int realm_ensure_created(struct kvm *kvm)
>   {
> -	/* Provided in later patch */
> -	return -ENXIO;
> +	int ret;
> +
> +	switch (kvm_realm_state(kvm)) {
> +	case REALM_STATE_NONE:
> +		break;
> +	case REALM_STATE_NEW:
> +		return 0;
> +	case REALM_STATE_DEAD:
> +		return -ENXIO;
> +	default:
> +		return -EBUSY;
> +	}
> +
> +	ret = realm_create_rd(kvm);
> +	return ret;
>   }
>   
>   static int set_ripas_of_protected_regions(struct kvm *kvm)

Thanks,
Gavin


