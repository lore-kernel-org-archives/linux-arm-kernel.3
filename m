Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528D9C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 02:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nk/uI/WquaXkRgHHd/dzhScVzrCkrWpp6IlwsBXJcUg=; b=h3s5NBxAjuV8lNA93la1t+r9NI
	BP67qUVNu18+es6F7css3SFW5A0bLWI38QzoAvsK/ZBEf8kE+8Wafla0VKj8FkSbpzoHFGij/FbxN
	hMKbgvcrC0+qgoGJJtjb/Qlt8dh0PaImfQm3mjB8oi3fUM9CBfR54c32BkX44oDhqGUl7SAB2AAS2
	AfRVWdxV0R7lKMZHnfDgMyjL5ZtmQ1LT1uFL+F+Yv80M3mtQYkfckWeuKxoE1yRLMqQFQtBgB44gE
	cfGYqHod7RpkrMYH2+y1O4d+bRDuDYoOgvKMuvMEE3M22Js9SErw+fhnvVGYDoquaCmvguSHU6SV4
	Q/8qTWOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qJN-00000003zZ9-2lye;
	Tue, 22 Sep 2026 02:32:49 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qJL-00000003zYC-0QUJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 02:32:48 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfc6db0bso31425176d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 19:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790044366; x=1790649166; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nk/uI/WquaXkRgHHd/dzhScVzrCkrWpp6IlwsBXJcUg=;
        b=eapeTZxwgcRrKBk4lWfENiPs2R31AhZMslu8VRrOY7bRcpZSfzWCf76shY21xuXGvg
         WqLMg9GVdksnoOcEUXb3L5LTBARndWeN+Cpa0QxcMs2ddwYLMuqyVVRARiZfpp+YPbQl
         4tFotzPWjd56EkhbLA0pDerbXLVzzh92rFYvlcj+Hxd3dkdui+hW3mvdirME6QyCQo7L
         g46n7HJXm0cOVq7K5xUABg1J5qg8wbcCq2NAJNeiDiP2Q659KmMofatGCY2+ypY10uaN
         dZXtxfE3S3lOQjK2OM+Tvcjg+DKLObgrK1EFw24QvVqDUbOqaJEBmjSGQG8cLgcZwHNU
         ZNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044366; x=1790649166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nk/uI/WquaXkRgHHd/dzhScVzrCkrWpp6IlwsBXJcUg=;
        b=b9KB/8p/ncK7nKfPyZpaibVRgtNwfXHGEoc5G6HVqkBdSQJf0dmfTXYrAxoIYTc7ct
         lpCW+c59fC1VKIMz4KrsooV0BW0F5/pmwsDiF9HJ7C91MpMlQT4d4cWBSnzVfhmZVnXv
         uw8Ah4G2F9V1sD1GQQyE5kdPuvAS+RZ78eIkRDiTbfNqp1XTM9uaBHRZdyW/uxxmiJrr
         AhdusoYsT8cvdVyP7dlIm+qOws+ErTKUhIpo+IKsatud1Zx/ODhVRjUXX8oUsilZrIqh
         8X99DpaPS8f1gaTrk/EttCk2q7YpM1dEaVhY3HRQYiyR4KfNYmsvkreSUJvRftDuaZWJ
         2wrA==
X-Forwarded-Encrypted: i=1; AKwUvBy1gWRWtOHd2EpGNOgq4DXPo6mgL0AzJ8wPsLegG3MBYl2/rtka3+OQHma0M6VXkkGWKj+N3Eo2G3q97PN1W47o@lists.infradead.org
X-Gm-Message-State: AFuF++nmSsynTRIh7vorEAFpUXHllPa8ipwRrz2n55Yr0GAz5QRi4NZD
	jDWvOiVrNWDaUj1cv9caKOEDbkd0F2sN5n05IhFcYF9CG/Z/ix3isHavUnwSULtvkbY=
