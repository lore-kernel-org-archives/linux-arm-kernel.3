Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7661C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSW6reyOWhAZxycw9g4uswJh9hZ0Rfu3Te/QCqTrdeU=; b=wQeP/ZYTR6smIXv0WSURZ+d10q
	I8pu0ZMt72kDHP1TolldIn3erO+LbL1G+x8Si05qubP8xyLViTAZNcP9RJj9D87ASFXMbVpAIxHuh
	NXwDsA5YJ+DjAaWkYk755+aWoVlznlHl6kwwVM2bFXnn9SDXhGtDkEGG2y8BaUYH5lOqbAGp4DobX
	YpKDiOU/PbItHqcLnk9iGI/jFDsl3+0GWp4240OTE2caDPSBmzVx7CxF20XQzKCIS5OdudIP8OqaD
	ZR9kSNin4yOAyg5ISjsjXRZ2ClcLDt0bdUsK4rPu4tZZ02g3dDQ24fV+DRS0GuUfTpuhS9/hIyMtm
	TilP2ytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQdT-00000004IHt-3cw5;
	Fri, 09 May 2025 16:31:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOCJ-00000003qvj-0f4y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:55:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86E8044A74;
	Fri,  9 May 2025 13:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1F8C4CEE4;
	Fri,  9 May 2025 13:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746798930;
	bh=fdEgs25vEPwqIgDrnCoFiHh3llkQsPglOvG51YbtKXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cXblmqskyFblffDqIbr+/c6MBW892Zb3wPl5bxT6As7LwCZajZNFcmDdRX6AHytbV
	 9vSSZfFgRIncwSDa5ENlP0wUWnr6jeitGiM+cdStS8i4FeYEIkdumqDNadGj2jAvQi
	 FiCz1fNrF8nj76CWna5vtebZntOjf9UvNF2A9XlkHiVXbYMF5Gb/cBOnGsZwnN23an
	 ZVR8fF/T8Q3p612Q764Ux0CGVM1TeoVomSSmBboUmsRzjhlFWils6LnmXgXYEqEvId
	 bY3sMHh6PwC5xvt00rjmMAmb5Ul1KI5TFvsLCNKWCu3tDUPP4dqEjgsb6RbsVp9VoV
	 wepWy+8oo9MDw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
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
	Ryan Roberts <ryan.roberts@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/11] Perf improvements for hugetlb and vmalloc on arm64
Date: Fri,  9 May 2025 14:55:18 +0100
Message-Id: <174679458910.1792901.13579160002600202326.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250422081822.1836315-1-ryan.roberts@arm.com>
References: <20250422081822.1836315-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_065531_237217_34997C3A 
X-CRM114-Status: GOOD (  14.33  )
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

On Tue, 22 Apr 2025 09:18:08 +0100, Ryan Roberts wrote:
> This is v4 of a series to improve performance for hugetlb and vmalloc on arm64.
> Although some of these patches are core-mm, advice from Andrew was to go via the
> arm64 tree. All patches are now acked/reviewed by relevant maintainers so I
> believe this should be good-to-go.
> 
> The 2 key performance improvements are 1) enabling the use of contpte-mapped
> blocks in the vmalloc space when appropriate (which reduces TLB pressure). There
> were already hooks for this (used by powerpc) but they required some tidying and
> extending for arm64. And 2) batching up barriers when modifying the vmalloc
> address space for upto 30% reduction in time taken in vmalloc().
> 
> [...]

Sorry for the delay in getting to this series, it all looks good.

Applied to arm64 (for-next/mm), thanks!

[01/11] arm64: hugetlb: Cleanup huge_pte size discovery mechanisms
        https://git.kernel.org/arm64/c/29cb80519689
[02/11] arm64: hugetlb: Refine tlb maintenance scope
        https://git.kernel.org/arm64/c/5b3f8917644e
[03/11] mm/page_table_check: Batch-check pmds/puds just like ptes
        https://git.kernel.org/arm64/c/91e40668e70a
[04/11] arm64/mm: Refactor __set_ptes() and __ptep_get_and_clear()
        https://git.kernel.org/arm64/c/ef493d234362
[05/11] arm64: hugetlb: Use __set_ptes_anysz() and __ptep_get_and_clear_anysz()
        https://git.kernel.org/arm64/c/a899b7d0673c
[06/11] arm64/mm: Hoist barriers out of set_ptes_anysz() loop
        https://git.kernel.org/arm64/c/f89b399e8d6e
[07/11] mm/vmalloc: Warn on improper use of vunmap_range()
        https://git.kernel.org/arm64/c/61ef8ddaa35e
[08/11] mm/vmalloc: Gracefully unmap huge ptes
        https://git.kernel.org/arm64/c/2fba13371fe8
[09/11] arm64/mm: Support huge pte-mapped pages in vmap
        https://git.kernel.org/arm64/c/06fc959fcff7
[10/11] mm/vmalloc: Enter lazy mmu mode while manipulating vmalloc ptes
        https://git.kernel.org/arm64/c/44562c71e2cf
[11/11] arm64/mm: Batch barriers when updating kernel mappings
        https://git.kernel.org/arm64/c/5fdd05efa1cd

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

