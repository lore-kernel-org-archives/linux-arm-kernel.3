Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BE4CF884D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 12:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oJiCAFnSSqs+1N9A+csqjVeGPs0gjhYFNbYsa4KcUk=; b=3giB6s9tx73FbEMATvr/c93FL6
	dPIVr7db9/LuKgfWwJYJKj22J31XjbbL+acz2I7jTaTJ9BT7q03kQvYgI7i74noFOD/9ot2TMSthf
	5BmuMA+MrLgpUkaHFb+nT5MJ4Efb5hq89ODx3oxR4b3agAZq5l0DlaCbboCefnuNvR5f6ZmIWfBwv
	iyjgjJpGP4cRmmPHVgwfYoxA/VBnse/H8j4F77pvgY60uwM94rwiUeKL4ztY6dQbVU3T20GjXq06w
	uOBXbmg1oY+/VEo+4bg2KV18F2Z+L/GiTWiFkjy1zAKgThDgH87GoohCo5HoqDy8ySE0Fxa637OVJ
	7PJ30knQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3cW-00000006ec6-1oYa;
	Thu, 20 Nov 2025 12:18:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3cH-00000006eT5-0FHV;
	Thu, 20 Nov 2025 12:18:26 +0000
X-UUID: 004b5e60c60b11f0a52f393f94899d25-20251120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3oJiCAFnSSqs+1N9A+csqjVeGPs0gjhYFNbYsa4KcUk=;
	b=hro9HM45egRCiqNPb1aaGP/9VmY++bU9EtV8CCcB4YEWOrqfXRH1119hYaHKq95TMnzb++ITZ31Kj3v4KzEv82Y/OLOGtEE7wmpmBiMTA5bKnmIHQwXd+zlbgUNgnJOqsp5SjPuUkpL2XlMJr0/uqy+7Nu02o82Sw9ChGpRhg2Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9927cfe0-35d5-4ad7-b651-18fe3e58f891,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:e1dab1e0-f48b-4fea-bcf0-ae56d774aa1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|836|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 004b5e60c60b11f0a52f393f94899d25-20251120
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1681094992; Thu, 20 Nov 2025 05:18:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 20 Nov 2025 20:18:17 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 20 Nov 2025 20:18:16 +0800
From: <ot_shunxi.zhang@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Eddie Huang
	<eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Lee Jones <lee@kernel.org>, Shunxi
 Zhang <ot_shunxi.zhang@mediatek.com>, <Vince-WL.Liu@mediatek.com>,
	<sirius.wang@mediatek.com>, <Jh.Hsu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 4/5] rtc: mt6397: Add BBPU alarm status reset and shutdown handling
Date: Thu, 20 Nov 2025 20:18:00 +0800
Message-ID: <20251120121805.6775-5-ot_shunxi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
References: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_041825_105520_AF0EA638 
X-CRM114-Status: GOOD (  16.68  )
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

From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>

Function "mtk_rtc_reset_bbpu_alarm_status" is added to address the
issue that the RTC BBPU alarm state remains after the RTC alarm
has occurred.

Additionally, function "mtk_rtc_shutdown" is added to address the
issue of the platform being powered on again after shutdown because
the RTC_BBPU alarm state was not cleared.

Signed-off-by: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
---
 drivers/rtc/rtc-mt6397.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index b8f44a00de5d..8bf7e0822ef0 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -37,6 +37,21 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
 	return ret;
 }
 
+static void mtk_rtc_reset_bbpu_alarm_status(struct mt6397_rtc *rtc)
+{
+	u32 bbpu = RTC_BBPU_KEY | RTC_BBPU_PWREN | RTC_BBPU_RESET_AL;
+	int ret;
+
+	ret = regmap_write(rtc->regmap, rtc->addr_base + RTC_BBPU, bbpu);
+	if (ret < 0) {
+		dev_err(rtc->rtc_dev->dev.parent, "%s: write rtc bbpu error\n",
+			__func__);
+		return;
+	}
+
+	mtk_rtc_write_trigger(rtc);
+}
+
 static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
 {
 	struct mt6397_rtc *rtc = data;
@@ -51,6 +66,9 @@ static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
 		if (regmap_write(rtc->regmap, rtc->addr_base + RTC_IRQ_EN,
 				 irqen) == 0)
 			mtk_rtc_write_trigger(rtc);
+
+		if (rtc->alarm_sta_supported)
+			mtk_rtc_reset_bbpu_alarm_status(rtc);
 		mutex_unlock(&rtc->lock);
 
 		return IRQ_HANDLED;
@@ -249,6 +267,7 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct mt6397_chip *mt6397_chip = dev_get_drvdata(pdev->dev.parent);
 	struct mt6397_rtc *rtc;
+	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(struct mt6397_rtc), GFP_KERNEL);
@@ -275,6 +294,8 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc->rtc_dev))
 		return PTR_ERR(rtc->rtc_dev);
 
+	rtc->alarm_sta_supported = of_property_read_bool(np, "mediatek,alarm-sta-supported");
+
 	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
 					mtk_rtc_irq_handler_thread,
 					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
@@ -297,6 +318,14 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(rtc->rtc_dev);
 }
 
+static void mtk_rtc_shutdown(struct platform_device *pdev)
+{
+	struct mt6397_rtc *rtc = platform_get_drvdata(pdev);
+
+	if (rtc->alarm_sta_supported)
+		mtk_rtc_reset_bbpu_alarm_status(rtc);
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int mt6397_rtc_suspend(struct device *dev)
 {
@@ -346,6 +375,7 @@ static struct platform_driver mtk_rtc_driver = {
 		.pm = &mt6397_pm_ops,
 	},
 	.probe = mtk_rtc_probe,
+	.shutdown = mtk_rtc_shutdown,
 };
 
 module_platform_driver(mtk_rtc_driver);
-- 
2.45.2


