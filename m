Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A910CC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 13:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54H8ja6qkwc+zSll+xVZzhQ87dmwI3XRpSBDJRGLWNs=; b=uILiIUVFP5f1QlT+ulYNuLGNy2
	R1UIwCewK76zloeWCWnQ5XdpCSsq88o3RpWEJnMPkJodx5S/O4bID4/6NDYLPWpuEc/PwXr5W27Vh
	HR4kgqzIQPtNB154ciZDaqEPR1ss/fbuRGekZYCtCyeTBUf0W4kTgZ5A3rKkg//lqVTN6qqkUTduX
	TFWTk/3CJKRzJq1jxEukgrkTSj5JPwimWjX+Ara8u08nUCnHckJuGVIE+Tj93RY/Y68k40p6lk0Ws
	2TrpjNtExS1DYJJ1u+2pym8Y/wqvhSiUWKxvQpM4EkoG0R2qe6zqcfGXjd/de9fTrRnO9WKdf4zKw
	NVZ1Zccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wev2p-00000002Bfk-0ifn;
	Wed, 01 Jul 2026 13:32:03 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wev2j-00000002Bco-3Kld
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 13:32:01 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-472a14c9965so557020f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 06:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782912714; x=1783517514; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=54H8ja6qkwc+zSll+xVZzhQ87dmwI3XRpSBDJRGLWNs=;
        b=JK14S8Q0810G40ahOg6hJ/tkRF2JCio4Pjxa8qEy5Acd0yJ78qh0cKy0tj4Ne8W1lb
         fJ3SvTQj1w8tK4rYwDeKAifPL3M+zmczutd0qAzw4vmEUBCnEoI6SnjIuG38PElx6xMr
         sYRkgxrCDYla99q1H++BW4iLLE14J6UEcu56sjygfc6s+lu2V+LUZk60ZwmBN66zQ8cP
         wjxz2eCl7wmqRQ62YeLNYGUMTMGLDxx/vq7C+Ln+Ea9RKYc4Uh1tzZ5i5e396dOktm8i
         xD0C2gpaMslcdOEdcLjgQGZmJiU6EEx5MHk0ymJS9XdKxAAzKTuYxfkYxi//Js0sroaS
         jI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912714; x=1783517514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54H8ja6qkwc+zSll+xVZzhQ87dmwI3XRpSBDJRGLWNs=;
        b=FSVkFfBd6W/u0/aGpc76xQhddzckhTJDlSGB5u2gxOXSEZjW5wy6g+LdjST8RXri0f
         ca+023nJsZSZU5mFuonlkRq7nVRsiijdeTsB4tPeJVBWNqfc+6c2y3lEIQkHulWwtf7x
         PO/quiX0asWnfDElKotG3yI5jFfBoZVWyX8fcBlS4jUOp6ARGYgsUVOGwhOdfaBPvQYh
         +zIIM0Lb/VDdABIDHhwwQKflIq1zrVC2hweq5M0rlp5Sqm7Mlf+yljlvpXG7aT4Trk5W
         oP4nH9aIOrlqc6uFrb0/ocmWiz8C4O7dYa7800vIg2I7l/Ex3LYvfjhksRhYInskUu5o
         5dww==
X-Forwarded-Encrypted: i=1; AHgh+RpuaQMZ0sSiJ1QAagrZJ8qfJn+sO3jlIoB8YtErw6cKTnEz2omzgedqHANXmMj7zw/jau5wpLpwwUS0rY7wiJOl@lists.infradead.org
X-Gm-Message-State: AOJu0YyTh05ika9erednOaI7U+0LgUfLWLU0a9Y7kMuLu6goSxsGoOQT
	xDS0hUN8duGqDhHVYvG3qegnqmUPYCPH/O/McLQ8OWxqLZBgnzNpp/iOeIRKZcX0xQ==
