Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D377C44532
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpCofNp/CBsZuz88x/If3XsRr3m1kUcaQiaEX8i/KGw=; b=4ux/Z8rN59Gb5fqCOcJxEt32D2
	RWkUlaVXxe1A6kyhpXYyQRnXpSIA1eD3hZyeB0EroAhIV6q3DZyDSyNbel0RHySZtWvaxVjyz5Oii
	H8hjcwEjqcSkZGt3oM34z2zAtuRH2dVZJvuEBfnG7z4Tv1Vs8jJB/dBFnx0t8xOqSXo1okpNJA/+Q
	xt3WVDqak1RYuEueJBQAsjp8R7nC55SGWjuv7E13pm/b2Ikcg3IpRf/uV2f+PY0iAaYndRnj/Oo3s
	AQsZRew/S/PdLekRB9dwcfYBRdkRjMPnGt8idYmj10q+8kZAvewUIE7jTOqRNIBX6+ggFMeX6QQiH
	rTjzcx7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiMt-0000000D5Ys-20Pe;
	Thu, 23 Jul 2026 01:36:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLK-0000000D33w-3oYz;
	Thu, 23 Jul 2026 01:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770521;
	bh=wWLl8695JDs0BsUy84dPLaWbC2/ie2tOUX4OkJkjWNI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ivz3i2YEDNObGW3Y7mLk6whYaaQ1iaR+PPd8OMDECjR7LNAUwLJ12XBoYXALxohfs
	 eO4P0IChzTDWt/k9c0p8RgbeD3IJFxZFjJJKxYyPlpe12uG0DLothaEi7193I64+34
	 2fDAe3QSk09CPPZD9W/WM8+2wVH/OSAQrPs4PDGJlvOebHIKgueIZJXT0LRrcTActf
	 I1N6DcA0JCm+cgTLE9wQLoa/nCu42G/lh2w7s0EWlGt8vv2K40WtEjoO6QSiUa2253
	 zm/7SknOEC8SbxTVyfqQ69BV2gfOfBd/YRrlk1/T1nEO5RRP80H+CezqJ9tnAlTCZJ
	 9B7Yv8YUt7agg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DE2DC17E1313;
	Thu, 23 Jul 2026 03:35:20 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:16 +0300
Subject: [PATCH v9 27/61] drm/rockchip: dw_hdmi_qp: Avoid spurious HPD IRQ
 thread wakeups
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-27-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_183523_104648_4EC8D4AD 
X-CRM114-Status: GOOD (  12.20  )
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

The RK3576 and RK3588 HPD hardirq handlers read shared status registers
and currently wake the threaded handler whenever any bit in those
registers is set.  This can wake the HDMI IRQ thread for unrelated
status bits, and on RK3588 can also wake the thread for the other HDMI
port.

Mask the status value with the SoC-specific HPD interrupt bit before
deciding whether to wake the threaded handler.  On RK3588, select the
HDMI0 or HDMI1 HPD bit according to the instance port id.

No stable backport is needed.  The issue may only cause spurious IRQ
thread wakeups and does not cause functional breakage.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260702151346.5A4EC1F000E9@smtp.kernel.org/
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 2aceff11d14b..7e3e86d05611 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -34,6 +34,7 @@
 
 #define RK3576_IOC_HDMI_HPD_STATUS	0xa440
 #define RK3576_HDMI_LEVEL_INT		BIT(3)
+#define RK3576_HDMI_OHPD_INT		BIT(4)
 
 #define RK3576_VO0_GRF_SOC_CON1		0x0004
 #define RK3576_HDMI_FRL_MOD		BIT(0)
@@ -64,7 +65,9 @@
 #define RK3588_HPD_HDMI1_IO_EN_MASK	BIT(13)
 #define RK3588_GRF_SOC_STATUS1		0x0384
 #define RK3588_HDMI0_LEVEL_INT		BIT(16)
+#define RK3588_HDMI0_OHPD_INT		BIT(17)
 #define RK3588_HDMI1_LEVEL_INT		BIT(24)
+#define RK3588_HDMI1_OHPD_INT		BIT(25)
 #define RK3588_GRF_VO1_CON3		0x000c
 #define RK3588_GRF_VO1_CON6		0x0018
 #define RK3588_COLOR_DEPTH_MASK		GENMASK(7, 4)
@@ -348,7 +351,7 @@ static irqreturn_t dw_hdmi_qp_rk3576_hardirq(int irq, void *dev_id)
 	u32 intr_stat, val;
 
 	regmap_read(hdmi->regmap, RK3576_IOC_HDMI_HPD_STATUS, &intr_stat);
-	if (intr_stat) {
+	if (intr_stat & RK3576_HDMI_OHPD_INT) {
 		val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 1);
 
 		regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
@@ -381,6 +384,8 @@ static irqreturn_t dw_hdmi_qp_rk3588_hardirq(int irq, void *dev_id)
 
 	regmap_read(hdmi->regmap, RK3588_GRF_SOC_STATUS1, &intr_stat);
 
+	intr_stat &= hdmi->port_id ? RK3588_HDMI1_OHPD_INT : RK3588_HDMI0_OHPD_INT;
+
 	if (intr_stat) {
 		if (hdmi->port_id)
 			val = FIELD_PREP_WM16(RK3588_HDMI1_HPD_INT_MSK, 1);

-- 
2.55.0


