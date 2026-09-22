Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86A3C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 02:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vixDe7y/8fdtCmwAQ+Tlt/gsuGiEiA9j8JVU0h22FWI=; b=BKPnVxRh5n1MMfInJ7MOA+1Qfd
	WXWVy2sdCaf6g9aYPVzkUV9cCO1+peANDn90Xye8jqp+bTdD5z7yFWt2qkk3ab0uKqFZZPWhxlgrS
	3evUGJw79o8C5vEDcBWeC+5zatfdAUunvA+yEpsWKFtWPEJVtWxSlWX0lhKN5jr8EhEtihYcmxb25
	UXXBWo78brkYKebP3K4yQiknJzgPQx1HE2mHk1GDdPe2sTiTvj/Cc+l/Kp/ZY3bhJbtyW1KntHUbo
	CBYHsI2i23JsjUbk+YUqmZiJugFk2NZegax4J+3Jch38NtHXC5en8KRKZYgPwZPCdx7UxIh7E9ptq
	pJ1ACsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qKj-00000003zuU-0bGc;
	Tue, 22 Sep 2026 02:34:13 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qKf-00000003ztW-260k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 02:34:10 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfcbe208so43759446d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 19:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790044448; x=1790649248; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vixDe7y/8fdtCmwAQ+Tlt/gsuGiEiA9j8JVU0h22FWI=;
        b=Z9EooiS+036S7cQ46CByINk2MzygF7eKbQrhDoV2NB01DRffZcc2NlondpV+cTf5ok
         ZSMeyej9lneYyydsJMFVvxbu69YqQF4cYyEL+gs0447WxNEkzptZaaDNh0gmZm009Mzj
         WyumbVsAS/SKriQF1g9/Wqc7MYngI3R06s41cITK7M36RbDrxTyOdAPc5JTKov9PLnE/
         5bZD6YkfCJe0w+OJm724esIgG1RW9PNWtDu/KUTDPPhPJ+5D0Q+eUNU7QGJdm1Ptr44Y
         mJ/XiZ6M5fF1iucIBGjvnu0kKggjCV2i5+/JHPLC6Np72q8RXdSLpS6ZbRvyijs1Ukpc
         l2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044448; x=1790649248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vixDe7y/8fdtCmwAQ+Tlt/gsuGiEiA9j8JVU0h22FWI=;
        b=H8dcTeRrClI8qoM8OWaGWflZ64uGGULovOGfg3qzhO37WGwp3J11H9TuNg4G/oc//r
         4sO8wMFNCdR6jg2eDKGcg+6GAZ0Wg4Q4fZuim1NmcfCtMjId2GrWHLpXeY8MbrlBN/U+
         wxikaIuwdUcz/gZkurRDWx4l7yo0xZwfOXGjvtSP38fXa+O46gXYqIhUQO+2Pm4Smyiq
         7xcF4JQPMem4dphjNf1UqDQQ7HBaX35am0OLuSNsAyssa3g5HYsiKCCCczDb2ou8mk0E
         /6vlG5znB/ZuZVlUKgBTix41HicMKgUrrBoJFlI0eeyDyesYMKdSyHHhvVl6IRm8EsQ8
         IJQA==
X-Forwarded-Encrypted: i=1; AKwUvBwq1u25PGQYKx1GbEHNXbF2LEoESpvONRkDpWPTQAvaMTGccfZNYemr4IW29bXoLdrRn9rjrbZfIXvNH1yuf6jV@lists.infradead.org
X-Gm-Message-State: AFuF++moh0fW7Ot0wX5BHpUeW3c8GHUBIXWJ1fk2seO1d3Kr0BJZLOaG
	2oMO8Q+ihKoyg65QccyujDB+liLq+CeMVjSuPa4EISOIMn9K+zxjCe62qbfznlN5vFs=
