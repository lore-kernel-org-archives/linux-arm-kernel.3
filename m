Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2557EFEA809
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 04:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jt6qClMpSxG69acldOGZvCU50hx3UA7l99LsgXHFcPc=; b=3qmL7iDrd66g6X42IunMt5H7dY
	jyjbrfa83XL+B+HdP4K2rXjLtesJNQuDtiml+ivjkYHMBU7FZkauFYVKOUE51TIFRPVpgopUcOlLy
	tn0fGu4hLZeik+ddXi+AwtX6eQZCxwb2EaiBZ7ph8gqHWpkVaxba7vceec8ty/6Lv1CtlQaWROFK7
	bcZOuhwwU3X8lT+YuH00elI524JAlgFoM35KjL1iGBA49aOtuQsCp0CQovU3B2+sqEaex1G6xAneo
	h5IzmHBIaDEi0oycSQQZF44d++OuDVWWODDeMLyH79Tv/EgNFHRGF2p4HicGodH2wkBugRfPKCFnz
	v6J+NM1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FSL-00000002deF-1xeb;
	Wed, 25 Mar 2026 04:02:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FSI-00000002dcv-3Z1g;
	Wed, 25 Mar 2026 04:02:56 +0000
X-UUID: 79528e0e27ff11f19e7563141e833ce8-20260324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Jt6qClMpSxG69acldOGZvCU50hx3UA7l99LsgXHFcPc=;
	b=KYLPQK3+p3RuuDYI4LT+vpeLoaNia2VmeX2y/2RNGI1lwzIkAM+v08LdtwJfUD1xsMgv1haADwxkaPboyW0cPps85SEZy+xyaFs3OwRE6QvjuNAGtTSFfzTR/doJWkAafTRQx1npDo78iJCpeElNg5VQLIOaWr6DnkUD839Idag=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5062d224-07a1-48ed-af92-0f4e8cee9302,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:a1b32d94-f8ef-4ca8-bea0-143568f9ca1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 79528e0e27ff11f19e7563141e833ce8-20260324
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1836729477; Tue, 24 Mar 2026 21:02:43 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 12:02:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Mar 2026 12:02:40 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
	Chen-yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>
Subject: [PATCH v2 1/2] soc: mediatek: mtk-cmdq: Remove shift_pa parameter from cmdq_pkt_jump()
Date: Wed, 25 Mar 2026 12:02:09 +0800
Message-ID: <20260325040239.2112517-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260325040239.2112517-1-jason-jh.lin@mediatek.com>
References: <20260325040239.2112517-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_210254_895040_C16F9C87 
X-CRM114-Status: GOOD (  13.13  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c |  6 +++---
 include/linux/soc/mediatek/mtk-cmdq.h  | 20 ++++++++------------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index f8ee6c9ade89..9cec6a096d8b 100644
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
index 03bb85462566..3d0de1a9cac1 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -418,17 +418,15 @@ int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mas
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
@@ -438,12 +436,10 @@ static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_
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
@@ -460,7 +456,7 @@ int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
  */
 static inline int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
 {
-	return cmdq_pkt_jump_rel(pkt, offset, shift_pa);
+	return cmdq_pkt_jump_rel(pkt, offset);
 }
 
 /**
@@ -602,17 +598,17 @@ static inline int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32
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


