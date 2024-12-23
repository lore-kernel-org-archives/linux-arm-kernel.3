Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE8CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 03:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=; b=QxP5I/+VfVb7iJIwYhLW2n22Yk
	j4I8J4xO+BkAfzqiwxXxh3jqkARfYkINWKlZEn84iqaS4a7rLnQlLFnatXasqA+53qufTPH0kriWe
	IuAVhq4GzQNTi9agAH6oiTQrMQ4JOOm4DiPUEaCPKt4C0UO9+xgZs5chKgvjkdhJ+SKLqvA4wyXCB
	/UYFEpOTmpzeWSNSFDSyGUO1nIeRNvsj9bMKao2ggoCRYhCrvGeEgR8BJKVKcyItPiVPk45/xYfaD
	f/eeb0arlFQVBcuP++aAFDufDSr2bBJN5/d2qotnyOfula4q7MmGAC4s+RnKm33qUMq8GX0o1wGzf
	+IaUpzcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYrq-00000009F1Z-2XT4;
	Mon, 23 Dec 2024 03:12:26 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYfG-00000009C3g-1lMy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 02:59:28 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so4216644e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 18:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734922765; x=1735527565; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=;
        b=lho+ngpCW2JkEfWy3IHDtQtkok/RIAJe3IXq2dEBObyf1l9y69zBoXDciE3Tc4bxhv
         6AWdAmzXPSk/mnZMMlhOuY0KZj5TWmBW1S38UI6gw99gUmz3qDymru0Om/3Q9g6YxZ1C
         n9/jZvd0KXEQi+4/ofD9+5MJ5R5MAJRcfksaK0U2RcCKxRHUNjMS4gaySTsusx+I80jY
         qj/pzjCihL6MiGFpto7pFgeJG3JudhEA3oMCvvWj+YAke5Wb+PsHP4KIYohCHq7/Vdwk
         7hPX5MndMwhmTWipuzF94/ahNBmUiPi2fqGuqFMSqoxU1AEfdCROYw9VkQk56Oq8ZnoK
         4Pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734922765; x=1735527565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=;
        b=Bqb0Cx2D3K95bRWj+6Dq9Ge0ri14WYKJEfHXXgl9wEc1NhjAKo61bShMrqPao+YWud
         992wOcpoDewECzzAbsZ3L5IUHH7An58dOd+kqvv+UHiUtaIzDV4P/7ziDn/3sb0z/tql
         /RUK9CyIr821Kswz+f2XdYU24U27RrSP8QIxwNvwZnTEI8LjU0U1SBU0OW9DKMJJD/6L
         M/ZuxgRGZ/0Lh5owqBigquVFCMqNJu4absGTm4xQ9Ar7lJaIm8IO0twsXnj6SnRLxRGC
         etjdpwFXv2Y6SVZ2Kccwpy6c8hBmGCRx3CJr+AWto/+R9bHfaNwXjLDmx+wgiNxhx6IU
         Amog==
X-Forwarded-Encrypted: i=1; AJvYcCVZovCP+DsqqCS0KySNtVHLJlrV7ZA8KzUvmjGCvuuMMzxDAw415GtpCpvkxd8j/Yr0U9r2Tv2qI12RqnBHth7S@lists.infradead.org
X-Gm-Message-State: AOJu0YxuCK3LPcgq9uX0hnO6yV+3xE0CW9kH46xQpwpDHuf5WqDwkj+M
	ix2DoXGRJ9szqM5EdxGrWVhrsuizuksQZT5YhMhSyYylLWH3KV2hnVgqlKneiH0=
X-Gm-Gg: ASbGncs0dvL3H07RMeaSKy7Q2w01v+P0dK1ZE+wBCA2SvkD97NwkVj+tp42QJt133y8
	6vKilLeChu8kctvkrqs4kh87ozu99UB73eD/e2pUA2MMAy6zogMmUrUQCyh90PyaGvrwmkXcuPo
	0e4xK7/N6hlhtk/4EyIyMd+d5sLiUDAFiI/SCYhXYMOMGVimnT/i1ULyH2ZMizJPKE2q3J9x7g6
	K8Qa1EfE0ue0qtX6FIuP5zUGTJRICiadTWd95mcXYPQoxpVHXAsZKksgNSY5aTn
X-Google-Smtp-Source: AGHT+IELf7Q9dKbwaApXTdiac6rXIdbml/bGXuPDMlX/oPVs9y7YxdDq3vkjKfSAR1daoK1hDBNZTw==
X-Received: by 2002:a05:6512:e8c:b0:542:2905:ae52 with SMTP id 2adb3069b0e04-54229582562mr3253920e87.45.1734922764852;
        Sun, 22 Dec 2024 18:59:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 18:59:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:59:01 +0200
Subject: [PATCH v9 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-10-6ce16bcedb8b@linaro.org>
References: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
In-Reply-To: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XEE5uVlLO0AwRnx9UbXjwAPIkR4mEqLYJ4bDyDXWCRU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHx7x+4SbLumBUmOEkbtu6Fr6hU1V56PPenf
 rTlgrJow96JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8QAKCRCLPIo+Aiko
 1evYB/9rPAzB3kkXRyr5OKaHMHSiShXf4rybV/gUkj3QflXjD9f8CPYW/cyNWoJQtSWoK8S9WTG
 Hfj6UgBsGVxS2w97497ZGuAlKy/qxgFdBiXqhOUD7TcjvPJwX/QX57ZzOuDajdo8WqeLrDtYU0s
 nxyhgsO1hqWEZ6EhXrJJQrwsgZWJyArs3jqtvSNURojm1mh3pntNVs0ZPYtB0DZvAeVNN+F3Iqu
 ftO2or9x4WGL8Bi2fIxxRaweVXdxK7nLNQH6PvvOeJnKAC1cD0oBV896Z9tP2SAFpG3WmCD4Pzd
 f/F/DTBdG0+u6dDWeil9xt7qN2QO/kPVNagQ1xbmxphKStOP
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_185926_475039_2661CB3C 
X-CRM114-Status: GOOD (  14.38  )
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

Use the helper function to update the connector's information. This
makes sure that HDMI-related events are handled in a generic way.
Currently it is limited to the HDMI state reporting to the sound system.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5282dd765cc9478361a705dca85f615015b12e8e..82eeb08c183420b000b351da1e05f9a47baeda90 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -383,7 +383,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_edid *drm_edid;
 	int ret;
 
 	/*
@@ -405,17 +404,14 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 		return;
 	}
 
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-	drm_edid_connector_update(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 
-	if (!drm_edid)
+	if (status != connector_status_connected)
 		return;
 
-	drm_edid_free(drm_edid);
-
 	for (;;) {
 		ret = vc4_hdmi_reset_link(connector, ctx);
 		if (ret == -EDEADLK) {
@@ -549,6 +545,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
+	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.5


