Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106A4CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Ph0PYjrVkzoxIOEpCFOVz5Nww7QyWvmwqNXMq1WP4E=; b=DiII18Oz1UbYc5gXQWctK970eL
	8nJpI8HdtZ4medfJlrbT9AlI75YMJJWLD5v8wCQQqyQlIrckZMKW8wy6kMufiTyCaEpVTTQg9JId2
	FsQC6dLYqi29Sw4HSUA/8GQPiDkJwFXf5P0bsoNexWEdLNcri79y6fh88KStGwntesKwfdipaswrV
	tr6y6XzKyNG+HvdU79VwkX6DC9QvTr2LIAVz4rSPGvcQvKpQT4KNazwny6wUbM3Rga5IX3CIfa5OK
	oU8RLPI07wxMGgZtE4kolkpWDIZeqSMcSpFB6/Oo5Cg5NQChkS6mLEXTEUpvhWEO+ebmquqzZZV8v
	S1ofzZog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMD6-00000001yTH-42qD;
	Tue, 19 May 2026 15:18:20 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMD4-00000001yR7-2duN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:18:19 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48fdacf2616so18321565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779203896; x=1779808696; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Ph0PYjrVkzoxIOEpCFOVz5Nww7QyWvmwqNXMq1WP4E=;
        b=waIxp67iLI/IfoIjZBo8cFEWjW5iDsLbbBl2envIQAdrLA8O6toggzx47piUg3SVE1
         7r4zGg5bnSJxxIuQbRC7RCtZh9bfCbNC1whyZKD0gTxmk9VWNnJKnKuMuSZBi0JN7CNm
         oPZgfDojlxB/1gu7cEBWS9/BzqF9eSRiwiO/8KoieJqc9Y+xWlwmOwaPiRLeiWHPh8iD
         wDsO+nNzM7ffoXDKJ2uKhoFTNpmiS9aSaNvUZklyVTVNG5FJ++xGtx0NX85XG3SlLUdN
         uTPsJw05vlo/6hLts5z5jiGFcD+UCpLSlR1qQgtQze5SCWaXQPXc4q6GRIocL+HWh488
         +Gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203896; x=1779808696;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Ph0PYjrVkzoxIOEpCFOVz5Nww7QyWvmwqNXMq1WP4E=;
        b=it4dp6+SijkhxwEhvs/BiP1NLEOmLleFmDAvaNESblr+YMriFzbXMbs7Fktzj8LOP6
         iBvOgE9V1TP00Lthk35YWSrJRsk6iz57gUV3lvwIV2Fq9mwiR5UM6dNBY1oD93QXUYJv
         ufwou9TTF27RzFDaiW01y9n5hAx+nrAyBnNvHysMFYRTy2JRC57ALRuJMs5JJLO4IXh6
         +9yex6RI0dZoITI/h4C06n0TN9Nd/Bm5kr6Vd3ln8JQ35DDubCqk9042fMitcpdXVkrw
         989dAvTomSTRxlDAn8eEkJv4r8n0BQ8Lg21BGD3h2t6qNVQLrkTxPP6e0wqWr+xfcBS9
         L7jQ==
X-Gm-Message-State: AOJu0YybwDtLQlx9W0UiPWROs3H77pDmunBuCiRJO1OBKruTWAcVMUBG
	H0pHKIEu8j87ISRAlc87+9zCoQPkdy0hnuUmKoIsPjXYlOHlvP3zyMU4jWE4bz2SeELwMzlEJbj
	ZVgXySNDolmS4LA1OfQLcW2ku1oDdU3gd/vIMkQvMqkYVjH6v1ynozWZzM4Inp4XRRwRC4uzOka
	nl8sZhIyzug4ZECpO7fGGCu1fN9xMqBanRsFdU6dPnLXTb
X-Received: from wmpj8.prod.google.com ([2002:a05:600c:4888:b0:48e:914f:1eff])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:630a:b0:48f:e249:4094
 with SMTP id 5b1f17b1804b1-48fe632663emr372340605e9.18.1779203895433; Tue, 19
 May 2026 08:18:15 -0700 (PDT)
