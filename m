Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DCBE77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unYAkXaFAf42yLsiWl79k+U7AAWsXSetaGBwV9Nyen4=; b=u63iUwD41X+TSv0vm6oTXvl2hg
	hjJMmsstGlYjvnxeNoAaG/Fn0lGp27KR4a+jdbiO+VNJy/dDBlSYlDjFUqkH/DcPOUavkrzfXipgm
	mKVU66F8179tRwXbetx68HDDM1FTs1L8muE0L3xjCoeQCuxcCVXlouNbf/i3iUeap6ykK2IlBj3QG
	wInAmujkRVGWZg73HATNoSxgMH6tDpsPB19gze/8hJwTT6RG3ZUZb/7VIkscOLnh9cdKQenEPvctb
	Za2PA5qY3ICOF9DwPcBLMuokQbQOD/jSZUQC/G2KLrSYWzuQKzv+Y030yshFvo/94yCXA6j6juCO0
	szxB++8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVjJ-00000001KQc-3L5P;
	Fri, 06 Dec 2024 10:38:37 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVOO-00000001EPV-3ENy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 10:17:02 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53e3778bffdso220588e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 02:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733480219; x=1734085019; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unYAkXaFAf42yLsiWl79k+U7AAWsXSetaGBwV9Nyen4=;
        b=noVhEEnvOkOoBiSVo9Q7WIXxxh4F+nBMupnQX0gEwj4QcjVGEe0GAFSv1xVot6LV2X
         aDy1nkrkJvHX/6GLWlyovMoDQ7E1m4Q8bCmoxDbCFuevkfdiPXCW1t+lWIapm5tb7YvN
         X5Ki1YnRWvQOsroA0BWtZ345S1bGqMFntHFCFrtm0XVvvDcC/hCWaE7cMvewojrH6xu9
         KzyY2p0Qr2ap0SRmREnJ4Ltc4IXsAdpn+VVZ6bgw/2anFpUiq17QUTwVuzkjQHUa539z
         2sGKC+l2n/WY9L8HqbMDoDUx3Gxgv6CzsMyn3W88EWiWAsUV37rb9Fc4/rgWON5JpqLt
         EGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733480219; x=1734085019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unYAkXaFAf42yLsiWl79k+U7AAWsXSetaGBwV9Nyen4=;
        b=jjsFEKsQjEitQParxirQtTyMDqTMidpgN33BPtvmihLRPlziVl5bKB6RqX8SeiSJaZ
         dTZkKvcLAvdGAHxT7GBfmlUFEMV0Nlu7Tn8HwNZbXVTl33GT2k2yRSCe4vctYYt3GXps
         iq1L+CaTAFMCN8vg9A9mlF96j6+3N88GvCoKCAvv9YKBYIMJ02Ol/6cOStMiRqR90/up
         oKkEsdy4OGWmPANOjAW/BG5tZDW1jmnERXZqIAqAedFHi7DtzeGr8ltu0zu+qcnejAee
         2jx660Z7tJ4YwQemH5hszdzpptswZzJiEY+F7Zfui/67656bPgY8FcJAWZV7dz38jWv5
         hWaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvUx6VcuS0DYoAy1E6uMqUkPYaFSdcoXi40JtYMIKPQDYKDw80LFdf3oTAF33Bsk9xggmX7190Cu2ecHpCjhCO@lists.infradead.org
X-Gm-Message-State: AOJu0YzMq3QcXMFV6WFOtpau6lJv0wlSWScwcfzbCAi8gKH8EIcB3YPG
	H8JfUb1YrX0xukpBV58nDijz1Lbh3cSqyeAD3Ka4MmZe2YKzzU7cXPKNuHcVQck=
