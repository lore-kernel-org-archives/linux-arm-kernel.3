Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463DBCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 17:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lDajmUPmaz8BTxhPEk6XaACKGtk0v9RwI05AN+Obys=; b=BW1FcvJBcZbmHkTGpVBcrx79S4
	FwrnnH4Lt6ko6EjindPj+lQ1BjwnGuqo4g9VYKsPkcjSrB9yvCtwldvRWU7ugw5kVJEINlTwDpo+0
	RmxQUxSWYHBYDiaVqeYzMqteU9TYTTP5ztU3kUXYZJPTSOAVjpeei9juk4sPgNQ8pfoUu3lUK/OZ3
	R2CQ2knemM4nzCesxOzv7+9DuySpg+u3m6l206htPoLebuF8YqqueAqPpIUkQ+oXdGxJu3koXWK0t
	pFBDUVZmbn6MBqYqotiBDFG6xviBR4/8nGTqZMNONxrSYW2ZwLg1Vx70Woyo5hKLcPg5079ZOyDE/
	a7LVuKGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbOA-000000049K3-3Od3;
	Tue, 29 Sep 2026 17:13:10 +0000
Received: from mail-qk2-x0c.google.com ([2607:f8b0:4864:34::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbO8-000000049JE-3niZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 17:13:10 +0000
Received: by mail-qk2-x0c.google.com with SMTP id af79cd13be357-93c5b166acdso347001585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 10:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790701988; x=1791306788; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lDajmUPmaz8BTxhPEk6XaACKGtk0v9RwI05AN+Obys=;
        b=OahhhFklNDIzfrso2aUYqezTRWJcUE//2cRxEbJTdAjAmyxn6lQTW0ZzJxwitUgBxD
         KCYjlg3//v5PlWubFHt1sjp5QI8rCmdgq+gHRNQIMEMQYT4xotF0hNk6i8WcVPYQcFP7
         N46aaBWanNEo54dV2EJbP2P/gnn2So0jKD0qr0BHzfw8ZcZ2Jok29FH/O52q1zG79C7z
         L5gZbYxDhaKEr3kmsEHBRVoSh8c4La35AHpfusECeZOx95QeNYJlRscASe+a7XV5JTKZ
         EC9UqZziPlqtXmWJLEry3x8RE9BjzFJXQ1qf5ynlEY9b9vdHHKSaNuEprLmX0Bktxx3b
         xz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701988; x=1791306788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lDajmUPmaz8BTxhPEk6XaACKGtk0v9RwI05AN+Obys=;
        b=wFMfu7QheB+ehGFUNDADMdmKh2Afw3XDZOt6JtjEDGhTtRWup69waV8IPLJ+9POQ2t
         z4ksdLY7Yzmsakm1pzp77Cu6CwT8YkG6fT3t7+eBTAXgz7FNR4kLV5sSQ5b6LRzi8dFu
         tjZwsXSZwud8m6uRDeXRijcx2s9mnU22Ydi9Wxpdicl48zB7LfVZd9FDhDbUgVYQtfFK
         0nMJttEYQ98NYtpHeo8rLvMODc82uBgxOiZWNrT6Ie0gI/q9LrM/hMSZyozUVGiD/zWv
         dJcj6ky1TiV6A4LXSXbblJMGLkjtU8mgDwdM/zhcfj9f5kpA4ERGliCnZH5YsQpu1+D1
         MI2A==
X-Forwarded-Encrypted: i=1; AKwUvByFwrnDXlNAOnB2pO4XtsQ1mj0jHpx16TOFsi91zfJe2j5hpzALJ988eHjeADRI+6B/o7NVWMAnei6WpZDDEUah@lists.infradead.org
X-Gm-Message-State: AFuF++m8cA38mYTZhulPeI9YC/836xhTNGejc/Bp7MN5R3uke/USc+Nq
	IDTHKy1xDeSPq/DGMplMGAZLJEc5bS09awS/Z9wAon6oQ3N48WBKDPABx2GkPrbhodA=
X-Gm-Gg: AYBFou1nK1t1iPScXfwtf4ylZoCNdGz3foeKFFY6cvPqVEIz/TzrjoUYc3Yp1nL+bNl
	AHEam0U8nIpGk/Mw2UvxaoV5vcZFoBxWTuL7wTuxQ2tuZT4IrBvWozpSjD+1kiqyP7qS/TLJ2WV
	lxlgzdyNP80apUj7RepZeLVo6dSeNaFu0vFSJ+bgfXeaZhPUaQaKwhQEVtRDmsK9iJmM2wLdxb9
	lUzO5jyPVTje99Y52LKDpTPJ77B83t2WeGl9lRYiioVyYeYHiYH4rU/d0V2QMtUn3nsDMcdGbum
	8954DjT+PlfeeS+m+r0ppd5gI/gflbIk5FK+7dtgFFRPW74HYsk3cJwtr3uC+RYGEt2lZcH29pS
	A/+Y5RJL2hKu9BiE8itAqDIS8GoGNaHbdIqHyaMcsqb7LUuqWKsrZrlfJIvvJrVUOUN/yQm0J/2
	h3k6dM3Vj8+0peFlw1sWgsM+8ac/aX4Hdsh+xlxf9dx/2bRZ666nErmGmTYrWOJchbARjHgBOvO
	4WlDFvHN+MqQBFV
X-Received: by 2002:a05:620a:4050:b0:93c:2dae:ec5c with SMTP id af79cd13be357-93c9f8db738mr36680185a.42.1790701987489;
        Tue, 29 Sep 2026 10:13:07 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f4c4e73sm16349585a.24.2026.09.29.10.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:13:06 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 29 Sep 2026 17:07:24 +0000
Subject: [PATCH v6 07/14] x86/kprobes: Take a Tasks Trace reader in the
 optprobe template
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rcu-tasks-preempt-qs-v6-7-c111ee02caca@toxicpanda.com>
References: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
In-Reply-To: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1790701681; l=3977;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=cyOEpv7E+99KbsYBQF12i4qmiz/SB2W5CJ1v6BiG3CI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDWamZGwRXHqlZDYRICgP71g719tFuAgZKe5M/0MnijoM4CsVGa3hA93Sod04FIiuoO+tFQoc5F
 zV/o3zGZ2BQo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_101308_964553_2F56A6BA 
X-CRM114-Status: GOOD (  12.94  )
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


