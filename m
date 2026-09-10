Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12268C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLCJ034DJzI4gEh3LNSHB0+4siN8J5WsqqEdRoq/eTA=; b=Mln8M3I4OvgbXIEVZTx3iFfWKn
	RsdQL5Kq/wZz/akkGpZ19ahcjUv3vFAXwYDsPoVmG6iYuGS93+eLE8LcnfD2oiB+nvyXJkuY4fURP
	x1m3tdHjU8XnAirsGYqaYXrR+syoWUfI1AwNwitaru7s5v8H/YUdIdNAy1j4tBcHL3exC5F+v1m07
	c41oUGfryGjub0m+doF7PEt6GtxNO7z0/7N6ZJME7bRzbofyRasc2+XULFzxqNSxsRvsTAlzyb891
	72NvL5ofrWHPKdlEz2SB5mMO+/16Va8VoEwagIUFQHbLga5q55Y909zRQIOjP2voTNXenrDdL0vfA
	8p23tJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrc-0000000FBge-33Av;
	Thu, 10 Sep 2026 18:51:12 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrU-0000000FBZL-2Frq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:51:05 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-9399daa3d43so437935585a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066263; x=1789671063; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLCJ034DJzI4gEh3LNSHB0+4siN8J5WsqqEdRoq/eTA=;
        b=Uz063r3giG9ZK4NCnljLiAIWhZ52F30Ew5B3s+mxYqax4+Ie7ovqxCPF4NV3AFaVAo
         +nQes/Gn9pd10fBJFyYKgDoYWrs2zJHNbfpDPNxE/hb4HwTfcXZAtT4Qi2rOScjNVJU6
         5DAHZr449e00qfN90B3LcR4dJD7eNs1MxB34jAt2WIr+rmdaxwUtyGKQ6+QwTPUtfR0L
         8aLCKxH2LJLhJ++/P8Y5EumUZ9VIeuwTCtB2vW9QnLDMhvQge7Z0hwo0PyeptS7SIFii
         QvDMcFhECTPK+shh5CP5KtRqr/D752APlUuoPd+JO/ac0W5iZFfDFqHX+kito8DYA3XL
         223Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066263; x=1789671063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aLCJ034DJzI4gEh3LNSHB0+4siN8J5WsqqEdRoq/eTA=;
        b=tN5w5AM7SS1t33Py16RD58kKa69ba3goFOELGUJcDb4bj78jhYzQ+HSvYx7lFYiLzr
         Ho7EfdJuHjJwghD8AeoSLp0uP8dzIURCKTzdrDRQpYWGGMlrhyEg4SGpWubkIRUIFq/E
         1ZUiFPVpGE9gjQJgzT24hqUTuFo0fu3CfEFHW0wqFKgI2hPENcLkdOB0iYMFEjY/smCE
         BKPYTVfLCBAGB5wKN/nZd+CoyZwzSZj5z9UjTPsCpLDMsVGdmX+Gq1OTeRcBz5CmnIIC
         wPf9bsZOACz6pQt39WFPMtjOKPEpxMXmIMBnv0YhMuLj9Eo/TqrUw1iS1Lc4uMSkJUel
         kokQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcfQroIQxAzwpn2CgtcL1d4IVhgaeaRedUjFTjZIuSOd//1lQNnHnRATWZ+9Lf4k3w5VVzByxjIMlzKdJ+/yTY@lists.infradead.org
X-Gm-Message-State: AFuF++mIbDE0arQVN6b5pN54B2JRax17T0npCMljMsLkz6Wfa0QWauiC
	NU9F2kMVgYvDT5wsf0cAP9fhXCcWfPXZaPahJCZwUB0uYkwA/X/5C5jsJ/gXeR1qQxY=
X-Gm-Gg: AYBFou1xn5VLMCh6JuGzE74hJFBz/r20JCIxaYcgNOjP3hV/n9HrXks0QlK1y8fhF7G
	74c9jGXAZ5Xy4DkYeF8RXMyOjUqT8g4KYFNvT+AU3H50WqHshb3OOJkOZnpP/2Fk28NgZRHijLN
	S+t3R5CKhOopoQzujXcfdn9ATPXmCalHjARnnGj2VxnNtyH4uFUxPjuRCdCn7AjO0SworfKuOQK
	4uMtXXzepUPlm+Y/0heDeHt8aGvxdMxLcl6DjoSKay9DFpEg1egM5xdg+ml9sA655HFNzUHlVkJ
	7Uvs/sNfg7c5yuzxpZsc3r1TtnXDmQtEpdIh2zx9zK8hvrIY3l1gKVDoXYZmHib5KooN2IOW8Lk
	3OGeIgVbu378D7r6iUvN9s3r8Myp1joNFsoFFrANRHF3DhbvCPfp48BOFdXu2Kv/bIMO8fM1YbY
	w3M4XDAlxPHxUDDqoubjACuigTOYEIXe251YCC4RBP/emh+bk6A3pxwaYqqrButBi2gYpANAwRG
	N4+Fmk+yaNp2zbmPJM6aOIconQMIavQXEwUwDq2gNBzfmoKX/Oy2o8n8XNSXWuiGbA=
X-Received: by 2002:a05:620a:6191:b0:939:a6e4:2267 with SMTP id af79cd13be357-939ea2bff00mr14491685a.50.1789066258414;
        Thu, 10 Sep 2026 11:50:58 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e807eba7sm47389685a.29.2026.09.10.11.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:50:57 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:27 +0000
