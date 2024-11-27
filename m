Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEEFD6ACF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1czmU5HryxYDFCAjqA43ualDjKgjhaED/d0vTrFAZXM=; b=DJCwoyi/AHPvij0i2g5WBfNn7O
	RdOg/4tQ2jOL6DyXiMvxwbRLNwcb4VA9qJgP6o2Uex5yj2G0YgwWLGoKTeqGhfg15jf0b6kdWx3hK
	6285/I4AZF7oMWMYiejAki3Cesd5fYpGxh03Vkgt+PNXKGjsbm8yytu4Ak3oUeYl6iMziwH9qHrZF
	A6RqPGxyxWKCCTnHRy32Y2X7n7sXJ+yFvIjJDc1d+c65EKUwZs8InE6e4n940Sh+tqjTEz7ccljcn
	30J63KM5yxLKiHL05J9RNrWSXF1V37B4Xdc/GOwwhpUCrgCNKBzNOjy7wRnXRpG7lccJhCiCYpeVw
	v8180pBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLEN-0000000DgIB-0REI;
	Wed, 27 Nov 2024 16:49:35 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL9b-0000000DfD6-0snc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 16:44:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63CA2BFB92;
	Wed, 27 Nov 2024 17:44:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1732725872; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1czmU5HryxYDFCAjqA43ualDjKgjhaED/d0vTrFAZXM=;
	b=lgfdp3Tt2cGDgyZ/6cwY0Zdga57uMo7Oj1ogXGpd0ny4kkvNWE8aO1XDUD0PFE+kO+dTlq
	NmjZpCooVNOjCI9x4fvrbA+BNlPotfbsTK01cgTvkchWiY4zM76cgdVDjwb3GAm1CaNff5
	X4klzEJ3yDQ1HdLtX4LjazH+IgZve+4bZjn/iSiSrk2Ep4bOjWRP4DuD8BOj6NFAIrkWOV
	Z3chmNDzYEuzl0xMyMIp038mqg6MYFZaJc0EY1iu83yEIBKz7hE/ASxJ/BaxvuqOQpdXhS
	08K947hasnuz6R7ZYe4Dn+cL+mQDBOrA+UWCvUSaa8TWphnAAdYDbx4zTlBNzQ==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Robin Gong <yibin.gong@nxp.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 02/11] dt-bindings: regulator: pca9450: Add sd-vsel-gpios to read back LDO5 status
Date: Wed, 27 Nov 2024 17:42:18 +0100
Message-ID: <20241127164337.613915-3-frieder@fris.de>
In-Reply-To: <20241127164337.613915-1-frieder@fris.de>
References: <20241127164337.613915-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_084439_388020_9BDABFC0 
X-CRM114-Status: GOOD (  14.89  )
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

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* extend commit message
* split into two patches (revert old sd-vsel-gpios separately)
---
 .../regulator/nxp,pca9450-regulator.yaml       | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
index 79fc0baf5fa2f..5d0d684186c96 100644
--- a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
@@ -41,8 +41,24 @@ properties:
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
-- 
2.46.1


