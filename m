Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B00EEB7ECF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 12:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1J6bBElKC5kc3fK81QWrSYx8rE0smFFIJm9isvrGyE=; b=Flt9LZ8fSpHWqaRyPGMPDfrSg7
	8SMSZRlDBLKgbPL2CI3t3X7eyNuFIOX73tkpUBek9U/2Dl8TkV1kof+EMIQSz1apKo2NJWPvdBhpv
	lNoP6gMxR2LOIUZjo9lvjSk0DaaPRt5we/EFJ2grR3YJ0vHWfTppigk9qqL94LJz4QbOzkpsOPtSC
	KI0n85q28CU4nIhsvpiN885DMJDUlPHBr1qV6VtjOKthiY72Flo+TtsdA+LSTPXi7WV778hMQhGBj
	mi6Af2eE5zlc1keq+87F+gw9eZ1E4Gq1ZasHpsqJ9JVmCmjLUoiyIdqHJk1gxsdeHYfC9llw2D0rW
	SS/GqLeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxl7s-0000000HA91-4BQp;
	Wed, 04 Mar 2026 12:14:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxl7o-0000000HA73-3ElU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 12:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=D1J6bBElKC5kc3fK81QWrSYx8rE0smFFIJm9isvrGyE=; b=zDr4XQnT4lsz+ngMWLnCpdR4BM
	ZCUu2f1o2py44Z97GR1XFrdgN/DjAMgLywfnvndfMHTKeWE+hVuXKkR0otnma5hIJ+eo1jMf2id+D
	gu2pJSHiH7jStO7Md/Jms+fjA7rHP62w3oAuz4+O9b9HFisVShulF1OZjKk8P540GGVh8TXaWoZpg
	SHDgBUxkLoDiRfMeMF3zdzAFwEKaAtCXLYrNVCvxn5jspG+oJFUVgHvvftbaS9fAwUAfOJUWJIE5a
	jzgl+hjoQKq9afGfbiXK87De0IHKg1UMmRxspiqDNB2col3YZYc8wf90H8nrUU7883b12iM7f2Tg1
	TsVL10iw==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	zhangqing@rock-chips.com,
	sebastian.reichel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	andyshrk@163.com,
	macromorgan@hotmail.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] clk: rockchip: rk3588: Don't change PLL rates when setting dclk_vop2_src
Date: Wed,  4 Mar 2026 13:14:25 +0100
Message-ID: <20260304121426.1184680-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304121426.1184680-1-heiko@sntech.de>
References: <20260304121426.1184680-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_041448_808788_8AE525EC 
X-CRM114-Status: GOOD (  15.40  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

dclk_vop2_src currently has the CLK_SET_RATE_PARENT flag set, which is
very different from dclk_vop0_src or dclk_vop1_src, which don't have it.

With this flag in dclk_vop2_src, actually setting the clock then results
in a lot of other peripherals breaking, because setting the rate results
in the PLL source getting changed:

[   14.898718] clk_core_set_rate_nolock: setting rate for dclk_vop2 to 152840000
[   15.155017] clk_change_rate: setting rate for pll_gpll to 1680000000
[ clk adjusting every gpll user ]

This includes possibly the other vops, i2s, spdif and even the uarts.
Among other possible things, this breaks the uart console on a board
I use. Sometimes it recovers later on, but there will be a big block
of garbled output for a while at least.

Shared PLLs should not be changed by individual users, so drop this flag
from dclk_vop2_src.

Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the RK3588")
Cc: stable@vger.kernel.org
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger w/ DP
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/clk/rockchip/clk-rk3588.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 1694223f4f84..bea2deed0e23 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -2094,7 +2094,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	COMPOSITE(DCLK_VOP1_SRC, "dclk_vop1_src", gpll_cpll_v0pll_aupll_p, 0,
 			RK3588_CLKSEL_CON(111), 14, 2, MFLAGS, 9, 5, DFLAGS,
 			RK3588_CLKGATE_CON(52), 11, GFLAGS),
-	COMPOSITE(DCLK_VOP2_SRC, "dclk_vop2_src", gpll_cpll_v0pll_aupll_p, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
+	COMPOSITE(DCLK_VOP2_SRC, "dclk_vop2_src", gpll_cpll_v0pll_aupll_p, CLK_SET_RATE_NO_REPARENT,
 			RK3588_CLKSEL_CON(112), 5, 2, MFLAGS, 0, 5, DFLAGS,
 			RK3588_CLKGATE_CON(52), 12, GFLAGS),
 	COMPOSITE_NODIV(DCLK_VOP0, "dclk_vop0", dclk_vop0_p,
-- 
2.47.3


