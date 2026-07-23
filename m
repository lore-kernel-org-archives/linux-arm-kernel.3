Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6ACC531D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 15:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TmiXyJvQ92TKxUnkF2EBAbSx4BVAEx8E3qvkE5M06w=; b=hydBVpgp5e/LFndLAbGU3BM+l+
	ZUwmCr+8PxxYjms53/hFqNCO3fPPytOB9ZXGVFyPMvZT5uHw9R4ImwVnMJva7PPH6N8Z/ibg9MqG+
	oPOYZlt1mqAEYKU6YDpitoG1KoiqAopBOZWFgHl/Odp4qS1/Ue1X+AzRlsfLo5i0r0OypoOEsZPY0
	Yho0lWWX8DlaXSaWMeoUolRr26Miiul0pTLtR8+3uO3mVg7iEsSLT0Nc2CGXwxKBKoB4hxQXgKlLy
	k9knHIBeS6ThCAJKucgQS8G+f7+X5qalfoTbL4y2dM5yxXmSmFfIy1566voFVK7j5ub4J8893VKrB
	NFEGCxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvB4-0000000Ea7f-3llT;
	Thu, 23 Jul 2026 15:17:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvAz-0000000Ea4R-0a7z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 15:17:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B3A260A91;
	Thu, 23 Jul 2026 15:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCFB1F000E9;
	Thu, 23 Jul 2026 15:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784819852;
	bh=4TmiXyJvQ92TKxUnkF2EBAbSx4BVAEx8E3qvkE5M06w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=keE8qT7vBTXkbMs26asTsL8pW67WGqXgwzV1Ac5f45Fk6q+/p0+JWXxKODKzKG2ED
	 DZgmEz0u7tnsHrqOJVLTUrY6Qc9if4n1X3ZkO2XIPXZyfpazO1aHpvfk4le7g7Kb9U
	 J3ZwgKTuEoAtiz+bAz/60D8uKMNeX+k1NhBe5UfZimuno6656dW8Qyjs7P+2lJh4qj
	 gPCAEud3BZEadvF4O9II4RK6a8GfKCB4CRik21ABhe2MO0v5DtfVsiKGx0Jpqc+zox
	 xUMBc7WDk1jje3vkntaNN9cecPbAVoijItvVKYQn0OQjnUDlxqTfyiUahPWon6/hGP
	 u9MfyDp+58GEQ==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Thu, 23 Jul 2026 16:16:34 +0100
Subject: [PATCH mm-hotfixes v6 4/5] mm/ptdump: always stabilise against
 page table freeing using init_mm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-series-vmap-race-fix-v6-4-8cc77dcc0018@kernel.org>
References: <20260723-series-vmap-race-fix-v6-0-8cc77dcc0018@kernel.org>
In-Reply-To: <20260723-series-vmap-race-fix-v6-0-8cc77dcc0018@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, "Denis V. Lunev" <den@virtuozzo.com>, 
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3325; i=ljs@kernel.org;
 h=from:subject:message-id; bh=VITXU838ytmI5wjkeVjJjzJ76fi6Ga2j8Ljay/OkRtw=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKSDGJXXL3g06vGuumGcyFrSqK5zkz7B84HBAO1XojWL
 UqxWvS8o5SFQYyLQVZMkeX5F/H9QSJh8zov+LvBzGFlAhnCwMUpABPx28/I8LtPcvGmhtd7xKYe
 yuPN0LVhOPaq5/kH15cfy7JcGZiLwhj+cHu+7FFcyTpljrjO661+H5q0Q74szbw//Uuwtii/t4c
 iCwA=
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

Previous commits have established the invariant that kernel page table
freeing is performed while an mmap read lock on init_mm is held, which
fixes races between ptdump and kernel page table freeing over init_mm.

However, x86 and arm64 can perform a ptdump over an mm other than init_mm
via ptdump_walk_pgd() and since kernel memory ranges are shared across
non-kernel mm's, this means that the race still exists for these cases.

Fix this by acquiring a nested mmap write lock for init_mm in
ptdump_walk_pgd().

This is safe as we take this after mmap write locking the mm, and nothing
acquires the init_mm lock first before locking an arbitrary mm, so no
deadlock is possible.

Also update walk_page_range_debug() to assert that init_mm is write locked,
add a comment explaining why and remove some redundant code, and eliminate
the unnecessary and confusing invocation of walk_kernel_page_table_range().

We can safely remove the non-NULL check for walk.mm, as the mmap lock
asserts would NULL pointer deref if it was (and of course no callers do
this).

The first point at which ptdump can race kernel page table freeing is
commit b6bdb7517c3d ("mm/vmalloc: add interfaces to free unmapped page
table"), so we target this in the Fixes tag.

Fixes: b6bdb7517c3d ("mm/vmalloc: add interfaces to free unmapped page table")
Cc: stable@vger.kernel.org
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Kiryl Shutsemau <kas@kernel.org>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
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


