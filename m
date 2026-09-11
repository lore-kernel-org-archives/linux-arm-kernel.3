Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5C2C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxBJRgyuHY3W/iJApny4mLX1c4wnn/TYh39J8mu564M=; b=NZIhIsAmLtCQ+oBdcQLpxCemYR
	kddctzMBgs24b/hOFoDPWf2390MGQ+eZsDh7UiaeXqGKxMkIAEQok5yz+eAxuvXLLH6guqpkKgflp
	YRLBO7Ez2FRGFLtU2a0IZb7tYVLED8QpPwQVV5k9/guDJxApu+0t19hkCs6N2nRaC7LBvkLainfbs
	cBrdP6MsAYtMlKULMA8QcMh9gkeIK9eHz0xSgwWtQc/hPs4Xxjuj9TzFE44bAdZx62cgAceeF3has
	e35uI6DO76+e18YymEUh1NklJtmc1rgaoOGGY5eWJlapiSr814KaZGM98uKwgzlDSi6J6VXzSiPAm
	r9Yj9c3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51x1-0000000GrC4-295g;
	Fri, 11 Sep 2026 14:09:59 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51wu-0000000Gr9Y-0cEP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:09:55 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfbd148cso9161796d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 07:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789135791; x=1789740591; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxBJRgyuHY3W/iJApny4mLX1c4wnn/TYh39J8mu564M=;
        b=OThAs2HO4yuKgC5Ui+qluQm03i/MxgG4kd9ad4qxqz84cFKLeI7VI0sPoLK8cHBng6
         8nJ3xwWEBIR/9JQNkdBS0UI3jsGSNGBH7lOBwkSa9PWtyOpd3zQeP3+t+5RUw0wzVROv
         1ZEfOnjIupqwZSdol4lofap+EEOSEMC3Krp5eDmBaNMlMikcENkxrfVp0EuqlUXS1cw3
         wTL00BsB9bXGTbRteSyStdVMZzZHe9uts7avPiB19wGh4CssyXRItqD36gB9tXb1dnAp
         vLymJNhynx9XB67Irvi9/5x4wR0TvbziMtKHnuRjyW8UFBFGoxKOR4uLgy8eqaPnZpIm
         /Eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135791; x=1789740591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxBJRgyuHY3W/iJApny4mLX1c4wnn/TYh39J8mu564M=;
        b=RYx4ArCz/kt5jGaxllKpNxfkq0LnIaLAWpWHK61DprzC2LJ4dEnrUAouRmWhmDdhhS
         xysCOQ2biscUWALWDxSRAtT8VFTtYB84y6CTO0GOZhPIgm3oyhzxEjORgBLVurPpM4qb
         HJOfuGlBrljsjmmfjSqzwcgm8LdW1JT26oOlRUDdcqOej7Je7bXT9RcRW9dVPf6C0q5z
         bd/t1NWH1snZ1VYXnqRkCPWITATQiTp19UI1nipRuMWSWQgGWuGNjmwvdgJU2ZJaCEat
         vOzPfQ/12fqK7y01QOIWLuNI1jMiQJE0PXZevtT9ohnBNMF8QFDf2+v8RIPphhJOG+rN
         cT0w==
X-Forwarded-Encrypted: i=1; AKwUvBxOMFmzHozwdSuTskCxT+IxjW65UeEskbTJtK4Rgqd4idLH/KPrh8ap/jptNPaZ9STch3ao5zshJD3X4GuZ/E0K@lists.infradead.org
X-Gm-Message-State: AFuF++kVdhrX+oyrUyVg7YIcizAmelVCsvkfiwGyZrpXj1S0yf0smndQ
	qnhrdJg9/yaVJF4oSN/BynjxndJlpKQ3OdlV3iIkVKGBSR1IiMjM5utC6SbYAGXQRS0=
X-Gm-Gg: AYBFou0lehvl+zSSqcGoF0DxfT5PJ9uukQF3DF7sPICFrVEn3fU/yhibwaoZD8GPEQk
	yLvjyUyOY3/Bx+ex9xOapkRNJ08NhIjWVpdTNZ6Z83thknERRaNIuNdWPevJDagolPe1MwaMSlH
	LFimyZ56NjhQxDxw69hZFa0/d8rSmSQAfJV9jEnaLHAjxDnmdKZ6PB97lJGkGvFQxqo3ck4QcJM
	0EbQ/yyefZxDvbgGhnkAMrlAcz/wFfIb0a823U+G8CcxHj8hQ8aIAKx4KHK4KplP9g4CwPMn8CU
	ujyzLwuuQX9xnDrHEq5HC8DJPf8gJyVWlIbZpXWxjTv+2QF4LfOmoxcJEWOzI4jmw7Z2DSC35Ws
	TGHcYx1K3yC6C1FOzu729NGr17x2KjEJ6mlNalvRdaQByPwR+1rQA03O75U+C1ppsFmxwfejetl
	JKbjT8MqcKiJhG7Arwx7tg933mlddM/6nol+U7axnVD6uSEPIUvdzm4rhK7gGF60PKzhD1BZsrx
	3WjM4GcJrNFwHCnFxgUSgVDGxywT8JaSoLXP5WP7z4ONq5zya+wurP7
X-Received: by 2002:a05:6214:5297:b0:912:bed:c40 with SMTP id 6a1803df08f44-91212116f69mr58502326d6.34.1789135790416;
        Fri, 11 Sep 2026 07:09:50 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f478bf1sm21734556d6.25.2026.09.11.07.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:09:48 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:40 +0000
Subject: [PATCH RFC v2 02/15] entry: Pass pt_regs to
 irqentry_exit_cond_resched()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-2-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135736; l=4149;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=lYdFz9QIpBbv18s7vNFL415owdJ/HvkbTUnKX5a6LVk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNLFUziLYUgokPYUCSvxyZJ4wGM33t0Exk3VASr1V813+Mcb6CwBQQCYTgKz4pDcXnm0a03w7j0
 ZSuWxmEEtwQ4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_070953_957539_6C99E92E 
X-CRM114-Status: GOOD (  14.69  )
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
 include/linux/irq-entry-common.h | 12 ++++++------
 kernel/entry/common.c            |  6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

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
index 8da571622000..fc04725ae46b 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -348,21 +348,21 @@ typedef struct irqentry_state {
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
@@ -467,7 +467,7 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
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


