Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6FEE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 22:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w/mwqlldhdUNZw8mhvNpRd4TsYnOabctYvvTfesFo7E=; b=KYokrVfNmmVsv2uJieO2FQBgE3
	OS8g5OUJDkQjVT6HQEhBHO7CYY0TlT1rIIbtL1Y0FN7USZxiu60mEanMC22HP/NmdNLTyA9fbaop3
	qaXYnGfvZoYS7W9+cp6tIyma7CnPVI9Bj10FfMXQjsxQVWiclJxXejPnq44CDn6AY0ZhEZL12rvJR
	FVOWGV3Ozy8Hi/Fy1y6q3MMDQI008J0wiLpwUmSMyYD/Ht3cOKqb3lLqWoCzpz1WPsH5iiPREatN4
	M2gUHmgBNm63TINrBbgNVIpx9WyzToUIO0nGe9GWcHZvKvUah74y78kfpyiAlv01EdcG/GLkaU+jm
	p0wg+z7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMaxM-000000074ns-1L7z;
	Sat, 14 Dec 2024 22:49:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMavz-000000074cc-1yft;
	Sat, 14 Dec 2024 22:48:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=w/mwqlldhdUNZw8mhvNpRd4TsYnOabctYvvTfesFo7E=; b=0XE8byCmo+jmC1INaQjAPTlrus
	pPgB1W+DtrHXZxckAdQ8tpoNGo63j6EWf5xQYwEE2TzLhZS/5d4tkvPOVm8LlywyT//jfGfw/HXaW
	T6yDc68rzv5Meia8jIcZREvC4R2K+Lrk1FMeYDMCJGZgCMEAoDmIsbjUS43Elf6h6NRzIkkBXAvoJ
	avrIKxVO7Luc6zYYSFENDqDRaG0SFx0GuIJvNBGaosdmVFCVH14K1i1RaPSVwU/JhR67ddXf+MK7s
	yw+xv1oA7FtwI62+Z+jmu9uDogCzzpyBqL+ezXeiqDvn4LC6gYGhEbItOLeCwjP6G2J090ckNAq75
	TrOJStGw==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tMavv-0000P4-Tk; Sat, 14 Dec 2024 23:48:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH] clk: rockchip: rk3588: make refclko25m_ethX critical
Date: Sat, 14 Dec 2024 23:48:19 +0100
Message-ID: <20241214224820.200665-1-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_144827_529606_6788A441 
X-CRM114-Status: GOOD (  13.32  )
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

Ethernet phys normally need a 25MHz refclk input. On a lot of boards
this is done with a dedicated 25MHz crystal. But the rk3588 CRU also
provides a means for that via the refclko25m_ethX clock outputs that
can be used for that function.

The mdio bus normally probes devices on the bus at runtime, by reading
specific phy registers. This requires the phy to be running and thus
also being supplied by its reference clock.

While there exist the possibility and dt-binding to declare these
input clocks for each phy in the phy-dt-node, this is only relevant
_after_ the phy has been detected and during the drivers probe-run.

This results in a chicken-and-egg-problem. The refclks in the CRU are
running on boot of course, but phy-probing can very well happen after
clk_disable_unused has run.

In the past I tried to make clock-handling part of the mdio bus code [0]
but that wasn't very well received, due to it being specific to OF and
clocks with the consensus being that resources needed for detection
need to be enabled before.

So to make probing ethernet phys using the internal refclks possible,
make those 2 clocks critical.

[0] https://lore.kernel.org/netdev/13590315.F0gNSz5aLb@diego/T/

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/clk/rockchip/clk-rk3588.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 0ffaf639f807..2f63985a6d07 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -792,10 +792,10 @@ static struct rockchip_clk_branch rk3588_clk_branches[] __initdata = {
 	COMPOSITE(MCLK_GMAC0_OUT, "mclk_gmac0_out", gpll_cpll_p, 0,
 			RK3588_CLKSEL_CON(15), 7, 1, MFLAGS, 0, 7, DFLAGS,
 			RK3588_CLKGATE_CON(5), 3, GFLAGS),
-	COMPOSITE(REFCLKO25M_ETH0_OUT, "refclko25m_eth0_out", gpll_cpll_p, 0,
+	COMPOSITE(REFCLKO25M_ETH0_OUT, "refclko25m_eth0_out", gpll_cpll_p, CLK_IS_CRITICAL,
 			RK3588_CLKSEL_CON(15), 15, 1, MFLAGS, 8, 7, DFLAGS,
 			RK3588_CLKGATE_CON(5), 4, GFLAGS),
-	COMPOSITE(REFCLKO25M_ETH1_OUT, "refclko25m_eth1_out", gpll_cpll_p, 0,
+	COMPOSITE(REFCLKO25M_ETH1_OUT, "refclko25m_eth1_out", gpll_cpll_p, CLK_IS_CRITICAL,
 			RK3588_CLKSEL_CON(16), 7, 1, MFLAGS, 0, 7, DFLAGS,
 			RK3588_CLKGATE_CON(5), 5, GFLAGS),
 	COMPOSITE(CLK_CIFOUT_OUT, "clk_cifout_out", gpll_cpll_24m_spll_p, 0,
-- 
2.45.2