X-Gm-Gg: AYBFou0iGLRnX9uieOVyiW+lxeZvTDhMiZhSxpWJNQvTrWpX6tWeuRMheuOUjniX43H
	IsEFag+DxjJPNpsP+26mYsSbJt9k7hZgYJywsxRjwn9LjXbchQhf8GkBIx1KKeNprd2vWDH1s79
	ti82jJ/tak5YvMDvfKGtIpu349kJgO06HK2KXKGELI91+qzvM7bFR8dMURSoT+TTNqnC4Ja3aNf
	FBNXn1nlQAem/dI1jJSwL7a5bZnhoGqsJNlMFKCDur7qNfqscJwAiSCFeaL/uBBftxXbkYghdFE
	JdW3/hKXT/TuKt19haHxCH4D1GW133t1AW1fNkJyrMGBSF5wWiyseqmi8ATC9aCdO11IEhkY54y
	eIKK6LRaWFdSerNFt6bxz0RFEc8LQpASj0FZA8z79s+ZUbhB04+NAwtmppuye/eHSMPyCS7rJ43
	AgLg/Otj9alitIvWqS0C67huxAhPin6HaQdhfh0Umdum7bqK+u6RlajKdwIyEh6BVh1z55xyX1y
	vPDkO99z1HwHE8=
X-Received: by 2002:a05:6214:1304:b0:90e:9875:b48c with SMTP id 6a1803df08f44-913fc8b1f2dmr34711036d6.12.1790044448184;
        Mon, 21 Sep 2026 19:34:08 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140250b82asm4582396d6.39.2026.09.21.19.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:34:07 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 22 Sep 2026 02:23:31 +0000
Subject: [PATCH v5 12/13] rcu-tasks-trace: Assert no reader is held on
 return to userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-b4-rcu-tasks-preempt-qs-v5-12-410f57770bad@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1790043820; l=2581;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=EMsOGg9VRxBcocei3P3dGUkU8foVu6cO35v23va9IOs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLzeLb/2gtbRDPx3ssZtnGVRsANVTMmhDuPYTamLR1rD3jjMOpYIakVJmblm2P6SqGgYyithDIa
 ERiWg9/irxQs=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_193409_553075_42E7E93A 
X-CRM114-Status: GOOD (  13.64  )
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

With trampolines now taking rcu_read_lock_trace() open-coded from
assembly and JIT-emitted code, an unbalanced reader would silently
turn every later Tasks Trace grace period on that task into a stall.
No task can legitimately reach userspace with current->trc_reader_nesting
non-zero, so under CONFIG_PROVE_RCU check it in the generic entry
code's return-to-user validation, next to the existing kmap and lockdep
assertions.  Compiles away otherwise.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/irq-entry-common.h | 2 ++
 include/linux/rcupdate_trace.h   | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index e19b41ee6b18..d42568a488a7 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -5,6 +5,7 @@
 #include <linux/context_tracking.h>
 #include <linux/hrtimer_rearm.h>
 #include <linux/kmsan.h>
+#include <linux/rcupdate_trace.h>
 #include <linux/rseq_entry.h>
 #include <linux/static_call_types.h>
 #include <linux/syscalls.h>
@@ -214,6 +215,7 @@ static __always_inline void __exit_to_user_mode_validate(void)
 {
 	/* Ensure that kernel state is sane for a return to userspace */
 	kmap_assert_nomap();
+	rcu_tasks_trace_assert_idle();
 	lockdep_assert_irqs_disabled();
 	lockdep_sys_exit();
 }
diff --git a/include/linux/rcupdate_trace.h b/include/linux/rcupdate_trace.h
index dcdb11643496..9eb7f92c710b 100644
--- a/include/linux/rcupdate_trace.h
+++ b/include/linux/rcupdate_trace.h
@@ -217,6 +217,12 @@ unsigned long rcu_tasks_trace_batches_completed(void);
 // Placeholders to enable stepwise transition.
 void __init rcu_tasks_trace_suppress_unused(void);
 
+/* A task must never reach userspace inside an rcu_read_lock_trace() reader. */
+static inline void rcu_tasks_trace_assert_idle(void)
+{
+	WARN_ON_ONCE(IS_ENABLED(CONFIG_PROVE_RCU) && READ_ONCE(current->trc_reader_nesting));
+}
+
 #else
 static inline unsigned long rcu_tasks_trace_batches_completed(void) { return 0; }
 /*
@@ -226,6 +232,7 @@ static inline unsigned long rcu_tasks_trace_batches_completed(void) { return 0;
 static inline void call_rcu_tasks_trace(struct rcu_head *rhp, rcu_callback_t func) { BUG(); }
 static inline void rcu_read_lock_trace(void) { BUG(); }
 static inline void rcu_read_unlock_trace(void) { BUG(); }
+static inline void rcu_tasks_trace_assert_idle(void) { }
 #endif /* #ifdef CONFIG_TASKS_TRACE_RCU */
 
 DEFINE_LOCK_GUARD_0(rcu_tasks_trace,

-- 
2.55.0


