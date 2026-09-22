Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E27C982FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 02:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMtH/e2BOZ+5Q/fPJ0djJ3i8PvS8/cEMBigMOOsU40U=; b=J/onJmxuZI8lP5i2NW73eo54t+
	zmHOV7nfbezYpiTq2nUu4E43pWWrmitsxliCOJrrB2oDX0yTDUC8ec/8DM2HGel1pErVKoxUHJLg6
	h+eBckeLj64QkT08kpBpOVc0KoOsL5KgHAGmY2oRXWSiFqc0QRjZzeN0pDqWkpMVnebx4G2SJj+uL
	06Do/XAzs34J2/STDpxtwxkEgZVD8eFf21tH8YjjbYAf49m3m/X9CG9c4e0vJlJcBpt+KZJcAfV3W
	5pi3rwvhwR0nWzMDWCSjGj7FJGEI5ISb1DPtKkXzt7713lHJYzhvq/i9k/D6sHsrXg32hgZPKoB82
	QbmgKWpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qHT-00000003z76-43jl;
	Tue, 22 Sep 2026 02:30:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qHQ-00000003z6P-3q78
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 02:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EMtH/e2BOZ+5Q/fPJ0djJ3i8PvS8/cEMBigMOOsU40U=; b=ewFcjWvRLMxfQxNwbtiwHMxnIV
	j5GBPUJZ7JoY1nGiotdkBhN2Cg79pYenUJ4ovaefEax37zZhoCcybdtu79WISe/7Z6DiuhbS6ty8/
	x0s/NMmhOoQi+aIlBnCML2mqtVwruAYUNeIVnS31ODevhDuH2n/UXOW/xY6LnYPeKR/dQenp9Mvhw
	moF0O0zzdtKtLhDNtNDyS3j3L3jD0cfV3f8m+EAkpmVlkBmlH81iT3f0QeyVEiuwzAQBns2He9NNg
	o1mf4A9jZYI9fiCyEbMaymCI+L8pGT6aX2baNHI5eWB2P7JsD2VeJfU91PQxIFjxjpFCQVHJbBQND
	eQoCnmVg==;
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8qH4-0000000D15o-3Akv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 02:30:46 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfe57a3bso29318046d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 19:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790044225; x=1790649025; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EMtH/e2BOZ+5Q/fPJ0djJ3i8PvS8/cEMBigMOOsU40U=;
        b=s21XsXBAXHU8pTuQ+TC16+1cs3w5DhFcyWb3sqwXlVD+2Bh8g0w53pU6aFcMH/qEAu
         oO+JkuIGhXUe/ObKtoXJWzXDpWmZO31mGXOaAdJz+NUD3Yhfp2K6TtQQ4BK7eIuoCINi
         xqqNBwWBVkkmjjxAJP86Digvpay6zhpFC4i9Uw2Q6EYhhos3QptDqA9DaHXwDHW1uVAz
         zM6tTusR+dXIaljWZM1lV0DBJV7sSwC/SDK1pUZ+8UVQFzDpfLArBdGESl7BSHRQj6Cn
         5mBh80lh5usVjwoc7xuj5wjprqLIPYLETfZAuam9rSNB24K69C8vehDjm1j0+WFfdaZr
         4NFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044225; x=1790649025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EMtH/e2BOZ+5Q/fPJ0djJ3i8PvS8/cEMBigMOOsU40U=;
        b=ZqL/y+KZAvdUm1XpfZC4p1Mpfuush9wtHG9oELyB21tT0ZPfljhM0gVhAArokZxXFC
         onObOu3CjGgwmbeJNuifq44HgwiNQtro1ATDW5L+hoEenBVEKb/Ipk/5r9awBiLZde7K
         /7ngxQNM9AefcaBCaoluSY+e9BObsYqOTOXdPavn5zljV+KAdD3J68x5P94NUGpTvqKa
         IqYxF5DY4IVkKpLdVciKIAywLrE3PfaJ7B3XwVXpetwPKGUIgnhhxEV0zhbKW+TS6gKP
         AvTh+Braub1PYGtn9U2NKcWYQH2Rr+LxInhJIKxyfbhxNirt5kfPJ11FI4dyLe4zy+0N
         T8ug==
