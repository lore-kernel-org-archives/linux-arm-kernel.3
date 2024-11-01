Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D7FE6B242
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 10:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=le/PASSZxeUtTWMl/wNKSD8ec0kDdmO9btc+axn7CcM=; b=x9PgpqTR/JihcF
	Dnaliktw1Wyk7WrqnRjNezKtgJtAuRLbxt+UZWitqRvunmls07RMHsUihsxzuyPzYrFEyNrh1leP3
	zqKvYT6YrMWhW72OrSmv2VHEl0r/Kbu5k9On0cupULxqJNnZprEy2Fj2j7GKkmmvkRGhFNVmu6CFb
	Z1+wmtk6INUp0hBaktjWNj5BCz792ajevOusXdAizAuoTlSZYL4Sxi8chjJmluZpC1shIRM79ST2S
	CkefAwOxcSNJMSYM5kMo6QWlkJV1Z2ySQ1CJsLRh4NVOhhUOKE9YNqWnbkkP7hS+r4Q7dsNM5+lKU
	w+2OkYgB2IRb4nWqm76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6os3-00000006ZXv-3CVT;
	Fri, 01 Nov 2024 10:27:12 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6okI-00000006XrZ-0Hqx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 10:19:12 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2fb470a8b27so26007431fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 03:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730456348; x=1731061148; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=le/PASSZxeUtTWMl/wNKSD8ec0kDdmO9btc+axn7CcM=;
        b=IeFB1uNVlWxkvroDKD7EOtCGrIoztmVsKrwWOLB4kz7ki+MTamZU3FAoP2/XWWbvsv
         ZtsIzTLgzRvh5odXeGq5Z/jLlHvcoOWUY5fu3l1JqpdtrjPwI7FQotkjU8hx2/wbUNAm
         jYCO5NX2Ts4E+1gxU7cdw94uUKIB3sG/fF0FnVNdKBgOldJP8ptlMNOdbzS8niUw0dRo
         z+gTySGT1G95Efpso1xykXsQpnpuoKN0RiAq+HUcKQ21J7m4CKd1YsQzwYu9iYBm9Xgx
         fhU47KelOI0kzzImAkdFJgSzccw+FridIRbT2su7SkUWxY4x0ZSrQ12NKOYcmfXoc0T2
         ypNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730456348; x=1731061148;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=le/PASSZxeUtTWMl/wNKSD8ec0kDdmO9btc+axn7CcM=;
        b=soB991I29M9HD4lPzXRu2RBtVV2y0ulYXueGhjR0ErGRoKj7u8wEXHmwu6AyXyWhx8
         ZWCVkIejchMXOKthAToKvdz9Z/k+CQlZuZ4FlZQqpr0/vCL9CILjgF8o7wTZdTn1LzL1
         QzeqH7OQZgy3Mysl0UEgjQw9XFnn11Gl5U0vlfc6sKwzddJuWE1zGsoHsji2Z/HMzk1U
         SYDFwERRdNMd0u/cbvR9jdj+mtNyvcFVJqRIczeeb5V5kD33p8J1NlrF3UrV3jK09cdw
         /u0MnoBgR6ci0kGPMXLg2rn+CRbxija3eeJv7xsxef4VPG1f1Q/bnTvUB7o1RvJ5/w9c
         tQoA==
X-Forwarded-Encrypted: i=1; AJvYcCUnli/qsmwOvhWPzZFRRQScIhHhwIZiOKHE8QxIYF/Xbl6/meuwWEljgGh7J+XlJbrMqLr51tX9wI3tRcKJR1zN@lists.infradead.org
X-Gm-Message-State: AOJu0YyiJCknhhEoZ3yqjkr37ky03D+6/amuAXd+/+y2lzTzWi3UH23g
	1xmJvhHlc5HqJOgtTRgLoMa+d1evJPHsQdAH/p4D2NCvwGeiqfTYAdoA/kvLUWY=
X-Google-Smtp-Source: AGHT+IHY7ovUMeRzJsMU5xMtc2Dvgev8mxKT+oIlhDInundzFyWvx582oufvDDooCRwUY9gtgQ/5NA==
X-Received: by 2002:a05:651c:985:b0:2fb:569a:5543 with SMTP id 38308e7fff4ca-2fedb488babmr9537901fa.19.1730456347942;
        Fri, 01 Nov 2024 03:19:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef5d6ef4sm5197031fa.48.2024.11.01.03.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 03:19:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC v2 0/7] drm: add DRM HDMI Codec framework
Date: Fri, 01 Nov 2024 12:19:01 +0200
Message-Id: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABWrJGcC/32NTQ6CMBCFr2JmbU0pFsSViYkHcGtYQDvAJNKaq
 SEawt2d9AAu39/3VkjIhAnOuxUYF0oUgwiz34GbujCiIi8ajDZHbUutPM+qZ/KSTH4m5WII6N6
 RVdProaqNbeoSQfYvxoE+mf2A++0KrZgTJel+899S5Cijq8L+QS+FkmfbDK4+VbbrzeVJoeN4i
 DxCu23bD0dTIXXIAAAA
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4653;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QgZZzJg9ZFJE02xI1Hrtot2oVYSJiceonkhnIgQN/h0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJKsY88bZNto8DqlmNoOzOCbmLPcIj7Q20qCAJ
 JjoQmszobCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZySrGAAKCRCLPIo+Aiko
 1ZMxB/9PlgUbk1D7PhNPxChE5hultBBglq08GH0Umkd+Za2/2Io/+TRzSawGpJdQvyxkjlgfR0V
 0y4x1NxVaNkUE0lL9SCdxQENW6FuWm204EDKSf12UssCKVaaxSBhb18R8Y5pevOS+ZxuJiSRann
 virCc8/G78fIZmOcG+fMTmaAK3JSG29OlKMAzDUMON9dZj7DQVBpShmW5IkenDcOz9Rw7tBwDRl
 7MZevUXEUJa6Q458HDM/jZM4XSAiLfaB+vJISqffjuKFlvfRC99iOSplpF6789oJDrsBwunWAe6
 n/wG5kc77eAVv8XoWMc/5iYXHHRut+GnvvCeHuKnPEFbapd6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_031910_176128_206F79A5 
X-CRM114-Status: GOOD (  19.44  )
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
      drm/bridge_connector: hook __drm_atomic_helper_connector_hdmi_update_edid()

 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   3 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 170 ++++++++-----------
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   5 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   3 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     | 160 ++++++++++++++++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  56 +++++++
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
 24 files changed, 601 insertions(+), 136 deletions(-)
---
base-commit: f9f24ca362a4d84dd8aeb4b8f3ec28cb6c43dd06
change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


