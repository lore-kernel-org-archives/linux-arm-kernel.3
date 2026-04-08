Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D048C105D99B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 02:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NsrZbLl1QzZTc/sVfW1bjaWTpzc/m8nfU9cBBbRPadA=; b=clDSC8Cc61yHEEvuTdBe6S9QHY
	GlwX2NzfWsmeR+Jn0n6Kpqz62mYGji4GVK6Bo1+FzWDOoOxaS+pRW5Gjb3IvO7V6kkJ4bt1hGD7g5
	10mvfHx4rr6dwwJtIk+Gv9goMEBs3/ha5o3rO99PDy+pte4LM1cKgsVC2ZOGVysKSzB/vSoS1IlfV
	t/iMj/usTR1m7qvxTNGX7bATiD+frya7zOLXAmRe21cUBw+OuP/2lgmZqUUMVQbyN6WY8OdmX7OjY
	ZBWb5kwAQJj3q8qCmGzfpnnxbMbKOAfutqB8q+/YgRDoiZjC1WdD1C4PFPi1qTbLzFGxuAI3zEZTl
	CHbsqtRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ0x-0000000898B-0BNM;
	Wed, 08 Apr 2026 02:51:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ0w-00000008984-2x7H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 02:51:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BEBB6012B;
	Wed,  8 Apr 2026 02:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20871C116C6;
	Wed,  8 Apr 2026 02:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775616692;
	bh=ZAYGoVOU/xBKdOabvdM+YHz4qLCWVs6z32hXbsZWLKI=;
	h=From:To:Cc:Subject:Date:From;
	b=bGlckLx1cBnsEHrKYQQDWFEGJw8n34hukhP7o/9LIps1uAhfRIBIc7D1zccT9fcDY
	 xmornJxJwwxJMSez+qRcwgSuvHPbPEnmHd1j0BeVr/H1FgTNIGOfoGgOIqQr9oR9hs
	 V5CSoZMm80LxqS5Y7C1/smRaUcFTy9oDpk5DtKA2AaSIFSPYF5ZGCFKM7Tk3miJcNj
	 GAh5hGPrnTeQsmrx434opxdiD94Qw3c0lAjUjJQY6j6CxuPU92j3euAsVqip4o030U
	 2kdXk1l0R4FW4SzBxRqGqUrR5qyoVeBUSd8a+Op0pA8z3Fe3kbraGYLqq+CwLz6DB6
	 bi9uYsaXIzyMQ==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: linux-kernel@vger.kernel.org,
	anshuman.khandual@arm.com,
	ryan.roberts@arm.com,
	ajd@linux.ibm.com,
	rppt@kernel.org,
	david@kernel.org,
	Xueyuan.chen21@gmail.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [RFC PATCH 0/8] mm/vmalloc: Speed up ioremap, vmalloc and vmap with contiguous memory
Date: Wed,  8 Apr 2026 10:51:07 +0800
Message-Id: <20260408025115.27368-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This patchset accelerates ioremap, vmalloc, and vmap when the memory
is physically fully or partially contiguous. Two techniques are used:

1. Avoid page table zigzag when setting PTEs/PMDs for multiple memory
   segments
2. Use batched mappings wherever possible in both vmalloc and ARM64
   layers

Patches 1–2 extend ARM64 vmalloc CONT-PTE mapping to support multiple
CONT-PTE regions instead of just one.

Patches 3–4 extend vmap_small_pages_range_noflush() to support page
shifts other than PAGE_SHIFT. This allows mapping multiple memory
segments for vmalloc() without zigzagging page tables.

Patches 5–8 add huge vmap support for contiguous pages. This not only
improves performance but also enables PMD or CONT-PTE mapping for the
vmapped area, reducing TLB pressure.

Many thanks to Xueyuan Chen for his substantial testing efforts
on RK3588 boards.

On the RK3588 8-core ARM64 SoC, with tasks pinned to CPU2 and
the performance CPUfreq policy enabled, Xueyuan’s tests report:

* ioremap(1 MB): 1.2× faster
* vmalloc(1 MB) mapping time (excluding allocation) with
  VM_ALLOW_HUGE_VMAP: 1.5× faster
* vmap(): 5.6× faster when memory includes some order-8 pages,
  with no regression observed for order-0 pages

Barry Song (Xiaomi) (8):
  arm64/hugetlb: Extend batching of multiple CONT_PTE in a single PTE
    setup
  arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple
    CONT_PTE
  mm/vmalloc: Extend vmap_small_pages_range_noflush() to support larger
    page_shift sizes
  mm/vmalloc: Eliminate page table zigzag for huge vmalloc mappings
  mm/vmalloc: map contiguous pages in batches for vmap() if possible
  mm/vmalloc: align vm_area so vmap() can batch mappings
  mm/vmalloc: Coalesce same page_shift mappings in vmap to avoid pgtable
    zigzag
  mm/vmalloc: Stop scanning for compound pages after encountering small
    pages in vmap

 arch/arm64/include/asm/vmalloc.h |   6 +-
 arch/arm64/mm/hugetlbpage.c      |  10 ++
 mm/vmalloc.c                     | 178 +++++++++++++++++++++++++------
 3 files changed, 161 insertions(+), 33 deletions(-)

-- 
2.39.3 (Apple Git-146)


