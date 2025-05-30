Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96BBC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 14:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m/1XyZhkINgjqjL6rNsMcBMnKJ0gfD5AmRtZg+RBhuk=; b=paTM0eSiLq89M8KW8yP9EJmkF9
	aoCc8hhk8FTHvdunClBcWvrwVLOqdaPaRB2L7OSjsaB+dGUKUtNc7YbKyyaUO7PHHscjBf6XRXNTn
	MKI2pX63BRAl6Hhqre6ZMwVhguoMM7u+ycT/w3NO9g8YO82dkhxA9EoKNQCQXEOLxv+AeGNeDsuxp
	Zf251YMl2YXfFqw9Iprqfesd2bnbAQ/E2gsgAcIUQ6ma1gQOaol/355Yol+q/XjNuD0O0CyNTF5sB
	o88fybKi+TFqjmF9i3hK+3F+3Qhgn0KjNCvbOGo6w6CIPx/f/e8kvDHNpyGUC2E7ZrcgfVETy9b3X
	/qpH7GUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0OG-00000000rNC-2TJk;
	Fri, 30 May 2025 14:07:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0M6-00000000qXa-2mXT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 14:05:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82C55169C;
	Fri, 30 May 2025 07:04:48 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6E5D3F673;
	Fri, 30 May 2025 07:04:59 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-mm@kvack.org
Subject: [RFC PATCH v1 0/6] Lazy mmu mode fixes and improvements
Date: Fri, 30 May 2025 15:04:38 +0100
Message-ID: <20250530140446.2387131-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_070506_789720_AEFAD5F9 
X-CRM114-Status: GOOD (  19.70  )
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

Hi All,

I recently added support for lazy mmu mode on arm64. The series is now in
Linus's tree so should be in v6.16-rc1. But during testing in linux-next we
found some ugly corners (unexpected nesting). I was able to fix those issues by
making the arm64 implementation more permissive (like the other arches). But
this is quite fragile IMHO. So I'd rather fix the root cause and ensure that
lazy mmu mode never nests, and more importantly, that code never makes pgtable
modifications expecting them to be immediate, not knowing that it's actually in
lazy mmu mode so the changes get deferred.

The first 2 patches are unrelated, very obvious bug fixes. They don't affect
arm64 because arm64 only uses lazy mmu for kernel mappings. But I noticed them
during code review and think they should be fixed.

The next 3 patches are aimed at solving the nesting issue.

And the final patch is reverting the "permissive" fix I did for arm64, which is
no longer needed after the previous 3 patches.

I've labelled this RFC for now because it depends on the arm64 lazy mmu patches
in Linus's master, so it won't apply to mm-unstable. But I'm keen to get review
and siince I'm touching various arches and modifying some core mm stuff, I
thought that might take a while so thought I'd beat the rush and get a first
version out early.

I've build-tested all the affected arches. And I've run mm selftests for the
arm64 build, with no issues (with DEBUG_PAGEALLOC and KFENCE enabled).

Applies against Linus's master branch (f66bc387efbe).

Thanks,
Ryan


Ryan Roberts (6):
  fs/proc/task_mmu: Fix pte update and tlb maintenance ordering in
    pagemap_scan_pmd_entry()
  mm: Fix pte update and tlb maintenance ordering in
    migrate_vma_collect_pmd()
  mm: Avoid calling page allocator from apply_to_page_range()
  mm: Introduce arch_in_lazy_mmu_mode()
  mm: Avoid calling page allocator while in lazy mmu mode
  Revert "arm64/mm: Permit lazy_mmu_mode to be nested"

 arch/arm64/include/asm/pgtable.h              | 22 ++++----
 .../include/asm/book3s/64/tlbflush-hash.h     | 15 ++++++
 arch/sparc/include/asm/tlbflush_64.h          |  1 +
 arch/sparc/mm/tlb.c                           | 12 +++++
 arch/x86/include/asm/paravirt.h               |  5 ++
 arch/x86/include/asm/paravirt_types.h         |  1 +
 arch/x86/kernel/paravirt.c                    |  6 +++
 arch/x86/xen/mmu_pv.c                         |  6 +++
 fs/proc/task_mmu.c                            |  3 +-
 include/asm-generic/tlb.h                     |  2 +
 include/linux/mm.h                            |  6 +++
 include/linux/pgtable.h                       |  1 +
 kernel/bpf/arena.c                            |  6 +--
 mm/kasan/shadow.c                             |  2 +-
 mm/memory.c                                   | 54 ++++++++++++++-----
 mm/migrate_device.c                           |  3 +-
 mm/mmu_gather.c                               | 15 ++++++
 17 files changed, 128 insertions(+), 32 deletions(-)

--
2.43.0


