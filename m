Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE99C44514
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bbYx5wM4+v4jl1l2ErSFT++GGLWW/aC90Uim4huHbkM=; b=t5bsbArPVyeq056r975ljaD2A3
	1XOS/fmFF9SP2zbMGhQ12BijSVYZuTXO4mwHpRowE607oNQpu8SuchF5hYSnDz/RxJrzXAtE3/5i2
	gP74PtSqGgg8Erlg8XOOzp84k9DvsMvpYWtHFmxv17nj+P+0xeyGQUFz8Etvb0HiyVTVG2udicdZ7
	yQ8BNSe+r8yQPOYrY7+P5tz2tgd/fnl15kG6uvEbIUsRbo9uwz0JrMfJoMk8FStL5zIorC1amj5/O
	+WvNRlWKRLyCcUhTe0KuGYYuFAx7GnwD/kOb7Wjga/wwD/tfB/DmIvgn+QifnmtodMm1sJF6m/qf0
	9nVUYGYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk06v-0000000F1NR-3ETh;
	Wed, 15 Jul 2026 13:57:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk06n-0000000F1Gp-4BgP;
	Wed, 15 Jul 2026 13:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784123826;
	bh=mLEpbIZzyf5QF4ZJIobPOSNnmQwDc249pvOWkW0Ykmk=;
	h=From:To:Cc:Subject:Date:From;
	b=ToviEbuX2mrmrvo321X2X54+5Yi281p15CXMi4CdL2ReZhDOFa/Hl1E5v6X1IRosD
	 4bYGuj7awPg0DzmY2c1AhnUxTKRQTti8w0tWpIQnuhsB/CSU5ZlW4ZVgFgSTUcU1+M
	 IyA/CLuAcR84mEvfjkd7reW1lHjVkSoiyXwa6ZoyYkKNkCnr4rG++xhOh1hjQOcpY5
	 JZKT8YUYZZeq0BpeZDZpcar+tP5WRFK/MDFyZHsmaSZc6RXjtnBon5TZAsbdBguhMf
	 x9BuH9WnLoz5hzBDDh6TTinlwVd7AYKjDTDxBiFU7mydNY80WQaLYtuyRfHT8sbC+G
	 Yu0af3elKyfmA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E890A17E0928;
	Wed, 15 Jul 2026 15:57:05 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v6 00/11] drm/mediatek: Add DSC, WDMA, MT8189/96 DSI support
Date: Wed, 15 Jul 2026 15:56:52 +0200
Message-ID: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_065710_203423_9BEDC161 
X-CRM114-Status: GOOD (  16.63  )
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

Changes in v6:
 - Fixed .remove function name in wdma (ugh...)

Changes in v5:
 - Clarified commit description for WDMA binding compatibles addition
   explaining why Dimensity 1200 is not compatible with MT8173
 - Added missing mediatek,mt8189-dsi compatible in mtk_drm_drv.c
 - Added fix in mtk_dsi for failing device_reset_optional() producing
   a possible use-after-free issue

Changes in v4:
 - WDMA: Delete the .remove() callback from WDMA as not needed anymore
 - WDMA: Add comments explaining no bus errors will happen if writing
   to INT_ENABLE, INT_STATUS registers while unpowered or unclocked
 - Return error in mtk_wdma_wb_atomic_check() error conditions, oops!
 - DSC: Fix dsc_pad_num calculation (missing parenthesis...)
 - DSI: Change dsc slice check error to dev_dbg instead to avoid spam
 - DSI: Correctly cleanup dsi->dsc upon component_add failure
 - DSI: Make sure the CKTX_CKL_WC register is correctly programmed in
   DSI w/DSC case

Changes in v3:
 - Changed mtk_dsi DSC implementation to use a different DSI_PS
   setting function for compressed or uncompressed, as the dsc one
   is way simpler than the regular one and becomes way shorter
 - DSC: Fixed missing PPS 19 register write
 - DSI: Anticipated call to devm_pm_runtime_enable() to before
   registering the DSI Host interface
 - DSI: Anticipated installing IRQ handler before registering the
   dsi host interface, which wasn't a problem before, but now it
   would be one because the interrupt is being enabled when binding!
 - DSI: Fixed some possible calculation overflows that may happen in
   MT8189 and MT8196 because of the higher supported resolutions
 - WDMA: Use devm variant of pm_runtime_enable()
 - Change WDMA interrupt handler to allow signaling WB complete even
   if there is no specific vblank callback installed to avoid very
   long timeouts (in any case, WB is complete for real even if there
   is no vblank_cb, just a bit useless without, but still complete)
 - Fixed WDMA register writes as register id was in function signature
   for mtk_wdma_ddp_write_dst_addr() but the function itself never
   used it in DISP_REG_WDMA_DST_ADDRX() macro

Changes in v2:
 - Rebased on next-20260706

This series adds support for:
 - Display Stream Compression (DSC) for DSI and DisplayPort for both
   legacy (8188/92/95 and others) and for Kompanio Ultra MT8196 SoCs
 - Write DMA (WDMA) Engine (for legacy only at this time) as a step
   to enable Writeback support (coming later with a restructuring of
   the entire mediatek-drm driver)
 - Newer MIPI DSI IP revisions, found in MT8189 and MT8196 SoCs


AngeloGioacchino Del Regno (11):
  dt-bindings: display: mediatek: dsc: Add MT8196 compatible
  drm/mediatek: Implement Display Stream Compression support
  dt-bindings: display: mediatek: dsi: Document MT8189 and MT8196
  drm/mediatek: mtk_dsi: Cleanup encoder if reset fails during bind
  drm/mediatek: mtk_dsi: Enable interrupt at component bind time
  drm/mediatek: mtk_dsi: Transfer register offsets to per-SoC const
  drm/mediatek: mtk_dsi: Add support for MT8189
  drm/mediatek: mtk_dsi: Add support for MT8196
  drm/mediatek: mtk_dsi: Enable PM Runtime on probe
  dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs
  drm/mediatek: Add Write DMA (WDMA) Engine for Writeback support

 .../display/mediatek/mediatek,dsc.yaml        |   4 +-
 .../display/mediatek/mediatek,dsi.yaml        |   2 +
 .../display/mediatek/mediatek,wdma.yaml       |   5 +
 drivers/gpu/drm/mediatek/Makefile             |   2 +
 drivers/gpu/drm/mediatek/mtk_crtc.c           |  21 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  64 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |   9 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  29 +
 drivers/gpu/drm/mediatek/mtk_disp_dsc.c       | 455 ++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_wdma.c      | 628 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  10 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 801 ++++++++++++++----
 13 files changed, 1842 insertions(+), 190 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_dsc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_wdma.c

-- 
2.54.0


