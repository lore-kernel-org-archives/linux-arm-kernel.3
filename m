Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441E8CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 05:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WSsZqaAWHj+v1vpsCxKzKu7IVzLHCQIKTgP9zE3Hky4=; b=RgCdwtoolrGck59SRXkAsPnkIA
	5GGJw6mVhjxEduW6A8psHF3uRiIhddNoP28HYb29Z1MyfkeuiRJXrjeY6BUXCylWDDjxazDixzDiI
	ecY7Uu8AOmd1gayL98ufzY3IA3w/j7FD5Bqbc6fWnlCqqIjyyxOZtBiNI0teBD0xsre7Iak7m7K76
	+3onbn5pZyzU0+lovlZFGveEXwSBw/Y7StToQjIHnjpvORmx3GrvhxDP7OlaDTeCjLLU6uKPHsazW
	Iovv+Qo2TDtUKD/pzp0om4uBqfz/x73SeiTpC6p/GXvlZxw+LlbeF7twa1KCzurGevD1+lnpyizCm
	I0H5rjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQIUG-00000009rUj-2tzV;
	Fri, 22 May 2026 05:31:56 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQIUE-00000009rU6-2biA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 05:31:55 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-367c2a39fcfso3215954a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 22:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779427913; x=1780032713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WSsZqaAWHj+v1vpsCxKzKu7IVzLHCQIKTgP9zE3Hky4=;
        b=dW7MWh2tkr9pNlz4InWpcSXMy2BjwEtchlRwxElUDnAuncSO06OJSO+XZbneuCFvST
         2V8eylkVQa0TnUFwF4ES1GJ6hghSVWTyWbGFj7ofjeh3rM3PIXXkuE0vkXvyEVAfI5xi
         2kzx5qO0F/lWELAZpCDDAalT44WZE+QNEIYqBvpAsrmaHMYA52iiA3OZYo+8JWGKZx2k
         OU5N36GvSFzpINWpgQfie0cAlHrBDXtKbSYe7AZUbT4IXjEGlqdaqkIwymIDwJpCcy8A
         BhOlX3/6e9Ez/9APeVeEfzHvqMbapU41NEmHJ5dXcEi5RUoFpr19qT9EoPCvZoIANha/
         wOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779427913; x=1780032713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSsZqaAWHj+v1vpsCxKzKu7IVzLHCQIKTgP9zE3Hky4=;
        b=URqGYr+xwBJ1A8ikAkZ9cjS7sl3NeW1UIGBpgBVewawVuOYz5U89JQ3sl7pnD/LoG7
         BxSBgc7gEx/tlFZaegAQumPD2A9xL1sNVUQiUq1rzitPCGrzYeZOZtSroRShB+4DwesO
         DlNXGontfoJSZBeIYreDiLo2R3eLSDNn9LtpxIOIqsliJSqYxkoOk575Un7+ENsLI0QS
         VnI/Ec9cf1tJ5mvhKYyegea0tfJYEJzOYW5V2OtVlK7b6wV7D6hhC6IfAOGJHJWXuxxf
         8sye//W1Im0PrWn52dftzobDdux6JQGdMUl/u43QbRoJAegbzko0MmLwrRBHiw1NEHNP
         Wqlg==
X-Forwarded-Encrypted: i=1; AFNElJ8FnYgHEtKDG+cEg1B69Hf4kDlkZFERRa8P6X25q6e1PN9bQNhG3c4geEwvt6WoO/aSaeSfiMrONs+nmB6tCevm@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjd37q95V0GBkcrQClZOLqGEQ4f/ExiHRtGnWZLY3uoJzagH0c
	GU0o+L2ccC386uYms/pjWTfhxm03sfjN3bh0RoCgjp84yhyt5Yyb1b6J
X-Gm-Gg: Acq92OE80+ybol+1I6xaX3kPD8GYZTAUweIGkKUwiuuKP8hai/GHQljK0zA1RoIc/3+
	ykNUjnk3FxJFOECRjnRrEG6p49U7NkmgBoUrjW0XsrxXfGO3r+Ev2J0DcfZmAWcqSSy6hXVs4U1
	qKMdyiOENE0A49AHz1S5kKII/jWqhWFZ43ScaivXtJHgrqqPF1jqNVHuvn0QCIOUUzTE+s6kPiP
	76zpQKHOzNXshswvB0o6kvnaD6zEEw6qDSuTpOAL39EOFa9lP/8nV7ugGrWvJKR+ZJ65zUsrohX
	y7vSX0y7XiqLZ54cW4hN2fZUYJ4V84+nOtgyu05zgQwcoDpYvxUlZUz8HP1ElacUOEMVjkhMa9i
	duqHrjwRTA6M6PmT6Lw3ubfaqaWcREVJZBgWhBMmMw9sOBlYCYHim0HsObgd2fX68IcMtxRXPx8
	jMwbb/PUEQ7meLafPdZapo90UZawRrrwxI99YOrUFtlHb1o6K71m4=
