Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FE9C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 02:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=deNJWsOBY3RBK23bhwBdD1QEB5poAvITxTzNa/F4P1I=; b=oJuRQVzeInZxwgg9FX7zu7jFtr
	TC/guuTG9bqdta4m9PCr8NbwOS4MkXPi15s1L+ZyZkFW0wLeP65YeXAclrdBFJ7+ohbKRD+7C9YDx
	ApzrYyP1Kwel9ILH0eQAU7+CxeYQfkBoZkdm3kSrypkrDAPso0rTUTrQyjnYN1oSaspDSIdwxYUZC
	OI+cA9QK8M7FvKzynGPScqT4UJde+qsaLL4m1Xe5PzPZUjJS2AlGmhyevKIA4Jg4sxLxjZPgs+f+E
	Vghm79xU3QEtnx+3egPSG/3Z/YVlQNm80YWXqsJpZ/1ImyjeG1XHPqQ0hdt7SF3SzI8NzxEtT9mnu
	deZxhYYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWn2C-000000072mp-3unM;
	Wed, 02 Jul 2025 02:17:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmzr-000000072V5-44Ry;
	Wed, 02 Jul 2025 02:14:53 +0000
X-UUID: 52623c7256ea11f09f706fa2197c6ceb-20250701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=deNJWsOBY3RBK23bhwBdD1QEB5poAvITxTzNa/F4P1I=;
	b=O/QON/zRTEINtErVRVM5UEfWnf3RcFM0zRhSXVfH8P1qe+20PttTGvbczihwArj5IhD+JdJtk+corhYlTvGGCD1G8q/M1xTBJbynC7iObMgo6DlvNO4dOemYrrREgYBav8ACiXpaN7CXhwjdmbNIKcq4IvMkvRPAwFp5wvwRPig=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:ddab2cbb-0e50-482b-9fb2-030044556025,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:c1766a82-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 52623c7256ea11f09f706fa2197c6ceb-20250701
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 413804337; Tue, 01 Jul 2025 19:14:45 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 2 Jul 2025 10:14:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 2 Jul 2025 10:14:42 +0800
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: John Stultz <jstultz@google.com>, kuyo chang <kuyo.chang@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v5 1/1] sched/deadline: Fix dl_server runtime calculation formula
Date: Wed, 2 Jul 2025 10:12:25 +0800
Message-ID: <20250702021440.2594736-1-kuyo.chang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_191452_024006_E2921BF0 
X-CRM114-Status: GOOD (  19.01  )
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

From: kuyo chang <kuyo.chang@mediatek.com>

In our testing with 6.12 based kernel on a big.LITTLE system, we were
seeing instances of RT tasks being blocked from running on the LITTLE
cpus for multiple seconds of time, apparently by the dl_server. This
far exceeds the default configured 50ms per second runtime.

This is due to the fair dl_server runtime calculation being scaled
for frequency & capacity of the cpu.

Consider the following case under a Big.LITTLE architecture:
Assume the runtime is: 50,000,000 ns, and Frequency/capacity
scale-invariance defined as below:
Frequency scale-invariance: 100
Capacity scale-invariance: 50
First by Frequency scale-invariance,
the runtime is scaled to 50,000,000 * 100 >> 10 = 4,882,812
Then by capacity scale-invariance,
it is further scaled to 4,882,812 * 50 >> 10 = 238,418.
So it will scaled to 238,418 ns.

This smaller "accounted runtime" value is what ends up being
subtracted against the fair-server's runtime for the current period.
Thus after 50ms of real time, we've only accounted ~238us against the
fair servers runtime. This 209:1 ratio in this example means that on
the smaller cpu the fair server is allowed to continue running,
blocking RT tasks, for over 10 seconds before it exhausts its supposed
50ms of runtime.  And on other hardware configurations it can be even
worse.

For the fair deadline_server, to prevent realtime tasks from being
unexpectedly delayed, we really do want to use fixed time, and not
scaled time for smaller capacity/frequency cpus. So remove the scaling
from the fair server's accounting to fix this.

Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
Acked-by: Juri Lelli <juri.lelli@redhat.com>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Suggested-by: John Stultz <jstultz@google.com>
Tested-by: John Stultz <jstultz@google.com>

---
v1: https://lore.kernel.org/all/20250614020524.631521-1-kuyo.chang@mediatek.com/
v2: https://lore.kernel.org/all/20250617155355.1479777-1-kuyo.chang@mediatek.com/
v3: https://lore.kernel.org/all/20250626030746.2245365-1-kuyo.chang@mediatek.com/
v4: https://lore.kernel.org/all/20250627022837.3331827-1-kuyo.chang@mediatek.com/

v1->v2
Use the dl_server flag to identify scaled or non-scaled suggested by Peter.
v2->v3
Use the dl_server(dl_se) helper function for the code refactor suggested by John.
v3->v4
Commit log cleaned up/simplified suggested by John.
v4->v5
Drop the conditional for fair_server of time_scale.
The original version of this patch(v1) is much cleaner,
suggested by John & acked by Juri.

---
 kernel/sched/deadline.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea245..89019a140826 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1504,7 +1504,9 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
 	if (dl_entity_is_special(dl_se))
 		return;
 
-	scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
+	scaled_delta_exec = delta_exec;
+	if (!dl_server(dl_se))
+		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
 
 	dl_se->runtime -= scaled_delta_exec;
 
@@ -1611,7 +1613,7 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
  */
 void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
 {
-	s64 delta_exec, scaled_delta_exec;
+	s64 delta_exec;
 
 	if (!rq->fair_server.dl_defer)
 		return;
@@ -1624,9 +1626,7 @@ void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
 	if (delta_exec < 0)
 		return;
 
-	scaled_delta_exec = dl_scaled_delta_exec(rq, &rq->fair_server, delta_exec);
-
-	rq->fair_server.runtime -= scaled_delta_exec;
+	rq->fair_server.runtime -= delta_exec;
 
 	if (rq->fair_server.runtime < 0) {
 		rq->fair_server.dl_defer_running = 0;
-- 
2.45.2


