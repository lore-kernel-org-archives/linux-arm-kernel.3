Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CFECD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 21:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbKF8Ty5mSiZZxGGgoloeLeRCHsdxuVl6WTHSchIjcE=; b=RanJuSDxCqf+jnWK792QWA20tS
	Bl2rNMX/cDbXdFjBOtbcUgWbt+3IiJyXClg70SJmJ3CgWi7koW2sdeiYIZmrVWt/MPdtHAjRWPbT7
	NtRDHtO1mLCznwpf4T4l4cnt09veckJ9A+UYlQu/e4XdpTsa7z0sGNaJDOOimRbkh9ZQVkf7robVl
	z7Gral12gtMAd7Btl8jnAZyv6J02NMh2qug8Z6celXz17fisUAyu1ocMrcP8I2nL+U+ys2UKpv4nM
	HlUz9O+b/JzOZ321Jk65KW3Jp7fT8pLI6Y81Y47G0bumZTQEZUmqg0J/IFY82oFEPKHvVXv4PR6F4
	MqjSR1sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOimz-0000000DTa2-1oEC;
	Sun, 17 May 2026 21:12:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOimt-0000000DTVK-3Ubt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 21:12:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B828D445E3;
	Sun, 17 May 2026 21:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CD3C2BCC6;
	Sun, 17 May 2026 21:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779052359;
	bh=LHSQ1SGJL53/9Q/iBKU3YD2olZY7RKf5FJ0iXpw1GQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NnANAk3G8Dk0DG5c4GgZfuCZMgsvIt2JOV1c83LG8IAsAFIujoM0ARgHCwnaKpLi8
	 IDkCchIGLmRWKrnHg/fHXqE/0q0/QWAPYSzGFVwNGtF5e0Ha3811HjO6OTdzmVTPwF
	 1X/RnE7eL5S2rxAm6PHaT2j7FL6GBWlkSu+S+uNyc0jA5+fkblbMLcToOyH6ygBCPx
	 0jNMdLuZTtjbARsP4NcJG8D8AklOxJ+4Ln3vUY22Vx2baWK/4Vyz1RKKmgpq174d4E
	 wgP7rdlUmDCufQIkqMwpsKyd7yNHxsI5pXeaPLmihhfDZqQgjzqhoADkAWXzC/srgL
	 0S84ES673/azg==
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
Subject: [PATCH 6/8] sched_ext: Require an arena for cid-form schedulers
Date: Sun, 17 May 2026 11:12:30 -1000
Message-ID: <20260517211232.1670594-7-tj@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517211232.1670594-1-tj@kernel.org>
References: <20260517211232.1670594-1-tj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_141239_910403_323FB82E 
X-CRM114-Status: GOOD (  17.16  )
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

Upcoming patches will let the kernel place arena-resident scratch shared
with the BPF program (e.g. per-CPU set_cmask cmask) so the BPF side can
dereference it directly via __arena pointers, replacing the current
cmask_copy_from_kernel() probe-read loop. That requires each cid-form
scheduler to expose its arena to the kernel. Kernel- side accesses are
recovered by the per-arena scratch-page mechanism.

bpf_scx_reg_cid() walks the struct_ops member progs via
bpf_struct_ops_for_each_prog() and reads each prog's arena via
bpf_prog_arena(). The verifier enforces one arena per program, so each
member prog contributes at most one arena. All non-NULL contributions must
match and at least one member prog must use an arena. The map ref is held on
scx_sched and dropped on sched destroy. cpu-form schedulers (bpf_scx_reg)
are unchanged - no arena requirement.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c          | 56 ++++++++++++++++++++++++++++++++++++-
 kernel/sched/ext_internal.h |  8 ++++++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 64f8a096f133..94aab7037329 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -5009,6 +5009,8 @@ static void scx_sched_free_rcu_work(struct work_struct *work)
 
 	rhashtable_free_and_destroy(&sch->dsq_hash, NULL, NULL);
 	free_exit_info(sch->exit_info);
