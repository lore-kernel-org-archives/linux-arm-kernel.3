Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91469E9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 14:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+sGQUoFknPrYwnhrHGJoAgCpCs1zVsEElKhl0yi99I=; b=tkEe6okaiQi4f7o1HOV0EQalXV
	RJcw0Rz6Gx+yCDw9X1v5y7MhuZnRJqwj3hrmj3GBC8PP18oCcdYio9pHj/U4ajmlWq6F7auAhDXQh
	+YzSBdlLYS0TEYoEiz1lFUZCbUmYbUpZ3XX2ar0Y8yaA4f+MoECujJvUUxSVPh9L1HrhfUwmmxCXS
	D4g9GEqtWu6gtaQL5LI/lynE++VE/B9NaP1eg+OUuocH6tQcZKBK9wgfCl5zICSXQzFg23BzoJpod
	PamsUA5NhTC1PRuwk2YHqeAPrTmw9sYtruWwN0PZt+MYTJnr3iEqQvt9HLigaN1MNAl1nXRAdtHhq
	zVBoOIzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt536-0000000BRwu-2kLp;
	Thu, 19 Feb 2026 14:30:36 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt531-0000000BRw3-3bvs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 14:30:34 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771511428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+sGQUoFknPrYwnhrHGJoAgCpCs1zVsEElKhl0yi99I=;
	b=LdLGVj3JZVjoaC4PviPKhiaOGm4q8cPa83+pWAmoAjKnYhX5qUqu+FxPsdRrQXpeF0GQLE
	Zwqhen5nJJovrxh5oVLCDsPl+TM+8VTaL8zh3tlcVVGXorFEutTkIBqXrR4uvHnjdmooml
	pogdAz+4IAVZMGWa44hnUB7tulcT+UM=
From: Leon Hwang <leon.hwang@linux.dev>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	Leon Hwang <leon.hwang@linux.dev>,
	Peilin Ye <yepeilin@google.com>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Viktor Malik <vmalik@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-patches-bot@fb.com
Subject: [PATCH bpf-next v2 1/6] bpf: Introduce 64-bit bitops kfuncs
Date: Thu, 19 Feb 2026 22:29:23 +0800
Message-ID: <20260219142933.13904-2-leon.hwang@linux.dev>
In-Reply-To: <20260219142933.13904-1-leon.hwang@linux.dev>
References: <20260219142933.13904-1-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_063032_726831_C35240DD 
X-CRM114-Status: GOOD (  15.52  )
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

Add the following generic 64-bit bitops kfuncs:

* bpf_clz64(): Count leading zeros.
* bpf_ctz64(): Count trailing zeros.
* bpf_ffs64(): Find first set bit, 1-based index, returns 0 when input
  is 0.
* bpf_fls64(): Find last set bit, 1-based index.
* bpf_bitrev64(): Reverse bits.
* bpf_popcnt64(): Population count.
* bpf_rol64(): Rotate left.
* bpf_ror64(): Rotate right.

Defined zero-input behavior:

* bpf_clz64(0) = 64
* bpf_ctz64(0) = 64
* bpf_ffs64(0) = 0
* bpf_fls64(0) = 0

These kfuncs are inlined by JIT backends when the required CPU features are
available. Otherwise, they fall back to regular function calls.

Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 include/linux/filter.h | 10 ++++++++
 kernel/bpf/core.c      |  6 +++++
 kernel/bpf/helpers.c   | 50 +++++++++++++++++++++++++++++++++++++++
 kernel/bpf/verifier.c  | 53 +++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/include/linux/filter.h b/include/linux/filter.h
index 44d7ae95ddbc..b8a538bec5c6 100644
--- a/include/linux/filter.h
+++ b/include/linux/filter.h
@@ -1157,6 +1157,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog);
 void bpf_jit_compile(struct bpf_prog *prog);
 bool bpf_jit_needs_zext(void);
 bool bpf_jit_inlines_helper_call(s32 imm);
+bool bpf_jit_inlines_kfunc_call(void *func_addr);
 bool bpf_jit_supports_subprog_tailcalls(void);
 bool bpf_jit_supports_percpu_insn(void);
 bool bpf_jit_supports_kfunc_call(void);
@@ -1837,4 +1838,13 @@ static inline void *bpf_skb_meta_pointer(struct sk_buff *skb, u32 offset)
 }
 #endif /* CONFIG_NET */
 
