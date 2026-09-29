Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC60CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 17:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkP56mJgKixcgLXoBxrfzz0NyJo14L+hjKFrNfKE/2k=; b=K0exDsQfN2Lvutex5f6xN21QJe
	uAuypoqheK0esIvoOSY8uy84FkVC8OLjyFAcRMRe52C4IiqnB2FZ4eQoK1ZHU6sn81fTuhiucxPYd
	H4X7fOx5I7KYny7cNnqAsJG20e5PvUCtix9pqOlGgyPXnbVYC+trHyi6P2uOzWMcph7L63QxLXQr6
	0m2rMLAYpqP/9A5tz7HNQGGQd2Q3Bo/R2pifoUaeL3wWsVs4YYdpAQuhxv36TXhBZ/iu0qXQMkpq3
	vLgM6BcckP63B6Midt+0ZlaITBe0j+BY08whHlVnLq5XvjmJymgWZNBhQB41pWG4ny9BwKNlcPtsO
	Oq/uvZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbRJ-00000004A1p-49bg;
	Tue, 29 Sep 2026 17:16:25 +0000
Received: from mail-qv2-x0f.google.com ([2607:f8b0:4864:33::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbRH-00000004A1A-3ddx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 17:16:24 +0000
Received: by mail-qv2-x0f.google.com with SMTP id 6a1803df08f44-914446005e8so34586886d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 10:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790702183; x=1791306983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkP56mJgKixcgLXoBxrfzz0NyJo14L+hjKFrNfKE/2k=;
        b=okH7qB+vsjIrJqqhENfSIvG1wpt1FA/C7JLlBgDuETz17YUijSNvGaxwmOkfeqwORx
         /VuZgWjcgS9oIgreIxuH3IfGrAxDh/VjLBSKG9CvXea+ds0dXsrysom7742fAlgelaYP
         Z8QFLkI7ncNLzvoSHuJjEERkiyYVzydUAOvHPagSA5yfFo1eKB0PQuTEYMirgbulYBvZ
         ltyyOdxdN9n8aNaSDeDyJgjN0r578VJYdz2oGENdhGKxEBDyT7Yhfprvv5dGPGCP/ME7
         sVk9TvJZcRdl2YDuuu7WyyzmCMYGkmjITQy829bkK0XzAuSyDDV1InSOeC8DxW5XbYzF
         ARWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702183; x=1791306983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MkP56mJgKixcgLXoBxrfzz0NyJo14L+hjKFrNfKE/2k=;
        b=SAOqnl+/sv/PDfrzHflf57sHaZdGY2i9F6Z1D8LvhMx9j9YKzEH4jMcn7XxyqQKVGL
         vaa3foZhuycYOrkcgHVtWRkMlkJlJ76fZU5HJVg3cVHIsExJhPL0Bdg0OZvOQalVSJUq
         KWsKk8qEgS91Fvd+H+nZc8W91txPNLGr/cmonjwfx86zr1MHR8Csaur3w3eQ15D3WO4l
         wclvODILTaRGRZT7S/hcJM7a882sCrUbwhsKajHwB8GUA4oICexI/z4hi5UqDK4lgmju
         HsfiA1B9HBf/dJ+i953q16VIdx4lqc7iIZNws0B2334WuZmn87gEOfvDa0xidOS7dKvI
         cr+Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0LR4f5BTSr/8wo/LL0Bv0yDu0MlCBFEJ1E3NlM7ua+VlFFoIiy1ahnm0qoTHjzp1xXqjLk9nvMmGq1w6UCzLT@lists.infradead.org
X-Gm-Message-State: AFuF++nHC1jTbk7NgpKpHSX0VRZG19L/OUssK/U29XFrWzKXwcEMJfxr
	BZu0NUM3XM450xboabZjR627N7l5YAwXLiH+o2eLtLB2+o2Ha7lSzvG1C+iaGkENEWQ=
X-Gm-Gg: AYBFou2MswjxSDYAdj9M6jMPqhV3jaxMarvoYapnMkD9MqN9Dia2jN79k0nTfqZDtsP
	IVOpvod8Bats8uZqdzJvkTbMw6EkiCCTy76jbettaTkWLD0QZCUm04YH7Yw3xfDTXj4qtKNnJxj
	exPUWX5bABfLIF6r9fqbtOhZRrEXkFc7aOOuytHEAqp8sX4q1ZIOQz//QTyfUCfu6wPYIzLYV78
	vQ791jVDNM4oHNwZPp+FrBiQmemQ3+qVSJ2NxGauM6aydlw7yUhdzA+IMyYVCgsTqw2/f95AkzV
	YRgcNiHQ9e+ByQjld1sLdFw34I7p+7m+gk/DDNgmB1/KKjQQMVne/ukHE6XvwriXagpX7XJfVYy
	2pe70aTH1NMj/Jjy3JV6At/+i7CZK6PvXOo/yfIZBGyxW+Ofkh4ttw+9mIUBtYfqqST02hrGP31
	dYxUli6zxdHGtkQfy6Q95zolKHozSbpN8N6x/pMdR45qypbilGB55m6a9yU78KmXRzqG9DAq76s
	l5pDbp7PvGSHQ8=
X-Received: by 2002:ad4:4ea3:0:b0:917:8c86:6608 with SMTP id 6a1803df08f44-9178c8685e3mr38720066d6.42.1790702182375;
        Tue, 29 Sep 2026 10:16:22 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917981f5c18sm546196d6.0.2026.09.29.10.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:16:21 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 29 Sep 2026 17:07:29 +0000
Subject: [PATCH v6 12/14] rcutorture: Make Tasks RCU readers Tasks Trace
 readers where required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rcu-tasks-preempt-qs-v6-12-c111ee02caca@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1790701682; l=1716;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=O8YdW4YSHUYyF3GwEQN16WzJM7UkZZFfh8RzVwv7xJM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QG3jQwCkEzXVFZFj5OJPsasIxdbQv9M/HHEGtLd8yZhbdChJa1bb33IuFQ5NDeb24Kaa8oYTn7u
 N5DM7Y1DOQA0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_101623_915754_F451A60A 
X-CRM114-Status: GOOD (  14.32  )
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

rcutorture's "tasks" flavor has empty readlock/readunlock hooks because
a classic Tasks RCU reader is simply code that does not block.  Under
CONFIG_TASKS_RCU_TRAMPOLINE_READERS a preemption outside trampoline text
is also a quiescent state, and the thing real readers (trampolines) do
to stay protected across their call-outs is take rcu_read_lock_trace(),
so have the torture readers do the same there.  Otherwise a preempted
torture reader would rightly be treated as quiescent and the test would
report false-positive too-short grace periods.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/rcu/rcutorture.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 794937e13e7c..ab870ef09af0 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1142,13 +1142,23 @@ static struct rcu_torture_ops trivial_preempt_ops = {
  * Definitions for RCU-tasks torture testing.
  */
 
+/*
+ * A classic Tasks RCU reader is any stretch of kernel code that does not
+ * voluntarily block.  With CONFIG_TASKS_RCU_TRAMPOLINE_READERS a preemption
+ * outside trampoline text also ends it, and what a trampoline does to stay
+ * protected across its call-out is take a Tasks Trace reader, so model that.
+ */
 static int tasks_torture_read_lock(void)
 {
+	if (IS_ENABLED(CONFIG_TASKS_RCU_TRAMPOLINE_READERS))
+		rcu_read_lock_trace();
 	return 0;
 }
 
 static void tasks_torture_read_unlock(int idx)
 {
+	if (IS_ENABLED(CONFIG_TASKS_RCU_TRAMPOLINE_READERS))
+		rcu_read_unlock_trace();
 }
 
 static void rcu_tasks_torture_deferred_free(struct rcu_torture *p)

-- 
2.55.0


