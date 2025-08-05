Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEB1C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MDBvzVKssQSva27++Dk9F/cZ5uTyJvj5l+46UJDxufg=; b=MGRYXEowNgPXEtZuCjahEMTYCP
	vnK/py2sJOHw8sHZ6uUNd93CtX8b+OpI9o/7o5Bj07Ep2Cn6GeCcs1uVtqcT+FoKa6XnfNM20vBgi
	ALm5X3UjSbqdqR0L3VtWTIrKszwJ8cDqo0jQ9BZub16ND+LCwpNqDQllXJzMij8dkWXBJEKrwEyNR
	rVM+2wQ+SMjzvzhwKOqOsJltUDtiPKRNM71U5r2eWBCqnfRkecyfxT4YGrA1mpOpsFwbwQ2axBPUe
	03cGFuHZ4z6UnlAJHaGc3XlmTf0588D4DO8zss/7Gaty8d0cX88YbgC2LbjPSaWOxNILBn6MIigUW
	3n0t93cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLBY-0000000DO7r-0giM;
	Tue, 05 Aug 2025 17:10:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJzC-0000000DCpq-3vKL;
	Tue, 05 Aug 2025 15:54:00 +0000
X-UUID: 6237fc78721411f09f706fa2197c6ceb-20250805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MDBvzVKssQSva27++Dk9F/cZ5uTyJvj5l+46UJDxufg=;
	b=FBIbUXO9qrQ4eYsTnY/6jrIVX1SfrsS2u6WJNCXU5tYg61qae9Cy5kgkdanSsc8n/apxrRK9E3ux1Ucze1EX4IiQqW57vDRNvUWurxceKcSEAdprIqaq9QK+SSzFjyctET4iHY39tu5T9VUpIdNhiPMSMaR6NSZxXvV+GL66lxU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:1f258234-e2ca-429b-b77a-7221cf0a8194,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:b320890f-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6237fc78721411f09f706fa2197c6ceb-20250805
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1460845936; Tue, 05 Aug 2025 08:53:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 5 Aug 2025 23:53:49 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 5 Aug 2025 23:53:49 +0800
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: kuyo chang <kuyo.chang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] sched/deadline: Add DL server activated message
Date: Tue, 5 Aug 2025 23:53:32 +0800
Message-ID: <20250805155347.1693676-1-kuyo.chang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_085358_985145_55FDAEDF 
X-CRM114-Status: GOOD (  10.49  )
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

The DL server is introduced as a replacement for realtime throttling.
When RT throttling is activated, a message
"sched: RT throttling activated" is shown. However, it is currently
difficult for users to know when the DL server is activated.

This patch adds a similar message to indicate when the DL server
is activated, which helps users debug RT/CFS contention issues.

Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
---
 kernel/sched/deadline.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index e2d51f4306b3..8e0de6cdb980 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2042,6 +2042,9 @@ enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags)
 	}
 
 	__enqueue_dl_entity(dl_se);
+
+	if (dl_server(dl_se))
+		printk_deferred_once("sched: dl_server activated\n");
 }
 
 static void dequeue_dl_entity(struct sched_dl_entity *dl_se, int flags)
-- 
2.45.2


