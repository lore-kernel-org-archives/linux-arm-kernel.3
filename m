Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE86CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n0vWMvJYNWuq9BUtLKfBugHf8I5ifX5auG02Ilaszzw=; b=Z8fRpZG0oWsn7KG4BVDQcDWJB3
	1YnNbADIhkfBzcekaROuZW0ISrET0ey0iorXe4MLps5+b8k3nuvz59f/is9NrllcfXX+jmBqIK9oE
	RdZqXUr3UJ9aMPhw4oFivsuKVxOQ+BuRgHcYpZK7XpEtfiyYNe/NEk4yozMJTSyYpYPoVBkYxFmjO
	0fPphFfonlUvV0Fo1M9XT5B9t5G31lq+nN7bkWlfNfw7bFrU5L+1bChUqUY+XEXs3EaJtYt698Huv
	x0tSb9cxCq4GNH7MNnZGs4SAWGkLw8o45f8EIzFg1678Jn74MFwhsYlyHIthU94H1HgjsajQoiW/z
	uMMGpYKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw3q-00000002mjx-2Ocd;
	Tue, 26 May 2026 17:59:26 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw3n-00000002mie-0B7R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:59:25 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-49047e9ca88so35876705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779818360; x=1780423160; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n0vWMvJYNWuq9BUtLKfBugHf8I5ifX5auG02Ilaszzw=;
        b=oNNqjwA5yRCn5WKIwAFCjGU7hciz1J9aFqKhWw+hcnhvHZkmkgvfcrIDVrjtMFHIeY
         NJrGCTddWQfNRY+Ei3VLHHBVb22kraGpeWz65L5rQKko33GbWecmJaxu4GKEWlyoMx/q
         skW6eHAnjVsvncT/hHMXomZg6UVffkOzv+469skZEqDsPuhRU0wuKv6KgF8E3Ce16wO1
         knuTVRY+6T8XtGPLN1RtCGWreD6LT2LmAg6QrluMB6C5t2h3r20UnHxLquCsqJhUzlTf
         wozBf9J1QRij9tfkfc7SIqJYSqUKUwehIVZKynO1Cc32kRsaDq9q5e6TftoTKJMDxjjN
         m2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818360; x=1780423160;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n0vWMvJYNWuq9BUtLKfBugHf8I5ifX5auG02Ilaszzw=;
        b=msTetV0Ux858ZZNXYocN6axVAPyA6wRhbTvYu/aAg8okEHtiu2wvttMlEKCTSq/Nq6
         5vhUubTlqbrF2IjAUw/bN8Be6bQPJPQdxUDWpKWYMbEaGTUnFQfWgUJjZVTxT6zwnXo+
         UA8r0AuB/dYdf361GI+VEVdUsUsdJ/gtp5IFQb4UWHsHHjRn1AU5PL7Ctmq8fHvqwo7g
         O0ZE095uhvdW8t3hWVyz1ONENZ4ESil+vQmEdY/IOmKtsYucwhPD4De0nZ5vlOC0FsMw
         0AEG3mRpVybfC2dGnu3SeS83UfhexE/coFvVvubK98VhJmsZ+KH2DgSVz3rosgKeolR+
         PK0A==
X-Gm-Message-State: AOJu0YwiwHIEeJORuECJNz2H4pR1WJSqnjQthGhfmzccN1ia216+//fW
	/PVqQRC0v/f7yytQg0HoA37EZzjaTZdALROiTnqkcDsGJhfa87kb2KGFQRiSEnxDYs4bsdlSra3
	bA0Cw3ZP6ErHsgSC+JbJpDDiidkUeKhjxrcjGd0NDYmR+V/YZi/O3C2lIQIDqNdcFf2Qm4yT0mq
	jrMgXmP0hpZZKKBPS5mPEr6ks23ZHPe5RtCjJJt6npu0Ek
