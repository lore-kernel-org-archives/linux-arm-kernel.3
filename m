Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE20D743CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 17:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAUih0Mkszte9aiN7a8UUEUbUpUNBM3lVZGf6CK9gUM=; b=afypySYjY2Josd6r2Z5ir4798a
	xF02tjMGs553bAnQND3hqWlNCS8VrkipiVJo/Joy6w0XpKCUx8F2E4LKAghwzKoSwjDwmRh/scVnV
	9KqtTVxCREgy+5TExiacTmSwvdcJXTBzw+jC3FCud94lDLcLf7bP+36wVWVkcaKaHoG2LqgNRcZmf
	qKJoLlKjhXXAeWzJ/HIw1vLmJWthRj0pxz7LkrYSt86yaBcJYpcGF0+ecuhkmt1qhyDsEfYugxdgr
	Lr6s5d8vLs08auuCR6HkwtV59ijqIEdulFycSFhc7WVLQbW+EQLNewLWkQzHlol34Kzk7XKcCeh5x
	5okJP+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEBHW-00000000aTT-1g1z;
	Thu, 21 Nov 2024 17:47:54 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEBBX-00000000ZPe-3fKY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 17:41:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 657C62000F;
	Thu, 21 Nov 2024 17:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732210902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yAUih0Mkszte9aiN7a8UUEUbUpUNBM3lVZGf6CK9gUM=;
	b=YXANeOT4VuQZKlUaFu1md2+8wKVPZNqSyV6u5suvZvIIrDJiDs/LUj13Wt89/OPEjRHOdq
	nO7m0KyEqW9lvmbiHodz6wikxK6g2+GOCZUpv/vNZ3SLeZoBavJDaigf3xgKj3YcpOjkfv
	AWmQks+Pez8OMjPWuGensS8q9N0MfyN/RhODto4VC1uYBiNrgmYwxcEI7IqQNQTbkASTdc
	dDalVzIMsMkQEZuTZKL+3LG9wz11qD7ZWlh0d4NvnvtlnDJUvpOEXrFDLhhfwNaFA4mrir
	tpz0WxKAshbYlKBcV3QDfWrMq64FXzEZXz7x7vHHgOf9r00+s5X1AfoJKnpvWA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 21 Nov 2024 18:41:15 +0100
Subject: [PATCH 5/5] clk: imx: imx8mp: Prevent media clocks to be
 incompatibly changed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-ge-ian-debug-imx8-clk-tree-v1-5-0f1b722588fe@bootlin.com>
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
In-Reply-To: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ying Liu <victor.liu@nxp.com>, 
 Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ian Ray <ian.ray@ge.com>, 
 stable@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_094144_218949_F3905561 
X-CRM114-Status: GOOD (  12.73  )
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

Having set the CLK_SET_RATE_PARENT flag to gain accuracy to the i.MX8
media related clocks (media_ldb, media_disp1_pix, media_disp2_pix) broke
most simple setups using the LDB and one LCDIF. Indeed, pixel
frequencies being set first, the top level PLL (video_pll1) was tuned to
achieve the perfect frequency, and the media_disp*_pix divisor was set
to 1 (acting like a passthrough). But shortly later, when setting the
LDB clock to 7 times the pixel clock, the PLL machinery was recomputed,
leaving the pixel divisors untouched. As a result, the attempted factor
of 7 between the two clocks could never be observed.

Set the CLK_NO_RATE_CHANGE_DURING_PROPAGATION flag to the LDB and LCDIF
pixel clocks to force them to be kept as close as their initial target
rate as possible across subtree walks.

Fixes: ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
--
All patches in this series must be backported for this one to apply.
---
 drivers/clk/imx/clk-imx8mp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 2e61d340b8ab7f626155563c46e0d4142caf3fa9..2b916a4df97141dce46cefeb22ff584178a3929b 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -547,7 +547,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_AHB] = imx8m_clk_hw_composite_bus_critical("ahb_root", imx8mp_ahb_sels, ccm_base + 0x9000);
 	hws[IMX8MP_CLK_AUDIO_AHB] = imx8m_clk_hw_composite_bus("audio_ahb", imx8mp_audio_ahb_sels, ccm_base + 0x9100);
 	hws[IMX8MP_CLK_MIPI_DSI_ESC_RX] = imx8m_clk_hw_composite_bus("mipi_dsi_esc_rx", imx8mp_mipi_dsi_esc_rx_sels, ccm_base + 0x9200);
-	hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_SET_RATE_PARENT);
+	hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_SET_RATE_PARENT | CLK_NO_RATE_CHANGE_DURING_PROPAGATION);
 
 	hws[IMX8MP_CLK_IPG_ROOT] = imx_clk_hw_divider2("ipg_root", "ahb_root", ccm_base + 0x9080, 0, 1);
 
@@ -609,9 +609,9 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_USDHC3] = imx8m_clk_hw_composite("usdhc3", imx8mp_usdhc3_sels, ccm_base + 0xbc80);
 	hws[IMX8MP_CLK_MEDIA_CAM1_PIX] = imx8m_clk_hw_composite("media_cam1_pix", imx8mp_media_cam1_pix_sels, ccm_base + 0xbd00);
 	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
-	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
+	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT | CLK_NO_RATE_CHANGE_DURING_PROPAGATION);
 	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
-	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite_bus_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);
+	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite_bus_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT | CLK_NO_RATE_CHANGE_DURING_PROPAGATION);
 	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite_critical("mem_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
 	hws[IMX8MP_CLK_MEDIA_MIPI_TEST_BYTE] = imx8m_clk_hw_composite("media_mipi_test_byte", imx8mp_media_mipi_test_byte_sels, ccm_base + 0xc100);
 	hws[IMX8MP_CLK_ECSPI3] = imx8m_clk_hw_composite("ecspi3", imx8mp_ecspi3_sels, ccm_base + 0xc180);

-- 
2.47.0


