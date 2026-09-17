Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D22C982D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPHkumDohQVuPOQH951XcMV6cbR+5fCik1pdJqE0iNk=; b=aAJwYts/bm3AcFg254Nrh1SNxG
	wV8m4D/4D525DGf3rpluYbppQtpmaACpIbPY+OoIu+No6+w1i7bbDAY740UMbtHKymdzHo8+/dsSE
	WmLPMn0WuSwO/8Cy8CsWC46fiJmTtyYuFv0UR5Fy+kZ1vIUe3/RMYGPe5UZfCh6YOQ+DKmegknK40
	pvqUgZL2KLU0OXlyyVH2PwWtTF4sAfhz2/ehQPO0PV8f3PO07lP/y8Mki+cmCRmRTxdiVK1UWn9fp
	rcuYOxl5jec5YA1WD6hwohDmcd32FWbLrQkSXH5ociPoPXyQDcX9K3FURAsR2Na/m3/hWGrXRagCH
	tFOeFUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7730-0000000ApEU-1YJZ;
	Thu, 17 Sep 2026 08:00:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x772z-0000000ApDe-2YB1;
	Thu, 17 Sep 2026 08:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CA4B447A4;
	Thu, 17 Sep 2026 08:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1C55C4AF09;
	Thu, 17 Sep 2026 08:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789632045;
	bh=fpSccCQTtocdNkkOJ7qtK8D7ka1uiiSK6AMKGUYwGwQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ltfFARBn2kLxaJP4576aO5fKsWFweBm4ob0uhQo360ecbAYkXLwRIKXiSfZd6XBkN
	 FiInId7w9Stc41FMj0ChuQEMB4wo2DSHo5Eb0Qx074mLo6rIbG0+AVpQHVRz+qkhb+
	 NJVjTAOarzLJzB76O834lgPeAuY3gPdeUqRPUiKTDq0vYR9sI/zAxJw+8+VAj8bzUq
	 Unl2iRhV4fVm+y8mqv8Nfw9N8AlLzcLtNtCSARtZaprE6a4cVxEzeMAuGRATG3ym7Q
	 Qipz51aPdR0+sqCC76B/q+Oj9prvfGMPQLukcScVM6ravs5xlx3/+NxfZIVr+iVRJF
	 ROhHoPGCl4Ejw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B5CC88E72;
	Thu, 17 Sep 2026 08:00:44 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 17 Sep 2026 09:59:00 +0200
Subject: [PATCH v12 1/6] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-add-mcu-fan-khadas-vim4-v12-1-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1930;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=BJRhwKhcdjrF5epARgcxNmy3jED4cBzG1XxROeciDJk=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9bqeVLWEctSXnAY1q9nWdy0Muhnc9WiVtHLglO2nDH43
 Xhtn+2DjlIWBjEuBlkxRZb+uZYn3l0+eubrHvUUmDmsTCBDGLg4BWAiu3gY/vCdeSbLuyCiZ8Np
 LfHQOWtF/jExpDhNedZ9bLPGoZ0rHFsYGb5OU9ds5dmX4JAsJqm2IlTSlfGXw5wN2mZbOTgqpoW
 u5QcA
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

Also fix a kernel-doc warning for the khadas_mcu struct.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 include/linux/mfd/khadas-mcu.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mcu.h
index a99ba2ed0e4e0..acd3291061b40 100644
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
@@ -80,7 +87,7 @@ enum {
 
 /**
  * struct khadas_mcu - Khadas MCU structure
- * @device:		device reference used for logs
+ * @dev:		device reference used for logs
  * @regmap:		register map
  */
 struct khadas_mcu {
@@ -88,4 +95,14 @@ struct khadas_mcu {
 	struct regmap *regmap;
 };
 
+/**
+ * enum khadas_mcu_type - Khadas MCU hardware variant
+ * @KHADAS_MCU_GENERIC: VIM1, VIM2, VIM3, Edge, Edge-V (shared register map)
+ * @KHADAS_MCU_VIM4: VIM4 (extended register map, distinct fan/LED/WDT regs)
+ */
+enum khadas_mcu_type {
+	KHADAS_MCU_GENERIC = 1,
+	KHADAS_MCU_VIM4,
+};
+
 #endif /* MFD_KHADAS_MCU_H */

-- 
2.49.0