X-Received: from wmbfj10.prod.google.com ([2002:a05:600c:c8a:b0:489:1f67:5a81])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3581:b0:490:482c:4391
 with SMTP id 5b1f17b1804b1-490482c4586mr347539725e9.23.1779818360071; Tue, 26
 May 2026 10:59:20 -0700 (PDT)
Date: Tue, 26 May 2026 19:58:47 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5484; i=ardb@kernel.org;
 h=from:subject; bh=U8803ZhDPt8GJ8Atx6VTFHHmARjJ+nX3UDhXHVYH9xo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUv0frj6sbw7T/xOHgou4E0vMGDKO3VgAmdWo+XnCVG6T
 1oEOto7SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwERU7jL8L1Z3r3IPnBwlZzZh
 j9LEyREPWzJrNh55n6V8I1KW299LiZHhyvMT6w/KRn2cG6r8u+luO6dv1+6fH92Tg3pK51buVHT gBAA=
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526175846.2694125-17-ardb+git@google.com>
Subject: [PATCH v6 00/15] arm64: Unmap linear alias of kernel data/bss
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_105923_113060_53F16731 
X-CRM114-Status: GOOD (  22.18  )
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

Changes since v5:
- Reorder series in ascending order of impact, so that the first few can
  be merged earlier if desired. This also makes the patch that remaps
  the data/bss linear alias as tagged redundant, which is therefore
  dropped.
- Add patch #3 to address an existing issue spotted by Sashiko
- Fix thinko in contiguous region check (#5), where the whole region
  needs to be considered and not only the first entry (dropped Rb as
  well) - this addresses the kfence issue Sashiko reported on v5 [0]
- Update commit log on #6 to clarify that changing permission bits on
  PTE_CONT entries is safe as long as PTE_CONT itself does not change
- Likewise, drop hunk that adds the PTE_CONT bit to the 'permitted' mask
  in pgattr_change_is_safe(), as changing it is not safe. (#8)
- Move kasan's additional page table to pgdir BSS as well
- Use (NOLOAD) on the .pgdir.bss section so it does not get emitted into
  vmlinux
- Add powerpc and SuperH patches to deal with empty_zero_page[] being
  made const

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
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-sh@vger.kernel.org

[0] https://sashiko.dev/#/patchset/20260519151616.2557018-15-ardb%2Bgit%40google.com

Ard Biesheuvel (15):
  arm64: mm: Remove bogus stop condition from map_mem() loop
  arm64: mm: Drop redundant pgd_t* argument from map_mem()
  arm64: mm: Check for pud_/pmd_set_huge() failures on kernel mappings
  arm64: mm: Preserve existing table mappings when mapping DRAM
  arm64: mm: Preserve non-contiguous descriptors when mapping DRAM
  arm64: mm: Permit contiguous descriptors to be manipulated
  arm64: kfence: Avoid NOMAP tricks when mapping the early pool
  arm64: mm: Permit contiguous attribute for preliminary mappings
  arm64: Move fixmap and kasan page tables to end of kernel image
  arm64: mm: Don't abuse memblock NOMAP to check for overlaps
  arm64: mm: Map the kernel data/bss read-only in the linear map
  powerpc/code-patching: Avoid r/w mapping of the zero page
  sh: cast away constness from the zero page when flushing it from the
    cache
  mm: Make empty_zero_page[] const
  arm64: mm: Unmap kernel data/bss entirely from the linear map

 arch/arm64/include/asm/mmu.h     |   2 +
 arch/arm64/include/asm/pgtable.h |   4 +
 arch/arm64/kernel/vmlinux.lds.S  |   8 +-
 arch/arm64/mm/fixmap.c           |   6 +-
 arch/arm64/mm/kasan_init.c       |   2 +-
 arch/arm64/mm/mmu.c              | 153 ++++++++++++--------
 arch/powerpc/lib/code-patching.c |  52 +------
 arch/sh/mm/init.c                |   2 +-
 include/linux/pgtable.h          |   2 +-
 mm/mm_init.c                     |   2 +-
 10 files changed, 111 insertions(+), 122 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.54.0.794.g4f17f83d09-goog


