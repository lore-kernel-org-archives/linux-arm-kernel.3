Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3848C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DM70jmBk+8+pNXMrSmDw0F0d1r4Q4LzFUoMuNsxPcH4=; b=Mt+Dp7lTe8pNwWP8HUTQ9lPpQC
	wk6LRoQYTusVruDKLG5Ow19u8T2HIrXz1Lc6KnBpvJY1J6uHqhG7vZ8i45NMBYiwhemtud2Bo79vq
	yJ1qO//2Ikl3jS93WbgMzkV1hho+468MGAqiBkceXYvVuRz6VLg3gIyb+2NNO8HMDhTxui5wrLItV
	rq21/NX4/wBAv66vF5TiJmJkXnLvsQz/4CwGCpOgLw5sn1YpzPt0b5xU14AD+WPhj6GY12B5u7hNl
	ETLv1GOgVVf3Juau4pq22ocKrhy70RpMfrc94uinYQsPpCZ7v4sF/4yu+CoTzFfNGXb4vJ8/03YDq
	nERnKxzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZqo-00000007zKC-1C4G;
	Tue, 17 Jun 2025 17:11:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYdT-00000007nv3-06iw;
	Tue, 17 Jun 2025 15:54:08 +0000
X-UUID: 492ac1a44b9311f09f706fa2197c6ceb-20250617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DM70jmBk+8+pNXMrSmDw0F0d1r4Q4LzFUoMuNsxPcH4=;
	b=Js1PFMfbr+Kni92Htg/UjrRVzwKN0SJuv+R9I0eBGAeZTW5YUG0Hb9xJYsGSMVqLNxO39RVkVAxTTOsdDTwrrlSRJYnkYNlT7qZlX+W6IFjbaTGraw0itmnfbN455gI1oEY0I0+WDtOFHxPN/uTwFEhcC35k33+CaEh7WSGoIwY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:2adb1122-74ed-4f2d-a68b-c597dfbf8dca,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:09905cf,CLOUDID:5e67c903-0d95-4f6b-a95f-3c560ebcf3ab,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 492ac1a44b9311f09f706fa2197c6ceb-20250617
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1759085317; Tue, 17 Jun 2025 08:54:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 17 Jun 2025 23:53:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 17 Jun 2025 23:53:57 +0800
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: John Stultz <jstultz@google.com>, kuyo chang <kuyo.chang@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 1/1] sched/deadline: Fix dl_server runtime calculation formula
Date: Tue, 17 Jun 2025 23:52:49 +0800
Message-ID: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_085407_089634_44D21E93 
X-CRM114-Status: GOOD (  11.73  )
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

[Symptom]
The calculation formula for dl_server runtime is based on
Frequency/capacity scale-invariance.
This will cause excessive RT latency (expect absolute time).

[Analysis]
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

[Solution]
The runtime for dl_server should be fixed time
asis RT bandwidth control.
Fix the runtime calculation formula for the dl_server.

Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
Acked-by: Juri Lelli <juri.lelli@redhat.com>
Suggested-by: Peter Zijlstra <peterz@infradead.org>

v1: https://lore.kernel.org/all/20250614020524.631521-1-kuyo.chang@mediatek.com/

---
 kernel/sched/deadline.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea245..f68a158d01e9 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1504,7 +1504,9 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
 	if (dl_entity_is_special(dl_se))
 		return;
 
-	scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
+	scaled_delta_exec = delta_exec;
+	if (!dl_se->dl_server)
+		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
 
 	dl_se->runtime -= scaled_delta_exec;
 
@@ -1624,7 +1626,9 @@ void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
 	if (delta_exec < 0)
 		return;
 
-	scaled_delta_exec = dl_scaled_delta_exec(rq, &rq->fair_server, delta_exec);
+	scaled_delta_exec = delta_exec;
+	if (!rq->fair_server.dl_server)
+		scaled_delta_exec = dl_scaled_delta_exec(rq, &rq->fair_server, delta_exec);
 
 	rq->fair_server.runtime -= scaled_delta_exec;
 
-- 
2.45.2


