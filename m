Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14CCC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbVlQmHCpb9zv+5BDFsE+SK081jwlXFhk4tZhnaWY5k=; b=3lBqATBLdW16/Tzg4jbj4O0t1v
	ULA7sv0VDGvhNThDJSwZ1ysqHTWrN3Z3VhT/0rRxdpbyHaKoPofDAF3CTiNzVN8Ac2GfCBdORTnet
	PCkZjJGp78rvVMoK5nMP7Hz3zO1xB88BQRL7iZeGtHQlCCdiRF9qpNGTJgbI50V3hJRnfTe6PccOh
	W7GiDlpj4w+robrmQn97eAu8avTtOLbINOYdFxEbew5R0wC4DpEPmXWyqi06J4+ijx5/WM4NrWZae
	lqLDdLXydpvnbE6+WH8zkLsjcHm5Pxn/IDYqY3atrvoFNsz6K1vQcCY5/waZLN32B7+LYqvph2D9v
	0TGIeRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51xG-0000000GrJH-15d6;
	Fri, 11 Sep 2026 14:10:14 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51x7-0000000GrEe-1BgF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:10:07 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-92f0b5ed131so121694285a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 07:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789135804; x=1789740604; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbVlQmHCpb9zv+5BDFsE+SK081jwlXFhk4tZhnaWY5k=;
        b=hERtfNxBC18cBRvRYuaZBD9QLMOucexXjBOivpaKPS2mHhuDuCgTHMOSdW4z2DkhEX
         feENG4fRVin4GK2ODYMJ6lkOG3T1cG5bKm15FY5tE6sBQovE89Ptmalnkn3DpYzZmGRd
         GQcBV+sl901FL/a+ly6px72GHONQWKCloePlpjmEo/VnujwncS2MgLvR55Wg+k3/h+Xx
         Mt+1IOV9G3P2oVW8tlMb6Jt4b1lrt12JnuGlfBcOXSoue1IS60XBPWJkP5AfXsFw0NLO
         Ic/3VGVsWnBmDpi6aL/o8iuka6TUBNH0QTFhxs54udG/JBKLe7bSbqML7fKjcds0TBLS
         MGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135804; x=1789740604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hbVlQmHCpb9zv+5BDFsE+SK081jwlXFhk4tZhnaWY5k=;
        b=O6S9QMlj0iKYOgkvW7NHdWLccIchu/HfIjRaniPpqy7YW1bsaYXJCDhb9Q9anHQLS1
         WzDyipEiotv0ImuPjxLro+RhB3qVV11f3Ta+WLh43k1Hf+uscK/sM4cyovfQGr/pqnx1
         oPLwrUS6IN19You4PNcwPTz192KTFUya12pKy8XzlQbWVtLP1CR/PAu13n6/AOPnLNMC
         kSt7mN42a9oY8AkA3+GuxDqlaElWAfn1R5nnwZWL5DfyBaMtboHtOveBZQ/PyjxlTCl/
         yMmvMjvSezly0d/gjXqkCxnODoBOqWKw0tKT4MKMKD79tACA+jKy1ooQqkpTgnwCAB6D
         c9Yw==
X-Forwarded-Encrypted: i=1; AKwUvBzYgSTgXOiI9BbkqRJ6b0KTnttm03mfFlZM9gxri2ZlF7b19haYSrysYaeG1F0rh9YDyMpZVCAPQh4EugHxbovv@lists.infradead.org
X-Gm-Message-State: AFuF++mgoJAhGwACzZcXZhRhSILAsIsA5p0/GsL/KfPl3oyLTHqOov//
	Mwu0rCjh5h70WUZkLcogFfvuLdYGqhn9ffCPWROSs6b/3G3et9IaHnfwiQJbwgxG/fQ=
X-Gm-Gg: AYBFou0PXWnrTdl72Bf21S+mm4CRhPbt2KzPDh6PvGPWtfXZWP8J2gWG8Uxhi9DwSRw
	25Sp1f5prSAgHNf4eaZSi8gjdace8gWSLm7VwiLQebc/VdF4R9Bg0hpbMMUAAyAKVEjczbUD9jZ
	NklrHP0oD/8N6/Gwc/QiGctlnRXayvJGJdZOQUhL1DNp8KVSuGjSQOwm53wra1ZBuMiOfc1570X
	AjzNbuAUQzrTcvcUbWqLoqng4V8S1jXp2emu6UkChG6Hwhy12KrRy1VghlXczmD3fSIN2V2mx6h
	qo34a8H/5Pp8bQ9TLVmG4fY3qNyf364lWUJ75o62i80MqNBIqEab4neko1oEvLHHnKujH+QcY6M
	EUhv6qVytv8fj+OqhO0v0J4Kes/p5PWPDNoVdhy8GiQpAGBs0hBo2qixuQORbaMVG3r7gmSctta
	GMSPjjsy9TZXAHH45WpyTuxxzB0n/efZybmO7Da/BUO4qXgXQBbUIxWV9oUafbsHQx9JSLq1VC7
	UlslKVs7Vv4ET2zNDz2mRFYmWYsnNj92yl1segvZzJI982v1Pq7BifF
