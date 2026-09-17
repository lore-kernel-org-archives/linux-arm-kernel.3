Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52421C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJ+u9N0IVMNFM/Z0N49U31h73iEiUichEwKQu4MgjTo=; b=YfbQD74SWO7VP2einoVCuYH2+k
	wELMqnVUDbHkRGsQ/p0jZ58RJx0EU5UZeIihT4BCjqHajIyACcynkQFHdb1686kRMyJmFh4/aqXaN
	Q/IZGSgG4MYON9J9V3lVx0o8jBWUV0V41mieKq3QTtt2MBPrbTaXBmKKqdfzeYMw5RwCwPv48Cf6Z
	twT1E5jsf/rroyA+1muYNH55cJJ3jc3Ycr37BbNum7yEpBLtc/sB686b7nLHhonkkCjCX93qTbt1M
	zBGj1tvLSK/pL3H6Co1y2hBOS9HceW2swyLw1wsgpSIVbhAgDl154j0XBHAsWbtxDPKOwnGnItykh
	8VH1so0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CfZ-0000000BUB9-13Xj;
	Thu, 17 Sep 2026 14:00:57 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CfW-0000000BU9G-0Xhn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:00:56 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id C631E227EA;
	Thu, 17 Sep 2026 16:00:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789653651;
	bh=JJ+u9N0IVMNFM/Z0N49U31h73iEiUichEwKQu4MgjTo=; h=From:To:Subject;
	b=LQtryhQODYGsTRK0Z+111hA5x+GCNYdaduOJ4eAB52xvmx1LrZ41Ly2YdHtzGTsGm
	 wZ2/cNGC+xE7ydPKkAUVJ1mupDnhZSU1Vj1EphFtRmwrnyqdR7fEwfRvTHTpvCP9Ls
	 kYb15/UsB7HN1Kv7NAsyPyhiwQn8K08loGYluaU0cA9ABUAAoo89IvNAqevgzjwBtz
	 Cwpw78UPPqvzC8ysCBYJaq6X6rSJ7rg3N92AvffjRUPKE4pSXLNTpZvdKY9KXAa5DP
	 vYN6AX6FoUkfuMos6XDOm+7lBesXlZCOdrFn4xVctfrlGCytSA779G2e5gTplKvO+X
	 LPa6hVg4orAuw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/4] dt-bindings: lcdif: Add endpoint bus-width property
Date: Thu, 17 Sep 2026 16:00:36 +0200
Message-ID: <20260917140042.118181-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917140042.118181-1-francesco@dolcini.it>
References: <20260917140042.118181-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_070054_955127_17C487DE 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The DPI output of the LCD interface can be configured with a bus width
of 16, 18, or 24 bits. Introduce a bus-width property to the output
endpoint, specifying the number of parallel RGB bits connected.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v5: add ack/rev by tags
v4: use /schemas/graph.yaml#/$defs/port-base
v3: use video-interfaces.yaml
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 .../devicetree/bindings/display/fsl,lcdif.yaml       | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 2dd0411ec651..89cea0c14cf1 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -68,9 +68,19 @@ properties:
     maxItems: 1
 
   port:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
     description: The LCDIF output port
 
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml
+        unevaluatedProperties: false
+
+        properties:
+          bus-width:
+            enum: [ 16, 18, 24 ]
+
   display:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: phandle to display panel
-- 
2.47.3


