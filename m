Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C44CC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZetBUrAfgYvJ3751E83jJC9yJJ2fFWR6KUF/uLNNtvc=; b=TZWqSTGYPTkVA4
	lhr8NrJjGe04XuuwYY468A+cMmOYpllvA1uBnx4z620bd8JSbLomShLycbBf92rI5dhvvK30F47A5
	1CA7HlbvKKRtJV1SWV/JzOEcIBsHwYXXTqD22C/KsxwLk999IAMj/3aBkREEhMjaJYB0i9axb0cEu
	W0cUtFZUXUTnrfvd1+uiLEbzr4KyL0QeUdby8c78DxW2IbvxPGz6eAwizDzSIXYhIizi2I2ExEnL1
	yhQXcR4z7UMziNx7q2SFakAOZ1LBW1hyD8tc2QEfmwKwqlBNZEmJn6jvQ6KxHf1Q15roxSqTAngsM
	KcqcwKlkZjD9tItsMeHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDFv-00000009sp5-0vRO;
	Tue, 21 Jul 2026 16:23:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDFt-00000009sov-3w35;
	Tue, 21 Jul 2026 16:23:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79D2241919;
	Tue, 21 Jul 2026 16:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975F51F000E9;
	Tue, 21 Jul 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651021;
	bh=ZetBUrAfgYvJ3751E83jJC9yJJ2fFWR6KUF/uLNNtvc=;
	h=From:Subject:Date:To:Cc;
	b=bKjAfKsbBVu+UX/+6ubeBKSZVrtYBGGmMFCvMVo0EgOah126cGNZc1m3nf/tSJHlP
	 1XGCJWOYnQajM7WPyDCsaEZhcVCvRFSlSe+0CDNZ8FqPEC78I8sLEs+N7zbYuEp85y
	 0q2Usw57xoFEIg2gIxkaxj18lx1bEaKN1FOCNdwZ8P5QKnOzBJMmcot0GfbTqoR9ES
	 vnbFiLApwhlI0xHgUEJcBwc5hLhgwyKrY40Xca8PoDiQIKx2RHR7GrupxLW/SEqtcz
	 poesQNcWfJ5LNa47UUTwvnHdHiNTzctQV2dFkLd4maZUecG8LANBRbba17wmRvpXJg
	 oi/xisth2VEYg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH RFC 00/18] arch, mm: create a generic
 set_memory/change_page_attr core
Date: Tue, 21 Jul 2026 19:23:23 +0300
Message-Id: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPycX2oC/yWMQQrCMBBFr1Jm7WAatAW3ggdwKy6SOKYjJJWZW
 JTSu5vq8j3++zMoCZPCoZlBaGLlMVdoNw2EweVIyLfKYI3tTG9bjJRrEVCpYKI0ygcngy2abr/
 rnTHeOoJaP4Xu/P49X+B8OsL1L/XlHxTK+rnOvFNCLy6HYVWjcOS8TU4LCSzLF2cn7oCgAAAA
X-Change-ID: 20260721-generic-set-memory-v0-1-06547a00b2ae
To: linux-mm@kvack.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Brendan Jackman <jackmanb@google.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, x86@kernel.org, 
 Dave Hansen <dave.hansen@intel.com>, Juergen Gross <jgross@suse.com>
X-Mailer: b4 0.16-dev
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

Currently there are 6 independent implementations for set_memory and
set_direct_map APIs.

With increasing demand for kernel page table manipulations, for example
"Direct Map Removal Support for guest_memfd" [1] and "mm: ASI direct map
management" [2], it makes sense to have a generic core for kernel page
table manipulation in mm/ with helpers in the architecture specific
code.

Coincidentally, there was a recent fix to a UAF bug [3] that had to
touch set memory functionality in subtly different way in different
architectures rather than to fix the core logic in a single place.

x86's implementation is the most versatile and most battle tested and as
such it is the best base for the generic implementation.

As the first step, pull x86 implementation to core mm code and convert
loongarch and riscv to use the new CPA core. These architectures were
chosen because the conversion is quite straight forward and does not
require tens of preparation patches.

Once this settles, the next step I'm planning is to convert arm64. This
would be much more involved than loongarch and riscv together, so I
didn't even aspire to include arm64 in the first RFC. That said, I have
a very ugly arm64 prototype that rewrites arch/arm64/pageattr.c to use
the generic CPA infrastructure and replaces the existing implementation
of page table splits for systems that support bbml2. But there's a lot
of yak shaving there to get from a PoC to actual patches.

