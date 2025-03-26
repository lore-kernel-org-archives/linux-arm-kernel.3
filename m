Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE10C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 11:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ezxUjNxGNqxEEIkwffC6gu9wA/qNKXnWxmZorcahfW0=; b=EC5V2X3vfwr5gBJMWUQijT3M0k
	3dlri4/V/9E9fUANqGG4vxn/loFkpn9VAHJu/RpChbdKe3gsODMVgNpWZMIRkGvfXyNtFcazFtQg6
	Zy6/W75tJfvmErqNf/s0tPg+n45wE9i7BUJgattgWDgokyTKBV8pkElMcJIoqiHj8wweMI0YEADK4
	xZo1G+du2gyvvBlMN2X6Y0wKthib1xD4tCxE2fmytreLgzfZeSAnTXgjGMDQ5jIeJ8ijfvTPYWVtv
	6Q1dUZzdcw59TEtVNA3/LVlLA+fUqdo6i/r1TYYUmohOVtAdB9yrcWo0MHjk0sEU4soauPVO7Y2xH
	ab5Sz7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txP5K-00000008NZH-0poe;
	Wed, 26 Mar 2025 11:38:14 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txP3a-00000008NNz-2Cgz;
	Wed, 26 Mar 2025 11:36:28 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 71A1525D79;
	Wed, 26 Mar 2025 12:36:15 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L35YDY5GWVHS; Wed, 26 Mar 2025 12:36:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1742988974; bh=i+1SA1AXJQX4Q9Crpe7MCE2kgK7BHEod+Flw4MdzIdE=;
	h=From:To:Cc:Subject:Date;
	b=JEusnVnxCcLq5kc8e3+v66/68lTz7j7OUh6mkbl8CT8T6tvtQr6jw62C5VsbJJMMd
	 I/9VWOZurlvmrOOz89NfCPM0m9w0/wjtP82BQEmIhmj2QanHt5Dsmrrrhkepagpot7
	 /n65OZMjdQTl5zs1iigHL9VbA4kN4ArY4Dg5BcuQyKOoXaBMS6qMf57MA10GnpjY4S
	 e5PnPIwdRNE7UMT0lAmKQ0JoQYpIvVvdJalwgHFF54CrfM4y8XERNLfkQuDCJoqyfP
	 WYYfXvHrDFOR+K5pXM27DwyDTTKlzypWZs52SPIDMHYnaadwHO6yWlIs0Q0Ee6e6Ot
	 qZw7plq3SOHhQ==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH] clk: rockchip: Drop empty init callback for rk3588 PLL type
Date: Wed, 26 Mar 2025 11:35:56 +0000
Message-ID: <20250326113556.21039-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_043626_968440_FF8B08D9 
X-CRM114-Status: UNSURE (   8.73  )
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

Unlike PLLs in previous geneation of SoCs, PLLs in RK3588 type don't
require any platform-specific initialization. Drop callback
rockchip_rk3588_pll_init() that does nothing in fact to clean the
driver up.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/rockchip/clk-pll.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index fe76756e592e..a2a57d47bbf8 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -1025,16 +1025,6 @@ static int rockchip_rk3588_pll_is_enabled(struct clk_hw *hw)
 	return !(pllcon & RK3588_PLLCON1_PWRDOWN);
 }
 
-static int rockchip_rk3588_pll_init(struct clk_hw *hw)
-{
-	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
-
-	if (!(pll->flags & ROCKCHIP_PLL_SYNC_RATE))
-		return 0;
-
-	return 0;
-}
-
 static const struct clk_ops rockchip_rk3588_pll_clk_norate_ops = {
 	.recalc_rate = rockchip_rk3588_pll_recalc_rate,
 	.enable = rockchip_rk3588_pll_enable,
@@ -1049,7 +1039,6 @@ static const struct clk_ops rockchip_rk3588_pll_clk_ops = {
 	.enable = rockchip_rk3588_pll_enable,
 	.disable = rockchip_rk3588_pll_disable,
 	.is_enabled = rockchip_rk3588_pll_is_enabled,
-	.init = rockchip_rk3588_pll_init,
 };
 
 /*
-- 
2.49.0


