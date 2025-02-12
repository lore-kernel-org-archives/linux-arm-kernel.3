Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA08C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uy7nNmG2QRu1VTT14GwdMWSLsoZv24r+YKj1EbV0UcE=; b=IdBo6T7TODL10jaIZJovqpmDQk
	kMLoTaTaSm9LDH4jEljHMKqnNkRbUkshuH3cYhmzk9dn0Kkjc6eo3oSw4LKL8yGmDmAqrQFZxLqgC
	MppPHGyVP4hhoXSXsvrpmQRbtIq7VJpuDdXDAPV7IcDBErZs7ObZV40JRwVS7KfEPXXcNEL3aH/W7
	2VmFb/ItBOGqqLcOjAI/zuerjilyTmRHz6VbehBNIL0mA2JX3zJkLLpETpIT8Q7Eya1wEHXb2oMyy
	7mMoKbz6sI0GUlCdrenBZQr4QguDTi2uyvwvy9W+NvXjKEhvUeYprHrqRMm1mMTjOgPyg3SQAXJiJ
	K97HyDqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHWb-00000008UKb-0Hoe;
	Wed, 12 Feb 2025 18:31:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHTa-00000008TYL-2Sr2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 18:28:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 833105C4B58;
	Wed, 12 Feb 2025 18:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD73C4CEDF;
	Wed, 12 Feb 2025 18:28:42 +0000 (UTC)
Date: Wed, 12 Feb 2025 18:28:40 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: anshuman.khandual@arm.com, will@kernel.org, ardb@kernel.org,
	ryan.roberts@arm.com, mark.rutland@arm.com, joey.gouly@arm.com,
	dave.hansen@linux.intel.com, akpm@linux-foundation.org,
	chenfeiyang@loongson.cn, chenhuacai@kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	quic_tingweiz@quicinc.com, stable@vger.kernel.org
Subject: Re: [PATCH v5] arm64: mm: Populate vmemmap/linear at the page level
 for hotplugged sections
Message-ID: <Z6zoWMejCDlN2YF9@arm.com>
References: <20250109093824.452925-1-quic_zhenhuah@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109093824.452925-1-quic_zhenhuah@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_102846_714629_70BAD404 
X-CRM114-Status: GOOD (  23.73  )
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

On Thu, Jan 09, 2025 at 05:38:24PM +0800, Zhenhua Huang wrote:
> On the arm64 platform with 4K base page config, SECTION_SIZE_BITS is set
> to 27, making one section 128M. The related page struct which vmemmap
> points to is 2M then.
> Commit c1cc1552616d ("arm64: MMU initialisation") optimizes the
> vmemmap to populate at the PMD section level which was suitable
> initially since hot plug granule is always one section(128M). However,
> commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
> introduced a 2M(SUBSECTION_SIZE) hot plug granule, which disrupted the
> existing arm64 assumptions.
> 
> Considering the vmemmap_free -> unmap_hotplug_pmd_range path, when
> pmd_sect() is true, the entire PMD section is cleared, even if there is
> other effective subsection. For example page_struct_map1 and
> page_strcut_map2 are part of a single PMD entry and they are hot-added
> sequentially. Then page_struct_map1 is removed, vmemmap_free() will clear
> the entire PMD entry freeing the struct page map for the whole section,
> even though page_struct_map2 is still active. Similar problem exists
> with linear mapping as well, for 16K base page(PMD size = 32M) or 64K
> base page(PMD = 512M), their block mappings exceed SUBSECTION_SIZE.
> Tearing down the entire PMD mapping too will leave other subsections
> unmapped in the linear mapping.
> 
> To address the issue, we need to prevent PMD/PUD/CONT mappings for both
> linear and vmemmap for non-boot sections if corresponding size on the
> given base page exceeds SUBSECTION_SIZE(2MB now).
> 
> Cc: stable@vger.kernel.org # v5.4+
> Fixes: ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> ---
> Hi Catalin and Anshuman,
> I have addressed comments so far, please help review.
> One outstanding point which not finalized is in vmemmap_populate(): how to judge hotplug
> section. Currently I am using system_state, discussion:
> https://lore.kernel.org/linux-mm/1515dae4-cb53-4645-8c72-d33b27ede7eb@quicinc.com/

The patch looks fine to me, apart from one nit and a question below:

> @@ -1339,9 +1349,27 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  		    struct mhp_params *params)
>  {
>  	int ret, flags = NO_EXEC_MAPPINGS;
> +	unsigned long start_pfn = PFN_DOWN(start);
> +	struct mem_section *ms = __pfn_to_section(start_pfn);
>  
>  	VM_BUG_ON(!mhp_range_allowed(start, size, true));
>  
> +	/* should not be invoked by early section */
> +	WARN_ON(early_section(ms));

I don't remember the discussion, do we still need this warning here if
the sections are not marked as early? I guess we can keep it if one does
an arch_add_memory() on an early section.

I think I suggested to use a WARN_ON_ONCE(!present_section()) but I
completely forgot the memory hotplug code paths.

> +
> +	/*
> +	 * Disallow BlOCK/CONT mappings if the corresponding size exceeds

Nit: capital L in BlOCK.

Either way,

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

