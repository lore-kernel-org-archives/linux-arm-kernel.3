Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AED9CCD18C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 17:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EeEbDQhWonnXdbJ5j5TrV2WxPPBauvVZw8N3snFwnw=; b=hsiDLv/LQY1hYPKJb3DpxzFWoW
	PoBVY+7q15VzoFx/iFH2Q6CIgGIQkiNE44VD5dxC68viVhZk5LG8wQvjyikl26khj3A1YkOzdjIng
	TPxRmlfvXUtN8C2V5f8acqbMLWbBnSDeWI0seQnX+Y6oITwjGDtURu4TjWj81rbnqMUBXBYe9LMMW
	3Ol++jWm9Fk7Mt/lCD4XyjQAmDPKnwfHNm/1dTRqfqEtIBCTQ7x92oz0GqglmevNjUcs4ACDLhAfw
	5N36eAPiXjPnX/+vS22X4xJ7ybugbscKzBi1CSzdoB7Gpm2W+41vCXpTi3yv3kltPHVbERxwTdYzF
	88LVM1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d1K-0000000AOsg-28jB;
	Sat, 11 Oct 2025 17:04:38 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d19-0000000AOaz-3Eag
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 17:04:37 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ckVMY3Xpqz9sqh;
	Sat, 11 Oct 2025 19:04:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EeEbDQhWonnXdbJ5j5TrV2WxPPBauvVZw8N3snFwnw=;
	b=XaR2fVkNVeJR4TWCTAvv4ykUuI26H806Im9SDZtmw1sXCnwCafPCenzJRelZlWmV+bgBbk
	VFqmHeZMlVTP/Xp6NCReqFMovU2Egs5sUiZi7JcUF/tRCspDC/D0ydEp7aVkSqmk4+yk4L
	9GwsyGY+fKP96ZY+W0i22YOcfC7g77EAoNxfOoAiGn9YFrtjNeSvVbChyBy9jJJizrJYKy
	r1SUfxr3Q72yQp2HO4j8xht/BXulSJzkyITNesg/1c/mATbbBPsiuLyFfiHLhmj86F1GSi
	OdRuVnoe6v4CjSDocrhvOrA2LznGh1LH9hXhASfLm7vZY8cZogAPN1EGtCQDoQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=O51sbNnc;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EeEbDQhWonnXdbJ5j5TrV2WxPPBauvVZw8N3snFwnw=;
	b=O51sbNnccdWvDx6mhOHor5jev36SCLGVkofz+L3W6Tx0zg9MDyioo8yGEZUQpwDk+LsH+l
	dq9p++TIcbQKOueMvE/coOfg9n85hKi2rqAmzV/o90u8IhkHq3o1cPF5VcdhBRc/C/OUcN
	15msZrYJsVxstHjXuLbjQUlrgnYghIzc8HtMPhUJ7nvlRDF5GP8sVpw9uMai55io4v6GhS
	2F5PQLp7wZre7b2SVJfBkO+HtyJiDPhTWytzPNRLadQ95OMIahqli2D87XNVCL/wjFejGZ
	nlkY3GzNoQxoTmoDJtiNq7zorf4CxVgRACItAuGgnZCvJ8SFV6yZFwQMjajGSQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 32/39] dt-bindings: display: bridge: Document i.MX95 LVDS display bridge binding
Date: Sat, 11 Oct 2025 18:51:47 +0200
Message-ID: <20251011170213.128907-33-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 22afb507fe09ad60786
X-MBO-RS-META: 5rt3yriaq3d7qpkq6ca771w6qx8wxd37
X-Rspamd-Queue-Id: 4ckVMY3Xpqz9sqh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_100428_047576_46C31027 
X-CRM114-Status: GOOD (  13.02  )
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

Document i.MX95 LVDS display bridge (LDB) bindings.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 .../display/bridge/fsl,imx95-lvds.yaml        | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.yaml
new file mode 100644
index 0000000000000..8ada9c82a10d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx95-lvds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX95 LVDS Display Bridge
+
+maintainers:
+  - Marek Vasut <marek.vasut@mailbox.org>
+
+description: |
+  The Freescale i.MX95 LVDS Display Bridge(LDB) has two channels.
+
+  The i.MX8qm/qxp LDB is controlled by Control and Status Registers(CSR) module.
+  The CSR module, as a system controller, contains the LDB's configuration
+  registers.
+
+properties:
+  compatible:
+    const: fsl,imx95-lvds
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: ldb_di0
+      - const: ldb_di1
+      - const: ldb_ch0
+      - const: ldb_ch1
+
+  power-domains:
+    maxItems: 1
+
+patternProperties:
+  "^channel@[0-1]$":
+    type: object
+    description: Represents a channel of LDB.
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      reg:
+        description: The channel index.
+        enum: [ 0, 1 ]
+
+      phys:
+        description: A phandle to the phy module representing the LVDS PHY.
+        maxItems: 1
+
+      phy-names:
+        const: lvds_phy
+
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port of the channel.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output port of the channel.
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - reg
+      - phys
+      - phy-names
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - clock-names
+  - power-domains
+  - channel@0
+  - channel@1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    ldb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "fsl,imx95-ldb";
+        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
+                 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
+        clock-names = "pixel", "bypass";
+        power-domains = <&pd IMX_SC_R_LVDS_0>;
+
+        channel@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0>;
+            phys = <&mipi_lvds_0_phy>;
+            phy-names = "lvds_phy";
+
+            port@0 {
+                reg = <0>;
+
+                mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
+                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
+                };
+            };
+        };
+
+        channel@1 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <1>;
+            phys = <&mipi_lvds_0_phy>;
+            phy-names = "lvds_phy";
+
+            port@0 {
+                reg = <0>;
+
+                mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
+                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
+                };
+            };
+        };
+    };
-- 
2.51.0


