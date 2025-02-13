Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAF4C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBiCA7GTWlwZBiI1uNHcKTi/LdIiN7a/o0uUT4u6tw8=; b=zHrp9uoZ4O3IDfztrVwNXly/i1
	6dmW7WMqmAbr58NrIiTsUQssVA2pjHbWA8hPawVPT8JoajTKlfvR56J77UpWtFRkcnsJQSp07k/nA
	+C/c3oaB8LcLwHMif7mwdeuTRoJ8qCb/vbmPcAyxjGlxF6z49oFUzxwj4XONzueXRO9q69UuvJFAp
	Zcy0J/IWCbFKeO5wRx/iM/szij0b0R5VzASZZj1SWf+fuTQzDvdtAKZbIPqT65+WuTIA4+WAQOjup
	qIVy0Nwi/6IWrWcHVNSIeGHSelsOI1PZsEQymPjYzwhgy6/5yOqkRj+p1FZmQNs6AHZjQP926hiXd
	i4x7bCMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tie38-0000000CGEi-0FJk;
	Thu, 13 Feb 2025 18:34:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidSO-0000000C6RK-1FpQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 17:57:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6B9F5C58ED;
	Thu, 13 Feb 2025 17:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220B4C4CED1;
	Thu, 13 Feb 2025 17:56:55 +0000 (UTC)
Date: Thu, 13 Feb 2025 17:56:53 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Zhenhua Huang <quic_zhenhuah@quicinc.com>, anshuman.khandual@arm.com,
	will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com,
	mark.rutland@arm.com, joey.gouly@arm.com,
	dave.hansen@linux.intel.com, akpm@linux-foundation.org,
	chenfeiyang@loongson.cn, chenhuacai@kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	quic_tingweiz@quicinc.com, stable@vger.kernel.org
Subject: Re: [PATCH v6] arm64: mm: Populate vmemmap/linear at the page level
 for hotplugged sections
Message-ID: <Z64yZRPpyR9A_BiR@arm.com>
References: <20250213075703.1270713-1-quic_zhenhuah@quicinc.com>
 <9bc91fe3-c590-48e2-b29f-736d0b056c34@redhat.com>
 <Z64UcwSGQ53mFmWF@arm.com>
 <b2964ea1-a22c-4b66-89ef-3082b6d00d21@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2964ea1-a22c-4b66-89ef-3082b6d00d21@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_095700_452933_3AC51903 
X-CRM114-Status: GOOD (  29.78  )
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

On Thu, Feb 13, 2025 at 05:16:37PM +0100, David Hildenbrand wrote:
> On 13.02.25 16:49, Catalin Marinas wrote:
> > On Thu, Feb 13, 2025 at 01:59:25PM +0100, David Hildenbrand wrote:
> > > On 13.02.25 08:57, Zhenhua Huang wrote:
> > > > On the arm64 platform with 4K base page config, SECTION_SIZE_BITS is set
> > > > to 27, making one section 128M. The related page struct which vmemmap
> > > > points to is 2M then.
> > > > Commit c1cc1552616d ("arm64: MMU initialisation") optimizes the
> > > > vmemmap to populate at the PMD section level which was suitable
> > > > initially since hot plug granule is always one section(128M). However,
> > > > commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
> > > > introduced a 2M(SUBSECTION_SIZE) hot plug granule, which disrupted the
> > > > existing arm64 assumptions.
> > > > 
> > > > Considering the vmemmap_free -> unmap_hotplug_pmd_range path, when
> > > > pmd_sect() is true, the entire PMD section is cleared, even if there is
> > > > other effective subsection. For example page_struct_map1 and
> > > > page_strcut_map2 are part of a single PMD entry and they are hot-added
> > > > sequentially. Then page_struct_map1 is removed, vmemmap_free() will clear
> > > > the entire PMD entry freeing the struct page map for the whole section,
> > > > even though page_struct_map2 is still active. Similar problem exists
> > > > with linear mapping as well, for 16K base page(PMD size = 32M) or 64K
> > > > base page(PMD = 512M), their block mappings exceed SUBSECTION_SIZE.
> > > > Tearing down the entire PMD mapping too will leave other subsections
> > > > unmapped in the linear mapping.
> > > > 
> > > > To address the issue, we need to prevent PMD/PUD/CONT mappings for both
> > > > linear and vmemmap for non-boot sections if corresponding size on the
> > > > given base page exceeds SUBSECTION_SIZE(2MB now).
> > > > 
> > > > Cc: <stable@vger.kernel.org> # v5.4+
> > > > Fixes: ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
> > > > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > > > Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> > > 
> > > Just so I understand correctly: for ordinary memory-sections-size hotplug
> > > (NVDIMM, virtio-mem), we still get a large mapping where possible?
> > 
> > Up to 2MB blocks only since that's the SUBSECTION_SIZE value. The
> > vmemmap mapping is also limited to PAGE_SIZE mappings (we could use
> > contiguous mappings for vmemmap but it's not wired up; I don't think
> > it's worth the hassle).
> 
> But that's messed up, no?
> 
> If someone hotplugs a memory section, they have to hotunplug a memory
> section, not parts of it.
> 
> That's why x86 does in vmemmap_populate():
> 
> if (end - start < PAGES_PER_SECTION * sizeof(struct page))
> 	err = vmemmap_populate_basepages(start, end, node, NULL);
> else if (boot_cpu_has(X86_FEATURE_PSE))
> 	err = vmemmap_populate_hugepages(start, end, node, altmap);
> ...
> 
> Maybe I'm missing something. Most importantly, why the weird subsection
> stuff is supposed to degrade ordinary hotplug of dimms/virtio-mem etc.

I think that's based on the discussion for a previous version assuming
that the hotplug/unplug sizes are not guaranteed to be symmetric:

https://lore.kernel.org/lkml/a720aaa5-a75e-481e-b396-a5f2b50ed362@quicinc.com/

If that's not the case, we can indeed ignore the SUBSECTION_SIZE
altogether and just rely on the start/end of the hotplugged region.

-- 
Catalin

