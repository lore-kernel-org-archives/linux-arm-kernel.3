Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB00C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrCxqh0lkRJGK/msNx4sQvIno2OGGDXwsMjyZ+inPRg=; b=Xi/kQCdE1ZEXZ8KzEKj1svn7Ve
	i74QAp0FJ79jg/P0wylEzVdMwo+1j7rYPiZc66CN51DObO0sVKhxMyhLGOgra5O62JmaQT/Brg8Tz
	Cyc8Ba3SbaqWHcgOzz0+s2fCX8qyswrHy29tgqmmEyN7KbImz2hg/relRLa4LgqZkAFr99znVZTCM
	UtyxHr6nb5bv6JKvXtoGfuT26HOk0J9/gbIzSszKYvkaMzJk8l2naiHuhJZvRIwsN3dWxbNMDo33o
	eAZo/41i/Kfy2drvk04Rt7PYv3iy5VKEuf3EoAd1vhtb8qpLT+KfhKHHjd5UNtKhb4qwMtTF49N8h
	MzzaA3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51xq-0000000Grl4-1psa;
	Fri, 11 Sep 2026 14:10:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51xm-0000000Grg8-2ucD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Sep 2026 14:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qrCxqh0lkRJGK/msNx4sQvIno2OGGDXwsMjyZ+inPRg=; b=Ne2FzI+SJpvcE8Aow57N9IyG6z
	z+0uBJ1AS8ElGjdsV+7HLIOIQyWJDzaFJtFbXngijGpBVAwNpshPZrcmObe/cVmR5SlqNd57fiHZr
	5YfRFrVYJ7pWnupcviDRbwzCwJ65uMG/hrWu3Xl2xSv/vkBpJlQaXPlTeWFqN1S72JwYB4ICr2O1X
	qrk6mme7/cgPtTW0igQLNFeQo70wo3Aq9OnetHVnAEiuTiRr1InrBuFdXhnzvFl/Tr41M0ByBv+Ac
	AFENWqCaxpBYgzuoPVRyOCPzgTXIT0lWfy49/ZX7SVdOI8lMcgXhEJani30yinNhoOw9A7oprQk+X
	nTVyXANw==;
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x51xj-00000003euZ-35vh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:10:45 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-530280b8234so3701191cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 07:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789135842; x=1789740642; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrCxqh0lkRJGK/msNx4sQvIno2OGGDXwsMjyZ+inPRg=;
        b=R+9TOV9ZlG/n6AE0WiL2Vr+p0Vnq1bt3PYExOEKAnvze4g7hAPcn49qK2cE/NLRvQs
         NPUMJhVD0HU8yhYOSJUjAeEJOV8A7GQYJdO6LfVhWvUxNQZXJ5iiq4ktxgjtFXqzNsse
         8c4BLMiWZm+5Z0MTRgyqknETI/HeQ/lWq7zoc2vWTAEIut8wZr8gNPP5Bb/3D/jrF2XI
         5bJ77f44fM/qLflXi6A2c7+QfV7m/jU0wXoKo9F8zWYODyKPr+PtGGiGeFnC+zTOSGyj
         rfFJ5VWIdDpoV2iEitA14gjD/IK3AyNXKUyp1SkA3dn5p4qZcYj3LpCBDdN++vZwZWFs
         5pcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135842; x=1789740642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qrCxqh0lkRJGK/msNx4sQvIno2OGGDXwsMjyZ+inPRg=;
        b=EebIta1qfmss/RjbYZjqf0qb9VvRzdAGTeqfk2D/AnGhhX5F+RK6FdEFDc/Geu4zz7
         efC7gnGRu2hhmQl7iaqAkWky05YSESK2s84waU9aHc91g9ZakzO8UUtFwv/Bah0CQCxY
         jO5xIJ0xl91nNDxlaEVLbTNTteB3XZEhFq/WU7mms5D9PLmKziDPPJ8/ZxgriQ5qbe5P
         nMnvZlLamf0v7Dvc+XFiM/xN9vme0MSoT7pEmVeFiu+jIQr121nzlXpoxgJq4g0GyA0r
         y925kFH9uSLqWYw+jcAN/kxFMuZGa5zYd0bYLfYANktQx9W6WzBcGyk+qD8ElaHUuIat
         gSRw==
