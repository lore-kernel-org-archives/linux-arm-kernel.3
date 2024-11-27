Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0219D6ACF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HvescA7ggE2G2W5BNg1EgLCr4WOqo5gIMehYGZzaE8=; b=uvaubqtNXMOHS6c9mumr9hNA5A
	rqbDYAd9Mz+tWyjjB/6qsVBGBmVQx4QYVzhxw32XUAO+Ck8+X3xnN/3lgGtdXUvID8oihgM6PNcIX
	cLXiYk4fT8HGO+LWb4TvgBhIgK5i/T8MY49xxg9txG9aZg+I5zlSyofrUc0o7QXmK0EyHm78KSU2R
	DwSn++pzrXstqEhAB5DckCELsWwRV9L2pfJb0iv5wqqWageYl6LcnVB00WTgaLlZkgojYa65XuOhw
	UQ3V8Rm2dJynmvlDv3PQWiXGqmfcLoyhHYqEJr+2DBRAO48E1KYcHS7+vQU1sUbXmmv5FaBp/wz3H
	0mHt90qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLCT-0000000DfyA-3Qn2;
	Wed, 27 Nov 2024 16:47:37 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL9b-0000000DfDS-0vJ6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 16:44:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBB17BFB94;
	Wed, 27 Nov 2024 17:44:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1732725874; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5HvescA7ggE2G2W5BNg1EgLCr4WOqo5gIMehYGZzaE8=;
	b=T7BE4FLRgYCezCzoNq4KpzDkWOO8N01zGOc8BESWb1Z/Ve1VCRp3pEVhWc/jODEP/f3PJv
	IS1dz85eEh4nSQv3UsQ6PhqNPvxmN+6JZNFPKqgjGgJ7JwkPR1SxNmWifDigV+tJrxCv50
	Y3m3Nc86IxwlaVg91NF5wtrI5GWAWi1etXR9WVmdU0Gm/bJrRcq/oMco+6sbt0xQfLEWdA
	7c9/bjdxIMB8qNGzfOIFhI8QYAIdsSOPH7E0JyCnx47wBTk21Hc5gsg8FW+9lZ5XovkPS4
	+SCxrie03YH51r6vJCfel57g9tBD9JaJWLvTuTdsGxr/K/ojy6AVT4XQKTl/Vw==
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
Subject: [PATCH v2 03/11] dt-bindings: regulator: pca9450: Document nxp,sd-vsel-fixed-low property for LDO5
Date: Wed, 27 Nov 2024 17:42:19 +0100
Message-ID: <20241127164337.613915-4-frieder@fris.de>
In-Reply-To: <20241127164337.613915-1-frieder@fris.de>
References: <20241127164337.613915-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_084439_406898_B234E039 
X-CRM114-Status: GOOD (  11.09  )
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

This new property can be used for boards which have the SD_VSEL tied
to a fixed low level. The voltage of LDO5 is therefore only controlled
by writing to the LDO5CTRL_L register.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* new patch
---
 .../bindings/regulator/nxp,pca9450-regulator.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
index 5d0d684186c96..0e19c54aa5f8a 100644
--- a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
@@ -49,6 +49,12 @@ properties:
           Properties for single LDO5 regulator.
 
         properties:
+          nxp,sd-vsel-fixed-low:
+            type: boolean
+            description:
+              Let the driver know that SD_VSEL is hardwired to low level and
+              there is no GPIO to get the actual value from.
+
           sd-vsel-gpios:
             description:
               GPIO that can be used to read the current status of the SD_VSEL
-- 
2.46.1


