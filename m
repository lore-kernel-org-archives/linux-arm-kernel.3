Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4122BC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbVlQmHCpb9zv+5BDFsE+SK081jwlXFhk4tZhnaWY5k=; b=4vNWRzi2Pfgf0+77aWAf3IyRrt
	8i77fekmvpfh/+dO7PdMATW3SfqgKrH6Ec23eiNyBLtxJjM6bk90kBFohUFN0iM+UV3rwl0reVRcn
	ACVC0q4z5PY4f1Ja8/vp9uPXgRLeNP8MccdoDdcfQA+1xMoAvjTW025jviWx9mz1vV1poZ48u7Xab
	1Z7l0g8lckFmGbxXzxKtm4zhVWao3a6RE9y9BOwRyJT7C802lHwZK2dQ2Wgh7VwlgptCIvka6G//+
	O+vbDLGsG6G7IypxOpuVROfAbcdMaM45f7jlY5ywOlXvG0OhEk1+K4vLE478c0L33OhMjtOjXtQt8
	Obexr6mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrc-0000000FBhC-3kfo;
	Thu, 10 Sep 2026 18:51:12 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrW-0000000FBbR-3O53
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:51:07 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-90ce08834feso438576d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066265; x=1789671065; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbVlQmHCpb9zv+5BDFsE+SK081jwlXFhk4tZhnaWY5k=;
        b=S7y497749Ra//HJJJxZ+9ZfN23oQAhqPk0we4IiBhd7PtX4W4HpPbejQb9m72bYkBy
         eUv6zVLUjC0DJZczqT61fS7kUmyJHDX4zizK4QTHicXn/LipffngjC5zfqjcYFGTpYp8
         xtvjExE2wijzji3pWcOPbC5n9vj6vxj5jXtJFI2nY9S29ogulimcjUhfhW3uYqljaO8K
         FyBOn1cWCikVVYFO8wrbTRxr2XsCDljbX9t77yzHWwBYRcSQ4wUnNubK/lTsgqPo5nsW
         dKhxy21x8Dfx5YgbrfZVdHOo31xstBpe8UaF4YM2isENgFeF9evnc0fDMVowB3lxYIOF
         rpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066265; x=1789671065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hbVlQmHCpb9zv+5BDFsE+SK081jwlXFhk4tZhnaWY5k=;
        b=sjHVpEhftMifk4kkwtA0Lwl8MD3tdyDah5tCNIaebxn8m2N+L/mldD1FuaoPJjP+2G
         afg1OqjNMb2XBJnARcbHtKkAlEggG+KE9BhZSkaeLpFUhoBK4jjtne+YJsRvqxS8zKSv
         hchC3RY4CPK+HSY9Q9A9ZXSCMFiF/xA2/RnOIBt2cQzQK5+blreAko1jkkRemqL8rf3z
         YJnZycKQ8clytKJ89a/iOjlexIjkfLhsbK8ZzVgxcsnSwElCbhnCfRUnwiM209H2muaz
         NTs+MPb3qu6GAjBFluJqRdGdo7l2nBLiERhn0KflLJayDQc4B+ngmDfz7CjGBZ96Qsm4
         tPHw==
X-Forwarded-Encrypted: i=1; AKwUvBxYjwDc3LgCNwQGTzW66+Pz4ky5/UaoVnh3M6X1wrCRAZK+aiH7WJq8dLWKKY/w/Ic3gGJPf2xNAdxhj80wcPph@lists.infradead.org
X-Gm-Message-State: AFuF++laPR4gODo6c04PohwHbjz9X5pKG2taHB0D3X5W/tgYCasLSDM/
	JS/1vwYb/9zj6pAjSSTUr8PX/uuTNQLMd95rN+vlTTEFQccVhQksrh4WUPi2LdeKjgigkmZ+1A5
	d9jBver0=
X-Gm-Gg: AYBFou29FhkG0UUGE22Y0HNm4uGLSbIpvWdePF0R1HV/ymyd8TXKJeHluIy25oylBk6
	/m/eWnLZ+f4dU54kM0EY2hPQrVeLz16WzsE1wvwerTc3yWxEOCxISa6iKisocn1CUTH2aSIbN5r
	HQ7TOUNiWYkHy4pKD+YsHEcvFv1rd3BoWtt0sDqqGPovxqLzv5oqT93AMm/RhtXGP7K1b9RGyB/
	GIYP4SlxYbxLMArkno2gYJ4i1fG4D7RIYgYafBUhI4leWNc8YcVpXw4F2Zlp4tmhtEJHshgow5Q
	Jsy5dsv4Jq92hfpV4k7U9hZdqL1r0pN8DbIlzX62OzlUuJRVkeaZ4FgXNjE7TfWkuHAZWoOUy8x
	nFsJpHmImkoFlOWKjHu7/9yp9xUBPFYDORbDpIROqiuy1VZnf2eRfpzGoMh8tjHXI8n/R5pLtCJ
	lrWP9j3j/KGDbxWGbHfeHglo/K4lTgGBZiZiaKfnANu2uhI8XlqFLFpBHzT95DVtSXK14NdUz1r
	uYhODrtwVB77Z2tgR8tNKkr67BEFf6HJiRu0e23241AfiL3fQVyXcyR
X-Received: by 2002:a05:622a:1309:b0:530:42e4:effc with SMTP id d75a77b69052e-530c87566f0mr10949261cf.41.1789066264886;
        Thu, 10 Sep 2026 11:51:04 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca47efa2sm216291cf.11.2026.09.10.11.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:51:04 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:30 +0000
Subject: [PATCH RFC 07/13] x86/kprobes: Maintain Tasks RCU trampoline
 nesting in the optprobe template
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-7-d4469f4cc101@toxicpanda.com>
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
X-CRM114-CacheID: sfid-20260910_115106_868247_B75C5D8D 
X-CRM114-Status: GOOD (  11.61  )
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


