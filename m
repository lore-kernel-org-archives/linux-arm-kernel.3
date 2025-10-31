Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583D5CCFA09
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 15:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dtp9ROovLQiWfFN8FjIVqf9lkWCcFmW8lai1C8SSfxg=; b=YLRCFBduGJLBAe7QbKpRrbpuip
	ACA5vJGs3Tgig4QMpkp5QXURhf2wOSttbyCz0sAbyMlFw1AuKdLxQWsZBXi9XMo6zP9WIOLGONwFm
	5kfqP1r3RzwrcIlwJ45JZowEJoDauJNHUEIfFYbGJxItGna3qZLFMkokefUXD0OdJ30ZjfQnZiFy1
	UIIwg4odbTj/LXReEBAshrKfUF/zC/5V4EY1HfBcwMymvyFwmK2oXiehUEqZ1KwN0X0Hm2GPYxsCn
	JUMn+8p0YhBdDMgnsVLbJ+k9kTDiIIc3EdKh8JvazKNwjHKwa5b6C5bPC4v3mMm1RcKSv48CBRj/u
	ZsqW4l8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErX7-00000006LKD-1h7g;
	Fri, 31 Oct 2025 15:59:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErWb-00000006Kxb-2oVc;
	Fri, 31 Oct 2025 15:58:51 +0000
X-UUID: 7a3cde0eb67211f0a52f393f94899d25-20251031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Dtp9ROovLQiWfFN8FjIVqf9lkWCcFmW8lai1C8SSfxg=;
	b=lIADUMlA52zbLVJH8R3TMBFmp52l8AIs0C9I9ifQtqtNpW65tmCZta2xewPmAYkpoxSg6dCMgUxOyHk05uC/Dhi6MJO5A4DzOgk2NYMhPOF9zg1V4m1qBEu77ipv/CbG+fsUoDjOTVNnsmw6n/YB7QP3AylL2Y1pJ9b7S4bCwgk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9fc27151-37e8-49ef-abf2-31621dde922f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:6dbdfedf-3890-4bb9-a90e-2a6a4ecf6c66,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7a3cde0eb67211f0a52f393f94899d25-20251031
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1616077964; Fri, 31 Oct 2025 08:58:44 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 31 Oct 2025 23:58:41 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 31 Oct 2025 23:58:41 +0800
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
Subject: [PATCH 9/9] soc: mediatek: mtk-cmdq: Add mminfra_offset adjustment for DRAM addresses
Date: Fri, 31 Oct 2025 23:56:37 +0800
Message-ID: <20251031155838.1650833-10-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
References: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_085849_738531_9300D7BC 
X-CRM114-Status: GOOD (  13.85  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index b30715ef0d6f..67e5879374ac 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -372,6 +372,7 @@ int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_
 	int ret;
 
 	/* read the value of src_addr into high_addr_reg_idx */
+	src_addr += pkt->priv.mminfra_offset;
 	ret = cmdq_pkt_assign(pkt, high_addr_reg_idx, CMDQ_ADDR_HIGH(src_addr));
 	if (ret < 0)
 		return ret;
@@ -380,6 +381,7 @@ int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_
 		return ret;
 
 	/* write the value of value_reg_idx into dst_addr */
+	dst_addr += pkt->priv.mminfra_offset;
 	ret = cmdq_pkt_assign(pkt, high_addr_reg_idx, CMDQ_ADDR_HIGH(dst_addr));
 	if (ret < 0)
 		return ret;
@@ -505,7 +507,7 @@ int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mas
 	inst.op = CMDQ_CODE_MASK;
 	inst.dst_t = CMDQ_REG_TYPE;
 	inst.sop = CMDQ_POLL_ADDR_GPR;
-	inst.value = addr;
+	inst.value = addr + pkt->priv.mminfra_offset;
 	ret = cmdq_pkt_append_command(pkt, inst);
 	if (ret < 0)
 		return ret;
@@ -565,7 +567,7 @@ int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_JUMP,
 		.offset = CMDQ_JUMP_ABSOLUTE,
-		.value = addr >> shift_pa
+		.value = (addr +  pkt->priv.mminfra_offset) >> pkt->priv.shift_pa
 	};
 	return cmdq_pkt_append_command(pkt, inst);
 }
-- 
2.43.0


