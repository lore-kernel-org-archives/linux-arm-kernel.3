Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAF0C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 10:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EZMPuLn9lWRyJJinQ2c8b4OBBKHlDa+Kb1vfYZjvPU0=; b=td3V+uvOShJXMv
	TzyIKXbktnAS2i6bE0hSbyjw8GgKIKrHROy46H67/7JVvnygBsFqp0uq2zOti3zpU3Mq+fZAUyyU9
	UxeZGlnkbVlAKvLSlb0o/DQEx96t3ybZrZY/ZkPifopDvnYKcwCGnzrs31wpP91wfyjN0rNlwtxqD
	OesZxFF35a+uIZ6wTHP97kcBtNdoORD5tMzlJP/3LOZxMR8hgLuO+CN93kCRq8sCgCUPqWhNjzg29
	6jZwu1F4Fyd7OwDhnbOiV12kGZVMVw13KbWJg8ecmDCd7eSHqB7MHJpdt+tJhY9Kv7sD6cXMOSBml
	rmA7+nWdZSUvBZR6OE/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvYac-00000004fai-3WS7;
	Sun, 16 Aug 2026 10:59:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvYab-00000004faW-3ZyT;
	Sun, 16 Aug 2026 10:59:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C8B060055;
	Sun, 16 Aug 2026 10:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78C61F000E9;
	Sun, 16 Aug 2026 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786877980;
	bh=EZMPuLn9lWRyJJinQ2c8b4OBBKHlDa+Kb1vfYZjvPU0=;
	h=From:Subject:Date:To:Cc;
	b=mQiCOZPM10WFNlwj6S+/etLcOZ5lICzoIZa7PUr5atzrLfNCvr7yIRbgAh4jotlxM
	 5JyYhCmGz/YoEQDsBDLbHt0Y3c6AmaQ8D8x/q9pWH75AG7Ru5Mgprs/KNnXKyqaBsL
	 ejEpD2MHgWO73u0i3IFYum3fH4NH4kLKFKL5lO5dSr8ry9s8ne7h/aTShk4Y6Vpn7i
	 5CuWmafPB+x4jOqhGz0dGaKnl/EFmtwKu92IwkMy/uGbXJ4TNzKbV8gfkMfk2nTONT
	 mXjoku8XZsHQEWPnLFJuHj0gUgLc1MIXrDVZ1zTgt+/HzmRe1K+5BFceKLBRkqx4gB
	 ukxJvdpWvHM9g==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH 0/6] arch, mm/execmem: resolve confusion about
 set_direct_map_valid_noflush()
Date: Sun, 16 Aug 2026 13:59:23 +0300
Message-Id: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QqDMBAEf0XuuUc1iJX+SulDkq41pRclF0UQ/
 11tH2fZmZUUKUDpXqyUMAcNQzyguhTkexvf4PA6mExpmrKtGsYCLxBWZJ6FRyRRnks27Cza+mb
 rrqk7OvwxoQvLr/14/lkn94HPZ/B8OKtgl2z0/TmJDFmuIjxFzdZ9Qdu2A009wYShAAAA
X-Change-ID: 20260816-execmem-set-vm-perms-v0-2-bae847a4f64f
To: Andrew Morton <akpm@linux-foundation.org>
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Len Brown <lenb@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Ryan Roberts <ryan.roberts@arm.com>, Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Gleixner <tglx@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, 
 Will Deacon <will@kernel.org>, x86@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-pm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 loongarch@lists.linux.dev
X-Mailer: b4 0.17-dev
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

Recent discussion about implementation of execmem's ROX caches on arm64
revealed a confusion about how set_direct_map_valid_noflush()
implemented on different architectures.

On arm64 it sets or clears the PTE_VALID bit marking a PTE as present or
not present.

On other architectures it's a range version of
set_direct_map_invalid_noflush() and set_direct_map_default_noflush()

Unlike arm64::set_direct_map_valid_noflush(),
set_direct_map_default_noflush() not only marks PTE as present, but also
sets its default protection mode.

Other than that, initial design of execmem ROX caches didn't rely on
restoration of large mappings that's now available on x86, but
completely removed the memory allocated for the ROX cache from the
direct map to ensure that large mappings are not split. This precluded
usage of VM_FLUSH_RESET_PERMS for the ROX cache allocations and required
execmem to implement manipulation of the direct map alias.

Current implementation of ROX caches does not remove the direct map
alias but simply calls set_memory_rox() that updates the permissions in
both vmalloc address space and the direct map and relies on
collapse_large_pages() in x86 CPA to keep large mappings.

This allow using VM_FLUSH_RESET_PERMS for execmem ROX cache allocations
with small adjustments to set_direct_map APIs and vmalloc::reset_perms()
behaviour: adding number of pages parameter to set_direct_map APIs and
making resetting of the direct map permissions in vmalloc VMAP_HUGE
friendly.

Implement these adjustments, make execmem always use
VM_FLUSH_RESET_PERMS and revert set_direct_map_valid_noflush() changes.

[1] https://lore.kernel.org/all/20260611130144.1385343-4-abarnas@google.com

---
Mike Rapoport (Microsoft) (6):
      set_memory: add number of pages parameter to set_direct_map APIs
      mm/vmalloc: set area's page_order after allocation succeeds
      mm/vmalloc: constify vm parameter of get_vm_area_page_order()
      mm/vmalloc: make set_area_direct_map HUGE_VMAP friendly
      mm/execmem: use VM_FLUSH_RESET_PERMS for ROX cache allocations
      Revert "arch: introduce set_direct_map_valid_noflush()"

 arch/arm64/include/asm/set_memory.h     |  5 ++--
 arch/arm64/mm/pageattr.c                | 24 ++++---------------
 arch/loongarch/include/asm/set_memory.h |  5 ++--
 arch/loongarch/mm/pageattr.c            | 27 ++++-----------------
 arch/riscv/include/asm/set_memory.h     |  5 ++--
 arch/riscv/mm/pageattr.c                | 23 ++++--------------
 arch/s390/include/asm/set_memory.h      |  5 ++--
 arch/s390/mm/pageattr.c                 | 20 ++++------------
 arch/x86/include/asm/set_memory.h       |  5 ++--
 arch/x86/mm/pat/set_memory.c            | 16 ++++---------
 include/linux/set_memory.h              | 12 ++++------
 kernel/power/snapshot.c                 |  4 ++--
 mm/execmem.c                            | 42 ++++++---------------------------
 mm/secretmem.c                          |  6 ++---
 mm/vmalloc.c                            | 31 ++++++++++++++++--------
 mm/vmalloc.h                            |  2 +-
 16 files changed, 68 insertions(+), 164 deletions(-)
---
base-commit: 1029098ee3275ea5b78e329ce132262affa2f8cc
change-id: 20260816-execmem-set-vm-perms-v0-2-bae847a4f64f

--
Sincerely yours,
Mike.


