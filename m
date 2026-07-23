Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A649FC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eFptTX/PMVEvciVeEhONSLkS9aIwGTXcS3cNjnrq0g=; b=rW4g6/Jo0i96ByBaYT8Z6fYPCx
	yjRPzDJ/F3CMwsWFmXc4DGGIxU4bhNGGIasD8AYNgJwYEnaE66glmL8xgu2g0X1b2defk1dIhEZ1m
	ajNC3BjOyAGTcED1WNlS57DdAEGJ++EAJy94RXsxbw6pgJ3/gYgyu1e7lZTT5PowHs7QFWatXMaZX
	o0iHx0sGvhhgRA9MIeQ2DZ/KK8cVBxqLp8P3WnZo7vUcH/eJjvtJiXDgQQTIiELrsfx+smrpMTG3P
	fThjXHA8PHGMiTNpSVdk0XvamAmhaKME5yGxGVvaDgJZ4RQ/DsQPaiIBjygmZR4coahgNHLyCk9ca
	W8f9ts/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpt1-0000000DuAn-3PRt;
	Thu, 23 Jul 2026 09:38:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpsu-0000000Du1T-3apC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Jul 2026 09:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9eFptTX/PMVEvciVeEhONSLkS9aIwGTXcS3cNjnrq0g=; b=LH62Z/n0RIsmWvyrouht+bdnyd
	wn9qwj19VmswLOeHwyQ26IUTFUjsZYz/xhiBm/sv/9kDZaFPR0RVGnpQHYM7ycrRhThhQ/4uLgjz/
	RkaEDci4+81BbE8wIoLynUz2zjMS0a30esdcxUPNj2FY2aLhQLgfjCDwT8a6Kw55zTrBK7HbGrhLO
	lzwuzRE3+9bEpn2Lxt+cJIlw85mJS6kyNDTA2QdeHfaQ0UBBYTI+KIw5jgJYrI1vV+WZDgptjedrB
	CTlnZIyoLLxniCApBFtNuSSk9xSzDF8Kxb/GlWhZQ2N5oA1wTHcpvANWcPEwiZ2LPL1CFVER3zBTw
	rM9w0FAA==;
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmpsq-00000001c3l-1xhP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:38:30 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 001181FB7B;
	Thu, 23 Jul 2026 11:38:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784799503;
	bh=9eFptTX/PMVEvciVeEhONSLkS9aIwGTXcS3cNjnrq0g=; h=From:To:Subject;
	b=ATFiBh03lA5JHFY+G2PNx8LfiPAOhMOfngqWlVYl2HxDu1IGQzzHQLhhjcdDQ39cF
	 ovR9Cy6BjmgcP2etiky9ZU/qU41hTF5iysMGTgljoZULQVn4oxwY2uv7yCqsGN/ipL
	 +wpSE+pnEYJcvnuzMO7+WXXlLWJkR56mOZChrC9bG7rT0TYp9c/D6RWdZcYQ+ZpW7O
	 ix8s3QLky/IDZVk/v5BbuEVEzEs/WTiOlH9pVxCum8wBlWbvEFcENkH0AB+DS/hNmk
	 03HP5dxdTag76NqvCg/3S3N3ObA37toY5Agqg9ckRQb/nRn3xSw8Mb1uIFpoi65/EP
	 /Gsr1C4JB/Nig==
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
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] drm: mxsfb: Add optional DPI output bus-width configuration
Date: Thu, 23 Jul 2026 11:38:09 +0200
Message-ID: <20260723093813.180089-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723093813.180089-1-francesco@dolcini.it>
References: <20260723093813.180089-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_103828_729556_9F4BB083 
X-CRM114-Status: GOOD (  18.52  )
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

When the optional property is absent, continue using the format reported
by the downstream display device, preserving the existing behavior.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 12 ++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 9b8fbda85d28..0545718a4b65 100644
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
@@ -209,7 +212,10 @@ static int mxsfb_load(struct drm_device *drm,
 		      const struct mxsfb_devdata *devdata)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
+	struct device_node *np = pdev->dev.of_node;
 	struct mxsfb_drm_private *mxsfb;
+	struct device_node *ep;
+	u32 bus_width = 0;
 	int ret;
 
 	mxsfb = devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
@@ -236,6 +242,24 @@ static int mxsfb_load(struct drm_device *drm,
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


