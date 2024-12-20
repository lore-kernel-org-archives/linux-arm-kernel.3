Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A1BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 19:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3NH9o3sRUQc2TBuzCNn4xd0xwtaijH4zEiuuPAl8O+Y=; b=EMOTD4Mt1B2eZx
	ruXQc5LJhEwWVXEOcZFdab3MNTsvIuVM5oWqy+zZUpanVqEmrdhGyMwet5mIAI1FDZ5+VYTyU0Zax
	9rC+BjsrceDopbfLOse9IrhqTR3NkNA1eVooX5uj1HEMqxD+sVrGyNjye0QCVQiw3fLUQLqkqjTWZ
	0zCGZP6sAmjNZU8FJdnD3SJdV+ebqyK05w0fjpSz/HeLiGcfJiqJzMvYf/Fg8WJJ1DHsXUuRv+30/
	24s/KiG1esq1ql/nKPzfsy3HvTvDHLETomylfUZuhLcYI9RFklGewM6Tj9w+/Z/CPGTxdZ3i7VR/G
	GfO5FYZR8SCUhobaCJqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiW0-00000005txC-15SS;
	Fri, 20 Dec 2024 19:18:24 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiUm-00000005tL3-0LCY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 19:17:10 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-540218726d5so2207540e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 11:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734722226; x=1735327026; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3NH9o3sRUQc2TBuzCNn4xd0xwtaijH4zEiuuPAl8O+Y=;
        b=ITGvl4kQxcZ1KzbYYXCcucAuBIStKDk89/3cFfVujhTA1Rh7qv4C2De3MUBPstESo8
         UXj8HzqVLQeX5YNksXpZ5nvkOsIKqdtRFKCtedNUuZn0it267lTlL4C1FNb26hNxQPR0
         BgQuS86ShubIvWeexeYVIVJp8SU6mce28uMLsoZ3RF9TkGRAduPnfSKPw6W2/pZ2py03
         MRryyzBZgzcD9gJt2Iu/9NeWCM+n+h0U8TxuXUxuZXymVmeNhMpVGLGOVYyWbZo+M/KP
         yfHvl0OJleWSGuo21rIjT8mnA4XeKr0oksKvmnDxz/aGKROq3BbGPI0aRndewaj85zwT
         7XFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722226; x=1735327026;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NH9o3sRUQc2TBuzCNn4xd0xwtaijH4zEiuuPAl8O+Y=;
        b=bfLrnL2888zbbpzdprdmKNMp7DS1/btEc0VJE5ODWYy3g0UtDX+XuC7h7OAWpOvQEQ
         m1LlgJ5jr+sZwaRCjtRv6ac2uZ095aWqjEkanc1FOWmTBaJwP2yI3TNbKyOlGG06lAuo
         +D7dVBqazRvHln+9ZtP7WkOsE/1+DZpdqOWPVy/7zSarhbwyTM+zzcPEy5R8WjH2Sn1e
         VaPGbZFcnxpdgVIvjvNFwTRIu849Ud6778Mg/WsrwGwH2uuWpT7Nv4NsfrCHH06hHI/s
         WmbNYkgaRfXFNAPiT+VdlyXgQBndnIYVRRleA2cTMyem/KxK5QgmhkhziZ92HnOZGUHK
         JS+A==
X-Forwarded-Encrypted: i=1; AJvYcCVkR+aS4jRUzEz3xkgH0NhlJLgll9HAsP4U6thROqvJKINvKkt0ROHIBnoxPtky4CfLT9rmIfuUWPmhq+yG6v0q@lists.infradead.org
X-Gm-Message-State: AOJu0Yze+KZMYScs7hhBA5QrLlQR0RhR/5tOfGy+vbybpnesiWH9TYFY
	UqtsV0Xz8MGDLGY01yf6i+jYySN4q8T6axhnRNMUpl7F1oZeT6YGAlo/iMiuyRw=
X-Gm-Gg: ASbGncuEDTkdDByGRhU7pw7PyaUNHF43WGfyP+fBNfTemHhW28q6WzOlDrSLABl6etv
	rhF98Ya8eByTdFUv0U+Itt6HSZEg/jsbPaqnxjDUY7MNLOyxP4sy1doBaKkABeWT1lRsdKGlXFS
	uowwQeMpaw1i2NbQRihoaFZ3mNzJWT3ByBSLM3jSvGGIv0shFQfTEvJkNfPLx4iloMzr/s+DAWC
	gZu6aFlG1N5AGip+0lK6BmV+Nx+4VHnMoKgWFJkbpbBBboWEXu17n8RPXXj/jrv
X-Google-Smtp-Source: AGHT+IEwbdV0vqS0CbZsf9gavU/S6dsgiTym1Hj3ImdXSFJiHjGHsRoZIPzHljOSqCM570WwNxfbig==
X-Received: by 2002:a05:6512:1055:b0:53e:39e6:a1c1 with SMTP id 2adb3069b0e04-54229560360mr1595277e87.43.1734722225396;
        Fri, 20 Dec 2024 11:17:05 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:17:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v8 00/10] drm: add DRM HDMI Codec framework
