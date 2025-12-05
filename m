Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC62D2E00A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 06:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6KEPQoelIaSRZixu2FcCj8GjygNUojPP6SBnzoaIaQY=; b=zQ2gvPq0qqfnei5IAc56Yk4vno
	wJydLSaQiWLtlNe5VdRt4eht5zrJfRWwRWWHkCH/3VaLzwakd3uDdWS7PC0LgNL+6dn0tc4EYI1aG
	Dv8xfC1k5IqFfBSXZ4/qGEj+I7ZSFo8pw/5t0qjAry1G3XvSIaz5MgJNT19ID4y2x/XBS9vjFGfEK
	Ku84Lt0euq+ChH0GqXtxKQT9jSc+nrQhEwH5jlxhCV/4guOrG/izo5y2k+n8YKH+rl+g8LIPEMrUI
	qy+h0NsspSTQdJ0lR/2UwJxrvbnPODoojdkcrL/SnUD5UVZEWUclJVO4ewwdWzgMtYAttz7R258wi
	Cm+KS7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRPOe-000000096Iq-0UOH;
	Fri, 05 Dec 2025 06:34:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRPOK-000000096Hx-0hiV;
	Fri, 05 Dec 2025 06:34:25 +0000
X-UUID: 6367be72d1a411f0a52f393f94899d25-20251204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6KEPQoelIaSRZixu2FcCj8GjygNUojPP6SBnzoaIaQY=;
	b=H3Wv+ObblLDqKZeXQixbULvCLrY4JTwiWjLZ8weIgu9Q3gZJYAQQAo3uweCUusVq2mIBVBLoeUU+5H/HSt5XNnRlFj33v/6OydGCK56YmBvkrx/w+UsmEQ7Xsk6SiOU13hLxPheCVzC9UhkDjoNZWlIlVjSoE3dYKVTpJbAG2pM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:228c84e4-6b07-4107-b38b-1a1b90cfe823,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:bdd66e02-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6367be72d1a411f0a52f393f94899d25-20251204
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ot_zexin.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 128554292; Thu, 04 Dec 2025 23:34:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 5 Dec 2025 14:33:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 5 Dec 2025 14:33:58 +0800
From: Zexin Wang <ot_zexin.wang@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Zexin Wang
	<ot_zexin.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>, Jack
 Hsu <jh.hsu@mediatek.com>
Subject: [PATCH] reset-controller: ti: introduce a new reset handler
Date: Fri, 5 Dec 2025 14:33:54 +0800
Message-ID: <20251205063356.13515-1-ot_zexin.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_223408_316934_90383596 
X-CRM114-Status: GOOD (  13.55  )
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

Introduce ti_syscon_reset() to integrate assert and deassert together.
If some modules need do serialized assert and deassert operations
to reset itself, reset_control_reset can be called for convenience.

Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>
---
 drivers/reset/reset-ti-syscon.c | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
index 23f86ddb8668..f37685e32b0a 100644
--- a/drivers/reset/reset-ti-syscon.c
+++ b/drivers/reset/reset-ti-syscon.c
@@ -7,6 +7,7 @@
  *	Suman Anna <afd@ti.com>
  */
 
+#include <linux/delay.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -42,12 +43,14 @@ struct ti_syscon_reset_control {
  * @regmap: regmap handle containing the memory-mapped reset registers
  * @controls: array of reset controls
  * @nr_controls: number of controls in control array
+ * @reset_duration_us: time of controller assert reset
  */
 struct ti_syscon_reset_data {
 	struct reset_controller_dev rcdev;
 	struct regmap *regmap;
 	struct ti_syscon_reset_control *controls;
 	unsigned int nr_controls;
+	unsigned int reset_duration_us;
 };
 
 #define to_ti_syscon_reset_data(_rcdev)	\
@@ -150,9 +153,37 @@ static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
 		!(control->flags & STATUS_SET);
 }
 
+/**
+ * ti_syscon_reset() - perform a full reset cycle on a device
+ * @rcdev: reset controller entity
+ * @id: ID of the reset to be asserted and deasserted
+ *
+ * This function performs a full reset cycle by asserting and then
+ * deasserting the reset signal for a device. It ensures the device
+ * is properly reset and ready for operation.
+ *
+ * Return: 0 for successful request, else a corresponding error value
+ */
+static int ti_syscon_reset(struct reset_controller_dev *rcdev,
+		   unsigned long id)
+{
+	struct ti_syscon_reset_data *data = to_ti_syscon_reset_data(rcdev);
+	int ret;
+
+	ret = ti_syscon_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	if (data->reset_duration_us)
+		usleep_range(data->reset_duration_us, data->reset_duration_us * 2);
+
+	return ti_syscon_reset_deassert(rcdev, id);
+}
+
 static const struct reset_control_ops ti_syscon_reset_ops = {
 	.assert		= ti_syscon_reset_assert,
 	.deassert	= ti_syscon_reset_deassert,
+	.reset		= ti_syscon_reset,
 	.status		= ti_syscon_reset_status,
 };
 
@@ -196,6 +227,9 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
 		controls[i].flags = be32_to_cpup(list++);
 	}
 
+	of_property_read_u32(pdev->dev.of_node, "reset-duration-us",
+			     &data->reset_duration_us);
+
 	data->rcdev.ops = &ti_syscon_reset_ops;
 	data->rcdev.owner = THIS_MODULE;
 	data->rcdev.of_node = np;
-- 
2.45.2


