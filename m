Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED12CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 17:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fr6kFLYx3hqPZHfOilkUN+oxGtJHBsVQ4xuLKdXd4To=; b=eKN1Q+W3bILdxCTiYlR700b30s
	5jMhiEUPnrzxchAL79+NTD/dKZjxXY71GIqtWwkKdM9mvPIYPoOwePPKJgG04bLVuvuOU62PAAvL0
	aZJ9oUd6fKXIpun4Wqe/Rfeo4FCFR4pc11+SUZzgtZU8S29mH5qf6oQ6HCb/OXYQ5qkmgwlPDPZXl
	pWhNP9LOtaoTeuNtW/vGzEkAkJCnogROTuottZnvCh0Ik6JErSiwIufL5wkZquJ+3D/y7fCjhy3an
	dFM7XUwXBOfb3yrPIcA1fZp9+d6vQHLonBj5M9j69YOTstGrPr0ZqwNL6MWJdBs6v/NHfu9zNXGBF
	JC5AW49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbKy-000000048lO-2U19;
	Tue, 29 Sep 2026 17:09:52 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbKw-000000048kr-3vSE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 17:09:52 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e4aa8d882so5180052d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 10:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790701790; x=1791306590; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fr6kFLYx3hqPZHfOilkUN+oxGtJHBsVQ4xuLKdXd4To=;
        b=M/FUsgFojYlZOK5PuwHYp2Z11K96EMeHeIuHKd6puM3sR7Gkz8OgQHFzeG4kNUz9E1
         PC2TY5AEbYjc/vWmCbngQXi7GE1EAm5IzO04BzSgvryUWuBQc0r8Tdf+8kDYHviWcL2B
         362SUnJcaLHa90t5DgRIkfHcH/bVxOl9INIIt+Fz2HvIx09YqcEj43Ic80lYEQOlJX9H
         S0eNWbgZpLB50BurWcZQDx9kCdzBE/1Wck+3i2v+eks40wTgyDUs1hKIFotxRtzmDH5Z
         pxmxmVmpeYNNcKQLroDZNfP/cCCj8Quyb5jKXfnUswtTIRdsZN6as12F6fxjGVMxiSi4
         CIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701790; x=1791306590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr6kFLYx3hqPZHfOilkUN+oxGtJHBsVQ4xuLKdXd4To=;
        b=OtiTwILIdmxjHBHhF0x0AS77+4nbO1D/01GswU+5vVOoEfJ17SBvOMvVSd7RyywgpS
         iTr/aAnFcTq71v/zo3UiE2xZ5xpNusLbQ2TZ8dpEF/Y29oKLkM6fq/tU7puGYfywOPZe
         +EZMOM1yjCdcssLv6M2/VgBgSCDTLnmLmF6/sGGY7X2gorW53+Y3+DI7HNJnn7OybLdW
         aQl63pNPKspCLhkz3O410YwBEhOXMLp9Ddb0rzZOvLcDDiIVEpB9q87oLab/iGpWtkMb
         +FH0nm1VYoqfbgGYQc7EFOg4VsoZtbN5YhS3HqE99GKjMd9hp8D8g4p0gS9uWI1AFC8C
         vWEg==
X-Forwarded-Encrypted: i=1; AKwUvBxJyWfowp9fCrP4UerYlGf5DUjsD5AXy3qqIFfXGp6HzyvbYpKAbxT+0Es8ZtelZBfuziJsXcJbhE3i9uMaEiPu@lists.infradead.org
X-Gm-Message-State: AFq9FYKfGiha02VBf4caapa9g44/THVCOr425QWu51ipwMNzTf9OJTng
	ruqCnQKPuLSsdhZBC7aP6DdrIbrWGcvF3XG5KRnC9z9ywEAfEsphr3MWb6/2937c7vA=
X-Gm-Gg: AYBFou0YE0zFJh9XBIGFUYQk50n36VbqRUoxIQLI5908XYsFRKsiCCU9UM1qzuy9/JB
	VVSrFxHsPU9Ypz1mee4lmPJfsDUd5rtluULjqAaFIBWFH7S+kIHvnzGtbxWLhc0BBLqgJ+jQYz1
	6iMj+wqoZ0AuhGTQqL+iqlt99BkEHfJUPUoa7NgHBr0ay1JhKMPv7bvfteeeYKxB/6zODBpr48q
	CBmBpcwrDRVRvWHUoIRUc9Dd5uGZGMw0QrajnumRbGTPUAfF2OsrEy7oUS4n+rGn6OB/BU08GiC
	3crQ5znXiaKyYCt0uJ3IIeHYjHVs2Iv3/sQ/K18pQScCj+qMrihhpt8YxagIquv53v8RiWw87J3
	xOkzy45OoVfzn/I4rqNvLOtym80PjByTAGrvUqaFFCpYKPCbNrbQTfM4yBIUB2hZRlqFN+WWlPN
	VHWW+foppjOdT5qRme3BZ6HaiBaqp8958JAJKYZe0BNZ9fLU/vDtfckcZupCSck557KfwE1/XOB
	4UO656Etp2KMnk=
