Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B6BC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 17:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRm2ZBj01ExcdoMgmYichtr29lp5+djxG/jIXWfxSLI=; b=4hDbIJ6Rhni4psUXGJKV+yPsgT
	VRmzEsoWTYVN5wKdJNWCYQp7hpbTtVuX6mhO9WUgun54ot517gcIkDzGk6oUEW4gSk6MEHnq1T1hX
	K/i7zEe2jGYSq6YF9EvpcLvfgGUAWlyYxih1A5skdwwWfPmQdSbfFhKy3bPUBJ6yR6bXSGUNXGueE
	COrqlCcVawEHcFnvNLpWuHWzgEMraDLlsRGYG0kgK8Xc0tWVR6LrntA3BvFhm84seylNaEF0bs0xB
	kP3rMokEJJTOhtj5C2RPuE8+TqUM+B+AfOj/sYBtmzXUZyU/iZaF22tr0z+FPQR2Zg6J2SObbDt3C
	WLXKsxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLmrS-00000005nin-28R1;
	Sun, 01 Jun 2025 17:52:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLmZY-00000005l1Q-3T2u;
	Sun, 01 Jun 2025 17:34:14 +0000
X-UUID: 9f4169bc3f0e11f08d385d50fb11b32d-20250601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QRm2ZBj01ExcdoMgmYichtr29lp5+djxG/jIXWfxSLI=;
	b=U1h6dKntqFekBIqqX/lOVJJGzv89Cx6bryJ/a6NQ/AxtBH6FMSpYDqn0hS/Y9M+2gfyq/L3BOMuVbhhHLu1iIYBNHPHFRLvtGsrNZ/4sPe0FLSEjZ1HD5U4zseuP4qBpWzfl9nOEj7MXXBmcGQrQqQZraeYVJKUyW/WMGP8MfGo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:7b6bd894-b5cb-49e2-8ec6-675165bf7a97,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:0f24f447-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9f4169bc3f0e11f08d385d50fb11b32d-20250601
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1576358898; Sun, 01 Jun 2025 10:34:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 2 Jun 2025 01:34:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 2 Jun 2025 01:34:04 +0800
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
Subject: [PATCH v6 07/20] mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM transaction
Date: Mon, 2 Jun 2025 01:31:39 +0800
Message-ID: <20250601173355.1731140-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
References: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_103412_893548_F880A4EE 
X-CRM114-Status: GOOD (  18.07  )
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

The GCE in MT8196 is placed in MMINFRA and requires all addresses
in GCE instructions for DRAM transactions to be IOVA.

Due to MMIO, if the GCE needs to access a hardware register at
0x1000_0000, but the SMMU is also mapping a DRAM block at 0x1000_0000,
the MMINFRA will not know whether to write to the hardware register or
the DRAM.
To solve this, MMINFRA treats addresses greater than 2G as data paths
and those less than 2G as config paths because the DRAM start address
is currently at 2G (0x8000_0000). On the data path, MMINFRA remaps
DRAM addresses by subtracting 2G, allowing SMMU to map DRAM addresses
less than 2G.
For example, if the DRAM start address 0x8000_0000 is mapped to
IOVA=0x0, when GCE accesses IOVA=0x0, it must add a 2G offset to
the address in the GCE instruction. MMINFRA will then see it as a
data path (IOVA >= 2G) and subtract 2G, allowing GCE to access IOVA=0x0.

Since the MMINFRA remap subtracting 2G is done in hardware and cannot
be configured by software, the address of DRAM in GCE instruction must
always add 2G to ensure proper access.
This 2G adjustment is referred to as mminfra_offset in the CMDQ driver.
CMDQ helper can get the mminfra_offset from the cmdq_mbox_priv of
cmdq_pkt and add the mminfra_offset to the DRAM address in GCE
instructions.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       | 6 ++++--
 include/linux/mailbox/mtk-cmdq-mailbox.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index e2ea12e9aecb..6f4b9879069e 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -94,6 +94,7 @@ struct cmdq {
 struct gce_plat {
 	u32 thread_nr;
 	u8 shift;
+	dma_addr_t mminfra_offset;
 	bool control_by_sw;
 	bool sw_ddr_en;
 	bool gce_vm;
@@ -102,12 +103,12 @@ struct gce_plat {
 
 static inline u32 cmdq_reg_shift_addr(dma_addr_t addr, const struct gce_plat *pdata)
 {
-	return (addr >> pdata->shift);
+	return ((addr + pdata->mminfra_offset) >> pdata->shift);
 }
 
 static inline dma_addr_t cmdq_reg_revert_addr(u32 addr, const struct gce_plat *pdata)
 {
-	return ((dma_addr_t)addr << pdata->shift);
+	return (((dma_addr_t)addr << pdata->shift) - pdata->mminfra_offset);
 }
 
 void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
@@ -115,6 +116,7 @@ void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
 
 	priv->shift_pa = cmdq->pdata->shift;
+	priv->mminfra_offset = cmdq->pdata->mminfra_offset;
 }
 EXPORT_SYMBOL(cmdq_get_mbox_priv);
 
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 73b70be4a8a7..07c1bfbdb8c4 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -72,6 +72,7 @@ struct cmdq_cb_data {
 
 struct cmdq_mbox_priv {
 	u8 shift_pa;
+	dma_addr_t mminfra_offset;
 };
 
 struct cmdq_pkt {
-- 
2.43.0


