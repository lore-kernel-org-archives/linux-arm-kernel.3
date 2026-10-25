Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1075606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DtPhXmBf;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=VPiao86v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZTVr2mIS4HSA2/kepG1g/wU2cXkBdxzWnNpIBuQNFP8=; b=DtPhXmBf83ZU8e
	OykbOFxtrDUP8d6otmNDzp5uPYpK8OrA4A/964ysMsY9z7TaCBDoxz9QXKboAyhWio/BLUwznOxtL
	8XLJ9TBqKpdeADgQZg7Dms5Tvb9FgE7ISWrnMJ7Vqfdp3ech8LPrFiShhSJy+knGJIOsHNUv6TtKN
	fVrQm/D0aDhvxFMMgbxpVdllwt32u2qg1mpKDClbA4ZJN6s9WHuP2MvdQSUsUuRbeKnVK3bOwR6Ob
	a1FHXg4CRt8LX55NaJxbPkF3OFsiwVR83cs4KoLTPI11xZqJ8VkciwuHBWb46/fuRksSjEwDKjjOA
	gstV4J0NMIFCdPGmGONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nU-00000001L8x-1mNV;
	Sun, 25 Oct 2026 19:22:24 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nN-00000001L09-3v5L;
	Sun, 25 Oct 2026 19:22:19 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJM3W7516897
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:10 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJM3W7516897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956131;
	bh=ZTVr2mIS4HSA2/kepG1g/wU2cXkBdxzWnNpIBuQNFP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VPiao86vCFjxt56jbGEgsEgwU3Tvbi8seYJUJaQPDMk+NiGlEDzCzcjj6s5k2OczA
	 rqOdUWZkX7E8TRJKfbony3FKmNIzdA1FBkxf3mhUhbDgddAP2IHffcL8KlefaKQ+Nb
	 foflPTMVX+y86hQI7Lhss4h9xK1mT9W8Dj82R92U=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, vkoul@kernel.org, mani@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 2/2] phy: amlogic: meson-g12a-usb2: add S4 support
Date: Sun, 25 Oct 2026 20:22:02 +0100
Message-ID: <20261025192202.209045-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122218_327400_0E282621 
X-CRM114-Status: GOOD (  15.90  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The S4 USB2 PHY follows the A1 programming (MPLL DCO clock select, R21
calibration, R13 analog settings) with a few differences taken from the
vendor driver:

 - edge drive trim 2 instead of 3,
 - HS disconnect reference 3 instead of 1,
 - a disconnect threshold in R14, and the R13 PMA signal update bit
   set to latch the analog settings.

Without the PMA update the host controller sees no root ports and
nothing enumerates.

Tested on an S905W2 board: devices enumerate and work behind a hub on
the host ports.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/phy/amlogic/phy-meson-g12a-usb2.c | 65 +++++++++++++++++------
 1 file changed, 48 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
index 66bf0b7ef8ed..18d40f7e48fb 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
@@ -72,6 +72,7 @@
 	#define PHY_CTRL_R14_I_C2L_ASSERT_SINGLE_EN_ZERO	BIT(6)
 	#define PHY_CTRL_R14_BYPASS_CTRL_7_0			GENMASK(15, 8)
 	#define PHY_CTRL_R14_BYPASS_CTRL_15_8			GENMASK(23, 16)
+	#define PHY_CTRL_R14_DISCONNECT_THRESHOLD_S4		GENMASK(27, 26)
 
 #define PHY_CTRL_R15						0x3c
 #define PHY_CTRL_R16						0x40
@@ -149,6 +150,7 @@
 enum meson_soc_id {
 	MESON_SOC_G12A  = 0,
 	MESON_SOC_A1,
+	MESON_SOC_S4,
 };
 
 struct phy_meson_g12a_usb2_priv {
@@ -217,7 +219,12 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
 		FIELD_PREP(PHY_CTRL_R18_MPLL_ADJ_LDO, 1) |
 		PHY_CTRL_R18_MPLL_ACG_RANGE;
 
-	if (priv->soc_id == MESON_SOC_A1)
+	/*
+	 * The S4 shares the A1's MPLL programming: its stock "pll-setting-3"
+	 * (0xac5f69e5) is the G12A R18 value with MPLL_DCO_CLK_SEL (bit 13)
+	 * set, which is exactly what the A1 path adds here.
+	 */
+	if (priv->soc_id == MESON_SOC_A1 || priv->soc_id == MESON_SOC_S4)
 		value |= PHY_CTRL_R18_MPLL_DCO_CLK_SEL;
 
 	regmap_write(priv->regmap, PHY_CTRL_R18, value);
@@ -234,15 +241,19 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
 		     PHY_CTRL_R16_MPLL_EN);
 
 	/* PHY Tuning */
-	regmap_write(priv->regmap, PHY_CTRL_R20,
-		     FIELD_PREP(PHY_CTRL_R20_USB2_OTG_VBUS_TRIM_2_0, 4) |
-		     PHY_CTRL_R20_USB2_OTG_VBUSDET_EN |
-		     FIELD_PREP(PHY_CTRL_R20_USB2_DMON_SEL_3_0, 15) |
-		     PHY_CTRL_R20_USB2_EDGE_DRV_EN |
-		     FIELD_PREP(PHY_CTRL_R20_USB2_EDGE_DRV_TRIM_1_0, 3) |
-		     FIELD_PREP(PHY_CTRL_R20_USB2_BGR_ADJ_4_0, 0) |
-		     FIELD_PREP(PHY_CTRL_R20_USB2_BGR_VREF_4_0, 0) |
-		     FIELD_PREP(PHY_CTRL_R20_USB2_BGR_DBG_1_0, 0));
+	value = FIELD_PREP(PHY_CTRL_R20_USB2_OTG_VBUS_TRIM_2_0, 4) |
+		PHY_CTRL_R20_USB2_OTG_VBUSDET_EN |
+		FIELD_PREP(PHY_CTRL_R20_USB2_DMON_SEL_3_0, 15) |
+		PHY_CTRL_R20_USB2_EDGE_DRV_EN |
+		FIELD_PREP(PHY_CTRL_R20_USB2_BGR_ADJ_4_0, 0) |
+		FIELD_PREP(PHY_CTRL_R20_USB2_BGR_VREF_4_0, 0) |
+		FIELD_PREP(PHY_CTRL_R20_USB2_BGR_DBG_1_0, 0);
+	/* S4 uses edge-drive trim 2; other SoCs use 3 */
+	if (priv->soc_id == MESON_SOC_S4)
+		value |= FIELD_PREP(PHY_CTRL_R20_USB2_EDGE_DRV_TRIM_1_0, 2);
+	else
+		value |= FIELD_PREP(PHY_CTRL_R20_USB2_EDGE_DRV_TRIM_1_0, 3);
+	regmap_write(priv->regmap, PHY_CTRL_R20, value);
 
 	if (priv->soc_id == MESON_SOC_G12A)
 		regmap_write(priv->regmap, PHY_CTRL_R4,
@@ -252,22 +263,38 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
 			     PHY_CTRL_R4_TEST_BYPASS_MODE_EN |
 			     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_1_0, 0) |
 			     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_3_2, 0));
