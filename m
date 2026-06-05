Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8E7CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 11:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eF8yh/ZhaXDNZn8doXue2BXI/ROFqbRF9hALOIAEVU4=; b=Lmg4f6W8k7msNcY0WswPsQetkl
	fuleMXwo4PbEkLxzB6HzUYAI0RJu1uNeowL2lr52+vhtUUff4slz/HkXw5Ff4qDKDtgatDiCXyRPX
	s+/v3jkazlLYAyf4+/iHf0Sh8bxHWJn29MYHab+TlXDuaTFXVZSQ16qGTbanH1N00cvdhJw3iE1qa
	lwhT7jdmtyEZi9IH/ND0uncS1mgfXF8Pd77Hh7UXH178Mlcew6w41ZeduApotggv7H678UqYm/98j
	78oNTGDU6DCGAuN4L1jzPbM1sFqYL2AWnnyRIe7guJMhHaMmAn1/SI9yafXTExi1n7fgL0eB7pLcp
	+1nvZHqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTB4-00000000aFB-0LpM;
	Fri, 05 Jun 2026 11:57:30 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTB0-00000000aE5-2hQ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 11:57:28 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c0c2a68d01so12613235ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 04:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780660646; x=1781265446; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eF8yh/ZhaXDNZn8doXue2BXI/ROFqbRF9hALOIAEVU4=;
        b=WAHItKJFd5/DmLzgf+iz5pmHzbNBCUDSL0xK4afI90/xq1FpPryfBnnqaM/rLamaxt
         pLNheWW6NOoeck/IlDjbzqnJcBLNV0eZ7ID5kgTXrUUMenNEsVNz9MOkr4t02NFSowJ+
         bo6TxuJwYlulIPCGskShvGfnFVvaJyKyzm1FtpDMJLqPQbyetsltMwoC0KOgF2tqOGYL
         gCBqSTY4MDBZ2GzvDi1pZYBmnYxkW40lJ46WHRVj1DdEvgkeswmUsHMYpPVinVR/0IzW
         PdrL+6uc4LOoioHZhX3P+h1mTSTweikDf3LQtF+CUNBa9PSN6ysvmrlqPCWOJDC+o3UN
         oi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780660646; x=1781265446;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eF8yh/ZhaXDNZn8doXue2BXI/ROFqbRF9hALOIAEVU4=;
        b=lzfWFrXDX9CVtc+Pn07FpB48l1alkqSCoDsXN4DRhblFShJOmXWiFkyFURVY6d/zdc
         4ook3N8IeoQ5j1NygERyhGenDgfkOSqQm/VfD5TRepI3F1OfpHeQ+fEXzC6FNnoZ8FSc
         VtYGDvhMTfhqhsPlADshRlYuG96OLscOwkHOgI/549Cnm8zm+lwVpzHIcWcJwzhk9kT2
         4FSIBAWjaaxzsEJcI5oRpJLNsEhI4kWFVafh9bEDAHJYvWlpI44GOi9M2QF65ZNQdrzk
         ZmTtb3ix6anD0UtRMEexUxX79rrTPxbhQwKky8GeBg7lTX3v6pOvUdY5rfxGJQiJ8c84
         VRdQ==
X-Forwarded-Encrypted: i=1; AFNElJ93oAcm9+xaThSzxqsfmJ4XfIy/Bnmb+tUfzO2/XUEho3YCSa+8qrNnVilbh5POMC+eVy5FPXSCMIhtcs8QxdKi@lists.infradead.org
X-Gm-Message-State: AOJu0YzbDxEpWOrvW2uv7hqgH9DyLXccQfdxCUdNWSarobLxwRXZMb9C
	0xhUpVeG6+NkOavbEfjmWUNXkYOGEOFsJYTBj4gCWhX0pxdwMYtmZNpL
X-Gm-Gg: Acq92OHvNWxXQK4guifpHGdUGWJj5rdSV6B2cAoqQORDSkvknW2ACH/gpVt812GqyW0
	tbsEMWarnMiBU5ASNJTZMkOsnTLHcSdP0E+PXn4ClIbEwu/h9cUA+GEhZdzxn/kFuW1iyjI2akX
	Vy81sbkq9GSpeIBCp++YiGBnx3BdZQLYMODt92QzKUA4mJOVDWEoiZK299x9GRNKzyMZUHwjjht
	XKEE53PERK+tucLJ8i9USVboDfWB0k9OEUwQb7IYpnjRt6vF2AP/iGKbmS2x1xjPsHtv/NpD4hb
	e4nKUYKJTrD5bnHtheOU30B/SXN6d8WdL1HsANch3WzR9Bv/XclKHRnhU8rkaiJCqGiKHV+qpCJ
	0aHCW/1n/fxT1w6ZvjHcMl34tsIyIaB2cs1jqPCmNp03kXSbH0IOSTHEHy0bY5O0bLld1cnRu6X
	O+RFpoQDGFdJk0WucB2rkFk2r38ILiw5ZCtpi+NcDO3XzO/z6SlDCUSgD3w3d5dj7yyA2xXVKED
	URT2Vhu/GPqo0J8x0C8yNRXhUAe6y/zBT3USLg=
