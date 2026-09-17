Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF41C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skm3Fsv3AnGbhO2KEqDrMKHxJwSa91rKkWRnJk3LvDI=; b=iLTkQ/hwGQpqcQaXq0QcK6WBTr
	5NEDkYELJ2iFVbxVB07QuEJ12+5a5g60UubS67XWLmH2XmCSDjFgvR5AOVmLo/Mgb+808xt8V8S5e
	juhAKkdl4sBnJxaz3lL3OKDRfDXd2ZR8P+EHhIxLrqrWGz+SSpxkSy2CEBgTXBBRZipSc6PAz6iMc
	HVvpeXMyeeEOgiHEPv2HtETb0WMniwFzz+cxA/c6pHMKqnIFG24TE8S+YcnHXfVvcfNzMZHYU4VIw
	nH+waxdTyJvyIoJ1xpI2lxLqllg7LMdo/JPiEfs5UnHglQAINmeRsHO6wmCQCCAMZQPWtIDIPr2wB
	3kH4ZqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Cfe-0000000BUEO-2xxs;
	Thu, 17 Sep 2026 14:01:02 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CfY-0000000BUAU-3ZiQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:00:59 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 470F322814;
	Thu, 17 Sep 2026 16:00:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789653655;
	bh=skm3Fsv3AnGbhO2KEqDrMKHxJwSa91rKkWRnJk3LvDI=; h=From:To:Subject;
	b=o8DF/4JRMTOHW/jpaD2ArSG6uCfSEZWqONE15xTIfEKOz+uu5wfDl61IegBEq7kOf
	 LJl9AVBg5PS61g0BImpy/hPT/bCcFZRI4nd/Ov4cXdtdNSj5ZwcEULd4Zlc7MA6Yq7
	 VP8veGsMYmhiC0gcxdkEF6B/1dcVk3bihQMeeZ4l5nOuMtt4BjAuIKvWZaJGe9kGpy
	 dR+h/exB7vpWQ/8bZP3p3ZYlf5CPejusB8UlErEiUi1nCuG+taHIGaS7Ckxlg271qz
	 +tWKOLTfjtamlzO88VAQedwN/4xJUK09qAiuvbWNLQtOH6C5/9oYy47211flVHzp0o
	 RaBzuZ/4nORjQ==
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
Subject: [PATCH v5 4/4] ARM: dts: imx7-colibri: Set LCDIF bus width
Date: Thu, 17 Sep 2026 16:00:39 +0200
Message-ID: <20260917140042.118181-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917140042.118181-1-francesco@dolcini.it>
References: <20260917140042.118181-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_070057_072695_27C9DBAA 
X-CRM114-Status: UNSURE (   9.47  )
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

Link: https://docs.toradex.com/103125-colibri-arm-som-imx7-datasheet.pdf
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v5: improved commit message, added rev-by
v4: no changes
v3: no changes
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index 8666dcd7fe97..c4088d3c5ab1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -537,6 +537,7 @@ &lcdif {
 
 	port {
 		lcdif_out: endpoint {
+			bus-width = <18>;
 			remote-endpoint = <&lcd_panel_in>;
 		};
 	};
-- 
2.47.3


