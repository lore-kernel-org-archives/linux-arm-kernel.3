Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BF3E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yh3ZExazNltGzZe8WVzy/cDKm78b5w2/yFmw+OUhd5Y=; b=RmTYQH4VuNOUnD7XiIQPzmVZ/u
	YB56Hxe701Xzf2KPP5+hSaRIDv1RyRlCneYZnsaaNommY9Avjyix0/Pg/08ghTkXvT1Xl1KI0b/wL
	a4A4Ykbgimpq5V5K+XyHRGJZDrHgO6VWC7EnM05uCkr4d8RFlBhJxcQJkuxWvDTBn65OIS27vUzUU
	VHyPm+YjaIJTkE52IXqUVvuvrCebcnMTx9m7k5j/atEbYCGLB3MmK5la5vkIrUGFjyvUrPHYHyvqb
	8t/6gKDeuuE6TRp4mqDWilDslFjVMoXTT5GdBkSbT6h/nikQ9CvGkjNdVivZECZGkSQM3iDV2pkix
	PC1BGMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNw46-0000000H2Af-2VYg;
	Wed, 18 Dec 2024 15:34:22 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvzj-0000000H1HN-1P59
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:29:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B5DBBFB6E;
	Wed, 18 Dec 2024 16:29:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1734535784; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=yh3ZExazNltGzZe8WVzy/cDKm78b5w2/yFmw+OUhd5Y=;
	b=QdE88gPg/ef2/e/VnVc4Spr18mnsN5mupz+vMS2VuFDKS76pX+BqSbXuy5lH6K/UYFSuW9
	dBlw9KKNuTmlwwsUa4TvszkEpzgx0e+Cg2TH3e1XjFiAsqQ4a4wsDKueCgvDBk+Mz5FN+x
	J+fe1lOhM9FiJqfogri3y09S+GBznCEfXFM7iHOvWjzJxGq9iDC27tKmRNeSWvh5Gu3leZ
	boT2UNULs1pDOcA1Dh8O3/vwPM6fHBDlmLJsDJGvjofOXRNV33YjCgRVNvG2vLwFaMLLxp
	PYh45fuYMv+35Ujj7l7FpJPWt744lswcsmIdzsBTgncVJL4fxgTPrkNqXJyPvg==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@denx.de>,
	Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Robin Gong <yibin.gong@nxp.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/9] dt-bindings: regulator: pca9450: Add properties for handling LDO5
Date: Wed, 18 Dec 2024 16:27:24 +0100
Message-ID: <20241218152842.97483-2-frieder@fris.de>
In-Reply-To: <20241218152842.97483-1-frieder@fris.de>
References: <20241218152842.97483-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_072951_675500_2F72E916 
X-CRM114-Status: GOOD (  21.95  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This reverts commit 27866e3e8a7e93494f8374f48061aa73ee46ceb2 and
implements a new future-proof way of handling the mismatch between
the PMIC driver and the hardware for LDO5.

It turned out that this feature was implemented based on the wrong
assumption that the SD_VSEL signal needs to be controlled as GPIO
in any case.

In fact the straight-forward approach is to mux the signal as
USDHC_VSELECT and let the USDHC controller do the job.

Most users never even used this property and the few who did have
been or are getting migrated to the alternative approach.

In order to know the current status (which of the two control
registers is used) for the LDO5 regulator, we need to route back the
USDHC_VSELECT signal by setting the SION bit in the IOMUX.

By adding the according GPIO as sd-vsel-gpios to the LDO5 node, we
allow the regulator driver to sample the current status of the
SD_VSEL signal that is used to select the correct control register.

The SD_VSEL on the PMIC is always an input. It's driven by the SoC's
VSELECT signal (controlled by the USDHC controller) and we use the
SION bit in the IOMUX to internally loop back the signal in order to
sample it using the GPIO.

As the SD_VSEL pin is directly routed to the LDO5 regulator in the
PMIC, make the sd-vsel-gpios property part of the LDO5 node.

SoC                                  PMIC
+-----------------------+           +-------------------+
|                       |           |                   |
|                       |           |                   |
|  GPIO <----------+    |           |                   |
|                  |    |    SD_VSEL|   +-------+       |
|  USDHC_VSELECT ->+------------------->| LDO5  |       |
|                       |           |   +-------+       |
|                       |           |                   |
+-----------------------+           +-------------------+

For boards which have the SD_VSEL tied to a fixed low level, we add
'nxp,sd-vsel-fixed-low'. The voltage of LDO5 is therefore only controlled
by writing to the LDO5CTRL_L register.

If none of 'nxp,sd-vsel-fixed-low' or 'sd-vsel-gpios' is set, we keep
the same behavior as before. The driver assumes that SD_VSEL is tied
high and the LDO5CTRL_H register can be used, which is in fact not true
for all known boards and works merely by chance.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v3:
* Merge binding patches into single patch
* Rebase to next-20241218

Changes for v2:
* split revert into separate patch
* extend commit message
* add 'nxp,sd-vsel-fixed-low'
---
 .../regulator/nxp,pca9450-regulator.yaml      | 29 +++++++++++++++----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
index 68709a7dc43f1..7605a05a9eedf 100644
--- a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
@@ -42,8 +42,30 @@ properties:
     description: |
       list of regulators provided by this controller
 
+    properties:
+      LDO5:
+        type: object
+        $ref: regulator.yaml#
+        description:
+          Properties for single LDO5 regulator.
+
+        properties:
+          nxp,sd-vsel-fixed-low:
+            type: boolean
+            description:
+              Let the driver know that SD_VSEL is hardwired to low level and
+              there is no GPIO to get the actual value from.
+
+          sd-vsel-gpios:
+            description:
+              GPIO that can be used to read the current status of the SD_VSEL
+              signal in order for the driver to know if LDO5CTRL_L or LDO5CTRL_H
+              is used by the hardware.
+
+        unevaluatedProperties: false
+
     patternProperties:
-      "^LDO[1-5]$":
+      "^LDO[1-4]$":
         type: object
         $ref: regulator.yaml#
         description:
@@ -78,11 +100,6 @@ properties:
 
     additionalProperties: false
 
-  sd-vsel-gpios:
-    description: GPIO that is used to switch LDO5 between being configured by
-      LDO5CTRL_L or LDO5CTRL_H register. Use this if the SD_VSEL signal is
-      connected to a host GPIO.
-
   nxp,i2c-lt-enable:
     type: boolean
     description:
-- 
2.47.1