Subject: [PATCH RFC 04/13] kprobes: Let Tasks RCU recognise tasks preempted
 in an optprobe jump window
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-4-d4469f4cc101@toxicpanda.com>
References: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
In-Reply-To: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_115104_601809_55D2F701 
X-CRM114-Status: GOOD (  19.80  )
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

kprobe_optimizer() is the one synchronize_rcu_tasks() user that is not
about trampoline text: it waits for tasks that were preempted on an
instruction boundary inside the bytes it is about to overwrite with the
optimized jump, so that none of them resumes into the middle of the new
instruction.  Such a task sits in ordinary kernel or module text with
rcu_tramp_nesting == 0, and can only have got there via an irq-exit
preemption.

Add kprobe_in_optimized_region(), a lockless and conservative form of
get_optimized_kprobe() that reports whether any registered kprobe lies
within MAX_OPTIMIZED_LENGTH before the given address regardless of its
optimization state, and have rcu_tasks_ip_in_trampoline() consult it so
that a task interrupted there keeps holding off the Tasks RCU grace
period once preemption becomes a quiescent state.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/kprobes.h  |  8 +++++++-
 include/linux/rcupdate.h |  4 +++-
 kernel/kprobes.c         | 24 ++++++++++++++++++++++++
 kernel/rcu/tasks.h       |  6 ++++++
 4 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
index e6de7ae55bda..74cc48c04417 100644
--- a/include/linux/kprobes.h
+++ b/include/linux/kprobes.h
@@ -530,11 +530,17 @@ static inline bool is_kprobe_insn_slot(unsigned long addr)
 }
 #endif /* !CONFIG_KPROBES */
 
-#ifndef CONFIG_OPTPROBES
+#ifdef CONFIG_OPTPROBES
+bool kprobe_in_optimized_region(unsigned long addr);
+#else /* !CONFIG_OPTPROBES */
 static inline bool is_kprobe_optinsn_slot(unsigned long addr)
 {
 	return false;
 }
+static inline bool kprobe_in_optimized_region(unsigned long addr)
+{
+	return false;
+}
 #endif /* !CONFIG_OPTPROBES */
 
 #ifdef CONFIG_KRETPROBES
diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 0a408e36ea15..e9afbbb1b061 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -200,7 +200,9 @@ bool arch_rcu_tasks_ip_in_trampoline(unsigned long ip);
  * cannot be preempted synchronously, only from an interrupt, so the irq-exit
  * preemption path covers it by checking regs->ip with
  * rcu_tasks_ip_in_trampoline() and holding the count elevated across
- * preempt_schedule_irq() when it matches.
+ * preempt_schedule_irq() when it matches.  The same check covers the one
+ * non-trampoline user, kprobe jump optimization, which waits for tasks
+ * preempted inside the instruction bytes it is about to overwrite.
  *
  * Only current writes the count and only current (or an interrupt on the same
  * CPU) reads it, so plain accesses suffice.
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 6337da5cab9e..76f146edb0e5 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -511,6 +511,30 @@ static struct kprobe *get_optimized_kprobe(kprobe_opcode_t *addr)
 	return NULL;
 }
 
+/**
+ * kprobe_in_optimized_region - Could @addr be inside bytes a jump-optimized
+ *	kprobe replaces?
+ * @addr: kernel text address, typically an interrupted instruction pointer
+ *
+ * kprobe_optimizer() relies on synchronize_rcu_tasks() to wait for tasks that
+ * were preempted on an instruction boundary inside the region about to be
+ * overwritten by the optimized jump; such a task must not report a Tasks RCU
+ * quiescent state when it is preempted (see rcu_tasks_ip_in_trampoline()).
+ * This is the lockless, conservative form of get_optimized_kprobe(): it does
+ * not care whether the kprobe found is, or ever will be, optimized.  May be
+ * called from any context with preemption disabled.
+ */
+bool kprobe_in_optimized_region(unsigned long addr)
+{
+	int i;
+
+	for (i = 1; i < MAX_OPTIMIZED_LENGTH / sizeof(kprobe_opcode_t); i++)
+		if (get_kprobe((kprobe_opcode_t *)addr - i))
+			return true;
+	return false;
+}
+NOKPROBE_SYMBOL(kprobe_in_optimized_region);
+
 /* Optimization staging list, protected by 'kprobe_mutex' */
 static LIST_HEAD(optimizing_list);
 static LIST_HEAD(unoptimizing_list);
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index a801ec4a951b..a55dc2a20fb7 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1114,6 +1114,9 @@ bool __weak arch_rcu_tasks_ip_in_trampoline(unsigned long ip)
  *    deliberately does not consult is_ftrace_trampoline() and friends: text
  *    being torn down may already be unregistered there while a task still
  *    stands on it;
+ *  - inside the bytes following a registered kprobe that jump optimization
+ *    may overwrite, which kprobe_optimizer() protects with
+ *    synchronize_rcu_tasks();
  *  - in core text the architecture flags via arch_rcu_tasks_ip_in_trampoline().
  *
  * A false positive only defers the quiescent state to the task's next
@@ -1121,6 +1124,9 @@ bool __weak arch_rcu_tasks_ip_in_trampoline(unsigned long ip)
  */
 bool rcu_tasks_ip_in_trampoline(unsigned long ip)
 {
+	if (kprobe_in_optimized_region(ip))
+		return true;
+
 	if (core_kernel_text(ip))
 		return arch_rcu_tasks_ip_in_trampoline(ip);
 	return !is_module_text_address(ip);

-- 
2.55.0


