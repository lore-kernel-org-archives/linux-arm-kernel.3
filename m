Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5F2CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QufK7ycUpFHQwe046IDfqriapz2rucAcQrm/hxQM/CU=; b=pMA0vcFwA2gKXQaMSHRFsUKLKx
	W1dK9yeFVL3uQFDYxtV7gncarVHHaH6Xvk2GiFz3Ws/EMKK0+IPQALfBo/YKY9solBO4Afxy3jKFx
	pWMKaEr5tv0Y6IsF6qRy7hS+FZc6TZxsu93ugzmuKeAJrW+2pGzcC+fnDklTknO0rDXpZN5b9zgFv
	LrI4ds0h1YCwo7Sp3O/jKeUBc0+BWC2fJoRobu29nnRkgoZrplix2gdGkvZR6X30uDeTIqN+i0flS
	oR9uBq7WkZEpZVIkeuYXLjsmR/5Y2/v6VHOA+kV3zS/T4xwsrJKlzqhNfKI/V0PV7rrC9E3ZUG1OD
	tyWi27SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIP3-0000000Fyy2-0TNb;
	Wed, 27 Aug 2025 15:49:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEVn-0000000FInc-0kUj;
	Wed, 27 Aug 2025 11:40:21 +0000
X-UUID: 982022c0833a11f09eb0dd999d3936bf-20250827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QufK7ycUpFHQwe046IDfqriapz2rucAcQrm/hxQM/CU=;
	b=YWC/z9gtQQlQ03wN2569ZE+jTDDG16JfZex78twe3RFB/34mblWA8x+wx5OTYpxm2sou1SlgiWetDjkjjVqQQYB4yvL1qj4K1l5py7vgl8j72QisBbfLWVyfa6O7wyst40yY86bZ6MULw/Uhl4MStTb4uj/coXe5r0jU72E2iAk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:11ffd623-445c-40d9-8007-0c5ade874c8e,IP:0,UR
	L:0,TC:0,Content:40,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:40
X-CID-META: VersionHash:f1326cf,CLOUDID:150f957a-966c-41bd-96b5-7d0b3c22e782,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:4|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 982022c0833a11f09eb0dd999d3936bf-20250827
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1494705795; Wed, 27 Aug 2025 04:40:13 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 27 Aug 2025 19:40:09 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 27 Aug 2025 19:40:09 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xiandong
 Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>,
	Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v7 10/20] soc: mediatek: mtk-cmdq: Add new APIs to replace cmdq_pkt_write() and cmdq_pkt_write_mask()
Date: Wed, 27 Aug 2025 19:37:42 +0800
Message-ID: <20250827114006.3310175-11-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_044019_262018_B2322C06 
X-CRM114-Status: GOOD (  14.99  )
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

To support generating GCE write instructions using both pa_base and
subsys, the original cmdq_pkt_write() and cmdq_pkt_write_mask() have
been expanded into four new APIs:
- Replaced cmdq_pkt_write() to cmdq_pkt_write_pa() and
  cmdq_pkt_write_subsys().
- Replaced cmdq_pkt_write_mask() to cmdq_pkt_write_mask_pa() and
  cmdq_pkt_write_mask_subsys().

The original cmdq_pkt_write() and cmdq_pkt_write_mask() will be removed
after all CMDQ users have migrated to the new APIs.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 41 +++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  | 79 ++++++++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 41e1997cdd53..7e86299213d8 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -213,6 +213,26 @@ int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
 }
 EXPORT_SYMBOL(cmdq_pkt_write);
 
+int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/, u32 pa_base,
+		      u16 offset, u32 value)
+{
+	int err;
+
+	err = cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX0, CMDQ_ADDR_HIGH(pa_base));
+	if (err < 0)
+		return err;
+
+	return cmdq_pkt_write_s_value(pkt, CMDQ_THR_SPR_IDX0, CMDQ_ADDR_LOW(offset), value);
+}
+EXPORT_SYMBOL(cmdq_pkt_write_pa);
+
+int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base /*unused*/,
+			  u16 offset, u32 value)
+{
+	return cmdq_pkt_write(pkt, subsys, offset, value);
+}
+EXPORT_SYMBOL(cmdq_pkt_write_subsys);
+
 int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 			u16 offset, u32 value, u32 mask)
 {
@@ -230,6 +250,27 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 }
 EXPORT_SYMBOL(cmdq_pkt_write_mask);
 
