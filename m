Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C96C44522
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 12:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjucR87tClkz1l16S+aKThSWLFGeiCovQUE3GWKhawk=; b=SgbiB1fMezunJF4g1pzQB+sgUZ
	cp8rqFJviWd6NDI/MuGW95el9ZbzKADkZDU+F4YN2yTW5v6wBSRv5+S7Xk/PqRcRnr/2iUM7Shdrj
	z1ThIl8Z2GI8I1eFZEkZFET3DUyphvsxOBjNkuzPryQwvVY1Jw+2zFKaQjI3PfjT6WkU6IpCunlzE
	7VtoryZ1GQbxfWIUqv5xlpFgBNLmiMr3C6749Ai0f/7OkAW/vG9pEZk4rNSEMmGzCcS+T45pEQlNl
	89znBUK5GAPtiieET11V1uRXfNzwDssH5AaIIWqzYpFc36cEeg3HR0iwMqGEPg+LUJKfVXR2MNUVk
	GdZQtBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhX8-00000002Gd0-1jQR;
	Fri, 17 Jul 2026 12:19:14 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhX1-00000002GYe-2mNH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 12:19:09 +0000
Received: from francesco-nb.. (unknown [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 8559B22734;
	Fri, 17 Jul 2026 14:18:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784290739;
	bh=tjucR87tClkz1l16S+aKThSWLFGeiCovQUE3GWKhawk=; h=From:To:Subject;
	b=SvW03pgfGHbcvlEjpleane2zkSv47jHysVnJ90Evye158m0l8ExpCNDEVu1VT94fd
	 LtEAmovQ7bafUBcJ9Z3655theSQ7+Q5qaD6NDlIhY37/HzrpOmKOVMB8x1ukBMGXxa
	 aRa/sAlNYI/VhFtVdFWFz/HGZY7gADbzQQZ7gAF2JTLo2bDpMTv/gWLTdOKBWO5HKL
	 11u4eb4Oz9XgAM3gLYM5ulNg8ufRhKCIKzQucqCqU41584bnhddYQ8TQVNLtcu6M4g
	 1SYa0yOTuYLJ/na8xJhY3A9V0TIEkvrl+x4S/Up2d0FKpyJS2WdvuOoR8xi330po9d
	 VG9Is131dc91Q==
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
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/4] dt-bindings: lcdif: Add interface pixel format
Date: Fri, 17 Jul 2026 14:18:43 +0200
Message-ID: <20260717121847.488148-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717121847.488148-1-francesco@dolcini.it>
References: <20260717121847.488148-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_051907_859105_4695B883 
X-CRM114-Status: UNSURE (   7.58  )
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

LCDIF has a hardware-configurable LCD_DATABUS_WIDTH field which selects
the parallel data bus transfer width. The selected mode changes how color
component bits are assigned to the LCD_DATA pins.

This must match the board wiring. On Colibri iMX6ULL, for example, only
18 LCD data lines are routed. A 24-bit panel can still be connected by
wiring the available LCD_DATA signals to the appropriate panel inputs.
Without describing the resulting interface format, LCDIF may assign the
color components to different data lines, causing shifted colors.

Add interface-pix-fmt so the binding can describe the configured LCDIF
bus format. The same property is already used by
display/imx/fsl,imx-parallel-display.yaml.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 2dd0411ec651..209ee5a96e39 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -58,6 +58,13 @@ properties:
     items:
       - const: rx
 
+  interface-pix-fmt:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - rgb24
+      - rgb565
+      - rgb666
+
   interrupts:
     items:
       - description: LCDIF DMA interrupt
-- 
2.47.3


