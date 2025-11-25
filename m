Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475ACCFD375
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 02:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QrAB75z30ci678/1yo1b+2Tia6ycFw2hkK2QWG58Jw=; b=OYi1mg7zHg3qFozUd10T/omGnC
	YpzB2sT4StJp6akYVPyBQ40Z23etGe9fdDLvs5D/VncrjhVJ1eFTCmQMF8m9lBEmCXbzTO1rjc/q4
	rnz/98Hzkk78aecJkqnckfiamGiY/ByEaut3d8N+WPZxHsjyi+jwnJPiO+PmipQH0zFnVyducX6sd
	Ciz2/SEjsEJ4AiKLx01jODhizmT6DXJo3f3bjeGxdG0EJdEhfVoqOIe98Uwx0Cz3Mz/l1ch3geMpW
	IqJcOdxrG66UVfqxcZucrnEOKZHhw0w0p/qAb+jHl6IQ06SEnPPh0cG3TXWCO0AJB0GGcwyBaOTQP
	/5F2BNBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNivG-0000000Ccke-37h8;
	Tue, 25 Nov 2025 02:36:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNivD-0000000CcjP-3Hvc;
	Tue, 25 Nov 2025 02:36:52 +0000
X-UUID: 95a6dd14c9a711f09f706fa2197c6ceb-20251124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1QrAB75z30ci678/1yo1b+2Tia6ycFw2hkK2QWG58Jw=;
	b=Idj4DGICU629nj4a4U9EbN28jS9urOm2ovJ69p1+nrjw3yteJOwJglrpthpPk+V0wmVir5HhfHpl1nVsg/qEl3XpYolO6XG0M88g11T7OJRXaNOE4eOL88BtY1D0x2BPx4Sbp8UavYnJ0JQZR5vr2c9eWXK3YlGs1M4v6CtLv9I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:102e0040-e6b0-4845-80ca-80d3fdebeb97,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:15650283-b6af-4b29-9981-6bf838f9504d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 95a6dd14c9a711f09f706fa2197c6ceb-20251124
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <lei.xue@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1187413620; Mon, 24 Nov 2025 19:36:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 25 Nov 2025 10:36:42 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 25 Nov 2025 10:36:42 +0800
From: Lei Xue <lei.xue@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<yong.mao@mediatek.com>, <lei.xue@mediatek.com>, <qingliang.li@mediatek.com>,
	<Fred-WY.Chen@mediatek.com>, <ot_cathy.xu@mediatek.com>,
	<ot_shunxi.zhang@mediatek.com>, <ot_yaoy.wang@mediatek.com>,
	<ot_ye.wang@mediatek.com>
Subject: [PATCH 1/3] pinctrl: mediatek: Add gpio-range record in pinctrl driver
Date: Tue, 25 Nov 2025 10:36:34 +0800
Message-ID: <20251125023639.2416546-2-lei.xue@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125023639.2416546-1-lei.xue@mediatek.com>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_183651_833881_7F441E4E 
X-CRM114-Status: GOOD (  15.31  )
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

Kernel GPIO subsystem mapping hardware pin number to a different
range of gpio number. Add gpio-range structure to hold
the mapped gpio range in pinctrl driver. That enables the kernel
to search a range of mapped gpio range against a pinctrl device.

Signed-off-by: Lei Xue <lei.xue@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  1 +
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index fa7c0ed49346..df8dce14744f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -302,6 +302,7 @@ struct mtk_pinctrl {
 	spinlock_t lock;
 	/* identify rsel setting by si unit or rsel define in dts node */
 	bool rsel_si_unit;
+	struct pinctrl_gpio_range	range;
 };
 
 void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set);
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 6bf37d8085fa..2cf61cfe809e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -3,7 +3,7 @@
  * MediaTek Pinctrl Paris Driver, which implement the vendor per-pin
  * bindings for MediaTek SoC.
  *
- * Copyright (C) 2018 MediaTek Inc.
+ * Copyright (C) 2018-2025 MediaTek Inc.
  * Author: Sean Wang <sean.wang@mediatek.com>
  *	   Zhiyong Tao <zhiyong.tao@mediatek.com>
  *	   Hongzhou.Yang <hongzhou.yang@mediatek.com>
@@ -936,6 +936,15 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n, debounce);
 }
 
+static void mtk_pinctrl_gpio_range_init(struct mtk_pinctrl *hw, struct gpio_chip *chip)
+{
+	hw->range.name = "mtk_pinctrl_gpio_range";
+	hw->range.id = 0;
+	hw->range.pin_base = 0;
+	hw->range.base = chip->base;
+	hw->range.npins = hw->soc->npins;
+}
+
 static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 {
 	struct gpio_chip *chip = &hw->chip;
@@ -959,6 +968,8 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	if (ret < 0)
 		return ret;
 
+	mtk_pinctrl_gpio_range_init(hw, chip);
+
 	return 0;
 }
 
@@ -1077,6 +1088,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev)
 	if (err)
 		return dev_err_probe(dev, err, "Failed to add gpio_chip\n");
 
+	pinctrl_add_gpio_range(hw->pctrl, &hw->range);
+
 	platform_set_drvdata(pdev, hw);
 
 	return 0;
-- 
2.45.2