X-Received: by 2002:a05:620a:198d:b0:939:3a81:326 with SMTP id af79cd13be357-939ea18c166mr526461185a.37.1789135803738;
        Fri, 11 Sep 2026 07:10:03 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939f1dd527asm125166385a.16.2026.09.11.07.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:10:01 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:45 +0000
Subject: [PATCH RFC v2 07/15] x86/kprobes: Maintain Tasks RCU trampoline
 nesting in the optprobe template
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-7-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135736; l=2636;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=8cFDFeD2IXPN8Vlj1EymtW9Bi32PSZwsbXS468MRSTs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QE88Fo4D8KnMZviii3UcxtNsSOWitctfeeqTUeKrfDl5ze3tUkJnL+Us2LrW6ea29znHZAO8PVa
 SQS9QIpNv5Ao=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_071005_594467_6B6A1E4A 
X-CRM114-Status: GOOD (  11.35  )
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

The jump-optimized kprobe template calls optimized_callback() with
preemption still enabled for its first few instructions, so bracket the
call with an increment/decrement of current->rcu_tramp_nesting.  The
template lives in .rodata and is memcpy()d into each optinsn slot without
relocation processing, so the per-CPU reference to current_task must be
an absolute %gs: address (R_X86_64_32S, relocated for KASLR like any
other) rather than %rip-relative.  %rax has already been saved by
SAVE_REGS_STRING and is dead after the call.

The slot itself is dynamically allocated text, so the instructions before
the increment and after the decrement are covered by the irq-exit IP
check.  64-bit only; 32-bit x86 does not take part.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/kernel/kprobes/opt.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index 3f8fea52619f..f722520bb989 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -31,6 +31,7 @@
 #include <asm/set_memory.h>
 #include <asm/sections.h>
 #include <asm/nospec-branch.h>
+#include <asm/asm-offsets.h>
 
 #include "common.h"
 
@@ -101,6 +102,23 @@ static void synthesize_set_arg1(kprobe_opcode_t *addr, unsigned long val)
 	*(unsigned long *)addr = val;
 }
 
+/*
+ * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().  The
+ * template is memcpy()d into the slot without relocation processing, so the
+ * per-CPU reference must be absolute, not %rip-relative.
+ */
+#if defined(CONFIG_TASKS_RCU) && defined(CONFIG_X86_64)
+#define OPTPROBE_RCU_TASKS_ENTER					\
+			"	movq %gs:current_task, %rax\n"		\
+			"	incl " __stringify(TASK_rcu_tramp_nesting) "(%rax)\n"
+#define OPTPROBE_RCU_TASKS_EXIT					\
+			"	movq %gs:current_task, %rax\n"		\
+			"	decl " __stringify(TASK_rcu_tramp_nesting) "(%rax)\n"
+#else
+#define OPTPROBE_RCU_TASKS_ENTER
+#define OPTPROBE_RCU_TASKS_EXIT
+#endif
+
 asm (
 			".pushsection .rodata\n"
 			".global optprobe_template_entry\n"
@@ -114,6 +132,7 @@ asm (
 			"optprobe_template_clac:\n"
 			ASM_NOP3
 			SAVE_REGS_STRING
+			OPTPROBE_RCU_TASKS_ENTER
 			"	movq %rsp, %rsi\n"
 			".global optprobe_template_val\n"
 			"optprobe_template_val:\n"
@@ -122,6 +141,7 @@ asm (
 			".global optprobe_template_call\n"
 			"optprobe_template_call:\n"
 			ASM_NOP5
+			OPTPROBE_RCU_TASKS_EXIT
 			/* Copy 'regs->flags' into 'regs->ss'. */
 			"	movq 18*8(%rsp), %rdx\n"
 			"	movq %rdx, 20*8(%rsp)\n"

-- 
2.55.0