X-Forwarded-Encrypted: i=1; AKwUvByD1DNLiN7ywTowz5ROx7N8jtD/J6yb3uQ/dz4ZEFxRQyZq8mu4/19d74DtMKf8St0g/FTl8+9aRRDYUn8IJKBu@lists.infradead.org
X-Gm-Message-State: AFuF++k3BVSX8XwR2abXGcqunjEBF7pfgBZzbzQYnf8Si1X1yyh613lf
	M6BThQ46HV/OGCKHfoyn8gPn4I8nJYiiQsYCHJRb5O7dYCFNG9I6aJcTzPkbtmabggQ=
X-Gm-Gg: AYBFou3gBKgRhZnzFarVfFaSLQEiUVNxFktoZnN2jP9G79OmGnBuQ2qe3KGWOb7UwXg
	pi/bRIj0XsNa1VuOzoS1KrnjmnXtWduwlFryZzJSWJilEakEZhKtPn3qqPzcjL68OL918EI1i1G
	Uqda0MS38rAa8jyE4uYsQM3U3fvnXDS5bRpRceQT21oRR6oU3wd5RY4MynGo8z31Dlz2rbttUXF
	2jsfJlsLW7YihNeHs3JnuMjO79wARczNzA7Hwf0RBHc4rWgw7kgtaUgi+s46cqxYARShA2lKfhk
	ghzDwE1LgZieBykgjCdzZlZ3da2PTOOI7/rlVFnhT63gHnEMeqJ4j/a6BOj6/mEX4mutf0bUVih
	Tw2GNm9IQwC7CEJitje+EQxcIbzu8tdDBWogu/P4Ef/y+tr+Yzx9ZmDrhgunw/y54hrhmfygj6C
	oY3VSmDcrP3jHKOdjC4YCTKQxayjlk0sw7fQoiMWKJEJu8Ql6aG+VrO3RPwyOP/HtALukXQ+xNX
	u3gv5hfg+JJPHrX2iN8tRANEI3HqrmhsBec/ZW8wd0v10Gc6FXow62p
X-Received: by 2002:a05:622a:53c5:b0:51c:b98c:f772 with SMTP id d75a77b69052e-530c86f6195mr51379741cf.15.1789135827987;
        Fri, 11 Sep 2026 07:10:27 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca460a32sm20960711cf.9.2026.09.11.07.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:10:27 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:53 +0000
Subject: [PATCH RFC v2 15/15] rcu-tasks: Kick running holdouts through the
 scheduler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-15-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135737; l=1790;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=K9+ZKIgsGRgsc959M4tS0rMKOB/eZlOXTQ8Ho0gK2m4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFxu9w6oKo935Kq6bYpzSj4sd/pud6qAfpTImYrmpDnci7BPIoYh09XWotebu7q/uE6z/VGg6k/
 nk0bYtqCcqAg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_151043_852155_1ED91239 
X-CRM114-Status: GOOD (  12.63  )
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

A holdout that is running on a CPU with nothing else runnable is only
preempted if the tick acts on rcu_request_urgent_qs_task()'s flag, and
there may be no tick.  Now that a preemption outside a trampoline is a
quiescent state, have check_holdout_task() call resched_cpu() on a
running holdout as well, so the scheduler IPIs it and it goes through
__schedule() and reports (or, if it is inside a trampoline, does not
report) its own state with purely local ordering.  Nothing reads a
running task's rcu_tramp_nesting remotely.

Only under CONFIG_RCU_TASKS_PREEMPT_QS; other architectures are
unchanged.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/rcu/tasks.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index ba432bd922e2..02d2592ab7a3 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1038,8 +1038,18 @@ static bool rcu_tasks_preempted_qs(struct task_struct *t)
 {
 	return task_call_func(t, rcu_tasks_switched_out_clean, NULL);
 }
+
+/* Make a running holdout pass through __schedule() soon, tick or no tick. */
+static void rcu_tasks_kick_running(struct task_struct *t)
+{
+	int cpu = task_cpu(t);
+
+	if (task_curr(t) && cpu_online(cpu))
+		resched_cpu(cpu);
+}
 #else
 static bool rcu_tasks_preempted_qs(struct task_struct *t) { return false; }
+static void rcu_tasks_kick_running(struct task_struct *t) { }
 #endif
 
 /* Per-task initial processing. */
@@ -1219,6 +1229,7 @@ static void check_holdout_task(struct task_struct *t,
 		return;
 	}
 	rcu_request_urgent_qs_task(t);
+	rcu_tasks_kick_running(t);
 	if (!needreport)
 		return;
 	if (*firstreport) {

-- 
2.55.0


