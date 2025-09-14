Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2273ACAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 21:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZnRAM4NTUz6a26lNJhwUr/8t1nxItg9+fBTr6Z/4EU=; b=uaXUBsMWxX2E4s7WE4Kj/m0JVt
	HRSeYSs7YEdb/PrRgytvxriiRIX+HeRSv8nHMuGwgXkY309b5eAqXWfLXdJyLYyPpnpfcfHk4HfXP
	yKus3Bfhq7g+4DPE2aia6FV58Lj2Yt2L8CNEWMacbEPVoo08AoN1IINKkDNRdh//ruPVsZlG+Deex
	hSVtiLVKTzOSUZJLOau1JBCl4wx+FH+Go5n8xBOyCMwTJP9duPdzCa+FZ33s0FAxnAr0ppjyl+tx7
	RotjbrjQWKKdZn+tR6uFNmRMWWjNZ29mwC/mKPBdoc3m2j/rbmXC7lVF5lJFRPqqNAtpK3O1Uz/kf
	4Ypc2nFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxu8M-00000002EO5-2yxm;
	Sun, 14 Sep 2025 21:19:42 +0000
Received: from mail-24420.protonmail.ch ([109.224.244.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxu8K-00000002EMl-1W7u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 21:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757884777; x=1758143977;
	bh=PZnRAM4NTUz6a26lNJhwUr/8t1nxItg9+fBTr6Z/4EU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UBGsRiN2nzuLcOyns1Y86gZJXqGKtNegR3F0Hach2xDu+G70kN9Fhr5yVKuJ+XBev
	 nK9lX7kwJ0wsgotJ5G4mNcWtw97njHO8sARr1fPAqv5mw8gQeRW3fKfg3W688no0WB
	 iNKal8o/SJ0sSxjXLEgJD/fwSttSXKnqPDHdAlmaPubt6IB4cKDsxloj0qvmc+g8qY
	 5K/jHL6UVikosb38KiukKZCioxhwihDJoYHXiiZloedznpR8vk3t74059p1UKUn5ye
	 K/iqvwGnO9yGFqNxdzTVQcBmyn3T0KCrIASfJD8hTJPN2LJwWsp0+h4y31/XWxqHVN
	 tN1wsm2E1TMQg==
Date: Sun, 14 Sep 2025 21:19:32 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandru Chimac <alexchimac@protonmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 2/8] clk: samsung: clk-pll: Add support for pll_1061x
Message-ID: <20250915-exynos9610-clocks-v1-2-3f615022b178@chimac.ro>
In-Reply-To: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
References: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: a7b2c46f0923d45efb9cf8f71e4a6d359616d4be
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_141940_549072_B43EF741 
X-CRM114-Status: GOOD (  10.23  )
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

These PLLs are found in the Exynos9610 and Exynos9810 SoCs, and
are similar to pll_1460x, so the code for that can handle this
PLL with a few small adaptations.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 drivers/clk/samsung/clk-pll.c | 29 ++++++++++++++++++++++-------
 drivers/clk/samsung/clk-pll.h |  1 +
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 7bea7be1d7e45c32f0b303ffa55ce9cde4a4f71d..5fa553eab8e4b53a8854848737f=
619ef6a9c645a 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -785,15 +785,20 @@ static unsigned long samsung_pll46xx_recalc_rate(stru=
ct clk_hw *hw,
 =09u64 fvco =3D parent_rate;
=20
 =09pll_con0 =3D readl_relaxed(pll->con_reg);
-=09pll_con1 =3D readl_relaxed(pll->con_reg + 4);
-=09mdiv =3D (pll_con0 >> PLL46XX_MDIV_SHIFT) & ((pll->type =3D=3D pll_1460=
x) ?
+=09if (pll->type =3D=3D pll_1061x)
+=09=09pll_con1 =3D readl_relaxed(pll->con_reg + 12);
+=09else
+=09=09pll_con1 =3D readl_relaxed(pll->con_reg + 4);
+=09mdiv =3D (pll_con0 >> PLL46XX_MDIV_SHIFT) & (((pll->type =3D=3D pll_146=
0x)
+=09=09=09=09|| (pll->type =3D=3D pll_1061x)) ?
 =09=09=09=09PLL1460X_MDIV_MASK : PLL46XX_MDIV_MASK);
 =09pdiv =3D (pll_con0 >> PLL46XX_PDIV_SHIFT) & PLL46XX_PDIV_MASK;
 =09sdiv =3D (pll_con0 >> PLL46XX_SDIV_SHIFT) & PLL46XX_SDIV_MASK;
 =09kdiv =3D pll->type =3D=3D pll_4650c ? pll_con1 & PLL4650C_KDIV_MASK :
 =09=09=09=09=09pll_con1 & PLL46XX_KDIV_MASK;
=20
-=09shift =3D ((pll->type =3D=3D pll_4600) || (pll->type =3D=3D pll_1460x))=
 ? 16 : 10;
+=09shift =3D ((pll->type =3D=3D pll_4600) || (pll->type =3D=3D pll_1460x)
+=09=09 || (pll->type =3D=3D pll_1061x)) ? 16 : 10;
=20
 =09fvco *=3D (mdiv << shift) + kdiv;
 =09do_div(fvco, (pdiv << sdiv));
@@ -831,7 +836,10 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw,=
 unsigned long drate,
 =09}
=20
 =09con0 =3D readl_relaxed(pll->con_reg);
-=09con1 =3D readl_relaxed(pll->con_reg + 0x4);
+=09if (pll->type =3D=3D pll_1061x)
+=09=09con1 =3D readl_relaxed(pll->con_reg + 0xc);
+=09else
+=09=09con1 =3D readl_relaxed(pll->con_reg + 0x4);
=20
 =09if (!(samsung_pll46xx_mpk_change(con0, con1, rate))) {
 =09=09/* If only s change, change just s value only*/
@@ -849,7 +857,7 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw, =
unsigned long drate,
 =09=09lock =3D 0xffff;
=20
 =09/* Set PLL PMS and VSEL values. */
-=09if (pll->type =3D=3D pll_1460x) {
+=09if ((pll->type =3D=3D pll_1460x) || (pll->type =3D=3D pll_1061x)) {
 =09=09con0 &=3D ~((PLL1460X_MDIV_MASK << PLL46XX_MDIV_SHIFT) |
 =09=09=09(PLL46XX_PDIV_MASK << PLL46XX_PDIV_SHIFT) |
 =09=09=09(PLL46XX_SDIV_MASK << PLL46XX_SDIV_SHIFT));
@@ -866,7 +874,10 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw,=
 unsigned long drate,
 =09=09=09(rate->sdiv << PLL46XX_SDIV_SHIFT);
=20
 =09/* Set PLL K, MFR and MRR values. */
-=09con1 =3D readl_relaxed(pll->con_reg + 0x4);
+=09if (pll->type =3D=3D pll_1061x)
+=09=09con1 =3D readl_relaxed(pll->con_reg + 0xc);
+=09else
+=09=09con1 =3D readl_relaxed(pll->con_reg + 0x4);
 =09con1 &=3D ~((PLL46XX_KDIV_MASK << PLL46XX_KDIV_SHIFT) |
 =09=09=09(PLL46XX_MFR_MASK << PLL46XX_MFR_SHIFT) |
 =09=09=09(PLL46XX_MRR_MASK << PLL46XX_MRR_SHIFT));
@@ -877,7 +888,10 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw,=
 unsigned long drate,
 =09/* Write configuration to PLL */
 =09writel_relaxed(lock, pll->lock_reg);
 =09writel_relaxed(con0, pll->con_reg);
-=09writel_relaxed(con1, pll->con_reg + 0x4);
+=09if (pll->type =3D=3D pll_1061x)
+=09=09writel_relaxed(con1, pll->con_reg + 0xc);
+=09else
+=09=09writel_relaxed(con1, pll->con_reg + 0x4);
=20
 =09/* Wait for PLL lock */
 =09return samsung_pll_lock_wait(pll, PLL46XX_LOCKED);
@@ -1563,6 +1577,7 @@ static void __init _samsung_clk_register_pll(struct s=
amsung_clk_provider *ctx,
 =09case pll_4650:
 =09case pll_4650c:
 =09case pll_1460x:
+=09case pll_1061x:
 =09=09if (!pll->rate_table)
 =09=09=09init.ops =3D &samsung_pll46xx_clk_min_ops;
 =09=09else
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 6c8bb7f26da5436dfccae89a95d1b0025f7f3e0b..7f36d1d03dcf5888027ce9b6f75=
ccc9a7a135be2 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -45,6 +45,7 @@ enum samsung_pll_type {
 =09pll_531x,
 =09pll_1051x,
 =09pll_1052x,
+=09pll_1061x,
 =09pll_0717x,
 =09pll_0718x,
 =09pll_0732x,

--=20
2.47.3



