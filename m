Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E8CCCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7+Oe27eSt/CYawxJQEUCht00laB/j73DqAE8wC3WOc=; b=E3uaMY8va1c++zuxqkfReRuo7Z
	sXnTdlHNOuJ3dnsuw8yh0qmlMLCzQH/IcR/e8n/e8/BRxYqUNa08rtxfCCAvzE9H1wf+NtVqEa7Vy
	LpqPol+a0nQZ0mcv6Fetf9XoxNKElkgb9E7fB5LTN0MzMOKEnq6qjqPN7Di3YBQ5jV6EcG0cOvZsS
	SEKBeIZAgwEHz4ca7Y9aOB0lKLSwDGQ/p/BZUllbRm3caVKvN6bWSZerFXFcsiyibTPukJxeXwKa+
	4L+yX/86rECVCOrO8BnkffNwsgo8zUP3agd2B5M5DicOHyCRFJrvpg79mtVFJrw0qJ3lPS0tSaY4o
	pXTm99/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInrs-00000007bFC-11Y1;
	Mon, 19 Oct 2026 13:57:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInrq-00000007bD7-070L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:57:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 670A4602A8;
	Mon, 19 Oct 2026 13:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C211F000C7;
	Mon, 19 Oct 2026 13:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792418253;
	bh=n7+Oe27eSt/CYawxJQEUCht00laB/j73DqAE8wC3WOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D8NtNGoAFZ0TCZ6QZKcy3kPtd6jlKC+Q2GKoojRYOFRD6Bv+6wrvg4mV1jN+1QkbR
	 JKkYO5n4+nwiZSbiVLLefK+dT913itaShCeezg/xSBdIQu/S1M1RjBuVGLsHgA7E06
	 KdeVbLb4O7i9WJobThb6Rwdw8i12LsnO1aQuNZVqKZ6s41BsTE3Az3aNtqZXCc78bm
	 caNjghOAvYVxbkOYe2ygfHpaqcNzURLFu4srffyRxEvkZaHmQPrRGNgwrwUmPSXVxj
	 eosrroJR21F9fSG3WcHoFY6I84mVoeBMOBl5r0hQhqDKdteQBFiMutX8m0Wl+Z8wgg
	 QaKiQ9Toj4Ozg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: liulhong617 <liulhong617@gmail.com>,
	Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-5.10] arm64: mm: fix accidental linear mapping of no-map reserved memory
Date: Mon, 19 Oct 2026 09:46:52 -0400
Message-ID: <20261019135441.1420968-121-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019135441.1420968-1-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.57
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

From: liulhong617 <liulhong617@gmail.com>

[ Upstream commit 7ace06a01efaba1ec585630aa4c98ac39b38452a ]

When reserved-memory regions with the "no-map" property are not
page-aligned, the kernel may accidentally map them into the linear
mapping, contradicting the no-map semantics.

The root cause is a mismatch between /proc/iomem's address boundaries
and the actual page table mapping boundaries:

1. /proc/iomem derives its ranges from memblock via
   memblock_region_reserved_base_pfn/memblock_region_reserved_end_pfn,
   which perform PFN rounding so the displayed boundaries are
   page-aligned. This gives the impression that the no-map region
   occupies whole pages.

2. However, memblock_mark_nomap() splits memblock.memory regions at
   exact byte boundaries (memblock_isolate_range preserves raw DT
   base/size with no alignment). When for_each_mem_range iterates the
   non-NOMAP regions adjacent to a no-map region, it returns start/end
   values that are NOT page-aligned — they are the precise byte
   boundaries from the memblock split.

3. These sub-page-aligned values are passed to
   __create_pgd_mapping_locked(), which does:
     phys &= PAGE_MASK;
     addr = virt & PAGE_MASK;
     end = PAGE_ALIGN(virt + size);
   The downward rounding of phys via PAGE_MASK extends the mapped
   range backward into the adjacent no-map region, effectively
   including no-map memory in the linear mapping.

For example, with 64K pages, reserved_region@A2000000 (base=0xA2000000,
size=0x8000, no-map) causes for_each_mem_range to return
start=0xA2008000 for the next mappable region. After phys &= PAGE_MASK,
the actual mapping starts at 0xA2000000 — the entire no-map region is
incorrectly mapped.

