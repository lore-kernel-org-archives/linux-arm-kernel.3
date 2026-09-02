Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C517C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Khutpt1Q351IwolIbC0d/9GIqS/rl15klAhLqAi/pRg=; b=BrPMywXBAU0EZ/Asrk8C3FiMwj
	GDHsVgZhmq7cnO/1SC5UaOr9//H+z1yn6jSlP4uVg4BGnL9/vHomnue7RGcr/n8OedK5pHZZikVCq
	fBYJVNsoxYV0kjbbISHaO2jvpRPurflB1Nm2iZTGzVs4ZHEqJTRgRkvK/GvDeAZ2F74lqF+b27U+l
	kx7rV2QYAAKu2KIPSp+WfRlhGxrpds0NFv6SUw1J9KJJvGaTCv4aRWArm6rTD/eBGe4wjYIPHGBmm
	ax/+nU+pvQx7mrv1Lk+Z/B1FvdjJ2/pjU0eHIw/Jjdy5rG6JUfE/bV9p59Jxc1Exf1UICi0dmr0tL
	iIckCp5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kRw-0000000EikI-1bMO;
	Wed, 02 Sep 2026 12:52:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kRu-0000000Eihl-1yaX;
	Wed, 02 Sep 2026 12:52:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A1294602C4;
	Wed,  2 Sep 2026 12:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C9FEC2BCC7;
	Wed,  2 Sep 2026 12:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788353537;
	bh=O7eMDBHqcruD9r+Gj32/0LYLOb9udOfrNqBmq6ix7CA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o01ZAQ0ZgbP24PYsNKpP+RJeIa7DSRa6YYtJcVXRyVHZeuwTh8p5BzgsGdwlM+MW7
	 kH5AeBjmw7W5m9bLcyVEAdie7MWqfJxy32kEoaWcxXmL5EZGDUPmytsXnAstZ8pDQc
	 1GbFJwf8VQJPbLNSFAemIps4INCywuxXJnjkxSvMiLF+UVM3LH57vKVNS4CDTjFkCl
	 hKRs9/NoDDZRV/f1kzLsBtVoZOdPdIe10lOtSB2QL/3XO8KqF8dQ+i89SFVynKhl9J
	 c9bEAX2kj+cFdLmDScHnzZ91Q6UYZBd7FVjK8WHhdU/yiWkONZC6NAHXKtq7ZUaGdC
	 7ej8mQae1xh0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00C8C61DD6;
	Wed,  2 Sep 2026 12:52:16 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Wed, 02 Sep 2026 14:51:05 +0200
Subject: [PATCH v11 1/6] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-add-mcu-fan-khadas-vim4-v11-1-5f1610d83bf0@aliel.fr>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
In-Reply-To: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
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
 mfd@lists.linux.dev, Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2035;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=41a1uCUdSjssDusDgka02m9AT4HiCk+OuG8CTPrx2oY=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9YM6adH51qFTbTiOBoZtVGnqsfmlO/q8ruls/auvGC4r
 K6CacnyjlIWBjEuBlkxRZb+uZYn3l0+eubrHvUUmDmsTCBDGLg4BWAiSn8Y/nCeMTBvihPcV9Vz
 pOCbrWSHSajM9s5jpytmPflZUK/tpczwz17PTu6O+W1/Fd/zrTN/PXT4XCp9ijFSqYzLbNcC2/0
 vGQA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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

Some values change per variant, add the structure to manage it.

Add VIM4 specific registers done for a subsequent patch, which will use a
new compatible especially to get the right regmap config.

Add an enum khadas_mcu_type used as value to match.

Also introduce khadas_mcu_fan_pdata to pass fan register address, a
table named levels to get fan-supported levels on the MCU, and the number
of levels to the fan sub-driver. Done in preparation for a subsequent
commit.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 include/linux/mfd/khadas-mcu.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mcu.h
index a99ba2ed0e4e0..7a9980ea63e7e 100644
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
@@ -88,4 +95,21 @@ struct khadas_mcu {
 	struct regmap *regmap;
 };
 
+/**
+ * struct khadas_mcu_fan_pdata - fan sub-driver configuration
+ * @fan_reg: register address to write the fan level
+ * @levels: table mapping logical cooling-device states to raw fan levels
+ * @nlevels: number of entries in @levels
+ */
+struct khadas_mcu_fan_pdata {
+	unsigned int fan_reg;
+	const unsigned int *levels;
+	unsigned int nlevels;
+};
+
+enum khadas_mcu_type {
+	KHADAS_MCU_GENERIC = 1, /* VIM1/2/3, Edge, Edge-V */
+	KHADAS_MCU_VIM4,
+};
+
 #endif /* MFD_KHADAS_MCU_H */

-- 
2.49.0



