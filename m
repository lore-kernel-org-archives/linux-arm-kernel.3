Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5204DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 05:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2J8oOM4U48EYquKbbDnKE+PNRE00MFb93uDf7r4+lg=; b=RDTPBp+1rhw8PahV6n4s1CtJ+5
	LMWwx1EiYP8OqH9UQNas7GGogK2FFGMAgDCa4p0He8MCaUsdDPxRL2eWNuTVfwqIWKWIMV7HxMrg0
	jPql4hVBkaXVu/2Hd4vXxwqJCt4eNtJ0TB9LlnuStwDSRPGCcpkdaL+nKkq979QIJbrh9yrK2JIBC
	rrc/c3HkeVzG4L3xjZ0ooGifPvrrVYDoD6kvgcTHdTfmjSbFCoI4KbOQhw+EWPFw2GcIFM5l1O2+f
	yZ4ALfXAO4KNR66BoMPy3q2uTl98EdhueujJrf1n1rptn9MKu5N+/c9kP5u+gW6xcWopUM6Cvpi5m
	2iqr2T7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhZb-0000000154k-237u;
	Thu, 09 Jul 2026 05:45:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhZa-00000001548-2XJF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 05:45:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C599F6136D;
	Thu,  9 Jul 2026 05:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F626C2BCB7;
	Thu,  9 Jul 2026 05:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783575921;
	bh=Undh417amuoNmnWjoLPCXV9xTq0nyBGyg1m4Fninpcs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cwDcxqNvPWa063pvfvwJ/gclokj0bXUE8jyw3/G7pTAj64XPZXsL4LDCFvVDFcczc
	 3MMZLpwsE3oj9aZnL+BVvMIaZMNv4B8xzM46vk88xueE0TolxtS/7lx8/XF1urI/TA
	 vsOSMbf0+4g3KE5b+zDs8/hPq+xFMae6TPaMvyryLL40kpX1prU7QJcZGtddSrMJrR
	 VaLJainTFmttsTKBnB+ddHyhPAuE0E9weDqIvK5cRrnIKSGpnG/7Dk4H7lgf0kf5Gf
	 Mkc0M60B7SJX+hdxEPVC/2cJvn9G4E0TAaRdayReot3WRJZ1dOV2+VB1+m1iue+b+D
	 E84h68Y5H7XWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D33C44503;
	Thu,  9 Jul 2026 05:45:21 +0000 (UTC)
From: HaoNing Cheng via B4 Relay <devnull+Haoning.CHENG.cn.bosch.com@kernel.org>
Date: Thu, 09 Jul 2026 13:43:27 +0800
Subject: [PATCH 1/2] dt-bindings: thermal: imx: Document calibration offset
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v1-1-00f88f42930b@cn.bosch.com>
References: <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v1-0-00f88f42930b@cn.bosch.com>
In-Reply-To: <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v1-0-00f88f42930b@cn.bosch.com>
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
 linux-kernel@vger.kernel.org, Haoning CHENG <Haoning.CHENG@cn.bosch.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783575916; l=1688;
 i=Haoning.CHENG@cn.bosch.com; s=20260709; h=from:subject:message-id;
 bh=+ktspic5FuVpdH2DPCuQLJE0m7veRBsySegdaHpw1dM=;
 b=9c10GNPVKYp0qiKdERsyCTSST7+4HWR2poW7/XY9T67HoBwQY6V7VQVACJGkleIp2do4a6DtH
 R/6T7kj1j0FCnoBsfnK8taIGOvJVRe3xgbrRqKmj/vn4nPiLeePeARl
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=ed25519;
 pk=glQGwad/fosRS5gZUJYbLDPPLGe7rFTrTV2VxY/ySdc=
X-Endpoint-Received: by B4 Relay for Haoning.CHENG@cn.bosch.com/20260709
 with auth_id=860
X-Original-From: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>
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

From: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>

Some boards need a small per-design correction to align the reported CPU
temperature with board-level measurements.

Document the optional fsl,temp-calibration-offset-millicelsius property,
a signed offset in millicelsius that is added to the calculated sensor
temperature. The property is optional and the existing behaviour is kept
when it is omitted.

Update the binding example to show its usage.

Signed-off-by: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>
---
 Documentation/devicetree/bindings/thermal/imx-thermal.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
index 949b154856c5..29bdcb921a96 100644
--- a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
@@ -59,6 +59,13 @@ properties:
   clocks:
     maxItems: 1
 
+  fsl,temp-calibration-offset-millicelsius:
+    description:
+      A signed calibration offset, in millicelsius, added to the calculated
+      sensor temperature to compensate for board-level measurement
+      differences. When absent, no offset is applied.
+    $ref: /schemas/types.yaml#/definitions/int32
+
   "#thermal-sensor-cells":
     const: 0
 
@@ -109,6 +116,7 @@ examples:
             nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
             nvmem-cell-names = "calib", "temp_grade";
             clocks = <&clks IMX6SX_CLK_PLL3_USB_OTG>;
+             fsl,temp-calibration-offset-millicelsius = <(-6400)>;
             #thermal-sensor-cells = <0>;
         };
     };

-- 
2.43.0