X-Gm-Gg: AYBFou1P+0sWFn5WXzuVInVFnoU2LpcC7V7QP48Q3LMI6cbcZg8Lnf9YFDin+qWD4iy
	wyte3BivK1aBx9V22TVv9R3KYE8CMN9BwEmghRKlTDuISJd36Jq9PBrWM4BPjuPCfrzJeseHV0w
	JRAZozmsPPyaVWqgAGpUTEZ7Umk8LZ0lehJzsk4jqlAJFactZfWvx7PXfXFbhrtX8karaCILzIA
	0d5N1j6swZr8Welhp0uiK+kK96KCnsvdLuhPsQczIIDEzef85OY1sc9b4nlHZ0hneginZ7OpEfm
	wqzCjdTJTiqIhRtKDOGo9TDfd1NSaiO3JUgZVY++rQONVsrAUeFF7BfwFDXzwNNAfgsyI1stwTl
	OXC66bAjq8GMxo0SPTdLRG5CNiWUs1naR0eqktt5sbTDsHaVIkOhh4ZNm4oComMx3+iWueFANWK
	IwJT8WcE4bXouxGsJ9YR3c5CAuMQESGqL9C4kNZJTtBLUTip15ishkOyY/R2wpZNllZ06OJ6PPG
	bDdKnOETaJowy4=
X-Received: by 2002:a05:6214:5017:b0:911:9385:8581 with SMTP id 6a1803df08f44-913fc948279mr35279286d6.28.1790044365561;
        Mon, 21 Sep 2026 19:32:45 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914024c20e0sm4740526d6.21.2026.09.21.19.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:32:44 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 22 Sep 2026 02:23:29 +0000
Subject: [PATCH v5 10/13] samples: ftrace: Make the direct-call trampolines
 Tasks Trace readers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-b4-rcu-tasks-preempt-qs-v5-10-410f57770bad@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1790043820; l=13193;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=I7rYeQZ4spsxQVfaE2Sayb+dFXGxTZqIS2lZCUAJvtU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QM+2t5V2gfw8IUSy1qDoDGQkdXuWXVx8UOA8l4idX6itSYIr+3cJvizuGAn0kC3lS3jW3yYg3Kb
 0Ft51r6OGEA0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_193247_467254_55E7EE99 
X-CRM114-Status: GOOD (  17.69  )
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

The sample direct trampolines are exactly the kind of out-of-line
register_ftrace_direct() user whose lifetime depends on Tasks RCU
waiting for a task inside them: nothing else stops rmmod while a task is
preempted in my_direct_func().  On HAVE_RCU_TRAMPOLINE_READERS
architectures that wait only covers Tasks Trace RCU readers, so give the
samples a small shared header with rcu_read_lock_trace() and
rcu_read_unlock_trace() open-coded as instruction strings for x86-64 and
arm64 -- the same sequences as ftrace_64.S and entry-ftrace.S, using
caller-saved non-argument scratch registers -- and bracket every
call-out with them.  The instructions outside the bracket are module
text, covered by ftrace_direct_mark_module().  Other architectures get
empty definitions.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 samples/ftrace/ftrace-direct-modify.c       |   9 ++
 samples/ftrace/ftrace-direct-multi-modify.c |   9 ++
 samples/ftrace/ftrace-direct-multi.c        |   5 ++
 samples/ftrace/ftrace-direct-too.c          |   5 ++
 samples/ftrace/ftrace-direct.c              |   5 ++
 samples/ftrace/ftrace-direct.h              | 126 ++++++++++++++++++++++++++++
 6 files changed, 159 insertions(+)

diff --git a/samples/ftrace/ftrace-direct-modify.c b/samples/ftrace/ftrace-direct-modify.c
index 164d9dd6fd92..937c8d8c2a1b 100644
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
+	TRACE_RCU_READ_LOCK
 "	call my_direct_func1\n"
+	TRACE_RCU_READ_UNLOCK
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp1, .-my_tramp1\n"
@@ -85,7 +88,9 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	TRACE_RCU_READ_LOCK
 "	call my_direct_func2\n"
