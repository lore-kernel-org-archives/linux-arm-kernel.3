Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD08D232EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 07:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aqNMzU1Qw+T1MRI2oqS9RMu5Na9ZwPrUfIxVrukiy8k=; b=yPsr/81fPrNVU04bsjhU6CTcap
	KkAwEn99Fm6CAOiOc26fu9ra6KyZDiHxsOTs5afcCmqQ4A71pXS0kWvVK+a18ARsLPfaTu+pjaczz
	WJd0Cs0+OOWXhmxK2lJWwKN6yX+bfCeLIqnuSvx7qPa/42nkAuj5N3OacpHP8R2WZR5sc/cfAjArk
	PvtG8DPeVn0hdt9OnW71AoIfXmdWgGVxvkP19da0KPXm259JIqNYB99kJpzn3lM0FRykcjkIFlX1Q
	JVGUvTgFeTvNjsNZYILjtcoZUO+boERhWjpUQzQfzT+3Ja6vMtq9AfFP5J202qrb6/pHUntxUDrRa
	BJPXpsiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve71z-00000001knE-147Z;
	Fri, 09 Jan 2026 07:35:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve71t-00000001klo-1Kr9;
	Fri, 09 Jan 2026 07:35:30 +0000
X-UUID: c3177750ed2d11f09f706fa2197c6ceb-20260109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aqNMzU1Qw+T1MRI2oqS9RMu5Na9ZwPrUfIxVrukiy8k=;
	b=OCnY8Zj8KGmECg9R7H9DUmD7KYc9lBsFoQEOlvfct+ZL7yl3ZfqZC1fIxmhpXbCbPkCYnrkhRkk24Q4F2M85jz2xNSSvgVlwEXfkNAMk4OjBEY4kDkTrV5h3yQk9LW6VXWhnSPISeqE0xcE5o/6NZe5Ux6wfqlX1lq2SvYNBN7o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:672eacc4-61e9-4795-9314-785d5cb8c329,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:1
X-CID-META: VersionHash:5047765,CLOUDID:fdecee59-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c3177750ed2d11f09f706fa2197c6ceb-20260109
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <dengjun.su@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1328026654; Fri, 09 Jan 2026 00:35:25 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 15:35:22 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 15:35:21 +0800
From: Dengjun Su <dengjun.su@mediatek.com>
To: <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>
CC: <dengjun.su@mediatek.com>, <mike.zhang@mediatek.com>,
	<haiqiang.gong@mediatek.com>, <peijun.huang@mediatek.com>, Ingo Molnar
	<mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] sched: fix incorrect schedstats for rt and dl thread
Date: Fri, 9 Jan 2026 15:35:16 +0800
Message-ID: <20260109073518.2843689-1-dengjun.su@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_233529_546408_36A66A38 
X-CRM114-Status: GOOD (  16.99  )
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

For RT and DL thread, only 'set_next_task_(rt/dl)' will call
'update_stats_wait_end_(rt/dl)' to update schedstats information.
However, during the migration process,
'update_stats_wait_start_(rt/dl)' will be called twice, which
will cause the values of wait_max and wait_sum to be incorrect.
The specific output as follows:
$ cat /proc/6046/task/6046/sched | grep wait
wait_start                                   :             0.000000
wait_max                                     :        496717.080029
wait_sum                                     :       7921540.776553

A complete schedstats information update flow of migrate should be
__update_stats_wait_start() [enter queue A, stage 1] ->
__update_stats_wait_end()   [leave queue A, stage 2] ->
__update_stats_wait_start() [enter queue B, stage 3] ->
__update_stats_wait_end()   [start running on queue B, stage 4]

    Stage 1: prev_wait_start is 0, and in the end, wait_start records the
    time of entering the queue.
    Stage 2: task_on_rq_migrating(p) is true, and wait_start is updated to
    the waiting time on queue A.
    Stage 3: prev_wait_start is the waiting time on queue A, wait_start is
    the time of entering queue B, and wait_start is expected to be greater
    than prev_wait_start. Under this condition, wait_start is updated to
    (the moment of entering queue B) - (the waiting time on queue A).
    Stage 4: the final wait time = (time when starting to run on queue B)
    - (time of entering queue B) + (waiting time on queue A) = waiting
    time on queue B + waiting time on queue A.

The current problem is that stage 2 does not call __update_stats_wait_end
to update wait_start, which causes the final computed wait time = waiting
time on queue B + the moment of entering queue A, leading to incorrect
wait_max and wait_sum.

Add 'update_stats_wait_end_(rt/dl)' in 'update_stats_dequeue_(rt/dl)' to
update schedstats information when dequeue_task.

Signed-off-by: Dengjun Su <dengjun.su@mediatek.com>
---
v2: changes according to Peter's suggestions
    1. add fix for dl class;
    2. add more commit message to explain the reasons for the
       modifications.
---
 kernel/sched/deadline.c | 4 ++++
 kernel/sched/rt.c       | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 319439fe1870..610243a56bf8 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2115,10 +2115,14 @@ update_stats_dequeue_dl(struct dl_rq *dl_rq, struct sched_dl_entity *dl_se,
 			int flags)
 {
 	struct task_struct *p = dl_task_of(dl_se);
+	struct rq *rq = rq_of_dl_rq(dl_rq);
 
 	if (!schedstat_enabled())
 		return;
 
+	if (p != rq->curr)
+		update_stats_wait_end_dl(dl_rq, dl_se);
+
 	if ((flags & DEQUEUE_SLEEP)) {
 		unsigned int state;
 
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index f1867fe8e5c5..12f2efddca9f 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1302,13 +1302,18 @@ update_stats_dequeue_rt(struct rt_rq *rt_rq, struct sched_rt_entity *rt_se,
 			int flags)
 {
 	struct task_struct *p = NULL;
+	struct rq *rq = rq_of_rt_rq(rt_rq);
 
 	if (!schedstat_enabled())
 		return;
 
-	if (rt_entity_is_task(rt_se))
+	if (rt_entity_is_task(rt_se)) {
 		p = rt_task_of(rt_se);
 
+		if (p != rq->curr)
+			update_stats_wait_end_rt(rt_rq, rt_se);
+	}
+
 	if ((flags & DEQUEUE_SLEEP) && p) {
 		unsigned int state;
 
-- 
2.43.0