X-Gm-Gg: ASbGncsHZpqKE0QC4BsH0cWHX/HeGcIxmlsQUTWoTrSdqPxRNLxY2J1hfVUXKO8AxrQ
	Ie1LlvNSymTU5HXHk34VIzTnuh5Ayk1TISrIwQm3Ruel+ocGZiPpkpJn06UcgVtnVApwIv+CsPc
	nMEbPRYTfzBwLVpSUJ+WA7df5L5RHGVobQq/6UP79snqhL+xt8UHh709KhHY5Rz5X1QOp71koZ+
	KVpltWrVWUxD/w1I5bvI6B9hrGx6sqcKpF9AYlLN3tK5mQRAodzjf1C5Q==
X-Google-Smtp-Source: AGHT+IH8kc6+cltsERv2tTI87w9RpzrI/Uxd36n75mjO1x7LsaWpJdqUf3dwGEmcu3AmNY3dvipvnQ==
X-Received: by 2002:a05:6512:3c82:b0:53e:1bb7:588b with SMTP id 2adb3069b0e04-53e2c303797mr785196e87.44.1733480219213;
        Fri, 06 Dec 2024 02:16:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:16:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:16:01 +0200
Subject: [PATCH v6 07/10] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_hotplug_edid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-7-50dc145a9c06@linaro.org>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
In-Reply-To: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2587;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mWpkFqjp1yyO8iD77i9han60egAD/evnvMAnr5hrOdc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8JXoJleVeXT84oS2M6AvDZrSRqHGCIJXg/5
 lKSomHX+x6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCQAKCRCLPIo+Aiko
 1f/YB/41OkBVU1XNEzkbG3DFY23S7DFi6wn2p8ZEfwQDqQLsyhZyNih+ddfBVpgTUXQvmrBZq8m
 jEoBlwO6SyUFPTywjLRGEna/tCKshIaqoAP8bnj8L6rSMqfhmrLqUH66F7UYeIjwGGE0uE2JGRy
 f+WlCpQUacATeokiK7MFZVVHK4lACJtBnqABGrh1qEuBurO2OPyoDaHl8qncLNKcFYORUqQGUDF
 5v7R06MJ22XXDshojT4piLRisvT1R3QxDA5xO6/+mZScp0e6U306TQvzKyV0Z034+8I07KtdgIZ
 lmUAoiLMZF2w/xvIwsLBKtV6o/962J/nSm2NMiY85RFQDbNh
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_021700_863223_7A8E3D6F 
X-CRM114-Status: GOOD (  16.76  )
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

Extend drm_bridge_connector code to read the EDID and use it to update
connector status if the bridge chain implements HDMI bridge. Performing
it from the generic location minimizes individual bridge's code and
enforces standard behaviour from all corresponding drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 4fa1bb73d430d02d5b79a1a184c203ec9e9c66e7..0ff82900bd07933e292948446b9637ebf2076694 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
@@ -182,11 +183,29 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 
 	if (detect) {
 		status = detect->funcs->detect(detect);
 
+		if (hdmi) {
+			const struct drm_edid *drm_edid;
+			struct drm_bridge *bridge;
+			int ret;
+
+			bridge = bridge_connector->bridge_edid;
+			if (!bridge)
+				return status;
+
+			drm_edid = drm_bridge_edid_read(bridge, connector);
+			ret = drm_atomic_helper_connector_hdmi_hotplug_edid(connector, status, drm_edid);
+			if (ret)
+				drm_warn(connector->dev, "updating EDID failed with %d\n", ret);
+
+			drm_edid_free(drm_edid);
+		}
+
 		drm_bridge_connector_hpd_notify(connector, status);
 	} else {
 		switch (connector->connector_type) {
@@ -278,6 +297,14 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
+	/*
+	 * If there is a HDMI bridge, EDID has been updated as a part of
+	 * the .detect(). Just update the modes here.
+	 */
+	bridge = bridge_connector->bridge_hdmi;
+	if (bridge)
+		return drm_edid_connector_add_modes(connector);
+
 	/*
 	 * If display exposes EDID, then we parse that in the normal way to
 	 * build table of supported modes.

-- 
2.39.5


