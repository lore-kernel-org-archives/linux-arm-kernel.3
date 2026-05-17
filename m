Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C4ACD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 21:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQEPRQOZ4rX+g6q3gTj6TNuvogG0oRapFFGY9eXkr/U=; b=B61fSmbvJMEFpjq1d5BWkxFImV
	LX5wMN1X7YDmDZ+5JxYKCn0eV5m5IQyN6ujyKFFA6ZnLCoZ3GL6bgNWFIN/fpMSi6yCUdM5OQq/sG
	u41C3eSQuUyJtdVJEJyBoHsrNexKpYUglEEExwcUkFySrO3J2UkYxfCxCOICoWdSVvBry0H/ybtKg
	8x0oPJui4w6Ak5feHvO95LbFK0dlvlHHrJSPoJTHkr3IKDu1zYAMP/qNgiodFCj637znBHmoScDlh
	nRiq56af0EgK1CJiugnIq+6zdk3rz179cRgSISNcIbv3IitzFfehEEFQWf/hMtAANIEnGATkUGFn2
	zW0/UXPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOimw-0000000DTY2-2bI6;
	Sun, 17 May 2026 21:12:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOimq-0000000DTUq-3tlV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 21:12:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6797445DA;
	Sun, 17 May 2026 21:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63AFDC2BCB0;
	Sun, 17 May 2026 21:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779052356;
	bh=sa/XEbVus3j3++neSqYHZhHciwIeY/dNrzAJDzxWUxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a1gJ4IlNi4iOIT2mipUyACyecpQa+uIf+XnT7/qQ4vdyxGJ11zcsS17cyZrSj4rPO
	 6vfRZSw9RGeGwRCtlQljfXggM8dW45kuClZyEO+q9fpICwzamys3W1B05zYSgw6TA7
	 MexHFPn5D0tfyYajRXoFzEoZXB4AAyIcRDXUnd1fQZYM6pP/deUCVD/POZ7V2qnzWI
	 kvX0WgD81ybgApTydEkfXU70mtFxID4K6WOQM1hO0AtlHaDYw+mA7+EUbsqMzLA/9O
	 YCdzvRV6dfQfuAMgsBZr9b46TqC4AHRrwtYakUSDz0io38O+mX4zIKHTZRLcrBKnrp
	 yaQ7A8/Nqj86w==
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	sched-ext@lists.linux.dev,
	bpf@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 3/8] bpf: Add sleepable variant of bpf_arena_alloc_pages for kernel callers
Date: Sun, 17 May 2026 11:12:27 -1000
Message-ID: <20260517211232.1670594-4-tj@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517211232.1670594-1-tj@kernel.org>
References: <20260517211232.1670594-1-tj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_141237_007555_D71A9487 
X-CRM114-Status: GOOD (  11.48  )
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

The existing kernel-side export of bpf_arena_alloc_pages is _non_sleepable
only - it's used by the verifier to inline the kfunc when the call site is
non-sleepable. There is no sleepable equivalent for kernel callers; the
kfunc bpf_arena_alloc_pages itself is BPF-only.

sched_ext needs sleepable kernel-side allocs for its arena pool init/grow
paths. Add bpf_arena_alloc_pages_sleepable() mirroring the _non_sleepable
wrapper but passing sleepable=true to arena_alloc_pages().

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 include/linux/bpf.h |  8 ++++++++
 kernel/bpf/arena.c  | 13 +++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 831996c411cf..64968ca6db51 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -679,6 +679,8 @@ int bpf_dynptr_from_file_sleepable(struct file *file, u32 flags,
 void *bpf_arena_alloc_pages_non_sleepable(void *p__map, void *addr__ign, u32 page_cnt, int node_id,
 					  u64 flags);
 void bpf_arena_free_pages_non_sleepable(void *p__map, void *ptr__ign, u32 page_cnt);
+void *bpf_arena_alloc_pages_sleepable(void *p__map, void *addr__ign, u32 page_cnt, int node_id,
+				      u64 flags);
 #else
 static inline void *bpf_arena_alloc_pages_non_sleepable(void *p__map, void *addr__ign, u32 page_cnt,
 							int node_id, u64 flags)
@@ -689,6 +691,12 @@ static inline void *bpf_arena_alloc_pages_non_sleepable(void *p__map, void *addr
 static inline void bpf_arena_free_pages_non_sleepable(void *p__map, void *ptr__ign, u32 page_cnt)
 {
 }
+
+static inline void *bpf_arena_alloc_pages_sleepable(void *p__map, void *addr__ign, u32 page_cnt,
+						    int node_id, u64 flags)
+{
+	return NULL;
+}
 #endif
 
 extern const struct bpf_map_ops bpf_map_offload_ops;
diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
index bc696bef7104..8eb7b95f4999 100644
--- a/kernel/bpf/arena.c
+++ b/kernel/bpf/arena.c
@@ -937,6 +937,19 @@ void *bpf_arena_alloc_pages_non_sleepable(void *p__map, void *addr__ign, u32 pag
 
 	return (void *)arena_alloc_pages(arena, (long)addr__ign, page_cnt, node_id, false);
 }
+
+void *bpf_arena_alloc_pages_sleepable(void *p__map, void *addr__ign, u32 page_cnt,
+				      int node_id, u64 flags)
+{
+	struct bpf_map *map = p__map;
+	struct bpf_arena *arena = container_of(map, struct bpf_arena, map);
+
+	if (map->map_type != BPF_MAP_TYPE_ARENA || flags || !page_cnt)
+		return NULL;
+
+	return (void *)arena_alloc_pages(arena, (long)addr__ign, page_cnt, node_id, true);
+}
+
 __bpf_kfunc void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt)
 {
 	struct bpf_map *map = p__map;
-- 
2.54.0


