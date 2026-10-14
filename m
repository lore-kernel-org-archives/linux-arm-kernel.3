Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5EACC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkOBHEcCTf9OU+UBBL5N7jsT1bYfXZfP7rniTkyuak0=; b=CO3oYxfYUo+g5qBjXyC4bRD0xQ
	83TP0/OodFWQNOG3Vo+/3B1TwDFCT2rFKzRb6fwQUfms7V217gV6Hhf0tpfA7ZNJ21gUjMPnX8HqS
	rt7hAKtLgLOomEwlP0hJNZ11u7GjMLM63V7OxYF/hDdiKrkQSG7yledJyXvD71LXN9nnOqm3T4J+h
	9oOEAP55n3XRE5TL5DVumAofaWlNyI5Ho20UL1/vgi2XB0zZa6Uae7mQzlmK0MFRV1xvapPuTLUwK
	IoxTTXSMIGz+p6PB91lBBw1H/LNPIYDOp/WIpn+QTbWBDnEGNFqbGXAGvH1eamnrXlg6I45LZRoXX
	WkRXB/Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtGF-0000000EiQB-1XWX;
	Wed, 14 Oct 2026 07:18:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtFk-0000000EiAq-2UUx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 07:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=AkOBHEcCTf9OU+UBBL5N7jsT1bYfXZfP7rniTkyuak0=; b=ARHuJKXguXhP8p7ckCHvt/f6PY
	TNBtOvxTYEheQ5+71BE2xzrkoxqu9mVcYeILdrl0b0TsUg3dCLcXNd8KzT/aSj2bHyufD0T8I2C9Y
	kmwmATtX1viGi3ujkNwSts3jxbucyiaYkm7IvTeDP82Lbu0EKqcBOx0fimPoDqCMUnWAZ5i7j9nZi
	0sJ/YUh+acEkbPhdM8jilAuTqKPM4IoXOoJ3MsXeccG42TJgTeYGdgLOG3HjzF75IjwsTZroDTdy8
	XrZMeAA7TuU3px2Y8I0x7cZTFNu+iXOeKiH73OvjwnWPFZwIVu/SWPYmcaxWC/+NHiWR/2c6SvzBS
	QEe5xkOg==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGtFh-0000000GRJt-28QX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:18:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49ff680331aso6303095e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962296; x=1792567096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AkOBHEcCTf9OU+UBBL5N7jsT1bYfXZfP7rniTkyuak0=;
        b=OYOdq/QdI/kURavctSD5/n3ly9x4ptyctYM8VmAy7vmKoazo/nZeYyDP57VedvXKTs
         Xfp4dDlnHGxcFYeEnE9IZzizYU5uQwtYHRTlEyh9q7VZ/6vJ54qRFPCCT76NInvAoQTM
         BPXXGgeLPnDd+deF0JJlXT1RZTzl+6c7ECYwAZuNPItYMceP1R5pQtUU3hkM/kUIX+fp
         VWxw+XjPDZPxo/HaxcmsxhavZifJL3V9D6cTpAPP+wMqJ1ESTd7zB9ZIjnhtzKcuhABA
         qmlAJ+95Xwi7cYfWYkOZc+3s6nlbvaID65YU+teqA+3hgnU3A43X3pC6wQv48tH6RTkx
         +u5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962296; x=1792567096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AkOBHEcCTf9OU+UBBL5N7jsT1bYfXZfP7rniTkyuak0=;
        b=dZFJILoUBzTQyaF1lfklf5P+WxCzM6K7fBdMRcE7SJlzERaQdzqdSQj9JibZm1TNzj
         lOIRPDGoplmFZiC5mKsRF1lMKbdPie5a8su5STmmtGbEUSyecNs0EYQlljVoXJd7AFdJ
         Aj9eFkwSj+igA4e9gjrFyzsNqzeGDHYYrUcWuVCWnSET8jlhRlNUByH5m/DFE1MZ5YoK
         fTRb6dJMOj/lUy0HC3r4WhraZ4JzWkBhnTscf2+Y8HQPCMVW/RVHgklAcxnM59qXTR4d
         ZAfR3SRs8JJthyU2g3MSaU5VSDjyIHdYZryTvab7gRbLGqLPUF1UWDmBoh1rlIRmEHjl
         D6Zg==
X-Forwarded-Encrypted: i=1; AKwUvBwRYVn1wY+hax2t2u+GHNl8HvlhwMh2FBJv8TtyAfCHvQRsTmr0vagr1QQLJUdewnIag94Jrib+O8F4mCVUiSUC@lists.infradead.org
X-Gm-Message-State: AFq9FYIiG8g90pBLpx7Q3vip8FGRhO0DDMztQ7CLk3sAImfA1zncj4l1
	OM9MosXbCCcOMb+h2/U7HFh9o11TkgMesIdVGbxZ3EYgYDh6JsQHLgjk
