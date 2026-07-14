Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C8AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 10:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Sj5qiOy8PZ9I5bxjKzkgqFud3IILPp53szXmPQ9TCY=; b=4b1s0zzXKQ9I+FwYYor+BSrCSF
	K/seT0enmUHWNkAuUZUyy9FS/WRjd7/FfjpGu4CZ+hxkHrXV0fbGp1lcwU4fiilLwznKOGwXLULzh
	sHVLQ3iMaqEQ4+bCEilg3x7fp2zI3xEdlFZLi5A1xORErxq9s2w5rn0M3zH/yhAi9yQe3oTrH38SE
	BYSzUkkJSXYuX8Iyh6NSF/iST9mo/LZJXq/umFKZm66MDlRubZfK38hcm2+WAdqmRR74w6a9V11Ca
	RYzZQAwM8/AeMyjrwmzSzqmLcWwYDoIFENI/OfANaKpnRpUwFd5VmvVzGm3lpOioxBaCq3v4H+c2Q
	xt+OlK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaNg-0000000BZWX-0bbf;
	Tue, 14 Jul 2026 10:28:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaNb-0000000BZVq-1dwx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 10:28:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE1B3437EE;
	Tue, 14 Jul 2026 10:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A820BC2BCB9;
	Tue, 14 Jul 2026 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784024926;
	bh=iYf+yTaMENGjFsDxnE24W2KARirES+DFL3au5+1XiJQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZIUHCgSzj39tkxHLYUQ4MebnOJLrT/lHqKRaXjRSIlfqNLSAO2tb4Qa1et0dLp/Rq
	 4YiLIVy4W9GWcZjLjCtdflNZQv02J7+T4a4WTGKzhUiLgaqmigxUvWChdjUrmwNl8/
	 m46IDreE217aN9H6WveMlX56oVlgf8HlB4VcA02ubhcOQqzUzQMBoh13zsZMhxTaNu
	 wNdEovr1mVgbkRDZ5rA7/LE0J1Pz7wXAnmiEOMCrYacNCho2ydQfEgxfpeBcVvPllg
	 CFKOJY/29CDjcHFTYhC3iAOimq15pGeeFS14iwOSEOz/gJpNWv3jnjuDl84rAR6ktu
	 wKpO4P5HeX/wQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FA1C43458;
	Tue, 14 Jul 2026 10:28:46 +0000 (UTC)
From: Haoning CHENG via B4 Relay <devnull+Haoning.CHENG.cn.bosch.com@kernel.org>
Date: Tue, 14 Jul 2026 18:28:41 +0800
Subject: [PATCH v8 1/3] dt-bindings: thermal: imx: Document calibration
 offset property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-1-d54d8690e16e@cn.bosch.com>
References: <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-0-d54d8690e16e@cn.bosch.com>
In-Reply-To: <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-0-d54d8690e16e@cn.bosch.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784024921; l=1880;
 i=Haoning.CHENG@cn.bosch.com; s=20260709; h=from:subject:message-id;
 bh=nULSe7w+6eN/dShLGlTXQ9Ef2waMpR9fIpFXwVCcgbM=;
 b=XW7laTS3jmFBvwYfw0Vi5xaGOgzpQbSuw20YTRxO7gi2LtZWLpki5zAtjZv6X8rBwGZIWoPyM
 H5/WxyIgczRDrr6mD4hFI/X/Tc1YQnHyQXG44rfb3mfHFaj7mMDYhZB
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

Some boards need a small per-design correction to align the reported CPU
temperature with board-level measurements.

Document the optional fsl,temp-calibration-offset-millicelsius property,
a signed offset in millicelsius that is added to the calculated sensor
temperature. The property is optional and the existing behavior is kept
when it is omitted.

Update the binding example to show its usage.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
---
 Documentation/devicetree/bindings/thermal/imx-thermal.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
index 949b154856c5..44365aac8115 100644
--- a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
@@ -59,6 +59,16 @@ properties:
   clocks:
     maxItems: 1
 
+  fsl,temp-calibration-offset-millicelsius:
+    minimum: -20000
+    maximum: 20000
+    description:
+      A signed calibration offset, in millicelsius, added to the calculated
+      sensor temperature to compensate for board-level measurement
+      differences. The range is limited to ±20 °C because a temperature
+      sensor with such a high deviation would be unusable. When absent,
+      no offset is applied.
+
   "#thermal-sensor-cells":
     const: 0
 
@@ -109,6 +119,7 @@ examples:
             nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
             nvmem-cell-names = "calib", "temp_grade";
             clocks = <&clks IMX6SX_CLK_PLL3_USB_OTG>;
+            fsl,temp-calibration-offset-millicelsius = <(-6400)>;
             #thermal-sensor-cells = <0>;
         };
     };

-- 
2.43.0



