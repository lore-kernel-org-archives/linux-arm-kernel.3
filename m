Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB02FED3C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 14:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cg6SRTWgjpq/mw4siuRVRdQX4aNt8kIlvqe5TNC29sk=; b=UV2p3Met+q12lOBSxzFB+mQt0c
	aIQQDCy5suzIlHWfaMenszDkctR+ChH9Ak/60/uh/Zr3nsy04L1fQbGGZmrSLpOmZhpGbDCXEcj4A
	HlQT5yiJC2SQoe652Yig2ZWJ4iOW69DaxQ9XwIOAm/CcPQqJ2Q+JXMiWBWwgJfvUNs+pKU1AhPNKV
	8H1/1U5Eo56LPYtjKRQp+JJGMqWdsiR+D6MQ+hIfiilmPNCWsyRff0eedMzrdKdsxt/6QGKNOjfM+
	SUUDYxKzpbx8/l+8tf+PvKmtsTQsOMEVDVxA9hJ5QLFnYRgUU4P/8kl1HxlTjZBPm0gres2H8YrVQ
	vtpTUTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHOD-0000000DJB0-1PsN;
	Fri, 24 Apr 2026 14:20:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHO6-0000000DJ5A-3rxa;
	Fri, 24 Apr 2026 14:20:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 549A541E45;
	Fri, 24 Apr 2026 14:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A05CC2BCB9;
	Fri, 24 Apr 2026 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777040410;
	bh=JIvHBkUoalBvVLwrlyOmEWngyDFdpxRN9ZxD0CWqxss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tlUKD1pLW3uwSDtalNBMSWWfN4Bq5fGjw7iXyVYfogdeupXcNpbOLgcYTMOMtMA6q
	 BVx7wrPbB++ub6feIBIo2LjwggXRupgrC0f6cuWUR6HYsMGpW7soWe1debOJfSRCsg
	 6mz/0Qr7a/GGukpCafnnezkhJof4J8S0Idu2yNRB1yiY78kqcjUryXUfUWFdXw3UTr
	 nZZx5cJPZ3NnJZ6zbqJU8vNmUXWI9dzzh7ZRiB83KBgCI1Ms0RKqft2U8n8Gg2/U0O
	 yXHUacAzv6o5t5cb4/VLtrWd0aYisDKE0Qt7XeY8nB4vEN7rcSmPlCYU7Vqxrd1fYS
	 kub748IY+Vx7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30DDFED3C9;
	Fri, 24 Apr 2026 14:20:09 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 24 Apr 2026 16:17:34 +0200
Subject: [PATCH v5 3/8] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-add-mcu-fan-khadas-vim4-v5-3-afcfa7157b23@aliel.fr>
References: <20260424-add-mcu-fan-khadas-vim4-v5-0-afcfa7157b23@aliel.fr>
In-Reply-To: <20260424-add-mcu-fan-khadas-vim4-v5-0-afcfa7157b23@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2474;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=lbbZ527T237ZjHkvSfooMhj4xDf42xiFowYZHXz2AMk=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ+brGkH5uqwwTSmFhBuzncuEQ3YGl8dPzp1mJdDt5q6Xe
 0tuzfuOUhYGMS4GWTFFlv65lifeXT565use9RSYOaxMIEMYuDgFYCJPuRn+qUT4GXs8uH+EO/Ha
 792Xpa0+ppms8FjVc/B1aOMiOZcEC4b/YWyM385UWWRpOznqre5237dJ5ocd//v1T5lLHu9WZD3
 NAQA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_072011_009306_EDAFBFA6 
X-CRM114-Status: GOOD (  12.73  )
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Introduce a per-variant configuration structure (khadas_mcu_data)
holding the regmap config and MFD cells,
selected at probe time via the of_device_id match data.
This makes adding other variants straightforward.

Also introduce khadas_mcu_fan_pdata to pass fan register address and
maximum level to the fan sub-driver, removing the hardcoded constants.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 include/linux/mfd/khadas-mcu.h | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mcu.h
index a99ba2ed0e4e0..75e275d3fa8d9 100644
--- a/include/linux/mfd/khadas-mcu.h
+++ b/include/linux/mfd/khadas-mcu.h
@@ -70,6 +70,13 @@
 #define KHADAS_MCU_WOL_INIT_START_REG		0x87 /* WO */
 #define KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG	0x88 /* WO */
 
+/* VIM4 specific registers */
+#define KHADAS_MCU_VIM4_REST_CONF_REG		0x2c /* WO - reset EEPROM */
+#define KHADAS_MCU_VIM4_LED_ON_RAM_REG		0x89 /* WO - LED volatile */
+#define KHADAS_MCU_VIM4_FAN_CTRL_REG		0x8a /* WO */
+#define KHADAS_MCU_VIM4_WDT_EN_REG		0x8b /* WO */
+#define KHADAS_MCU_VIM4_SYS_RST_REG		0x91 /* WO */
+
 enum {
 	KHADAS_BOARD_VIM1 = 0x1,
 	KHADAS_BOARD_VIM2,
@@ -82,10 +89,38 @@ enum {
  * struct khadas_mcu - Khadas MCU structure
  * @device:		device reference used for logs
  * @regmap:		register map
+ * @data:		pointer to variant-specific config
  */
 struct khadas_mcu {
-	struct device *dev;
-	struct regmap *regmap;
+	struct device			*dev;
+	struct regmap			*regmap;
+	const struct khadas_mcu_data	*data;
+};
+
+/**
+ * struct khadas_mcu_data - per-variant configuration
+ * @regmap_config:	regmap configuration
+ * @cells:		MFD sub-devices
+ * @ncells:		number of sub-devices
+ * @fan_cells:		MFD fan sub-devices
+ * @nfan_cells:		number of fan sub-devices
+ */
+struct khadas_mcu_data {
+	const struct regmap_config	*regmap_config;
+	const struct mfd_cell		*cells;
+	int				ncells;
+	const struct mfd_cell		*fan_cells;
+	int				nfan_cells;
+};
+
+/**
+ * struct khadas_mcu_fan_pdata - fan sub-driver configuration
+ * @fan_reg: register address to write the fan level
+ * @max_level: maximum fan level
+ */
+struct khadas_mcu_fan_pdata {
+	unsigned int fan_reg;
+	unsigned int max_level;
 };
 
 #endif /* MFD_KHADAS_MCU_H */

-- 
2.49.0



