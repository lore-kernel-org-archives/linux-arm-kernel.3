Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753B6C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 10:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VbUAEeV39eL80nnS9lHM6fAPeFr3119Wt/l0LVAUKA=; b=V+AFLZyHkACvfmhXQ+UXHp0Fzd
	B9mCTeupVmPQfsrqU3yl9Nk/xTN2yCcIJFCXZ2/ALoBUS0zUTkIaecM4pf/s1FzCSSKdWa1mD458z
	AzX02Z5dBpKmkfBobvae2PN12Z2Aa9QeVdpeC3vdk2w80FKMkWeZ8HZMtf2+nAw9RfUJ+z72BmJdM
	1RrIqdt8WKdytuECM2699w/TJbvuNzpDRoC0JwjJCtdlXve7M5NkhWOdMH7bd/AJVLGDU7tOT+Yb5
	IxVj8dAHlXWd9sg23sMMDEYr3laZHO3H2NC4pDPR7NYKZ3M/w9URXK8pLTV5Wi8lOW0XD260PRhsv
	DJdj42UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8GeR-0000000Goob-1OH4;
	Fri, 25 Apr 2025 10:51:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FQS-0000000GYJV-1ctN;
	Fri, 25 Apr 2025 09:32:54 +0000
X-UUID: 3daec34821b811f0a2405d5ef59ce188-20250425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6VbUAEeV39eL80nnS9lHM6fAPeFr3119Wt/l0LVAUKA=;
	b=ip9IG0TViOh0WjDhtbzkZLxk/JSINYrYhZ+t1Xt9ET1+M9TSNvxdVNxAeAyu6J4LMf1srQZzGapZhD+m7I9wDFSq9a2CKIbBTtbmpCAbbfyWKana62Vo+OB/0f/UxnvjX1Q7XHncPQWUYWe0CLm9Shw1GmkIlp1FOConQGBdoZQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b6842c42-41b0-4200-afe3-05864332e78e,IP:0,UR
	L:0,TC:0,Content:41,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:41
X-CID-META: VersionHash:0ef645f,CLOUDID:aac7dd6f-e08c-41ab-89e8-3ba0a33da853,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:4|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3daec34821b811f0a2405d5ef59ce188-20250425
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1874294979; Fri, 25 Apr 2025 02:32:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 25 Apr 2025 17:32:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 25 Apr 2025 17:32:40 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <pual-pl.chen@mediatek.com>, "Moudy
 Ho" <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
	<wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v5 19/19] soc: mediatek: mtk-cmdq: Remove cmdq_pkt_write() and cmdq_pkt_write_mask()
Date: Fri, 25 Apr 2025 17:28:51 +0800
Message-ID: <20250425093237.1543918-20-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250425093237.1543918-1-jason-jh.lin@mediatek.com>
References: <20250425093237.1543918-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_023252_472329_31204C92 
X-CRM114-Status: GOOD (  15.32  )
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

The original cmdq_pkt_write() and cmdq_pkt_write_mask() only supported
generating GCE instructions with subsys ID. They have been replaced by
cmdq_pkt_write_pa(), cmdq_pkt_write_subsys(), cmdq_pkt_write_mask_pa()
and cmdq_pkt_write_mask_subsys().

These 2 functions can now be removed as they are no longer in use.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 49 ++++++++++----------------
 include/linux/soc/mediatek/mtk-cmdq.h  | 35 ------------------
 2 files changed, 18 insertions(+), 66 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 0a718ffa5f3b..5822a3d13bda 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -201,18 +201,6 @@ static int cmdq_pkt_mask(struct cmdq_pkt *pkt, u32 mask)
 	return cmdq_pkt_append_command(pkt, inst);
 }
 
