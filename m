Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3CDCD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nxjbBO6XBWohQRwRzUkPRE1mQeaWFxMCb2Cc9RW2UPo=; b=2+gyy7REuvNzRsW9E/bkuJIT/j
	FUSyOmWONn0noldeTIca1ldr6lmjadR0zdM8M4/SUli8o5H6fIOjUyenuaLgW7eg2MksJhmExowOE
	maLKnHEROjr7gJIbK3OfJ15evIwXhtx8iMIb2oAGKtOFUXU36D8tvB6oW6Ew/l0jwEVP0h+ucyDNp
	AY1KAH9qhHMBxiYkf+xucuvrEvJoRuDNx+TyjmerO/+O4Xidq0PMw43tMY+IMq1HDHrBrC1EAMURD
	pxT8xFBXS/Ka6jbZrdsThHNMdKhCCR1VAx8GGKj3CJoDYJ1Gm/ByoD8zM1LKll5c3Z/yeL0wT0/5a
	LJW9BBWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSZZ-000000055w8-1XYX;
	Thu, 14 May 2026 09:41:41 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSZX-000000055ub-2CNL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:41:40 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so3271707a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 02:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778751697; x=1779356497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nxjbBO6XBWohQRwRzUkPRE1mQeaWFxMCb2Cc9RW2UPo=;
        b=sMxLM+YfZTRindhN225XQdgHvkk+BJu5WOp901BpvCjVuADT4Jx0TS/eapHHARvk8h
         8YHFmsqXLuOiV7ybgaZlK1DuuCzdL//yn+xlm7XbOv2R33xIssZUAyjPzrEkmN0gLLMo
         ueMD7wE2rifnSUuxKnVmfbx2SrjMK1lchdCEUKwokw6HtrsYA+xdqr2zZsi0Zrfg4JmD
         +UbZu/5hpi5TP6nokSFR0THWjpE5/wGrpJMbWQPj6iJotSlBIakVKWSIQcaqiLj0FDKJ
         7gUUNfmXEmavUHozs6g3WpqXlO0NdiaenTfgch6PdsxvSu4bAfTU0WbTDCPNitwZbBSL
         c5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751697; x=1779356497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxjbBO6XBWohQRwRzUkPRE1mQeaWFxMCb2Cc9RW2UPo=;
        b=gEwp1dmGW0bdUU641cTG5nesLWScfGCnnbGZSEFJDkaAJKvUsSGQjBlCn2YJsEOdbD
         ldLsuhr3p6pmYUozRJmD0rLvT1hkncs+VsksFBcf0EN9lqWNu0sl4aSBNlJusaFBnH3+
         MPyuXpsiOD2ANVGk5qPmOE9+92688KsEdYdYDWm6BPerupGq45zO5kHM65m+Y2Sx0fRO
         RuTArYNSBa0EflnaNmX4fgMlzx3L0w2AOVEpt8dE+6aGH4t4yGYhSJGU0KKQ04rY7Gq7
         ZAE1mqzx2QqzckacWIqROOqnGmO5aZa1v/zJCtNPmWc0nkyrppBfjlhS9rHDNTUfUXiC
         ZkuA==
X-Forwarded-Encrypted: i=1; AFNElJ8zP/E5Q7GNup1rtYkTCatToHBolFiFPQlMAU3EHdwOwwON2CHyPOPMCNLCDYt6FQH96TAjBlOjbiJjbxMXHUji@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4krHY+8Tv4/BkAxctMD781xsCUH+LUjHDs9Cvhg8bbTuaT543
	XAuJCG6d3Lwt6zRKQDeye4g0U8/OighQzZFj1eJWUA0iQGrNzW58yVVArfqRKp4rUsQ=
X-Gm-Gg: Acq92OE/cn3EmllfJ3P9t53+PgEUEXbW+S7tD92x45ywBtPsm5nMuY21DpfqkaZV86K
	APUIohCigkTdufMYsEeFgZiFP3fXinAsgubDNSbJZyoCcAELbQOzxMm2ft5fZEDysmrXvBM87te
	MDj+6ukWGVxu0SHxj/7wGzL1wbwYyaNNuN3oczDVV+8pyj6Atw4Hn127VJemoTCULBVO4XspogI
	Q0LO6SVj2zeiPXgfS9ZmHFLu3aWtdlk7+mORE/hyUPt9xA59ldrsXXwhTAx8OKthgQbejjLkowZ
	SawaVyTEXGY2dJlrHXrbbf/5vQipTNRqFVELXzZZMyLFcucidAVYyngCAZJYL7apG5CYbjXz8au
	3hGTpfp54plQAax6832dZlfxeueZ+4DkPURoyVosGXBKpMKglCt2WnqtPkcLRw4oNe3wSu9E4fl
	m3vwPIbfXpuxBxAM43yvZOG4f2Jhd6PnnDdezqC8vw1HwU8w==
X-Received: by 2002:a05:6a21:3294:b0:39c:787:f197 with SMTP id adf61e73a8af0-3af822881d3mr8281874637.36.1778751697073;
        Thu, 14 May 2026 02:41:37 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb114a70sm2351244a12.22.2026.05.14.02.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:41:36 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
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
	Wen Jiang <jiangwen6@xiaomi.com>
Subject: [PATCH v2 0/7] mm/vmalloc: Speed up ioremap, vmalloc and vmap with contiguous memory
Date: Thu, 14 May 2026 17:41:01 +0800
Message-Id: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_024139_565026_9263280D 
X-CRM114-Status: GOOD (  11.13  )
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

Patches 5-7 add huge vmap support for contiguous pages, including
support for non-compound pages with pfn alignment verification.

On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core and
the performance CPUfreq policy enabled, benchmark results:

* ioremap(1 MB): 1.35× faster (3407 ns -> 2526 ns)
* vmalloc(1 MB) mapping time (excluding allocation) with
  VM_ALLOW_HUGE_VMAP: 1.42× faster (5.00 us -> 3.53us)
* vmap(100MB) with order-8 pages: 8.3× faster (1235 us -> 149 us)

Many thanks to Xueyuan Chen for his testing efforts on RK3588 boards.

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

Barry Song (Xiaomi) (6):
  arm64/hugetlb: Extend batching of multiple CONT_PTE in a single PTE
    setup
  arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple
    CONT_PTE
  mm/vmalloc: Extend page table walk to support larger page_shift sizes
    and eliminate page table rewalk
  mm/vmalloc: map contiguous pages in batches for vmap() if possible
  mm/vmalloc: align vm_area so vmap() can batch mappings
  mm/vmalloc: Stop scanning for compound pages after encountering small
    pages in vmap

Wen Jiang (1):
  mm/vmalloc: Extract vmap_set_ptes() to consolidate PTE mapping logic

 arch/arm64/include/asm/vmalloc.h |   6 +-
 arch/arm64/mm/hugetlbpage.c      |  10 ++
 mm/vmalloc.c                     | 221 ++++++++++++++++++++++++-------
 3 files changed, 189 insertions(+), 48 deletions(-)

--
2.34.1