X-Gm-Gg: AfdE7cnVZeb5owllfPESUYFqzHsY4v/BmQZ+I0F1c6X53mhnUVGrs4Jimd2/AXaENmK
	oHJcmMbSb52oRNkxhd41A+d4WWArMzT/3iI8Dvq6lBOv/ts/FfjZhAzF2gI53ek+u+Bl/XfoarE
	3PgzavdoPzY3KJAOLjDJ4CVp02GoPkqcfITed/ZUDDzNNt3YzArPjvVn2cXquRat9QPRAj0B6iY
	9YFJUJtfTDLNUQCCMuRXo3tm8FpnBxeymB8TlCAe+3CxyS2jJa8rYCq2c4ziO34H8yNQEiCN6Sn
	ERLsAZatV+fljkszMNqFcHxKg74fROShvtNb0wW9PX7/fq5BUXFgp7xzxtVx+43FrvdJK3V3nz+
	XwESwM+tbGEXq44hogKYcOhiRkWAZhe1868g0aOn8Akwbup5eIhZ5zDVndIekQ5gqbt2Nb3dwvK
	dyQf5u98n5Pa63B/NFrFNiHWCUQvO8SLOQQ3Q6vCaubWJF2reeG0dIjulALSXLKA==
X-Received: by 2002:a05:6000:29db:b0:475:f0c2:5b02 with SMTP id ffacd0b85a97d-4775b45b05emr2137424f8f.56.1782912713855;
        Wed, 01 Jul 2026 06:31:53 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475641e4542sm18270184f8f.10.2026.07.01.06.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:31:52 -0700 (PDT)
Date: Wed, 1 Jul 2026 14:31:49 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Bradley Morgan <include@grrlz.net>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>,
	Gavin Shan <gshan@redhat.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] KVM: arm64: skip pKVM cache flushes for non
 cacheable mappings
Message-ID: <akUWxY_irosuTF4L@google.com>
References: <20260624160028.15591-1-include@grrlz.net>
 <20260624160028.15591-2-include@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624160028.15591-2-include@grrlz.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_063157_862803_02177784 
X-CRM114-Status: GOOD (  26.51  )
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

On Wed, Jun 24, 2026 at 04:00:26PM +0000, Bradley Morgan wrote:
> pKVM keeps its own mapping list for stage 2 operations. Its flush path
> uses that list directly, so it lost the PTE attribute check done by the
> generic stage 2 walker.
> 
> Record whether a mapping is cacheable and skip cache maintenance for
> mappings that are not cacheable.
> 
> Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
> Signed-off-by: Bradley Morgan <include@grrlz.net>
> ---
>  arch/arm64/kvm/pkvm.c | 51 ++++++++++++++++++++++++++++++++++---------
>  1 file changed, 41 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 428723b1b0f5..ca6e823028c2 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -302,9 +302,32 @@ static u64 __pkvm_mapping_start(struct pkvm_mapping *m)
>  	return m->gfn * PAGE_SIZE;
>  }
>  
> +#define PKVM_MAPPING_NR_PAGES_MASK	GENMASK_ULL(47, 0)
> +#define PKVM_MAPPING_CACHEABLE		BIT_ULL(48)

Probably better to make it "_NC". Protected VMs only support cacheable and they
also use struct pkvm_mapping. 

> +
> +static u64 pkvm_mapping_nr_pages(struct pkvm_mapping *m)
> +{
> +	return m->nr_pages & PKVM_MAPPING_NR_PAGES_MASK;
> +}
> +
> +static bool pkvm_mapping_is_cacheable(struct pkvm_mapping *m)
> +{
> +	return m->nr_pages & PKVM_MAPPING_CACHEABLE;
> +}
> +
> +static void pkvm_mapping_set_nr_pages(struct pkvm_mapping *m, u64 nr_pages,
> +				      bool cacheable)
> +{
> +	WARN_ON_ONCE(nr_pages & ~PKVM_MAPPING_NR_PAGES_MASK);
> +
> +	m->nr_pages = nr_pages & PKVM_MAPPING_NR_PAGES_MASK;
> +	if (cacheable)
> +		m->nr_pages |= PKVM_MAPPING_CACHEABLE;
> +}
> +
>  static u64 __pkvm_mapping_end(struct pkvm_mapping *m)
>  {
> -	return (m->gfn + m->nr_pages) * PAGE_SIZE - 1;
> +	return (m->gfn + pkvm_mapping_nr_pages(m)) * PAGE_SIZE - 1;
>  }

