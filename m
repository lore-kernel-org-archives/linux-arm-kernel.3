Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FCDE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y/Aukh28/Lwd04OgFvMSVxpWruQ29lxVzWmIPoVMg0Y=; b=BFLjHcbQUeH6hvgAtWt8O/EQj8
	xmCa6cLSbmHq6bp23wbFdAmrsZfZuNRnVwex+28bckIWSGo/CWAm1XB9ziST7LrM3GHo+rAXxaMJ1
	lXkb8Ec1rhyiWuMhksUd8+FIEMjP4TJ2O3wlniQeQKlfSu7LVxAIAkxyizFzuxArOLsn6XCS2k54A
	l8jOEPAOrdW3T1b9TLoT7QCc33+pjatY1NlkKk4/VAONll4dmlhwbLSaCnSIG/2STFrt0dzabnwAK
	qMkRCUZvD6q+2xxljy1JidD2BJeZnheFxW1aI/pR96XFSFnYlPay+m8NxDiGhb/i1zCRd3oYRwtSc
	I4tDU/bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZlz-0000000E0l0-3u6y;
	Tue, 17 Dec 2024 15:46:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZjm-0000000Dzm6-1Crb;
	Tue, 17 Dec 2024 15:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734450230;
	bh=HoZZ64yrxWHD0dwwUdsItm6dPuIeEl+mq4jwLMBNTB4=;
	h=From:To:Cc:Subject:Date:From;
	b=V4IlSDzT9ZrgiOdpTUIk4sPYeLCBaErItmq0E/iAUWJZecs+H8TNCtaQaZKO21Scf
	 nvuwvSM1hbBxYDW/r9qc0RuMu+h1GepWngbEbLKBkimNVPEKtk6yva620YNkJvWjev
	 Wl9gci7OnTgipw1BcSHFLYvGATWB05YY0ZI/TgnyDyDS886QOCHnXDFIsJBwI8ckQX
	 pWxyF/ifoCE8B3Q270kk+jfY6/VGnv0WRY9IS4g0561Ia+lgI8Z3SrgoWv7pCiyOF1
	 hwr+v8PYUpzInXUP3xtLFZpLIDoD9IVbtbef+v8lKKf1aj4SRUxjIbRZkm3kt6kg7D
	 x1uC5u5uQ1vSg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6854117E3786;
	Tue, 17 Dec 2024 16:43:49 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org
Subject: [PATCH v3 00/33] Add support for MT8195/88 DPI, HDMIv2 and DDCv2
Date: Tue, 17 Dec 2024 16:43:12 +0100
Message-ID: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_074355_292592_9C43D68E 
X-CRM114-Status: GOOD (  24.97  )
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

Changes in v3:
 - Added hpd_enable() and hpd_disable() callbacks as suggested by Dmitry B
 - Removed audio mute call in bridge_enable() as suggested by CK
 - Reworked commonization commits for mtk_hdmi/mtk_hdmi_common and split
   out debugfs/abist implementation as suggested by CK
 - Removed .mode_valid() callback as it is now provided by the bridge
   API in drm_bridge_connector_helper_funcs
 - A bit of cleanups here and there
 - Tested again on HW especially for new hpd_enable/disable callbacks.

Changes in v2:
 - Merged series "Add support for MT8195/8188 and Pattern Generator"
   and "drm/mediatek: Add support for HDMIv2 and DDCv2 IPs" in one
   as they are directly related, as requested by CK Hu
 - More commonization: moved some audio functions to mtk_hdmi_common
 - Fixed a bug in DDCv2 driver to allow sending a message with len=1
 - Renamed some functions in HDMIv2 to consistently use the prefix
   mtk_hdmi_v2_ across the driver
 - Added .mode_valid() callback to HDMIv2
 - Added .atomic_check() callback to HDMIv2
 - Reordered drm_bridge_funcs in HDMIv2 driver
 - Rewritten .edid_read() callback in HDMIv2 to move checking audio
   availability to bridge_pre_enable() stage, and to stop using the
   drm_edid_read_ddc() in favor of drm_edid_read()
 - Added support for API provided HDMI Helpers
 - Added .tmds_char_rate_valid() callback to HDMIv2 for HDMI helpers
 - Added .hdmi_{read,write}_infoframe() callback to HDMIv2 for helpers
 - Added support for Vendor infoframes in HDMIv2
 - Added missing audio-dai-cells to HDMIv2 binding to fix check error
 - Added more information to the HDMIv2 binding for clocks and PHY
 - Added some comments to the HDMIv2 code to clarify why the controller
   is preconfigured in bridge_pre_enable() instead of bridge_enable()
 - Added a mention of the differences in HPD between v1 and v2 to the
   commit introducing the v2 driver (v2 is not using CEC for HPD)
 - ...and tested again on HW! :-)


This series adds support for the HDMI-TX v2 Encoder and DDCv2, and for
the direct connection DPI as found in MT8195, MT8188 and their variants.

