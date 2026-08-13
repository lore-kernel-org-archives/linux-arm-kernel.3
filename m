Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1099FC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBCHYw7I9S7Y20SxJwplf/AxXBr7O17kMt2uHrRejis=; b=rIi/uVSWuu0YlStZAROtHqc02C
	IAAFNZ4QtnuuJvUGICTXs+VTabIBK43/wLGUUIY78oZkRkvL0DmBQQgxdlnGLbydMCQviuwUL7qd3
	DQOBfB+e9JqFGnGGozMs2+1Yn7lWu1TjKFtYjXaZmA65a0tA0tV34YtVHZ2b8dm7iRC4v5APMKzHj
	MXVJ6cIEIfrV6sCSvJmWx+0e6PcN2w51ijdkvaUsHMA/S2+kp7f1gDpEB7PWYbTZSBFO26omGt9+5
	iGD8aegqXPivoWktEhTfHnpAT2yHN3LjydjywcdmfU5ybEJA9ofYpqC+ynUzwlTx4uwGXW2dgj8f0
	fmSd0AmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRk5-00000000IyQ-2iw8;
	Thu, 13 Aug 2026 09:28:53 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRk2-00000000Iug-1I1D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:28:51 +0000
Received: from francesco-nb.. (2-224-16-253.ip168.fastwebnet.it [2.224.16.253])
	by mail11.truemail.it (Postfix) with ESMTPA id 0B80222BAC;
	Thu, 13 Aug 2026 11:28:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786613328;
	bh=OBCHYw7I9S7Y20SxJwplf/AxXBr7O17kMt2uHrRejis=; h=From:To:Subject;
	b=xIV0E/KaqEf48btk4ZxnGTx2tXopaqOu8ZV71ShohqTdDzYihmtAaVyI/xS27VWdm
	 7AnoAe9W8gxQaiVnxwQ7KT3NF2PTxxM+7HEF4skWIR+merzFW0qVO9CGBLstNxzWYB
	 56YTlHp98+sNrk4St4NMWQVak0LixuLRSq059ujaJqv8RImyYqfmmcHnEUBtej4UOP
	 vvApp4NVJg6ZebLUFe+WxPaWT+F8gpsL2dQhql1X1TlZxPew9whOTvLAuadvP+5Eex
	 OJVw8bhdO3UjvuSRuNLZO7nHMH9G+iR3S1CEcURULOZ9YNvqFrshIKHMhAjoTxVE3t
	 s1lK9LfIZcbfw==
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
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v4 2/4] drm: mxsfb: Add optional DPI output bus-width configuration
Date: Thu, 13 Aug 2026 11:28:32 +0200
Message-ID: <20260813092836.38367-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260813092836.38367-1-francesco@dolcini.it>
References: <20260813092836.38367-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_022850_676953_9FD450F2 
X-CRM114-Status: GOOD (  20.42  )
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

LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format. The
format reported by the downstream panel or bridge describes the display
input, but it does not describe how the LCDIF data pins are physically
wired on the board.

These can differ. For example, a 16-bit LCDIF bus can be connected to a
24-bit display by wiring the available color bits to the corresponding
display inputs. In that case, using the display's 24-bit format to
configure LCDIF selects the wrong data-bus mode and changes the assignment
of color bits on the LCD_DATA pins.

Read the optional bus-width endpoint property from the LCDIF output port
and use it to select the media bus format used to configure LCDIF. This
allows the LCDIF bus mode to describe the physical interface
independently of the downstream display format.

When the optional property is absent, or it has an invalid value, continue
using the format reported by the downstream display device, preserving
the existing behavior. The code is not validating the DT for
correctness and just fall back to the previous behavior in case of
errors.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa6UL[L]x
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v4: add r-b and t-b tags
v3: improve commit message and make it clear that the code assumes that
    the DT is correct, when the DT contains an invalid property value,
    the code safely fall-back to the previous behavior
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 12 ++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 8b4a500347fb..f8ecc8bbd63c 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -12,7 +12,10 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/pm_runtime.h>
@@ -211,7 +214,10 @@ static int mxsfb_load(struct drm_device *drm,
 		      const struct mxsfb_devdata *devdata)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
+	struct device_node *np = pdev->dev.of_node;
 	struct mxsfb_drm_private *mxsfb;
+	struct device_node *ep;
+	u32 bus_width = 0;
 	int ret;
 
 	mxsfb = devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
@@ -238,6 +244,24 @@ static int mxsfb_load(struct drm_device *drm,
 	if (IS_ERR(mxsfb->clk_disp_axi))
 		mxsfb->clk_disp_axi = NULL;
 
+	ep = of_graph_get_next_endpoint(np, NULL);
+	if (ep) {
+		of_property_read_u32(ep, "bus-width", &bus_width);
+		of_node_put(ep);
+	}
+
+	switch (bus_width) {
+	case 16:
+		mxsfb->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
+		break;
+	case 18:
+		mxsfb->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
+		break;
+	case 24:
+		mxsfb->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	}
+
 	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index d160d921b25f..bdc47ce5be79 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -46,6 +46,8 @@ struct mxsfb_drm_private {
 	struct drm_connector		*connector;
 	struct drm_bridge		*bridge;
 
+	u32				bus_format;
+
 	bool				crc_active;
 };
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index d8ebebc5314b..1d78c486d147 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -386,6 +386,18 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (!bus_format)
 		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
+	/*
+	 * Prefer the bus format derived from the OF graph endpoint "bus-width"
+	 * property when available. Otherwise, use the bus format reported by
+	 * the downstream bridge or panel.
+	 *
+	 * This supports mismatched display and interface bus widths, such as
+	 * a 24-bit panel connected through an 18-bit interface or an 18-bit
+	 * panel connected through a 24-bit interface.
+	 */
+	if (mxsfb->bus_format)
+		bus_format = mxsfb->bus_format;
+
 	mxsfb_crtc_mode_set_nofb(mxsfb, bridge_state, bus_format);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
-- 
2.47.3


