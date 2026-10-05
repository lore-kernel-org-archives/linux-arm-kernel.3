Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A342ECA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 00:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtEtsbpRHA9G7bWdNj7DDptncmLtU6r7+aRERSU/0MU=; b=yFNmag9SNTrxLZa+t67rGOvJJa
	VnlQucj0YZKgThXh6yk6IK9SBehmmrCIho15WCKavHI0JtAXCDWz1UwL+oY1X21mgner79pi7KTUO
	poE5i7CwbrzD+Xv3PDnX1Mm3bni+MFu60RZ9HFuSukDo3FP7vS1efphMl2DXh95raw0zs7a4NZwXk
	ljGTFarKpRxC7QpvYlVVZ6hVXe/3wPpu1eUbx0dLwp4lBR3uaJrAjkMNmL5Kby7eVFTiImojSVTjb
	wCumYNPb8kfYl8cPwBp/vP5cPI9/U3fkdmV/Ol0xVevWqM8oE5qIFHSKgryRWZfbpQyb574A8GuSX
	pVoa1Wug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDWjZ-0000000FWRS-17hv;
	Mon, 05 Oct 2026 00:39:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDWjH-0000000FVyO-2R65;
	Mon, 05 Oct 2026 00:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791160733;
	bh=J2id52QhgWo1E1P95MlPV/yTzEnlNrvgDE2c5comEmM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XsdC87PVNKFeE0XbYdrPikFpYyIh/TWSsEpvBhBCvKpwgNk3A+eSrWnaMVuTL1lx9
	 5MvOIu6mETAm+uzwmNyWVsXkndJs+bps4WM/Dlh2MZcmiKem1LyyC3/pnr+L50t0hn
	 yGpkrZ6AI/I/vR6230ByuCjsnhkKdMo5c//j7ZB9FXhgUGR1/Q97F492gGmnrYLqCI
	 fBLS+X2bYHrLE7j1W6RDb8yxtfQpNd4+1Y30v9HLEE7DRuOohBxAPZJ+If3aQhBnY3
	 ENqyLVfFhCQD1UtVStJRBs/CjaCGJ+UbXbDE14W0rG+FNBpItatK6+6HEP8K5XZ7i6
	 HCVxPqZOIsRgQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 366D917E12E5;
	Mon, 05 Oct 2026 02:38:53 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 05 Oct 2026 03:38:12 +0300
Subject: [PATCH v12 11/16] drm/rockchip: dw_hdmi_qp: Mask RK3576 HPD IRQ in
 io_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-dw-hdmi-qp-scramb-v12-11-195157ba0b40@collabora.com>
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
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_173855_784406_1EB4BE43 
X-CRM114-Status: UNSURE (   9.40  )
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

Start with HPD masked, matching RK3588, so the bridge framework controls
when interrupts are armed via hpd_enable().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index dff400233154..bcfa6646546e 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -432,7 +432,7 @@ static void dw_hdmi_qp_rk3576_io_init(struct rockchip_hdmi_qp *hdmi)
 
 	regmap_write(hdmi->vo_regmap, RK3576_VO0_GRF_SOC_CON14, val);
 
-	val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 0);
+	val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 1);
 	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
 }
 

-- 
2.55.0


