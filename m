Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71640C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 19:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32pR0m9lJbbl6oefWflQ2FM2YWt9ii7Ub9HEHMaojiA=; b=a29zCMQbqwseNF2tO4fE0pHmxH
	IDOmPWTgf4X2RnvgIUNRiei2gJx5Zate05o1P6DwqjpjHZWgiVGf3w3WRr1FoA257rioH/S5m0Hak
	MnRCvPkJdShjEqWVX9qKVnZuJAcETpl8wnCZk2wL9ksTLnyB2eiUyemcEghBeB0m0emaeAGMfhyEc
	HKLbu+FjtUQmWFTsx/1afHTtoz72me2WSJApl5ygAzxCRxQQvl43gCW5mC3nnoX/yhTtfRFm2Cj2q
	zgoBUKLwD0AtT98mHtIzvNKnDZIWCyJfgzBr0dhonV7Cj5C8kK+bnUysOHb3oHfAzGsmigC3HxMiL
	mPqVrsxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrw-0000000FByk-3uLn;
	Thu, 10 Sep 2026 18:51:32 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jre-0000000FBj1-3OYv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:51:24 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so134234241.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066273; x=1789671073; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32pR0m9lJbbl6oefWflQ2FM2YWt9ii7Ub9HEHMaojiA=;
        b=qXaDQ44LMy1iVISxrWyI2LSqo8Q0b3o+bja0/7D2WyjVOvdzKXmjQYFG0eT/tRlXK4
         1ALTJGz5KZhUGk9diOA0Y2KizKmUPE3ItzUQ1jgl7UveIajNQWfVbkCEgjAgTcrtxOY3
         Igr2IpYjQIR440uOwcjsZGuBKFVh08niongpJkSw9HxWkXjAKXXKHCdpd8wrrZ0Kz95I
         kmM7kt194wfPAPf4kgd25qHw2Dxn43ifdrdFjV/LK5ZKjXsvW3qRLiQ8GlmMdeSxtvgj
         EDWEiCQulutsbo3kY/DMoDm7eB8jEZ0cqawGfYI+A5h2icfmcrvR/5CQnD+i/B1K4+W0
         MjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066273; x=1789671073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32pR0m9lJbbl6oefWflQ2FM2YWt9ii7Ub9HEHMaojiA=;
        b=YW1FdWaEiF2gNgb8Ou+ohLLzSVxLwdIf8RuMRGNe8jFCa4HAn3ivqhILAQwFghhVda
         kbmvpVV+pmvKQiuw1wti8jT3cH7IMF78vLCvDb0kjYzaTCmgXSch1po8rZ/SjgFCISlo
         xm/AWmdPuiza2HJtqr7YG+98uaJXtOOiFKLYasPoABi02isvZVJwKyvtUNLLqR83dNns
         i46PxDXoblejdMsNd3+ElI8NT1KZ0QDKvZGsfXpMlnVERZKZHTcjX1ZgfnSY30LMcZl5
         whVjQyYyOh1Itr7D2T9NVQ0lsQ14KVZ6RwgkLEeMEvlafKCWjnBMI30VlWmlXc6pMS8t
         4ioA==
X-Forwarded-Encrypted: i=1; AKwUvBzWpr5h7My0XD3HpO35rKeja1RhYlEV1qNRI5Yf6APbCnA3llXfXS1bN1JFhvnPxaqN6RPmFc2UFP4/R3X7Y2sK@lists.infradead.org
X-Gm-Message-State: AFuF++l03jjfBx3ukrhBTISeIjbNadp5cpWLhTFGxuTTwGvJmPtSu2+y
	Tfjoeq1O1FoDnEZzlSPHM4UTfklY1W7EKoG2PygI277dE5f5srl5c+n/EMUYRffDz70=