Tested on Genio 700 EVK:
 - ABIST ON: ok, pattern generated internally from HDMI is shown on
   HDMI screen at the correct resolution;
 - ABIST OFF + DPI Pattern Generator ON: ok, pattern coming from DPI is
   shown on HDMI screen at the correct resolution;
 - Can negotiate up to 4k60

and on MT8395 Radxa NIO 12L:
 - ABIST ON: ok, pattern generated internally from HDMI is shown on
   HDMI screen at the correct resolution;
 - ABIST OFF + DPI Pattern Generator ON: ok, pattern coming from DPI is
   shown on HDMI screen at the correct resolution;
 - Dual screen usecase validated (DSI + HDMI 3840x2160p 60Hz)
 - Can negotiate up to 4k60

Please note that this submission does *not* include support for HDCP
nor for CECv2, as I want this to be upstream before implementing
additional features which are not strictly required for simple
HDMI output.

Bonus in this series is the addition of support for the Pattern Generator
found in the DPI HW: since I needed this for debugging during development,
I had to code in the actual support bits and it looked like a waste of
time to just remove it.
I instead decided to clean it up and upstream it, as this will anyway come
handy for multiple things, of which the most important (imo) are:
 - Adding support for new SoCs in the future will be less time consuming
   as this driver already has the pattern generator in;
 - CI Testing might be able to make use of this to validate that the
   data that comes out is not garbled (so, to help testing display
   support in an automated manner).

AngeloGioacchino Del Regno (32):
  dt-bindings: display: mediatek: dpi: Add MT8195 and MT8188 compat
  drm/mediatek: mtk_dpi: Add support for Pattern Generator in debugfs
  drm/mediatek: mtk_dpi: Use an array for pixclk factor calculation
  drm/mediatek: mtk_dpi: Move pixel clock setting flow to function
  drm/mediatek: mtk_dpi: Add checks for reg_h_fre_con existence
  drm/mediatek: Add support for MT8195 Digital Parallel Interface
  dt-bindings: display: mediatek: Add binding for MT8195 HDMI-TX v2
  drm/mediatek: mtk_cec: Switch to register as module_platform_driver
  drm/mediatek: mtk_hdmi_ddc: Switch to register as
    module_platform_driver
  drm/mediatek: mtk_hdmi: Convert to module_platform_driver macro
  drm/mediatek: mtk_hdmi: Unregister audio platform device on failure
  drm/mediatek: mtk_hdmi: Fix typo for aud_sampe_size member
  drm/mediatek: mtk_hdmi: Move audio params selection to new function
  drm/mediatek: mtk_hdmi: Disgregate function mtk_hdmi_audio_set_param()
  drm/mediatek: mtk_hdmi: Move plugged_cb/codec_dev setting to new
    function
  drm/mediatek: mtk_hdmi: Move N/CTS setting to new function
  drm/mediatek: mtk_hdmi: Move vendor/product strings to drm_bridge
  drm/mediatek: mtk_hdmi: Use dev_err_probe() in
    mtk_hdmi_dt_parse_pdata()
  drm/mediatek: mtk_hdmi: Move CEC device parsing in new function
  drm/mediatek: mtk_hdmi: Remove unused members of struct mtk_hdmi
  drm/mediatek: mtk_hdmi: Move output init to
    mtk_hdmi_register_audio_driver()
  drm/mediatek: mtk_hdmi: Use devm managed version of drm_bridge_add
  drm/mediatek: mtk_hdmi: Remove ifdef for CONFIG_PM_SLEEP
  drm/mediatek: mtk_hdmi: Remove goto in mtk_hdmi_clk_enable_audio()
  drm/mediatek: mtk_hdmi: Cleanup function mtk_hdmi_resume()
  drm/mediatek: mtk_hdmi: Improve mtk_hdmi_get_all_clk() flexibility
  drm/mediatek: mtk_hdmi: Split driver and add common probe function
  drm/mediatek: mtk_hdmi_common: Assign DDC adapter pointer to bridge
  drm/mediatek: mtk_hdmi_common: Add OP_HDMI if helper funcs assigned
  drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
  drm/mediatek: mtk_hdmi_common: Add var to enable interlaced modes
  drm/mediatek: mtk_hdmi_v2: Add debugfs ops and implement ABIST

Guillaume Ranquet (1):
  drm/mediatek: hdmi: Use regmap instead of iomem for main registers

 .../display/mediatek/mediatek,dpi.yaml        |    5 +
 .../mediatek/mediatek,mt8195-hdmi.yaml        |  154 ++
 drivers/gpu/drm/mediatek/Kconfig              |   19 +-
 drivers/gpu/drm/mediatek/Makefile             |    5 +
 drivers/gpu/drm/mediatek/mtk_cec.c            |    5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  311 +++-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   10 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    2 +
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  808 ++-------
 drivers/gpu/drm/mediatek/mtk_hdmi.h           |   14 -
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c    |  438 +++++
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h    |  198 +++
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c       |    2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c    |  403 +++++
 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h   |  263 +++
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c        | 1508 +++++++++++++++++
 16 files changed, 3354 insertions(+), 791 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c

-- 
2.47.0


