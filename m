Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0427D65C7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ow0LL48bVlDg9uMUmfgRO5F0UfCH0mX2oYMejcIY4z4=; b=Am9zJp+29jkPxayOEYZpcVIXdz
	/QDxChDFcVO5N4aZ2RwNxxdH7uBaWX5sqOGWXNbWGLvN6+OlgEuXkSn9LnqTByowl7+6SCruomAYj
	5B6584KxoExilHaEGa/LhJ/LzxViCBtMT9THWLuSLmkVmPL8URyMaogTvUEfmtOVApHRvhabjALXj
	2IjMbZWEjeSVwxpMEMrPe2Wct0DhziSss21kLaLY7ImjXJBCqmLjtZi4Tz51mh2wi6xuvqmK0Zg1O
	sRiJwTWPu79i20SGLzQkUpJDJiqYcvHRK6nV1Nb6ICDEC4a8aBiD2e0Lb2SxXUqHrNksmdkshtTI0
	WTWGG7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuOV-000000076rG-3RHx;
	Wed, 17 Dec 2025 16:28:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuOT-000000076ps-3GnA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:28:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B063741991;
	Wed, 17 Dec 2025 16:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62535C116C6;
	Wed, 17 Dec 2025 16:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765988932;
	bh=rKOV9zyJXMZ/yYe4aPWF7ZuJKQBqItGT2/94wCSdR2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Es/fpxY5sJR1wB15XxI7CDVMr6kSu7EYLeZVx/AgIOJdN84Ldndm0SzX6i3KPqMXj
	 hIk27mrHfGtLTLvLp5JuwTXGmIfopno4lLMLmH6k5Op2DR74Tv2hMqMZGbbGZPrERa
	 vyE3eksEra9RSJJNZPVOgiGtVwTgc86f74/8oeauk8Xxc6R9hF9OyfTWEFMQkhqS+z
	 XqjowhN3dHegk2gm22OLA52xFIdLGI+k8oPwLaSgx5HxQ6I8KL36pCixO6BWTLOF+Q
	 +i/P+s5uD7FKzyoZ6vZqg5bbY5i+UCGB1Yz8FitTt8hEBS9rRCxzH84JuXqYDfH1aW
	 tStpgnXJpNV3Q==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	kernel-team@meta.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH bpf-next 1/2] bpf: move recursion detection logic to helpers
Date: Wed, 17 Dec 2025 08:28:26 -0800
Message-ID: <20251217162830.2597286-2-puranjay@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217162830.2597286-1-puranjay@kernel.org>
References: <20251217162830.2597286-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_082853_868119_6EB245C2 
X-CRM114-Status: GOOD (  11.78  )
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

BPF programs detect recursion by doing atomic inc/dec on a per-cpu
active counter from the trampoline. Create two helpers for operations on
this active counter, this makes it easy to changes the recursion
detection logic in future.

This change makes no functional changes.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 include/linux/bpf.h      | 10 ++++++++++
 kernel/bpf/trampoline.c  |  8 ++++----
 kernel/trace/bpf_trace.c |  4 ++--
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index bb3847caeae1..2da986136d26 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -2004,6 +2004,16 @@ struct bpf_struct_ops_common_value {
 	enum bpf_struct_ops_state state;
 };
 
+static inline bool bpf_prog_get_recursion_context(struct bpf_prog *prog)
+{
+	return this_cpu_inc_return(*(prog->active)) == 1;
+}
+
+static inline void bpf_prog_put_recursion_context(struct bpf_prog *prog)
+{
+	this_cpu_dec(*(prog->active));
+}
+
 #if defined(CONFIG_BPF_JIT) && defined(CONFIG_BPF_SYSCALL)
 /* This macro helps developer to register a struct_ops type and generate
  * type information correctly. Developers should use this macro to register
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index 976d89011b15..2a125d063e62 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -949,7 +949,7 @@ static u64 notrace __bpf_prog_enter_recur(struct bpf_prog *prog, struct bpf_tram
 
 	run_ctx->saved_run_ctx = bpf_set_run_ctx(&run_ctx->run_ctx);
 
-	if (unlikely(this_cpu_inc_return(*(prog->active)) != 1)) {
+	if (unlikely(!bpf_prog_get_recursion_context(prog))) {
 		bpf_prog_inc_misses_counter(prog);
 		if (prog->aux->recursion_detected)
 			prog->aux->recursion_detected(prog);
@@ -993,7 +993,7 @@ static void notrace __bpf_prog_exit_recur(struct bpf_prog *prog, u64 start,
 	bpf_reset_run_ctx(run_ctx->saved_run_ctx);
 
 	update_prog_stats(prog, start);
-	this_cpu_dec(*(prog->active));
+	bpf_prog_put_recursion_context(prog);
 	rcu_read_unlock_migrate();
 }
 
@@ -1029,7 +1029,7 @@ u64 notrace __bpf_prog_enter_sleepable_recur(struct bpf_prog *prog,
 
 	run_ctx->saved_run_ctx = bpf_set_run_ctx(&run_ctx->run_ctx);
 
-	if (unlikely(this_cpu_inc_return(*(prog->active)) != 1)) {
+	if (unlikely(!bpf_prog_get_recursion_context(prog))) {
 		bpf_prog_inc_misses_counter(prog);
 		if (prog->aux->recursion_detected)
 			prog->aux->recursion_detected(prog);
@@ -1044,7 +1044,7 @@ void notrace __bpf_prog_exit_sleepable_recur(struct bpf_prog *prog, u64 start,
 	bpf_reset_run_ctx(run_ctx->saved_run_ctx);
 
 	update_prog_stats(prog, start);
-	this_cpu_dec(*(prog->active));
+	bpf_prog_put_recursion_context(prog);
 	migrate_enable();
 	rcu_read_unlock_trace();
 }
diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index fe28d86f7c35..6e076485bf70 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -2063,7 +2063,7 @@ void __bpf_trace_run(struct bpf_raw_tp_link *link, u64 *args)
 	struct bpf_trace_run_ctx run_ctx;
 
 	cant_sleep();
-	if (unlikely(this_cpu_inc_return(*(prog->active)) != 1)) {
+	if (unlikely(!bpf_prog_get_recursion_context(prog))) {
 		bpf_prog_inc_misses_counter(prog);
 		goto out;
 	}
@@ -2077,7 +2077,7 @@ void __bpf_trace_run(struct bpf_raw_tp_link *link, u64 *args)
 
 	bpf_reset_run_ctx(old_run_ctx);
 out:
-	this_cpu_dec(*(prog->active));
+	bpf_prog_put_recursion_context(prog);
 }
 
 #define UNPACK(...)			__VA_ARGS__
-- 
2.47.3


