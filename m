Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC505C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 02:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lDajmUPmaz8BTxhPEk6XaACKGtk0v9RwI05AN+Obys=; b=ZPLDg5yP1Jzzi7Y/ox2Nbbis/h
	Gqezzvs38BjKmtouyRowv8cYC0O+513mK09X0J0eRbI0CmbpoWKQX3J3echzYJ+xb8tnT1taxjWyF
	WBVlklcQF37d5fc9mqAfEPNrPX1ADbqrHCbDUlOMqWg3ishB33ifNgQyf9gJF+WaEbzt4IdtvjxRk
	8bUxRtrrCH5tdW0fmIep+oVYZ9ozV3wDX0EjRbip/DrXc1kcGuap5flxyXIhHndHHHqGj3OwqRdR/
	vZoGgquOoySl+t8jG2Oyj2sBIFsyFuiXHlKtp/4Oa9klAlSjj+DbWbC3WznbaNTnhF6/Csck9ym+Y
	Cy9fpu+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qGZ-00000003ywY-2fy6;
	Tue, 22 Sep 2026 02:29:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qGY-00000003yw8-0xwG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 02:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9lDajmUPmaz8BTxhPEk6XaACKGtk0v9RwI05AN+Obys=; b=M18OcijbxmAGNnBfDGQpiZ/ULJ
	JwYGBST9tTjx8sTWpb/h0SKhaYAtXPA4xlSokLXEPBCquz0bmQp1Dz9dp7xlQ8kGJl339EWy/iGAq
	YtlhiFJtQPjVXFvyuu7YTiD97nglyFQuFZu2x7g1GrqJVGTVM791RxIt3jMf9qMmTkQA+8V5bwwfg
	nQ+IrLUPYBjkEg/cp5FgtGPq20tXDzV+BmY2rGa4L1zrVUaYcHMNTctYk3yHKuNr4/ux4zaYcW01d
	SpYty/aKFd8Ul2z5koWSZSFgKCABXbS8og1LesZCn0/7mkU2PrQDBcv+JjnzX5VRpMe6h/353tzSs
	xYbL3CQQ==;
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8qGS-0000000D126-0AsU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 02:29:52 +0000
Received: by mail-qk2-x11.google.com with SMTP id d75a77b69052e-52fb7692a57so44963721cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 19:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790044186; x=1790648986; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lDajmUPmaz8BTxhPEk6XaACKGtk0v9RwI05AN+Obys=;
        b=r6eT7/lBXqqluAxW1KUDaewMw6r6tp5srOfFtp8kfdhrQbo7S1DxbBRPa9Lqr4BRrX
         VhjrAlSsb45CF/kw5O5lusDKrvDhFlE/ZYgVZyVYy8JlPCywWS0g54cZWlwoRgKxkkTW
         GL/oVtTz3BObxa1ZuWFast58oQdU+hnPjayK3b5VOkvxvlSa1Qt7ntoYxAtyiboaU+HI
         IvfwAAzBfDcoQz0oOTo/FoBtiTZs7YLGWcSWHAMjms/0FtMvDjnD5VkzutozqzHLymn0
         HChO4decE0Sg4tmhi7knelkamACgpNaZhwVednmxI5pHKqhKq9gp9fcu7jkYTl3Nv2yb
         Wgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044186; x=1790648986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lDajmUPmaz8BTxhPEk6XaACKGtk0v9RwI05AN+Obys=;
        b=Kv0BvqGXd/6xtPvm+Zr2OzNAD9j91t62FPm/878US28etPTcG+ZEB8C6MCP5ePl57i
         8WU66dsYwa1jteUHSHAFtc09bl4zBfjqDa/neBAkp0RUKFSObkMfQCv7ES/Yb6N06awT
         1a00W5dQ1LKtlXrouqlZtfwcZvgzo/DzN7wWkO8B4fgKofOt5luiV7V1r09u3LwfGi7B
         Pebf2VJDe5DZE1E4H7h9jOZFT4luOHwV7oSsdLemABVV2mzBGfvaQsjHYaOJ6lWB/gSG
         jOqyyAfbaHZyMmIBL/C2oDcTe3BJlNMQsc+uRcmdGWuMPxu3X2jLNOHN3/e7BTVyIE1D
         aY8g==
