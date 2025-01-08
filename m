Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F136BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzKkEaZnILpJE9SXUJPnns0cqhZvRqt7W+b2NL74zgY=; b=OKcwr0oXBrL2PSsNgVB9EJbK9Y
	kSQxoGbmke+QdKztVm4j5Jwz3wmOSq8Kd4cXVhyCs4B8qFfpzlcah6zlS97iAwT314mNuU4tf+fw1
	0EmuP22/hbN8ftQUwEtDE5Gyl30+BbqeZd7eNtZ6E/ZKgniO4olugeoS3QpElqO5vsrhk+ARIe0vR
	/FVl5TezIFt1/BYLlqz/d1XZCZgpTekFpAZijAoeoiSxRem6Cc30/xyUJUmYFrXGi6HsKQIVu3VPB
	kKhVoM1npvqaC2xzmzlzpiY1UQuBgamETpyWfhOCVHgtdSkEP9K5TpN9WncX/LtPGRVmEqwUkKx9e
	jwGe4T5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVH3-00000008Rll-28A7;
	Wed, 08 Jan 2025 12:35:01 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUWl-00000008HL0-1bxm;
	Wed, 08 Jan 2025 11:47:12 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 236DF25C17;
	Wed,  8 Jan 2025 12:47:08 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IACoKRnpENS; Wed,  8 Jan 2025 12:47:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1736336827; bh=9v/ISjCq33hp5ht7KRd8VRiloInl0ViWAHs3kELKneI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bL2jhuTYpp/OI664vmwSZcAl3l3VMgUtx9AMgX9Hs8/RFqpWNW2VnNVWr2KGPe/Sf
	 79dnIxCz9W4m80Z2HDK6eOfT4GMEToLyf8RXLq/cglFGbDuDrEm1qEQc68Dmy/gBha
	 2OdQaEi4qKbSw01XZWv8C0SSa5p8Ydj7evCs4Fqk4ruh3C3tAUIOJtrv9Jh5vU6FU2
	 BMV3Pn+F4pBKhuvgOlzLc3a8qHJO9XYrvn+Ir6NtBq0I2rIvjwRgC7Rmjgo2xClXN/
	 dfCefKQxY4mxRuj99IEFKGO6O9tMMG1Gd30wOf9eVRwebJlZcrNq/+4TthLu9MMMDJ
	 tAsRsoY5cZNpw==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 2/5] clk: rockchip: Add PLL flag ROCKCHIP_PLL_FIXED_MODE
Date: Wed,  8 Jan 2025 11:46:03 +0000
Message-ID: <20250108114605.1960-4-ziyao@disroot.org>
In-Reply-To: <20250108114605.1960-2-ziyao@disroot.org>
References: <20250108114605.1960-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_034711_550135_370ED043 
X-CRM114-Status: GOOD (  14.44  )
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

RK3528 comes with a new PLL variant: its "PPLL", which mainly generates
clocks for the PCIe controller, operates in normal mode only. Let's
describe it with flag ROCKCHIP_PLL_FIXED_MODE and handle it in code.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/rockchip/clk-pll.c | 10 ++++++----
 drivers/clk/rockchip/clk.h     |  2 ++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index fe76756e592e..2c2abb3b4210 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -204,10 +204,12 @@ static int rockchip_rk3036_pll_set_params(struct rockchip_clk_pll *pll,
 	rockchip_rk3036_pll_get_params(pll, &cur);
 	cur.rate = 0;
 
-	cur_parent = pll_mux_ops->get_parent(&pll_mux->hw);
-	if (cur_parent == PLL_MODE_NORM) {
-		pll_mux_ops->set_parent(&pll_mux->hw, PLL_MODE_SLOW);
-		rate_change_remuxed = 1;
+	if (!(pll->flags & ROCKCHIP_PLL_FIXED_MODE)) {
+		cur_parent = pll_mux_ops->get_parent(&pll_mux->hw);
+		if (cur_parent == PLL_MODE_NORM) {
+			pll_mux_ops->set_parent(&pll_mux->hw, PLL_MODE_SLOW);
+			rate_change_remuxed = 1;
+		}
 	}
 
 	/* update pll values */
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index f1957e1c1178..6efe0495dd37 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -444,6 +444,7 @@ struct rockchip_pll_rate_table {
  * Flags:
  * ROCKCHIP_PLL_SYNC_RATE - check rate parameters to match against the
  *	rate_table parameters and ajust them if necessary.
+ * ROCKCHIP_PLL_FIXED_MODE - the pll operates in normal mode only
  */
 struct rockchip_pll_clock {
 	unsigned int		id;
@@ -461,6 +462,7 @@ struct rockchip_pll_clock {
 };
 
 #define ROCKCHIP_PLL_SYNC_RATE		BIT(0)
+#define ROCKCHIP_PLL_FIXED_MODE		BIT(1)
 
 #define PLL(_type, _id, _name, _pnames, _flags, _con, _mode, _mshift,	\
 		_lshift, _pflags, _rtable)				\
-- 
2.47.1


