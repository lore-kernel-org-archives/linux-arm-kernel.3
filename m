Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC587FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 00:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHwvceoUtgle8+9cU08BTY8JuU8KndwwM9OZKP/MLbA=; b=1nucq5m/rOysWLgsiOCO7spq3J
	yiiJBztP/IF/GB8fXBtaVoSQhNy5R5yzYI/3nFH9nMBfd/XfKdKQ4jH3Bj0dfKDAh1XgGq06uALOV
	btExQ37OcyXihUTltiKcpqKIbvKLt4SirOuEwe5+aDyzPIih1cxPGc+TGzyY6YR1XQbz2R9XhqpLm
	GnhquC0CitOIFeF4lbPJN8PiSrnhzDRTfT+sS4L4oDHyQJlDyPZz1Ww81vY9AlPJgIt3kxUAQc5Il
	ZdhS/znkzjcLPvSp47VJYbEPCd6kOOIAqUcYZ04sIHrejrSeXUqIs7ijzl42v6iR6kNMD5321vsox
	OmR0ELzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGnEt-0000000F6xx-0xre;
	Sun, 26 Apr 2026 00:20:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGnEi-0000000F6jG-2geu;
	Sun, 26 Apr 2026 00:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777162834;
	bh=5kASBU3GsBMjHatuU+YV504wwp/sbOi2o2abJZ2QQFg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jKlv9Stqk0OdTwliz5rWrHZoLU3pxCb3Go4sOlAgQ+wJtp6WfuztMJ/surqtjU1t8
	 RDwRF+hXGjv7P4bTjWV1tM0fGiwpz+oB7k7vDaRNVyzIr2Q+NcIGus/9iUX1KJCTah
	 8dKY+0jl8jyRPXiQEaAASjhiZ2P3ofzVp3AI0JGYWysY+k6vtsIVgxhuiviJLVxCOv
	 gxKXt6wwXjVe8r6WheKyZ883Hzni71KuGRuO2f8hTUWpW9TGm8agXxNQ6iQFgqUgkX
	 W3w6JzL68GBp3mkuJcwjpw4PLJ4l7VUyCV3kjSi9APoPGre3tPJG94uo2KR7jNUSpu
	 E76Gc0YQKdT2w==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CEDB17E1582;
	Sun, 26 Apr 2026 02:20:34 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 26 Apr 2026 03:20:21 +0300
Subject: [PATCH v5 09/10] drm/rockchip: dw_hdmi_qp: Register HPD IRQ after
 connector setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-dw-hdmi-qp-scramb-v5-9-d778e70c317b@collabora.com>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
In-Reply-To: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_172036_881123_9AC69EE2 
X-CRM114-Status: UNSURE (   9.75  )
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

Move devm_request_threaded_irq() to the end of bind(), after
drm_bridge_connector_init() and drm_connector_attach_encoder(), to
ensure all DRM resources are ready before HPD interrupts can fire.

While at it, add error handling for drm_connector_attach_encoder().

Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 618d2aaa5c7d..fbbe26f8730c 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -577,14 +577,6 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_threaded_irq(dev, irq,
-					cfg->ctrl_ops->hardirq_callback,
-					cfg->ctrl_ops->irq_callback,
-					IRQF_SHARED, "dw-hdmi-qp-hpd",
-					hdmi);
-	if (ret)
-		return ret;
-
 	drm_encoder_helper_add(encoder, &dw_hdmi_qp_rockchip_encoder_helper_funcs);
 	ret = drmm_encoder_init(drm, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
@@ -602,7 +594,15 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return dev_err_probe(dev, PTR_ERR(connector),
 				     "Failed to init bridge connector\n");
 
-	return drm_connector_attach_encoder(connector, encoder);
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to attach connector\n");
+
+	return devm_request_threaded_irq(dev, irq,
+					 cfg->ctrl_ops->hardirq_callback,
+					 cfg->ctrl_ops->irq_callback,
+					 IRQF_SHARED, "dw-hdmi-qp-hpd",
+					 hdmi);
 }
 
 static void dw_hdmi_qp_rockchip_unbind(struct device *dev,

-- 
2.53.0