X-Forwarded-Encrypted: i=1; AKwUvBywVw16mjskQtUG6QQuT3FiZ3J9WF6IDyYjWvooxfRvAnl83CsQe2XYgfjzuJVpul0GICdxAIIATDmdh/JZFsqi@lists.infradead.org
X-Gm-Message-State: AFuF++n49VpuiKH28vF3M15geOu7J+aeX5QUWeCryuDUS1X5DsDGt3Yb
	lZ1E84HxcdQw3iJ/mqaDpbD3/IvihkVpxBki4hBuh3iAFwUT4BqPyP7V8p1q+sKxmcE=
X-Gm-Gg: AYBFou1wGYgHqHo1/0GJwLTVPPeMC+3pFR2dxZu8S/rveM1xVSGm9RkmVHNUsdUBFYU
	k4UtpFNvB/Y0VBep4iWKKuQtF/UVaifRIDjuLllwO3ZzKdLErMaPVoRvU3YupW0+hzBqfAWzJmK
	IvDBCHfD9mk4sVHdIQsYjQt3Sxu6LM2DGoBbFEzwvqwbOa02VUFqq/yNLSnRy+LLDsEJHA7ZIi8
	9wj9GINvUSp5yVUWa3a8ZmOYB2rO3WIAiCeXokjcIX0h6QnN49Di4OCtB9a+0F4u4ctg+gi3i+a
	vqXgjwa+z2pkaY7qOEcXCeohr3Vye9z4HNgI1JC32TyJ4l5kPC99s98Gr3CgdOrfJPhjNTc7KX0
	6TjbDQEJBnQaztwH3n2sFcONx7HHw0JXu9aoqJHb2yT7k9lIyDflLhNxVh3hgz675AXncw8f/Zz
	A6LjQMdxO4Vci+ipBhaYWXbxeEwAic742p7ZGwDwBhZXK0RPWCIlHFimf+CJEV8Sd7GINcZ4r93
	lRTuxI/Cr7ZiKI=
X-Received: by 2002:a05:622a:5a19:b0:532:b3ce:f38 with SMTP id d75a77b69052e-532dd3cc9a4mr16978661cf.4.1790044186247;
        Mon, 21 Sep 2026 19:29:46 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e192c463sm1639311cf.21.2026.09.21.19.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:29:45 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 22 Sep 2026 02:23:25 +0000
Subject: [PATCH v5 06/13] x86/kprobes: Take a Tasks Trace reader in the
 optprobe template
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-b4-rcu-tasks-preempt-qs-v5-6-410f57770bad@toxicpanda.com>
References: <20260922-b4-rcu-tasks-preempt-qs-v5-0-410f57770bad@toxicpanda.com>
In-Reply-To: <20260922-b4-rcu-tasks-preempt-qs-v5-0-410f57770bad@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Boqun Feng <boqun@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 rcu@vger.kernel.org, bpf@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1790043820; l=3977;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=cyOEpv7E+99KbsYBQF12i4qmiz/SB2W5CJ1v6BiG3CI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGWEkZzmBIn08GZX0Y8n1aYaLj9DKrBu1cjgNBvrnGmt+51rXj4Tis5qLbxNWpv8gzG2Md0fp7c
 HpXWdXp6OPQc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_032950_608430_95D8BCCD 
X-CRM114-Status: GOOD (  12.84  )
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

The jump-optimized kprobe template calls optimized_callback() from a
dynamically allocated slot with preemption enabled, and only Tasks RCU
keeps that slot alive under a task preempted in the callback.  For
HAVE_RCU_TRAMPOLINE_READERS that means the template must be a Tasks
Trace reader across the call, so open-code rcu_read_lock_trace() and
rcu_read_unlock_trace() around it as ftrace_64.S does.  The template
lives in .rodata and is memcpy()d into each slot without relocation
processing, so the references to current_task and
rcu_tasks_trace_srcu_struct are absolute (R_X86_64_32S, relocated for
KASLR like any other) rather than %rip-relative.  %rax and %rcx have
already been saved by SAVE_REGS_STRING and are dead after the call.

