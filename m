Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1C5C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 19:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDIrCJJC+5XCchEW/BpIQWdz6qHuIO+zZb0dvnfLyFg=; b=OfIWf5igEpyZFeiCHzPNsKQMEB
	S4ul/PZWR70EhdubriKPSR8KZAR2d1GoW9FyBy/F7kux6hbW4t+rWDV0mMcTK6HuUA07b4TQrnCYE
	S00Dyir/ac/B/TRrdD+p9bsTQnOyO0CHo1U14z6Hf9D65qr+jEx3DaOPDU3Kn1h9fzAgrcqSpwyjX
	v9SvtNFbdLCr7CY58YN09gWsK+oxXTxNvzXDC3gB4+2p8EXq+GrPXi6yYo4cgMRNg4dZqHJgqUod6
	R+kRQ/1YP3ldZ3fVUqOwRyZaVlrN66DT117sM6SttxmoteeY49/KBmhls5dzHoUiNNAdzmnQRb2ge
	N7/Aha0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHpMq-0000000GkDh-2zVe;
	Wed, 21 May 2025 19:44:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHpEH-0000000GjC1-1Nbe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 19:35:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A63B55C57E2;
	Wed, 21 May 2025 19:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B90EC4CEED;
	Wed, 21 May 2025 19:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747856151;
	bh=L2WGN7X2JUviaBc60J76R20EMSD9EzQJaZPVXw+rN/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MLsllN57CyodCPgX15zGM2Jd3ZOX7Fz7e+htMd/6mQXdlX9Zf7Mk8OK4OYrOu0uyl
	 gMPV+Wzy8MDq8YlfE9DSlWnDdsFZOcac4du8Gfa/vjr4kUoI+paZ7F+Avt/jwYnWxk
	 WYSR3ZPhWuIBovlLsKo6jOWCczpAB38H1oMF+DqX1ioh3mO/FKM2L5n1JY4G0gtSIv
	 uS3v/OWQ4FlboNQJaboZlMFXh2Q4LsjeNArrep6zeVfpthHEZe/s5aa/WkOel6KCSD
	 uvoc4MgDWJwTN+K8T56pkFGY79gG90/V9nt9iWI/kYrQnf7VuveKpmUm8V2qdNioZ8
	 ZIt49M75SuR4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F02C54EDA;
	Wed, 21 May 2025 19:35:51 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Wed, 21 May 2025 21:34:25 +0200
Subject: [PATCH v3 2/5] media: i2c: imx214: Prepare for variable clock
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250521-imx214_ccs_pll-v3-2-bfb4a2b53d14@apitzsch.eu>
References: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
In-Reply-To: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747856148; l=3684;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=ddkeGCuuPcPPzIbz+qwlV4L+uKUvrwzDr+fPplJy9lU=;
 b=m0lrNrvqVmU0Mlud7HafGfd4RWckGidy15oW8sEPRDz+xylJVNPL3iedrBj3EJZUMtnUCuh4d
 FairHJgObh8BJa+vQT6lWdFpguJdiBOriNzAzltFbbDMX4oKZZg4kLF
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_123553_456330_B23927C0 
X-CRM114-Status: GOOD (  12.70  )
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
Reply-To: git@apitzsch.eu
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: André Apitzsch <git@apitzsch.eu>

Move clock frequency related parameters out of the constant register
sequences, such that the hard coded external clock frequency can be
replaced by a variable in the upcoming patches.

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 54 ++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 0199195dcb7d12dc2ff253fe3eb77ddbcd0812a9..3aca6ebb02d649c1b7f0b6a6049c1e3aa3d08951 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -299,16 +299,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 	{ IMX214_REG_DIG_CROP_WIDTH, 4096 },
 	{ IMX214_REG_DIG_CROP_HEIGHT, 2304 },
 
