Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2A8C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFbHrnCbgfpqZStiZJ8Sb/nHDFg7+/3mGwQ68I1HP3A=; b=ZrAy4K+Ik2V/Vtjxe3D35cOGuR
	9dYZW6DSlJe0mzyguZStNtJ86ItVNNizUroYpWYLpI/whk/SDZ8vSrH+3iYHPi4K5KhCbnpE7MP/j
	QCG0bgzRDCf4/31JJb5U1zzLdDhsyS6ssKsMhOSI+XCd5coHvI5+EYeoLtEYSzloWnHVawMBwMh1n
	+MvPUj1rS4URv59VS5ydaQUHUW+ZjS6TRqLW4hAGQiggxalJj07dBxRJBFpZJP+t4QTqd290jTMJO
	+VlDvwHBCGZILR+7LtmYTHFeLXNIu+tvvdLtGvnbrtRWZmEa3ayo4r/xsmrhPF3hHMSsBxmn6Lucy
	amL+lm0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Cfe-0000000BUDx-2UJm;
	Thu, 17 Sep 2026 14:01:02 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CfX-0000000BU9X-3Md6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:00:58 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 282F622817;
	Thu, 17 Sep 2026 16:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789653654;
	bh=PFbHrnCbgfpqZStiZJ8Sb/nHDFg7+/3mGwQ68I1HP3A=; h=From:To:Subject;
	b=TtipBJkoMi6cb3iVLiD7pa++jODJA5EF5UJJPbuB9G6kDhgrasJYojd+g6IDXKSFf
	 u7BGs/ZojQDywBeGS0BBpSeSaMlGYE3MXoYcuYNvRL+yMMYRjF8ED2I3jNt8J9rYiy
	 uJHbWWqGoEcb88/dq1g8IzYQG+wWNizk5rBGXEEm8/4yILdEneOa584tOTyz7Y1SDm
	 HXxHTw7d23EXswFiPYpgDJjH6UJro2SqFlktKmRtDlpc+NWA639jJFdfECov5xzc11
	 cGJJUFBwQXHI63P3x0zuSBVHpicWZrhQTL9qso4uu66THawaE32dNtIiS0i8dBzzyT
	 p2aZV/IBs/LeA==
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
	Robert Foss <rfoss@kernel.org>
Subject: [PATCH v5 3/4] ARM: dts: imx6ull-colibri: Set LCDIF bus width
Date: Thu, 17 Sep 2026 16:00:38 +0200
Message-ID: <20260917140042.118181-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917140042.118181-1-francesco@dolcini.it>
References: <20260917140042.118181-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_070056_005076_B88C008E 
X-CRM114-Status: UNSURE (   9.57  )
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

The Colibri family standard defines an 18-bit parallel RGB interface on
the edge connector. The additional six LCDIF data signals required for a
24-bit interface are mapped to module-specific pins whose location is not
fixed across the Colibri family and which may not be available at all.

Generic Colibri carrier boards can therefore only rely on an 18-bit
interface. Set the LCDIF bus-width property accordingly.

A 24-bit interface can still be used by a specific carrier and module
combination by overriding the property in the carrier board device tree.

Link: https://docs.toradex.com/104446-colibri-arm-som-imx6ull-datasheet.pdf
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v5: improved commit message, added rev-by
v4: no changes
v3: no changes
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
index ec3c1e7301f4..1eb1cf2d7395 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
@@ -229,6 +229,7 @@ &lcdif {
 
 	port {
 		lcdif_out: endpoint {
+			bus-width = <18>;
 			remote-endpoint = <&lcd_panel_in>;
 		};
 	};
-- 
2.47.3


