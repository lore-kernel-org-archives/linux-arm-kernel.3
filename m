Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98732C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 14:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12TG7WQPgW23XknJw9OABRgKgZ32a7EXLjbhwiFMoZA=; b=G3h6uqYW54XIe8bzYTxwGPnhZZ
	V7/A+zWJW9bno4haXpllp4wWwQgBWVfM6DRFvk3fkAGN06kqplYuWxICJudCaa50t0Rb0EmwSWD45
	G9iYTgV6AFMVsgwxOTNdbyy86Ql0HXF+w5k2EFHFvKbKstdL/Vi6WyISTddOODAfH10skhdsMTzHb
	Mlvp6q7hLZ5Eu/1O6EF3cr6/w/Z6GXFoQf+cyDCx6miOI3lxLVev0v/gf1ME7X5j1Ekfogx1j37P1
	+9JuuSQ7h0WLuwO1Ug/gN2w9TXhmlLUqQxCmltu/a2PmTknglRN2HhLlj53Uljh6zQGJwVhO6zaSY
	7iy21PDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZvv-00000000wcI-0rLX;
	Thu, 15 May 2025 14:51:39 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZoD-00000000vA6-3vsq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 14:43:43 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=p3S5oL+l/Cpv09A2UkCSL/Lz/Q3hRzM3CDYT2Ts3UPEdsD0+kNqmoumyQQXTPZDWLrhdruTrKzEjehFfU5iQwG3NdQtKizno3k8CHX/Ab/wDrvOd7vQcXZ/w1Z/lXZamBwEKTYKMwqspY9IcRNwmD/E9Xk8uDRsMVrFwL1OzN8iUt7oW1//B6WIgsuifGdjNDfZE1vHjq0H4LOwvuuZMHaKtDuiqGtjB/t8RPixIDsHfVT2ioVRWzfPwIQ32UCJ+tjXMMQSDjcBfcfIj0uA+zzawepw7doh+dqy3peqta6aHXluepT6J0PGioidfm7oZRW34aGx+Ii/djOnvyUewgQ==; s=purelymail1; d=purelymail.com; v=1; bh=WVPCoGGyfPmMmWEeShsNZG/xt1N7me7E3wbQwMdON+Q=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1985443548;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 15 May 2025 14:43:11 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Thu, 15 May 2025 16:43:02 +0200
Subject: [PATCH v3 2/2] phy: exynos5-usbdrd: Add support for the Exynos990
 usbdrd phy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-usb-resends-may-15-v3-2-ad33a85b6cee@mentallysanemainliners.org>
References: <20250515-usb-resends-may-15-v3-0-ad33a85b6cee@mentallysanemainliners.org>
In-Reply-To: <20250515-usb-resends-may-15-v3-0-ad33a85b6cee@mentallysanemainliners.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747320182; l=3097;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=WVPCoGGyfPmMmWEeShsNZG/xt1N7me7E3wbQwMdON+Q=;
 b=Yz61+U+8P1tH3DzDCZgtCDCblx9usfa2Uyd5GUgxBLzmBXPk5GjHxcULalzJyOqd7m55pZsWt
 R29Pnv8SWwlCVsVL87dJ1Y+famYNT4y0zVNrFqg4Tuve7OQ/sHBQctS
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_074342_040227_D365004E 
X-CRM114-Status: GOOD (  11.06  )
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

The Exynos990 usbdrd PHY is a combo PHY which supports USB SS, HS and
DisplayPort outputs. This commit adds support only for UTMI+ (USB HS).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 32 +++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 917a76d584f0856f1e445630e2cf97b3c3e46b13..dd660ebe80458a13413ca9735339b4e1095af8ea 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -2025,6 +2025,35 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static const struct exynos5_usbdrd_phy_tuning exynos990_tunes_utmi_postinit[] = {
+	PHY_TUNING_ENTRY_PHY(EXYNOS850_DRD_HSPPARACON,
+			     (HSPPARACON_TXVREF |
+			      HSPPARACON_TXPREEMPAMP | HSPPARACON_SQRX |
+			      HSPPARACON_COMPDIS),
+			     (FIELD_PREP_CONST(HSPPARACON_TXVREF, 7) |
+			      FIELD_PREP_CONST(HSPPARACON_TXPREEMPAMP, 3) |
+			      FIELD_PREP_CONST(HSPPARACON_SQRX, 5) |
+			      FIELD_PREP_CONST(HSPPARACON_COMPDIS, 7))),
+	PHY_TUNING_ENTRY_LAST
+};
+
+static const struct exynos5_usbdrd_phy_tuning *exynos990_tunes[PTS_MAX] = {
+	[PTS_UTMI_POSTINIT] = exynos990_tunes_utmi_postinit,
+};
+
+static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
+	.phy_cfg		= phy_cfg_exynos850,
+	.phy_ops		= &exynos850_usbdrd_phy_ops,
+	.phy_tunes		= exynos990_tunes,
+	.pmu_offset_usbdrd0_phy	= EXYNOS990_PHY_CTRL_USB20,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
+};
+
 static const struct exynos5_usbdrd_phy_config phy_cfg_gs101[] = {
 	{
 		.id		= EXYNOS5_DRDPHY_UTMI,
@@ -2228,6 +2257,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos850-usbdrd-phy",
 		.data = &exynos850_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynos990-usbdrd-phy",
+		.data = &exynos990_usbdrd_phy
 	},
 	{ },
 };
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 1a2c0e0838f99821151661878f022f2129a0c19b..7754697e581077ec0fd60b63649728896ca145c9 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -662,6 +662,9 @@
 #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
 #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
 
+/* For Exynos990 */
+#define EXYNOS990_PHY_CTRL_USB20				(0x72C)
+
 /* For Tensor GS101 */
 /* PMU ALIVE */
 #define GS101_SYSIP_DAT0					(0x810)

-- 
2.47.2