X-Gm-Gg: AYBFou0gsLgpRxmlediETwmNYtZH9Fx86kZfJAEVZ3sGP+RecdQmVp+mRoKi1ApY7Mn
	twSvwkr1V970IVFYXgr5Thi/wW1c60g5i7/dYXzMbFp0xoHqRYV+QrzFqUHGx86GaAGn8/52xlX
	yfWlcAUoThzrmAxtlHsGDf/Dq+ZiKkfSkhzXGUI/6DZqC0Q9X7caZaz7GqFTWYcdUXCABZwkhLP
	qhEoje9Cfvg3kqPe0jFGvFs6FDzcNvGnte923TKv2poegJaZsmAojF68uiE8mrrgRO6xPcwinus
	PtnEzYA7DGx8YZOPi58qAH+0X5jJNBGZh8ARwGY8K89/cNTAyPQ3HIeYHmbjagGbTpRNQVwinR2
	IHneV/79VykFdTLCf2y/9o+Z2/BuvyAt+1mQyjRzWM5wzkMmo1xMNj+lUZODsq6/W3LSPImFgEY
	VxiNAN7Sezji7koFts5xh7NghSykK3uxtOXdAQfCHYvcyEPx2hxtSG+S4SybEX3lBUNn6uHOJTU
	wt80jnX0pxHi7AUhAkQFysX3rNunnHdT+fKkL+p7xTcuEW6x/imvgII7tUPtGMzhWPwI8Qay9He
	ugVdmyjtDBRyTJq7MSPIqw==
X-Received: by 2002:a05:600c:4fd5:b0:4a0:5b:7bc0 with SMTP id 5b1f17b1804b1-4a18e49a7e3mr304316745e9.21.1791962295788;
        Wed, 14 Oct 2026 00:18:15 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1b35d64e4sm18756285e9.0.2026.10.14.00.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:18:15 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3 6/6] net: phy: mediatek: add calibration logic for AN7583
Date: Wed, 14 Oct 2026 09:17:37 +0200
Message-ID: <20261014071739.216345-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014071739.216345-1-ansuelsmth@gmail.com>
References: <20261014071739.216345-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_081817_783908_C704021E 
X-CRM114-Status: GOOD (  20.76  )
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

Similar to Airoha AN7581 Switch PHY also the Airoha AN7583 SoC
requires dedicated calibration and tuneup to make EEE correctly work.

Airoha AN7583 differ from AN7581 by having a dedicated table for
calibration and additional EEE logic tuneup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/mediatek/airoha-ge-soc.c | 226 ++++++++++++++++++++++-
 drivers/net/phy/mediatek/mtk.h           |   1 +
 2 files changed, 224 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/mediatek/airoha-ge-soc.c b/drivers/net/phy/mediatek/airoha-ge-soc.c
index 6c8557ac1349..1d88f66e4773 100644
--- a/drivers/net/phy/mediatek/airoha-ge-soc.c
+++ b/drivers/net/phy/mediatek/airoha-ge-soc.c
@@ -159,6 +159,106 @@ static u8 an7581_zcal_to_r45ohm[64] = {
 	 52,  50,  48,  46,  44,  42,  40,  39,  36,  35,  32,  32,  30,  28,  27,  25
 };
 
