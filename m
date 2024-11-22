Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EE5E65D0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 00:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+2GniAkdmp4BwJcsCVeiFyEwNMIk2x1tb1O8W07KrE=; b=v2A1lFKl/LBT/NZ0o3iuIGoJ2E
	XbLrjAK78046iIwGw6MTU2/aISdAM4Ss78Au2s2s4R9R652msAvswwOnj/WzyONfvdM28k1BiczvG
	DGWXQz8cpm3qRpeTGHChYP7Q8LiFbXdNluak3CnnHNPwLw3Q56siKW/tHgKW3Sm8OCHcFr2xEbsSA
	zwTSmyKbPz29aeJFeWfEVIMkSkElts8CeQ96fROXj+hY3fwjzfTV3IsfFDNmb2JBwcwrDP46Mu6AX
	vDClHVkzi7pBvgNBTiqj/ZGf4RbZYDTf3e4ONlWH5nR0Frb99y67hSXSa8hTrMrsP5roQTSzvYNNN
	vBu/967Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEHxM-00000001HUl-1OZ4;
	Fri, 22 Nov 2024 00:55:32 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEHq3-00000001G8f-3a3R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 00:48:03 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2fb5740a03bso17642621fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 16:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732236478; x=1732841278; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+2GniAkdmp4BwJcsCVeiFyEwNMIk2x1tb1O8W07KrE=;
        b=uDn/9XgqQ8aCNz85uLvMn59i1oDOauIKltAtA261uKo2fnJCC7GjEw/KGEXP4evArK
         DLqHtatOQcqkS/MNEvbqNac+kHDDK3wzKA70oGEy158pIwOjuViBpFVQ1Fbco8KDPLL1
         aonUlpnU7QWvLXHzxoXW7dLF16oCS7VrOONGJHUPkPHs985Sfn0aPOQt3zumcg59+x7D
         V2fXvY5XRo1MZTltjmlG2LIq1cAkafu983V4sCG5DPdgepGvSed8/5sSTPTJoIpMaMV/
         OYQLUY4NELvdKR5CynENvWJS5aJ0lIYfyBB3qkQT2ALsxZ/kZOsoa3VmWgUOAiDGsUwy
         KUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732236478; x=1732841278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+2GniAkdmp4BwJcsCVeiFyEwNMIk2x1tb1O8W07KrE=;
        b=cmsZq7pkyb+rirFRnnVNjWcHK1wAPWDXPhK1fqDeLyh1HTuyjmITYa8Wyvue7GEVsk
         fVhBsHpbGtwBLellOba3wwd0c+GCodY2AASijXxOOwFIi2omUfzWwpojxpRTaOOwb34n
         1Kb0NkaZFSzYK86rHLx0hT+QKostocO0gCAuIcyhAeenkEQWkytelYAmCr7EbD5z4Rrv
         G+zvQorIij0hEJqGS/Mv/09GPqFn5f+H3x/RWYR00wiPQvmviW55F/sZ9AoB+ldv1RoT
         dtxlYuB9Tk2ui35hE/HrlbdQ6XrcNZihgL+LF2ObmZOBboDJpPh6CYNfIjjJPgGoazUT
         gNtw==
X-Forwarded-Encrypted: i=1; AJvYcCX2LT2szKBCI/wdbbd+h3tEN2QZvxzbaSDtAkLh/WKItN/KbsAJo/0jNRV2pl7f18NCNHcA5QnZlSj9gyg26PZF@lists.infradead.org
X-Gm-Message-State: AOJu0YzYKN4t9t8iS0LBPfWvfkMgczc5M+Bj1k93KtBxCZ+DJ20DSz6x
	e/CoRhL+wA1SovKI4JMmScJkbYxI0pzSw3RYXAq5tCQ9kBMZGY3/jFcqn0igcls=
X-Gm-Gg: ASbGncvAzoSdfos4CtfyVduXWZhc+6f2uPTiBaDJHJ2rWovs1mZxE9UYXD/9do6364z
	XQBC2h+FgbSUc54CYBT3noSl1ixlXdfrkYcB1SzAW5M2fvW8nuJWhOZDsS5kAQVVc9YDyLCWcFc
	RtLaeXjMsTyr0I3LtF3Jl0MaTqqBQDJQM7c8yHR8Yzh4g9yJY2QWLJLA5puXuvh2LFAiaw/onxS
	a/1ZKl7UvXtey0c0YUFIraVZ97cpi8ceYDLy+LjiTAQAXOW0WXfp4Ifxw==
