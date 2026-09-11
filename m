Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B31C88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDcwMwF0CqD/SLUwt7lLP/Zeny+NN6n073A4kvHv5Ng=; b=qeXgHpjneUM2UKsErDqRZ7sD8k
	hbIN9x4AZdKqHcojvqnwnFjjECiVF2vHDPxdpygK6CYZjk2Oque1YlinEVC159XzY/citTu5EpL2X
	OD70UFJ1mvHT5+p4g0Sw4phVwzwWZQX9rtyk/Ad6EaIEEgO3Ac8X3cL8jVkF+g7KTrwLX9i26Mmsa
	Y2w84tdupJ7RjADbEiUUs8MLThMuPso6fItqW+B0+590M3xkFQ/fzY5CDUIJs2Oz/aXj8+O05CXOH
	GXtB/qmb++Kgo44AvvyQ6I5PlwG2Dz0vUhl2bplqdwGP8Tei6nGZ9husjuvsjAK78u47ytKTWiRpb
	aAqKJ3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51xq-0000000GrkN-10eR;
	Fri, 11 Sep 2026 14:10:50 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51xT-0000000GrW3-1mIy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:10:33 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-939109fafd7so84823785a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 07:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789135826; x=1789740626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDcwMwF0CqD/SLUwt7lLP/Zeny+NN6n073A4kvHv5Ng=;
        b=TfeJjphEXgvvIQnMoYL0xY9vhThJbyWuGgrIBx+co8e1XoMO+iIfFgOuDx34Et1vMM
         7IPtP2ZtO/rWFvmDH+N6pvinlPugxhQS8uRTZ5EMqssNANkGFBsX3pqEeyFYro47E2Um
         mDRPwv5dtw0EygMiaQ/iqjVb7uet0QvFTmNGBnxdyQ/vJ9Nxd9I45yUoT54NCqIWtJJs
         LiB6LF+uhksFuyZya7Mgzc8CgNGYNtmC9GBV7pGsOBDQtt9Ls+s4YiXYza+JKh5ZIZL1
         6SxW7a0s2q3FdEvnV/ugWcFLL1N46Avt9uX3/7kHxM+8/7nJW0yhLTmH0iZNg3nELnB2
         qX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135826; x=1789740626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDcwMwF0CqD/SLUwt7lLP/Zeny+NN6n073A4kvHv5Ng=;
        b=iMQj5Gi9ELwbr4K7kJEme9l0zkRTzxdcW0qdlf2E2ncWoJvwDvG7J+3HHD6pP4MADi
         vZvtT94wQClC38Bkf/LB4XO7YOKBWK3t+oaGPwCvapTBWE3sMMyi7F+dA4mufAemZZUN
         dF+51TL5Y4fitTFnKGhxC5a86ZMBRrCeoNdsKvycJp/S+H4qYFihWztQipTZRU5b1tMH
         6rMM7JlhMWPVOA7AWPNktG/uCWDwG3hIbe6X7bz8sOEhMHA2WDTolLRi4i8ve/pxqSvQ
         XgiwQ7ve0v3EFTJIRrYtoWSDZU/Po+wRE2T2iFkd36dZrzlzh8u0DGWHQ/nq2PitufRd
         mVeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCDHsb70PbaF9A9xM9aZttlJNq4/UihMy2VtqghGfl+DCA23cPZZtb92llJRWi1RxGkiZtK7CZ/NX5EBv/gGiG@lists.infradead.org
X-Gm-Message-State: AFuF++k8yFsSwYhEIXsuk5z9gg+oI+HzTJH7vd6KbhnOp7u/NmfjCu0C
	4M9mkYxPMCtyIcjw7MC+uAyTJBLkuAhigOxn74Df65HYDVYs4+IgThwtLKV6geZsipI=
X-Gm-Gg: AYBFou02dUQLDNeoSwEml3H29D91FvNgjfPKuySH6MvRIlOaw13aZh3/DPHkQT4iaPZ
	pEe8fQh1jWJEtdDY5KqmLDhyEyiIqaAhgnKazfX5kP1tra1VryjUytbhbUNMApy7xcBhOWydjRQ
	l5oESbeFWQ3sw7DVg+6BBwXZBJDDIOZm1QeyPidot+k9qDDpmdzgCiMvmFFTdNFMqGKTTDL9+RG
	0yaYpTyPNH4lJGoMq0DHYUNZqaxnNh6PvtMn5mZF8IWENdtSq63vZEAjc/yrCNAa2t2PKoaG8vY
	5h58SKH/6ZOq5x5kFGW7J9HbwvGi7c733oTMZXJf4Sg1vD/zsHXpcICE2LjwcarYSNo0fZCdJ+l
	5PAZlZwNOHtePKbh4UIg6lH7/v6YKaUtNSLz+gkLRA2zoXJvy/UeCbaNcvABTjrWihmly9ma0jL
	6VSlrj+YB3NtMDrbyxpZ0KeKQKw6+8JYXBZtotJ79SMzRXxRLkNEabBnXmHkaQQABBlR4h57Teq
	bVjVOyF9xZXYX6xaJrVbuqLhc+YUzmXnz2vhNJY+mjbtIewdnSoJfe7
