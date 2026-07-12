Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F78C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 10:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrk8vC+Ve+FQgyHSJEFAxaMx0g8ZadKX9MusPiIExkE=; b=0nb5f1L1peBoiGiD3rvWE72ba6
	lw/tcPWQxpdOeOWr2dgxnOZNQa5wWg0izN/oEONl66IEencaFcInpMlzEMU09dm4/VhqKQ3wBRWnc
	hGkAms+Sl6QH0NdfCe2wfNgWfvRvVVwwYlGBt9lCPuMgR+4jAbN/sy+QIn2Amh0QA1zz21e8ia1It
	PwhQTUOsJ0BDfcmBNAG+BVSgf0/q4X7ZXcA8J+9zsO+smU3YQigo9mwJN6/VW++6f6zRtj6EWN550
	kJ/Am4LRs/SFeO7a89e1yX3ytcMeQTyVeA9v8FS6d/a99HVS85o7RN67OXdoOrugau8P8LbFdyTHR
	GU5QTMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirfq-00000007NJd-24xw;
	Sun, 12 Jul 2026 10:44:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirfp-00000007NIq-3UFf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 10:44:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47451600AA;
	Sun, 12 Jul 2026 10:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F781F00A3A;
	Sun, 12 Jul 2026 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783853077;
	bh=nrk8vC+Ve+FQgyHSJEFAxaMx0g8ZadKX9MusPiIExkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Omw7G4FgNZYcZEmrx511ChY6T9zMUkEWv+kAbym3JjUrya1Ou8V/rBt5Kef5Y7zYC
	 53+LYE4FKKsaE+qXpZWHu9nunSk9FGUVcxUDkahaqAQEXZSPDVd98i7drMhzaHWP2a
	 RPkASOS+rmfEXYteYtuCZMoA83Jqwo2NEGTNo2xnKmIALLwHG+Jbrg1e/MHlOnR/JC
	 meTFrDK0xcA+0UC47jl+ixZ4bNZ3Uer2PUPO8gfA1enw0fTLJBnVbL+9aUNBKGqNei
	 ZLlkOFBJs7UCBRnreuH5WVcET8q4FiCYohUpl9FUxY6V6Ejbfr+rQqt6KgIcjYj1fH
	 rACwlkoNj+0Ig==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Sun, 12 Jul 2026 11:42:26 +0100
Subject: [PATCH mm-hotfixes v2 3/4] mm/ptdump: always stabilise against
 page table freeing using init_mm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-series-vmap-race-fix-v2-3-ad134cc3a12a@kernel.org>
References: <20260712-series-vmap-race-fix-v2-0-ad134cc3a12a@kernel.org>
In-Reply-To: <20260712-series-vmap-race-fix-v2-0-ad134cc3a12a@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Dev Jain <dev.jain@arm.com>, Ryan Roberts <ryan.roberts@arm.com>
Cc: David Carlier <devnexen@gmail.com>, ljs@kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3713; i=ljs@kernel.org;
 h=from:subject:message-id; bh=wPiaIn6Wg5e3GQRwvp54WRABlKxC65yqG85hBilGX1E=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKC8z9MUr22dUnwgTM3Wrcan9b9lrw17t3yC79mtJow6
 feuMeBU7ChlYRDjYpAVU2R5/kV8f5BI2LzOC/5uMHNYmUCGMHBxCsBE+LgYGfpan6zcqfjrdp5G
 fef1L7Mjl5o0GN48fZebk+PG7VNz9EUZGXayf+xZ9H+hSuQB0ZL2MPnuKyz3DYyPTH3w3i3KS++
 iPQsA
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

x86 and arm64 invoke ptdump_walk_pgd() with non-init_mm mm whilst still
walking kernel page table ranges.

For x86 this is done in ptdump_curknl_show() and ptdump_efi_show(), the
first passing current->mm, and the second passing efi_mm (we reach kernel
mappings that init_mm protects for current->mm due to x86 cloning shared
kernel page tables for arbitrary mm's).

arm64 does so via ptdump_debugfs_register(), configured by efi_ptdump_info
for efi ranges against efi_mm.

The init_mm mmap lock is used to stabilise page table freeing against
ptdump, so take a nested lock on init_mm to ensure that we are correctly
stabilised.

We take this after mmap write locking the non-init_mm mm. Nothing acquires
the init_mm lock first before locking an arbitrary mm, so no deadlock is
possible.

The preceding patches in this series updated the two cases which can cause
races with ptdump in init_mm ranges - vmap and x86 CPA huge page promotion.

For arm64, commit fa93b45fd397 ("arm64: Enable vmalloc-huge with ptdump")
already provides exclusion against init_mm for the vmap case, which this
patch also pairs with.

The first point at which ptdump can race kernel page table freeing is
commit b6bdb7517c3d ("mm/vmalloc: add interfaces to free unmapped page
table"), so we target this in the Fixes tag.

Also update walk_page_range_debug() to assert that init_mm is write locked,
add a comment explaining why and remove some redundant code.

We do not need to check for walk.mm being non-NULL, as the mmap lock
asserts would NULL pointer deref if it was (and of course no callers do
this).

The rest of this code is exactly as it would be if invoking
walk_kernel_page_table_range(), only now it's far clearer that that's the
case.

Fixes: b6bdb7517c3d ("mm/vmalloc: add interfaces to free unmapped page table")
Cc: stable@vger.kernel.org
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 mm/pagewalk.c | 14 +++++++++-----
 mm/ptdump.c   |  7 +++++++
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index bbcfd68d0907..5d87c632a255 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -702,12 +702,16 @@ int walk_page_range_debug(struct mm_struct *mm, unsigned long start,
 	 * to account for page table freeing on vmap huge page mapping.
 	 */
 	mmap_assert_write_locked(mm);
+	/*
+	 * x86, arm64 ptdump allow walks of efi mm's and x86 ptdump allows walks
+	 * of arbitrary mm's.
+	 *
+	 * However, they both must also hold the init_mm lock to account for
+	 * concurrent kernel page table freeing.
+	 */
+	mmap_assert_write_locked(&init_mm);
 
-	/* For convenience, we allow traversal of kernel mappings. */
-	if (mm == &init_mm)
-		return walk_kernel_page_table_range(start, end, ops,
-						    pgd, private);
-	if (start >= end || !walk.mm)
+	if (start >= end)
 		return -EINVAL;
 	if (!check_ops_safe(ops))
 		return -EINVAL;
diff --git a/mm/ptdump.c b/mm/ptdump.c
index 973020000096..5851096e6f65 100644
--- a/mm/ptdump.c
+++ b/mm/ptdump.c
@@ -178,11 +178,18 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
 
 	get_online_mems();
 	mmap_write_lock(mm);
+	/* To stabilise kernel page tables we must hold the init_mm lock too. */
+	if (mm != &init_mm)
+		mmap_write_lock_nested(&init_mm, SINGLE_DEPTH_NESTING);
+
 	while (range->start != range->end) {
 		walk_page_range_debug(mm, range->start, range->end,
 				      &ptdump_ops, pgd, st);
 		range++;
 	}
+
+	if (mm != &init_mm)
+		mmap_write_unlock(&init_mm);
 	mmap_write_unlock(mm);
 	put_online_mems();
 

-- 
2.55.0