+/*
+ * 2 chip revision
+ * TXMR or discrete
+ * 2 MDI type
+ * TX AMP test/TX AMP 1G/TX AMP 100M/TX AMP 10M/R50
+ * 4 PHY
+ */
+static int an7583_tx_amp_compensation_tbl[TRANSFORMER_TYPE_MAX][MDI_TYPE_MAX][CALIB_CONST_TYPE_MAX][4] = {
+	[DISCRETE] = {
+		[MDI_0R] = {
+			[TX_AMP_TEST_A] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_B] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_C] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_D] = { -3, -3, -3, -3 },
+			[TX_AMP_1G_A] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_B] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_C] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_D] = { 0, 0, 0, 0 },
+			[TX_AMP_100M_A] = { 4, 4, 4, 4 },
+			[TX_AMP_100M_B] = { 4, 4, 4, 4 },
+			[TX_AMP_10M_A] = { 0, 0, 0, 0 },
+			[TX_AMP_10M_B] = { 0, 0, 0, 0 },
+			[R50_A] = { 4, 4, 4, 4 },
+			[R50_B] = { 4, 4, 4, 4 },
+			[R50_C] = { 6, 6, 6, 6 },
+			[R50_D] = { 4, 4, 4, 4 },
+		},
+		[MDI_5R] = {
+			[TX_AMP_TEST_A] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_B] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_C] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_D] = { -3, -3, -3, -3 },
+			[TX_AMP_1G_A] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_B] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_C] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_D] = { 0, 0, 0, 0 },
+			[TX_AMP_100M_A] = { 4, 4, 4, 4 },
+			[TX_AMP_100M_B] = { 4, 4, 4, 4 },
+			[TX_AMP_10M_A] = { 0, 0, 0, 0 },
+			[TX_AMP_10M_B] = { 0, 0, 0, 0 },
+			[R50_A] = { 0, 0, 0, 0 },
+			[R50_B] = { 0, 0, 0, 0 },
+			[R50_C] = { 0, 0, 0, 0 },
+			[R50_D] = { 0, 0, 0, 0 },
+		},
+	},
+	[TXMR] = {
+		[MDI_0R] = {
+			[TX_AMP_TEST_A] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_B] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_C] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_D] = { -3, -3, -3, -3 },
+			[TX_AMP_1G_A] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_B] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_C] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_D] = { 0, 0, 0, 0 },
+			[TX_AMP_100M_A] = { 4, 4, 4, 4 },
+			[TX_AMP_100M_B] = { 4, 4, 4, 4 },
+			[TX_AMP_10M_A] = { 0, 0, 0, 0 },
+			[TX_AMP_10M_B] = { 0, 0, 0, 0 },
+			[R50_A] = { 4, 4, 0, 0 },
+			[R50_B] = { 4, 4, 0, 0 },
+			[R50_C] = { 5, 5, 3, 4 },
+			[R50_D] = { 4, 4, 4, 0 },
+		},
+		[MDI_5R] = {
+			[TX_AMP_TEST_A] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_B] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_C] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_D] = { -3, -3, -3, -3 },
+			[TX_AMP_1G_A] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_B] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_C] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_D] = { 0, 0, 0, 0 },
+			[TX_AMP_100M_A] = { 4, 4, 4, 4 },
+			[TX_AMP_100M_B] = { 4, 4, 4, 4 },
+			[TX_AMP_10M_A] = { 0, 0, 0, 0 },
+			[TX_AMP_10M_B] = { 0, 0, 0, 0 },
+			[R50_A] = { -4, -4, -4, -4 },
+			[R50_B] = { -4, -4, -4, -4 },
+			[R50_C] = { -2, -2, -2, -2 },
+			[R50_D] = { -3, -3, -2, -2 },
+		},
+	},
+};
+
+static u8 an7583_zcal_to_r50ohm_0R[64] = {
+	127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
+	127, 127, 127, 122, 118, 114, 110, 106, 102,  98,  96,  92,  88,  85,  82,  80,
+	 76,  72,  70,  68,  64,  62,  60,  57,  55,  52,  50,  48,  46,  44,  41,  40,
+	 38,  36,  33,  32,  30,  28,  26,  24,  24,  22,  20,  18,  16,  16,  14,  12,
+};
+
+static u8 an7583_zcal_to_r50ohm_5R[64] = {
+	127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
+	127, 127, 127, 127, 127, 127, 127, 127, 127, 124, 120, 116, 112, 110, 106, 102,
+	 99,  96,  93,  90,  88,  84,  81,  79,  76,  73,  71,  68,  66,  64,  61,  59,
+	 56,  54,  52,  50,  48,  46,  44,  42,  40,  39,  37,  36,  33,  32,  31,  29,
+};
+
 static int airoha_cal_cycle(struct phy_device *phydev, int devad,
 			    u32 regnum, u16 mask, u16 cal_val)
 {
@@ -783,8 +883,9 @@ static int airoha_rx_offset_cal_sw(struct phy_device *phydev)
 	phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x100, 0x0);
 	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x145, 0x1000);
 
-	phy_write_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_ANA_CAL_RG6,
-		      0x1);
+	if (phydev->drv->phy_id == AIROHA_GPHY_ID_AN7581)
+		phy_write_mmd(phydev, MDIO_MMD_VEND1,
+			      MTK_PHY_RG_ANA_CAL_RG6, 0x1);
 
 	return 0;
 }
