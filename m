Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F61E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 02:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nJs58cbfMJKQeVAGp0JHG5pyuxuSDegdZpDL4/kDow=; b=2sy9dagxEQg9ta6aeAZKIiMIqA
	kNW63jgkbtu6t5a27njGSPA8ZYA0Y3CapPStZhKRp5KxP5l15ezbsHQKI4+v98QAP05IKPIq1NOFU
	naj+m0zjRPBPr+0p8527JoagKj83OwWlyMrh6FUkElQLlNE7OaT1ItU6to3UTko/Vb5lCO3TezmV8
	jXIilgiF9aOejOAb9mTV054IyFF3oCb3EUQbOYCKLR80fDiDHbfuOPsNyMnN0A4qUVS6KBerTo7BI
	LFKBJdKTqvF6Mlw9paG+hQuhK7+Ed+LE4xJ+wUERvX7RfZb4Jh+lR1EBx6oYVrQBdSBFPYG1tilpu
	+6jJ8B1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPuGI-0000000B3t4-0mHR;
	Tue, 24 Dec 2024 02:03:06 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPu24-0000000B1bb-1DwB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 01:48:25 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53e3778bffdso5267256e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 17:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004903; x=1735609703; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nJs58cbfMJKQeVAGp0JHG5pyuxuSDegdZpDL4/kDow=;
        b=oEEUXMw7+ZXbQJbMEDaF76/g+0SMt0K8n0p0QhPNz1HJULw0Vb6AWVFtH5iR9eYmYI
         lJJ6KrtuE43jrNg8rTHEFCzTayPENPhEaLG+wHsL74SLAX59CTRcrPH9a+Lc/p5JlcTC
         +g4IYKIRMHDsIoJ9JyCkAfXdiBmJBHWHCDtvWxAvFleIeI0SRJy8J8Z41yTUf6rIjKq0
         fbA4jm04s3GgVU7JRQ3WCsMYf6UJZ0EfT7rjxo6YTNeXC9u86VegYw8hPOH4DTZhkCc1
         NxnvUBz70rMLCdTrlU1vDoXFeoiZC8+3S/arnRfq8801VkBJrhq4vibMW/TOB2r0Wp6R
         zWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004903; x=1735609703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nJs58cbfMJKQeVAGp0JHG5pyuxuSDegdZpDL4/kDow=;
        b=hYEZRF0Ce+zBSfB4MHzk+ywNkOOFSdllQwpAc2yOOrCllqGoYlG2AXH6FNWiLMDdE7
         mwxslDcHL/pUVMsQdRIqBQhENuQ8UjvVWhx045AA1p2rcZZc0L4BF+3uIDxhl76VOPJB
         6yFnQ8xtgywsBtoibODia7guaZOQBoeoJj5Ol0L33MDdOuev/YeEJPIIRZ5N/vzEehGs
         4WkVguBcvpbLiu7tgCEhYVIzbfyEbWztDxbTDzbMHPUFMErFMvPJESTejl2RfyeuHI8n
         jNmZT4q001l00NI5+SjPmzcTsk0K8m3nMXkoyZ2PSScyGNCEUTVqWowteDUAUsdync53
         opUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7aRvwUsxhKf2tfHh7FTLAOQb+hzRdPjTUdUNFprjUMQhkT0XuNYUk2N7abzOBpYhcpe8sxjN4e5gkXBVazB0g@lists.infradead.org
X-Gm-Message-State: AOJu0YxMoDE+K/9TL5FAIGtgJS7BkWHh79y9ogrLZiBo7kb9HizcvqDX
	vtRmuhY/HPcxlwZdi5SPcQx40pqLADfzbSqp8D+JJk0Vw7l/qve3hapScLV3kUs=
X-Gm-Gg: ASbGncvUnEv9RmhtJ5yfcU1YuXcOcUZwQ8XPqNKpH/ixYv+ugOlLHb/SlnSj4MR2gH4
	YAfJ5gVTn1DBbWzYVFOkafY7CfBZ2psvpnhq/JmXR0ZbLjHwDYUe6vFWLYqTELSWNVDTEa6ldIU
	7pKWwNqIy9ZhCtZM+L+nhy9dPa8hVD9Jw2eKhT50cY8l862gcFI5tkfkCsQ/LS0AmTQi2PdTp6j
	bCGdQn1NEXx5H48VAhRIRtVxshOda3xPJW8IXou/ejd9ncdsY0Y9c1kJKBx7O+x
X-Google-Smtp-Source: AGHT+IGF1X6G7LQaBvibMCKszSuu7ITNK8iX9zbONnj+RwH46spk+ukXUmmAo5oN2pulLqrWFQ/iYg==
X-Received: by 2002:a05:6512:4389:b0:542:234b:9a73 with SMTP id 2adb3069b0e04-54229598a1cmr4180618e87.53.1735004902766;
        Mon, 23 Dec 2024 17:48:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:48:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:48:01 +0200
Subject: [PATCH v10 09/10] drm/vc4: hdmi: stop rereading EDID in
 get_modes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-9-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zCYZwtzzF6aS6IU7PuhTpxheZNTVNw5P2rLwr1yXY7A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLNVoVTN9gpByakXsqaMqgbCvYXwFZg0TnPv
 Vd1A7oO3quJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzQAKCRCLPIo+Aiko
 1ZdPCACWQQSlUlGTcJnAD9tRCc+l8nBAsyC3OrLEO47kLEFy7UsLp+ihq3+Auxcd0Rm+V3d0d2d
 pbphQW0o1WCEvjQvBS/M99jDRXN0ypRZWRw9Tqe3gHtJOzG+Ev3+H8mvH+kD3HElVWJyX8XTpjD
 Dho8w5OpEITEKGomImoqLkigYbCxGIqpdSJ4oB6amNx5GWQPef8tIw0qNfgaHTTn91R3dQGLRtx
 0Rqp9zJ0rUMlBufaq9ZGkBM3tt3gdDHMkVKKQn4iWycBqZCq7/MintLJTJd/2+PfzE9T2zHgzCM
 dldF8ODo2w1dg6l47B0korv9Eiyx3XtcUCXKoT00fwDziKW2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_174824_333839_0432684D 
X-CRM114-Status: GOOD (  14.24  )
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

The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
already reads EDID and propagates it to the drm_connector. Stop
rereading EDID as a part of the .get_modes() callback and just update
the list of modes. This matches the behaviour of the i915 driver.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index cc5fdb23f76f4a4730ab9eff9b47f5d1507aac8f..4949171c28876a9145ddf03e99c00feff4df255a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -471,31 +471,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
-	const struct drm_edid *drm_edid;
 	int ret = 0;
 
-	/*
-	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
-	 * results in reentrancy issues since cec_s_phys_addr() might call
-	 * .adap_enable, which leads to that funtion being called with our mutex
-	 * held.
-	 *
-	 * Concurrency isn't an issue at the moment since we don't share
-	 * any state with any of the other frameworks so we can ignore
-	 * the lock for now.
-	 */
-
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
-	drm_edid_connector_update(connector, drm_edid);
-	cec_s_phys_addr(vc4_hdmi->cec_adap,
-			connector->display_info.source_physical_address, false);
-	if (!drm_edid)
-		return 0;
-
 	ret = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
 
 	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20) {
 		struct drm_device *drm = connector->dev;

-- 
2.39.5