-int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
-{
-	struct cmdq_instruction inst = {
-		.op = CMDQ_CODE_WRITE,
-		.value = value,
-		.offset = offset,
-		.subsys = subsys
-	};
-	return cmdq_pkt_append_command(pkt, inst);
-}
-EXPORT_SYMBOL(cmdq_pkt_write);
-
 int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/, u32 pa_base,
 		      u16 offset, u32 value)
 {
@@ -229,27 +217,16 @@ EXPORT_SYMBOL(cmdq_pkt_write_pa);
 int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base /*unused*/,
 			  u16 offset, u32 value)
 {
-	return cmdq_pkt_write(pkt, subsys, offset, value);
+	struct cmdq_instruction inst = {
+		.op = CMDQ_CODE_WRITE,
+		.value = value,
+		.offset = offset,
+		.subsys = subsys
+	};
+	return cmdq_pkt_append_command(pkt, inst);
 }
 EXPORT_SYMBOL(cmdq_pkt_write_subsys);
 
-int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
-			u16 offset, u32 value, u32 mask)
-{
-	u16 offset_mask = offset;
-	int err;
-
-	if (mask != GENMASK(31, 0)) {
-		err = cmdq_pkt_mask(pkt, mask);
-		if (err < 0)
-			return err;
-
-		offset_mask |= CMDQ_WRITE_ENABLE_MASK;
-	}
-	return cmdq_pkt_write(pkt, subsys, offset_mask, value);
-}
-EXPORT_SYMBOL(cmdq_pkt_write_mask);
-
 int cmdq_pkt_write_mask_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/, u32 pa_base,
 			   u16 offset, u32 value, u32 mask)
 {
@@ -267,7 +244,17 @@ EXPORT_SYMBOL(cmdq_pkt_write_mask_pa);
 int cmdq_pkt_write_mask_subsys(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base /*unused*/,
 			       u16 offset, u32 value, u32 mask)
 {
-	return cmdq_pkt_write_mask(pkt, subsys, offset, value, mask);
+	u16 offset_mask = offset;
+	int err;
+
+	if (mask != GENMASK(31, 0)) {
+		err = cmdq_pkt_mask(pkt, mask);
+		if (err < 0)
+			return err;
+
+		offset_mask |= CMDQ_WRITE_ENABLE_MASK;
+	}
+	return cmdq_pkt_write_subsys(pkt, subsys, pa_base, offset_mask, value);
 }
 EXPORT_SYMBOL(cmdq_pkt_write_mask_subsys);
 
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 4a2acceb8581..f4663fbfb5a0 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -113,17 +113,6 @@ int cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt, size_t siz
  */
 void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
 
-/**
- * cmdq_pkt_write() - append write command to the CMDQ packet
- * @pkt:	the CMDQ packet
- * @subsys:	the CMDQ sub system code
- * @offset:	register offset from CMDQ sub system
- * @value:	the specified target register value
- *
- * Return: 0 for success; else the error code is returned
- */
-int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value);
-
 /**
  * cmdq_pkt_write_pa() - append write command to the CMDQ packet with pa_base
  * @pkt:	the CMDQ packet
@@ -150,19 +139,6 @@ int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
 int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys,
 			  u32 pa_base /*unused*/, u16 offset, u32 value);
 
-/**
- * cmdq_pkt_write_mask() - append write command with mask to the CMDQ packet
- * @pkt:	the CMDQ packet
- * @subsys:	the CMDQ sub system code
- * @offset:	register offset from CMDQ sub system
- * @value:	the specified target register value
- * @mask:	the specified target register mask
- *
- * Return: 0 for success; else the error code is returned
- */
-int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
-			u16 offset, u32 value, u32 mask);
-
 /**
  * cmdq_pkt_write_mask_pa() - append write command with mask to the CMDQ packet with pa
  * @pkt:	the CMDQ packet
@@ -460,11 +436,6 @@ static inline int cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *p
 
 static inline void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt) { }
 
-static inline int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
-{
-	return -ENOENT;
-}
-
 static inline int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
 				    u32 pa_base, u16 offset, u32 value)
 {
@@ -477,12 +448,6 @@ static inline int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys,
 	return -ENOENT;
 }
 
-static inline int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
-				      u16 offset, u32 value, u32 mask)
-{
-	return -ENOENT;
-}
-
 static inline int cmdq_pkt_write_mask_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
 					 u32 pa_base, u16 offset, u32 value, u32 mask)
 {
-- 
2.43.0