Fix this by rounding the mappable range inward to PAGE_SIZE boundaries
before passing it to __map_memblock: start is rounded UP and end is
rounded DOWN. This ensures the mapped area never overlaps with adjacent
no-map regions. The cost is at most one page of unmapped gap at each
boundary, which is preferable to violating no-map semantics.

Signed-off-by: liulhong617 <liulhong617@gmail.com>
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

This tree is **6.12.111** (`pending-6.12`). The candidate is
`7ace06a01efab` (“arm64: mm: fix accidental linear mapping of no-map
reserved memory”). It is not in this checkout. The buggy path is, and
the original patch was written against this `map_mem()` shape.

===============================================================
PHASE 1: COMMIT MESSAGE FORENSICS
===============================================================

Step 1.1: PARSE THE SUBJECT LINE
Record: `[arm64: mm:] [fix] [do not linearly map sub-page-aligned DT no-
map reserved memory]`

Step 1.2: PARSE ALL COMMIT MESSAGE TAGS
Record:
- `Signed-off-by: liulhong617 <liulhong617@gmail.com>` (author)
- `Signed-off-by: Will Deacon <will@kernel.org>` (arm64 maintainer;
  applied to for-next/mm)
- No `Fixes:`
- No `Reported-by:` / `Tested-by:` / `Reviewed-by:` / `Acked-by:` /
  `Link:` / `Cc: stable`
- Absence of `Fixes:`/`Cc: stable` is expected for this review and is
  not a negative signal

Step 1.3: ANALYZE THE COMMIT BODY TEXT
Record:
- **Bug:** `no-map` reserved-memory that is not page-aligned can still
  land in the arm64 linear map.
- **Symptom:** `/proc/iomem` looks page-aligned (PFN rounding), but page
  tables map the no-map bytes because `memblock_mark_nomap()` splits at
  byte precision and `__create_pgd_mapping_locked()` does `phys &=
  PAGE_MASK` (start rounded down into the hole).
- **Example:** 64K pages, `reserved_region@A2000000` size `0x8000`; next
  mappable start `0xA2008000` becomes mapping start `0xA2000000`.
- **Root cause:** byte-precise NOMAP split + PAGE_MASK downward
  rounding.
- **Fix:** round the mappable range inward (`PAGE_ALIGN(start)`, `end &
  PAGE_MASK`) before `__map_memblock`. Cost: at most one unmapped page
  per boundary.
- **Version info in message:** none. Mailing-list follow-up (verified)
  was on v6.1.177-rt, 64K pages.

Step 1.4: DETECT HIDDEN BUG FIXES
Record: Not hidden. Explicit isolation/correctness fix, not cleanup.

===============================================================
PHASE 2: DIFF ANALYSIS - LINE BY LINE
===============================================================

Step 2.1: INVENTORY THE CHANGES
Record:
- File: `arch/arm64/mm/mmu.c` (+14 / −0)
- Function: `map_mem()` / `map_mem(pgd_t *pgdp)` in this tree
- Scope: single-file surgical change in the boot-time linear-map loop

Committed hunk (origin/master `map_mem(void)`):
```
for_each_mem_range(i, &start, &end) {
+       start = PAGE_ALIGN(start);
+       end = end & PAGE_MASK;
+       if (start >= end)
+               continue;
        __map_memblock(...);
}
```

The mailing-list v1 was against `map_mem(pgd_t *pgdp)` and kept this
tree’s existing `if (start >= end) break;` before the new inward
rounding — that is the 6.12 shape.

Step 2.2: UNDERSTAND THE CODE FLOW CHANGE
Record:
- **Before:** `for_each_mem_range` skips `MEMBLOCK_NOMAP` via
  `should_skip_region()`, but adjacent ranges keep raw byte boundaries.
  Those go to `__map_memblock` → `__create_pgd_mapping_locked()`, which
  rounds `phys` down and `end` up, pulling no-map bytes into
  `PAGE_KERNEL`.
- **After:** start rounded up, end rounded down; empty leftover skipped.
  Linear map never overlaps the no-map hole.
- Path: boot-time linear map only (`paging_init` → `map_mem`).

Step 2.3: IDENTIFY THE BUG MECHANISM
Record:
- **Category:** logic/correctness + hardware isolation (linear-map over-
  coverage).
