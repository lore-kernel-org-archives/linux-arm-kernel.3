Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A35D5E369
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 13:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tktl0Wc+xw75bG8WyV2vmonQOnlV6r4PKPQgphemFMI=; b=WwoQs42dpJjBI5
	2D0F0XPDTNSiLBerca6WGWBwZ7bKvuBy0YVPjMIfAJb4Yhk5hGvNz6Av6552bcgSqek2njykwziSK
	kwes5UodBB+msoMp461H/SPpmZAl0mfceLOSUYKWFPT/gABKpP1X+2UlyMnXt3YVgDS86gb2O6JYu
	q0v0QHxyN3inlqZcEJ+zFj91PzP2GKONpkp8C2Xr5p+JdCa8N/gmDY/YWappmjjXaEhHVzhTVF7qB
	ga39Zgsj4GCUkaB4JK8TSbRJbAadeFOdUvNwQHHd6ZH9f9Cbuuaj89GLiM8N6ZePlZ8yWMhLOATJ6
	l8PT9zcPe8FnTnqVp0MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9l4s-0000000DMQ6-392J;
	Sat, 09 Nov 2024 13:00:34 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ktH-0000000DKzX-0OK8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 12:48:37 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so3959557e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 04:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731156513; x=1731761313; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tktl0Wc+xw75bG8WyV2vmonQOnlV6r4PKPQgphemFMI=;
        b=rR4Lb8Wm9rJDAogJ+BJaVlBrhvcsks5OJtXCGzpSTq0bDPz5YA9UK7ukSY3+UvwJUM
         YE4uaQ9ZWAUC5lawWE6syf86QfkOOaCuBY5XZ7SfKUtwTcZGmEG4ikTF9aEuPI48J/kD
         1qocdGLfX5dk5MIy4R169B4DZx8PpVH+zG4RpgOp1V1XYktuN7Yt5/F6bYRbzCRS/wwt
         9Wz7zjvPkSPMzZhoVCpzkecOsKnv240Ktg9RQ6qdxUI/Q1LfGMYcAl279GC6BIdF3esM
         SqRMjcABxwVXIhEMcT6Xsq49YfcYHwgG0YF0Zc+JrXc2xB5vp5RvzhsfywFlRGBcH9IA
         33qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731156513; x=1731761313;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tktl0Wc+xw75bG8WyV2vmonQOnlV6r4PKPQgphemFMI=;
        b=bsL5yh3mW6kH13ieQEtNVDtUMz6b+ExwicLw4eTjoB9le+0wKiING9GhW2kPKU+hjZ
         jT0oYa1koMM3xwq/kqqFj5Y1DMWs9j6xpZ24AHB6paN3nqXDACgivHf+Tr0ChBOiEDXT
         Gv0fxNiZczilADwlhV/MeZxIVfnhUNAT4vBXyM3fga0Om9gE8J/zdcr9tc1GM8jOargN
         zvhjhP8CpJADGS6qFU+bytqXkhmo6lswcTIpaozN0L+vzlcwLskZr98nfgq+W8s0Z1ri
         PCz40fk48EIGpgAZFWNVEB4FfhVOdV0ZGq6638S6fcyLBd6JJR5a0jOFA2yY/fxaoZCI
         F8hw==
X-Forwarded-Encrypted: i=1; AJvYcCUP6hSVIUc3IinRRVTCnGzWorPMAh7Eix4Kc9c6Wmj2EIRGEEFr3HIUOr6UoEtbedz6Vv8qb24Lvv0askwmyM+2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8wLIjERWSIbOiyCK0jxmgGnwIcGln5xix0wMvoA36ihggaW3J
	wyJDeoPQFaAgpdsKHqm62kZqdj6ikiI+03z9FepQK2/gT/SUp3QdNAGug7hxobI=
X-Google-Smtp-Source: AGHT+IFKjFQifv6YG5Ewl5DM9ApJVWk8n4DHPAB7HKN82uFlh1WN5YLZbnRUORGi+mr2yaiyEVDzdw==
X-Received: by 2002:a05:6512:3ca7:b0:539:ddf1:ac6f with SMTP id 2adb3069b0e04-53d8626c7a6mr2648976e87.46.1731156512927;
        Sat, 09 Nov 2024 04:48:32 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9b76sm929967e87.172.2024.11.09.04.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:48:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/7] drm: add DRM HDMI Codec framework
Date: Sat, 09 Nov 2024 14:48:26 +0200
Message-Id: <20241109-drm-bridge-hdmi-connector-v3-0-c15afdca5884@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABtaL2cC/33Nyw7CIBAF0F9pWIvhIUVc+R/GRQtDO4mCAUM0T
 f9dWhMTN13eeZw7kQwJIZNTM5EEBTPGUIPcNcSOXRiAoquZCCYOTElGXbrTPqGrm9HdkdoYAth
 nTNT0zLdaKKMlkPr/SODxtdqXa80j5nr2XqsKX6ZfteVqQy2c1lJlvNXHVnW9ON8wdCnuYxrIw
 hbxozhnfIsSldLSgDedc97AHzXP8weNEozLDgEAAA==
