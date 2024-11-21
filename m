Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B21CD75BB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 04:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJDZ8TbEOg8kfWuALOz+YShjGUyzgs27hJEVqgGGWq4=; b=TRFhyzn2V1q95uggfIxuaVtSFo
	2RV3qp1DIhqI+pbcPeRfhUz+vefC/rQeiFvqh1QP+XmPe4axD2LQTU44EahlGaTzBzCbwNgO/y2Ib
	DOSqw/QcE8aWSTtdBzCnzXyWplEoeSq1DeI9PHJvZ4HdsWEjLoXhPMMC7+hewG3WlDAyBnpkfQDYs
	imYz4U+dtWbMmSVFCe7oMbNGBvb4mKj1JJ85VeNbQf9cRILnTi74fiNVJfhw37yEVgb2CEx7LNjwh
	aLyJRFFc74vB22d9+yXflct2F7ifPsrFa4pKLmO9/MzQxeA5pHqu2d7c/x/Xu/p4Whq+LL76PrMH5
	fFd1W+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyoU-0000000Gmt9-1rx6;
	Thu, 21 Nov 2024 04:29:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDylg-0000000Gm4X-2Iol;
	Thu, 21 Nov 2024 04:26:14 +0000
X-UUID: ba91618aa7c011ef9048ed6ed365623b-20241120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mJDZ8TbEOg8kfWuALOz+YShjGUyzgs27hJEVqgGGWq4=;
	b=lJ7Fk6GJHltgO5mTmTR7V8w82jcMT+ncF2fNdF0gODkrxb4fHG1+Oxwewpy5y6gwEzyeQxPxtzuMWrVsfWK3zSwQbYWL+QR8kZQMCuBTFgPf3EJSfWYgTwG53Mu/ysY4i2pc281E4FWX/SqErO60Nc2wpaXkvudeN2FJsxxHGqc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:d6774103-3157-4f0b-a40b-40fab6e5269f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:0f1b8fa0-f395-4dfc-8188-ce2682df7fd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ba91618aa7c011ef9048ed6ed365623b-20241120
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1281435047; Wed, 20 Nov 2024 21:26:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 12:26:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 12:26:04 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Moudy
 Ho <moudy.ho@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 5/8] soc: mediatek: mtk-cmdq: Add mminfra_offset compatibility for DRAM address
Date: Thu, 21 Nov 2024 12:25:59 +0800
Message-ID: <20241121042602.32730-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_202612_587384_BA6F0FFC 
X-CRM114-Status: GOOD (  17.51  )
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
 drivers/soc/mediatek/mtk-cmdq-helper.c | 43 +++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index ffdf3cecf6fe..bd2aa9152afc 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -222,6 +222,9 @@ int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base, u16 offset, u32
 	if (cmdq_subsys_is_valid(cl->chan, subsys)) {
 		err = cmdq_pkt_append_command(pkt, inst);
 	} else {
+		if (cmdq_addr_need_offset(cl->chan, pa_base))
+			pa_base += cmdq_get_offset_pa(cl->chan);
+
 		err = cmdq_pkt_assign(pkt, 0, CMDQ_ADDR_HIGH(pa_base));
 		if (err < 0)
 			return err;
@@ -255,12 +258,16 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 		}
 		err = cmdq_pkt_write(pkt, subsys, pa_base, offset_mask, value);
 	} else {
+		if (cmdq_addr_need_offset(cl->chan, pa_base))
+			pa_base += cmdq_get_offset_pa(cl->chan);
+
 		err = cmdq_pkt_assign(pkt, 0, CMDQ_ADDR_HIGH(pa_base));
 		if (err < 0)
 			return err;
 
 		err = cmdq_pkt_write_s_mask_value(pkt, 0, CMDQ_ADDR_LOW(offset), value, mask);
 	}
+
 	return err;
 }
 EXPORT_SYMBOL(cmdq_pkt_write_mask);
@@ -347,10 +354,22 @@ EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
 
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
@@ -450,6 +469,9 @@ int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 	}
 
 	if (!cmdq_subsys_is_valid(cl->chan, subsys)) {
+		if (cmdq_addr_need_offset(cl->chan, pa_base))
+			pa_base += cmdq_get_offset_pa(cl->chan);
+
 		err = cmdq_pkt_assign(pkt, CMDQ_POLL_ADDR_GPR, pa_base);
 		if (err < 0)
 			return err;
@@ -480,10 +502,19 @@ EXPORT_SYMBOL(cmdq_pkt_poll_mask);
 
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
@@ -561,11 +592,21 @@ EXPORT_SYMBOL(cmdq_pkt_assign);
 
 int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 {
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_JUMP,
 		.offset = CMDQ_JUMP_ABSOLUTE,
-		.value = addr >> shift_pa
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


