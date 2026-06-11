Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D63ECD98D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 23:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbsvwshOFA4ni9z4aItmQqYmWT4ZnPE17Dqh52vPQc0=; b=siX6oMj4UxnoEZn0Qol8DLfeER
	YXwH+k0waCHAAscSE/KWt28M4pAsYKBNxqZDfpl4VCF8ntwgyJqih0iH/rtkkOFrBPCXLVyb93Eey
	JlcvUOYlokpRqIRQN3DFIiNgJ7lIDNDX/kNVTi9hUnkcD7dAB+PnSbZ3rH+a7Q6JNLN2Z5Mc2MJtr
	ijb2zLckXTB9D4aV0xp2BcPttY9KWEOBvlYvYbfpH4NLUmKNUaz4PlTCjz7TggLZffo9NhCEBiwQW
	VjR8sBomIeBCRYIv1OBSsbYq1yQpjoZlMLY/GBnXmUDZAJa7bAYWY3xXoMB36Ot9rdgil1up2TJXq
	6PJkH+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXp5v-0000000ABQL-1ZbQ;
	Thu, 11 Jun 2026 23:45:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXp5n-0000000ABJz-3OBx;
	Thu, 11 Jun 2026 23:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781221544;
	bh=O76zc6hZ3sZD7icHCi6nwGcYj5BUYZJBnFM55uK6B8A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F4Zsa8B6gj4fnEh0XECOhKkm0iTLDAxD3EQpdKNiv1XWA41CoUsLUYjHh2f9Z4ULb
	 j+ys3NQ07mYjPPOfI/+mI6U3mCx1gEytulHEMkzpyN4oFzibwUbbnugHqnFcY7IOlA
	 UGbcxMZLDYGSfyYK/1nm9gbo+XHTduFyXnpTJ2+B7WTV41l5IbVwr5N0i8wSbEqDd1
	 RbHnazrKKELsdkiEtRJ3Ch6j3IXANAuCy/kP4LuVGHHLDrPSOaD+MNttyMV5QNJn74
	 gdM0rMg+P59IsFnn3Jv9HR5mhIMbIZaoOayHFHVaDHE0c7Dyuc3nZxAVGUPYykwtpL
	 a76ku9WT1+hiA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C20EA17E09A3;
	Fri, 12 Jun 2026 01:45:44 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 12 Jun 2026 02:45:21 +0300
Subject: [PATCH v4 2/8] phy: rockchip: samsung-hdptx: Prevent
 divide-by-zero when computing clk rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-hdptx-clk-fixes-v4-2-ce5e1d456cda@collabora.com>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
In-Reply-To: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_164547_995608_CA85C5D6 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

Calculating 'sdm' fraction in rk_hdptx_phy_clk_calc_rate_from_pll_cfg()
could trigger a divide-by-zero, as it uses div_u64() with a denominator
read directly from hardware: the values ropll_hw.sdm_deno,
ropll_hw.sdc_deno, ropll_hw.sdc_n, and ropll_hw.sdc_num are populated
from PLL registers which, in theory, could be left by the bootloader
uninitialized/misconfigured.

Provide the necessary sanitization to avoid trusting the hardware state.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260611-hdptx-clk-fixes-v3-0-67b1b0c00e16@collabora.com?part=1
Fixes: 3481fc04d969 ("phy: rockchip: samsung-hdptx: Compute clk rate from PLL config")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 710603afff86..8c044381b83a 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -2270,10 +2270,15 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
 
 	fout = PLL_REF_CLK * ropll_hw.pms_mdiv;
 	if (ropll_hw.sdm_en) {
+		val = 16U * ropll_hw.sdm_deno *
+		      (ropll_hw.sdc_deno * ropll_hw.sdc_n - ropll_hw.sdc_num);
+		if (!val) {
+			dev_dbg(hdptx->dev, "%s invalid ROPLL hw state\n", __func__);
+			return 0;
+		}
+
 		sdm = div_u64(PLL_REF_CLK * ropll_hw.sdc_deno *
-			      ropll_hw.pms_mdiv * ropll_hw.sdm_num,
-			      16 * ropll_hw.sdm_deno *
-			      (ropll_hw.sdc_deno * ropll_hw.sdc_n - ropll_hw.sdc_num));
+			      ropll_hw.pms_mdiv * ropll_hw.sdm_num, val);
 
 		if (ropll_hw.sdm_num_sign)
 			fout = fout - sdm;

-- 
2.54.0


