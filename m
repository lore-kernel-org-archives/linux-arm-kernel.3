Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0DDEA4E38
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5KOgK7z/+ZOKZNRxOzzF6lw3zXeqfyWzuIlOErH/mR8=; b=F0NxCM4TlU2Ues
	9UsoKs0WFj6N0+hJdcsVvnOKVlKPlBj2xYThD3ATljGWQxgp7UyQIJDSmtDA5cg3Uz2PosHGGe4W5
	+NFReoZVlPTphD7J+XXGP8Xk4Mtask7F/zBO8KdVJANpXWBc0lujuOgYuRbpvQZFqxipZydkOTfR3
	Y7f7Hwm4dtC6PQXlseU2Mve2DmXn0YqQ7ztbobHWusHNVKqnhlSukzMivc5KX4WV8mfv9fOKZG9ag
	jWiIRaPR5a7K6tIRz0B+BRgVCDR4eTe+5KMq1G0uw9Q900W4w92mo1ZvaUjaJk/rm2xU9AUYlZH10
	6kxoU7oIsP8nq6S4RPKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5ri-0000000DSaI-34nC;
	Mon, 02 Mar 2026 16:11:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5re-0000000DSZ3-3k5h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 16:11:24 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vx5rC-0002vi-Cp; Mon, 02 Mar 2026 17:10:54 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v10 0/3] Add i.MX91/93 parallel display support
Date: Mon, 02 Mar 2026 17:10:39 +0100
Message-Id: <20260302-v6-18-topic-imx93-parallel-display-v10-0-634fe2778c7a@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH+2pWkC/5XOy2rDMBAF0F8JWldFo5ftrvofpQs9xsmAawvJN
 Q7B/17FUAg0C3d5L8O5c2MFM2Fhb6cby7hQoWmsAcTLiYWLG8/IKdaCSSENSAF8sRxaPk+JAqe
 vtVM8ueyGAQceqaTBXXln+k4q7XsbAqtQytjTuq98fNZ8oTJP+bqPLvbe/ouvJ4I3XhiLgMYDv
 iccz99znkZaXyOy+8bSPLrykNtUV4aACqLVVrRP3fbXtQJAHXLb6mrnQ4hBN8qZp2736JpDbrf
 /a4QB1B60/uNu2/YD2IzD4+IBAAA=
X-Change-ID: 20251201-v6-18-topic-imx93-parallel-display-95f9234bf6cc
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 luca.ceresoli@bootlin.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_081122_933191_2AF41AB6 
X-CRM114-Status: GOOD (  12.54  )
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

Hi,

this patchset adds the driver, dt-bindings and dt integration required
to drive a parallel display on the i.MX93.

Since the i.MX91 register layout equals the one from the i.MX93, I added
the support for both but tested only the i.MX93 case.

This patchset depends on:
 - https://lore.kernel.org/all/20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de/

@Conor Dooley
I dropped your r-b tag since I added the 'bus-width' property.

Regards,
  Marco

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changes in v10:
- Link to v9: https://lore.kernel.org/r/20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de
- Add MEDIA_BUS_FMT_FIXED (Liu)
- Drop next_bridge from driver struct and use bridge.next_bridge (Liu)
- Drop linux/of_address.h include (Liu)
- imx93-pdfc: drop bridge.driver_private usage++ (Liu)
- Make use of kmalloc_obj() (Liu)

Changes in v9:
- Link to v8: https://lore.kernel.org/r/20260113-v6-18-topic-imx93-parallel-display-v8-0-4abccdc473a5@pengutronix.de
- dt-bindings: drop unncessary changes (Frank)
- imx93-pdfc: drop bridge.driver_private usage (Luca)
- Kconfig: Adapt Kconfig symbol and prompt (Luca)

Changes in v8:
- Link to v7: https://lore.kernel.org/r/20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de
- dt-bindings: add nxp,imx91-pdfc compatible (Liu)
- dt-bindings: use video-interfaces.yaml# (Liu)
- dt-bindings: s/data lanes/data lines/ (Liu)
- dt-bindings: drop 'reg' poperty
- dt-bindings: drop #address-cells, #size-cells
- imx93-pdfc: drop drm/drm_print.h include (Liu)
- imx93-pdfc: s/exist/exists/ (Liu)
- imx93-pdfc: drop MEDIA_BUS_FMT_FIXED from imx93_pdfc_bus_output_fmts
- imx93-pdfc: imx93_pdfc_bus_output_fmt_supported: make fmt const
- imx93-pdfc: Rework input-fmt selection to always fallback to a sane
              default.
- imx93-pdfc: imx93_pdfc_bridge_atomic_check: make use of
	      imx93_pdfc_bus_output_fmt_supported() 
- imx93-pdfc: drop 'reg' dt-property usage
- imx93-pdfc: imx93_pdfc_bridge_probe: pass -1 for endpoint reg value (Liu)

Changes in v7:
- Link to v6: https://lore.kernel.org/r/20251201-v6-18-topic-imx93-parallel-display-v6-0-7b056e1e5b1e@pengutronix.de
- Add missing bits.h and bitfield.h headers (lkp)

Changes in v6:
- Link to v5: https://lore.kernel.org/all/20250304082434.834031-1-victor.liu@nxp.com/
- Add bus-width support
- rebase onto v6.18-rc1
- add review feedback (Alexander)
- driver license "GPL v2" -> "GPL" (checkpatch)
- make use of reg of-property
- fix to short Kconfig description (checkpath)
- add OF integration

---
Liu Ying (2):
      dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema and example
      drm/bridge: imx: Add i.MX93 parallel display format configuration support

Marco Felsch (1):
      arm64: dts: imx93: Add parallel display output nodes

 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml |  78 +++++++
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |  54 +++++
 arch/arm64/boot/dts/freescale/imx93.dtsi           |  12 ++
 drivers/gpu/drm/bridge/imx/Kconfig                 |  11 +
 drivers/gpu/drm/bridge/imx/Makefile                |   1 +
 drivers/gpu/drm/bridge/imx/imx93-pdfc.c            | 225 +++++++++++++++++++++
 6 files changed, 381 insertions(+)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251201-v6-18-topic-imx93-parallel-display-95f9234bf6cc

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