X-Google-Smtp-Source: AGHT+IHaHNlUP8086xz3tRzLnaul8Avo5PbX/8+kDiLnQ5OGtpX084LsUh/kakZmuNiZbNZCIacxWw==
X-Received: by 2002:a2e:a58d:0:b0:2fa:d978:a6a2 with SMTP id 38308e7fff4ca-2ffa716cecamr3853321fa.27.1732236478310;
        Thu, 21 Nov 2024 16:47:58 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa5375caesm1083071fa.85.2024.11.21.16.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 16:47:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 02:47:37 +0200
Subject: [PATCH v4 7/7] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_update_edid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-drm-bridge-hdmi-connector-v4-7-b4d69d6e3bd9@linaro.org>
References: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
In-Reply-To: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
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
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4107;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yRmYAaGG5FuJnzbiAwK+r8Wa4ofx1aRyHEGe3Ks/gxw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnP9SpVDpn/N8z6K6hlLcRgonLl5v1k8kXcTVuO
 Og+AMEkfmSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZz/UqQAKCRCLPIo+Aiko
 1dLPB/wLm/x1f8KlUeomrCfmp3UZ6g0DI5BUacJw80/8n2QLtYdBuGeBGuVq2z7lkL3AHGUhaHY
 gZn/7tubJGIZ3vjMeKLSgs49f7JxTUS6dJBGNbBYpupT5L25MoRX3pe9lCr+eDE/wpGoALXBcmE
 PYfPqUfPhHmNEOGYcD1oL742/t4WqmXtKa1ni1Hv+otodOq367Sfr44Xyqic+u1VV5eN4WWqpoU
 LtUDOu58YxNAOkrtyEGmrV/bbh6D4P9e6DioI4eij6CMhhiLhAp29UjK/+78DvZ3TgpR5uqrrOb
 ERZMg7fJCawdHkXiMo8nIfO8uK5pR0cgN6c6V904Ac5pSqFu
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_164759_907414_064ED1AA 
X-CRM114-Status: GOOD (  18.37  )
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
 drivers/gpu/drm/display/drm_bridge_connector.c | 67 ++++++++++++++++++++------
 1 file changed, 53 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 12ab9f14cc8a8672478ae2804c9a68d766d88ea5..71ae3b2c9049016d1cc0d39a787f6461633efd53 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -175,17 +176,55 @@ static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
  * Bridge Connector Functions
  */
 
+static const struct drm_edid *
+drm_bridge_connector_read_edid(struct drm_connector *connector,
+			       enum drm_connector_status status)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	const struct drm_edid *drm_edid;
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_edid;
+	if (!bridge)
+		return NULL;
+
+	if (status != connector_status_connected)
+		return NULL;
+
+	drm_edid = drm_bridge_edid_read(bridge, connector);
+	if (!drm_edid_valid(drm_edid)) {
+		drm_edid_free(drm_edid);
+		return NULL;
+	}
+
+	return drm_edid;
+}
+
 static enum drm_connector_status
 drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 
 	if (detect) {
 		status = detect->funcs->detect(detect);
 
+		if (hdmi) {
+			const struct drm_edid *drm_edid;
+			int ret;
+
+			drm_edid = drm_bridge_connector_read_edid(connector, status);
+			ret = drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
+			if (ret)
+				drm_warn(connector->dev, "updating EDID failed with %d\n", ret);
+
+			drm_edid_free(drm_edid);
+		}
+
 		drm_bridge_connector_hpd_notify(connector, status);
 	} else {
 		switch (connector->connector_type) {
@@ -246,29 +285,29 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
 					       struct drm_bridge *bridge)
 {
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 	const struct drm_edid *drm_edid;
-	int n;
 
 	status = drm_bridge_connector_detect(connector, false);
 	if (status != connector_status_connected)
-		goto no_edid;
+		return 0;
 
-	drm_edid = drm_bridge_edid_read(bridge, connector);
-	if (!drm_edid_valid(drm_edid)) {
+	/* In HDMI setup the EDID has been read and handled as a part of .detect() */
+	if (!hdmi) {
+		drm_edid = drm_bridge_connector_read_edid(connector, status);
+		if (!drm_edid) {
+			drm_edid_connector_update(connector, NULL);
+			return 0;
+		}
+
+		drm_edid_connector_update(connector, drm_edid);
 		drm_edid_free(drm_edid);
-		goto no_edid;
 	}
 
-	drm_edid_connector_update(connector, drm_edid);
-	n = drm_edid_connector_add_modes(connector);
-
-	drm_edid_free(drm_edid);
-	return n;
-
-no_edid:
-	drm_edid_connector_update(connector, NULL);
-	return 0;
+	return drm_edid_connector_add_modes(connector);
 }
 
 static int drm_bridge_connector_get_modes(struct drm_connector *connector)

-- 
2.39.5