@@ -1567,8 +1668,125 @@ static int en7528_phy_config_init(struct phy_device *phydev)
 
 static int an7583_phy_config_init(struct phy_device *phydev)
 {
+	struct airoha_socphy_shared *shared = phy_package_get_priv(phydev);
+	struct phy_device *phydev_p0;
+	u8 phy_offset;
+	int ret;
+
 	/* BMCR_PDOWN is enabled by default */
-	return phy_clear_bits(phydev, MII_BMCR, BMCR_PDOWN);
+	phy_clear_bits(phydev, MII_BMCR, BMCR_PDOWN);
+
+	phydev_p0 = shared->phydev_p0;
+	phy_offset = phydev->mdio.addr - phydev_p0->mdio.addr;
+
+	/* FIXME: Read SoC MDI Resister Type if available or default to 5R */
+	shared->mdi_resister_type = MDI_5R;
+
+	if (shared->mdi_resister_type == MDI_0R)
+		shared->r50_cal_tbl = an7583_zcal_to_r50ohm_0R;
+	if (shared->mdi_resister_type == MDI_5R)
+		shared->r50_cal_tbl = an7583_zcal_to_r50ohm_5R;
+	shared->tx_amp_compensation_tbl = &an7583_tx_amp_compensation_tbl;
+
+	ret = airoha_phy_calib(phydev);
+	if (ret)
+		return ret;
+
+	ret = airoha_phy_auto_select_transformer(phydev);
+	if (ret)
+		return ret;
+
+	ret = airoha_phy_tx_amp_compensation(phydev);
+	if (ret)
+		return ret;
+
+	/* Enable Idle Mode Power Setting */
+	if (phy_offset == 0) {
+		phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x268, 0x07F1);
+		phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x703, 0x3111);
+		phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x271, 0x3C24);
+		phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x701, 0x1023);
+	}
+
+	if (shared->transformer_type[phy_offset] == TXMR) {
+		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x23, 0x0881);
+		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x24, 0x0881);
+		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x25, 0x0881);
+		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x26, 0x0881);
+
+		if (shared->mdi_resister_type == MDI_5R)
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x05, 0x0205);
+		else
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x05, 0x0200);
+	} else {
+		if (shared->mdi_resister_type == MDI_5R) {
+			/* RX setting for 5R_TXMR before AN setting */
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0xe7, 0x6666);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0xe9, 0x0003);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0xfe, 0x0006);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0xe6, 0x1111);
+			/* 100M sharp */
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x23, 0x0c86);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x24, 0x0c86);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x25, 0x0c86);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x26, 0x0c86);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x01, 0x01cb);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x02, 0x01c2);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x03, 0x0108);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x04, 0x0211);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x05, 0x0205);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x06, 0x0387);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x07, 0x03ce);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x08, 0x03c8);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x0b, 0x0005);
+		} else {
+			/* 100M sharp */
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x23, 0x0886);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x24, 0x0886);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x25, 0x0886);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x26, 0x0886);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x00, 0x0195);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x01, 0x01cb);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x02, 0x01c2);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x03, 0x0108);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x04, 0x0211);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x05, 0x0205);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x06, 0x0387);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x07, 0x03ce);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x08, 0x03c3);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x0a, 0x0010);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x0b, 0x0005);
+		}
+	}
+
+	/* RX Setting */
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x3c, 0xc000);
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x3d, 0x0000);
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x3e, 0xc000);
+
+	/* EEE setting */
+	phy_write_mmd(phydev, MDIO_MMD_AN, 0x3c, 0x0000);
+
+	/* 10M settings */
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x1a3, 0x00d2);
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x1a4, 0x010e);
+	phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x27b, 0x1177);
+	phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x27c, 0x0808);
+
+	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_3);
+	__phy_write(phydev, 0x14, 0x190);
+	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
+
+	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_1);
+	__phy_write(phydev, 0x14, 0x3a18);
+	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
+
+	phy_write(phydev, 0x9, 0x0600);
+
+	/* EEE keep only Pair A ON */
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x630, 0x006E);
+
+	return 0;
 }
 
 static struct phy_driver mtk_socphy_driver[] = {
@@ -1611,6 +1829,8 @@ static struct phy_driver mtk_socphy_driver[] = {
 		.led_hw_control_set = mt798x_phy_led_hw_control_set,
 		.led_hw_control_get = mt798x_phy_led_hw_control_get,
 		.led_polarity_set = an7581_phy_led_polarity_set,
+		.read_page	= mtk_phy_read_page,
+		.write_page	= mtk_phy_write_page,
 	},
 };
 
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index bc46646a95fd..608e5e3d754f 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -13,6 +13,7 @@
 
 #define MTK_EXT_PAGE_ACCESS			0x1f
 #define MTK_PHY_PAGE_EXTENDED_1			0x0001
+#define MTK_PHY_PAGE_EXTENDED_3			0x0003
 #define MTK_PHY_PAGE_STANDARD			0x0000
 #define MTK_PHY_PAGE_EXTENDED_52B5		0x52b5
 
-- 
2.55.0


