Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087A1CD6E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HpQ+gbfLV3ep0KH+7DICYy7iPk4t74I7YHv+Lp6qVhM=; b=ROTrKLyaCAvLAvBf9t/LYzQuMX
	FslQ6cXlhbBL2tYmn0JqnKrFYBAIz9RPNdL4jPn9xH8ZozEmjfgOvqpLdUd6o3Cd5iRHxdYFAGxQd
	m+hcwjBmFDN5KcpeHF/mq95O6gCGqWmRcn4wWdyJ6Vm7AfVEsWKTnofFNj7d+ikMcwriOGqmD+biD
	99sll9pa7/Xz4F3BVjcN6de14Vi1V+Dn5gUlbJg5vOoqgJfQSVMgsJkCBVLq5smg7lbRR7HYSFZhy
	MoiLXSiSgZHjnHfAd7olMyhGn4OFBBlsh0I9RfQfMmZ+zXCN7sAexD4URLMdZunh9i6ewFKn7HJOj
	P2j4F6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyj9-00000007bfP-3kuv;
	Fri, 29 May 2026 15:02:23 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyj7-00000007bdS-06Az
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:02:22 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-bdbb76c4f25so921265066b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780066937; x=1780671737; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HpQ+gbfLV3ep0KH+7DICYy7iPk4t74I7YHv+Lp6qVhM=;
        b=WXnJAFqznFy7RMVaPOUPV3piMud98Z2wWGuBthdDci91vYtJFjt5FqHUgOHm8Rlf2i
         xzjHJbTqUGqqEpxxCVChgI00isjTj1z2BwvcWnYvSo+r/m7rhdVZCLnFCNqhczQMeVza
         a0YdOoYIKVElnHN0C6C/Z/mye6R7oWpMCRztOwlhzI0Bn8UC+U9FUSJjOKeXqPkgT0MO
         j8P5U+Iktp0zPfexKwzZcCqZ3O2itO/ZuioSVHnkkdySPgsbtsW+GdFpadlnK2/UYzwx
         XU5TnFhLGRrOWv//DgvmSGglZHWQxjc9vneXZQ3D45/0A0JII33NymsVi5HZ7H/Uq0Uq
         W8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066937; x=1780671737;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HpQ+gbfLV3ep0KH+7DICYy7iPk4t74I7YHv+Lp6qVhM=;
        b=aj+V2UqTKa1vxYsHbth1YPGbe2bmx5MNHHb4spYrRWBxOJfj9BhHBDTiqFmg6rzbnW
         jLOQIfKyS0GE3AD00VaVlRizHvJewrM5f9/5I+e/OiLFDBIN5xehLOPky1ypO7aPQ15E
         BJsw/Z9ebQpQ8i73QjpQHkqeMXYhLqspC1GVkbVd62Lgsa2E7jy2d9D/P2Vg3g2PRA68
         SMLNz7XYaivyWXbKqx4EtxO2u5b3RiZcuyrn/q8LKyHB4hi2ujwlAz2lwmdiAq2I9Md3
         +AgG3Qnk1KQQ1Fbujqx2HRIZmmt0qwBLqV1pYneCFpc256y7PjNF9jO2NqC75aukFp7m
         eXXQ==
X-Gm-Message-State: AOJu0Yz+5hDgBLK7dZPqB6GxFY9gx2qlzM0/0nq8bfHSgFPK4ctfNCRy
	fk/lo+LCsbWJ9//u2cePbzNHBKO+wgEKMAdfW0TxQX681kbxiUJI8KhnbpSk2/8bTuBvNAOV4X3
	p6K3CtSoW03owcOxbx8rdYVTniTFKhN5hsSVDnw+XqJQrNNANK/AnlWSWTbO8Mc2u+CZtbiH3RJ
	lQPjDPsg9M2gebzyjYM8TyBTJ3mhUQ/IUsdJB+CcmryOZu
X-Received: from wrub1.prod.google.com ([2002:a5d:4d81:0:b0:43d:77d4:5f14])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:7945:b0:bce:a1fc:6877
 with SMTP id a640c23a62f3a-be9cad0b276mr172778166b.24.1780066936607; Fri, 29
 May 2026 08:02:16 -0700 (PDT)
Date: Fri, 29 May 2026 17:01:51 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6016; i=ardb@kernel.org;
 h=from:subject; bh=1J4/eBxWUzNbzISy66s5wYlPFITBFouUFXFgBmOizGU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtyVbx/uurJFp+7lxfraxzxO+j8qpt7ylXD8r3Oblc1D
 1q97K/sKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABOZzcnwPzZyX86SrtObDbx+
 z714VZhZY8c1Kb2LJRHXPl3UVlXMUGL4X+DuW1oyQ1zWb99Z/cx301JrXATZI7vYmbc++evbL/u BEwA=
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150150.1670604-17-ardb+git@google.com>
Subject: [PATCH v7 00/15] arm64: Unmap linear alias of kernel data/bss
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_080221_094539_C9EB25D2 
X-CRM114-Status: GOOD (  22.79  )
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

Changes since v6:
- Improve commits logs and comments
- Add acks from Kevin
- Reorder patches so remapping data/bss R/O occurs after moving the zero
  page into .rodata
- Drop zero page cache flush from SuperH rather than casting away the
  constness
- Map kfence pool with NO_EXEC_MAPPINGS

Note that Sashiko had some comments on patch 15/15 [1] but none of those
seem accurate. (I have tested both suspend/resume and hibernate under
QEMU and both work as expected)

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
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
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
[1] https://sashiko.dev/#/patchset/20260526175846.2694125-17-ardb%2Bgit%40google.com

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
  powerpc/code-patching: Avoid r/w mapping of the zero page
  sh: Drop cache flush of the zero page at boot
  mm: Make empty_zero_page[] const
  arm64: mm: Map the kernel data/bss read-only in the linear map
  arm64: mm: Unmap kernel data/bss entirely from the linear map

 arch/arm64/include/asm/mmu.h     |   2 +
 arch/arm64/include/asm/pgtable.h |   4 +
 arch/arm64/kernel/vmlinux.lds.S  |   8 +-
 arch/arm64/mm/fixmap.c           |   6 +-
 arch/arm64/mm/kasan_init.c       |   2 +-
 arch/arm64/mm/mmu.c              | 164 ++++++++++++--------
 arch/powerpc/lib/code-patching.c |  52 +------
 arch/sh/mm/init.c                |   3 -
 include/linux/pgtable.h          |   2 +-
 mm/mm_init.c                     |   2 +-
 10 files changed, 121 insertions(+), 124 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.54.0.823.g6e5bcc1fc9-goog