X-Received: by 2002:a17:903:2d0:b0:2c0:bcff:e18c with SMTP id d9443c01a7336-2c1e833c99dmr35270255ad.37.1780660645598;
        Fri, 05 Jun 2026 04:57:25 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d45csm127241615ad.14.2026.06.05.04.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:57:25 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 05 Jun 2026 19:57:20 +0800
Subject: [PATCH v2] phy: freescale: phy-fsl-imx8qm-lvds-phy: Fix missing
 pm_runtime_disable() on probe error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-lvds-v2-1-3ce7539d1104@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJ+5ImoC/12Nyw6CMBBFf4XM2hqmMUVd+R+GBW2nMIaH6WCjI
 f13AXcuT3LuuQsIRSaBa7FApMTC07iCPhTgumZsSbFfGXSpTWnKk+qTF+VN5azBiw9Ywao+IwV
 +75l7/WN52Qe5edtuRscyT/Gz/yTcvL9kQoXKnglDQOuJqls7NNwf3TRAnXP+AsrHQS+qAAAA
X-Change-ID: 20260604-lvds-d67cb619df17
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780660643; l=3323;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=1jnluH9nXmYHy1Syp5EUFcWQBdyNd19PmSpPNf0WAEY=;
 b=7iDgxZg0jOVAtl0CfL5XzlraW/8xEH/XzKMKF01We1Z9PtFrPxoWEZ7Gws4uWlANtj/DvKuXF
 kE/kdaqfFtiAU//wXVWMgQLI/oqzCJ0IIZknDig3s4ZhBATn21hx99I
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_045726_692959_BB7DC9DB 
X-CRM114-Status: GOOD (  17.29  )
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

If mixel_lvds_phy_reset() fails in probe after pm_runtime_enable(),
the function returns directly without calling pm_runtime_disable(),
leaving runtime PM permanently enabled for the device.

Fix this by using devm_pm_runtime_enable() so that cleanup is
automatic on any probe failure or driver unbind. This also allows
removing the manual err label and the .remove callback.

Fixes: 06ff622d61d2 ("phy: freescale: Add i.MX8qm Mixel LVDS PHY support")
Acked-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Change the patch's subject prefix requested by Liu Ying.
- Add Liu Ying's Acked-by.
- Link to v1: https://patch.msgid.link/20260604-lvds-v1-1-b8e1ff1bdee7@gmail.com

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: linux-phy@lists.infradead.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
index ece357443521..c662f91e598c 100644
--- a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
+++ b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
@@ -345,7 +345,9 @@ static int mixel_lvds_phy_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, priv);
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = mixel_lvds_phy_reset(dev);
 	if (ret) {
@@ -355,17 +357,15 @@ static int mixel_lvds_phy_probe(struct platform_device *pdev)
 
 	for (i = 0; i < PHY_NUM; i++) {
 		lvds_phy = devm_kzalloc(dev, sizeof(*lvds_phy), GFP_KERNEL);
-		if (!lvds_phy) {
-			ret = -ENOMEM;
-			goto err;
-		}
+		if (!lvds_phy)
+			return -ENOMEM;
 
 		phy = devm_phy_create(dev, NULL, &mixel_lvds_phy_ops);
 		if (IS_ERR(phy)) {
 			ret = PTR_ERR(phy);
 			dev_err(dev, "failed to create PHY for channel%d: %d\n",
 				i, ret);
-			goto err;
+			return ret;
 		}
 
 		lvds_phy->phy = phy;
@@ -379,19 +379,10 @@ static int mixel_lvds_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy_provider)) {
 		ret = PTR_ERR(phy_provider);
 		dev_err(dev, "failed to register PHY provider: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	return 0;
-err:
-	pm_runtime_disable(dev);
-
-	return ret;
-}
-
-static void mixel_lvds_phy_remove(struct platform_device *pdev)
-{
-	pm_runtime_disable(&pdev->dev);
 }
 
 static int __maybe_unused mixel_lvds_phy_runtime_suspend(struct device *dev)
@@ -432,7 +423,6 @@ MODULE_DEVICE_TABLE(of, mixel_lvds_phy_of_match);
 
 static struct platform_driver mixel_lvds_phy_driver = {
 	.probe = mixel_lvds_phy_probe,
-	.remove = mixel_lvds_phy_remove,
 	.driver = {
 		.pm = &mixel_lvds_phy_pm_ops,
 		.name = "mixel-lvds-phy",

---
base-commit: a225caacc36546a09586e3ece36c0313146e7da9
change-id: 20260604-lvds-d67cb619df17

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