X-Received: by 2002:a05:620a:2a01:b0:92e:6c15:24cd with SMTP id af79cd13be357-939ea096ac1mr525489385a.15.1789135826040;
        Fri, 11 Sep 2026 07:10:26 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939f19f94a1sm128350685a.42.2026.09.11.07.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:10:25 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:52 +0000
Subject: [PATCH RFC v2 14/15] rcu-tasks: Retire switched-out tasks with no
 trampoline nesting at scan time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-14-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135737; l=3915;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=CHfEJf4XyY3zn8RyomjOM2Uc3mVFT7MUycrwjg2RabY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCsPahyd7Oix02uJZsqv3hNKRWBYJbR9ZWsmEzIdYJha+M3Xp7J5xDeZFd/3etSxBmrSG0gewnR
 pnh9QNzgnXwY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_071028_183860_21560722 
X-CRM114-Status: GOOD (  17.95  )
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

The previous patch lets a task report its own quiescent state when it is
preempted with rcu_tramp_nesting == 0, but a task that was preempted
before the grace period started and simply has not run since is still
listed as a holdout until it next passes through __schedule().  As Paul
pointed out, the grace-period kthread can settle that case itself.

For a task that is switched out, task_call_func() pins it and
!task_curr() tells us it left the CPU through __schedule(), whose
locking orders its last rcu_tramp_nesting and rcu_tasks_irq_ip updates
before ours; a task preempted from irq exit inside trampoline text has
the count held non-zero across the switch by irqentry_preempt().  So a
pinned, not-running task with a zero count is neither in nor called
from a trampoline, and with rcu_tasks_irq_ip_holds() also clear (the
kprobe jump window, which can open after the task was switched out) it
is quiescent now, whether or not it ever runs again.  Check that in
rcu_tasks_pertask() so such tasks never become holdouts, and in
check_holdout_task() so they are retired on the next scan.

This is the only remote reader of the count, and it only reads it for a
pinned, switched-out task, so the trampoline-side increment and
decrement stay plain on every preemption model, PREEMPT_RT included.

Only under CONFIG_RCU_TASKS_PREEMPT_QS; other architectures are
unchanged.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/rcu/tasks.h | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index bab08a666dc0..ba432bd922e2 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1014,10 +1014,39 @@ static bool rcu_tasks_is_holdout(struct task_struct *t)
 	return true;
 }
 
+#ifdef CONFIG_RCU_TASKS_PREEMPT_QS
+/* task_call_func() callback: is @t switched out with no trampoline in play? */
+static int rcu_tasks_switched_out_clean(struct task_struct *t, void *arg)
+{
+	/*
+	 * With @t pinned, !task_curr() means it last left the CPU through
+	 * __schedule(), so its rcu_tramp_nesting and rcu_tasks_irq_ip are
+	 * stable and ordered before the rq lock we hold.  A task preempted
+	 * from irq exit inside trampoline text has the count held non-zero
+	 * across the switch by irqentry_preempt(), so zero here means neither
+	 * in nor called from a trampoline; rcu_tasks_irq_ip_holds() covers the
+	 * one case that can become true after the task was switched out (a
+	 * kprobe jump-optimization window).  Both clear: already quiescent,
+	 * whether or not it ever runs again.
+	 */
+	return !task_curr(t) && !READ_ONCE(t->rcu_tramp_nesting) &&
+	       !rcu_tasks_irq_ip_holds(t);
+}
+
+/* Is @t, right now, switched out somewhere that is a quiescent state? */
+static bool rcu_tasks_preempted_qs(struct task_struct *t)
+{
+	return task_call_func(t, rcu_tasks_switched_out_clean, NULL);
+}
+#else
+static bool rcu_tasks_preempted_qs(struct task_struct *t) { return false; }
+#endif
+
 /* Per-task initial processing. */
 static void rcu_tasks_pertask(struct task_struct *t, struct list_head *hop)
 {
-	if (t != current && rcu_tasks_is_holdout(t)) {
+	if (t != current && rcu_tasks_is_holdout(t) &&
+	    !rcu_tasks_preempted_qs(t)) {
 		get_task_struct(t);
 		t->rcu_tasks_nvcsw = READ_ONCE(t->nvcsw);
 		WRITE_ONCE(t->rcu_tasks_holdout, true);
@@ -1181,6 +1210,7 @@ static void check_holdout_task(struct task_struct *t,
 	if (!READ_ONCE(t->rcu_tasks_holdout) ||
 	    t->rcu_tasks_nvcsw != READ_ONCE(t->nvcsw) ||
 	    !rcu_tasks_is_holdout(t) ||
+	    rcu_tasks_preempted_qs(t) ||
 	    (IS_ENABLED(CONFIG_NO_HZ_FULL) &&
 	     !is_idle_task(t) && READ_ONCE(t->rcu_tasks_idle_cpu) >= 0)) {
 		WRITE_ONCE(t->rcu_tasks_holdout, false);

-- 
2.55.0


