Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87257C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WJEZw+9x/jEd5nomnZiXByrKMCRFDaAVRo5p+ehSw4E=; b=jGLLuOaiQ70MXB
	MCCw9scjM/i3Tqr85Yt9lRKB3Mve6pJvOUWVravSHH+ZW4ol0ZmlJF8vh5FUCOAPtia0yH+qo2z6J
	8/eanVisi7z75OvenLZMiFAZubcPYSwkB4esYe9NBuYZTnBuOMfEABgUWAt0BEcxgBCRJT3pmBKFD
	7wV351tI0khwE3aD17nKDW9Hv/bfLrKZMRHo7VvjB+o9oafcqkhofSsVwzVW7cSsQndfrRXUAYVF2
	aauT2e5sC6Gkw1tZUOZUPbgZenVaQuTYxLoaFzkw9BgK2qnny25BOUnrMzmkdI7J5myxm5abht8Qi
	I7n+HGUhCeroD9ZCCTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8oP-00000004jvy-23D9;
	Fri, 10 Jul 2026 10:50:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8oN-00000004jvT-3XHC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:50:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 413B5437D3;
	Fri, 10 Jul 2026 10:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FA71F00A3A;
	Fri, 10 Jul 2026 10:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783680627;
	bh=WJEZw+9x/jEd5nomnZiXByrKMCRFDaAVRo5p+ehSw4E=;
	h=From:Subject:Date:To:Cc;
	b=jvNpz50O/5E2VXWt/YbRjL36y/6Uv4nqe2F2So4M00tY+kTpB6dZNZkDq88So/9h7
	 FPEmtTLnn8oYAQpoLO0Oee5Eb3WAFx2uBZueusrF/5we/ZFruxxDunLOcuwj/IHNZ2
	 KAGj5goKudawqSj8Fli2LxVn5j8lF6FdckW70IiVErJjcE4WlprTAiTdKTSpgGmtIK
	 pH3kqAvywiNCrHLO2BtowqPcnIu6wYvsIoXDZ1RwCZr8IBHKzELYjxqKedIzGqgOdn
	 ZQGLPXonzu9vG7riMj81A3NqmUOkNauNDsaMyDQT8/2EQAsW4FfEgTm/RDmc4NS02J
	 Hv6p0I5VEI75A==
From: Lorenzo Stoakes <ljs@kernel.org>
Subject: [PATCH 0/2] mm: fix UAF caused by race between ptdump and vmap
 pgtable freeing
Date: Fri, 10 Jul 2026 11:49:17 +0100
Message-Id: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC3OUGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0MDXYh63bLcxALdosTkVN20zApdo0ST5MRkSwsLS2MLJaDWgqJUoDD
 Y2OhYCL+4NCkrNbkEZJZSbS0A/Km8rngAAAA=
X-Change-ID: 20260710-series-vmap-race-fix-2a4cac988938
To: Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: David Carlier <devnexen@gmail.com>, Dev Jain <dev.jain@arm.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lorenzo Stoakes <ljs@kernel.org>, stable@vger.kernel.org, 
 syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3435; i=ljs@kernel.org;
 h=from:subject:message-id; bh=sMz40sYlXTtliml43cNKfdXOdD7XpzaddnUQc2wMyQY=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLICzqWfedV9ys7mTqWo11PRvSdz91c+qs7fd+Lw5Gy2R
 1+V/ZyUOkpZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjCRJTMZGSYnzTsRodv6btXm
 qltSArffHelo5mkK9vC0jvync44ripeRYX73dpt3y0znvXRKL4271rq+bqqB1pTemgh/wYL6/Ct
 FvAA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

Kernel page table walkers fall into two broad categories - those ranges
where no exclusion is required via walk_kernel_page_table_range_lockless()
and those where exclusion is required via walk_kernel_page_table_range()
or walk_page_range_debug().

The former category is used only by arm64 arch code operating on ranges it
both wholly owns and does not concurrently write.

The latter category consists of kernel page table walkers operating on
ranges that are wholly owned (but which need exclusion against concurrent
writers).

The lock used for exclusion is the mmap lock, and for kernel ranges this
the mmap lock on init_mm.

ptdump is a special case being both the only user of
walk_page_range_debug(), and the only case in which it walks ranges it does
not own.

This presents a problem, as page tables may be freed under ptdump. And
indeed there is a use-after-free bug in the kernel as a result, which this
series addresses.

vmap promotes page tables to huge leaf entries where possible, freeing the
lower leaf page table when it does. It does this with no meaningful locks
held against concurrent ptdump walks.

As a result, use-after-free can currently occur. This series addresses the
issue by having the vmap huge promotion logic acquire the mmap read lock
while both setting the huge page table entry and freeing the prior leaf
page table.

The ptdump code already acquires the mmap write lock, so by doing so we
ensure that the ptdump walker only ever observes either the huge page table
entry or the existing page table entry, and nothing is freed underneath it.

A mitigation for this issue was already applied for arm64 in commit
a93b45fd397 ("arm64: Enable vmalloc-huge with ptdump"), which this series
has to deal with carefully.

This mitigation resolves the issue by acquiring the mmap read lock on
init_mm on vmap page table free if a ptdump is in progress.

However the fix in this series would cause a deadlock if we were to simply
apply it for arm64 without also reverting the change.

This is because vmap may acquire the read lock before ptdump attempts to
acquire the write lock, which then gets queued, and rwsem starvation rules
mean that the (unacknowledged) nested mmap read lock in the arm64 code
would also block, meaning the original read lock is never released and thus
deadlock.

This series works around this by #ifndef CONFIG_ARM64'ing the mmap read
lock in vmap logic, then partially reverting commit
a93b45fd397 ("arm64: Enable vmalloc-huge with ptdump"), keeping the
enablement of huge vmap support, and removing the ifdeffery with the
partial revert patch.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
Lorenzo Stoakes (2):
      mm/vmalloc: acquire init_mm read lock on huge vmap promotion
      Revert "arm64: Enable vmalloc-huge with ptdump"

 arch/arm64/include/asm/ptdump.h |  2 --
 arch/arm64/mm/mmu.c             | 43 ++++-------------------------------------
 arch/arm64/mm/ptdump.c          | 11 ++---------
 include/linux/mmap_lock.h       |  1 +
 mm/pagewalk.c                   | 22 +++++++++++----------
 mm/vmalloc.c                    | 41 ++++++++++++++++++++++++++++++---------
 6 files changed, 51 insertions(+), 69 deletions(-)
---
base-commit: a635d6748234582ea287c5ffeae28b9b23f91c7e
change-id: 20260710-series-vmap-race-fix-2a4cac988938

Cheers,
-- 
Lorenzo Stoakes <ljs@kernel.org>


