Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3AAC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 09:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+v/Rc3SBBjUvwh1R52tOKlSxyh4mqwDsnkbk64LocQ=; b=MepbVKjOYxvFuDTChRX/9JncKD
	BNJDjmHua510EOqKd4fP18zwFZn/K5Rt1HS3KdYntG5YpvKgC0kpOwbVwyywtWDehSw3q6MNTpjZA
	7xHbk0Mhz2BPLxur/4mEd26v/jQ6HnfQIrdJ7jtVMSXMz9VQ1YtR1NEZvg60C52gjCiK+xGzziI/4
	/M6nVAg58EPA8JhYcpsnqtXLNyKJpRNxLuF2Ao7Psswl3t4XQGyURqut8AdPZT5Be/C+ac7TG3lgp
	Au46uanDvaj5QL28vtEzUcLz5DUA2ZOvLvpYMjflc1ii2vgvQeaAmBZ00y1OaEZt/mydJ1mMNteBb
	79mn/aEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPb3-00000008xqa-06jV;
	Mon, 12 May 2025 09:37:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPNI-00000008uEB-1G7L;
	Mon, 12 May 2025 09:23:05 +0000
X-UUID: b13b6f842f1211f08d385d50fb11b32d-20250512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=b+v/Rc3SBBjUvwh1R52tOKlSxyh4mqwDsnkbk64LocQ=;
	b=uwWkioT3q8XjNJ0pu3V5SW4vR/gXdjJtpahhQkyu2qC1j4aePgrgl0EwFWIn6Jy78FK0aWIoA/+hXwyxq33+dJyPn9MK1fcE35egzmxCdmgV2KWOz1Hgz5Cugb+VxL4+YIlCrb6I115++WQnTPkimFXOQEEflT03jgzDOKzz2Bs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:c342a468-2629-439a-b141-4586ba6800bf,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:5d736d51-76c0-4e62-bb75-246dfb0889c6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b13b6f842f1211f08d385d50fb11b32d-20250512
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 839640827; Mon, 12 May 2025 02:22:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
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
Subject: [PATCH RESEND v5 14/20] soc: mediatek: mtk-cmdq: Add pa_base parsing for hardware without subsys ID support
Date: Mon, 12 May 2025 17:19:36 +0800
Message-ID: <20250512092252.905629-15-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512092252.905629-1-jason-jh.lin@mediatek.com>
References: <20250512092252.905629-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_022304_348408_F9D1DF36 
X-CRM114-Status: GOOD (  18.84  )
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

When GCE executes instructions, it typically locates the corresponding
hardware register using the subsys ID. For hardware that does not
support subsys ID, the subsys ID is set to an invalid value, and the
physical address must be used to generate GCE instructions.

The main advantage of using subsys ID is to reduce the number of
instructions. Without subsys ID, an additional `ASSIGN` instruction
is needed to assign the high bytes of the physical address, which can
impact performance if too many instructions are required. However, if
the hardware does not support subsys ID, using the physical address
is the only option to achieve the same functionality.

This commit adds a pa_base parsing flow to the cmdq_client_reg structure
to handle hardware without subsys ID support.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 15 +++++++++++++--
 include/linux/soc/mediatek/mtk-cmdq.h  |  3 +++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index a40919555d4d..bae6753bd4a7 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/mailbox_controller.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
@@ -60,20 +61,30 @@ int cmdq_dev_get_client_reg(struct device *dev,
 			    struct cmdq_client_reg *client_reg, int idx)
 {
 	struct of_phandle_args spec;
+	struct resource res;
 	int err;
 
 	if (!client_reg)
 		return -ENOENT;
 
+	if (of_address_to_resource(dev->of_node, 0, &res) != 0) {
+		dev_err(dev, "Missing reg in %s node\n", dev->of_node->full_name);
+		return -EINVAL;
+	}
+	client_reg->pa_base = res.start;
+
 	err = of_parse_phandle_with_fixed_args(dev->of_node,
 					       "mediatek,gce-client-reg",
 					       3, idx, &spec);
 	if (err < 0) {
-		dev_warn(dev,
+		dev_dbg(dev,
 			"error %d can't parse gce-client-reg property (%d)",
 			err, idx);
 
-		return err;
+		/* make subsys invalid */
+		client_reg->subsys = CMDQ_SUBSYS_INVALID;
+
+		return 0;
 	}
 
 	client_reg->subsys = (u8)spec.args[0];
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index f956ee9a0b34..f9a48262cb95 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -23,6 +23,8 @@
 #define CMDQ_THR_SPR_IDX2	(2)
 #define CMDQ_THR_SPR_IDX3	(3)
 
+#define CMDQ_SUBSYS_INVALID	(U8_MAX)
+
 struct cmdq_pkt;
 
 enum cmdq_logic_op {
@@ -52,6 +54,7 @@ struct cmdq_operand {
 
 struct cmdq_client_reg {
 	u8 subsys;
+	phys_addr_t pa_base;
 	u16 offset;
 	u16 size;
 };
-- 
2.43.0