Patch 1 is already applied to the tip tree and I posted patch 2
separately [4], but I included them both here for the completeness. 

Patches 3-10 reorganize x86 CPA implementation to make it friendlier
for generalization.

Patches 11-14 move CPA core and CPA test from x86 to mm/ and slightly
massage the code to allow its use on other architectures.

Patches 15-16 convert riscv to use the common core and adjust riscv
implementation of _noflush APIs to actually be _noflush.

Patches 17-18 convert loongarch to use the common core and adjust
loongarch implementation of _noflush APIs to actually be _noflush.

The patches are lightly tested on x86 and riscv and build tested on
loongarch.

When converting riscv and loongarch my goal was to keep the new
implementation equivalent to the existing (except the _noflush bit), but
I must say that they way loongarch updates permissions for the entire
large leafs rather than splitting them seems a bit suspicious to me.

Regarding AI use, I started with a two-page prompt describing what I
want and how I want it and then it took me about 10 iterations of
additional half-pagers to explain why I don't like what LLM produced.

In the end I despaired to make it write commit messages the way I like
and edited them manually.

With that, the tool was really instrumental with conflicts resolution
during rebases and building and testing with a single "go!" command.

[1] https://lore.kernel.org/all/20260410151746.61150-1-kalyazin@amazon.com
[2] https://lore.kernel.org/all/20250924-b4-asi-page-alloc-v1-0-2d861768041f@google.com/
[3] https://lore.kernel.org/all/20260717-series-vmap-race-fix-v5-0-606a0ac6d3e5@kernel.org
[4] https://lore.kernel.org/all/20260717-verify-rwx-fix-v2-1-fc23141311d6@kernel.org

To: linux-mm@kvack.org
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Brendan Jackman <jackmanb@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: "Liam R. Howlett" <liam@infradead.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: loongarch@lists.linux.dev
Cc: x86@kernel.org

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
Mike Rapoport (Microsoft) (18):
      x86/mm/pat: Don't gate cpa_lock on debug_pagealloc_enabled()
      x86/mm/pat: fix effective RW computation in lookup_address_in_pgd_attr()
      x86/mm/pat: replace x86-speficic pg_level with generic pgtable_level
      x86/mm/pat: use page table accessors for effective RW/NX bits
      x86/mm/pat: use a generic helper for the large page size
      x86/mm/pat: introduce an inline helper to check if alias needs update
      x86/mm/pat: introduce cpa_handle_large_page()
      x86/mm/pat: use cpa_split_data structure to pass split parameters
      x86/mm/pat: use a single locked lookup for PTE verification
      x86/mm/pat: move the large page size calculation to should_split_large_page
      x86/mm/pat, mm: set_memory: pull change_page_attr() core to mm/
      x86/pat/mm, mm/set_memory: abstract the CPA page table lock
      mm/set_memory: read page table entries with pXdp_get()
      x86/mm/pat, mm: move cpa-test to mm
      riscv: convert set_memory to the generic CPA implementation
      riscv: make set_direct_map_*_noflush actually noflush
      loongarch: convert set_memory to the generic CPA implementation
      loongarch: make set_direct_map_*_noflush actually noflush

 arch/loongarch/Kconfig                  |   1 +
 arch/loongarch/include/asm/pgtable.h    |  42 +++
 arch/loongarch/include/asm/set_memory.h |   9 +
 arch/loongarch/mm/pageattr.c            | 196 ++++------
 arch/riscv/Kconfig                      |   1 +
 arch/riscv/include/asm/pgtable.h        |  36 ++
 arch/riscv/include/asm/set_memory.h     |   7 +
 arch/riscv/mm/pageattr.c                | 489 ++++++++-----------------
 arch/x86/Kconfig                        |   1 +
 arch/x86/Kconfig.debug                  |   6 -
 arch/x86/include/asm/pgtable.h          |  36 ++
 arch/x86/include/asm/set_memory.h       |  50 +++
 arch/x86/mm/pat/set_memory.c            | 611 ++++----------------------------
 include/linux/pgtable.h                 |  72 +++-
 include/linux/set_memory.h              |  97 +++++
 mm/Kconfig                              |   3 +
 mm/Kconfig.debug                        |   7 +
 mm/Makefile                             |   1 +
 {arch/x86/mm/pat => mm}/cpa-test.c      |  66 ++--
 mm/set_memory.c                         | 396 +++++++++++++++++++++
 20 files changed, 1092 insertions(+), 1035 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260721-generic-set-memory-v0-1-06547a00b2ae

--
Sincerely yours,
Mike.


