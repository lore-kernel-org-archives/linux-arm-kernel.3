Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B37CD5BB7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 17:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYTgH2xtVYKFN0341M351MazQSuqnbXnfu3i4Yl+9Pw=; b=zvs6XtfzdNMOk/YxJ4f8c20FJ5
	7hi5YxdVNAX77VBQsjaEWSOGYGmfZYXxp4q76lfvh5DabAtBb0dgFF5BMireFd0rZdAqzlrWXzqIh
	oSWtyfhLcYjiTw5ARz/c2D94NWORu5BZ7LdVUFf4wNiBJVqIrNEg7AeAaGf049AK9B9DEXH8B0tzM
	UUuUXJs1IiCoiGQkcW7qZRnDO07Wx2p5Vhg6FsGxJsDTsu+5Tm8zEFGe2U6QXYfcD2s82dEnoHVSG
	BPfUC6wPKJMspSk86dcQDAYN8/tyG1NiIRAZwNWXqmVj3uBouj7dRWLRFcQyhEC0Eo22Bqgg0irEl
	a9tDPb3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQTZr-0000000BWwo-1tq3;
	Fri, 22 May 2026 17:22:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQTZo-0000000BWtj-0KLd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 17:22:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DC3740DA3;
	Fri, 22 May 2026 17:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CB61F00A3F;
	Fri, 22 May 2026 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779470543;
	bh=VYTgH2xtVYKFN0341M351MazQSuqnbXnfu3i4Yl+9Pw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X8XKFMuwjEr4wId3sNSvzIMlmB6jWIHHlCuAdoSuTyQ7faKiaUWIVv9wkDoKCvn2l
	 i+p/yJC3VT96PiU4F1h7mS9Yrrj05R3SgmfwqK4h28RW+5boMfKiFf0HV8q7KJML4+
	 4cFjQcBw9Iqrbp2WdNGYNDi6TyzspRrUvroNGH6jodxa99h1O5JouDL2VZB6mJaT6y
	 7AhmoezrI2Ss07m+XtqFePlNk+tXJXgqRceRdUW+NStFczPoN/FzKJv1/hvskf5mIs
	 N1gSiWUbsG2JdifBzUcnX2lGtFuAXkzrv+7uGTDTgpoIsugAocGreRP1Pfoj2aJG6c
	 Q2DlK/UjH9hIg==
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
Date: Fri, 22 May 2026 07:22:14 -1000
Message-ID: <20260522172219.1423324-4-tj@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522172219.1423324-1-tj@kernel.org>
References: <20260522172219.1423324-1-tj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_102224_163877_950310D5 
X-CRM114-Status: GOOD (  12.13  )
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
non-sleepable. There is no sleepable equivalent for kernel callers. The
kfunc bpf_arena_alloc_pages itself is BPF-only.

sched_ext needs sleepable kernel-side allocs for its arena pool init/grow
paths. Add bpf_arena_alloc_pages_sleepable() mirroring the _non_sleepable
wrapper but passing sleepable=true to arena_alloc_pages().

Signed-off-by: Tejun Heo <tj@kernel.org>
Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
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
index 1c0b87ecc817..a811cf6170fa 100644
--- a/kernel/bpf/arena.c
+++ b/kernel/bpf/arena.c
@@ -934,6 +934,19 @@ void *bpf_arena_alloc_pages_non_sleepable(void *p__map, void *addr__ign, u32 pag
 
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


