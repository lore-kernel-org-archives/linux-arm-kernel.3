Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE56CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 23:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5B01WmAERz0FAb+2U36sWTc4ic5I5yhwvS5EjBXihQ=; b=kjiBCmOYNEHOXAjYS1nfcNnI8f
	/zykj6Qg4gzWRBRm2D9K268ZUX8AhZpeJCS3IguCc4R3Ke/on8agv+elkUmhnZz9I44K7lq+7CfyM
	ZJEPz8A4TNX5x8I+P4nYCmUI8TnwmysTBae7pl61Rc/Q45W0pM/grwpH+a4X7rV2MEdfvmvvWmwDI
	q6AoUz04a9z2ajoIFjmYlOO+YMCrAANm7bvo6riGIgPrWIXVbtAUQxbkmMD9QcTxRNK+vB3dDOMVO
	EGVuRd2vS9vtI0nDTV4BxVKJp2msya+vMJf1E0eTUzG6m4i/oNlruHuRRBLAwyJmtbbyaGXvOW2kG
	9ml1VEAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqgs-00000006ChL-1Wep;
	Wed, 20 May 2026 23:51:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqgl-00000006Cdz-0rXx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 23:50:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A56E360218;
	Wed, 20 May 2026 23:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350261F00A3D;
	Wed, 20 May 2026 23:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779321058;
	bh=C5B01WmAERz0FAb+2U36sWTc4ic5I5yhwvS5EjBXihQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CarpkMgwagcPzBChV2WOC+aDWnTKcWssSXw9EDJxPeAftz6tZwWo0Hee4ZFSXUQ3I
	 HnhTDCKYTNW7RWkzmNZVWawH18BBPDqse6XoOT5OlE+jn8MKg5ZDLp/2vZgiCx/QyK
	 0+Zdj+kKCM7BbZXKYq4DduZ7FP+WaMchuCP6MkeEudGYAoY262qZ3w8acPGyMpAHyN
	 7RtOIxSsW3gI171HgViaiKPiVljtkUNyF99FHCszdkRNsZqP5T8csPiBfFRiVnfwfc
	 f9lmVHGPx7XdDcAvI89S4O65OlQCXdZF9tKGfQ+h4e5Jo3EOpm5Um6rBY2kWgKGPeF
	 ezXYZohGzAvlg==
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
Subject: [PATCH 5/8] bpf/arena: Add bpf_arena_map_kern_vm_start() and bpf_prog_arena()
Date: Wed, 20 May 2026 13:50:49 -1000
Message-ID: <20260520235052.4180316-6-tj@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520235052.4180316-1-tj@kernel.org>
References: <20260520235052.4180316-1-tj@kernel.org>
MIME-Version: 1.0
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

struct bpf_arena is opaque to callers outside arena.c. Add two helpers
for struct_ops subsystems that need to reach into an arena:

  bpf_arena_map_kern_vm_start(struct bpf_map *map)
    returns @map's kern_vm_start. A sched_ext follow-up needs this
    to translate kern_va <-> uaddr.

  bpf_prog_arena(struct bpf_prog *prog)
    returns the bpf_map of the arena referenced by @prog (NULL if
    @prog references no arena). The verifier enforces at most one
    arena per program. Used by struct_ops callers that auto-discover
    an arena from a member prog and need to take a map reference.

Suggested-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Signed-off-by: Tejun Heo <tj@kernel.org>
---
 include/linux/bpf.h |  2 ++
 kernel/bpf/arena.c  | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 5b99d786e98c..e1ba57c10aaa 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -618,6 +618,8 @@ void bpf_rb_root_free(const struct btf_field *field, void *rb_root,
 		      struct bpf_spin_lock *spin_lock);
 u64 bpf_arena_get_kern_vm_start(struct bpf_arena *arena);
 u64 bpf_arena_get_user_vm_start(struct bpf_arena *arena);
+u64 bpf_arena_map_kern_vm_start(struct bpf_map *map);
+struct bpf_map *bpf_prog_arena(struct bpf_prog *prog);
 int bpf_obj_name_cpy(char *dst, const char *src, unsigned int size);
 
 struct bpf_offload_dev;
diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
index a811cf6170fa..51b9ae36feb6 100644
--- a/kernel/bpf/arena.c
+++ b/kernel/bpf/arena.c
@@ -84,6 +84,32 @@ u64 bpf_arena_get_user_vm_start(struct bpf_arena *arena)
 	return arena ? arena->user_vm_start : 0;
 }
 
+/**
+ * bpf_arena_map_kern_vm_start - kern_vm_start lookup by struct bpf_map *
+ * @map: a BPF_MAP_TYPE_ARENA map
+ *
+ * Return @map's kern_vm_start.
+ */
+u64 bpf_arena_map_kern_vm_start(struct bpf_map *map)
+{
+	return bpf_arena_get_kern_vm_start(container_of(map, struct bpf_arena, map));
+}
+
+/**
+ * bpf_prog_arena - return the bpf_map of the arena referenced by @prog
+ * @prog: a loaded BPF program
+ *
+ * The verifier enforces at most one arena per program and stores it in
+ * prog->aux->arena. Return that arena's underlying bpf_map, or NULL if
+ * @prog does not reference an arena.
+ */
+struct bpf_map *bpf_prog_arena(struct bpf_prog *prog)
+{
+	struct bpf_arena *arena = prog->aux->arena;
+
+	return arena ? &arena->map : NULL;
+}
+
 static long arena_map_peek_elem(struct bpf_map *map, void *value)
 {
 	return -EOPNOTSUPP;
-- 
2.54.0


