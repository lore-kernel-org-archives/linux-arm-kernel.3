Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929D7C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 02:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCuGU0UcRcG2jar7uHkOsLcZmTEy3MKGt9gOjdNOtis=; b=V4kQSFY2nCm6DUiGloLfDX6h02
	ZdFBt/Js+22kmlQzFuPdqceXaRQmjZklETZuv8Gg3qZIepcnOi4ezHqkqXqq+q5y/zv1xSdg8h8a0
	UmJjwc6xmrBYLFLsnYkjKEpZKJnsW68mpn8z/dObTKFSPxNlsLMKJAzskbdOxKnZzDa1dZpobJx4g
	+hMEteppHqnzPijz9ZLmn9o/IpMpYUxkYOGCGAo3ZKQhFHLF9p04Kp8zOMhTnx5TM5oKbuN/c/Qr6
	ZWtUMlMVQ3Y9aVA6tQDNXs50RwfCUEMo4P9KgN5g3QY0ckVmLv516TCXMfwteIEgPBQucd+9VJqrS
	R2QlSsiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMrU-0000000Alyg-0hAm;
	Wed, 22 Jul 2026 02:39:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMrS-0000000Alxw-0a3u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 02:39:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 876D4436F7;
	Wed, 22 Jul 2026 02:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6260CC2BCB8;
	Wed, 22 Jul 2026 02:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784687945;
	bh=noP7SLtTy6bRV7+vDOu0XXWL530DjmB63o88p0NEPPI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vChfd3TQJdklUQPqg0W0Kz4uVFSoFU/HwVH2NtfPponDBh6pzPhwgn7moELJFigZE
	 MhUBbTgUrV2CWOEhFM3SZd25D7aarp0jcXfuSLRd80yvbVna7O1rD41gsqBxoat/T2
	 LQGlGJTVB7kbKwvucOBGPJhGNFr6/uKw3108CsKlGp15sDAp2L521lqs3EdMTY2eg/
	 XqbFXtcR/C5G1kEvhAvGAuhnTrDA9KtV+HR/9mzEdVlWtRiL7jRvW/SkT3N+jT3m9F
	 SMyT8Gjp8ZvLOUIP1omt8hKBCfON768znuprxLAkyg3PGJT03+tCKco10zb917daaO
	 2PeM7JXEO42ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0BBC4452D;
	Wed, 22 Jul 2026 02:39:05 +0000 (UTC)
From: Haoning CHENG via B4 Relay <devnull+Haoning.CHENG.cn.bosch.com@kernel.org>
Date: Wed, 22 Jul 2026 10:11:41 +0800
Subject: [PATCH v11 1/3] dt-bindings: thermal: imx: Document calibration
 offset property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260722-b4-symana21-11221-imx-thermal-support-upstream-6-18-v11-1-90e4e46c0a13@cn.bosch.com>
References: <20260722-b4-symana21-11221-imx-thermal-support-upstream-6-18-v11-0-90e4e46c0a13@cn.bosch.com>
In-Reply-To: <20260722-b4-symana21-11221-imx-thermal-support-upstream-6-18-v11-0-90e4e46c0a13@cn.bosch.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Haoning CHENG <Haoning.CHENG@cn.bosch.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784687940; l=2030;
 i=Haoning.CHENG@cn.bosch.com; s=20260709; h=from:subject:message-id;
 bh=Ue37UPF1teuZxiSxC/xhzQKQfZyk1Yq+nuequgJPOG4=;
 b=ABwbGlbH3nVJiQM3RU0KiJXtVhO5x9aUjwRw7+Wwy9UUumZfzoR8s6zJYVAQ21SP7ibyoWgQr
 YBxqBfD5SDiDKow5vBJUINNZbcQMtV7XTAus2mhOixYRfral2GmYQAg
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=ed25519;
 pk=glQGwad/fosRS5gZUJYbLDPPLGe7rFTrTV2VxY/ySdc=
X-Endpoint-Received: by B4 Relay for Haoning.CHENG@cn.bosch.com/20260709
 with auth_id=860
X-Original-From: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
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
Reply-To: Haoning.CHENG@cn.bosch.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Haoning CHENG <Haoning.CHENG@cn.bosch.com>

The TEMPMON sensor reading may deviate from the theoretical SoC
junction temperature. Document the optional
fsl,temp-calibration-offset-millicelsius property, a signed offset
in millicelsius applied to correct the sensor reading toward the
theoretical junction temperature.

The offset is determined through thermal characterization by
comparing the sensor output against the calculated junction
temperature. When absent, the offset is zero.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Signed-off-by: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
---
 Documentation/devicetree/bindings/thermal/imx-thermal.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
index 949b154856c5..503a6e7a2c68 100644
--- a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
@@ -59,6 +59,17 @@ properties:
   clocks:
     maxItems: 1
 
+  fsl,temp-calibration-offset-millicelsius:
+    minimum: -20000
+    maximum: 20000
+    description:
+      A signed offset, in millicelsius, applied to the TEMPMON
+      sensor reading to correct it toward the theoretical SoC
+      junction temperature. The offset is determined through
+      thermal characterization by comparing the sensor output
+      against the calculated junction temperature. The range is
+      limited to ±20 °C. When absent, no offset is applied.
+
   "#thermal-sensor-cells":
     const: 0
 
@@ -109,6 +120,7 @@ examples:
             nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
             nvmem-cell-names = "calib", "temp_grade";
             clocks = <&clks IMX6SX_CLK_PLL3_USB_OTG>;
+            fsl,temp-calibration-offset-millicelsius = <(-6400)>;
             #thermal-sensor-cells = <0>;
         };
     };

-- 
2.43.0



