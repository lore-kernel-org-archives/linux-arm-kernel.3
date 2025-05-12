Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C733C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 09:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WA0P4hHdm4z//WaWwsVofGnr1xehjmWJd1XiiZDj2eY=; b=Bj0kuHjSyzQ50RVw1/kvw9QKf6
	dLazL1iRREmVCSfh6+qaskTmgpdZblL23LssLc8+BiwgM0TMPTSNQID87RLEypiAiXfHwTCH0KBZV
	e9EJfOfBBg771pu9ouW13DjzgE34U097C9zteK1wdlp4KOpDMcqn3UeqEMX/bbwkjxOYlPEPg101S
	drjTeB8f9fuCIMuHxWQGQV+jiR67pxNefhPQa9G5wrOhag4kS8lxRfLp0NWJ4chZFppk04VBbadWp
	BaeaARGC7PqCtofPvLbEFEnaWlBcWpTaWK83PTPZO0vLpWBhrRENqUxN3Z2RfM3GBQPE5UngPmctT
	GnrIS1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPpB-000000090kd-05uX;
	Mon, 12 May 2025 09:51:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPNJ-00000008uCg-3R5u;
	Mon, 12 May 2025 09:23:08 +0000
X-UUID: b300050a2f1211f08d385d50fb11b32d-20250512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WA0P4hHdm4z//WaWwsVofGnr1xehjmWJd1XiiZDj2eY=;
	b=ue9TWNYRT8NdIntlUUonw1c5BJYp0RZ8uV8ucPeW4bbNEjR5RC4rmZDtN6mMCfdAExLXL8JaYOxnqvKxYS4sjH2q5jRMDLdhTVeL7qLm7BBAJbnLVcljjWTnTHQ5ra6vO5U68xG43Z/e+G1OhxZJ/TqaFTWyNl80rR0t4eEuiXs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:c525040d-b84c-4c10-b24e-99d8928f9001,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:c5889cb7-5e6b-4d0f-a080-a5e9cb36bea6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b300050a2f1211f08d385d50fb11b32d-20250512
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 943858520; Mon, 12 May 2025 02:23:00 -0700
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
Subject: [PATCH RESEND v5 16/20] soc: mediatek: mtk-cmdq: Add mminfra_offset adjustment for DRAM addresses
Date: Mon, 12 May 2025 17:19:38 +0800
Message-ID: <20250512092252.905629-17-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512092252.905629-1-jason-jh.lin@mediatek.com>
References: <20250512092252.905629-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_022305_912792_47436213 
X-CRM114-Status: GOOD (  13.64  )
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

Since GCE has been moved to MMINFRA in MT8196, all transactions from
MMINFRA to DRAM will have their addresses adjusted by subtracting a
mminfra_offset.

Therefore, the CMDQ helper driver needs to get the mminfra_offset value
of the SoC from cmdq_mbox_priv of cmdq_pkt and then add it to the DRAM
address when generating instructions to ensure GCE accesses the correct
DRAM address. CMDQ users can then call CMDQ helper APIs as usual.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index fd978fbd684b..0a718ffa5f3b 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -358,6 +358,7 @@ int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_
 	int ret;
 
 	/* read the value of src_addr into high_addr_reg_idx */
+	src_addr += pkt->priv.mminfra_offset;
 	ret = cmdq_pkt_assign(pkt, high_addr_reg_idx, CMDQ_ADDR_HIGH(src_addr));
 	if (ret < 0)
 		return ret;
@@ -366,6 +367,7 @@ int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_
 		return ret;
 
 	/* write the value of value_reg_idx into dst_addr */
+	dst_addr += pkt->priv.mminfra_offset;
 	ret = cmdq_pkt_assign(pkt, high_addr_reg_idx, CMDQ_ADDR_HIGH(dst_addr));
 	if (ret < 0)
 		return ret;
@@ -491,7 +493,7 @@ int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mas
 	inst.op = CMDQ_CODE_MASK;
 	inst.dst_t = CMDQ_REG_TYPE;
 	inst.sop = CMDQ_POLL_ADDR_GPR;
-	inst.value = addr;
+	inst.value = addr + pkt->priv.mminfra_offset;
 	ret = cmdq_pkt_append_command(pkt, inst);
 	if (ret < 0)
 		return ret;
@@ -551,7 +553,7 @@ int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr)
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_JUMP,
 		.offset = CMDQ_JUMP_ABSOLUTE,
-		.value = addr >> pkt->priv.shift_pa
+		.value = (addr +  pkt->priv.mminfra_offset) >> pkt->priv.shift_pa
 	};
 	return cmdq_pkt_append_command(pkt, inst);
 }
-- 
2.43.0


