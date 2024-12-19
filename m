Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6721E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUT1JwBWs0wOuZXKyI9HccLAelHDrL1HaPlNIv++Bbg=; b=A3vWn2T/5ASpuC6jDh5TpTFGZZ
	FHtytNNqW+QrMfOZUlBo3ORL6O/8gKHDve90vavZHngA0J3gjC5VdheFkox7sj0CGRxVICE50qPpZ
	aw75C7snQ+PgR+LH9GaQMQzwHbfaDeiuojQ8LFxvG6hSaXBlAG1V5psFrqv+25+oT59IlJnpCju7m
	4b2uMzJSNAvICWpSkhzriC8JwA6S47GBUmtuAun9hClY5FBjM0bo53/Y7uv6fr0CLOladyGMrBy9C
	NffhJ+EzC5XS0mRXPVTJr54WUt2LJhUjW/JrdpA5XzIntmJn1guYGQqEVbgqcpbVJVKfIeFGsglpG
	zy1zdiNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOK58-00000002V45-1xjc;
	Thu, 19 Dec 2024 17:13:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOK34-00000002UY3-0VyR;
	Thu, 19 Dec 2024 17:10:55 +0000
X-UUID: d031fe60be2b11ef82ff63e91e7eb18c-20241219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lUT1JwBWs0wOuZXKyI9HccLAelHDrL1HaPlNIv++Bbg=;
	b=prtAwouA6Nt5xMvqIKp0DnLdEAIcRZfQB+o8i9uwzSOPi8eZM8EyusG5eyRcjBcj/kEnWspKnnsmVQ5JZsFsS671YCyPmcl/s0B9W85pAV7cYCFFqpS2dp4hFR6OSAKqQYC87q70XsESHBTmGrsLjT9tWIHENYvSSBoGFVBgfnM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:a46e8e94-7632-41c9-bc17-bb5e37d51c45,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:-32768,SF:-32768,FILE:0,BULK:-32768,RULE:Rele
	ase_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:a8923e3c-e809-4df3-83cd-88f012b9e9ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d031fe60be2b11ef82ff63e91e7eb18c-20241219
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1197037088; Thu, 19 Dec 2024 10:08:05 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 01:08:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 01:08:02 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 4/7] soc: mediatek: mtk-cmdq: Add mminfra_offset compatibility for DRAM address
Date: Fri, 20 Dec 2024 01:07:57 +0800
Message-ID: <20241219170800.2957-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_091054_160565_7F298E5F 
X-CRM114-Status: GOOD (  15.92  )
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

Since GCE has been moved to mminfra in MT8196, all transactions from
mminfra to DRAM will have their addresses adjusted by subtracting a
mminfra offset.
This information should be handled inside the CMDQ driver, allowing
CMDQ users to call CMDQ APIs as usual.

Therefore, CMDQ driver needs to use the mbox API to get the
mminfra_offset value of the SoC, and then add it to the DRAM address
when generating instructions to ensure GCE accesses the correct DRAM
address.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 35 ++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index aa9853100d78..f2853a74af01 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -314,10 +314,22 @@ EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
 
 int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_addr)
 {
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
 	const u16 high_addr_reg_idx  = CMDQ_THR_SPR_IDX0;
 	const u16 value_reg_idx = CMDQ_THR_SPR_IDX1;
 	int ret;
 
+	if (!cl) {
+		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	if (cmdq_addr_need_offset(cl->chan, src_addr))
+		src_addr += cmdq_get_offset_pa(cl->chan);
+
+	if (cmdq_addr_need_offset(cl->chan, dst_addr))
+		dst_addr += cmdq_get_offset_pa(cl->chan);
+
 	/* read the value of src_addr into high_addr_reg_idx */
 	ret = cmdq_pkt_assign(pkt, high_addr_reg_idx, CMDQ_ADDR_HIGH(src_addr));
 	if (ret < 0)
@@ -428,10 +440,19 @@ EXPORT_SYMBOL(cmdq_pkt_poll_mask);
 
 int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mask)
 {
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
 	struct cmdq_instruction inst = { {0} };
 	u8 use_mask = 0;
 	int ret;
 
+	if (!cl) {
+		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	if (cmdq_addr_need_offset(cl->chan, addr))
+		addr += cmdq_get_offset_pa(cl->chan);
+
 	/*
 	 * Append an MASK instruction to set the mask for following POLL instruction
 	 * which enables use_mask bit.
@@ -509,11 +530,21 @@ EXPORT_SYMBOL(cmdq_pkt_assign);
 
 int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 {
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_JUMP,
-		.offset = CMDQ_JUMP_ABSOLUTE,
-		.value = addr >> shift_pa
+		.offset = CMDQ_JUMP_ABSOLUTE
 	};
+
+	if (!cl) {
+		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	if (cmdq_addr_need_offset(cl->chan, addr))
+		addr += cmdq_get_offset_pa(cl->chan);
+
+	inst.value = addr >> shift_pa;
 	return cmdq_pkt_append_command(pkt, inst);
 }
 EXPORT_SYMBOL(cmdq_pkt_jump_abs);
-- 
2.43.0


