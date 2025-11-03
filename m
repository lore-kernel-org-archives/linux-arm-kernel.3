Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB67CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 23:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTD0aMOXBBOpbBIVQQTjDpagN8By2cNhTKkE/uevXAw=; b=l1y6Fgpk3Z+50laB0OciannpGC
	LMQK6/c6qIM+6HQoYXFLWqM/Kanyhf0sBjUJcZJD4vzNLJA2m39gi2FxMDYTAgPXhUnEJq0qkYbdv
	c9RVguXbnWrucmL/+qmgN09ygc5+0IfjXao1/aQpKRBeHyq8Dwk7+/xgr73XNDkmcLHVbCao8h8XF
	Hstb7UHyuasFCkKUYHPfVPg0Ds+VgCsYtKnu5aONnlaZkBMCa8tquWVOelirxK5aXzCLTRpde5FU2
	M2UiJh4NbXHoGgVtQ6KIfHLF31QBIqAvfmqGkbLCNHtoIkwYGICQGzuPPSnU02vyPa0uugrf+l0gk
	HH8mycWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4AQ-0000000An63-3sze;
	Mon, 03 Nov 2025 23:40:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4AO-0000000An4q-1AQv;
	Mon, 03 Nov 2025 23:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=fTD0aMOXBBOpbBIVQQTjDpagN8By2cNhTKkE/uevXAw=; b=L8f/2ZwrGXYkE90+DKcgkBuhwK
	uIB3y38I1897ULQwP2s7L/EfythRnryipMhU5iwsd4dPDlEe/EbEOWyMHhN53MUvBFtjLR1ECojI1
	6Um6RX28ngSGVFYgH++XDmCMva/b/qPE8xBk5TRaCpC/T3Q5zRR1c4RNsCUdgbu9wiql5GBATGKdU
	FDizrXhCkJ/dL7f4iBKlEI9mWhVBzrRhUKVIMe9uzyGUcEljpMFzQhTyu32N4SGBlpnK8toX5o5ZS
	ikUoZvXp4XakaxZJkRSSSArmQp5iNhebKyeWuYgVYL8nu+tyKNMlXvU4rf8USOpdnCma86zZxXVxd
	neprGcwg==;
Received: from i53875a3a.versanet.de ([83.135.90.58] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vG4AJ-0007rE-Vj; Tue, 04 Nov 2025 00:40:48 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	michael.riesch@collabora.com
Subject: [PATCH 1/2] clk: rockchip: rk3568: Drop CLK_NR_CLKS usage
Date: Tue,  4 Nov 2025 00:40:31 +0100
Message-ID: <20251103234032.413563-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251103234032.413563-1-heiko@sntech.de>
References: <20251103234032.413563-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_154052_311989_0F9B2904 
X-CRM114-Status: GOOD (  13.92  )
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

In order to get rid of CLK_NR_CLKS and be able to drop it from the
bindings, use rockchip_clk_find_max_clk_id helper to find the highest
clock id.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3568.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index 97d279399ae8..74eabf9b2ae2 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -1652,6 +1652,7 @@ CLK_OF_DECLARE(rk3568_cru_pmu, "rockchip,rk3568-pmucru", rk3568_pmu_clk_init);
 static void __init rk3568_clk_init(struct device_node *np)
 {
 	struct rockchip_clk_provider *ctx;
+	unsigned long clk_nr_clks;
 	void __iomem *reg_base;
 
 	reg_base = of_iomap(np, 0);
@@ -1660,7 +1661,9 @@ static void __init rk3568_clk_init(struct device_node *np)
 		return;
 	}
 
-	ctx = rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
+	clk_nr_clks = rockchip_clk_find_max_clk_id(rk3568_clk_branches,
+						   ARRAY_SIZE(rk3568_clk_branches)) + 1;
+	ctx = rockchip_clk_init(np, reg_base, clk_nr_clks);
 	if (IS_ERR(ctx)) {
 		pr_err("%s: rockchip clk init failed\n", __func__);
 		iounmap(reg_base);
-- 
2.47.2