- **Mechanism:** unaligned NOMAP split + `phys &= PAGE_MASK` over-maps.
  Verified in this tree at `arch/arm64/mm/mmu.c:443-445`:
  `phys &= PAGE_MASK; addr = virt & PAGE_MASK; end = PAGE_ALIGN(virt +
  size);`
- DT `no-map` (this tree, `reserved-memory.yaml`): OS must not create a
  standard mapping **and** must not allow speculative access except
  under the owning driver.

Step 2.4: ASSESS THE FIX QUALITY
Record:
- Obviously correct for the stated failure: inward rounding matches
  buddy `__free_memory_core()` (`PFN_UP(start)` / `PFN_DOWN(end)` in
  `mm/memblock.c` of this tree). Those slivers were never allocator RAM.
- Minimal; comment-only plus three functional lines.
- Regression risk: low. Worst case is one unmapped page at a no-map
  boundary (memory the buddy already does not own). Ard noted a
  theoretical firmware hazard if something like initramfs sat in that
  wasted page; Will still applied it after Ard confirmed
  `for_each_mem_range()` coalesces sub-page *mappable* pieces.

===============================================================
PHASE 3: GIT HISTORY INVESTIGATION
===============================================================

Step 3.1: BLAME THE CHANGED LINES
Record:
- `phys &= PAGE_MASK`: `9c4e08a3022b6` (Mark Rutland, 2015, “allow
  sections for unaligned bases”)
- Linear-map bank loop: `98d2e1539b84a` (2017) / `b10d6bca87204`
  (`for_each_mem_range`, 2020)
- This is old code, present long before 6.12.

Step 3.2: FOLLOW THE FIXES: TAG
Record: No `Fixes:` tag. Bug is the long-standing interaction of NOMAP
byte splits + page-table rounding, not a single recent commit.

Step 3.3: CHECK FILE HISTORY FOR RELATED CHANGES
Record:
- This tree: no commit on `arch/arm64/mm/mmu.c` already doing inward
  `PAGE_ALIGN` in `map_mem`.
- `7ace06a01efab` is **not** an ancestor of HEAD (`git merge-base --is-
  ancestor` exit 1).
- Upstream later dropped the `pgd_t *` argument (`2e527667a3b9b`,
  2026-06-02) — **not** in this tree, **not** required for the fix.
- Follow-up `fb0f3ef5601a6` (unmap data/bss from linear map) is
  independent.

Step 3.4: CHECK THE AUTHOR'S OTHER COMMITS
Record: Only this arm64 commit on `origin/master`. Applied by Will
Deacon (arm64 maintainer). Ard Biesheuvel reviewed on-list and called it
conceptually sound.

Step 3.5: CHECK FOR DEPENDENT/PREREQUISITE COMMITS
Record: Standalone. Needs `for_each_mem_range`, `__map_memblock`,
`__create_pgd_mapping_locked` — all present. The committed diff does not
apply byte-for-byte (later `map_mem(void)` / no `if (start >= end)
break;`); the **original** patch context matches this tree. Backport is
a small context adaptation, not a missing-API rewrite.

===============================================================
PHASE 4: MAILING LIST AND EXTERNAL RESEARCH
===============================================================

Step 4.1: FIND THE ORIGINAL PATCH DISCUSSION
Record:
- `b4 dig -c 7ace06a01efab` →
  https://patch.msgid.link/20260513010255.3764038-1-liulhong617@163.com
- Single revision (v1 only). `b4 dig -a`: only that v1.
- Thread saved to mbox and read in full.
- Will (16 Jul 2026): worried firmware with many tiny adjacent regions
  could leave pages unmapped; preferred warn-and-do-nothing; asked for
  practical symptoms.
- Author (27 Jul): 64K pages, debugger showed `phys` rounded from
  `0xa2008000` to `0xa2000000`.
- Will (4 Aug): not convinced by that reply.
- Ard (4 Aug): change is conceptually sound; `for_each_mem_range()`
  coalesces; only sane handling is to round no-map **outward** (i.e.
  linear map **inward**). Suggested maybe moving rounding into
  `__create_pgd_mapping_locked()` later.
- Will (6 Aug): “Aha, that's the part I was missing.” Applied v1: “I can
  take this patch for now.”
