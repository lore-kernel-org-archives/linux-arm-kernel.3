Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AE5CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 17:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIjCkz8UNvA2qIG9dz45tzUD6Rja3Nkqz84a93dGRfU=; b=SNH23Uurh3NkNo+HWQfFpAuBBe
	Wgm0VGhhGnuKItJmiPEWU1i/NMJs4CbmRIbiXI6pEGI+MmiQXmOYRY/dc+BDwx9wCTKpEb8MfkMqP
	Xk8tKZKEc4r/KdEnNtjIzzaNRycbCzODI5PGZoSMn5rPZQ9k7h3XJCPXzmV1lSox4gFsh3Wpw322Y
	YlEhvHBsaf8viNmQkv6yUuE9oTuD+CHF1GDvMLZE8R2vnyz+OBILL7d7BHneqK09DnliSx2JKR/jA
	l1lpTbJkl6rhtZvuu4tpquteEI8dgzFm6VY3XPcOow5ZrMDUmgqRb+RZ85dyofA6F43HjdIw4IWC+
	7MPTklGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbRy-00000004AA5-0mKc;
	Tue, 29 Sep 2026 17:17:06 +0000
Received: from mail-yx2-x0d.google.com ([2607:f8b0:4864:41::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbRw-00000004A96-1ZTD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 17:17:05 +0000
Received: by mail-yx2-x0d.google.com with SMTP id 00721157ae682-8a860e532eeso40438467b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 10:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790702222; x=1791307022; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIjCkz8UNvA2qIG9dz45tzUD6Rja3Nkqz84a93dGRfU=;
        b=DvKnGZ/AQlCYKvJgjBFM2l3gdp4qjQ6ztNrAzQ2gclw7KCzbvwf5pOXJElVc9SYlP7
         WZ35kt3WY+9fRi1q8qh9f7IxvKPRr+WG7dWFsyVnqLUtD+DAL7J/bB64Kb7Uxrs//MVm
         DTKUruzi0CGAp0i7GvHCYd/MifNws59juD6L1ZhIXNox5ptOA4/8zrwVyezawlp3bwyq
         3XJgrcxMKSzg+i1KYI5pkXO9bf4VYHs3ejzbgaHc5gkMpYmgnZseiSQ51NmymWksKo0p
         svgf2/ut0hxRpma29/Fhp6ClY5ONDM6NEanmXQRXq0RxIkbWKoMorMQgeqAnc7zF7SXI
         mcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702222; x=1791307022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIjCkz8UNvA2qIG9dz45tzUD6Rja3Nkqz84a93dGRfU=;
        b=F8u9Y9lb79PXV6ibP8MWggJh0heosMpEJ3b8PD7uYgd1jpbopSh7Yk/zzBcx8E48ix
         GrK0IKnuWKqc8dA11UoE6MqJA+Xr7yUKwUrxoiYhJ/0CjlMCpf87XbitAjIXRDL3CSNq
         2fW5phxeAZLgdCHIVk5zmdI1cE/SAV894GmasuyC3MYBX5Y7TwmCOaOO9l1yjxMIARLD
         jJu6ZmSaXJNmhhZFFscdrJQbk+1xLXLooeOSgg6/qxGatXn/Bd7mutW5e5YSfb87F/Fw
         m0tqfYj1IWinxvaCDtY+ryZdNx9QDlVcOcIAdid4pv+tib9Gyfth72XXV75Xs5qfPoRd
         QIQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNlyKfO656Y4Xa9jx1OmDZkVgOWXD9U+fNrNHWcJi2E7JSQkee/mDs1P7zhT986WXCf40DRKxqHQkRIPUbHZaY@lists.infradead.org
X-Gm-Message-State: AFq9FYLxnWh3bYyMrtO0KIgDCdHhJtZseoUFkbrHPb78vfDwWBaevkvg
	zdlxxfBp/NV+iL1UeZOKrRFLnQ69tsmTG+r3oba1OKGc5pVa1hh9+MJSKqbJmD5vGbI=
X-Gm-Gg: AYBFou2X7Fxy0RFlFuGfgYQqcKrKlC5bzTFU2ThzCqhprEKBknFHNFADYNhsMK0kkPM
	4GW8tVgWosRzBNBcd+vCS+ijFHoZRaO4XmeThWihb/62wDOJcZFxnba6ncQScyIP1dd3JOxhXeA
	OwDRoPMvExJcbtup58PyDHm4X5w3fygO1byHisKy64eNMRkIDv4Zer9ygThZKiF+1zZ/K0WVhYr
	5CwWZAo9KsHsrOgFFKBaOIQAzxAogqeC2Fy55KcOr+fFtasVfDMbjhxh+HeQjVRmz7w5UDjSx5j
	3R2Oc//1bnZbrp/8fXs/OMaTT7HH7mHyIBSyl+H6S4h+B3spABakdy7vBC90qTdesbZdpELi/+o
	9bDCSuiH6Tjq+E7xDf8mJdUDejQZMLqiW09tlLwGJhZz7gYaecJ+RDzYQKQ5SS4c17kuHfirwKQ
	E7FL9ufmn5I9kNcCBKGQX/MfasGWkxOvNX0AecfNV8IA6festbz45Ou6gEhiKpYUlhQvabWgMaz
	EmorWjK6J4IRHU=
X-Received: by 2002:a05:690c:85:b0:877:6e47:19ab with SMTP id 00721157ae682-8a6464b0faemr71025527b3.30.1790702222256;
        Tue, 29 Sep 2026 10:17:02 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f54529asm16493985a.37.2026.09.29.10.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:17:01 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 29 Sep 2026 17:07:30 +0000
Subject: [PATCH v6 13/14] rcu-tasks-trace: Assert no reader is held on
 return to userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rcu-tasks-preempt-qs-v6-13-c111ee02caca@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1790701682; l=2562;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=9eonOuXlSQQB3Y2602KC+0v/4Sir9GpsZC1qHWJlG3E=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGoTKCIpQWSPmmHIgYeGWzOz9qPWtP0J1Kgb5uyXWGZow9k+9qCcB70+Tvs9+2GkLFx/pkl6RW8
 XzN5ugLYM/Aw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_101704_424903_5F72D8AA 
X-CRM114-Status: GOOD (  13.78  )
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
index e19b41ee6b18..bfcfa2ee9498 100644
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
+	rcu_tasks_trace_assert_not_held();
 	lockdep_assert_irqs_disabled();
 	lockdep_sys_exit();
 }
diff --git a/include/linux/rcupdate_trace.h b/include/linux/rcupdate_trace.h
index dcdb11643496..fed84052bce2 100644
--- a/include/linux/rcupdate_trace.h
+++ b/include/linux/rcupdate_trace.h
@@ -214,6 +214,12 @@ static inline void rcu_tasks_trace_expedite_current(void)
 
 unsigned long rcu_tasks_trace_batches_completed(void);
 
+/* A task must never reach userspace inside an rcu_read_lock_trace() reader. */
+static inline void rcu_tasks_trace_assert_not_held(void)
+{
+	WARN_ON_ONCE(IS_ENABLED(CONFIG_PROVE_RCU) && READ_ONCE(current->trc_reader_nesting));
+}
+
 // Placeholders to enable stepwise transition.
 void __init rcu_tasks_trace_suppress_unused(void);
 
@@ -226,6 +232,7 @@ static inline unsigned long rcu_tasks_trace_batches_completed(void) { return 0;
 static inline void call_rcu_tasks_trace(struct rcu_head *rhp, rcu_callback_t func) { BUG(); }
 static inline void rcu_read_lock_trace(void) { BUG(); }
 static inline void rcu_read_unlock_trace(void) { BUG(); }
+static inline void rcu_tasks_trace_assert_not_held(void) { }
 #endif /* #ifdef CONFIG_TASKS_TRACE_RCU */
 
 DEFINE_LOCK_GUARD_0(rcu_tasks_trace,

-- 
2.55.0


