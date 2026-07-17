Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE7FC44520
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 12:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EFuCLGYMCnbLRMYIZ0CTwCE+ic9FazVUGAB/i7iYseA=; b=rl+kBJa5bsv1Cu+Dlz0ie8qC8w
	Q+Kz8uBrhBa0bNDnNCnwG5OQn4JH1NdAdnCyTMBMmqcD196eeDkJkyteWtVLQbyS/VGn90FQ6NI2N
	9p0a3HItRlyvWt2qlHilhEW2XQCP8f0UNYbNZ1tje+uO5ZHT6UKXnoDak+A56zgvhYGpoeFr58Dei
	6Qpy0sFVfcyUEiRwP6z+g1jV95+tJkJ/6dS7MIvABPq6HHMeKALmMTl+dd9vDW5WETKKltfxZc3kC
	7fF1bconYjS37l5wz4F68Odx4aCDdnJbwCupPjcUGY3PYM+WDBS38kUXPO4LxNoCvJ1m7DoABECK6
	Kjz3SWtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhX8-00000002GdJ-2Bbs;
	Fri, 17 Jul 2026 12:19:14 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhX1-00000002GYd-2mMW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 12:19:09 +0000
Received: from francesco-nb.. (unknown [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id A4E592272A;
	Fri, 17 Jul 2026 14:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784290738;
	bh=EFuCLGYMCnbLRMYIZ0CTwCE+ic9FazVUGAB/i7iYseA=; h=From:To:Subject;
	b=KLuku6X91PrAs0AOGADuKz5arzfCbtAJqY5ng9vV0eawIWYzYGb3JlG482A5xiNMq
	 b6dq/rqrNa0J0i60ifq1FN/uk50KAQ0mK5tL3/5kQxfpFqmCtkfFVa7XeZ4rrY3clH
	 GR4+CaOY2p4OKugbynGzNcgEYbQClsWRoUcbxvMlV/faqkVEbBWgpgPc9IWq2baY9C
	 IEJbL8elGkMNbCyRLJROMUC6UMdY47othoDhkUWLOB/mBU4uTPwFwibjplp2/vxOrN
	 oki7t6a9U2w/renqrbI4QRBsd2zFD+u/JO9mR+n9E9VEpfHsrVw5RUZWg01gbDdS83
	 UawJFAodslSVA==
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
Subject: [PATCH v1 0/4] drm: mxsfb: Support LCDIF interface pixel format
Date: Fri, 17 Jul 2026 14:18:42 +0200
Message-ID: <20260717121847.488148-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_051907_868513_D1C65FBA 
X-CRM114-Status: GOOD (  10.23  )
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

The LCDIF data bus format describes how color component bits are assigned
to the physical LCD_DATA pins. This is a property of the LCDIF-to-display
wiring and can differ from the input format advertised by the downstream
panel or bridge.

Such a distinction is required when a narrower LCDIF bus is connected to
a wider display interface. For example, an 18-bit or 16-bit LCDIF bus can
drive a 24-bit display by wiring the available color bits to the
appropriate display inputs. Configuring LCDIF from the display's 24-bit
format in this case selects the wrong LCD_DATABUS_WIDTH mode, changing the
color-bit assignment on the LCD_DATA pins and resulting in incorrect
colors.

Add the optional interface-pix-fmt property to the LCDIF binding and make
the mxsfb driver use it in preference to the format reported by the
downstream display. When the property is absent, the existing behavior is
preserved.

This follows the approach already used by the i.MX IPUv3 parallel display
driver in drivers/gpu/drm/imx/ipuv3/parallel-display.c.

Set the interface format for the Colibri iMX6ULL and Colibri iMX7 boards,
which route an 18-bit LCD interface.

Francesco Dolcini (4):
  dt-bindings: lcdif: Add interface pixel format
  drm: mxsfb: Allow optional LCDIF interface format override
  ARM: dts: imx6ull-colibri: Set LCDIF format
  ARM: dts: imx7-colibri: Set LCDIF format

 .../devicetree/bindings/display/fsl,lcdif.yaml   |  7 +++++++
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi   |  1 +
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi      |  1 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                | 16 ++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h                |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                |  8 ++++++++
 6 files changed, 35 insertions(+)

-- 
2.47.3