-	else if (priv->soc_id == MESON_SOC_A1) {
+	else if (priv->soc_id == MESON_SOC_A1 ||
+		 priv->soc_id == MESON_SOC_S4) {
 		regmap_write(priv->regmap, PHY_CTRL_R21,
 			     PHY_CTRL_R21_USB2_CAL_ACK_EN |
 			     PHY_CTRL_R21_USB2_TX_STRG_PD |
 			     FIELD_PREP(PHY_CTRL_R21_USB2_OTG_ACA_TRIM_1_0, 2));
 
 		/* Analog Settings */
-		regmap_write(priv->regmap, PHY_CTRL_R13,
-			     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
+		value = FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7);
+		if (priv->soc_id == MESON_SOC_S4) {
+			/*
+			 * S4: set the disconnect threshold and latch the PMA
+			 * signals so the host controller detects its root ports.
+			 */
+			regmap_update_bits(priv->regmap, PHY_CTRL_R14,
+					   PHY_CTRL_R14_DISCONNECT_THRESHOLD_S4,
+					   FIELD_PREP(PHY_CTRL_R14_DISCONNECT_THRESHOLD_S4,
+						      2));
+			value |= PHY_CTRL_R13_UPDATE_PMA_SIGNALS;
+		}
+		regmap_write(priv->regmap, PHY_CTRL_R13, value);
 	}
 
 	/* Tuning Disconnect Threshold */
-	regmap_write(priv->regmap, PHY_CTRL_R3,
-		     FIELD_PREP(PHY_CTRL_R3_SQUELCH_REF, 0) |
-		     FIELD_PREP(PHY_CTRL_R3_HSDIC_REF, 1) |
-		     FIELD_PREP(PHY_CTRL_R3_DISC_THRESH, 3));
+	value = FIELD_PREP(PHY_CTRL_R3_SQUELCH_REF, 0) |
+		FIELD_PREP(PHY_CTRL_R3_DISC_THRESH, 3);
+	/* S4 wants a higher HS disconnect reference than the other SoCs */
+	if (priv->soc_id == MESON_SOC_S4)
+		value |= FIELD_PREP(PHY_CTRL_R3_HSDIC_REF, 3);
+	else
+		value |= FIELD_PREP(PHY_CTRL_R3_HSDIC_REF, 1);
+	regmap_write(priv->regmap, PHY_CTRL_R3, value);
 
 	if (priv->soc_id == MESON_SOC_G12A) {
 		/* Analog Settings */
@@ -360,6 +387,10 @@ static const struct of_device_id phy_meson_g12a_usb2_of_match[] = {
 		.compatible = "amlogic,a1-usb2-phy",
 		.data = (void *)MESON_SOC_A1,
 	},
+	{
+		.compatible = "amlogic,s4-usb2-phy",
+		.data = (void *)MESON_SOC_S4,
+	},
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, phy_meson_g12a_usb2_of_match);
-- 
2.56.0


