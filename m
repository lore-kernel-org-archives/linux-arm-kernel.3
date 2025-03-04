Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F46C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 02:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zb005O7gBqYzcxroc8vvDABbfmbxrxke73pixyZwNW0=; b=0+ERJGVvmIBO8VVa6SGTBsST+6
	OHmUtU6cTzERYWSkDnIyupoywQccvwBWOatKot1W0wwPMC4UeLg7dLJt6V+ZCcBm6qdnmMzkZ7fGe
	1RCZ2XLluY6rL5JpPZ2AYYfhKicdYYmbLQr9uTHbM6aRCbkIvc1mwCizdVj1MFmSO6+HJbwdzcPsB
	1RE6Wn7FNhUVJ58oMRwymT1FOWyDsIX9GLqDub7Rbn80YO9W0lwHBYsG8P1yoC/cph4UZF90XC4ki
	xRj/ZYaqBJeKOs/JEttCnYlpdlzEQWVtua02axE861AIb59kbj78nW7xKxXr5Kkh+ZEPsAFwIEAaX
	NWHaG2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHgG-00000002rKP-2SkX;
	Tue, 04 Mar 2025 02:06:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHKY-00000002o2M-07Gy;
	Tue, 04 Mar 2025 01:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741052660;
	bh=JVO6B5huh7eGDo+k3A1fG3SKCxGyB11XeWKMxuuZ+rw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qvKZ515NVdudG5/INUpwF68Tb5cdYb37WTMmQAaQs7oDwMfuxnf292TUulUtMR6tB
	 xr1OeuVrmBfAaJyTiIf47CFveoq9ATnHEhjexNaflUkOtpC3/cnEf0fIWJ0/GnWRQK
	 VH6s/axpAiBD412eAjjfVCVxeCa9OED/MXWDm7fLqqvtsxdT6lHI+2BChJYnlhNqb4
	 Lgz6ygplXtbqCDLXRIoByF7Wa7Lx0z+3YqRbXdFG+fQsfvJqSHZrdEDNHQ8uwhD5Zv
	 USjmJBjdd7CDyL2QtGLA2fsz9W0hZABcQP6/TAk84kjnrU7z3zSOuql7q6buI83nx1
	 ehopYz/8WkOoQ==
Received: from localhost (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id CEB6B17E0FA7;
	Tue,  4 Mar 2025 02:44:19 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 04 Mar 2025 03:44:02 +0200
Subject: [PATCH v4 03/12] phy: rockchip: samsung-hdptx: Fix clock ratio
 setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-phy-sam-hdptx-bpc-v4-3-8657847c13f7@collabora.com>
References: <20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com>
In-Reply-To: <20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_174422_246636_0E76A354 
X-CRM114-Status: UNSURE (   9.80  )
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

The switch from 1/10 to 1/40 clock ratio must happen when exceeding the
340 MHz rate limit of HDMI 1.4, i.e. when entering the HDMI 2.0 domain,
and not before.

While at it, introduce a define for this rate limit constant.

Fixes: 553be2830c5f ("phy: rockchip: Add Samsung HDMI/eDP Combo PHY driver")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index f88369864c50e4563834ccbb26f1f9f440e99271..cf2c3a46604cb9d8c26fe5ec8346904e0b62848f 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -320,6 +320,7 @@
 #define LN3_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
 #define LN3_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
 
+#define HDMI14_MAX_RATE			340000000
 #define HDMI20_MAX_RATE			600000000
 
 enum dp_link_rate {
@@ -1072,7 +1073,7 @@ static int rk_hdptx_ropll_tmds_mode_config(struct rk_hdptx_phy *hdptx,
 
 	regmap_write(hdptx->regmap, LNTOP_REG(0200), 0x06);
 
-	if (rate >= 3400000) {
+	if (rate > HDMI14_MAX_RATE / 100) {
 		/* For 1/40 bitrate clk */
 		rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_lntop_highbr_seq);
 	} else {

-- 
2.48.1