X-Gm-Gg: AYBFou1xu2cB0OSIF7jj/78scBD5SQBIslU2JVXpNXCP5UAD+nWiPi+ZVrZyu2B2Zpo
	akc4bVlnL1+3jsOaD9z929WErFTwjDttTd/5qR77uGUg/HFtYISWZ+9Sd/t9Yii78Sxl5sE1u1p
	ujmFGaQYNDH1OrzeWWFB7nDSpEUGKJFJtG2+3UssOfJ6EJGMII+XNodi25Ds5zyDzV8rgUqyzyD
	dLGhrs/AKG+u4fWRfrXXd8uTeXL91lfOcs/IgWzLsHafHTOFbS3X77E7CE8uYkvmDNK5lpm0sHm
	4fFvXHG0kbmaruQ6g54G7tWdtwxtPzW/e4XsRL1YhCT68kAA13LF0qkZo4v9/IGfqw8Mq5+be1b
	IQ2icEyLrMKacUKmW6gwRgX+o5rKPG76+AhcsRfbYlseBY/WiVi0Dvz7kOxezQGbUevizRUubT5
	8sNU1SMeZTOVxW1atPnk0MY0swAMx9ztxqbIV+b3bA0X/+d7xQcVpKbSM4GTOzDVu4RL+dIeDy6
	+QZolbkWaBibW9+ibdZZvlYYyGq0sp09Fc2S9dL/zVjCAwqSAEE4mkD
X-Received: by 2002:a67:e117:0:b0:790:f691:2d5b with SMTP id ada2fe7eead31-792a5b8b8a7mr1152469137.4.1789066272932;
        Thu, 10 Sep 2026 11:51:12 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47aeb7sm2503906d6.24.2026.09.10.11.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:51:12 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:34 +0000
Subject: [PATCH RFC 11/13] samples: ftrace: Maintain Tasks RCU trampoline
 nesting in direct-call trampolines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-11-d4469f4cc101@toxicpanda.com>
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
X-CRM114-CacheID: sfid-20260910_115114_974857_75464A93 
X-CRM114-Status: GOOD (  18.74  )
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

Follow the register_ftrace_direct() contract in the sample modules: on
x86-64 and arm64, have each hand-written trampoline increment
current->rcu_tramp_nesting before calling its C handler and decrement it
before returning, via a small shared samples/ftrace/ftrace-direct.h.
%r11 and x12/w13 are used as scratch; both are caller-saved, non-argument
registers and therefore dead on entry to and exit from an fentry
trampoline.

The header pulls in the generated asm-offsets.h only on those two
architectures, since it is not generally safe to include from C (PPC32's
TASK_SIZE and arm64's TRAMP_VALIAS clash with the C definitions; the
latter is worked around locally with push_macro/pop_macro).  Other
architectures get empty macros and are unchanged.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 samples/ftrace/ftrace-direct-modify.c       |  9 ++++
 samples/ftrace/ftrace-direct-multi-modify.c |  9 ++++
 samples/ftrace/ftrace-direct-multi.c        |  5 +++
 samples/ftrace/ftrace-direct-too.c          |  5 +++
 samples/ftrace/ftrace-direct.c              |  5 +++
 samples/ftrace/ftrace-direct.h              | 64 +++++++++++++++++++++++++++++
 6 files changed, 97 insertions(+)

diff --git a/samples/ftrace/ftrace-direct-modify.c b/samples/ftrace/ftrace-direct-modify.c
index 164d9dd6fd92..eb8230fa4242 100644
--- a/samples/ftrace/ftrace-direct-modify.c
+++ b/samples/ftrace/ftrace-direct-modify.c
@@ -2,6 +2,7 @@
 #include <linux/module.h>
 #include <linux/kthread.h>
 #include <linux/ftrace.h>
+#include "ftrace-direct.h"
 #if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
@@ -73,7 +74,9 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	RCU_TASKS_TRAMP_ENTER
 "	call my_direct_func1\n"
+	RCU_TASKS_TRAMP_EXIT
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp1, .-my_tramp1\n"
@@ -85,7 +88,9 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	RCU_TASKS_TRAMP_ENTER
 "	call my_direct_func2\n"
