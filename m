Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C192AC79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 20:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VM45t8rF8CqlHWPsaSwdk7BD4ox5LDNpAeDrj6m5qM=; b=GNF/hAczJFN+TQevc+1tfGqg6/
	Av3Pp9N6OGciU5wg7viBrRhL+RKZupCR1T0EqXihIuzTfochwBUBk7uH+6Up1TY7PGK3U9yWuuPjD
	N2EKLKyz97K9pWa75eL1lMZEicKnDyyxdgw8osJB2gdpjpSVhKCuCju5S3ejv2Gb1huYBrXBKRQHf
	6/ucsNYszNR6VHMW9ziBadLiBYzvl6QcatmPgr4530vKxEu5dPjdakdGUzgkKCWYaR/3hGqRaq11z
	ZpNyE/syK67fzxw3WfVLZKK6yCEV1BcNOvM1laEB8+xlZYHj2lG9GwcRo2g/Z0NflWSdXbZUq3JPr
	inASjB0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrd-0000000FBhX-0JJl;
	Thu, 10 Sep 2026 18:51:13 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrY-0000000FBcj-1n6w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:51:09 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-52ff0b7c98aso1615281cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066267; x=1789671067; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VM45t8rF8CqlHWPsaSwdk7BD4ox5LDNpAeDrj6m5qM=;
        b=d3dZ5dV/zJ/nCeODxVeXUj4tnppepNo0SGaveTgMPBOK8yjzChocMu8ElLP3DNzUQF
         60W6ARQD/WG2yUb8SEZI3glVdDQ6Cm8iwQE7dhAn43DaXGj9fMoXw76jwiUrK3IvuyJ6
         ogIjpCSgWeWxEUtYF2a6qlOJzo6s1g+nXDWhhFF/XuSsiPQiZBQRo0LYeUo17HnmZDvO
         WuPaLR81mpKOL5rHl6uG2wEZrByifwRD2MjN4DqYnl2c5CUrLBLBYWI5co5XOgLYXhnE
         4xp5ky3oJZShjhuompuXfgC2DwADutsKPD8LGv7YwcL4hjs3M5T/r8lMlNk4k+Pf5nfT
         Nz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066267; x=1789671067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VM45t8rF8CqlHWPsaSwdk7BD4ox5LDNpAeDrj6m5qM=;
        b=UGKZFiBoFsOQ8k83Si6VKBVzy+piWzDIljL6Z5nP5DMQh3FBS3iLIy63M6ooCj5R3p
         ul/NPDCliMFiQtOqI66WX/MMpzh3SA/Jo3oTOCxr1aGYnUg2Zl2Zt0xdgl3ASpY9VDUU
         IKg3MDxJ7AT0GJbTyHoF36YcH2UgySHj/ynvNYR2L1kgVtqFpVzQCH45ec5v/0xo/qaX
         WOZUoeGpAF3iBHI4G3uPRBYYe/pMtSZUDqfC1TZwV648Sy/Qk9HktW+iynDqbMU+ZGqm
         mdpsY7EaP/L18J76CGOLRwzJnik/WS/+z03IpQe6LcuedfVJRDyeS47/2M8H0TWK6QuC
         EUpA==
X-Forwarded-Encrypted: i=1; AKwUvBx8stQL1LpcVFEgnGpZ+FtgQaUiF3xfbKgLU0/DgUG4sJgi4h3f0ETB2hDkY07EyrfvlD5yX/GLOqABKc7wmQxs@lists.infradead.org
X-Gm-Message-State: AFuF++nF7BYbqXxLKRb8zdr3Ai+9s1ar4nJpbhFw+hIm+gXmXbVATfGy
	vuWcn9vbnkHAsuCMEx2OY6e4czZv2GOYxqABcmmDmpQn1EW8nmo9YOtwN/cEChQY+hQ=
X-Gm-Gg: AYBFou3cFHY7d8YYiHFmnzKu77TQ2iec796jwnOt+kwRuqxhxGexCkc8lCIFv453AUa
	1dVmncgce7UcpjLiyJrrjAaDyjrK3PqsF+YY/CCJ6N8lwtyQ2sfXqfRrwDgqstDtyBaC46McDnt
	5QWqmNn4aHoPtCa+WEINDK3cmkJ28gxE4Uzni0dpWVCsAueMsalcW4vOTEHF2B9ZCjw1xgpp5G+
	xbhAWYyVeGxYAWRHH9y8mYeDNrYHj3CJiGEiuhDHoMKr2g4Mc8/5lz4y85ptLz71TtMZM6jOhF1
	q0hEnXw7lS4nM3T5ayTZwQNpE7bE0vmKv3OptH0PCNhZuYqXlNd2AR5MtRDYGgTB3UUWdBtiIvc
	0dtQ2r3IAWl0qLLo0kUYgGMKFoD4Feu0zsix1PB3mtsueW3IF2Y11FSR5Vbyo8P36nb6bh20EG8
	aH5rUFvtv6+INxeXdAxdlSe69JlOXlSJkiETpyc2PdjO6LUxaQwUkhgbA7I8KFsK0c2h0e1R+kA
	bKm5SXN6KXJ1ECg6feAR6Q0F5/Jtk7udhHvvlOb0TBRqMCyJ5WD9wJR