+u64 bpf_clz64(u64 x);
+u64 bpf_ctz64(u64 x);
+u64 bpf_ffs64(u64 x);
+u64 bpf_fls64(u64 x);
+u64 bpf_popcnt64(u64 x);
+u64 bpf_bitrev64(u64 x);
+u64 bpf_rol64(u64 x, u64 s);
+u64 bpf_ror64(u64 x, u64 s);
+
 #endif /* __LINUX_FILTER_H__ */
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 5ab6bace7d0d..5f37309d83fc 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -3114,6 +3114,12 @@ bool __weak bpf_jit_inlines_helper_call(s32 imm)
 	return false;
 }
 
+/* Return TRUE if the JIT backend inlines the kfunc. */
+bool __weak bpf_jit_inlines_kfunc_call(void *func_addr)
+{
+	return false;
+}
+
 /* Return TRUE if the JIT backend supports mixing bpf2bpf and tailcalls. */
 bool __weak bpf_jit_supports_subprog_tailcalls(void)
 {
diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 7ac32798eb04..6bf73c46af72 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -29,6 +29,8 @@
 #include <linux/task_work.h>
 #include <linux/irq_work.h>
 #include <linux/buildid.h>
+#include <linux/bitops.h>
+#include <linux/bitrev.h>
 
 #include "../../lib/kstrtox.h"
 
@@ -4501,6 +4503,46 @@ __bpf_kfunc int bpf_timer_cancel_async(struct bpf_timer *timer)
 	}
 }
 
+__bpf_kfunc u64 bpf_clz64(u64 x)
+{
+	return x ? 64 - fls64(x) : 64;
+}
+
+__bpf_kfunc u64 bpf_ctz64(u64 x)
+{
+	return x ? __ffs64(x) : 64;
+}
+
+__bpf_kfunc u64 bpf_ffs64(u64 x)
+{
+	return x ? __ffs64(x) + 1 : 0;
+}
+
+__bpf_kfunc u64 bpf_fls64(u64 x)
+{
+	return fls64(x);
+}
+
+__bpf_kfunc u64 bpf_popcnt64(u64 x)
+{
+	return hweight64(x);
+}
+
+__bpf_kfunc u64 bpf_bitrev64(u64 x)
+{
+	return ((u64)bitrev32(x & 0xFFFFFFFF) << 32) | bitrev32(x >> 32);
+}
+
+__bpf_kfunc u64 bpf_rol64(u64 x, u64 s)
+{
+	return rol64(x, s);
+}
+
+__bpf_kfunc u64 bpf_ror64(u64 x, u64 s)
+{
+	return ror64(x, s);
+}
+
 __bpf_kfunc_end_defs();
 
 static void bpf_task_work_cancel_scheduled(struct irq_work *irq_work)
@@ -4578,6 +4620,14 @@ BTF_ID_FLAGS(func, bpf_key_put, KF_RELEASE)
 BTF_ID_FLAGS(func, bpf_verify_pkcs7_signature, KF_SLEEPABLE)
 #endif
 #endif
+BTF_ID_FLAGS(func, bpf_clz64, KF_FASTCALL)
+BTF_ID_FLAGS(func, bpf_ctz64, KF_FASTCALL)
+BTF_ID_FLAGS(func, bpf_ffs64, KF_FASTCALL)
+BTF_ID_FLAGS(func, bpf_fls64, KF_FASTCALL)
+BTF_ID_FLAGS(func, bpf_popcnt64, KF_FASTCALL)
+BTF_ID_FLAGS(func, bpf_bitrev64, KF_FASTCALL)
+BTF_ID_FLAGS(func, bpf_rol64, KF_FASTCALL)
+BTF_ID_FLAGS(func, bpf_ror64, KF_FASTCALL)
 BTF_KFUNCS_END(generic_btf_ids)
 
 static const struct btf_kfunc_id_set generic_kfunc_set = {
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 0162f946032f..2cb29bc1b3c3 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -12461,6 +12461,14 @@ enum special_kfunc_type {
 	KF_bpf_session_is_return,
 	KF_bpf_stream_vprintk,
 	KF_bpf_stream_print_stack,
+	KF_bpf_clz64,
+	KF_bpf_ctz64,
+	KF_bpf_ffs64,
+	KF_bpf_fls64,
+	KF_bpf_bitrev64,
+	KF_bpf_popcnt64,
+	KF_bpf_rol64,
+	KF_bpf_ror64,
 };
 
 BTF_ID_LIST(special_kfunc_list)
@@ -12541,6 +12549,14 @@ BTF_ID(func, bpf_arena_reserve_pages)
 BTF_ID(func, bpf_session_is_return)
 BTF_ID(func, bpf_stream_vprintk)
 BTF_ID(func, bpf_stream_print_stack)
+BTF_ID(func, bpf_clz64)
+BTF_ID(func, bpf_ctz64)
+BTF_ID(func, bpf_ffs64)
+BTF_ID(func, bpf_fls64)
+BTF_ID(func, bpf_bitrev64)
+BTF_ID(func, bpf_popcnt64)
+BTF_ID(func, bpf_rol64)
+BTF_ID(func, bpf_ror64)
 
 static bool is_task_work_add_kfunc(u32 func_id)
 {
@@ -18204,6 +18220,34 @@ static bool verifier_inlines_helper_call(struct bpf_verifier_env *env, s32 imm)
 	}
 }
 