+	TRACE_RCU_READ_UNLOCK
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp2, .-my_tramp2\n"
@@ -141,11 +146,13 @@ asm (
 "	.globl		my_tramp1\n"
 "   my_tramp1:"
 "	hint	34\n" // bti	c
+	TRACE_RCU_READ_LOCK
 "	sub	sp, sp, #16\n"
 "	stp	x9, x30, [sp]\n"
 "	bl	my_direct_func1\n"
 "	ldp	x30, x9, [sp]\n"
 "	add	sp, sp, #16\n"
+	TRACE_RCU_READ_UNLOCK
 "	ret	x9\n"
 "	.size		my_tramp1, .-my_tramp1\n"
 
@@ -153,11 +160,13 @@ asm (
 "	.globl		my_tramp2\n"
 "   my_tramp2:"
 "	hint	34\n" // bti	c
+	TRACE_RCU_READ_LOCK
 "	sub	sp, sp, #16\n"
 "	stp	x9, x30, [sp]\n"
 "	bl	my_direct_func2\n"
 "	ldp	x30, x9, [sp]\n"
 "	add	sp, sp, #16\n"
+	TRACE_RCU_READ_UNLOCK
 "	ret	x9\n"
 "	.size		my_tramp2, .-my_tramp2\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct-multi-modify.c b/samples/ftrace/ftrace-direct-multi-modify.c
index b03766c6217b..e12e5c8b83f0 100644
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
+	TRACE_RCU_READ_LOCK
 "	pushq %rdi\n"
 "	movq 8(%rbp), %rdi\n"
 "	call my_direct_func1\n"
 "	popq %rdi\n"
+	TRACE_RCU_READ_UNLOCK
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp1, .-my_tramp1\n"
@@ -92,10 +95,12 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	TRACE_RCU_READ_LOCK
 "	pushq %rdi\n"
 "	movq 8(%rbp), %rdi\n"
 "	call my_direct_func2\n"
 "	popq %rdi\n"
+	TRACE_RCU_READ_UNLOCK
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp2, .-my_tramp2\n"
@@ -154,6 +159,7 @@ asm (
 "	.globl		my_tramp1\n"
 "   my_tramp1:"
 "	hint	34\n" // bti	c
+	TRACE_RCU_READ_LOCK
 "	sub	sp, sp, #32\n"
 "	stp	x9, x30, [sp]\n"
 "	str	x0, [sp, #16]\n"
@@ -162,6 +168,7 @@ asm (
 "	ldp	x30, x9, [sp]\n"
 "	ldr	x0, [sp, #16]\n"
 "	add	sp, sp, #32\n"
+	TRACE_RCU_READ_UNLOCK
 "	ret	x9\n"
 "	.size		my_tramp1, .-my_tramp1\n"
 
@@ -169,6 +176,7 @@ asm (
 "	.globl		my_tramp2\n"
 "   my_tramp2:"
 "	hint	34\n" // bti	c
+	TRACE_RCU_READ_LOCK
 "	sub	sp, sp, #32\n"
 "	stp	x9, x30, [sp]\n"
 "	str	x0, [sp, #16]\n"
@@ -177,6 +185,7 @@ asm (
 "	ldp	x30, x9, [sp]\n"
 "	ldr	x0, [sp, #16]\n"
 "	add	sp, sp, #32\n"
+	TRACE_RCU_READ_UNLOCK
 "	ret	x9\n"
 "	.size		my_tramp2, .-my_tramp2\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct-multi.c b/samples/ftrace/ftrace-direct-multi.c
index 3fe6ddaf0b69..a970464ed378 100644
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
+	TRACE_RCU_READ_LOCK
 "	pushq %rdi\n"
 "	movq 8(%rbp), %rdi\n"
 "	call my_direct_func\n"
 "	popq %rdi\n"
+	TRACE_RCU_READ_UNLOCK
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp, .-my_tramp\n"
@@ -101,6 +104,7 @@ asm (
 "	.globl		my_tramp\n"
 "   my_tramp:"
 "	hint	34\n" // bti	c
+	TRACE_RCU_READ_LOCK
 "	sub	sp, sp, #32\n"
 "	stp	x9, x30, [sp]\n"
 "	str	x0, [sp, #16]\n"
@@ -109,6 +113,7 @@ asm (
 "	ldp	x30, x9, [sp]\n"
 "	ldr	x0, [sp, #16]\n"
 "	add	sp, sp, #32\n"
+	TRACE_RCU_READ_UNLOCK
 "	ret	x9\n"
 "	.size		my_tramp, .-my_tramp\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct-too.c b/samples/ftrace/ftrace-direct-too.c
index bf2411aa6fd7..abc098c2ab7a 100644
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
+	TRACE_RCU_READ_LOCK
 "	pushq %rdi\n"
 "	pushq %rsi\n"
 "	pushq %rdx\n"
@@ -70,6 +72,7 @@ asm (
 "	popq %rdx\n"
 "	popq %rsi\n"
 "	popq %rdi\n"
+	TRACE_RCU_READ_UNLOCK
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp, .-my_tramp\n"
@@ -110,6 +113,7 @@ asm (
 "	.globl		my_tramp\n"
 "   my_tramp:"
 "	hint	34\n" // bti	c
+	TRACE_RCU_READ_LOCK
 "	sub	sp, sp, #48\n"
 "	stp	x9, x30, [sp]\n"
 "	stp	x0, x1, [sp, #16]\n"
@@ -119,6 +123,7 @@ asm (
 "	ldp	x0, x1, [sp, #16]\n"
 "	ldp	x2, x3, [sp, #32]\n"
 "	add	sp, sp, #48\n"
+	TRACE_RCU_READ_UNLOCK
 "	ret	x9\n"
 "	.size		my_tramp, .-my_tramp\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct.c b/samples/ftrace/ftrace-direct.c
index 5368c8c39cbb..99b65ad2fccc 100644
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
+	TRACE_RCU_READ_LOCK
 "	pushq %rdi\n"
 "	call my_direct_func\n"
 "	popq %rdi\n"
+	TRACE_RCU_READ_UNLOCK
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp, .-my_tramp\n"
@@ -97,6 +100,7 @@ asm (
 "	.globl		my_tramp\n"
 "   my_tramp:"
 "	hint	34\n" // bti	c
+	TRACE_RCU_READ_LOCK
 "	sub	sp, sp, #32\n"
 "	stp	x9, x30, [sp]\n"
 "	str	x0, [sp, #16]\n"
@@ -104,6 +108,7 @@ asm (
 "	ldp	x30, x9, [sp]\n"
 "	ldr	x0, [sp, #16]\n"
 "	add	sp, sp, #32\n"
+	TRACE_RCU_READ_UNLOCK
 "	ret	x9\n"
 "	.size		my_tramp, .-my_tramp\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct.h b/samples/ftrace/ftrace-direct.h
new file mode 100644
index 000000000000..726f67048ff5
--- /dev/null
+++ b/samples/ftrace/ftrace-direct.h
@@ -0,0 +1,126 @@
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
+ * that select HAVE_RCU_TRAMPOLINE_READERS, Tasks RCU only waits for such a
+ * task while it is a Tasks Trace RCU reader, so the trampoline must enter one
+ * before calling out and leave it afterwards, exactly like the ftrace and BPF
+ * trampolines do.  See register_ftrace_direct().  The instructions before the
+ * lock and after the unlock are covered by ftrace_direct_mark_module().
+ *
+ * These are rcu_read_lock_trace() / rcu_read_unlock_trace() open-coded as
+ * instruction strings for use inside the samples' asm() trampolines, after
+ * the versions in arch/x86/kernel/ftrace_64.S and
+ * arch/arm64/kernel/entry-ftrace.S.  The scratch registers are caller-saved
+ * and not argument registers, so they are dead on entry to and exit from an
+ * fentry trampoline; the flags are clobbered.
+ *
+ * The generated asm-offsets.h is only pulled in on the architectures that need
+ * it here: it is not generally safe to include from C (e.g. PPC32's TASK_SIZE
+ * and arm64's TRAMP_VALIAS clash with the C definitions).
+ */
+#if defined(CONFIG_TASKS_RCU_TRAMPOLINE_READERS) && defined(CONFIG_X86_64)
+
+#include <asm/asm-offsets.h>
+
+#ifndef CONFIG_TASKS_TRACE_RCU_NO_MB
+#define TRACE_RCU_MB	"	lock addl $0, -4(%rsp)\n"
+#else
+#define TRACE_RCU_MB
+#endif
+
+#define TRACE_RCU_READ_LOCK							\
+	"	movq %gs:current_task(%rip), %r11\n"					\
+	"	movl " __stringify(TASK_trc_reader_nesting) "(%r11), %r10d\n"		\
+	"	incl " __stringify(TASK_trc_reader_nesting) "(%r11)\n"		\
+	"	testl %r10d, %r10d\n"							\
+	"	jnz 771f\n"								\
+	"	movq rcu_tasks_trace_srcu_struct+" __stringify(SRCU_srcu_ctrp) "(%rip), %r10\n" \
+	"	incq %gs:" __stringify(SRCU_CTR_srcu_locks) "(%r10)\n"			\
+	"	movq %r10, " __stringify(TASK_trc_reader_scp) "(%r11)\n"		\
+	TRACE_RCU_MB								\
+	"771:\n"
+
+#define TRACE_RCU_READ_UNLOCK							\
+	"	movq %gs:current_task(%rip), %r11\n"					\
+	"	movl " __stringify(TASK_trc_reader_nesting) "(%r11), %r10d\n"		\
+	"	subl $1, %r10d\n"							\
+	"	jnz 772f\n"								\
+	"	movq " __stringify(TASK_trc_reader_scp) "(%r11), %r10\n"		\
+	"	movl $0, " __stringify(TASK_trc_reader_nesting) "(%r11)\n"		\
+	TRACE_RCU_MB								\
+	"	incq %gs:" __stringify(SRCU_CTR_srcu_unlocks) "(%r10)\n"		\
+	"	jmp 773f\n"								\
+	"772:	movl %r10d, " __stringify(TASK_trc_reader_nesting) "(%r11)\n"	\
+	"773:\n"
+
+#elif defined(CONFIG_TASKS_RCU_TRAMPOLINE_READERS) && defined(CONFIG_ARM64)
+
+#include <asm/alternative-macros.h>
+#include <asm/cpucaps.h>
+/* arm64's asm-offsets.h redefines TRAMP_VALIAS from <asm/fixmap.h>. */
+#pragma push_macro("TRAMP_VALIAS")
+#undef TRAMP_VALIAS
+#include <asm/asm-offsets.h>
+#pragma pop_macro("TRAMP_VALIAS")
+
+#ifndef CONFIG_TASKS_TRACE_RCU_NO_MB
+#define TRACE_RCU_MB	"	dmb	ish\n"
+#else
+#define TRACE_RCU_MB
+#endif
+
+#define TRACE_RCU_SRCU_CTRP	"rcu_tasks_trace_srcu_struct+" __stringify(SRCU_SRCU_CTRP)
+
+/* x14 = this CPU's offset; then atomically increment the long at x14 + \areg */
+#define TRACE_RCU_PERCPU_INC(areg)						\
+	ALTERNATIVE("	mrs	x14, tpidr_el1\n", "	mrs	x14, tpidr_el2\n",		\
+		    ARM64_HAS_VIRT_HOST_EXTN)					\
+	"	add	x14, x14, " areg "\n"						\
+	"778:	ldxr	x15, [x14]\n"							\
+	"	add	x15, x15, #1\n"							\
+	"	stxr	w16, x15, [x14]\n"						\
+	"	cbnz	w16, 778b\n"
+
+#define TRACE_RCU_READ_LOCK							\
+	"	mrs	x12, sp_el0\n"							\
+	"	ldr	w13, [x12, #" __stringify(TSK_TRC_READER_NESTING) "]\n"	\
+	"	add	w14, w13, #1\n"							\
+	"	str	w14, [x12, #" __stringify(TSK_TRC_READER_NESTING) "]\n"	\
+	"	cbnz	w13, 771f\n"							\
+	"	adrp	x13, " TRACE_RCU_SRCU_CTRP "\n"					\
+	"	ldr	x13, [x13, #:lo12:" TRACE_RCU_SRCU_CTRP "]\n"			\
+	"	str	x13, [x12, #" __stringify(TSK_TRC_READER_SCP) "]\n"		\
+	"	add	x13, x13, #" __stringify(SRCU_CTR_SRCU_LOCKS) "\n"		\
+	TRACE_RCU_PERCPU_INC("x13")						\
+	TRACE_RCU_MB								\
+	"771:\n"
+
+#define TRACE_RCU_READ_UNLOCK							\
+	"	mrs	x12, sp_el0\n"							\
+	"	ldr	w13, [x12, #" __stringify(TSK_TRC_READER_NESTING) "]\n"	\
+	"	subs	w13, w13, #1\n"							\
+	"	b.ne	772f\n"								\
+	"	ldr	x13, [x12, #" __stringify(TSK_TRC_READER_SCP) "]\n"		\
+	"	str	wzr, [x12, #" __stringify(TSK_TRC_READER_NESTING) "]\n"	\
+	TRACE_RCU_MB								\
+	"	add	x13, x13, #" __stringify(SRCU_CTR_SRCU_UNLOCKS) "\n"		\
+	TRACE_RCU_PERCPU_INC("x13")						\
+	"	b	773f\n"								\
+	"772:	str	w13, [x12, #" __stringify(TSK_TRC_READER_NESTING) "]\n"	\
+	"773:\n"
+
+#else
+
+#define TRACE_RCU_READ_LOCK
+#define TRACE_RCU_READ_UNLOCK
+
+#endif
+
+#endif /* _SAMPLES_FTRACE_DIRECT_H */

-- 
2.55.0


