Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7969DCD98E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 18:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xu9WkiwcJx74VNGFy9hCMDBETWkmSM+OqdfzDZin+j0=; b=mucZTji3KsCTBEYFQ/BwR+s82P
	HXklD9t4v9MidO4NGIahJiUpVoLBWvcNyEWth1kXllfZTpVnUegjaOPXB7VyW7YcMyN3n9JBA8q73
	XPpK6KnCFGhXPbJbhmvjRrUg9ciw6SoYCeue9FVJC6Q8t/f5PL693DFv3S7CYcSGeIoY8cezPd9VD
	uT1MPlq5rqzoSvb627JAoFG1PKeqt4VnhQAYDvHkZavzq3i6TS7uDQOqzrFJ5V0uOVDpxBppkpJHW
	nSImu4w+M4BuvK2+FsxJOqEaY+xV7y+eY0rc3N3qNzxiuksocEulhYkBQuZbyZeK04qQiAISsmuWc
	4eBRvbbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY6Bn-0000000BNJp-1COj;
	Fri, 12 Jun 2026 18:01:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY6Bc-0000000BNBH-0FXS;
	Fri, 12 Jun 2026 18:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781287252;
	bh=WsmeQvQGeyq2M87UoeoKm+GR3W7WQx6cpiY0EC6vOZA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A9EH7Yv6Nl2PNMowcJr6lTBfy6JU/s51xkh2vXnO5P+wNTjNFA1iyGIV7dzIkGyV2
	 l+5a55vKE/ecjjoBlZRKdAHEVI6hKtfbwFXzdB+9gzNoPJBdP39/Jpp4hQI/AN6iEx
	 Qsg7ePdR75pks0xQKHR+mpmzhoSuVpAatKu1NXslKCbZ/LJy3lwgh9+oW6qyDp/jGR
	 IM38i7FJBR5hTkrqZum0V7dCNn7YLqSFv60DGy37X00CoWAYw7vEKN/3FXLTWR1dky
	 IGq3XXg1nHrDs5UymY9Q2mNxOow8YFIa0FEelpU6V4grenBKrs/IdfZs1CJfiIDibl
	 sTyJrYkil7VmQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B62CF17E03C6;
	Fri, 12 Jun 2026 20:00:52 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 78DC4480026; Fri, 12 Jun 2026 20:00:52 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 20:00:47 +0200
Subject: [PATCH v3 01/10] drm/bridge: synopsys: dw-dp: Simplify driver data
 setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-synopsys-dw-dp-improvements-v3-1-dc61e6352508@collabora.com>
References: <20260612-synopsys-dw-dp-improvements-v3-0-dc61e6352508@collabora.com>
In-Reply-To: <20260612-synopsys-dw-dp-improvements-v3-0-dc61e6352508@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=WsmeQvQGeyq2M87UoeoKm+GR3W7WQx6cpiY0EC6vOZA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosSVStviUCLo5za77nTAKT2U13SAsC3EanA
 N5gu1xsmRuaFIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLElUAAoJENju1/PI
 O/qar7AP/0p6E6UzqtGJPOsR5dk62A0zuNQL99x3zENNUW/nku7BjS+u38Y9Gq517FDFvLcKK2J
 dXn0p114bvNl8+Otw3z3cmhOgVz6iz05jmwi0fzskXRjp0Bz3rGPbAZMX+qIp+9Zqh+jdDJ0Gv7
 dZ/CH4Nb13A9XGy/OUlow9T2fwDy3k5Ems6/p8DOIjtRinTebqoYkk4+RkA+mDRqeQdYV6f/gNC
 26oaFRUB7ULrSyWxsMBbr8AeFpduRjlmsGab7wD2BsPw+nrcEC9p25bSY43jA9Exx7KB6WbSw/n
 Usnl9hHFWK5aCPPV1DXqkLh7B5A1+SvX4kO78fmmmHtR92UqRSL8HAQzJUxLp58oXA0Oo3MDFSn
 P1+wfwmL/DdZYO/qmnnV1uy7N46rbt1nY+zfiXMweh8XnATi5SE7yQuS7QuZufKdBOO4OR2MeAP
 QMXV352wILWNw856ThPKbi7wv4xo18cZxZx9In/xVU5dcufTCvusP6LVUUpN988TY6Nm5ftKNGs
 J17t5niqT9KHWLAMkv2cETQIvR5XlckJ6CoVgyZZmgba6bI7fJpoFG9szRmD/4ux73Q1YsHGAZj
 vhZAK8dejMz8G5gJi9JFfPwZwSKd3/utBbzySrejfyzeaCKBBHfUtjFbryv1W37Boqni/QwudGf
 SQSZtSZS6nX3tVI+vDCsxnQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_110056_254010_0D573072 
X-CRM114-Status: GOOD (  13.27  )
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

There is no need to get the platform device just for setting up
the driver data. Simplify the logic.

Reviewed-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 0de822360c8d..35598ab9fe84 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -74,7 +74,6 @@ static const struct drm_encoder_helper_funcs dw_dp_encoder_helper_funcs = {
 
 static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
 	const struct dw_dp_plat_data *plat_data;
 	struct drm_device *drm_dev = data;
 	struct rockchip_dw_dp *dp;
@@ -87,7 +86,7 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 		return -ENOMEM;
 
 	dp->dev = dev;
-	platform_set_drvdata(pdev, dp);
+	dev_set_drvdata(dev, dp);
 
 	plat_data = of_device_get_match_data(dev);
 	if (!plat_data)

-- 
2.53.0