-	{ IMX214_REG_VTPXCK_DIV, 5 },
-	{ IMX214_REG_VTSYCK_DIV, 2 },
-	{ IMX214_REG_PREPLLCK_VT_DIV, 3 },
-	{ IMX214_REG_PLL_VT_MPY, 150 },
-	{ IMX214_REG_OPPXCK_DIV, 10 },
-	{ IMX214_REG_OPSYCK_DIV, 1 },
-	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
-
-	{ IMX214_REG_REQ_LINK_BIT_RATE, IMX214_LINK_BIT_RATE_MBPS(4800) },
-
 	{ CCI_REG8(0x3A03), 0x09 },
 	{ CCI_REG8(0x3A04), 0x50 },
 	{ CCI_REG8(0x3A05), 0x01 },
@@ -362,16 +352,6 @@ static const struct cci_reg_sequence mode_1920x1080[] = {
 	{ IMX214_REG_DIG_CROP_WIDTH, 1920 },
 	{ IMX214_REG_DIG_CROP_HEIGHT, 1080 },
 
-	{ IMX214_REG_VTPXCK_DIV, 5 },
-	{ IMX214_REG_VTSYCK_DIV, 2 },
-	{ IMX214_REG_PREPLLCK_VT_DIV, 3 },
-	{ IMX214_REG_PLL_VT_MPY, 150 },
-	{ IMX214_REG_OPPXCK_DIV, 10 },
-	{ IMX214_REG_OPSYCK_DIV, 1 },
-	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
-
-	{ IMX214_REG_REQ_LINK_BIT_RATE, IMX214_LINK_BIT_RATE_MBPS(4800) },
-
 	{ CCI_REG8(0x3A03), 0x04 },
 	{ CCI_REG8(0x3A04), 0xF8 },
 	{ CCI_REG8(0x3A05), 0x02 },
@@ -405,9 +385,6 @@ static const struct cci_reg_sequence mode_table_common[] = {
 	/* ATR setting */
 	{ IMX214_REG_ATR_FAST_MOVE, 2 },
 
-	/* external clock setting */
-	{ IMX214_REG_EXCK_FREQ, IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 1000000) },
-
 	/* global setting */
 	/* basic config */
 	{ IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
@@ -777,6 +754,24 @@ static int imx214_entity_init_state(struct v4l2_subdev *subdev,
 	return 0;
 }
 
+static int imx214_configure_pll(struct imx214 *imx214)
+{
+	int ret = 0;
+
+	cci_write(imx214->regmap, IMX214_REG_VTPXCK_DIV, 5, &ret);
+	cci_write(imx214->regmap, IMX214_REG_VTSYCK_DIV, 2, &ret);
+	cci_write(imx214->regmap, IMX214_REG_PREPLLCK_VT_DIV, 3, &ret);
+	cci_write(imx214->regmap, IMX214_REG_PLL_VT_MPY, 150, &ret);
+	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV, 10, &ret);
+	cci_write(imx214->regmap, IMX214_REG_OPSYCK_DIV, 1, &ret);
+	cci_write(imx214->regmap, IMX214_REG_PLL_MULT_DRIV,
+		  IMX214_PLL_SINGLE, &ret);
+	cci_write(imx214->regmap, IMX214_REG_EXCK_FREQ,
+		  IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 1000000), &ret);
+
+	return ret;
+}
+
 static int imx214_update_digital_gain(struct imx214 *imx214, u32 val)
 {
 	int ret = 0;
@@ -1020,6 +1015,19 @@ static int imx214_start_streaming(struct imx214 *imx214)
 		return ret;
 	}
 
+	ret = imx214_configure_pll(imx214);
+	if (ret) {
+		dev_err(imx214->dev, "failed to configure PLL %d\n", ret);
+		return ret;
+	}
+
+	ret = cci_write(imx214->regmap, IMX214_REG_REQ_LINK_BIT_RATE,
+			IMX214_LINK_BIT_RATE_MBPS(4800), NULL);
+	if (ret) {
+		dev_err(imx214->dev, "failed to configure link bit rate\n");
+		return ret;
+	}
+
 	ret = cci_write(imx214->regmap, IMX214_REG_CSI_LANE_MODE,
 			IMX214_CSI_4_LANE_MODE, NULL);
 	if (ret) {

-- 
2.49.0



