Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1632C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VM45t8rF8CqlHWPsaSwdk7BD4ox5LDNpAeDrj6m5qM=; b=JFv/nemWwzXKEx6RtHxIUv/4bb
	3NqlJXuAV7xHu+2I2mXvokCWqEOCF8SNOAg7J52qHIBXJzbqcVLsNZ2RWMiEBbjAhU1DpxQNxGYyl
	BK+8XCitI2yznsqg7yxZrO5W/c/aaOlzYpibguRgcE1DaCYReX9PyyRmhtddap8yXnjUJdBvbM1wQ
	QdNuNlqFDzA/MxVF+0OorY6vgD3kgDIWts9uyQubpduo1sA/E0xIu4dMOJQcVwckyCPOIOgo8gYOu
	5JGuDE9FVxSFtSq8DvuMhr2loQpJoDDY7Y1xPQ+vpmv9969uxFdQuvOoyRATHsFVdl6C6582kY07T
	HH8rf5CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51xH-0000000GrKZ-1lzf;
	Fri, 11 Sep 2026 14:10:17 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51xB-0000000GrG9-31jJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:10:13 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-939fa4f2b81so17317385a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 07:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789135808; x=1789740608; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VM45t8rF8CqlHWPsaSwdk7BD4ox5LDNpAeDrj6m5qM=;
        b=Mvk3mDdctG+otPsrR0deyL3oiLcKWHDQynYKKUY+RqqaDxCAEfYWlCCpvuuEXj/RQg
         XFdKIsG/2hvvss0sJBzH68mwlNSfH5nlbQ0SUQj5xdlAG/MbJtEwcAuufLTLUtjOG9+M
         RXQEXoXYjZvwE7MQ+F0C7UplRAS/Rh9msMaCILgiE2kllF5wu30v05QASdWzuBEpo3bu
         H3E2uynsX4l+mUrMWlzb7MCC51TDZfYRoI8yg1WFxOAMQoxNXx5ecc4Q6iTRtqo/8UCc
         /46TeYTRODpexi9k7udZJRPVENEKN4oLk/4Gtu2gHEBMkdmtEhJfRbdf2HmZivMNbXfc
         z+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135808; x=1789740608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VM45t8rF8CqlHWPsaSwdk7BD4ox5LDNpAeDrj6m5qM=;
        b=jSP7hpmo2Uf4nx+TRlsjGqzA6JuZA7+PNS8W+hu4nceDVm1Iv07tLodENW+e8Vl3KA
         +nTp4rksippcgBVLmiZ3lf0FI8sPsKyNbDKKFprR07ybNYR+oOLEir9N5eTCtz+/DOlp
         zyK1ey222ncVKyAk9KHDbAGcmc9AyiyY+mlgzWlqPVXc7apamvI2cE/DeSNS2chQBkxf
         9M2ldBtowZGVwseT2UzRn1BJWhPBJhYMLNEPey5E07lS8r3mIU3FJjyfTcuMZWlf2Ec7
         BIch3ZNe1VEZ3XEtURi7uTMV7BSeC7nzu0gL/6aLK3IxUYM2s3VNuerXgh8abLbZLSqe
         NoaQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6YhTzia1hZq4znU8nFhviD4kwNTJH1a5eCIr+D64rS4JbvyBdsSoMsWSRzqGcfQIjfzNJL77iEREK/4sI/y+L@lists.infradead.org
X-Gm-Message-State: AFuF++myLuZI0DU+xIcp5Zumn+7qFprKGdITMP9eU9YUX0AHSCII+9mZ
	3yPLrbdSNSLUf6gd9Raqe/9L05AN2FgGoA6iJLWOe4tJeFnceNQEEO98dgWLzctoLyA=
X-Gm-Gg: AYBFou3x4dmAKoQOmIfvbXle8T7F4EQGoPhmswfdxwbhLlnvTL5m/tnQeRiIgYLdazD
	nlwTIg7dsvdc192Xg6vyoXbnCHrxhiFsCb16LqjgYYy4tccprYFX4xDuqRhK5CG7AN4AvRyGmxX
	M8LSsyv1O/me89kILUCxVlKqelPI8upbZjllhTRNzb+T8KY3CI6iTtU5UKf8Z89oyu0UhM64YFP
	3z05kBAsxgWVzBCocXkRB9eaP8il0O4bZW0dka7dDcU9w46WyGxOrL73iYh+dNqOf9dJ7KeWrer
	Dfp9MpWgedXONbLxP8dCYUTtqYbyel5Va6AHimXzLyeDiuCnFYrmgC6ti4NdI6elcrk3PZjR0ty
	73eirJMR+BKpQdrKO7uK78rsNqRgsbvPbKdpvKxtLNqh2FgDRJgr7k5JPtPyGcTxNilh6BnRYTZ
	0W+64m8o6RjUqZHTr2CWO4tqKui7VQisa3AhZfkB9z2dJJ9x36mPfTTMYaeydKII6fubPe2r3aQ
	L89RB5jpPbbfzxKHq8MKHOcaij4ViCTvwvreOQE+ZXn1a98Q+S+YF34
X-Received: by 2002:a05:620a:25c7:b0:939:bd4e:b2fe with SMTP id af79cd13be357-939ea2877e9mr555790285a.40.1789135808266;
        Fri, 11 Sep 2026 07:10:08 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f184d9sm254193785a.12.2026.09.11.07.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:10:05 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:46 +0000
Subject: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
In-Reply-To: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135736; l=4464;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=ZoHASPcgXPkyj8nhWq6Qxe/k1AFcC7iFexyU3IrpvR8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNGMQXlnJ9mLTB5EylkME94aCeeA53rjkqD+SHndTEJHVSfeCPYIUtSGAIP6GARv7tJy5dM1hBK
 jP1T+H+zt3A0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_071009_778077_E4738338 
X-CRM114-Status: GOOD (  16.66  )
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


