Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4A6C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 02:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fr6kFLYx3hqPZHfOilkUN+oxGtJHBsVQ4xuLKdXd4To=; b=BG323h75Q0Sfr87v1lFi+AkImm
	2OuEAqoh1RqHqDW+koWlHMqXsYLAjEBqKFCFo42b/GkqSuMK9bdefy97S6CDplvA2P4sX9hiuupvm
	qhhfeUHEY8UB8obJP4KTaYQfBL3xuC0X7zaZ0v4UM3iGpMWewAnkMRxBDXd5uc6uxpjP8Fkh9sJsV
	VGh3nzskNMi7ZLgNKl35AlvYcdInx0nMEUgT6QVfb1r9Zu6p6N1JBcdcGRGAv6zb+Bx19QMfbNFSp
	gpSyjINZXppwFQwsljtPZuPEt6BPmiq/n9TbOT4emw0gJ57sPCZMroSPQdBp1DhyRKdaf/sI6ZHiC
	FZll/mAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qCO-00000003yAe-2eMI;
	Tue, 22 Sep 2026 02:25:36 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qCJ-00000003y9h-36be
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 02:25:35 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-912355b1bf6so13259456d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 19:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790043930; x=1790648730; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fr6kFLYx3hqPZHfOilkUN+oxGtJHBsVQ4xuLKdXd4To=;
        b=GaqT6M8s2qZzlhe7B88pMCVBMIN4wWuL/cjTUlX1Tl9mnJ4gIEUAfAyUB6eHVtBd1c
         zUlrhlOGyJ5crw9fDroX1eZ6c+lJvou05G3Cwt++cBH/o7GcKy/uvkH5LUNwhnxykoFj
         XkOeF8huJCXAxSwAhnGJ01IiUvx1NtU69HwYeDtgUoz2xIXAqUljg9UL5WnGQbqmSU1a
         iLYyrE+CHnEpK1D+RLtvRC7r9mNY0yCIcAoUkRGljIjc4vaBvlXa+l8IirsP05J9hQ0U
         DWlD8I8cf+AvTFt3cl8aeAbC1AUuI/fJbFRtNBN6tMBzZZm1glaiDh955RpH2tSlqkl7
         D+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790043930; x=1790648730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr6kFLYx3hqPZHfOilkUN+oxGtJHBsVQ4xuLKdXd4To=;
        b=YeEs3xXp7opDjbzZNkiVialBn3APNFYnA+NFpLZ71BmDVckBgQIU/CPZtSwGsKVCd+
         LUYsUl2yv00ZplnNZvUJCgwhAl9S2rczj1xkM27KRUJD/3FoPRix9CL7O6SsVv8s97/3
         HphLAxV/MCEh0M1IrpiGimJ+BgyGp1UXlOHWmdpTsCgknIGf/rZyH5ox9Rp2UhMG2k9i
         a3mORKEu77AVc3VPLnaja9LTtOgjAkJy+BOPg5uTQsWRxEqRkvOAP/rUE+A3RJSHilD/
         OXGBwcYKO6kLADI6SEalNm1FZDD6FhrVnZWTKx5iueokF016C/Tvt2WxPu5u9dx5TTZG
         eQqg==
X-Forwarded-Encrypted: i=1; AKwUvBwFZkqwJGCL5tb53g+VYEE90oqbfn3Wgq2UCYctbzB0/xVVuW1Ju9YG2Kt581Q0NyHDTiJwXIbIUVoestEPhSYk@lists.infradead.org
X-Gm-Message-State: AFuF++lF+SCsA9fsYkRQL5cGhJv9HVbEkQ1A7aIy9YW5N8CqHqOaUNm8
	FTYJ5B/Frr5UWBaXGh3lSmEcmG15lrk5K5O3dBfxCVjPBwskdupgPU6V4yzD9bgj7nY=
X-Gm-Gg: AYBFou2oak2jzEGs2GyOt2M9h9jInZBcgwYhWLWGrxTDDc3FdoWDaDIS1XRwaKe05t9
	fz5DtODbOwBVXAAtbbFgCdlNM9twN3c+WfYJ4WpJlSLSp4JWRnEqL7chteTz93U5fQ/Ijmjnn3W
	zc58tvP96jqusy90Yk2SpEq5J9M+j7JcFJvLvzhWgPwXnnKKzeAh0qGR10JXqTMoGsGdRTeqADw
	8DA/wVPBHzGv1YqmJbW9YXQ6DjTVYs1t4OpMiYO9cnmKPq/yOtqee7S/xgGXFK9vACp8Q88WYUF
	hDlA6R3r6V7vFtkAon42CudInQHyxDRgQzrImbptpwpHDUuNpS2HbeXCrY6Ic7qaLeUr9EB7qEN
	tlihm9LR0auHnkdpWCAbe3bsxsy/T47qd/J3gwTJ0xv+/5lH38tS3MaRm6Nps5G0U7Iz+t9OMTR
	qXezoy2VYUUqPYrfRMNvlKEghXu2LMtrKWMm4xKH4I7SdWnNQqFyILhusye85x6qav+RRJSetNS
	KHOnbHjmJOrzF4=
X-Received: by 2002:ad4:5d44:0:b0:911:2a7e:abbb with SMTP id 6a1803df08f44-913ff001c87mr26718046d6.14.1790043930382;
        Mon, 21 Sep 2026 19:25:30 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914025165e2sm4420596d6.46.2026.09.21.19.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:25:29 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 22 Sep 2026 02:23:20 +0000
Subject: [PATCH v5 01/13] entry: Pass pt_regs to
 irqentry_exit_cond_resched()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-b4-rcu-tasks-preempt-qs-v5-1-410f57770bad@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1790043820; l=4297;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=vAWpKfoMcBcYFQiIgPpQZt2gAuw45VdrXu4vr32WnR0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCPeuFAp5uVxV2kH2vDDmkA4ssSDw+6kXcs/1v8hvtFa+fEUwj418WQRUH5jUvQqcwsIafENDDP
 8QcAKkovgmQk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_192534_074659_94624291 
X-CRM114-Status: GOOD (  15.16  )
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