X-Received: by 2002:a17:903:2b0f:b0:2bd:63dc:b7ad with SMTP id d9443c01a7336-2beb05a227emr21130695ad.2.1779427913092;
        Thu, 21 May 2026 22:31:53 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d68adsm4782665ad.32.2026.05.21.22.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:31:52 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: baohua@kernel.org,
	Xueyuan.chen21@gmail.com,
	dev.jain@arm.com,
	rppt@kernel.org,
	david@kernel.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org,
	jiangwen6@xiaomi.com
Subject: [PATCH v3 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap with contiguous memory
Date: Fri, 22 May 2026 13:31:40 +0800
Message-Id: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_223154_667525_A30322ED 
X-CRM114-Status: GOOD (  11.69  )
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

From: jiangwen6 <jiangwen6@xiaomi.com>

This patchset accelerates ioremap, vmalloc, and vmap when the memory
is physically fully or partially contiguous. Two techniques are used:

1. Avoid page table rewalk when setting PTEs/PMDs for multiple memory
   segments
2. Use batched mappings wherever possible in both vmalloc and ARM64
   layers

Besides accelerating the mapping path, this also enables large
mappings (PMD and cont-PTE) for vmap, which are currently not
supported.

Patches 1-2 extend ARM64 vmalloc CONT-PTE mapping to support multiple
CONT-PTE regions instead of just one.

Patch 3 extracts a common helper vmap_set_ptes() that consolidates PTE
mapping logic between the ioremap and vmalloc/vmap paths, handling both
CONT_PTE and regular PTE mappings. This prepares for the next patch.

Patch 4 extends the page table walk path to support page shifts other
than PAGE_SHIFT and eliminates the page table rewalk for huge vmalloc
mappings. The function is renamed from vmap_small_pages_range_noflush()
to vmap_pages_range_noflush_walk().

Patches 5-6 add huge vmap support for contiguous pages, including
support for non-compound pages with pfn alignment verification.

On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core and
the performance CPUfreq policy enabled, benchmark results:

* ioremap(1 MB): 1.35x faster (3407 ns -> 2526 ns)
* vmalloc(1 MB) mapping time (excluding allocation) with
  VM_ALLOW_HUGE_VMAP: 1.42x faster (5.00 us -> 3.53us)
* vmap(100MB) with order-8 pages: 8.3x faster (1235 us -> 149 us)

Many thanks to Xueyuan Chen for his testing efforts on RK3588 boards.

Changes since v2:
- Use __fls instead of fls in arch_vmap_pte_range_map_size (patch 2)
- Add WARN_ON checks in vmap_pages_pmd_range (patch 4)
- Fix flush_cache_vmap to use saved start address instead of the
  already-advanced addr (patch 5)
- Rename __vmap_huge() to vmap_batched() (patch 5)
- Add caller parameter and unroll while(1) loop (patch 5)
- Squash patch 7 into patch 5 (stop scanning for compound pages after
  encountering small pages)

Changes since v1:
- Fix condition order and use PMD_SIZE instead of CONT_PMD_SIZE in
  patch 1 (Dev Jain)
- Squash patch 3+4 and patch 5+7 (Dev Jain)
- Replace "zigzag" with "page table rewalk" in commit messages
  (Dev Jain)
- Rename vmap_small_pages_range_noflush() to
  vmap_pages_range_noflush_walk() (Dev Jain)
- Extract vmap_set_ptes() as a new patch to consolidate PTE mapping
  logic between vmap_pte_range() and vmap_pages_pte_range(), handling
  both CONT_PTE and regular mappings (Mike Rapoport)
- Support non-compound pages in get_vmap_batch_order() by falling
  back to physical contiguity scanning with pfn alignment check
  (Dev Jain, Uladzislau Rezki)
- In get_vmap_batch_order(), filter out orders that the architecture
  cannot batch by checking arch_vmap_pte_supported_shift() directly.
  This avoids overhead for orders 1-3 on ARM64 CONT_PTE with 4K
  pages. (patch 5)

Barry Song (Xiaomi) (5):
  arm64/hugetlb: Extend batching of multiple CONT_PTE in a single PTE
    setup
  arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple
    CONT_PTE
  mm/vmalloc: Extend page table walk to support larger page_shift sizes
    and eliminate page table rewalk
  mm/vmalloc: map contiguous pages in batches for vmap() if possible
  mm/vmalloc: align vm_area so vmap() can batch mappings

Wen Jiang (1):
  mm/vmalloc: Extract vmap_set_ptes() to consolidate PTE mapping logic

 arch/arm64/include/asm/vmalloc.h |   6 +-
 arch/arm64/mm/hugetlbpage.c      |  10 ++
 mm/vmalloc.c                     | 235 ++++++++++++++++++++++++-------
 3 files changed, 201 insertions(+), 50 deletions(-)

-- 
2.34.1