Date: Tue, 19 May 2026 17:16:17 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3950; i=ardb@kernel.org;
 h=from:subject; bh=BfiC0GgeYqFLHZMi63jQd6ueIObiG50ZwO7JVw9lq90=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIYun7uCD1LW29zmS5p9gmMnBPcXya+T7hzd9amtaVA8LL
 ppw2OBBRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiIsjwjw5o1DHveb37Ccv1C
 /yufS+tkgkKu5x00Wi/Jqyy4yP04lyIjw3M52VN8QnNmTgnRYP7z+ucK531LSjtfPF1akOSyrz9 xHQcA
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519151616.2557018-15-ardb+git@google.com>
Subject: [PATCH v5 00/13] arm64: Unmap linear alias of kernel data/bss
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_081818_723346_BF062797 
X-CRM114-Status: GOOD (  17.71  )
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

From: Ard Biesheuvel <ardb@kernel.org>

One of the reasons the lack of randomization of the linear map on arm64
is considered problematic is the fact that bootloaders adhering to the
original arm64 boot protocol (i.e., a substantial fraction of all
Android phones) may place the kernel at the base of DRAM, and therefore
at the base of the non-randomized linear map. This puts a writable alias
of the kernel's data and bss regions at a predictable location, removing
the need for an attacker to guess where KASLR mapped the kernel.

Let's unmap this linear, writable alias entirely, so that knowing the
location of the linear alias does not give write access to the kernel's
data and bss regions.

Changes since v4:
- Update the correct [early] mapping in patch #1
- Make empty_zero_page[] const instead of __ro_after_init
- Drop patches that remap the fixmap page tables r/o for now
- Don't force page mappings for the data/bss linear alias, as it is no
  longer needed for set_memory_valid()
- Add acks

Changes since v3:
- Drop bogus patch adding hierarchical PXN to the fixmap mapping, which
  breaks the KPTI trampoline (thanks to Sashiko)
- Add generic patch to move the empty_zero_page to __ro_after_init, as
  it now lives in generic code.
- Add patches to remap the linear aliases of the fixmap page tables
  read-only too - these live at an a priori known offset in the linear
  map if physical KASLR was omitted, and control a priori known
  addresses in the virtual kernel space.
- Rebase onto v7.1-rc1

Changes since v2:
- Keep bm_pte[] in the region that is remapped r/o or unmapped, as it is
  only manipulated via its kernel alias
- Drop check that prohibits any manipulation of descriptors with the
  CONT bit set
- Add Ryan's ack to a couple of patches
- Rebase onto v7.0-rc4

Changes since v1:
- Put zero page patch at the start of the series
- Tweak __map_memblock() API to respect existing table and contiguous
  mappings, so that the logic to map the kernel alias can be simplified
- Stop abusing the MEMBLOCK_NOMAP flag to initially omit the kernel
  linear alias from the linear map
- Some additional cleanup patches
- Use proper API [set_memory_valid()] to (un)map the linear alias of
  data/bss.

Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc; Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Liz Prucka <lizprucka@google.com>
Cc: Seth Jenkins <sethjenkins@google.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jann Horn <jannh@google.com>
Cc: linux-mm@kvack.org
Cc: linux-hardening@vger.kernel.org

Ard Biesheuvel (13):
  arm64: mm: Map the linear alias of text/rodata as tagged
  mm: Make empty_zero_page[] const
  arm64: mm: Preserve existing table mappings when mapping DRAM
  arm64: mm: Preserve non-contiguous descriptors when mapping DRAM
  arm64: mm: Remove bogus stop condition from map_mem() loop
  arm64: mm: Drop redundant pgd_t* argument from map_mem()
  arm64: mm: Permit contiguous descriptors to be rewritten
  arm64: kfence: Avoid NOMAP tricks when mapping the early pool
  arm64: mm: Permit contiguous attribute for preliminary mappings
  arm64: Move fixmap page tables to end of kernel image
  arm64: mm: Don't abuse memblock NOMAP to check for overlaps
  arm64: mm: Map the kernel data/bss read-only in the linear map
  arm64: mm: Unmap kernel data/bss entirely from the linear map

 arch/arm64/include/asm/pgtable.h |   4 +
 arch/arm64/kernel/vmlinux.lds.S  |  10 +-
 arch/arm64/mm/fixmap.c           |   7 +-
 arch/arm64/mm/mmu.c              | 134 +++++++++++---------
 include/linux/pgtable.h          |   2 +-
 mm/mm_init.c                     |   2 +-
 6 files changed, 90 insertions(+), 69 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.54.0.563.g4f69b47b94-goog


