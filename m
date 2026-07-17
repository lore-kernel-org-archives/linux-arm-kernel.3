Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52101C4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 06:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iqey8CtdXynAAAx9kGg4U/5/xV5+7nCKr6cwRlNRchA=; b=QFxwI7251cLgQ8WSpx4LbxSt7N
	JNgtf1IAuRGSFsZx9iqn9zd+pOMwc8Vav5z83rhJBBwsOvG8Bsazf6kxFbVTESvgE/rz6NFfgXl3O
	g8KuBFHOi1QP2XvlgL17chH4E0dyYl36vLMWmU0rKGubUu8RJn8MnuG4XT5ZauznpCbmiF/D/DAwi
	mzEyttM5z6Rts4OpxwZ/mwZbl1tiYg3hVZudHn4MrQr+/UPJL0GyfnUjQS2T69aSsE756FlnDqc+q
	BwofRIamGbIavvdk/+v4+GXFR3Quwzg6zEkd+pY1BbvSa8F2JVxi4AKgn0OohZAMOLK/8y4YLd9kB
	7+PDsqiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcAs-00000001HWD-1ixG;
	Fri, 17 Jul 2026 06:35:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcAi-00000001HT2-3Yly
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 06:35:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E502560A63;
	Fri, 17 Jul 2026 06:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83675C2BCC7;
	Fri, 17 Jul 2026 06:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784270143;
	bh=FIb4cYS6QqbHNhO1g+w7esXFrMiyD97QYDATrsw8YsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PT5bLunuru/Uk71FLiqnZnC8YlPehekFmNJT/RQBBWMCWgNjDkHMQwlVCt53HLXQ/
	 4nuVTrb9YxxXrkKz1ycHppOMVDjA2GJN6Uo+cEBi6fvW8XRt4kGdqnqfeseobXzS5W
	 vBcKaEJr9UisOYm7g4uNrsaf0254rdCK20z/rLqJo9sfIWPlCOCl9x63OXOXLpLZwC
	 ARi3qrCohInk1raLV3CmMqnILGkZ3cVfJ7upGuT+QuPSW2V33cPjRKWGVmajpRus1o
	 8xQtCpwjFEHJ6A8Z/UgtWiN5vbLm7oPK1nxb9A8wQFjtCJ7TstxcQRcIubsRNJE3Ey
	 BLTcVLV3eJAZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65143C44507;
	Fri, 17 Jul 2026 06:35:43 +0000 (UTC)
From: Haoning CHENG via B4 Relay <devnull+Haoning.CHENG.cn.bosch.com@kernel.org>
Date: Fri, 17 Jul 2026 14:35:35 +0800
Subject: [PATCH v9 1/3] dt-bindings: thermal: imx: Document temperature
 offset property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260717-b4-symana21-11221-imx-thermal-support-upstream-6-18-v9-1-75f4af8974f4@cn.bosch.com>
References: <20260717-b4-symana21-11221-imx-thermal-support-upstream-6-18-v9-0-75f4af8974f4@cn.bosch.com>
In-Reply-To: <20260717-b4-symana21-11221-imx-thermal-support-upstream-6-18-v9-0-75f4af8974f4@cn.bosch.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784270138; l=2298;
 i=Haoning.CHENG@cn.bosch.com; s=20260709; h=from:subject:message-id;
 bh=PV3MnYc2Hk8Iy2pB7or+nfukgwcqkNEuWR6y8WvDrsg=;
 b=iqEwDbHQhnAlfvKPaj9J/P38F7tJfNrV2zE5yTWKDwZDOJxpYd9wBgWzq/p8SML8/m/gGyylp
 afNnUnhea7XC3vT8p7oRJJ9XUrg7dwk/kR3Xs20W9kE81E2U3Q5WMjI
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

Some boards need the reported temperature to reflect the SoC
package-surface temperature rather than the internal die temperature.

Document the optional fsl,temp-calibration-offset-millicelsius property,
a signed offset in millicelsius applied to the internally measured
temperature to make it better correspond to the package-surface
temperature. The offset is board-specific and is determined through
thermal characterization. When absent, the offset is zero.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Signed-off-by: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
---
 .../devicetree/bindings/thermal/imx-thermal.yaml          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
index 949b154856c5..6c268d56291b 100644
--- a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
@@ -59,6 +59,20 @@ properties:
   clocks:
     maxItems: 1
 
+  fsl,temp-calibration-offset-millicelsius:
+    minimum: -20000
+    maximum: 20000
+    description:
+      A signed offset, in millicelsius, added to the calculated
+      sensor temperature to make the TEMPMON reading better correspond
+      to the SoC package-surface temperature observed during board-level
+      thermal characterization. This is not a sensor calibration offset;
+      it is a board-specific conversion offset derived from the
+      relationship between the internal sensor reading and the
+      package-surface temperature, which depends on the package, PCB
+      layout, cooling arrangement, and operating environment. The range
+      is limited to ±20 °C. When absent, no offset is applied.
+
   "#thermal-sensor-cells":
     const: 0
 
@@ -109,6 +123,7 @@ examples:
             nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
             nvmem-cell-names = "calib", "temp_grade";
             clocks = <&clks IMX6SX_CLK_PLL3_USB_OTG>;
+            fsl,temp-calibration-offset-millicelsius = <(-6400)>;
             #thermal-sensor-cells = <0>;
         };
     };

-- 
2.43.0



