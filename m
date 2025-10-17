Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E023CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaCDgUVMB4sgbM1/K5J9BFG9g9jS7vE/ZZlkt+ZP8pY=; b=UYsQsqyikv+yLRy1A6DsmfWSTI
	38L16G6k14zwZurDRyDNN5nuzRsbesqRuaPDjRob6uwgtEKkkqI3q9WFNLkvVa31YwLB1V/UMkt7J
	8WJS5jztNy5Quipooxa45hk5+88Elc8Cp+lGVH6DBTrT/cc/qMUuSNOSlGVgeyM2IbcURQ+LJB5dH
	Yr37gLRoh+TDbbHgaEOmDArWdZuuaEpreri5IGA5pnbDsyyzbi83b/COYDRHEWSoNkOmpvJTOenoL
	ASjXpw6OQf/CGXmyPPo4bRLoHL41YcCbSRLHbWNHje94W16/ozdQl/gq/7frodJbPtmD8yL7+Phra
	h+qZklLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eIb-00000006qOt-0j9b;
	Fri, 17 Oct 2025 06:50:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eIS-00000006qAi-1DNb;
	Fri, 17 Oct 2025 06:50:41 +0000
X-UUID: 958420f8ab2511f0a52f393f94899d25-20251016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GaCDgUVMB4sgbM1/K5J9BFG9g9jS7vE/ZZlkt+ZP8pY=;
	b=mTcrjCdCN/dyS1M3XB9SSDiYtq19yW0J5mj/4bZLuBcQtAMmDvtSlRKOpru5IQVXILeJct6jkylyXweij+9ZJg3NsebE32l5hLkcjrB3IKngfyRJLvQ2JL+DywWoFG1srnoOsI0LlTM7EGUwOOH26WVmw9GpMVvcQuPod+1d6iI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:dbdc869c-d8be-4673-ab81-947a80238925,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:1ec17d02-eaf8-4c8c-94de-0bc39887e077,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 958420f8ab2511f0a52f393f94899d25-20251016
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1700305605; Thu, 16 Oct 2025 23:50:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 17 Oct 2025 14:50:31 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Fri, 17 Oct 2025 14:50:31 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Paul-PL
 Chen" <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
	"Xiandong Wang" <xiandong.wang@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
	<wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v8 16/20] soc: mediatek: mtk-cmdq: Remove shift_pa parameter from cmdq_pkt_jump()
Date: Fri, 17 Oct 2025 14:44:41 +0800
Message-ID: <20251017065028.1676930-17-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_235040_359899_03F51485 
X-CRM114-Status: GOOD (  12.94  )
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

Since shift_pa will be stored in the cmdq_mbox_priv structure within
cmdq_pkt, all shift_pa parameters in CMDQ helper APIs can be removed.

Remove the shift_pa parameters from cmdq_pkt_jump(), cmdq_pkt_jump_abs(),
and cmdq_pkt_jump_rel().

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c |  6 +++---
 include/linux/soc/mediatek/mtk-cmdq.h  | 20 ++++++++------------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 1b4d4a1e2984..0ab87eb04614 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -562,7 +562,7 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 }
 EXPORT_SYMBOL(cmdq_pkt_assign);
 
-int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
+int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr)
 {
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_JUMP,
@@ -573,11 +573,11 @@ int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 }
 EXPORT_SYMBOL(cmdq_pkt_jump_abs);
 
-int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
+int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset)
 {
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_JUMP,
-		.value = (u32)offset >> shift_pa
+		.value = (u32)offset >> pkt->priv.shift_pa
 	};
 	return cmdq_pkt_append_command(pkt, inst);
 }
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index f6dc43c036bd..af66410b06d1 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -411,17 +411,15 @@ int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mas
  *			 contains more instruction.
  * @pkt:        the CMDQ packet
  * @addr:       absolute physical address of target instruction buffer
- * @shift_pa:	shift bits of physical address in CMDQ instruction. This value
- *		is got by cmdq_get_shift_pa().
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa);
+int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr);
 
 /* This wrapper has to be removed after all users migrated to jump_abs */
-static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
+static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
 {
-	return cmdq_pkt_jump_abs(pkt, addr, shift_pa);
+	return cmdq_pkt_jump_abs(pkt, addr);
 }
 
 /**
@@ -431,12 +429,10 @@ static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_
  *			 target address should contains more instruction.
  * @pkt:	the CMDQ packet
  * @offset:	relative offset of target instruction buffer from current PC.
- * @shift_pa:	shift bits of physical address in CMDQ instruction. This value
- *		is got by cmdq_get_shift_pa().
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
+int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset);
 
 /**
  * cmdq_pkt_jump_rel_temp() - Temporary wrapper for new CMDQ helper API
@@ -453,7 +449,7 @@ int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
  */
 static inline int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
 {
-	return cmdq_pkt_jump_rel(pkt, offset, shift_pa);
+	return cmdq_pkt_jump_rel(pkt, offset);
 }
 
 /**
@@ -595,17 +591,17 @@ static inline int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
+static inline int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr)
 {
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
+static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
 {
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
+static inline int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset)
 {
 	return -EINVAL;
 }
-- 
2.43.0


