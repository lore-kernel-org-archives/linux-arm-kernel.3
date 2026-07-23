Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD27C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4ilmWY2enKselw2k35Cbndo23DautpbIW8/BRS8s5Q=; b=ocpie2nSbT1vJIl4wUTh8X3GJH
	NxHeDYBCVDTv6kfza1HlB+953BkTXKbOlmHk4SsNX3eYdU2/ZH6UHxrcfuKxq40t+lAzRV0uUfqgH
	yYEYLKJ7OoQvY6cmXVMTuZeYwlUH7yVhpkyN9BZ2SpngxY6QVE2NA/EXtdZVGWkU/3JS+mVWwpTxu
	XuARxTvuCErQLqMelhkN/XGt194eZlRDLxnPwBpRjDWlAW2aeg4UDGkzNdV6uQr8VZRXsDFyn0vzv
	/4CAeBJR47YsKMjUr5IgcMm/9nzamGvyAPkLDtEed6+rlI/tvyzgJ2akbVxgy41M+vtBc+JfUTE6F
	2YnQW/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzJ2-0000000Eyve-0ykv;
	Thu, 23 Jul 2026 19:42:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzIk-0000000Eyik-4AA2;
	Thu, 23 Jul 2026 19:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784835708;
	bh=3wiA+YdhNokfHpUT/YTfeE6P2ehlPZVLJt7TZ79Hbic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qm1IYy2TtPqOyjF109D4Iw36QfsgGfXb1gZA/RsciOb2Coce0le/kCY5R1eAEsMQ7
	 UuplZPRkZRHUILOhZ7dFyCED8HEsA6/UCFxBhv4epPQcp+bcuyNa4usjUitE5NxM7F
	 Q6YTEKfDS9Rhu16RkyaxYwHHEZWBAeqBqfrkDMEl6UCexIxVhWoPAuHQfY3LNAwyOj
	 FtkdbUuAjHtRXy9mwCyLm/T/sCqPfhH3mbS1BIgIv/U9WWo53MuDZXb86urEu/NfxH
	 VwbY3WwYVnbLVZQKZe6xfFaxfkrkaasROvlCnWDgDdgnjXPs5b6HnlhOCApS9oR7UC
	 1/XJgEElJijYQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B2FAD17E0CA6;
	Thu, 23 Jul 2026 21:41:48 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 22:41:46 +0300
Subject: [PATCH v5 03/10] phy: rockchip: samsung-hdptx: Guard against clk
 rate integer underflow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hdptx-clk-fixes-v5-3-8e786067865f@collabora.com>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
In-Reply-To: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_124151_181562_4811EB4D 
X-CRM114-Status: GOOD (  11.53  )
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

The 'fout' subtraction in rk_hdptx_phy_clk_calc_rate_from_pll_cfg()
could result in an integer underflow, if the hardware registers are
misconfigured or contain uninitialized values, such that the computed
sigma-delta modulator offset sdm exceeds the base frequency fout.

This might lead to an absurdly high clock rate being returned to the
Common Clock Framework, with unpredictable effects on downstream clk
consumers.

Provide the necessary sanitization to avoid trusting the hardware state.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260611235702.0E9691F000E9@smtp.kernel.org/
Fixes: 3481fc04d969 ("phy: rockchip: samsung-hdptx: Compute clk rate from PLL config")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 44e99343f249..fcf04e9814cc 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -2280,10 +2280,16 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
 		sdm = div_u64(PLL_REF_CLK * ropll_hw.sdc_deno *
 			      ropll_hw.pms_mdiv * ropll_hw.sdm_num, val);
 
-		if (ropll_hw.sdm_num_sign)
+		if (ropll_hw.sdm_num_sign) {
+			if (sdm > fout) {
+				dev_dbg(hdptx->dev, "Invalid ROPLL hw state: sdm > fout\n");
+				return 0;
+			}
+
 			fout = fout - sdm;
-		else
+		} else {
 			fout = fout + sdm;
+		}
 	}
 
 	return DIV_ROUND_CLOSEST_ULL(fout * 2 * 8, ropll_hw.pms_sdiv * 10 * bpc);

-- 
2.55.0