Perhaps using a bitfield would heavily simplify this code?

struct pkvm_mapping {
  ...
  u64 nr_pages : 63
  u64 flags : 1
}

Or alternatively, could just make nr_pages u32 and flags u32. nr_pages will not
exceed PMD_SIZE / PAGE_SIZE, which is at worst 8192 on 64K systems.

>  
>  INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
> @@ -350,7 +373,7 @@ static int __pkvm_pgtable_stage2_reclaim(struct kvm_pgtable *pgt, u64 start, u64
>  			continue;
>  
>  		page = pfn_to_page(mapping->pfn);
> -		WARN_ON_ONCE(mapping->nr_pages != 1);
> +		WARN_ON_ONCE(pkvm_mapping_nr_pages(mapping) != 1);
>  		unpin_user_pages_dirty_lock(&page, 1, true);
>  		account_locked_vm(kvm->mm, 1, false);
>  		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
> @@ -369,7 +392,7 @@ static int __pkvm_pgtable_stage2_unshare(struct kvm_pgtable *pgt, u64 start, u64
>  
>  	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
>  		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
> -					mapping->nr_pages);
> +					pkvm_mapping_nr_pages(mapping));
>  		if (WARN_ON(ret))
>  			return ret;
>  		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
> @@ -448,7 +471,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
>  		 * permission faults are handled in the relax_perms() path.
>  		 */
>  		if (mapping) {
> -			if (size == (mapping->nr_pages * PAGE_SIZE))
> +			if (size == (pkvm_mapping_nr_pages(mapping) * PAGE_SIZE))
>  				return -EAGAIN;
>  
>  			/*
> @@ -472,7 +495,9 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
>  	swap(mapping, cache->mapping);
>  	mapping->gfn = gfn;
>  	mapping->pfn = pfn;
> -	mapping->nr_pages = size / PAGE_SIZE;
> +	pkvm_mapping_set_nr_pages(mapping, size / PAGE_SIZE,
> +				  !(prot & (KVM_PGTABLE_PROT_DEVICE |
> +					    KVM_PGTABLE_PROT_NORMAL_NC)));
>  	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
>  
>  	return ret;
> @@ -503,7 +528,7 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  	lockdep_assert_held(&kvm->mmu_lock);
>  	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
>  		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
> -					mapping->nr_pages);
> +					pkvm_mapping_nr_pages(mapping));
>  		if (WARN_ON(ret))
>  			break;
>  	}
> @@ -517,9 +542,13 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  	struct pkvm_mapping *mapping;
>  
>  	lockdep_assert_held(&kvm->mmu_lock);
> -	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
> +	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
> +		if (!pkvm_mapping_is_cacheable(mapping))
> +			continue;
> +
>  		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
> -					  PAGE_SIZE * mapping->nr_pages);
> +					  PAGE_SIZE * pkvm_mapping_nr_pages(mapping));
> +	}
>  
>  	return 0;
>  }
> @@ -536,8 +565,10 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
>  
>  	lockdep_assert_held(&kvm->mmu_lock);
>  	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
> -		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
> -					   mapping->nr_pages, mkold);
> +		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest,
> +					   handle, mapping->gfn,
> +					   pkvm_mapping_nr_pages(mapping),
> +					   mkold);
>  
>  	return young;
>  }
> -- 
> 2.53.0
> 

