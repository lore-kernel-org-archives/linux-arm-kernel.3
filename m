Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283DDC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hB7TQP/yWRkDi1/QJ/+lKJDwgaKT669U5+4id6n0y5s=; b=AtuyuG3RHVSerbbGLR1HPELcj2
	a1oRhwVijCrBTKyWM3Wvx+ve6qPMLPucQcIXMa3TMLcX8t6aqmTt9sSuvdxPjcxKXve0IqXhh3K1+
	lCpRgmCr9MOhl5rvzH1jb9SF5QLySQmuZTcs4KlwHy4WhMM3ntBzihqKVoImAtMQa+8jcxCCsJ8LV
	39YxGUx/sHuLyvqFHexmVneNH1ih2cARCoyCphdRH+845VLKVtLbjuUxGqIswGK3McJNVQ97e22L0
	3ghaDHB+Sobd21JA/DV13ghjQtOn0UtZkCVtOUGNw/1s/uYw2112poNzdCxiBXG71Xy2ZDPUwaWuf
	9OVZpTmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWKq-00000005vNM-0hIM;
	Tue, 18 Mar 2025 12:46:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWBq-00000005tec-3hdL;
	Tue, 18 Mar 2025 12:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742301421;
	bh=MSCgJHnqBdDA4qxZOqPsxwqrzmRwhDa2/mwcEUsiVXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MpgWLLb/TDUbWKm9oOWyJvdOK58hkCExEEJIA1PFVLDa2gO5BrnOOgo+D27OSU8ac
	 DhFKAwZOV9+rKLDcICnG14oCEOf8BGXmalZgdhxJ/9VFgppek7iIMXjRWal6v+eKfg
	 rrUGFegl5AVbnkbnR3+RHgehVPeP0tqj4BF5Yb3jpftcuQtUbo/p2aQmakIgkpkjCa
	 MS5+lUHlwkardOEuHHpNxrGqO9jbKsLiQb62k69gZhUJkU68jPF3IYvl7n5mvLFPZC
	 9ajtCaTTXHWgS8uwNv+oiLLXoRbuuMmoljrvaE3oq2XAMR+RoPGLy+AH8e8Nk8zw2G
	 mO4oKk8vZNZFA==
Received: from localhost (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 32B8B17E0FE7;
	Tue, 18 Mar 2025 13:37:01 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 18 Mar 2025 14:35:38 +0200
Subject: [PATCH v6 04/14] phy: rockchip: samsung-hdptx: Do no set
 rk_hdptx_phy->rate in case of errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-phy-sam-hdptx-bpc-v6-4-8cb1678e7663@collabora.com>
References: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
In-Reply-To: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_053703_068785_CEC9CF11 
X-CRM114-Status: GOOD (  10.25  )
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

Ensure rk_hdptx_ropll_tmds_cmn_config() updates hdptx->rate only after
all the other operations have been successful.

Fixes: c4b09c562086 ("phy: phy-rockchip-samsung-hdptx: Add clock provider support")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 34a7ef20936422b540b699f1acba44ca465501b7..d0989dc5a0173af4de4521e690c3f7b6cc343402 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1006,9 +1006,7 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
 {
 	const struct ropll_config *cfg = NULL;
 	struct ropll_config rc = {0};
-	int i;
-
-	hdptx->rate = rate * 100;
+	int ret, i;
 
 	for (i = 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
 		if (rate == ropll_tmds_cfg[i].bit_rate) {
@@ -1063,7 +1061,11 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
 	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_EN_MASK,
 			   FIELD_PREP(PLL_PCG_CLK_EN_MASK, 0x1));
 
-	return rk_hdptx_post_enable_pll(hdptx);
+	ret = rk_hdptx_post_enable_pll(hdptx);
+	if (!ret)
+		hdptx->rate = rate * 100;
+
+	return ret;
 }
 
 static int rk_hdptx_ropll_tmds_mode_config(struct rk_hdptx_phy *hdptx,

-- 
2.48.1