X-Received: by 2002:a05:622a:2294:b0:530:b2e4:d597 with SMTP id d75a77b69052e-530c87487damr11129971cf.50.1789066266848;
        Thu, 10 Sep 2026 11:51:06 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47a239sm2556366d6.26.2026.09.10.11.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:51:06 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:31 +0000
Subject: [PATCH RFC 08/13] bpf, x86: Maintain Tasks RCU trampoline nesting
 in the BPF trampoline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-8-d4469f4cc101@toxicpanda.com>
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
X-CRM114-CacheID: sfid-20260910_115108_500043_4EA4B38B 
X-CRM114-Status: GOOD (  16.85  )
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

Emit an increment of current->rcu_tramp_nesting once the trampoline's
frame is set up and a decrement before the final register restore, so
that a task preempted while running fentry/fexit/fmod_ret/LSM programs
or the __bpf_tramp_enter()/__bpf_tramp_exit() glue is not treated as
Tasks-RCU quiescent.  Drop the count around the call to the original
function: that may run arbitrarily long without sleeping and must not pin
a Tasks RCU grace period, and the trampoline frame above it is held by
im->pcref rather than by Tasks RCU (see bpf_tramp_image_put()).  The
fmod_ret early-exit branch and the ip_after_call -> ip_epilogue poke both
skip the decrement/increment pair around the original call, so the count
stays balanced on every path.

The sequence is "mov r11, gs:[current_task]; inc/dec dword [r11 + off]";
r11 is scratch at every emission point and (u32)&current_task is a valid
sign-extended %gs-absolute with the current per-CPU layout, the same form
the JIT already uses for this_cpu_off.  The image is dynamically
allocated text, so the instructions outside the bracketed region are
covered by the irq-exit IP check.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/net/bpf_jit_comp.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 2853e87797a7..a375c1b7bd50 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -722,6 +722,31 @@ static void emit_indirect_jump(u8 **pprog, int bpf_reg, u8 *ip)
 	*pprog = prog;
 }
 
+/*
+ * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().
+ *
+ *   mov r11, QWORD PTR gs:[current_task]
+ *   inc/dec DWORD PTR [r11 + offsetof(struct task_struct, rcu_tramp_nesting)]
+ *
+ * r11 (AUX_REG) is scratch in the trampoline at every point this is emitted.
+ */
+static void emit_rcu_tasks_tramp_nesting(u8 **pprog, bool enter)
+{
+#ifdef CONFIG_TASKS_RCU
+	u8 *prog = *pprog;
+
+	/* mov r11, gs:[abs32] */
+	EMIT2(0x65, 0x4C);
+	EMIT3(0x8B, 0x1C, 0x25);
+	EMIT((u32)(unsigned long)&current_task, 4);
+	/* inc/dec dword ptr [r11 + disp32] */
+	EMIT3(0x41, 0xFF, enter ? 0x83 : 0x8B);
+	EMIT(offsetof(struct task_struct, rcu_tramp_nesting), 4);
+
+	*pprog = prog;
+#endif
+}
+
 static void emit_return(u8 **pprog, u8 *ip)
 {
 	u8 *prog = *pprog;
@@ -3610,6 +3635,13 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	/* mov QWORD PTR [rbp - rbx_off], rbx */
 	emit_stx(&prog, BPF_DW, BPF_REG_FP, BPF_REG_6, -rbx_off);
 
+	/*
+	 * From here until the matching decrement before the final return, a
+	 * preemption of this task is not a Tasks RCU quiescent state.  The
+	 * instructions above this point are covered by the irq-exit IP check.
+	 */
+	emit_rcu_tasks_tramp_nesting(&prog, true);
+
 	func_meta = nr_regs;
 	/* Store number of argument registers of the traced function */
 	emit_store_stack_imm64(&prog, BPF_REG_0, -func_meta_off, func_meta);
@@ -3670,6 +3702,13 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 			LOAD_TRAMP_TAIL_CALL_CNT_PTR(stack_size);
 		}
 
+		/*
+		 * The original function may run for a long time without
+		 * sleeping; do not let it pin a Tasks RCU grace period.  The
+		 * trampoline frame above it is held by im->pcref
+		 * (__bpf_tramp_enter()), not by Tasks RCU, across the call.
+		 */
+		emit_rcu_tasks_tramp_nesting(&prog, false);
 		if (flags & BPF_TRAMP_F_ORIG_STACK) {
 			emit_ldx(&prog, BPF_DW, BPF_REG_6, BPF_REG_FP, 8);
 			EMIT2(0xff, 0xd3); /* call *rbx */
@@ -3680,6 +3719,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 				goto cleanup;
 			}
 		}
+		emit_rcu_tasks_tramp_nesting(&prog, true);
 		/* remember return value in a stack for bpf prog to access */
 		emit_stx(&prog, BPF_DW, BPF_REG_FP, BPF_REG_0, -8);
 		im->ip_after_call = image + (prog - (u8 *)rw_image);
@@ -3741,6 +3781,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	if (save_ret)
 		emit_ldx(&prog, BPF_DW, BPF_REG_0, BPF_REG_FP, -8);
 
+	/* Remaining instructions are covered by the irq-exit IP check. */
+	emit_rcu_tasks_tramp_nesting(&prog, false);
+
 	emit_ldx(&prog, BPF_DW, BPF_REG_6, BPF_REG_FP, -rbx_off);
 
 	EMIT1(0xC9); /* leave */

-- 
2.55.0


