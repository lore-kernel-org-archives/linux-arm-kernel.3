Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE29DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 08:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QDGF9T5dTNs+C/JVlj3oE/CVOJhjvBeXRBAQW6usNB8=; b=wd/1djucsbrcXlckqxcOL3eGJO
	eKUZrvCFGUaDwY5NHr51gkdhWy1A+sGfAKVLCSEZZc8lug5YaiCp/0veAg6a5XP1/VEoRqF3HdZJu
	vl3P3xyOTAB3FkKoMXnzYOBgBeSvmFoiFt+w70e6e7Rlw0uqXS3GXKRRNJPb9cs5zkGGNg9KrzWF+
	ArQ1On74vZuVRfJMK0PksvhfH1naCLaifIivAOSM+ZhyaqZrw5GmITvYyfpnEOIK4VzMF7OVrHUy1
	6nVJtU3riRZ405sTLJtDwVUiUdEMl2qGUr3se7040BSVysWLedtgA9j5UOoK9RyP9NgKkRu30rjCG
	wTUgFtWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerAm-00000006pvQ-0qjk;
	Thu, 24 Jul 2025 08:19:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqt3-00000006mFk-3dh0;
	Thu, 24 Jul 2025 08:01:10 +0000
X-UUID: 575d361a686411f09eb0dd999d3936bf-20250724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QDGF9T5dTNs+C/JVlj3oE/CVOJhjvBeXRBAQW6usNB8=;
	b=BcSedB6tSKn2tEMmMJiplfjWBmFTmQfxrVosTXKr0KBap5GJJRZzvu0pojphUTFp53ANjPzwIpjF+Ov9BvqqVabpEE7gRROMpVy7Fe7j6VPFoGh90DBNw2Qf4Th9nnOzwZGmEBAKyIz3Srui3jNL6vpfiyOQCTPvd8KNztz7rFs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:3988cce7-0239-4388-9149-f825a87161d4,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:bd32200f-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 575d361a686411f09eb0dd999d3936bf-20250724
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <akash.tyagi@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1860014632; Thu, 24 Jul 2025 01:01:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 24 Jul 2025 16:00:57 +0800
Received: from mtisdccf01.mediatek.inc (10.18.1.155) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 24 Jul 2025 16:00:55 +0800
From: akash.tyagi <akash.tyagi@mediatek.com>
To: <akpm@linux-foundation.org>, <vbabka@suse.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <surenb@google.com>, <mhocko@suse.com>, <jackmanb@google.com>,
	<hannes@cmpxchg.org>, <ziy@nvidia.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
	<akash.tyagi@mediatek.com>
Subject: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
Date: Thu, 24 Jul 2025 13:23:01 +0530
Message-ID: <20250724075301.1151817-1-akash.tyagi@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_010109_914566_7D252E22 
X-CRM114-Status: GOOD (  15.14  )
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

Currently, THP CMA pages share PCP lists with UNMOVABLE and RECLAIMABLE
pages. This may result in CMA THP pages being allocated from the PCP
list for other migratetypes. When this occurs, these pages may fail to
be isolated, leading to CMA allocation failures when drivers request
them.

This patch introduces a dedicated PCP list for the THP CMA migratetype,
ensuring that CMA THP pages are not mixed with other migratetypes and
remain available for CMA allocations as intended.

Signed-off-by: akash.tyagi <akash.tyagi@mediatek.com>
---
 include/linux/mmzone.h | 10 ++++++++--
 mm/page_alloc.c        |  5 +++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 283913d42d7b..dd93088ce851 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -696,11 +696,17 @@ enum zone_watermarks {
 
 /*
  * One per migratetype for each PAGE_ALLOC_COSTLY_ORDER. Two additional lists
- * are added for THP. One PCP list is used by GPF_MOVABLE, and the other PCP list
- * is used by GFP_UNMOVABLE and GFP_RECLAIMABLE.
+ * are added for THP: one for GFP_MOVABLE, and one for GFP_UNMOVABLE and
+ * GFP_RECLAIMABLE. With CMA enabled, an extra THP PCP list is added for
+ * MIGRATE_CMA, allowing further distinction between MIGRATE_MOVABLE and
+ * MIGRATE_CMA for THP allocations.
  */
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
+#ifdef CONFIG_CMA
+#define NR_PCP_THP 3
+#else
 #define NR_PCP_THP 2
+#endif
 #else
 #define NR_PCP_THP 0
 #endif
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 2ef3c07266b3..35f8041afbcc 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -519,6 +519,11 @@ static inline unsigned int order_to_pindex(int migratetype, int order)
 	if (order > PAGE_ALLOC_COSTLY_ORDER) {
 		VM_BUG_ON(order != HPAGE_PMD_ORDER);
 
+#ifdef CONFIG_CMA
+		if (migratetype == MIGRATE_CMA)
+			return NR_LOWORDER_PCP_LISTS + 2;
+#endif
+
 		movable = migratetype == MIGRATE_MOVABLE;
 
 		return NR_LOWORDER_PCP_LISTS + movable;
-- 
2.18.0


