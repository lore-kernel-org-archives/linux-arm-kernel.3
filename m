Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB24E65D0A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 00:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=um90wdHTeL15s/B2MACNx3ktfE428gcJvXm907/nCMg=; b=O1Yhv1kcLDyOoZ
	zd3ePRtWNcKhhjUj1PzZztd1Tmf5T99wGeFOeqxw6yTi2FtUpDAiAOUcz60MTII82UYXOEd0bEhTs
	UT/CjBK6rCGLlO7RgSRVXYYgpal79U1wSjOE4bxeXJkqlbUr249SmjJAXCYIu8SXAJ2/zDgOUgQLE
	B2pai+2kFt9AC1cJatmH60IKC6SZOwH90V/1RCtrgZK9GU4HDEf9aS/ffR/pETM7qngWCrtYA8TMC
	cwE7HkVX9OBUE0opLCCkW381D9FuvaHQ6ZQs2bDmF+vnvzV/YSDWhhDDMIdzST8WACR/9c8nJUYEr
	HKOkIF8gGEosUuWlyHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEHqm-00000001GJm-2M59;
	Fri, 22 Nov 2024 00:48:44 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEHpm-00000001Fu1-2g4e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 00:47:45 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso17230011fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 16:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732236460; x=1732841260; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=um90wdHTeL15s/B2MACNx3ktfE428gcJvXm907/nCMg=;
        b=at5h3e+vwr3oZ0mXoXskV+VmQ8zpDLraxAG4LABmiJVdZV4s8tTT0JSN6jJFbP7D9h
         uxlzkjU0Yv7MqiQ9SyT0LVN1nDIqPVAek9+Bku8+UMe1NdZIlewfGFhVUMG+JxsMO3oI
         UDzJZngzmUuFEq3JfnZWMBsxXmu/zP5mGLoqKFTrREHuDnjgf3gKevCN/95eEtufLXQW
         8g+Eyrb+MmfQipcSYqgSB+t8ksSLED9pHRTjmI02B+tUg/GNG2sRntIcBSMf6BEHHhp4
         ZN6RWfJJbzF1GQ1Cvk0oHz7GTrs4prxVoDALCbmCovf+RR13wUe5NlpyqyFPW6/gyexv
         e22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732236460; x=1732841260;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=um90wdHTeL15s/B2MACNx3ktfE428gcJvXm907/nCMg=;
        b=l8UGoSyKIEuRGur0SJRENLjjWk1Cw5d18p9B0siVMIjnMh488GfZHBumBjHbrby5j0
         4TzkBHrnG9YUT6leGZdzFzGR0cdvkkkNUr248ive7mQ4UuQJ9fHnXba4tAHig5w2r/u9
         7otnTmFw9DngCEyH3F2m3u9xZrMAZ+bvBVbzeWAiWy0LXkwkRy6SQhYt6sDKIYDkrK1o
         p7zuA5QycJ9qo5X3m4gLAjshN5EaRukee3T5O/bxsdmoNYrC3jXI+zrUyX7Y/dFOGeTj
         yeHa4qPOZAmzze9c5A2sPzwcC8CQLmjk6mh6NB/tPGdw+7zw7Ws3Kk3EPRCX4t42Q3/h
         OL8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3Ry8dCYr/m1VSkTsZX04+rKEyh/wajPq7zwg8XyMPU5K81uB2FKSYcYY/cO9OBDVci5ILEf5mjlDVE4b67DeG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw1HCYkTgYfGkkvabBrbIxUyDU+WQFzNovOiwt1lRTliADEVWi
	gOhEJPE6efaHXKDrahWKtDeRMBShBXxPz6bEjvk9El/WMsDtuhp71ve+lCOlWVA=