+	RCU_TASKS_TRAMP_EXIT
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp2, .-my_tramp2\n"
@@ -141,11 +146,13 @@ asm (
 "	.globl		my_tramp1\n"
 "   my_tramp1:"
 "	hint	34\n" // bti	c
+	RCU_TASKS_TRAMP_ENTER
 "	sub	sp, sp, #16\n"
 "	stp	x9, x30, [sp]\n"
 "	bl	my_direct_func1\n"
 "	ldp	x30, x9, [sp]\n"
 "	add	sp, sp, #16\n"
+	RCU_TASKS_TRAMP_EXIT
 "	ret	x9\n"
 "	.size		my_tramp1, .-my_tramp1\n"
 
@@ -153,11 +160,13 @@ asm (
 "	.globl		my_tramp2\n"
 "   my_tramp2:"
 "	hint	34\n" // bti	c
+	RCU_TASKS_TRAMP_ENTER
 "	sub	sp, sp, #16\n"
 "	stp	x9, x30, [sp]\n"
 "	bl	my_direct_func2\n"
 "	ldp	x30, x9, [sp]\n"
 "	add	sp, sp, #16\n"
+	RCU_TASKS_TRAMP_EXIT
 "	ret	x9\n"
 "	.size		my_tramp2, .-my_tramp2\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct-multi-modify.c b/samples/ftrace/ftrace-direct-multi-modify.c
index b03766c6217b..c8f1062e5d1a 100644
--- a/samples/ftrace/ftrace-direct-multi-modify.c
+++ b/samples/ftrace/ftrace-direct-multi-modify.c
@@ -2,6 +2,7 @@
 #include <linux/module.h>
 #include <linux/kthread.h>
 #include <linux/ftrace.h>
+#include "ftrace-direct.h"
 #if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
@@ -77,10 +78,12 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	RCU_TASKS_TRAMP_ENTER
 "	pushq %rdi\n"
 "	movq 8(%rbp), %rdi\n"
 "	call my_direct_func1\n"
 "	popq %rdi\n"
+	RCU_TASKS_TRAMP_EXIT
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp1, .-my_tramp1\n"
@@ -92,10 +95,12 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	RCU_TASKS_TRAMP_ENTER
 "	pushq %rdi\n"
 "	movq 8(%rbp), %rdi\n"
 "	call my_direct_func2\n"
 "	popq %rdi\n"
+	RCU_TASKS_TRAMP_EXIT
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp2, .-my_tramp2\n"
@@ -154,6 +159,7 @@ asm (
 "	.globl		my_tramp1\n"
 "   my_tramp1:"
 "	hint	34\n" // bti	c
+	RCU_TASKS_TRAMP_ENTER
 "	sub	sp, sp, #32\n"
 "	stp	x9, x30, [sp]\n"
 "	str	x0, [sp, #16]\n"
@@ -162,6 +168,7 @@ asm (
 "	ldp	x30, x9, [sp]\n"
 "	ldr	x0, [sp, #16]\n"
 "	add	sp, sp, #32\n"
+	RCU_TASKS_TRAMP_EXIT
 "	ret	x9\n"
 "	.size		my_tramp1, .-my_tramp1\n"
 
@@ -169,6 +176,7 @@ asm (
 "	.globl		my_tramp2\n"
 "   my_tramp2:"
 "	hint	34\n" // bti	c
+	RCU_TASKS_TRAMP_ENTER
 "	sub	sp, sp, #32\n"
 "	stp	x9, x30, [sp]\n"
 "	str	x0, [sp, #16]\n"
@@ -177,6 +185,7 @@ asm (
 "	ldp	x30, x9, [sp]\n"
 "	ldr	x0, [sp, #16]\n"
 "	add	sp, sp, #32\n"
+	RCU_TASKS_TRAMP_EXIT
 "	ret	x9\n"
 "	.size		my_tramp2, .-my_tramp2\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct-multi.c b/samples/ftrace/ftrace-direct-multi.c
index 3fe6ddaf0b69..bc6a88dd4ffc 100644
--- a/samples/ftrace/ftrace-direct-multi.c
+++ b/samples/ftrace/ftrace-direct-multi.c
@@ -3,6 +3,7 @@
 
 #include <linux/mm.h> /* for handle_mm_fault() */
 #include <linux/ftrace.h>
+#include "ftrace-direct.h"
 #include <linux/sched/stat.h>
 #if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
@@ -56,10 +57,12 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	RCU_TASKS_TRAMP_ENTER
 "	pushq %rdi\n"
 "	movq 8(%rbp), %rdi\n"
 "	call my_direct_func\n"
 "	popq %rdi\n"
+	RCU_TASKS_TRAMP_EXIT
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp, .-my_tramp\n"
@@ -101,6 +104,7 @@ asm (
 "	.globl		my_tramp\n"
 "   my_tramp:"
 "	hint	34\n" // bti	c
+	RCU_TASKS_TRAMP_ENTER
 "	sub	sp, sp, #32\n"
 "	stp	x9, x30, [sp]\n"
 "	str	x0, [sp, #16]\n"
@@ -109,6 +113,7 @@ asm (
 "	ldp	x30, x9, [sp]\n"
 "	ldr	x0, [sp, #16]\n"
 "	add	sp, sp, #32\n"
+	RCU_TASKS_TRAMP_EXIT
 "	ret	x9\n"
 "	.size		my_tramp, .-my_tramp\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct-too.c b/samples/ftrace/ftrace-direct-too.c
index bf2411aa6fd7..247e418644a2 100644
--- a/samples/ftrace/ftrace-direct-too.c
+++ b/samples/ftrace/ftrace-direct-too.c
@@ -3,6 +3,7 @@
 
 #include <linux/mm.h> /* for handle_mm_fault() */
 #include <linux/ftrace.h>
+#include "ftrace-direct.h"
 #if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
@@ -61,6 +62,7 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	RCU_TASKS_TRAMP_ENTER
 "	pushq %rdi\n"
 "	pushq %rsi\n"
 "	pushq %rdx\n"
@@ -70,6 +72,7 @@ asm (
 "	popq %rdx\n"
 "	popq %rsi\n"
 "	popq %rdi\n"
+	RCU_TASKS_TRAMP_EXIT
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp, .-my_tramp\n"
@@ -110,6 +113,7 @@ asm (
 "	.globl		my_tramp\n"
 "   my_tramp:"
 "	hint	34\n" // bti	c
+	RCU_TASKS_TRAMP_ENTER
 "	sub	sp, sp, #48\n"
 "	stp	x9, x30, [sp]\n"
 "	stp	x0, x1, [sp, #16]\n"
@@ -119,6 +123,7 @@ asm (
 "	ldp	x0, x1, [sp, #16]\n"
 "	ldp	x2, x3, [sp, #32]\n"
 "	add	sp, sp, #48\n"
+	RCU_TASKS_TRAMP_EXIT
 "	ret	x9\n"
 "	.size		my_tramp, .-my_tramp\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct.c b/samples/ftrace/ftrace-direct.c
index 5368c8c39cbb..9e1964baf28b 100644
--- a/samples/ftrace/ftrace-direct.c
+++ b/samples/ftrace/ftrace-direct.c
@@ -3,6 +3,7 @@
 
 #include <linux/sched.h> /* for wake_up_process() */
 #include <linux/ftrace.h>
+#include "ftrace-direct.h"
 #if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
@@ -54,9 +55,11 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	RCU_TASKS_TRAMP_ENTER
 "	pushq %rdi\n"
 "	call my_direct_func\n"
 "	popq %rdi\n"
+	RCU_TASKS_TRAMP_EXIT
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp, .-my_tramp\n"
@@ -97,6 +100,7 @@ asm (
 "	.globl		my_tramp\n"
 "   my_tramp:"
 "	hint	34\n" // bti	c
+	RCU_TASKS_TRAMP_ENTER
 "	sub	sp, sp, #32\n"
 "	stp	x9, x30, [sp]\n"
 "	str	x0, [sp, #16]\n"
@@ -104,6 +108,7 @@ asm (
 "	ldp	x30, x9, [sp]\n"
 "	ldr	x0, [sp, #16]\n"
 "	add	sp, sp, #32\n"
+	RCU_TASKS_TRAMP_EXIT
 "	ret	x9\n"
 "	.size		my_tramp, .-my_tramp\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct.h b/samples/ftrace/ftrace-direct.h
new file mode 100644
index 000000000000..d0313f33f47f
--- /dev/null
+++ b/samples/ftrace/ftrace-direct.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _SAMPLES_FTRACE_DIRECT_H
+#define _SAMPLES_FTRACE_DIRECT_H
+
+#include <linux/stringify.h>
+
+/*
+ * A direct-call trampoline is entered with no lock, refcount or RCU marker
+ * held; only Tasks RCU keeps it (and, for a module, its text) alive while a
+ * task is inside it or preempted in something it called.  On architectures
+ * that select ARCH_HAS_RCU_TASKS_PREEMPT_QS a preemption is a Tasks RCU
+ * quiescent state unless current->rcu_tramp_nesting is non-zero, so the
+ * trampoline must raise it before calling out and drop it afterwards, exactly
+ * like the ftrace and BPF trampolines do.  See rcu_tasks_trampoline_enter()
+ * and register_ftrace_direct().  The instructions before the increment and
+ * after the decrement are covered by ftrace_direct_mark_module().
+ *
+ * These expand to instruction strings for use inside the samples' asm()
+ * trampolines.  The scratch register is caller-saved and not an argument
+ * register, so it is dead on entry to and exit from an fentry trampoline.
+ *
+ * The generated asm-offsets.h is only pulled in on the architectures that need
+ * it here: it is not generally safe to include from C (e.g. PPC32's TASK_SIZE
+ * and arm64's TRAMP_VALIAS clash with the C definitions), which is why the
+ * samples themselves guard their own include of it.
+ */
+#if defined(CONFIG_TASKS_RCU) && defined(CONFIG_X86_64)
+
+#include <asm/asm-offsets.h>
+
+#define RCU_TASKS_TRAMP_ENTER						\
+	"	movq %gs:current_task(%rip), %r11\n"				\
+	"	incl " __stringify(TASK_rcu_tramp_nesting) "(%r11)\n"
+#define RCU_TASKS_TRAMP_EXIT						\
+	"	movq %gs:current_task(%rip), %r11\n"				\
+	"	decl " __stringify(TASK_rcu_tramp_nesting) "(%r11)\n"
+
+#elif defined(CONFIG_TASKS_RCU) && defined(CONFIG_ARM64)
+
+/* arm64's asm-offsets.h redefines TRAMP_VALIAS from <asm/fixmap.h>. */
+#pragma push_macro("TRAMP_VALIAS")
+#undef TRAMP_VALIAS
+#include <asm/asm-offsets.h>
+#pragma pop_macro("TRAMP_VALIAS")
+
+#define RCU_TASKS_TRAMP_ENTER						\
+	"	mrs	x12, sp_el0\n"						\
+	"	ldr	w13, [x12, #" __stringify(TSK_RCU_TRAMP_NESTING) "]\n"	\
+	"	add	w13, w13, #1\n"						\
+	"	str	w13, [x12, #" __stringify(TSK_RCU_TRAMP_NESTING) "]\n"
+#define RCU_TASKS_TRAMP_EXIT						\
+	"	mrs	x12, sp_el0\n"						\
+	"	ldr	w13, [x12, #" __stringify(TSK_RCU_TRAMP_NESTING) "]\n"	\
+	"	sub	w13, w13, #1\n"						\
+	"	str	w13, [x12, #" __stringify(TSK_RCU_TRAMP_NESTING) "]\n"
+
+#else
+
+#define RCU_TASKS_TRAMP_ENTER
+#define RCU_TASKS_TRAMP_EXIT
+
+#endif
+
+#endif /* _SAMPLES_FTRACE_DIRECT_H */

-- 
2.55.0