X-Forwarded-Encrypted: i=1; AKwUvByHgCw4RtqfWUadThbQyOsUdB64ES7Lq7yXsyoTFdnUXlliReNLK1B1wvDpeJDitAV5cTgsQeF6uJ9I+imj+0qm@lists.infradead.org
X-Gm-Message-State: AFuF++kTwWdTFUh0ipPOTiOn0DmDq+yfFiAeKxTRYOkQtY8+GNuLVK1A
	H8sv3TWsK+qGhCr6bP/+T2hQiPjhjQbf9VeNQ/nggw2jcuGFFomBP2FyCBhsbXd5uBQ=
X-Gm-Gg: AYBFou1vs/aUL6zlbFJ9Qi/gxD2oedY5Ocrvff5KuypVZmdUK/5AlUIIlFYakcsyEw1
	MKVWxPmzrqwDLhvqRmCQe0GCu/JkLo7I57FQx37m4w4dVarDL+osPqtAxuSzXnsTVqT6bandqZ6
	W9QLv8wKgguZy6ulPNZM7CfOR3He4ieZDeYOaR335t42dlbVS5RJsZoj+fDRCHF4LLxs4FjQ3pD
	/S8fE6GOF9C/nrjNC/m6VGlzihUGtBPeeDKXLOKW/QumoOkS/ewI3B/YazKOSly3W7KGWbCRnMq
	wc8wnnrA8jRK3T1xTDt/34tl2qSBpKqry4DRPDCElvOAaHmNT96u/mZ8xBPAViljyjuwqgUzZZX
	q3/ZaPI5UCXH3kWbsteXowNptyTcX+KNwcLr4nFo4IZ0XyuLs9NbtybCEfkZKPLW8VMQmsAirr1
	G6ohj4GzPX38kHZFc2UxdLvN/Y6qfXl+vZi8a+KVodzMpsv9tgCYLcP5e/cy+w5MAos14bMbXsH
	Hyr4jBf/iFhUPk=
X-Received: by 2002:a05:6214:3ca0:b0:912:435f:1a8b with SMTP id 6a1803df08f44-913fc8d3895mr33550386d6.22.1790044225028;
        Mon, 21 Sep 2026 19:30:25 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914024a1b21sm4504326d6.15.2026.09.21.19.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:30:24 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 22 Sep 2026 02:23:26 +0000
Subject: [PATCH v5 07/13] bpf, x86: Take a Tasks Trace reader in the
 trampoline around its call-outs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-b4-rcu-tasks-preempt-qs-v5-7-410f57770bad@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1790043820; l=8237;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=EPAPVj1FhQ7/+pop5mUZQszLO5ulnMl6jVPcEL6t5Gk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKeNfl/NvsHWWZiu8ABGjBm0Ik1LIwwY7PXte5+OSYt8vF7GS12LYmo7jIhnhxlZSNoBmV+d/6B
 f4uZu/duViwk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_033034_864274_233E10F5 
X-CRM114-Status: GOOD (  22.72  )
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

On HAVE_RCU_TRAMPOLINE_READERS kernels Tasks RCU keeps a BPF trampoline
image allocated only while a task using it is a Tasks Trace RCU reader
or is executing text that rcu_tasks_trampoline_text() recognises.  The
image itself is such text, but the C glue and the programs it calls are
not, and only sleepable programs take rcu_read_lock_trace() today.

Have the x86-64 JIT open-code rcu_read_lock_trace() and
rcu_read_unlock_trace() in the trampoline, as ftrace_64.S does for
ftrace_caller: one reader from just after the frame is set up to just
before the original function is called, covering __bpf_tramp_enter()
and the fentry and fmod_ret programs, and a second one from just after
the original function returns to just before the final register
restore, covering the fexit programs and __bpf_tramp_exit().  The
original function itself runs outside both, since it may run for a long
time and the image is pinned by im->pcref across it.  Trampolines that
do not call the original function get a single reader around all their
programs.  The second reader is entered before ip_after_call, so the
ip_after_call -> ip_epilogue jump that bpf_tramp_image_put() patches in
is inside it, and the fmod_ret early-exit branch lands after that point
still holding the first reader, so exactly one is held on every path.

