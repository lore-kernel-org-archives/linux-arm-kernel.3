Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FDCC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtzYx8SOj9vSV4mcdey89Xnwt2ndYvQMN7wZmCbv0MM=; b=kQ6BDQYHAmuTlJPPn8Jzu1EG5A
	SXk0RwggleVNVMuDaOo+FbDGkFRuxfCWK3HK1+8QkcY5ufwQ71rYuufkG7Qk3ac37gynVgQMt9Dp8
	cI3fb1gsm4s8zY7DfwTM4WQ3By3DEk+pqicxJHR0572KftIpoSUzEn4ND+VNVr6p7bvpWbXkz4yFk
	W4pHqfulq4ZhrZwRIik6Mp+kMm/K/nHpSCE6wHsZGQmxXuzA4KY1UxYjbyobhF1s8tRS7LW6bsKoN
	MKzRbxWHrL9TNpAh2lb8vVJS/1aLDda+/l2BFo+6ueiklwvX3uQoe6GrS58UwYumuBMR2iGLRQiXk
	SKDrjzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vsZ-0000000G2wH-2aGJ;
	Fri, 11 Sep 2026 07:40:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vsU-0000000G2uK-1Ljc;
	Fri, 11 Sep 2026 07:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789112452;
	bh=0oqwV4n087TkcdE7smt77VXoCFhNFiNEr2EbMxZFD4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=po0tBroqkvLelMZmwCQ9WY3xbdOJ3a40sY2PKdyRNnUl11BmACIbJfP+PbLHdMnS+
	 ZFTMHhqawslg1E4RjkaQrOpTLVLjNRsD4Ey8HPiYJTc0uFPeS+k4RNM/oTIURRepZY
	 O61bREKmshLrFzaMw8J7QPi8z00IX5sc4EPSbcQxjHPUuVlJHMYrRhjvHors3rvN+n
	 acbB3f7u8pRVWgEJwJLU256wcO8EeS7+heaZKdCfDk/gOmCX1xR9k+kk842602Arxm
	 GXKC7alwI8+SPk3LMmPNnT59vGaGuEWW/9H1XE4vgKb9twl6xP1OdFc3yNqJq+G2Gy
	 pdvMnP/DiJcxw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A7E9917E0CA6;
	Fri, 11 Sep 2026 09:40:51 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: vkoul@kernel.org
Cc: chunfeng.yun@mediatek.com,
	p.zabel@pengutronix.de,
	chunkuang.hu@kernel.org,
	neil.armstrong@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	granquet@baylibre.com,
	justin.yeh@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v2 2/2] phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit ratio setting
Date: Fri, 11 Sep 2026 09:40:15 +0200
Message-ID: <20260911074015.9994-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911074015.9994-1-angelogioacchino.delregno@collabora.com>
References: <20260911074015.9994-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_004054_533329_FB5437ED 
X-CRM114-Status: GOOD (  12.02  )
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

The comment in the mtk_phy_tmds_clk_ratio() function clearly and
correctly explains that the TMDS ratio has to be 1/10 for data
rates under 3.4Gbps, and 1/40 over that.

Unfortunately though, the TXC_DIV register setting was wrong, as
in value 3 means to divide by 8 and, in order to achieve the in
spec 1/40 (tmds) data rate, this has to divide by 4 instead!

Add definitions for the TXC_DIV register values clearly explaining
the meanings (DIV2, DIV4, DIV8), and program the correct, DIV 4,
value to the register in mtk_phy_tmds_clk_ratio().

This fixes out of spec clocking and, with this change, SoCs using
the MT8195 class HDMI PHYs can now successfully be configured to
output 3840x2160@60Hz over HDMI.

Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 2 +-
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index e6ee8e080022..a4bc1268946d 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -36,7 +36,7 @@ mtk_phy_tmds_clk_ratio(struct mtk_hdmi_phy *hdmi_phy, bool enable)
 	 * clock bit ratio 1:40, under 3.4Gbps, clock bit ratio 1:10
 	 */
 	if (enable)
-		mtk_phy_update_field(regs + HDMI20_CLK_CFG, REG_TXC_DIV, 3);
+		mtk_phy_update_field(regs + HDMI20_CLK_CFG, REG_TXC_DIV, VAL_TXC_DIV4);
 	else
 		mtk_phy_clear_bits(regs + HDMI20_CLK_CFG, REG_TXC_DIV);
 }
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h
index e26caaf4d104..58800d7659ca 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h
@@ -17,6 +17,9 @@
 
 #define HDMI20_CLK_CFG 0x70
 #define REG_TXC_DIV GENMASK(31, 30)
+#define VAL_TXC_DIV2 1
+#define VAL_TXC_DIV4 2
+#define VAL_TXC_DIV8 3
 
 #define HDMI_1_CFG_0 0x00
 #define RG_HDMITX21_DRV_IBIAS_CLK GENMASK(10, 5)
-- 
2.55.0


