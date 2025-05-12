Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF7BC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 09:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9MWMC+hxix5AGtsxkl6l2IO/73jngjxqO3lnBBHAtA=; b=F7Fnrlj8cuFTMhxhw0bIdxKpja
	hmHxSBeWKbm7R8c5aa5CVXtMeFLVl3Jyicc5jnnRSyIQAduXtAQ8H9V4iPbvGEyNu8Qsr1vNcbeH5
	opetE4hbpCNesWQsBnvi2isMA9t84UGwNOtcAs0aP8Zkhl+0rN459StS4sZRGx0h8jhVlzb/jdj2j
	wcYNsQZ2L4wjGTwW/qrnHYmXNxNI0rssdqIQgK5oA3wQOSl5azmSYupMsfp5qOlWjJxczQUN60YGj
	oQ6PfCiwlhLiy/MLfCeS40nUeNI6lWLXhJA/ePwCaNe3vwsZMoOokmBKATvutuU5tmdkxY9nnefZe
	JvLWZM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPrB-000000091G9-2wA0;
	Mon, 12 May 2025 09:53:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPNK-00000008uG9-11VB;
	Mon, 12 May 2025 09:23:08 +0000
X-UUID: b26799b42f1211f08d385d50fb11b32d-20250512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=i9MWMC+hxix5AGtsxkl6l2IO/73jngjxqO3lnBBHAtA=;
	b=LOo8RbrRENRGFlek8ahX9Xvj2+qiHRI2yNg2iONhXBMHBw7DhcmzQPktZLDMPI5I+YRLu8IGFociTnOvk6RvY/3PfYwQgRQOuKTr0BBG3HRj2e440jZs6UhN3mHjqVXC9rF9bP9dXUSZkQlkfMwARB6r8qSakMUgC+/ALInsUEU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b1e6581c-54ea-4c66-bf8d-b969210abeef,IP:0,UR
	L:0,TC:0,Content:41,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:41
X-CID-META: VersionHash:0ef645f,CLOUDID:c6889cb7-5e6b-4d0f-a080-a5e9cb36bea6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:4|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b26799b42f1211f08d385d50fb11b32d-20250512
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 940202312; Mon, 12 May 2025 02:22:59 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 12 May 2025 17:22:54 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 12 May 2025 17:22:54 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
	<wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH RESEND v5 15/20] soc: mediatek: mtk-cmdq: Add new APIs to replace cmdq_pkt_write() and cmdq_pkt_write_mask()
Date: Mon, 12 May 2025 17:19:37 +0800
Message-ID: <20250512092252.905629-16-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512092252.905629-1-jason-jh.lin@mediatek.com>
References: <20250512092252.905629-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_022306_311652_BE356104 
X-CRM114-Status: GOOD (  14.09  )
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
index bae6753bd4a7..fd978fbd684b 100644
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
index f9a48262cb95..4a2acceb8581 100644
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
@@ -411,12 +465,37 @@ static inline int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u3
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