X-Gm-Gg: ASbGnct5vwj5lXhehBR9aCVr+bxwfzmSPC8fLVXqFOy1xrB2jKN6LgwAGYAdpi/JC1p
	sxkzqUxnczKXkRpcUokUidikeLgytNi+u7gMmZhIiGbiLqSiWRfW90PkAAro5FmPWlyyi+TaL1R
	ixXXvOmUM1eW27pKJZE2qLUpY2AS+MaFwN9NYOIoF5gGpU2CQBrAMJ/7KogTyRoItDqEiw7cMN+
	DM+XlWHpcEav2eMmu+LGcz0eagugByMy9eQqDOLUzcl1xRU0pFw8Q8UtA==
X-Google-Smtp-Source: AGHT+IEQzKqwfnQr8BDICIZTlsvnC/r9hitkRE3k+QvhrVxsSO7Eaui8kUS1x+WJb2x44tXBhDKq+Q==
X-Received: by 2002:a2e:bc89:0:b0:2ff:8e1e:7692 with SMTP id 38308e7fff4ca-2ffa4ca6837mr3674881fa.0.1732236459662;
        Thu, 21 Nov 2024 16:47:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa5375caesm1083071fa.85.2024.11.21.16.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 16:47:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/7] drm: add DRM HDMI Codec framework
Date: Fri, 22 Nov 2024 02:47:30 +0200
Message-Id: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKPUP2cC/33NywrCMBAF0F+RrI3k0bSNK/9DXKTJxA5oIqkUp
 fTfHRVEEbq88zh3YgMUhIFtVxMrMOKAOVGo1ivme5eOwDFQZkqoShgteChn3hUMtOnDGbnPKYG
 /5sJtJ2LdKGMbDYz+LwUi3l72/kC5x4HO7q+qUT6nb7WWZkEdJadSY6Nv2tq4Tu1OmFzJm1yO7
 MmO6kNJKeQSpYhqtIVoXQjRwh+lvym7RGmivDQuBu9M21Y/1DzPD05/udVZAQAA
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
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5312;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=C4fwAVi8Y8X09kTJmKrmpH7fVyGUsoMv9zUOWXGRYW4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnP9Sn9nKiqy+nhkrdFBttnXflL5ViiMKvfm+nv
 dqQY3eVyaKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZz/UpwAKCRCLPIo+Aiko
 1Y9VB/9nUIvKzPfa6965IlISfpPf9ACZ4w5nJFNa7D2JevOj33zVCtjWri2gXfW/0vlnodCMiUk
 9m3z5habClZZBt5jkyJdTbT0DIHnSMsElQzHYHukEd12M/SgQbbEUjSc+GFejAtKVL1Ijxu+FMG
 ASZZb1YualEDuroQKhsrgnQkxdr2DNLTz/j3IAp3KJu4CUGot88ERprip2HeQC9Qr2lLJuNB2ke
 cjL5F9V+9m0ZQNoJDsf1j6/YGPlAd6bFJUq+2GykIgVl6rSSAiQNojT6QX7fk5phe55GDJZ2fQP
 xTlSjB9OnDXSAO6HfbBOtDzc2uI+tdk29iZWKWC4/ICja0PD
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_164742_711756_F501B527 
X-CRM114-Status: GOOD (  19.22  )
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
Changes in v4:
- Added forward declaration of struct drm_edid (LKP)
- Fixed kerneldoc for drm_atomic_helper_connector_hdmi_update_edid().
- Link to v3: https://lore.kernel.org/r/20241109-drm-bridge-hdmi-connector-v3-0-c15afdca5884@linaro.org

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
 include/drm/display/drm_hdmi_state_helper.h        |   5 +
 include/drm/drm_bridge.h                           |  23 +++
 include/drm/drm_connector.h                        |  80 +++++++++
 include/sound/hdmi-codec.h                         |   7 +-
 sound/soc/codecs/hdmi-codec.c                      |   4 +-
 24 files changed, 607 insertions(+), 136 deletions(-)
---
base-commit: d80b5c5b9be6b2e1cdeaaeaa8259523b63cae292
change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