+	if (sch->arena_map)
+		bpf_map_put(sch->arena_map);
 	kfree(sch);
 }
 
@@ -6732,6 +6734,7 @@ struct scx_enable_cmd {
 		struct sched_ext_ops_cid	*ops_cid;
 	};
 	bool			is_cid_type;
+	struct bpf_map		*arena_map;	/* arena ref to transfer to sch */
 	int			ret;
 };
 
@@ -6898,6 +6901,15 @@ static struct scx_sched *scx_alloc_and_add_sched(struct scx_enable_cmd *cmd,
 		return ERR_PTR(ret);
 	}
 #endif	/* CONFIG_EXT_SUB_SCHED */
+
+	/*
+	 * Consume the arena_map ref bpf_scx_reg_cid() took. Defer to here so
+	 * earlier failure paths leave cmd->arena_map set and bpf_scx_reg_cid
+	 * drops the ref. After this point, sch owns the ref and any cleanup
+	 * runs through scx_sched_free_rcu_work() which puts it.
+	 */
+	sch->arena_map = cmd->arena_map;
+	cmd->arena_map = NULL;
 	return sch;
 
 #ifdef CONFIG_EXT_SUB_SCHED
@@ -7884,11 +7896,53 @@ static int bpf_scx_reg(void *kdata, struct bpf_link *link)
 	return scx_enable(&cmd, link);
 }
 
+struct scx_arena_scan {
+	struct bpf_map	*arena;
+	int		err;
+};
+
+/*
+ * The verifier enforces one arena per BPF program, so each struct_ops
+ * member prog contributes at most one arena via bpf_prog_arena().
+ * Require all non-NULL contributions to match.
+ */
+static int scx_arena_scan_prog(struct bpf_prog *prog, void *data)
+{
+	struct scx_arena_scan *s = data;
+	struct bpf_map *arena = bpf_prog_arena(prog);
+
+	if (!arena)
+		return 0;
+	if (s->arena && s->arena != arena) {
+		s->err = -EINVAL;
+		return 1;
+	}
+	s->arena = arena;
+	return 0;
+}
+
 static int bpf_scx_reg_cid(void *kdata, struct bpf_link *link)
 {
 	struct scx_enable_cmd cmd = { .ops_cid = kdata, .is_cid_type = true };
+	struct scx_arena_scan scan = {};
+	int ret;
 
-	return scx_enable(&cmd, link);
+	bpf_struct_ops_for_each_prog(kdata, scx_arena_scan_prog, &scan);
+	if (scan.err) {
+		pr_err("sched_ext: cid-form scheduler uses multiple arena maps\n");
+		return scan.err;
+	}
+	if (!scan.arena) {
+		pr_err("sched_ext: cid-form scheduler must use a BPF arena map\n");
+		return -EINVAL;
+	}
+
+	bpf_map_inc(scan.arena);
+	cmd.arena_map = scan.arena;
+	ret = scx_enable(&cmd, link);
+	if (cmd.arena_map)		/* not consumed by scx_alloc_and_add_sched() */
+		bpf_map_put(cmd.arena_map);
+	return ret;
 }
 
 static void bpf_scx_unreg(void *kdata, struct bpf_link *link)
diff --git a/kernel/sched/ext_internal.h b/kernel/sched/ext_internal.h
index 7258aea94b9f..d40cfd29ddaa 100644
--- a/kernel/sched/ext_internal.h
+++ b/kernel/sched/ext_internal.h
@@ -1111,6 +1111,14 @@ struct scx_sched {
 		struct sched_ext_ops_cid	ops_cid;
 	};
 	bool			is_cid_type;	/* true if registered via bpf_sched_ext_ops_cid */
+
+	/*
+	 * Arena map auto-discovered from member progs at struct_ops attach.
+	 * cid-form schedulers must use exactly one arena across all member
+	 * progs. NULL on cpu-form.
+	 */
+	struct bpf_map		*arena_map;
+
 	DECLARE_BITMAP(has_op, SCX_OPI_END);
 
 	/*
-- 
2.54.0


