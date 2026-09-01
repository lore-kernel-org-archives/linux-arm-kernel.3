Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0D0C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 19:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZsE5CjXl/D3CBKsN7OjWaCNg6GQ1PvXfQNR08L8WDE=; b=ha4UjWZ1xmilWEa5aPq1Sv0nRs
	0dPHQdRX4qqkzruyrQ9XEj/LhUSfge2rq9wQ+jAFV0VTG1bh+TIbpd8iLRH6ODpWj4UNnH0Zzda3g
	QxVxJtVu6fiMlVAjPylEEQchhEUox2ddS/8fwMl28MBMtQm9ylWTPQJOqyAKOvTjuQXBiTETqftCO
	mGB+1IgOs2aKZUMunnExcbjHo2Kaw+lDWIoFxj/H3dkgbK3jfxvd4X2MvXz0TQJ8Pi4BVFkhVcUWJ
	EYM7QhvJXhuA5YkHtfyURkqsoAv2KQbxxAnnZ6TOrdZzvHNjUQY1s7HVEDgiTR3WCIQlzj9EqeShm
	27XyjGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ubp-0000000DGnd-1Lh4;
	Tue, 01 Sep 2026 19:57:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ubn-0000000DGmZ-2Eiy;
	Tue, 01 Sep 2026 19:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788292644;
	bh=4lP0oLI8PNKCXZUuWv4Wfm8oJux9jtJXdUCFqHxCj9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VD77AgkLO3N+rBCDKILwJT5zdr3N8Kx5DlgfAo7s3wk6Xms4WM1LhZGcHKaOfVpJ4
	 tejKkjfkD7zMWNSC97ZIQIUuaL1+ka3VAKhtKmSfy8oVnzpqIG91KAy0SwyBpWnKqI
	 doEmiDBUYUPObmPTSOgPDx0N+phyX6BXPXpwXaFJRiEyxQRbjwUo1eLEJHakZu0+pi
	 WleV4dBV3lZP+2u59VpYuIR+AoMcbDsecRvUDflIFZEYjcX8wwM6Qw/GlP/sQEzorU
	 ZkuZev4lxYmYNaABksOkPao2M/FHrQ10JvDlxJqQsrkFB6k/sHgVHQAvAkH6suCW3z
	 ki+k26F+s0T3g==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 98ACD17E0934;
	Tue, 01 Sep 2026 21:57:24 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 22:55:14 +0300
Subject: [PATCH v2 2/3] phy: rockchip: samsung-hdptx: Handle PHY config
 after module reload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-hdptx-ffe-v2-2-3a5922c76fc5@collabora.com>
References: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
In-Reply-To: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_125727_727779_C89F5FD6 
X-CRM114-Status: GOOD (  13.06  )
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

The pll_config_dirty mechanism introduced in commit aec3e4ce25da ("phy:
rockchip: samsung-hdptx: Handle uncommitted PHY config changes")
invalidates the clock rate in determine_rate() by resetting req->rate to
zero, ensuring CCF will invoke set_rate() to program pending PLL
configuration changes into hardware.

However, after a module reload cycle the PHY PLL clock gets
re-registered with CCF, which causes the framework's cached rate to also
be zero.  Setting req->rate to zero then has no effect, since CCF sees
no difference between the requested and current rates and skips calling
set_rate(), leaving the PLL unconfigured.

Address this by first computing the actual target rate from the HDMI
link configuration, and only then invalidating it when it matches the
CCF cached rate.

Fixes: aec3e4ce25da ("phy: rockchip: samsung-hdptx: Handle uncommitted PHY config changes")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 24ed0d7eb6f8..b03042ec9a84 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -2346,14 +2346,16 @@ static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
 	 * to ensure rk_hdptx_phy_clk_set_rate() will be always invoked.
 	 * Otherwise, restrict the rate according to the PHY link setup.
 	 */
-	if (hdptx->pll_config_dirty)
-		req->rate = 0;
-	else if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
+
+	if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
 		req->rate = hdptx->hdmi_cfg.rate;
 	else
 		req->rate = DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.rate * 8,
 						  hdptx->hdmi_cfg.bpc);
 
+	if (hdptx->pll_config_dirty && req->rate == clk_hw_get_rate(hw))
+		req->rate = 0;
+
 	return 0;
 }
 

-- 
2.55.0


