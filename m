Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EAFCCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3ulwxHJNA7hswihzInQINd8DaAlfDn/fES/zl8Z3OM=; b=PKYktNsDeSeRuoZji10vY/IEJK
	AtvOWTKNLk49RKga2Mp7gAZ/0DKn5EJAnWRUU32bjoXLlEv4kOF43iRzvE+8FuBy5DyZTxS43MEBf
	rk8YVvjFUWoc9ZU8X1agFo6n7i7meW/NS2yQndnRoLNfXi74G58Jipa7fcPhUdXl2nGN2QpATyji1
	W1EGpfvZfNkGOnZg8hYEr30jvfGeT/pTbQGdGVr1OqyymbLxrZUYRKD40jB57pqPsLptuIsJmxRGG
	gLHJiHfANjOTtgxJSphE5LZP88T9g7zqEoMoPmKgj0f2hm7D1LCc7rXH1MudAgnzhuC7aADf0+/Yr
	wbJZ67hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eIx-00000006r10-00G5;
	Fri, 17 Oct 2025 06:51:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eIV-00000006qCz-1huA;
	Fri, 17 Oct 2025 06:50:45 +0000
X-UUID: 951e6f60ab2511f0a52f393f94899d25-20251016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=u3ulwxHJNA7hswihzInQINd8DaAlfDn/fES/zl8Z3OM=;
	b=Rp4IzReou/EhVGrQ+ChWtKF/lbktPGh4xwN3rhiaByJuX31NP0T/QxZWkPCdVziUGW+PdyRZOB0l+6s8H9YaVULK72qb9DgvvlQ0B6ekwzvQ/a9w4snUnuYhDo4ic+wIR3PPfEomxb7NjcA0CT0V8lm4V4kq2mPIiVMx5XMUCNM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:54322ee6-71d0-4021-8d11-ae943fe8ac1d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:24da5086-2e17-44e4-a09c-1e463bf6bc47,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 951e6f60ab2511f0a52f393f94899d25-20251016
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 577931186; Thu, 16 Oct 2025 23:50:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 17 Oct 2025 14:50:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Fri, 17 Oct 2025 14:50:30 +0800
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
Subject: [PATCH v8 09/20] soc: mediatek: mtk-cmdq: Add pa_base parsing for hardware without subsys ID support
Date: Fri, 17 Oct 2025 14:44:34 +0800
Message-ID: <20251017065028.1676930-10-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_235043_520241_C615870B 
X-CRM114-Status: GOOD (  19.31  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 16 ++++++++++++++--
 include/linux/soc/mediatek/mtk-cmdq.h  |  3 +++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 8feeaa320359..80806fbeba91 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/mailbox_controller.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
@@ -60,20 +61,31 @@ int cmdq_dev_get_client_reg(struct device *dev,
 			    struct cmdq_client_reg *client_reg, int idx)
 {
 	struct of_phandle_args spec;
+	struct resource res;
 	int err;
 
 	if (!client_reg)
 		return -ENOENT;
 
+	err = of_address_to_resource(dev->of_node, 0, &res);
+	if (err) {
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
index 9b6d855cacb9..154d0511a0ad 100644
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


