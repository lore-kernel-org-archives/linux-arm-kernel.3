Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48470CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auij8Mj6lGaN8B//sZO4VMF8WD/4lSlIkl1O0u/8z2A=; b=Puoptck6ZvR06D13PEDuK6bfHm
	Pth1TAzZXWTmRSjfLYhSotvTO2FhCUYIk5y0IFmRG22JuNZe0b2lTdyOdeDTHh1BM/ZECDUsXU9S7
	djtToEyUPYwKmbSeYX0BEWdQdWPmnSCOYWqGCK85VeXVfMeuI4m3UlmGOwMs2a6c/Xdu/yRB69VvD
	NQwEfW+mjqD2E7SpcKLV4wHeafheb9AkxByv5/u/c7D9SaR3RwswesJDOTfuqF4rWlmD6RKPtdea7
	bKbdQ9d8hA3J+zS3GnkJlyszvKiprwhR28HfVsvqZq/+A717hnKVeA+hmztiOO/2HBd/3KEXgCV3q
	so1Hzw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWba-00000003E4Q-031y;
	Mon, 08 Jun 2026 09:49:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWbW-00000003E3W-3wtf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:49:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65E222454;
	Mon,  8 Jun 2026 02:49:04 -0700 (PDT)
Received: from [10.57.28.93] (unknown [10.57.28.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76A823F86F;
	Mon,  8 Jun 2026 02:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780912149; bh=uO+K5XZc3A1yPDew6p5bzfIEE0/EbJtz0pfhUEFm8WY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gOaOej5Ma1BmUGVbAaMHEkY64ByWK5b/hPS4jTXRWfEYXYfY3ImDPhaYCWZo6V3jA
	 5ZHKcBds4+oUmIuGPzzEc1hxNi9ADjsSYDjFKlsN4qPm7NdaCKn8R10gUlSenXcrYv
	 6HoQyEqKXlKrxqITKgGzfwHdKf5MHdsQidK4WetI=
Message-ID: <f4a598de-ef2c-4705-8399-90210af6e470@arm.com>
Date: Mon, 8 Jun 2026 10:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 28/44] arm64: RMI: Create the realm descriptor
To: Wei-Lin Chang <weilin.chang@arm.com>, kvm@vger.kernel.org,
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
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-29-steven.price@arm.com>
 <wshgh4i6uqytq65rh3j2risam2y2evjnfyztoee46soemp5i4x@qhzj4lcs33yj>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <wshgh4i6uqytq65rh3j2risam2y2evjnfyztoee46soemp5i4x@qhzj4lcs33yj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_024911_154457_1C299745 
X-CRM114-Status: GOOD (  21.38  )
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

On 26/05/2026 23:47, Wei-Lin Chang wrote:
> Hi,
> 
> On Wed, May 13, 2026 at 02:17:36PM +0100, Steven Price wrote:
>> Creating a realm involves first creating a realm descriptor (RD). This
>> involves passing the configuration information to the RMM. Do this as
>> part of realm_ensure_created() so that the realm is created when it is
>> first needed.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v13:
>>  * The RMM no longer uses AUX granules, so no need to ask it how many it
>>    needs.
>>  * Adapted to other changes.
>> Changes since v12:
>>  * Since RMM page size is now equal to the host's page size various
>>    calculations are simplified.
>>  * Switch to using range based APIs to delegate/undelegate.
>>  * VMID handling is now handled entirely by the RMM.
>> ---
>>  arch/arm64/kvm/rmi.c | 88 +++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 86 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>> index fb96bcaa73ed..cae29fd3353c 100644
>> --- a/arch/arm64/kvm/rmi.c
>> +++ b/arch/arm64/kvm/rmi.c
>> @@ -418,6 +418,77 @@ static void realm_unmap_shared_range(struct kvm *kvm,
>>  			     start, end);
>>  }
>>  
>> +static int realm_create_rd(struct kvm *kvm)
>> +{
>> +	struct realm *realm = &kvm->arch.realm;
>> +	struct realm_params *params = realm->params;
>> +	void *rd = NULL;
>> +	phys_addr_t rd_phys, params_phys;
>> +	size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
>> +	int r;
>> +
>> +	realm->ia_bits = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
>> +
>> +	if (WARN_ON(realm->rd || !realm->params))
>> +		return -EEXIST;
>> +
>> +	rd = (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
>> +	if (!rd)
>> +		return -ENOMEM;
>> +
>> +	rd_phys = virt_to_phys(rd);
>> +	if (rmi_delegate_page(rd_phys)) {
>> +		r = -ENXIO;
>> +		goto free_rd;
>> +	}
>> +
>> +	if (rmi_delegate_range(kvm->arch.mmu.pgd_phys, pgd_size)) {
>> +		r = -ENXIO;
>> +		goto out_undelegate_tables;
>> +	}
>> +
>> +	params->s2sz = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
>> +	params->rtt_level_start = get_start_level(realm);
>> +	params->rtt_num_start = pgd_size / PAGE_SIZE;
>> +	params->rtt_base = kvm->arch.mmu.pgd_phys;
>> +
>> +	if (kvm->arch.arm_pmu) {
>> +		params->pmu_num_ctrs = kvm->arch.nr_pmu_counters;
>> +		params->flags |= RMI_REALM_PARAM_FLAG_PMU;
>> +	}
>> +
>> +	if (kvm_lpa2_is_enabled())
>> +		params->flags |= RMI_REALM_PARAM_FLAG_LPA2;
>> +
>> +	params_phys = virt_to_phys(params);
>> +
>> +	if (rmi_realm_create(rd_phys, params_phys)) {
>> +		r = -ENXIO;
>> +		goto out_undelegate_tables;
>> +	}
>> +
>> +	realm->rd = rd;
>> +	kvm_set_realm_state(kvm, REALM_STATE_NEW);
>> +	/* The realm is up, free the parameters.  */
>> +	free_page((unsigned long)realm->params);
>> +	realm->params = NULL;
>> +
>> +	return 0;
>> +
>> +out_undelegate_tables:
>> +	if (WARN_ON(rmi_undelegate_range(kvm->arch.mmu.pgd_phys, pgd_size))) {
>> +		/* Leak the pages if they cannot be returned */
>> +		kvm->arch.mmu.pgt = NULL;
>> +	}
>> +	if (WARN_ON(rmi_undelegate_page(rd_phys))) {
>> +		/* Leak the page if it isn't returned */
>> +		return r;
>> +	}
>> +free_rd:
>> +	free_page((unsigned long)rd);
>> +	return r;
>> +}
>> +
>>  static void realm_unmap_private_range(struct kvm *kvm,
>>  				      unsigned long start,
>>  				      unsigned long end,
>> @@ -647,8 +718,21 @@ static int realm_init_ipa_state(struct kvm *kvm,
>>  
>>  static int realm_ensure_created(struct kvm *kvm)
>>  {
>> -	/* Provided in later patch */
>> -	return -ENXIO;
>> +	int ret;
>> +
>> +	switch (kvm_realm_state(kvm)) {
>> +	case REALM_STATE_NONE:
>> +		break;
>> +	case REALM_STATE_NEW:
>> +		return 0;
>> +	case REALM_STATE_DEAD:
>> +		return -ENXIO;
>> +	default:
>> +		return -EBUSY;
>> +	}
>> +
>> +	ret = realm_create_rd(kvm);
>> +	return ret;
>>  }
> 
> I think ret can be simplified out.
Indeed.

Thanks,
Steve

> Thanks,
> Wei-Lin Chang
> 
>>  
>>  static int set_ripas_of_protected_regions(struct kvm *kvm)
>> -- 
>> 2.43.0
>>


