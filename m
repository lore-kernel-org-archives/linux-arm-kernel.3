Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B42CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 13:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NOYL0uD62hKk28WG4gpRQ/Og2WNGiOzJLp810Y1iXv0=; b=dNT6m6ys1CrnxfDamtbpIfjlMf
	efO2Axq43GE/cO3U2GNgkkYMwcBBirwgg01jfdqVVqzmjesaUm8cJmOCNFoA8KUCURGDhjuJAuyqL
	1aHK7gRubv45xGX4XNUmdmdF/I4YplN7btTJR/RZTAoI1dkdnmn28+IVtr5MrhLZI4bIOuoiAKU6P
	UoUQB88062eLgRFUI5HAEFqYMzYjzEAteANUs1O/ftbpdcMg0heJK/601RcF8mETZIy/G1Y4D3g/7
	InwsEJTg6yhoTAZjg+gkersX4HDb1gA6d+RCCmguV7ag8M5XwoXNXmhvg9BTpdAa7KM7yU453I3q7
	nFvQof1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6UHA-00000003wp9-2URE;
	Wed, 08 Oct 2025 13:32:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6UH7-00000003woQ-3nIv;
	Wed, 08 Oct 2025 13:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=NOYL0uD62hKk28WG4gpRQ/Og2WNGiOzJLp810Y1iXv0=; b=QUlT0w9nR/T9hYkLxnW0QicOxh
	gjEb+c/9oV8pUlTT0b6Wyf+ooTwWWZZZg32QDTbMDXNhjW88OJoZxCcaJkP2fEqNw9t5TjXNCKGnQ
	TFBoeebPG9qGqDLWIPvpyyrt/FHAW91+Dzs3iTD1O7kIypK4p8Bvz6itB5iMpeQuZwecR8TKM9P/E
	9gh/trrYJpJNEkKXP+e8JhDYHPa7CM0sMJyTUs/OfRvcDLSnJbG0KFSjKb4XG7SKIapNbwzSz+ICA
	xurFyZPzPSOesXSOpCNzcVDFJj97I8GMljL0qDUeA+nA20GFimqQYSjiQq59z34ukRzmoj22WnVZj
	JpGdSUUQ==;
Received: from i53875a0d.versanet.de ([83.135.90.13] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v6UGt-0002uq-S4; Wed, 08 Oct 2025 15:31:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	zhangqing@rock-chips.com,
	sebastian.reichel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	stable@vger.kernel.org
Subject: [PATCH] clk: rockchip: rk3588: Don't change PLL rates when setting dclk_vop2_src
Date: Wed,  8 Oct 2025 15:31:35 +0200
Message-ID: <20251008133135.3745785-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_063213_962776_5F048F31 
X-CRM114-Status: GOOD (  15.51  )
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

dclk_vop2_src currently has CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT
flags set, which is vastly different than dclk_vop0_src or dclk_vop1_src,
which have none of those.

With these flags in dclk_vop2_src, actually setting the clock then results
in a lot of other peripherals breaking, because setting the rate results
in the PLL source getting changed:

[   14.898718] clk_core_set_rate_nolock: setting rate for dclk_vop2 to 152840000
[   15.155017] clk_change_rate: setting rate for pll_gpll to 1680000000
[ clk adjusting every gpll user ]

This includes possibly the other vops, i2s, spdif and even the uarts.
Among other possible things, this breaks the uart console on a board
I use. Sometimes it recovers later on, but there will be a big block
of garbled output for a while at least.

Shared PLLs should not be changed by individual users, so drop these
flags from dclk_vop2_src and make the flags the same as on dclk_vop0
and dclk_vop1.

Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the RK3588")
Cc: stable@vger.kernel.org
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3588.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 1694223f4f84..cf83242d1726 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -2094,7 +2094,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	COMPOSITE(DCLK_VOP1_SRC, "dclk_vop1_src", gpll_cpll_v0pll_aupll_p, 0,
 			RK3588_CLKSEL_CON(111), 14, 2, MFLAGS, 9, 5, DFLAGS,
 			RK3588_CLKGATE_CON(52), 11, GFLAGS),
-	COMPOSITE(DCLK_VOP2_SRC, "dclk_vop2_src", gpll_cpll_v0pll_aupll_p, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
+	COMPOSITE(DCLK_VOP2_SRC, "dclk_vop2_src", gpll_cpll_v0pll_aupll_p, 0,
 			RK3588_CLKSEL_CON(112), 5, 2, MFLAGS, 0, 5, DFLAGS,
 			RK3588_CLKGATE_CON(52), 12, GFLAGS),
 	COMPOSITE_NODIV(DCLK_VOP0, "dclk_vop0", dclk_vop0_p,
-- 
2.47.2