Date: Fri, 20 Dec 2024 21:16:57 +0200
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKnCZWcC/33S207EIBAG4FfZcC3KoUDZK9/DeMFh2CWxrdLar
 NnsuzvdRq1pwh0/MN8EMlcyQskwkuPhSgrMecxDj6F9OJBwdv0JaI6YiWCiYUoyGktHfckRT86
 xyzQMfQ9hGgq1niVthLJGAsH69wIpX+72yyvmcx7x2te91cyX3VXVXFXUmVNsqmwKptXKefH8l
 ntXhsehnMjCzuKX4pzxGiWQMtJCsi7GZGFHyS1la5REKnDlUgxOtW2zo5oNJUSNapDyTdQ2apA
 +2h2l/ihRf6BaKCW5hlYkzd2O0ltK1yiNlGIx8EY5G5jeUWZDcVOjzPJX3sYkvHaKq3/UbZ2UA
 h+fOHzTOi7EuxGQ6Lo8HQ8L3eUxPP0saA+XCUtv35WVZBK/AgAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7525;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=giLohpM0BRvWhMYAR/wf1lzclRNU18yQ7AASBU7KAiw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZcKtk+PPS9ufezpvTTjC4kTqVhFjjhD5e9vOj
 0BznWorBwiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2XCrQAKCRCLPIo+Aiko
 1TAiB/9wLaUi6L1U0wm9kaQGolW2F/JocJmm7XmS2xhVk+EutMK+TI68eC0FFtEFQOTPNa0grFr
 BU27z3zSFRsJO9H3uAi5rvJE+A3WirWbzGhomKwyls/EHSjQ6zzrz4m38LdZXI37jKQ4oCQJkz1
 mMfIxU5NvmIQfPyTifwZ3NuZwsQeo4CxNguZ+EbSZCCXW0uVivlx/W9y0wX3wexEF+LlOdMtuw9
 2rA1nGLaBjhsAxlc1YDMzCs2vElD7xprsAwL621D8TE5r92DUlBbgzdZrwX2mHf+VVRsj0ktHkn
 gxmNAiIe70Fgr8rhAbp/jFHW/SGfLzvFuwyzbwkG0wvSWyzz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_111708_173801_C3F504BA 
X-CRM114-Status: GOOD (  21.93  )
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v8:
- Mass rename hdmi_codec -> hdmi_audio, drop redundant audio_ prefixes
  from several callbacks (Maxime)
- Fix the commit message to stop mentioning
  drm_atomic_helper_connector_hdmi_update_edid() (Maxime)
- Link to v7: https://lore.kernel.org/r/20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org

Changes in v7:
- Renamed drm_connector_hdmi_codec_init() to
  drm_connector_hdmi_audio_init() (Maxime)
- Added extra empty line in struct drm_connector_hdmi_codec_funcs
  (Maxime)
- Dropped if/else from drm_bridge_connector_audio_startup() (Maxime)
- Added optional .read_edid() callback and reworked
  drm_atomic_helper_connector_hdmi_hotplug() to use that callback
  instead of having an internal function which accepts EDID (Maxime)
- Made VC4 and drm_bridge_connector use .force() in addition to
  .detect() and .detect_ctx().
- Moved HDMI codec functions out of struct drm_connector_hdmi_funcs.
  Assign them from drm_connector_hdmi_audio_init().
- Documented struct drm_connector_hdmi_codec and its fields.
- Link to v6: https://lore.kernel.org/r/20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org

Changes in v6:
- Dropped extra checks on the EDID (Jani)
- Reworked drmm_connector_hdmi_init(), splitting the codec init to a
  separate optional function rather than passing arguments through
  drm_connector (Maxime)
- Reworked EDID update functions (Maxime, Jani)
- No longer refresh the EDID in vc4_hdmi_connector_get_modes(), it is
  redundant as vc4_hdmi_connector_detect_cxtx() already does that.
- Link to v5: https://lore.kernel.org/r/20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org

Changes in v5:
- Moved prototypes from drm_internal.h to
  drm_connector_hdmi_codec_internal.h (Jani)
- Rebased on top of ELD mutex series, resolving the long-standing FIXME
- Converted the VC4 driver (compile-tested only)
- Link to v4: https://lore.kernel.org/r/20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org

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
Dmitry Baryshkov (10):
      ASoC: hdmi-codec: pass data to get_dai_id too
      ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
      drm/connector: implement generic HDMI audio helpers
      drm/bridge: connector: add support for HDMI codec framework
      drm/bridge: lt9611: switch to using the DRM HDMI codec framework
      drm/display/hdmi: implement hotplug functions
      drm/bridge_connector: hook drm_atomic_helper_connector_hdmi_hotplug()
      drm/vc4: hdmi: switch to using generic HDMI Codec infrastructure
      drm/vc4: hdmi: stop rereading EDID in get_modes()
      drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi_hotplug()

 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   3 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 169 ++++++++----------
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   5 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   3 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     | 137 ++++++++++++++-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  56 ++++++
 drivers/gpu/drm/drm_connector.c                    |   5 +
 drivers/gpu/drm/drm_connector_hdmi_audio.c         | 189 +++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 103 +++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 -
 include/drm/display/drm_hdmi_state_helper.h        |   5 +
 include/drm/drm_bridge.h                           |  74 ++++++++
 include/drm/drm_connector.h                        | 141 +++++++++++++++
 include/sound/hdmi-codec.h                         |   7 +-
 sound/soc/codecs/hdmi-codec.c                      |   4 +-
 25 files changed, 716 insertions(+), 208 deletions(-)
---
base-commit: 74ef9527bd87ead62deabe749a6d867af748d448
change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