+static bool bpf_kfunc_is_fastcall(struct bpf_verifier_env *env, u32 func_id, u32 flags)
+{
+	if (!(flags & KF_FASTCALL))
+		return false;
+
+	if (!env->prog->jit_requested)
+		return true;
+
+	if (func_id == special_kfunc_list[KF_bpf_clz64])
+		return bpf_jit_inlines_kfunc_call(bpf_clz64);
+	if (func_id == special_kfunc_list[KF_bpf_ctz64])
+		return bpf_jit_inlines_kfunc_call(bpf_ctz64);
+	if (func_id == special_kfunc_list[KF_bpf_ffs64])
+		return bpf_jit_inlines_kfunc_call(bpf_ffs64);
+	if (func_id == special_kfunc_list[KF_bpf_fls64])
+		return bpf_jit_inlines_kfunc_call(bpf_fls64);
+	if (func_id == special_kfunc_list[KF_bpf_bitrev64])
+		return bpf_jit_inlines_kfunc_call(bpf_bitrev64);
+	if (func_id == special_kfunc_list[KF_bpf_popcnt64])
+		return bpf_jit_inlines_kfunc_call(bpf_popcnt64);
+	if (func_id == special_kfunc_list[KF_bpf_rol64])
+		return bpf_jit_inlines_kfunc_call(bpf_rol64);
+	if (func_id == special_kfunc_list[KF_bpf_ror64])
+		return bpf_jit_inlines_kfunc_call(bpf_ror64);
+
+	return true;
+}
+
 struct call_summary {
 	u8 num_params;
 	bool is_void;
@@ -18246,7 +18290,7 @@ static bool get_call_summary(struct bpf_verifier_env *env, struct bpf_insn *call
 			/* error would be reported later */
 			return false;
 		cs->num_params = btf_type_vlen(meta.func_proto);
-		cs->fastcall = meta.kfunc_flags & KF_FASTCALL;
+		cs->fastcall = bpf_kfunc_is_fastcall(env, meta.func_id, meta.kfunc_flags);
 		cs->is_void = btf_type_is_void(btf_type_by_id(meta.btf, meta.func_proto->type));
 		return true;
 	}
@@ -23186,6 +23230,13 @@ static int fixup_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
 		insn_buf[4] = BPF_ALU64_REG(BPF_SUB, BPF_REG_0, BPF_REG_1);
 		insn_buf[5] = BPF_ALU64_IMM(BPF_NEG, BPF_REG_0, 0);
 		*cnt = 6;
+	} else if (desc->func_id == special_kfunc_list[KF_bpf_ffs64] &&
+		   bpf_jit_inlines_kfunc_call(bpf_ffs64)) {
+		insn_buf[0] = BPF_MOV64_IMM(BPF_REG_0, 0);
+		insn_buf[1] = BPF_JMP_IMM(BPF_JEQ, BPF_REG_1, 0, 2);
+		insn_buf[2] = *insn;
+		insn_buf[3] = BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, 1);
+		*cnt = 4;
 	}
 
 	if (env->insn_aux_data[insn_idx].arg_prog) {
-- 
2.52.0


