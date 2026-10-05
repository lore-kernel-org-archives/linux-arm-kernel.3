Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356EDCA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 00:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bq/bI0JivkjLPmMgLmag/L0XOinkNgv2jczA2pOiqzs=; b=zjZcQwz1yENihp3huSxIe8JLI6
	3VFLWI2OwtckkO+1AYnja6nNc4VxudNzyH8E0XpZC1jgo+547OhylUXWuv2+FodcQW2OLbb15hLay
	ON3fzZ/4Wt/5Mz8uBufkZOfzYLeGMMsIoC8UGS6hCdMXXXtWIM2bX4yFtjJcvDuzQryynfXQOD97R
	JfnSS6ZararaPj9CpUuj1MK2DBf/eoPDdy8/aZMOz3s3NNaO1h6iMSHrqgZQSQ28REC72Ms05N8aM
	Ls811807BHhdXvWuUUOVDiSl3sK68pYJPZqmpOweSL84HapSiyJXpKuKRsAXXWPJ/TeblU9UAMbEY
	gPFz45lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDWjZ-0000000FWQr-049L;
	Mon, 05 Oct 2026 00:39:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDWjH-0000000FVy9-2Jfg;
	Mon, 05 Oct 2026 00:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791160732;
	bh=piFUhSsVM6dznBeqHDG8mXOwHyyVgOt/aNawLBe88SU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eaZhnhthgS6/VNZck0EfG7GtyNIfAGW05btR4TsbW9TBaXcX8BDeYEc8BJIjyBCKs
	 bxGCok9u1tYjY/QIKCV5p+1XVpEbN18NejhkG+QgSjrZyYRM/OkOCfCEZLnCEcRIXS
	 I8Rtb/ATqQGFutT8mt5KanrASK0nOAmpJTop4FisGmIi2Q3IghPXvb/Aq3TEyT//nt
	 Nbl2zO3XYvqYBo7oB2OVYRRaSN3Sss1XcXAbzHW629XHbFng8wAFgaHtRck/4ReLPz
	 vmqupu3Y9iN8vehsFIC6lUdO1a0UQv8r4xAOd8ioQdp0/sAEeCMejMY++M98vaY1T8
	 VS38dqAyCKCvg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8268F17E1274;
	Mon, 05 Oct 2026 02:38:52 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 05 Oct 2026 03:38:11 +0300
Subject: [PATCH v12 10/16] drm/rockchip: dw_hdmi_qp: Avoid spurious HPD IRQ
 thread wakeups
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-dw-hdmi-qp-scramb-v12-10-195157ba0b40@collabora.com>
References: <20261005-dw-hdmi-qp-scramb-v12-0-195157ba0b40@collabora.com>
In-Reply-To: <20261005-dw-hdmi-qp-scramb-v12-0-195157ba0b40@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Algea Cao <algea.cao@rock-chips.com>, Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Sashiko <sashiko-bot@kernel.org>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 =?utf-8?q?Robin_R=C3=A4ber?= <robin.raebi@gmail.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_173855_772995_0DB374B5 
X-CRM114-Status: GOOD (  11.68  )
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
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Tested-by: Robin Räber <robin.raebi@gmail.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588 Orange Pi 5 Plus, dual HDMI
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 456bf2f194d7..dff400233154 100644
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