X-Received: by 2002:a05:690e:1381:b0:675:6228:2fdd with SMTP id 956f58d0204a3-67562283283mr1486048d50.4.1790701789596;
        Tue, 29 Sep 2026 10:09:49 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d36dc53sm15111636d6.37.2026.09.29.10.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:09:48 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 29 Sep 2026 17:07:19 +0000
Subject: [PATCH v6 02/14] entry: Pass pt_regs to
 irqentry_exit_cond_resched()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rcu-tasks-preempt-qs-v6-2-c111ee02caca@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1790701681; l=4297;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=vAWpKfoMcBcYFQiIgPpQZt2gAuw45VdrXu4vr32WnR0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJ82CGQXfqnbJiVp3TBiWQlv0t3DHZRPE4o+VRe/LAxOZF8rZHNhVg51z28EpN+QditmDbtfNGQ
 sOegaspVm+Aw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_100950_991023_64A0E45A 
X-CRM114-Status: GOOD (  15.51  )
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

The irq-exit preemption path is about to need the interrupted context's
registers to decide whether the preemption may be reported to Tasks RCU
as a quiescent state.  irqentry_exit_to_kernel_mode_preempt() already
has them; hand them down through irqentry_exit_cond_resched(), its
PREEMPT_DYNAMIC static-call and static-key variants, and
raw_irqentry_exit_cond_resched().  The only caller outside the generic
entry code is Xen PV's upcall handler, which has regs as well.

No functional change.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/xen/enlighten_pv.c      |  2 +-
 include/linux/irq-entry-common.h | 13 +++++++------
 kernel/entry/common.c            |  6 +++---
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 2c64b388f616..3d85035f5624 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -739,7 +739,7 @@ __visible noinstr void xen_pv_evtchn_do_upcall(struct pt_regs *regs)
 
 	inhcall = get_and_clear_inhcall();
 	if (inhcall && !WARN_ON_ONCE(state.exit_rcu)) {
-		irqentry_exit_cond_resched();
+		irqentry_exit_cond_resched(regs);
 		instrumentation_end();
 		restore_inhcall(inhcall);
 	} else {
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 0bb6c03481fa..e19b41ee6b18 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -343,24 +343,25 @@ typedef struct irqentry_state {
 
 /**
  * irqentry_exit_cond_resched - Conditionally reschedule on return from interrupt
+ * @regs:	Pointer to pt_regs of interrupted context
  *
  * Conditional reschedule with additional sanity checks.
  */
-void raw_irqentry_exit_cond_resched(void);
+void raw_irqentry_exit_cond_resched(struct pt_regs *regs);
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 #if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
 #define irqentry_exit_cond_resched_dynamic_enabled	raw_irqentry_exit_cond_resched
 #define irqentry_exit_cond_resched_dynamic_disabled	NULL
 DECLARE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
-#define irqentry_exit_cond_resched()	static_call(irqentry_exit_cond_resched)()
+#define irqentry_exit_cond_resched(regs)	static_call(irqentry_exit_cond_resched)(regs)
 #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
 DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void);
-#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
+void dynamic_irqentry_exit_cond_resched(struct pt_regs *regs);
+#define irqentry_exit_cond_resched(regs)	dynamic_irqentry_exit_cond_resched(regs)
 #endif
 #else /* CONFIG_PREEMPT_DYNAMIC */
-#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
+#define irqentry_exit_cond_resched(regs)	raw_irqentry_exit_cond_resched(regs)
 #endif /* CONFIG_PREEMPT_DYNAMIC */
 
 /**
@@ -465,7 +466,7 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
 		return;
 
 	if (IS_ENABLED(CONFIG_PREEMPTION))
-		irqentry_exit_cond_resched();
+		irqentry_exit_cond_resched(regs);
 }
 
 /**
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e3d381fd3d25..e4acd50bd81a 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -134,7 +134,7 @@ static inline bool arch_irqentry_exit_need_resched(void);
 static inline bool arch_irqentry_exit_need_resched(void) { return true; }
 #endif
 
-void raw_irqentry_exit_cond_resched(void)
+void raw_irqentry_exit_cond_resched(struct pt_regs *regs)
 {
 	if (!preempt_count()) {
 		/* Sanity check RCU and thread stack */
@@ -150,11 +150,11 @@ void raw_irqentry_exit_cond_resched(void)
 DEFINE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
 #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
 DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void)
+void dynamic_irqentry_exit_cond_resched(struct pt_regs *regs)
 {
 	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
 		return;
-	raw_irqentry_exit_cond_resched();
+	raw_irqentry_exit_cond_resched(regs);
 }
 #endif
 #endif

-- 
2.55.0


