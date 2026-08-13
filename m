Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5115C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtGJJqGBw9t2amLZOKq5ohBuJoO0U3WkBDkcXauskNk=; b=G6x7gcBQdIOMVyIpY+5LoJLufF
	3iLZTWAsjjWdWE7fDbL2AkSe7N9AyXdL1r9Em2UNF0fJpH3WuCHJnHEaoIVBUlXg1GMtHh34uq9Ex
	J3uJls2qAxas5cEC+XgYuhO26ZfqWqvacyek/JQ+3JZmbTR1L8lIsfb1dSHEBWJxsCRFjBnGjPrT2
	QJDJ1U6I9jf2jx6iZXe8vNATKgOW8UWG/pFwxW9Q+35POFm5s/hNNUAJEnxhM3fPnbK/0AWBQDxlO
	LMcZBk3OdLqXF9dsA1BVrXq3uEL9mwTkwYRmYOxhS8BL9JNWLCh9bLCMKmTBLKP2cWuo96PTbQxDQ
	tlrANUDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRk5-00000000Iy8-2Iaw;
	Thu, 13 Aug 2026 09:28:53 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRk0-00000000Itq-1MsU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:28:49 +0000
Received: from francesco-nb.. (2-224-16-253.ip168.fastwebnet.it [2.224.16.253])
	by mail11.truemail.it (Postfix) with ESMTPA id 6D29022BAE;
	Thu, 13 Aug 2026 11:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786613326;
	bh=WtGJJqGBw9t2amLZOKq5ohBuJoO0U3WkBDkcXauskNk=; h=From:To:Subject;
	b=mNsLEk45wtGZ7aqEPrHX3J98229fxaSgCn7Xrgufhvr8PO7kN7Fs5tVULfgctBTy8
	 zEMD3x5qOitTiWO8oCxRULHSr6Ps0HGURdwXnf581uJDRaJlON+8mctHQ9vfyS6pA3
	 uNA7uK3l5evpLGdXFv0RtxgaFKT+Zu3io48jLFphm+OkONI3jf20+1Gc6U1jVMEIMJ
	 vLz752LP/uUcQJQ8Y6ASUc/+d0ri5iHTjIsowYLen6ypMNrWX1Nb/whTgxhpL5GneX
	 ekTGOtDrJGqaxvw3rCyX8BM45J1oOwmGUdHDoUehXQHeg2J0q4UETZdmuBD/cfPHOy
	 oseSMlyFv3lcg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/4] dt-bindings: lcdif: Add endpoint bus-width property
Date: Thu, 13 Aug 2026 11:28:31 +0200
Message-ID: <20260813092836.38367-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260813092836.38367-1-francesco@dolcini.it>
References: <20260813092836.38367-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_022848_516816_73C0A1DE 
X-CRM114-Status: UNSURE (   8.69  )
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
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
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


