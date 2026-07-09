Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066D9C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AVFYL1MEos14H+4JIj0tu11tvLC3e7iA/fhlbTeCjc=; b=A55bhASSfAMi1FysISbxo39cZB
	CPImJWwxoP8L2F+pkmBhgIeB3014yRk/nI/9tkSWTY08amiasTrmNYrw40XqaxFgqiZ9KAGQppQu/
	sRBZAbiOwlthyDGtyv4N5TQVrxtuBO69M99+A4qKso3vFCgVNsrvHsHpcZqvIXigS2FywiGuKJvTG
	PzAXSTFjJ6959BEs6cOIKeX5obJhGf4k5tlZz9aPZaDzZEbklTXNwNkJMecueb9A1tuQsTeO0+KmN
	3+qJ/b8Idhcj9iJbYOXYZIKq/jbDXyygEWTPU7znCUbFOH7KiaQIwrTWbkyuPaIu9fFq7e8f0QgG4
	+vBoUZPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjq6-00000001NYm-3Xf5;
	Thu, 09 Jul 2026 08:10:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjq3-00000001NXX-0Azo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 70946438F7;
	Thu,  9 Jul 2026 08:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 322A8C2BCC7;
	Thu,  9 Jul 2026 08:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783584628;
	bh=NXPtnJSElIpKRB1lKI8cYyBmhE5lNVooFcti28hZYio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BoK6Xd0pM8eop8hVMrtbQAQFiJiwhKrpx2BNxi/nJjkuyzZVCY2MOmUwt/iSMCo6Q
	 dbBsybbzE3ISJadibD/w82vLXGHf13qx38vyujoBnRVyrCUfl4sBWvP58sIvL2lN2p
	 jEs87R4c1C+hsGu/1YaUSSJn8IdKm9sXDq/oy4XDTn3drL6mTeKLrpg3+B1gKItgVL
	 tuUyXjUJi9IrF62yot2yhWpf2MBOQMfcCYwSSEkp4flLoyXVJWBxychZS9gbLmzuLQ
	 XXrg3P+xThloraVniICedArXtVqwj38N1e/HXO1gDXiDFfqluVPEvZ0roRMRYiH4v0
	 j0MjuYoZEGAYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208DCC44501;
	Thu,  9 Jul 2026 08:10:28 +0000 (UTC)
From: HaoNing Cheng via B4 Relay <devnull+Haoning.CHENG.cn.bosch.com@kernel.org>
Date: Thu, 09 Jul 2026 16:10:21 +0800
Subject: [PATCH v2 1/2] dt-bindings: thermal: imx: Document calibration
 offset property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v2-1-00ff72495e24@cn.bosch.com>
References: <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v2-0-00ff72495e24@cn.bosch.com>
In-Reply-To: <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v2-0-00ff72495e24@cn.bosch.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783584623; l=1654;
 i=Haoning.CHENG@cn.bosch.com; s=20260709; h=from:subject:message-id;
 bh=DKKt2yS4Vd7uuoQbKmjwi1DTXyFYmb5Ugq4J+iX+RsI=;
 b=Qh66sonmy7IwkqL0J84EmMAwlZpycTwQ7sPM/A5AoBKvpKaMAEtczmQPgdHYKWSVXvfLzcuMg
 tf8m9bMmVScAVwzOBFshx74TULMu/oniE5brR4mugWQhAc1pI5KWHSQ
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
index 949b154856c5..eb7243a7ebaf 100644
--- a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
@@ -59,6 +59,13 @@ properties:
   clocks:
     maxItems: 1
 
+  fsl,temp-calibration-offset-millicelsius:
+    maxItems: 1
+    description:
+      A signed calibration offset, in millicelsius, added to the calculated
+      sensor temperature to compensate for board-level measurement
+      differences. When absent, no offset is applied.
+
   "#thermal-sensor-cells":
     const: 0
 
@@ -109,6 +116,7 @@ examples:
             nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
             nvmem-cell-names = "calib", "temp_grade";
             clocks = <&clks IMX6SX_CLK_PLL3_USB_OTG>;
+            fsl,temp-calibration-offset-millicelsius = <(-6400)>;
             #thermal-sensor-cells = <0>;
         };
     };

-- 
2.43.0