The sequence uses r10 and r11, which are scratch at each emission point,
and references current_task and rcu_tasks_trace_srcu_struct by absolute
sign-extended address, the form the JIT already relies on for
this_cpu_off.  Sleepable programs' own rcu_read_lock_trace() simply
nests.  Nothing is emitted on other configurations.

Suggested-by: Alexei Starovoitov <ast@kernel.org>
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/net/bpf_jit_comp.c | 107 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 2853e87797a7..b77e29c9599d 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -14,6 +14,7 @@
 #include <linux/memory.h>
 #include <linux/sort.h>
 #include <linux/execmem.h>
+#include <linux/rcupdate_trace.h>
 #include <asm/extable.h>
 #include <asm/ftrace.h>
 #include <asm/set_memory.h>
@@ -722,6 +723,91 @@ static void emit_indirect_jump(u8 **pprog, int bpf_reg, u8 *ip)
 	*pprog = prog;
 }
 
+/*
+ * Open-coded rcu_read_lock_trace() / rcu_read_unlock_trace() for the
+ * trampoline, see CONFIG_HAVE_RCU_TRAMPOLINE_READERS and the equivalent
+ * macros in arch/x86/kernel/ftrace_64.S.  The image is not relocated, so
+ * current_task and rcu_tasks_trace_srcu_struct are referenced by absolute
+ * (sign-extended 32-bit) address, the form the JIT already relies on for
+ * this_cpu_off.  Uses r10 and r11, which are scratch at every emission
+ * point, and clobbers flags.
+ *
+ * lock:                                  unlock:
+ *   mov  r11, gs:[current_task]            mov  r11, gs:[current_task]
+ *   mov  r10d, [r11+nesting_off]           mov  r10d, [r11+nesting_off]
+ *   inc  dword ptr [r11+nesting_off]       sub  r10d, 1
+ *   test r10d, r10d                        jnz  2f
+ *   jnz  1f                                mov  r10, [r11+scp_off]
+ *   mov  r10, [&srcu.srcu_ctrp]            mov  dword ptr [r11+nesting_off], 0
+ *   inc  qword ptr gs:[r10+locks_off]      (smp_mb)
+ *   mov  [r11+scp_off], r10                inc  qword ptr gs:[r10+unlocks_off]
+ *   (smp_mb)                               jmp  3f
+ * 1:                                     2: mov [r11+nesting_off], r10d
+ *                                        3:
+ */
+static void emit_trace_rcu_reader(u8 **pprog, bool lock)
+{
+#ifdef CONFIG_TASKS_RCU_TRAMPOLINE_READERS
+	const u32 nesting_off = offsetof(struct task_struct, trc_reader_nesting);
+	const u32 scp_off = offsetof(struct task_struct, trc_reader_scp);
+	const u32 locks_off = offsetof(struct srcu_ctr, srcu_locks);
+	const u32 unlocks_off = offsetof(struct srcu_ctr, srcu_unlocks);
+	const bool mb = !IS_ENABLED(CONFIG_TASKS_TRACE_RCU_NO_MB);
+	u8 *prog = *pprog;
+
+	/* The plain this_cpu_inc() form of __srcu_read_lock_fast(). */
+	BUILD_BUG_ON(IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE));
+
+	/* mov r11, gs:[abs32 current_task] */
+	EMIT2(0x65, 0x4C);
+	EMIT3(0x8B, 0x1C, 0x25);
+	EMIT((u32)(unsigned long)&current_task, 4);
+	/* mov r10d, dword ptr [r11 + nesting_off] */
+	EMIT3_off32(0x45, 0x8B, 0x93, nesting_off);
+
+	if (lock) {
+		/* inc dword ptr [r11 + nesting_off] */
+		EMIT3_off32(0x41, 0xFF, 0x83, nesting_off);
+		/* test r10d, r10d */
+		EMIT3(0x45, 0x85, 0xD2);
+		/* jnz 1f */
+		EMIT2(X86_JNE, 8 + 8 + 7 + (mb ? 6 : 0));
+		/* mov r10, qword ptr [abs32 &rcu_tasks_trace_srcu_struct.srcu_ctrp] */
+		EMIT4(0x4C, 0x8B, 0x14, 0x25);
+		EMIT((u32)(unsigned long)&rcu_tasks_trace_srcu_struct.srcu_ctrp, 4);
+		/* inc qword ptr gs:[r10 + locks_off] */
+		EMIT4_off32(0x65, 0x49, 0xFF, 0x82, locks_off);
+		/* mov qword ptr [r11 + scp_off], r10 */
+		EMIT3_off32(0x4D, 0x89, 0x93, scp_off);
+		/* smp_mb(): lock add dword ptr [rsp - 4], 0 */
+		if (mb)
+			EMIT2_off32(0xF0, 0x83, 0x00FC2444);
+		/* 1: */
+	} else {
+		/* sub r10d, 1 */
+		EMIT4(0x41, 0x83, 0xEA, 0x01);
+		/* jnz 2f */
+		EMIT2(X86_JNE, 7 + 11 + (mb ? 6 : 0) + 8 + 2);
+		/* mov r10, qword ptr [r11 + scp_off] */
+		EMIT3_off32(0x4D, 0x8B, 0x93, scp_off);
+		/* mov dword ptr [r11 + nesting_off], 0 */
+		EMIT3_off32(0x41, 0xC7, 0x83, nesting_off);
+		EMIT(0, 4);
+		if (mb)
+			EMIT2_off32(0xF0, 0x83, 0x00FC2444);
+		/* inc qword ptr gs:[r10 + unlocks_off] */
+		EMIT4_off32(0x65, 0x49, 0xFF, 0x82, unlocks_off);
+		/* jmp 3f */
+		EMIT2(0xEB, 7);
+		/* 2: mov dword ptr [r11 + nesting_off], r10d */
+		EMIT3_off32(0x45, 0x89, 0x93, nesting_off);
+		/* 3: */
+	}
+
+	*pprog = prog;
+#endif
+}
+
 static void emit_return(u8 **pprog, u8 *ip)
 {
 	u8 *prog = *pprog;
@@ -3610,6 +3696,16 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	/* mov QWORD PTR [rbp - rbx_off], rbx */
 	emit_stx(&prog, BPF_DW, BPF_REG_FP, BPF_REG_6, -rbx_off);
 
+	/*
+	 * Tasks RCU keeps this image alive only while we are a Tasks Trace
+	 * reader; the instructions before this point (and after the final
+	 * unlock) are covered by the irq-exit IP check.  One reader spans
+	 * __bpf_tramp_enter() and the fentry/fmod_ret progs, a second one
+	 * the fexit progs and __bpf_tramp_exit(); the original function runs
+	 * outside both, with the image pinned by im->pcref instead.
+	 */
+	emit_trace_rcu_reader(&prog, true);
+
 	func_meta = nr_regs;
 	/* Store number of argument registers of the traced function */
 	emit_store_stack_imm64(&prog, BPF_REG_0, -func_meta_off, func_meta);
@@ -3660,6 +3756,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	}
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
+		emit_trace_rcu_reader(&prog, false);
 		restore_regs(m, &prog, regs_off);
 		save_args(m, &prog, arg_stack_off, true, flags, 0);
 
@@ -3682,6 +3779,13 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		}
 		/* remember return value in a stack for bpf prog to access */
 		emit_stx(&prog, BPF_DW, BPF_REG_FP, BPF_REG_0, -8);
+		/*
+		 * Second reader.  Taken before ip_after_call so that the
+		 * ip_after_call -> ip_epilogue jump patched in at teardown is
+		 * inside it too; the fmod_ret early exit jumps past this still
+		 * holding the first reader, so either way exactly one is held.
+		 */
+		emit_trace_rcu_reader(&prog, true);
 		im->ip_after_call = image + (prog - (u8 *)rw_image);
 		emit_nops(&prog, X86_PATCH_SIZE);
 	}
@@ -3737,6 +3841,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		LOAD_TRAMP_TAIL_CALL_CNT_PTR(stack_size);
 	}
 
+	/* Remaining instructions are covered by the irq-exit IP check. */
+	emit_trace_rcu_reader(&prog, false);
+
 	/* restore return value of orig_call or fentry prog back into RAX */
 	if (save_ret)
 		emit_ldx(&prog, BPF_DW, BPF_REG_0, BPF_REG_FP, -8);

-- 
2.55.0


