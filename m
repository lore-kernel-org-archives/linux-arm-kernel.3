Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7B1D63936
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 12:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HnDRgP1oCrQEz17uHTFgzD07idMOv5awJFo/1t7GCwQ=; b=qaEcX+FK2YyRDoHReiGpWtq7M/
	T2HeV2g5G66KID53FtEmSP7EvGkwMPZUIEkA2IulB5ySVxxnU1bWPodSh1V/TZV4y2m74zMLiRojZ
	9zbpVPJIJnMd8GZdEjeJd+yqs/Jt9n017cTU4tyiQZzM+82VXUb1/tiVWkq2LhsABL3YWY8YQqUVt
	W/hNa0apWvssvbdqu1jg3rGgLm/GqAC3mdlMroL7l3lvq44oqhlyYJAt4qTonALgKOdzoDRtzanaI
	uLNY4sbqbDA+2bhS98KUwdTC9eQWm6yFbbkkRnlT+cllguF7RKV53IjZa3tbrHXMip2rmsRjsmN/x
	Fiy0Vlkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDkBv-0000000FLZX-26gQ;
	Wed, 20 Nov 2024 12:52:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDk5H-0000000FK4g-2BPs;
	Wed, 20 Nov 2024 12:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732106726;
	bh=DlFjoO8RntcaAZI4sE6wRiR0Wf7VsiwXxZxdjrSEBn8=;
	h=From:To:Cc:Subject:Date:From;
	b=ZyLSPf8VjThZ7G0QsGZayt3/X9S50h/pZ/z6do3uRuCIb+bYX2L4ScNSfuNEe7nL8
	 k6HmxBnqclIMymkt8V81I3VEo74DfS/MNZZFne2YMqOm/xq1ZYxbOnVGxijobDK+vW
	 UyR3FG4BQmqse+E8gPny/GqEnSQmnH5Z3dbk5hL92upZor04b8wMYLp+oUoPLas3xo
	 WWDJJSjHM4UZY8OIQmjhiurHhiq0HMDZM5yYqhxQ5x0O0rLG6HQpUAOykLDSYMqy7b
	 U8qKEZWsiquAD2Ck92X6Cfug+Ryd9AgmgAp9gWsWmNXw7qtfPm6wRzfeJDA6JpIbr9
	 bQZN0xekohbng==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34E4C17E3661;
	Wed, 20 Nov 2024 13:45:25 +0100 (CET)
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
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/7] drm/mediatek: Add support for HDMIv2 and DDCv2 IPs
Date: Wed, 20 Nov 2024 13:45:05 +0100
Message-ID: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_044527_699308_4F43BB22 
X-CRM114-Status: GOOD (  11.41  )
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

This series adds support for the HDMI-TX v2 Encoder and DDCv2, as found
in MT8195, MT8188 and their variants.

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

AngeloGioacchino Del Regno (6):
  dt-bindings: display: mediatek: Add binding for HDMIv2 DDC
  dt-bindings: display: mediatek: Add binding for MT8195 HDMI-TX v2
  drm/mediatek: mtk_cec: Switch to register as module_platform_driver
  drm/mediatek: mtk_hdmi_ddc: Switch to register as
    module_platform_driver
  drm/mediatek: mtk_hdmi: Split driver and add common probe function
  drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188

Guillaume Ranquet (1):
  drm/mediatek: hdmi: Use regmap instead of iomem for main registers

 .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    |   41 +
 .../mediatek/mediatek,mt8195-hdmi.yaml        |  150 ++
 drivers/gpu/drm/mediatek/Kconfig              |   19 +-
 drivers/gpu/drm/mediatek/Makefile             |    5 +
 drivers/gpu/drm/mediatek/mtk_cec.c            |    5 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  843 ++--------
 drivers/gpu/drm/mediatek/mtk_hdmi.h           |   14 -
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c    |  375 +++++
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h    |  200 +++
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c       |    4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c    |  401 +++++
 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h   |  249 +++
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c        | 1460 +++++++++++++++++
 13 files changed, 3060 insertions(+), 705 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c

-- 
2.47.0


