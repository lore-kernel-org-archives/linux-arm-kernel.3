Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45A1CD484C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 12:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIKUlDsIBGQ1VaaSpQsBxrRr/OA5YOa4/EjvD4Z4QEY=; b=TS1vbnTjP/wEqOeLpLsk1VJrtF
	hiNr8ZWBZUdzL17zNswvgqikkzwosU4t7z9ytiHIPe5+qPW00f77zKpez7SkGFr22eF09GjUylRRs
	CLdGeW7v7naOoRi0XxGGMZl2wHYcEqaepOW17DHdDaEHHUIdEHuu4l/0wuazNLUQ58lQIEludTc1J
	c2TByzgDCjuI+aTIvFygb5VvxM31trYXR9/XF3d8OpEjd2ba4L1ku0BYrGOqAYZHKszmCiTULf8+b
	mjZmDRxOxVEOSkyhLQLu4p9S2Wafl00ml83EfJLoG/SM/HtjG3umr+K89BraHFLpI3WUcbHHnWC/8
	rSM5gnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQ30-0000000DbCF-2TDw;
	Mon, 11 May 2026 12:47:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQ2t-0000000Db3g-0w9z;
	Mon, 11 May 2026 12:47:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B737A445B8;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 962E3C2BCFF;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778503657;
	bh=K8swoX6FxSY3+YCc6uF9MI8GHhydGylx3BI+Fh5y6Q0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oAGYe1/ysQwhazYy1QBhxbdq2eIOtfxfGi/c/MuSBHWcCUPxh8bsIIjyHeMPYXyZ3
	 MlbR/rOcot34lOVoI2EHufWAIlBzuDj8x28RnO/NaUGsaRMnMsSNtz9FiiACqp5tb8
	 sH2Up/YW0wUJGzZAiWaGyXPO5YMELyLjgmNK323bGlCkXsI4PrMTsVHeRD88Ysoruc
	 zsAiMuezSmrAFOQTDrONzZ57LVi47PwAQbLpdJ2hXOUfENJ6dYRilBd3LY+k5MsZIi
	 1EwC3ZkC+JxTUR9RIsgda+eWb3/k8yJldaGby+Y7z15to2tv6RECDBgjGFNsf1JSKZ
	 mWc8LeDYJ6GwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E444CD484A;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Mon, 11 May 2026 20:47:28 +0800
Subject: [PATCH 06/10] clk: amlogic: PLL reset signal supports active-low
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-b4-a9_clk-v1-6-41cb4071b7c9@amlogic.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
In-Reply-To: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503655; l=3454;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=clfKrUtBIiCGEypSBaa2X6SEz4kq2wv6xubbYMfZPdA=;
 b=TQsjaczUkxYfqykhe1RZLaYt8pFwVorzMVt91OgYqNavgIrXbqhT5etrHMKLk00RIsy2VfBqQ
 n92VY6wnhDYCAu5gyiqoaqtcC6hb13tOUnP1+bO4u76dbbNy+GoTGTP
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_054739_324970_5D1A3FAA 
X-CRM114-Status: GOOD (  15.75  )
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
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jian Hu <jian.hu@amlogic.com>

In the A9 design, the PLL reset signal is configured as active-low.

Add the flag 'CLK_MESON_PLL_RST_N' to indicate that the PLL reset signal
is active-low.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 42 +++++++++++++++++++++++++++++++-----------
 drivers/clk/meson/clk-pll.h |  2 ++
 2 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 5a0bd75f85a9..8568ad6ba7b6 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -295,10 +295,14 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
+	unsigned int rst;
 
-	if (MESON_PARM_APPLICABLE(&pll->rst) &&
-	    meson_parm_read(clk->map, &pll->rst))
-		return 0;
+	if (MESON_PARM_APPLICABLE(&pll->rst)) {
+		rst = meson_parm_read(clk->map, &pll->rst);
+		if ((rst && !(pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)) ||
+		    (!rst && (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)))
+			return 0;
+	}
 
 	if (!meson_parm_read(clk->map, &pll->en) ||
 	    !meson_parm_read(clk->map, &pll->l))
@@ -326,14 +330,22 @@ static int meson_clk_pll_init(struct clk_hw *hw)
 		return 0;
 
 	if (pll->init_count) {
-		if (MESON_PARM_APPLICABLE(&pll->rst))
-			meson_parm_write(clk->map, &pll->rst, 1);
+		if (MESON_PARM_APPLICABLE(&pll->rst)) {
+			if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
+				meson_parm_write(clk->map, &pll->rst, 0);
+			else
+				meson_parm_write(clk->map, &pll->rst, 1);
+		}
 
 		regmap_multi_reg_write(clk->map, pll->init_regs,
 				       pll->init_count);
 
-		if (MESON_PARM_APPLICABLE(&pll->rst))
-			meson_parm_write(clk->map, &pll->rst, 0);
+		if (MESON_PARM_APPLICABLE(&pll->rst)) {
+			if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
+				meson_parm_write(clk->map, &pll->rst, 1);
+			else
+				meson_parm_write(clk->map, &pll->rst, 0);
+		}
 	}
 
 	return 0;
@@ -363,15 +375,23 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 		return 0;
 
 	/* Make sure the pll is in reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 1);
+	if (MESON_PARM_APPLICABLE(&pll->rst)) {
+		if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
+			meson_parm_write(clk->map, &pll->rst, 0);
+		else
+			meson_parm_write(clk->map, &pll->rst, 1);
+	}
 
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
 
 	/* Take the pll out reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 0);
+	if (MESON_PARM_APPLICABLE(&pll->rst)) {
+		if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
+			meson_parm_write(clk->map, &pll->rst, 1);
+		else
+			meson_parm_write(clk->map, &pll->rst, 0);
+	}
 
 	/*
 	 * Compared with the previous SoCs, self-adaption current module
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 97b7c70376a3..1be7e6e77631 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -31,6 +31,8 @@ struct pll_mult_range {
 #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
 /* l_detect signal is active-high */
 #define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH	BIT(2)
+/* rst signal is active-low (Power-on reset) */
+#define CLK_MESON_PLL_RST_ACTIVE_LOW	BIT(3)
 
 struct meson_clk_pll_data {
 	struct parm en;

-- 
2.47.1



