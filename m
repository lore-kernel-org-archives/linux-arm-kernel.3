Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FB4C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 04:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSULbx90MavrGcud20wi+2LVOs7EXJ0/u5A63tDNIa4=; b=y/fpO2n1DT2dWI3No/ApJxtFPg
	QhxLFMJGC0215L3VaCo4uzOaLJbWF8TfQ3JD3bQtR/AeUNvOnlW+GCfLKwYHQvfJpXaX0Kdqk/HPf
	qTXpbhSEgQgNOXg88HC1g0ctNW/vc1GfaALCizljPBVyOcqtUpZR8StVIZdC4ca2h8RzvgOcdG8mu
	tkW5AXDSrWjiDqicp9DhP6E7etM3RI4EV0cYjjYw9UNG9rUKl+ZEvS3RUSZmCFProZkaCmTPjm3t6
	5bLphIEnIfd731YETypG1OJebl6URINZ2TAbVlDSc38qARb6qHXlRAjNkeWDV53MyD9DO8Q0l+ZF6
	vcgD0gtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tftbV-00000005CZR-0y4y;
	Thu, 06 Feb 2025 04:35:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfta5-00000005CCa-2x76
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 04:33:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51338A437CC;
	Thu,  6 Feb 2025 04:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338C0C4CEDD;
	Thu,  6 Feb 2025 04:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738816416;
	bh=4F2vE5gZXQ1R9viY2NLtHPxaPmsZDZ7NBG0hKYFwBCE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AGD/3vqi10PbGGO6q8Q1hjwNUeY9KxYOBiDmSdGKaSSVof+gp80epr4BeMT00PKNs
	 32zpNG5sTPyqywLObYnaT76LudTJ/bygPlPFj0/XjsnjCK9CG/DgVIObZ12yuESM90
	 yb2KhsTdU7MXWsSlAqZrmSAl8ClEHIm1QgZNOzAAOWxzyaEvSPSqjl0SBXGMxUKgoh
	 7CwJmXJLEp7m826F2gw2AN8NgSSntof5V1gTJaZV5e7SrZ5LJ71BoDVHoo+dXIe37a
	 0rExcoMtzU0q+h+MOSb7+QQcvokJKXW4swM6WgCDLBwFjBeHozQRuha6BedG0kNDiI
	 cQHIEqsHaZjrg==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Gavin Shan <gshan@redhat.com>, Steven Price <steven.price@arm.com>,
	kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>
Subject: Re: [PATCH v6 20/43] arm64: RME: Runtime faulting of memory
In-Reply-To: <3f0caace-ee05-4ddf-ae75-2157e77aa57c@redhat.com>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-21-steven.price@arm.com>
 <3f0caace-ee05-4ddf-ae75-2157e77aa57c@redhat.com>
Date: Thu, 06 Feb 2025 10:03:25 +0530
Message-ID: <yq5a34grsne2.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_203337_865932_F86F2F7B 
X-CRM114-Status: GOOD (  14.64  )
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

Gavin Shan <gshan@redhat.com> writes:

> On 12/13/24 1:55 AM, Steven Price wrote:
 
....

>> +static int private_memslot_fault(struct kvm_vcpu *vcpu,
>> +				 phys_addr_t fault_ipa,
>> +				 struct kvm_memory_slot *memslot)
>> +{
>> +	struct kvm *kvm = vcpu->kvm;
>> +	gpa_t gpa = kvm_gpa_from_fault(kvm, fault_ipa);
>> +	gfn_t gfn = gpa >> PAGE_SHIFT;
>> +	bool priv_exists = kvm_mem_is_private(kvm, gfn);
>> +	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
>> +	struct page *page;
>> +	kvm_pfn_t pfn;
>> +	int ret;
>> +	/*
>> +	 * For Realms, the shared address is an alias of the private GPA with
>> +	 * the top bit set. Thus is the fault address matches the GPA then it
>> +	 * is the private alias.
>> +	 */
>> +	bool is_priv_gfn = (gpa == fault_ipa);
>> +
>
> We may rename 'priv_exists' to 'was_priv_gfn', which is consistent to 'is_priv_gfn'.
> Alternatively, we may use 'was_private' and 'is_private'.
>
>> +	if (priv_exists != is_priv_gfn) {
>> +		kvm_prepare_memory_fault_exit(vcpu,
>> +					      gpa,
>> +					      PAGE_SIZE,
>> +					      kvm_is_write_fault(vcpu),
>> +					      false, is_priv_gfn);
>> +
>> +		return -EFAULT;
>> +	}
>> +
>> +	if (!is_priv_gfn) {
>> +		/* Not a private mapping, handling normally */
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = kvm_mmu_topup_memory_cache(memcache,
>> +					 kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu));
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = kvm_gmem_get_pfn(kvm, memslot, gfn, &pfn, &page, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* FIXME: Should be able to use bigger than PAGE_SIZE mappings */
>> +	ret = realm_map_ipa(kvm, fault_ipa, pfn, PAGE_SIZE, KVM_PGTABLE_PROT_W,
>> +			    memcache);
>> +	if (!ret)
>> +		return 1; /* Handled */
>> +
>> +	put_page(page);
>> +	return ret;
>> +}

I also found the names confusing. Can we do

modified   arch/arm64/kvm/mmu.c
@@ -1487,7 +1487,7 @@ static int private_memslot_fault(struct kvm_vcpu *vcpu,
 	struct kvm *kvm = vcpu->kvm;
 	gpa_t gpa = kvm_gpa_from_fault(kvm, fault_ipa);
 	gfn_t gfn = gpa >> PAGE_SHIFT;
-	bool priv_exists = kvm_mem_is_private(kvm, gfn);
+	bool is_priv_gfn = kvm_mem_is_private(kvm, gfn);
 	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
 	struct page *page;
 	kvm_pfn_t pfn;
@@ -1497,19 +1497,19 @@ static int private_memslot_fault(struct kvm_vcpu *vcpu,
 	 * the top bit set. Thus is the fault address matches the GPA then it
 	 * is the private alias.
 	 */
-	bool is_priv_gfn = (gpa == fault_ipa);
+	bool is_priv_fault = (gpa == fault_ipa);
 
-	if (priv_exists != is_priv_gfn) {
+	if (is_priv_gfn != is_priv_fault) {
 		kvm_prepare_memory_fault_exit(vcpu,
 					      gpa,
 					      PAGE_SIZE,
 					      kvm_is_write_fault(vcpu),
-					      false, is_priv_gfn);
+					      false, is_priv_fault);
 
 		return 0;
 	}
 
-	if (!is_priv_gfn) {
+	if (!is_priv_fault) {
 		/* Not a private mapping, handling normally */
 		return -EINVAL;
 	}