+int cmdq_pkt_write_mask_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/, u32 pa_base,
+			   u16 offset, u32 value, u32 mask)
+{
+	int err;
+
+	err = cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX0, CMDQ_ADDR_HIGH(pa_base));
+	if (err < 0)
+		return err;
+
+	return cmdq_pkt_write_s_mask_value(pkt, CMDQ_THR_SPR_IDX0,
+					   CMDQ_ADDR_LOW(offset), value, mask);
+}
+EXPORT_SYMBOL(cmdq_pkt_write_mask_pa);
+
+int cmdq_pkt_write_mask_subsys(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base /*unused*/,
+			       u16 offset, u32 value, u32 mask)
+{
+	return cmdq_pkt_write_mask(pkt, subsys, offset, value, mask);
+}
+EXPORT_SYMBOL(cmdq_pkt_write_mask_subsys);
+
 int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx, u16 addr_low,
 		    u16 reg_idx)
 {
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 3699229a7375..2055f194c6e9 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -124,6 +124,32 @@ void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
  */
 int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value);
 
+/**
+ * cmdq_pkt_write_pa() - append write command to the CMDQ packet with pa_base
+ * @pkt:	the CMDQ packet
+ * @subsys:	unused parameter
+ * @pa_base:	the physical address base of the hardware register
+ * @offset:	register offset from CMDQ sub system
+ * @value:	the specified target register value
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
+		      u32 pa_base, u16 offset, u32 value);
+
+/**
+ * cmdq_pkt_write_subsys() - append write command to the CMDQ packet with subsys
+ * @pkt:	the CMDQ packet
+ * @subsys:	the CMDQ sub system code
+ * @pa_base:	unused parameter
+ * @offset:	register offset from CMDQ sub system
+ * @value:	the specified target register value
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys,
+			  u32 pa_base /*unused*/, u16 offset, u32 value);
+
 /**
  * cmdq_pkt_write_mask() - append write command with mask to the CMDQ packet
  * @pkt:	the CMDQ packet
@@ -137,6 +163,34 @@ int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value);
 int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 			u16 offset, u32 value, u32 mask);
 
+/**
+ * cmdq_pkt_write_mask_pa() - append write command with mask to the CMDQ packet with pa
+ * @pkt:	the CMDQ packet
+ * @subsys:	unused parameter
+ * @pa_base:	the physical address base of the hardware register
+ * @offset:	register offset from CMDQ sub system
+ * @value:	the specified target register value
+ * @mask:	the specified target register mask
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_write_mask_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
+			   u32 pa_base, u16 offset, u32 value, u32 mask);
+
+/**
+ * cmdq_pkt_write_mask_subsys() - append write command with mask to the CMDQ packet with subsys
+ * @pkt:	the CMDQ packet
+ * @subsys:	the CMDQ sub system code
+ * @pa_base:	unused parameter
+ * @offset:	register offset from CMDQ sub system
+ * @value:	the specified target register value
+ * @mask:	the specified target register mask
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_write_mask_subsys(struct cmdq_pkt *pkt, u8 subsys,
+			       u32 pa_base /*unused*/, u16 offset, u32 value, u32 mask);
+
 /*
  * cmdq_pkt_read_s() - append read_s command to the CMDQ packet
  * @pkt:	the CMDQ packet
@@ -424,12 +478,37 @@ static inline int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u3
 	return -ENOENT;
 }
 
+static inline int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
+				    u32 pa_base, u16 offset, u32 value)
+{
+	return -ENOENT;
+}
+
+static inline int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys,
+					u32 pa_base /*unused*/, u16 offset, u32 value)
+{
+	return -ENOENT;
+}
+
 static inline int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 				      u16 offset, u32 value, u32 mask)
 {
 	return -ENOENT;
 }
 
+static inline int cmdq_pkt_write_mask_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
+					 u32 pa_base, u16 offset, u32 value, u32 mask)
+{
+	return -ENOENT;
+}
+
+static inline int cmdq_pkt_write_mask_subsys(struct cmdq_pkt *pkt, u8 subsys,
+					     u32 pa_base /*unused*/, u16 offset,
+					     u32 value, u32 mask)
+{
+	return -ENOENT;
+}
+
 static inline int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
 				  u16 addr_low, u16 reg_idx)
 {
-- 
2.43.0


