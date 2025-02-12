Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8587DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 05:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1ldq/teHo/QBZY6cIiNd8wg81nHlAQXLen7eInilfM=; b=e2CGwibgzTgaSjzsh006NQPFUO
	HQgO3bLXBy/7GelXD3w79UzbpxFvjyfZ3+abqp5h9zYr7Fx/JI2oaZ9FjF8oe9EC8Bpcj0/qmQn0O
	SfPMyP7te/uL1kjrT1n/erGTczlDrxMYTLegO57uwMTTdwJzv6ULE4Pe3nzGcVrAwfj+/3gNrZB2i
	uD1PXJyvokYDOs3IOgVgsZf9IASFpR92FxidUSHYQgXZ1e6sEnOIQfv9jk+5SqcaO+KSFmt/C/eOS
	fEyLuEdQQuEI/DSnFCksrfLKn3N8Nx0zJJNIcog6Zg3HhNNKcGzrOrDFr7v1lztOzKU7PVZncIofh
	7BhDbTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti5SR-00000006GTK-3Tjb;
	Wed, 12 Feb 2025 05:38:47 +0000
Received: from smtp-fw-80008.amazon.com ([99.78.197.219])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti5Qx-00000006GBc-2K7K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 05:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1739338635; x=1770874635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N1ldq/teHo/QBZY6cIiNd8wg81nHlAQXLen7eInilfM=;
  b=K8ADPigKWD5utUe0I8ExGRtIR7GDRwhPZRKWiS1lDNrgIrOLT3zlcKkt
   FeB/qwKaMvQdrZ0U8Ve/z4q6wzNsc6dNVvlYfbeidZR00MwHfIS++4E1C
   Dq9P0RYOLosvn0nBuT1/PZmiBr+TU0r38/fgR8BTyOiUQsAkTh9/cROdJ
   s=;
X-IronPort-AV: E=Sophos;i="6.13,279,1732579200"; 
   d="scan'208";a="168935605"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 05:37:13 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:32783]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.25.59:2525] with esmtp (Farcaster)
 id c69e62f5-4918-4895-af0d-a33eddd4d416; Wed, 12 Feb 2025 05:37:13 +0000 (UTC)
X-Farcaster-Flow-ID: c69e62f5-4918-4895-af0d-a33eddd4d416
Received: from EX19D016UWA004.ant.amazon.com (10.13.139.119) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 12 Feb 2025 05:37:13 +0000
Received: from 88665a51a6b2.amazon.com (10.106.179.55) by
 EX19D016UWA004.ant.amazon.com (10.13.139.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 12 Feb 2025 05:37:10 +0000
From: Cristian Prundeanu <cpru@amazon.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Cristian Prundeanu <cpru@amazon.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	"Ali Saidi" <alisaidi@amazon.com>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Geoff Blake <blakgeof@amazon.com>, Csaba Csoma
	<csabac@amazon.com>, Bjoern Doebel <doebel@amazon.com>, Gautham Shenoy
	<gautham.shenoy@amd.com>, Joseph Salisbury <joseph.salisbury@oracle.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>, Borislav Petkov
	<bp@alien8.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tip-commits@vger.kernel.org>,
	<x86@kernel.org>
Subject: [PATCH v2] [tip: sched/core] sched: Move PLACE_LAG and RUN_TO_PARITY to sysctl
Date: Tue, 11 Feb 2025 23:36:44 -0600
Message-ID: <20250212053644.14787-1-cpru@amazon.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250128230926.11715-1-cpru@amazon.com>
References: <20250119110410.GAZ4zcKkx5sCjD5XvH@fat_crate.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.179.55]
X-ClientProxiedBy: EX19D039UWB003.ant.amazon.com (10.13.138.93) To
 EX19D016UWA004.ant.amazon.com (10.13.139.119)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_213715_890795_2F3BA304 
X-CRM114-Status: GOOD (  20.57  )
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

Replacing CFS with the EEVDF scheduler in kernel 6.6 introduced
significant performance degradation in multiple database-oriented
workloads. This degradation manifests in all kernel versions using EEVDF,
across multiple Linux distributions, hardware architectures (x86_64,
aarm64, amd64), and CPU generations.

Testing combinations of available scheduler features showed that the
largest improvement (short of disabling all EEVDF features) came from
disabling both PLACE_LAG and RUN_TO_PARITY.

Moving PLACE_LAG and RUN_TO_PARITY to sysctl will allow users to override
their default values and persist them with established mechanisms.

Link: https://lore.kernel.org/20241017052000.99200-1-cpru@amazon.com
Signed-off-by: Cristian Prundeanu <cpru@amazon.com>
---
v2: use latest sched/core; defer default value change to a follow-up patch

 include/linux/sched/sysctl.h |  8 ++++++++
 kernel/sched/core.c          | 13 +++++++++++++
 kernel/sched/fair.c          |  7 ++++---
 kernel/sched/features.h      | 10 ----------
 kernel/sysctl.c              | 20 ++++++++++++++++++++
 5 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/include/linux/sched/sysctl.h b/include/linux/sched/sysctl.h
