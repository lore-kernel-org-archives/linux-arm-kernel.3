Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D14ECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPiyri8B7k2bct+4e5c5xnBcOdZcRZjBPgHNHY8UKtw=; b=tnFdtDsXtgJNXabHZJKrToLgBk
	stSHtB6PxabnFXPErCT9lIoIAx92dz5N569pnaLmgMFjjLrdvmEIPcQJWDd2vJ9w/FsqcnQ+it+0a
	v4fltPquHe7+UoSP8MfZ9kQeg8Ooyyy3kfE6yf3OKwg4YcKHc1gpXU+LRhoSB281nzahGB4kzn4RI
	sRlfVG4W6RFbRqFkmYB2Wkb4hjBofRi9r/GjZR55xt1fIwgvBOAHNIywxLMpcrn6wEIA0oGWFH0gL
	9fE9iIyUsrdSI+W65MtZ898IqX9CwSO+IpKbUdxfxSSnh3Bx0qtp39ju9oatqzgNjI0ZzIi4yCN7t
	bg6KJwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d19-0000000AOc6-0qBl;
	Sat, 11 Oct 2025 17:04:27 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d0y-0000000AOJH-2VHX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 17:04:24 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ckVML5Ssxz9tH5;
	Sat, 11 Oct 2025 19:04:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPiyri8B7k2bct+4e5c5xnBcOdZcRZjBPgHNHY8UKtw=;
	b=YD7lKh4Zdf76nSMCJAStIiM4bNPfP83U5mHSGc7jOe8IoG7sEJjLs/hUyPsc28E1gdMCdw
	aSUz5TVuvEwk/5NNlLD3wDiBC6DdB+g5GN3W7x3WBJBCG4hMoWDKuhL9mC1viULyKjOg1/
	xfH2Ncz6xbELzrH13+MUci1zwASXsZjLN3RRsJPBD/mXOOJu+QOj9HIYMTqD5LPJ/rf1Xv
	UqPXHNcFzQ5rD8bOP2d9pwvgmiXeqxALuqiuCqDAWWzXH1WuTM5vqy4HPblLGxz4Zl71cJ
	1KZG1LPu0M0tURJ3uMbjOXZvh20jPE52r8bnpcz8GlVmINHVzCP8Uu7NFRauUQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=fpp2uCXH;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPiyri8B7k2bct+4e5c5xnBcOdZcRZjBPgHNHY8UKtw=;
	b=fpp2uCXHh9XD4JyA5nrRXLCt89JMZD68UW2GptC0MJOAZzUetKaPCyrUniPt6MAQkkeRzF
	nOP85GjwcWMHFAYxLsSlhe2rrwCwC+KDSsj8hWpP/AGPxqwVhNmo/KCBRYqPcA2UaPRBd4
	WEj8An3sdIo22BNhCfL6oe54ng0C0cPNpY/MeWMQseG/NrRtZ+Xqc1nWD5FzxYsg1EU0Hi
	ko7Gw/vc9o5DaoYkWaPwfW/K8Wzl+Cohn9cVSplZiIvwuGQ+aQy6C/CPxv3exPlM7TXgJp
	9MEg+Xsxap9B/jZcP28e4M4SfCf1a0T0gsaC67G7lpipBzv2pXL4EW1rMKgOcQ==
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
Subject: [PATCH 29/39] dt-bindings: display: bridge: Document Freescale i.MX95 MIPI DSI
Date: Sat, 11 Oct 2025 18:51:44 +0200
Message-ID: <20251011170213.128907-30-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 85zz6hyigpakz4rsiia6ykwknitchfqo
X-MBO-RS-ID: a8076b6bb914c6c52ba
X-Rspamd-Queue-Id: 4ckVML5Ssxz9tH5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_100416_829202_02C43E1E 
X-CRM114-Status: UNSURE (   9.19  )
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

Freescale i.MX95 SoC embeds a Synopsys Designware MIPI DSI host
controller and a Synopsys Designware MIPI DPHY. Unlike the i.MX93
PHY, the i.MX95 PHY uses more syscon interfaces to configure the
PHY.

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
 .../display/bridge/fsl,imx93-mipi-dsi.yaml    | 48 +++++++++++++++++--
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
index d6e51d0cf5464..388301c4f95c1 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
@@ -14,12 +14,11 @@ description: |
   Designware MIPI DPHY embedded in Freescale i.MX93 SoC.  Some configurations
   and extensions to them are controlled by i.MX93 media blk-ctrl.
 
-allOf:
-  - $ref: snps,dw-mipi-dsi.yaml#
-
 properties:
   compatible:
-    const: fsl,imx93-mipi-dsi
+    enum:
+      - fsl,imx93-mipi-dsi
+      - fsl,imx95-mipi-dsi
 
   clocks:
     items:
@@ -46,13 +45,52 @@ properties:
       controller and MIPI DPHY PLL related configurations through PLL SoC
       interface.
 
+  fsl,disp-master-csr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      i.MX95 Display Master CSR is a syscon which includes registers to
+      control DSI clock settings, clock gating, and pixel link select.
+
+  fsl,disp-stream-csr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      i.MX95 Display Stream CSR is a syscon which includes configuration
+      and status registers for the DSI host.
+
+  fsl,mipi-combo-phy-csr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      i.MX95 Display Stream CSR is a syscon which configuration and status
+      registers for the MIPI Tx DPHY module in the Camera domain.
+
   power-domains:
     maxItems: 1
 
+allOf:
+  - $ref: snps,dw-mipi-dsi.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx93-mipi-dsi
+    then:
+      required:
+        - fsl,media-blk-ctrl
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx95-mipi-dsi
+    then:
+      required:
+        - fsl,disp-master-csr
+        - fsl,disp-stream-csr
+        - fsl,mipi-combo-phy-csr
+
 required:
   - compatible
   - interrupts
-  - fsl,media-blk-ctrl
   - power-domains
 
 unevaluatedProperties: false
-- 
2.51.0