X-Change-ID: 20240530-drm-bridge-hdmi-connector-9b0f6725973e
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
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5064;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RpfjHjeOgMA+vTAv8qdDWazS15s3/X00AeUdND0T1nY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1odiCa5H/aiu1dghYaNHMnUv6fDoqcv+VB6S
 50qP1XCjcCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9aHQAKCRCLPIo+Aiko
 1dwoB/9KoLfzVTiVNdiIDf9IgewzO6Flhip/P2nNmYzyGY6ZYrM2ap5xePdMtJKa+YGu5tzTmY1
 hsy9WyLM2+Ws53cZhR2VwPJLY1D3sjKSFfXoE3HULjl2/FYG/aQuh+XBNoCLh3dMuQpf4HvcDWb
 Bu2DXf6mp4zPGyfWO6nG8NvBMmqBNXCxUdf/1cW41w1i41AFfhxXh7owAzY1mMlwMfF0S42sVDv
 9ZdQBuKeGL0j/UxMgkPJTtm3+qzLPgyjz14snSq+yNWZCJDI0uosBPyBdcmb7JXab0MgEsmfq9l
 Ktm/CnuG8BZ2F8NHQkAV9O7REYMeYPL3qMqVXYLPa/xyy5QM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_044835_217979_6EF45540 
X-CRM114-Status: GOOD (  19.05  )
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

While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
framework, I stumbled upon an issue while handling the Audio InfoFrames.
The HDMI codec callbacks weren't receiving the drm_atomic_state, so
there was no simple way to get the drm_connector that stayed at the end
of the bridge chain. At the same point the drm_hdmi_connector functions
expected to get drm_connector instance.

While looking for a way to solve the issue, I stumbled upon several
deficiencies in existing hdmi_codec_ops implementations. Only few of the
implementations were able to handle codec's 'plugged' callback. One
third of the drivers didn't implement the get_eld() callback.

Most of the issues can be solved if drm_connector handles
hdmi-audio-codec on its own, delegating functionality to the actual
implementation, be it a driver that implements drm_connector or
drm_bridge.

Implement such high-level framework, adding proper support for Audio
InfoFrame generation to the LT9611 driver.

Several design decisions to be kept in mind:

- drm_connector_hdmi_codec is kept as simple as possible. It implements
  generic functionality (ELD, hotplug, registration).

- drm_hdmi_connector sets up HDMI codec device if the connector
  is setup correspondingly (either I2S or S/PDIF is marked as
  supported).

- drm_bridge_connector provides a way to link HDMI audio codec
  funcionality in the drm_bridge with the drm_connector_hdmi_codec
  framework.

- It might be worth reverting the no_i2s_capture / no_spdif_capture
  bits. Only TDA889x driver sets them, while it's safe to assume that
  most of HDMI / DP devices do not support ARC / capture. I think the
  drivers should opt-in capture support rather than having to opt-out of
  it.

This series is in the RFC stage, so some bits are underdocumented.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Dropped RFC status
- Fixed drm_connector_hdmi_codec_init() kerneldoc (LKP)
- Dropped double underscore prefix from
  __drm_atomic_helper_connector_hdmi_update_edid() (Jani)
- Moved drm_edid_free() from
  drm_atomic_helper_connector_hdmi_update_edid() to the caller's side
  (Jani)
- Link to v2: https://lore.kernel.org/r/20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org

Changes in v2:
- Use drm_atomic_get_old_connector_for_encoder in atomic_disable() to
  prevent it from crashing
- Reworked HDMI codec init/exit, removing drmm_ calls (Maxime)
- Drafted the helper to be called from .detect_ctx() that performs HDMI
  Connector maintenance duties (Maxime)
- Moved no_capture_mute to struct hdmi_codec_pdata
- Link to v1: https://lore.kernel.org/r/20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org

---
Dmitry Baryshkov (7):
      ASoC: hdmi-codec: pass data to get_dai_id too
      ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
      drm/connector: implement generic HDMI codec helpers
      drm/bridge: connector: add support for HDMI codec framework
      drm/bridge: lt9611: switch to using the DRM HDMI codec framework
      drm/display/hdmi: implement connector update functions
      drm/bridge_connector: hook drm_atomic_helper_connector_hdmi_update_edid()

 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   3 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 170 ++++++++-----------
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   5 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   3 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     | 162 ++++++++++++++++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  59 +++++++
 drivers/gpu/drm/drm_connector.c                    |  10 ++
 drivers/gpu/drm/drm_connector_hdmi_codec.c         | 186 +++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h                     |   5 +
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   2 +-
 include/drm/display/drm_hdmi_state_helper.h        |   4 +
 include/drm/drm_bridge.h                           |  23 +++
 include/drm/drm_connector.h                        |  80 +++++++++
 include/sound/hdmi-codec.h                         |   7 +-
 sound/soc/codecs/hdmi-codec.c                      |   4 +-
 24 files changed, 606 insertions(+), 136 deletions(-)
---
base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