index 5a64582b086b..a899398bc1c4 100644
--- a/include/linux/sched/sysctl.h
+++ b/include/linux/sched/sysctl.h
@@ -29,4 +29,12 @@ extern int sysctl_numa_balancing_mode;
 #define sysctl_numa_balancing_mode	0
 #endif
 
+#if defined(CONFIG_SCHED_DEBUG) && defined(CONFIG_SYSCTL)
+extern unsigned int sysctl_sched_place_lag_enabled;
+extern unsigned int sysctl_sched_run_to_parity_enabled;
+#else
+#define sysctl_sched_place_lag_enabled 1
+#define sysctl_sched_run_to_parity_enabled 1
+#endif
+
 #endif /* _LINUX_SCHED_SYSCTL_H */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9142a0394d46..a379240628ea 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -134,6 +134,19 @@ const_debug unsigned int sysctl_sched_features =
 	0;
 #undef SCHED_FEAT
 
+#ifdef CONFIG_SYSCTL
+/*
+ * Using the avg_vruntime, do the right thing and preserve lag across
+ * sleep+wake cycles. EEVDF placement strategy #1, #2 if disabled.
+ */
+__read_mostly unsigned int sysctl_sched_place_lag_enabled = 1;
+/*
+ * Inhibit (wakeup) preemption until the current task has either matched the
+ * 0-lag point or until it has exhausted its slice.
+ */
+__read_mostly unsigned int sysctl_sched_run_to_parity_enabled = 1;
+#endif
+
 /*
  * Print a warning if need_resched is set for the given duration (if
  * LATENCY_WARN is enabled).
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1e78caa21436..c87fd1accd54 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -923,7 +923,8 @@ static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq)
 	 * Once selected, run a task until it either becomes non-eligible or
 	 * until it gets a new slice. See the HACK in set_next_entity().
 	 */
-	if (sched_feat(RUN_TO_PARITY) && curr && curr->vlag == curr->deadline)
+	if (sysctl_sched_run_to_parity_enabled && curr &&
+	    curr->vlag == curr->deadline)
 		return curr;
 
 	/* Pick the leftmost entity if it's eligible */
@@ -5199,7 +5200,7 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 	 *
 	 * EEVDF: placement strategy #1 / #2
 	 */
-	if (sched_feat(PLACE_LAG) && cfs_rq->nr_queued && se->vlag) {
+	if (sysctl_sched_place_lag_enabled && cfs_rq->nr_queued && se->vlag) {
 		struct sched_entity *curr = cfs_rq->curr;
 		unsigned long load;
 
@@ -9327,7 +9328,7 @@ static inline int task_is_ineligible_on_dst_cpu(struct task_struct *p, int dest_
 #else
 	dst_cfs_rq = &cpu_rq(dest_cpu)->cfs;
 #endif
-	if (sched_feat(PLACE_LAG) && dst_cfs_rq->nr_queued &&
+	if (sysctl_sched_place_lag_enabled && dst_cfs_rq->nr_queued &&
 	    !entity_eligible(task_cfs_rq(p), &p->se))
 		return 1;
 
diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 3c12d9f93331..b98ec31ef2c4 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -1,10 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
-/*
- * Using the avg_vruntime, do the right thing and preserve lag across
- * sleep+wake cycles. EEVDF placement strategy #1, #2 if disabled.
- */
-SCHED_FEAT(PLACE_LAG, true)
 /*
  * Give new tasks half a slice to ease into the competition.
  */
@@ -13,11 +8,6 @@ SCHED_FEAT(PLACE_DEADLINE_INITIAL, true)
  * Preserve relative virtual deadline on 'migration'.
  */
 SCHED_FEAT(PLACE_REL_DEADLINE, true)
-/*
- * Inhibit (wakeup) preemption until the current task has either matched the
- * 0-lag point or until is has exhausted it's slice.
- */
-SCHED_FEAT(RUN_TO_PARITY, true)
 /*
  * Allow wakeup of tasks with a shorter slice to cancel RUN_TO_PARITY for
  * current.
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 7ae7a4136855..11651d87f6d4 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -2019,6 +2019,26 @@ static struct ctl_table kern_table[] = {
 		.extra2		= SYSCTL_INT_MAX,
 	},
 #endif
+#ifdef CONFIG_SCHED_DEBUG
+	{
+		.procname	= "sched_place_lag_enabled",
+		.data		= &sysctl_sched_place_lag_enabled,
+		.maxlen		= sizeof(unsigned int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
+	{
+		.procname	= "sched_run_to_parity_enabled",
+		.data		= &sysctl_sched_run_to_parity_enabled,
+		.maxlen		= sizeof(unsigned int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
+#endif
 };
 
 static struct ctl_table vm_table[] = {

base-commit: 05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
-- 
2.48.1