The slot itself is dynamically allocated text, so the instructions
before the lock and after the unlock are covered by the irq-exit check.
64-bit only; 32-bit x86 does not take part.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/kernel/kprobes/opt.c | 44 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index 3f8fea52619f..68a5de6cdabe 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -31,6 +31,7 @@
 #include <asm/set_memory.h>
 #include <asm/sections.h>
 #include <asm/nospec-branch.h>
+#include <asm/asm-offsets.h>
 
 #include "common.h"
 
@@ -101,6 +102,47 @@ static void synthesize_set_arg1(kprobe_opcode_t *addr, unsigned long val)
 	*(unsigned long *)addr = val;
 }
 
+/*
+ * Open-coded rcu_read_lock_trace() / rcu_read_unlock_trace() around the call
+ * to optimized_callback(), see CONFIG_HAVE_RCU_TRAMPOLINE_READERS and the
+ * equivalent macros in ftrace_64.S.  The template is memcpy()d into the slot
+ * without relocation processing, so memory references must be absolute
+ * rather than %rip-relative.  %rax and %rcx are free at both points.
+ */
+#ifdef CONFIG_TASKS_RCU_TRAMPOLINE_READERS
+#ifndef CONFIG_TASKS_TRACE_RCU_NO_MB
+#define OPTPROBE_TRACE_RCU_MB	"	lock addl $0, -4(%rsp)\n"
+#else
+#define OPTPROBE_TRACE_RCU_MB
+#endif
+#define OPTPROBE_TRACE_RCU_READ_LOCK						\
+		"	movq %gs:current_task, %rcx\n"				\
+		"	movl " __stringify(TASK_trc_reader_nesting) "(%rcx), %eax\n"	\
+		"	incl " __stringify(TASK_trc_reader_nesting) "(%rcx)\n"	\
+		"	testl %eax, %eax\n"						\
+		"	jnz 1f\n"							\
+		"	movq rcu_tasks_trace_srcu_struct+" __stringify(SRCU_srcu_ctrp) ", %rax\n" \
+		"	incq %gs:" __stringify(SRCU_CTR_srcu_locks) "(%rax)\n"		\
+		"	movq %rax, " __stringify(TASK_trc_reader_scp) "(%rcx)\n"	\
+		OPTPROBE_TRACE_RCU_MB						\
+		"1:\n"
+#define OPTPROBE_TRACE_RCU_READ_UNLOCK						\
+		"	movq %gs:current_task, %rcx\n"				\
+		"	movl " __stringify(TASK_trc_reader_nesting) "(%rcx), %eax\n"	\
+		"	subl $1, %eax\n"						\
+		"	jnz 2f\n"							\
+		"	movq " __stringify(TASK_trc_reader_scp) "(%rcx), %rax\n"	\
+		"	movl $0, " __stringify(TASK_trc_reader_nesting) "(%rcx)\n"	\
+		OPTPROBE_TRACE_RCU_MB						\
+		"	incq %gs:" __stringify(SRCU_CTR_srcu_unlocks) "(%rax)\n"	\
+		"	jmp 3f\n"							\
+		"2:	movl %eax, " __stringify(TASK_trc_reader_nesting) "(%rcx)\n"	\
+		"3:\n"
+#else
+#define OPTPROBE_TRACE_RCU_READ_LOCK
+#define OPTPROBE_TRACE_RCU_READ_UNLOCK
+#endif
+
 asm (
 			".pushsection .rodata\n"
 			".global optprobe_template_entry\n"
@@ -114,6 +156,7 @@ asm (
 			"optprobe_template_clac:\n"
 			ASM_NOP3
 			SAVE_REGS_STRING
+			OPTPROBE_TRACE_RCU_READ_LOCK
 			"	movq %rsp, %rsi\n"
 			".global optprobe_template_val\n"
 			"optprobe_template_val:\n"
@@ -122,6 +165,7 @@ asm (
 			".global optprobe_template_call\n"
 			"optprobe_template_call:\n"
 			ASM_NOP5
+			OPTPROBE_TRACE_RCU_READ_UNLOCK
 			/* Copy 'regs->flags' into 'regs->ss'. */
 			"	movq 18*8(%rsp), %rdx\n"
 			"	movq %rdx, 20*8(%rsp)\n"

-- 
2.55.0


