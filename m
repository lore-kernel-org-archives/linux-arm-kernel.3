Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B945C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDbhABUS9urbjuK93orrRgVMLJaDNVuhJFFht39PZ4Q=; b=RKYCofRaWtdwlKEdufBYXIZkd4
	RJA8I5s+a+HRWjda/g5HVbuH0qGokTb5bhtAwdR6hFps5tDGQY23AgR7DoL/2hZFQ3C/xfpSsI2bv
	8ZwWYtNuoT9sOIjko6/24zdK0wOvjmdhvFIe9QkW2v0rxUzBmtPtcPPSF5fZF6zvUEGNKvmpWZUv8
	Lml0cvQwafTHP+KJiIdIzlCIbH/Ujlk1op0++3U3Yo0u82Cxpr9xxP8U2SzXeiw/w1vA191Qa6i+E
	JcJNFmO/Qsnjpiu1my8J8n3CV7xm6zh9bTGvM/plxVHYlDfunDZjSikkyHUcY8B7MFgwCsWdvVldb
	0OSbstTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzp3-00000000ynQ-1R8z;
	Tue, 25 Feb 2025 18:38:25 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmz6d-00000000lA3-2JHO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:52:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D8FB7612B1;
	Tue, 25 Feb 2025 17:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DDDC4CEDD;
	Tue, 25 Feb 2025 17:52:27 +0000 (UTC)
Date: Tue, 25 Feb 2025 17:52:25 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/14] mm: Generalize arch_sync_kernel_mappings()
Message-ID: <Z74DWQJ7g-KNpHLY@arm.com>
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
 <20250217140809.1702789-13-ryan.roberts@arm.com>
 <4fad245f-a8a6-468b-82d5-13f089aa525b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fad245f-a8a6-468b-82d5-13f089aa525b@arm.com>
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

On Tue, Feb 25, 2025 at 05:10:10PM +0000, Ryan Roberts wrote:
> On 17/02/2025 14:08, Ryan Roberts wrote:
> > arch_sync_kernel_mappings() is an optional hook for arches to allow them
> > to synchonize certain levels of the kernel pgtables after modification.
> > But arm64 could benefit from a hook similar to this, paired with a call
> > prior to starting the batch of modifications.
> > 
> > So let's introduce arch_update_kernel_mappings_begin() and
> > arch_update_kernel_mappings_end(). Both have a default implementation
> > which can be overridden by the arch code. The default for the former is
> > a nop, and the default for the latter is to call
> > arch_sync_kernel_mappings(), so the latter replaces previous
> > arch_sync_kernel_mappings() callsites. So by default, the resulting
> > behaviour is unchanged.
> 
> Thanks to Kevin Brodsky; after some discussion we realised that while this works
> on arm64 today, it isn't really robust in general.
[...]
> As an alternative, I'm proposing to remove this change (keeping
> arch_sync_kernel_mappings() as it was), and instead start wrapping the vmap pte
> table walker functions with
> arch_enter_lazy_mmu_mode()/arch_exit_lazy_mmu_mode().

I came to the same conclusion why looking at the last three patches. I'm
also not a fan of relying on a TIF flag for batching.

> These have a smaller scope
> so there is no risk of the nesting (pgtable allocations happen outside the
> scope). arm64 will then use these lazy mmu hooks for it's purpose of deferring
> barriers. There might be a small amount of performance loss due to the reduced
> scope, but I'm guessing most of the performance is in batching the operations of
> a single pte table.
> 
> One wrinkle is that arm64 needs to know if we are operating on kernel or user
> mappings in lazy mode. The lazy_mmu hooks apply to both kernel and user
> mappings, unlike my previous method which were kernel only. So I'm proposing to
> pass mm to arch_enter_lazy_mmu_mode().

Note that we have the efi_mm that uses PAGE_KERNEL prot bits while your
code only checks for init_mm after patch 13.

-- 
Catalin