- Apply mail: https://git.kernel.org/arm64/c/7ace06a01efa (`for-
  next/mm`).
- Author (9 Aug, after apply): real platform is Cortex-A78AE,
  **v6.1.177-rt**, 64K pages; two sub-page no-map TEE regions; DStream
  showed them folded into one `PAGE_KERNEL` span; cache prefetcher hit
  TEE and firmware raised “REE accessed secure memory” faults.
- No NAK of the applied patch. No `Cc: stable` in review.

Step 4.2: CHECK WHO REVIEWED THE PATCH
Record (`b4 dig -w`): To Catalin Marinas, Will Deacon; Cc linux-arm-
kernel, linux-kernel. Ard added later. Maintainer applied it.

Step 4.3: SEARCH FOR THE BUG REPORT
Record: No syzbot/bugzilla. Evidence is the author’s debugger dump and
firmware faults (mbox, 9 Aug 2026). Severity from reporter: isolation
break + spurious secure-memory faults.

Step 4.4: CHECK FOR RELATED PATCHES AND SERIES
Record: Standalone 1/1. Ard/Will mentioned a possible later rounding
cleanup in `__create_pgd_mapping_locked()`; `origin/master` still has
this loop-local fix only (no follow-up required).

Step 4.5: CHECK STABLE MAILING LIST HISTORY
Record: lore.kernel.org/stable WebFetch returned 403. UNVERIFIED whether
stable@ already discussed it. Not used as a NO reason.

===============================================================
PHASE 5: CODE SEMANTIC ANALYSIS
===============================================================

Step 5.1: IDENTIFY KEY FUNCTIONS IN THE DIFF
Record: `map_mem()` (this tree: `static void __init map_mem(pgd_t
*pgdp)` at `arch/arm64/mm/mmu.c:623`).

Step 5.2: TRACE CALLERS
Record: `paging_init()` → `map_mem(swapper_pg_dir)` (`mmu.c:812-814` in
this tree). Boot-time, all arm64 configs. Not a syscall path; result is
the linear map used by the whole kernel.

Step 5.3: TRACE CALLEES
Record: `for_each_mem_range` → `__next_mem_range` / `should_skip_region`
(skips NOMAP unless `MEMBLOCK_NOMAP` requested). Then `__map_memblock` →
`__create_pgd_mapping` → `__create_pgd_mapping_locked`.
`memblock_mark_nomap` → `memblock_isolate_range` (byte splits, no page
align) — verified in `mm/memblock.c`.

Step 5.4: FOLLOW THE CALL CHAIN
Record: Reachable on every arm64 boot. User/firmware trigger is a sub-
page `no-map` reserved-memory node (common with 16K/64K pages).
Unprivileged userspace does not need to do anything after boot; the bad
mapping already exists. Speculative CPU access of TEE pages is enough.

Step 5.5: SEARCH FOR SIMILAR PATTERNS
Record: Second `for_each_mem_range` in this file is
`validate_bootmem_online()` under `CONFIG_DEBUG_VM` — not page-table
creation. No sibling fix already in this tree.

===============================================================
PHASE 6: CROSS-REFERENCING AGAINST THE LOCAL TREE
===============================================================

Step 6.1: DOES THE BUGGY CODE EXIST IN THIS TREE?
Record: **Yes.**
- `map_mem()` loop: `mmu.c:660-670` passes raw `start`/`end` to
  `__map_memblock`.
- Rounding-down: `mmu.c:443-445`.
- NOMAP skip: `should_skip_region()` in `mm/memblock.c:1081-1083`.
- Byte isolate: `memblock_isolate_range()`.
- Introduced: rounding 2015, loop 2017/2020 — well before 6.12.
- `7ace06a01efab` not in HEAD.

Step 6.2: CHECK FOR BACKPORT COMPLICATIONS
Record: **Minor adaptation, not a rewrite.** Committed patch fails `git
apply --check` because this tree still has `if (start >= end) break;`
and `map_mem(pgd_t *pgdp)`. That is exactly v1’s context. Insert the
three rounding lines after the existing `break`. No need for
`2e527667a3b9b`.

Step 6.3: CHECK IF RELATED FIXES ARE ALREADY HERE
Record: None. `git log --grep="accidental linear mapping"` /
`--grep="no-map"` on this file in HEAD does not contain this fix.

===============================================================
PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT
===============================================================

Step 7.1: IDENTIFY THE SUBSYSTEM AND ITS CRITICALITY
Record: `arch/arm64/mm` linear map. **CORE for arm64** (every arm64
boot). `no-map` is how firmware hides TEE/DSP/GPU carveouts.

Step 7.2: ASSESS SUBSYSTEM ACTIVITY
Record: Mature; this file still changes, but the bank-mapping loop has
been stable for years in 6.12. Bug is old, not a new-subsystem leftover.

===============================================================
PHASE 8: IMPACT AND RISK ASSESSMENT
===============================================================

Step 8.1: DETERMINE WHO IS AFFECTED
Record: arm64 systems whose DT/firmware has **sub-page-aligned `no-map`
reserved-memory**. More likely with 16K/64K pages. Author hit it on
6.1.rt; 6.12 has the same mapping logic.

Step 8.2: DETERMINE THE TRIGGER CONDITIONS
Record: Boot + unaligned `no-map` region. No extra userspace trigger.
Cache prefetch can then touch TEE. Commonness: not every board, but real
on 64K TEE/embedded SoCs.

Step 8.3: DETERMINE THE FAILURE MODE SEVERITY
Record:
- Isolation break: `no-map` (including TEE) mapped `PAGE_KERNEL`.
- Speculative access / firmware “REE accessed secure memory” faults
  (verified report).
- DT forbids speculative access to `no-map`.
- Severity: **HIGH** (security isolation + platform faults). Not a
  universal oops, but it is an important real bug, not a nit.

Step 8.4: CALCULATE RISK-BENEFIT RATIO
Record:
- **Benefit:** high for affected boards (TEE/firmware faults, linear-map
  leak of carveouts).
- **Risk:** low (≤1 unused page per boundary; matches buddy PFN
  rounding; maintainer-acked).
- Ratio favors backport.

===============================================================
PHASE 9: FINAL SYNTHESIS
===============================================================

Step 9.1: COMPILE THE EVIDENCE

FOR:
- Real bug in this tree’s `map_mem()` / `__create_pgd_mapping_locked()`.
- Hardware report: Cortex-A78AE, 64K, TEE `no-map`, firmware faults;
  also seen conceptually on 6.1, so 6.12 is in range.
- DT `no-map` contract violated (must not map, must not speculate).
- 14-line, single-function, no new API.
- Will applied; Ard endorsed the approach.
- Original patch context matches 6.12 `map_mem(pgd_t *pgdp)`.
- Inward rounding matches `__free_memory_core()` so it does not unmap
  buddy-owned pages.

AGAINST:
- Trigger is firmware/DT-dependent (unaligned `no-map`), not every arm64
  box.
- Committed mainline hunk needs a trivial context tweak (`break` still
  present here).
- Will first preferred warn-only; that was withdrawn after Ard’s
  coalescing point, not a standing NAK.
- Theoretical firmware footgun if a needed image lived in the discarded
  page remainder (Ard); sliver is already not buddy memory.

UNRESOLVED:
- lore.kernel.org/stable search 403; whether stable@ already took it is
  UNVERIFIED.

Step 9.2: APPLY THE STABLE RULES CHECKLIST
1. Obviously correct and tested? **PASS** — mechanism verified in-tree;
   debugger + maintainer apply.
2. Fixes a real bug that affects users? **PASS** — TEE/linear-map
   isolation break and firmware faults.
3. Important issue? **PASS** — security isolation / platform abort, not
   a log nit.
4. Small and contained? **PASS** — +14 lines, one loop.
5. No new features or APIs? **PASS**.
6. Can apply to the local tree? **PASS** — bug present; v1 context
   matches; committed diff needs only local `map_mem` context.

Step 9.3: CHECK FOR EXCEPTION CATEGORIES
Record: Not ID/quirk/DT-board/build/docs. Ordinary important bugfix.

Step 9.4: MAKE YOUR DECISION
Backport to this 6.12 tree. The bug is here, the fix is small, and
leaving `no-map` (especially TEE) in the linear map is a real isolation
and stability failure on 64K systems.

------------------------------------------------
What the commit solves for stable users
------------------------------------------------
On this 6.12 tree, boot builds the linear map in `map_mem()` from
`for_each_mem_range()`. NOMAP regions are skipped, but neighbors keep
byte-accurate edges. `__create_pgd_mapping_locked()` then rounds
physical start **down** to `PAGE_MASK`, so a 32KiB `no-map` hole on a
64K page is mapped as normal RAM. That contradicts DT `no-map` and can
let the CPU speculate into firmware/TEE memory.

Rounding the mapped range inward before `__map_memblock` stops that
overlap. At most one page per boundary stays unmapped; those bytes were
already excluded from the buddy allocator.

------------------------------------------------
Stable rules / risk
------------------------------------------------
Surgical, no API, code is in 6.12, original submission matches this
`map_mem(pgd_t *)` loop. Benefit is isolation and avoiding firmware
aborts; risk is a conservative hole the allocator already does not use.

------------------------------------------------
Verification
------------------------------------------------
- [Phase 1] `git describe HEAD` / `make kernelversion`:
  `p-6.12-3-g88406e77611c6`, **6.12.111**. Tags: author SOB + Will
  Deacon SOB only.
- [Phase 2] `git show 7ace06a01efab`: +14 in `map_mem`; this tree
  `Read`/`Grep`: `phys &= PAGE_MASK` at `mmu.c:443`; loop at
  `mmu.c:660-670`.
- [Phase 2] `reserved-memory.yaml`: `no-map` forbids standard mapping
  and speculative access.
- [Phase 2] `__free_memory_core()`: `PFN_UP`/`PFN_DOWN` in
  `mm/memblock.c:2153-2158`.
- [Phase 3] blame: `9c4e08a3022b6` (2015) PAGE_MASK; `98d2e1539b84a`
  (2017) / `b10d6bca87204` (2020) loop.
- [Phase 3] `git merge-base --is-ancestor 7ace06a01efab HEAD` → not in
  tree (exit 1).
- [Phase 3] `2e527667a3b9b` (drop `pgd_t*`) not in HEAD; not a
  prerequisite.
- [Phase 3] `git log origin/master --grep="accidental linear mapping" --
  arch/arm64/mm/mmu.c`: `7ace06a01efab`; `git describe --contains
  --match 'v*'`: `v7.3-rc1~...`
- [Phase 4] `b4 dig -c/-a/-w/-m`: v1 only; lore msgid
  `20260513010255.3764038-1-liulhong617@163.com`; Will + Ard discussion;
  applied 6 Aug 2026; author follow-up on v6.1.177-rt TEE faults.
- [Phase 4] lore WebFetch 403 on lore.kernel.org/all and /stable —
  thread recovered via `b4 dig -m`.
- [Phase 5] `paging_init()` calls `map_mem(swapper_pg_dir)`;
  `should_skip_region()` skips NOMAP.
- [Phase 6] `git apply --check` of committed diff **fails** (context);
  6.12 loop still has `if (start >= end) break;` matching v1.
- [Phase 6] `origin/master` `map_mem` still has `PAGE_ALIGN(start)` /
  `end & PAGE_MASK`.
- [Phase 8] Failure mode from mbox + DT: TEE mapped, prefetcher,
  firmware abort — HIGH.
- UNVERIFIED: whether stable@ already queued it (HTTP 403).

**YES**

 arch/arm64/mm/mmu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 71841b5c31928..7c3f560df6529 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1179,6 +1179,20 @@ static void __init map_mem(pgd_t *pgdp)
 	for_each_mem_range(i, &start, &end) {
 		if (start >= end)
 			break;
+		/*
+		 * for_each_mem_range may return sub-page-aligned boundaries
+		 * after memblock_mark_nomap() splits regions at byte precision.
+		 * __create_pgd_mapping_locked aligns phys down to PAGE_MASK,
+		 * which could accidentally map no-map memory on the boundary.
+		 * Round the mappable range inward: start UP, end DOWN, so
+		 * that the mapped area never overlaps with adjacent no-map
+		 * regions. The cost is at most one page of unmapped gap at
+		 * each boundary.
+		 */
+		start = PAGE_ALIGN(start);
+		end = end & PAGE_MASK;
+		if (start >= end)
+			continue;
 		/*
 		 * The linear map must allow allocation tags reading/writing
 		 * if MTE is present. Otherwise, it has the same attributes as
-- 
2.53.0


