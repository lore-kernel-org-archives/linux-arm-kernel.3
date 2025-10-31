Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562EDCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qBjz0s9DTifflcSP9nj4wOvBl/KltCjFVIAZEE4rOMg=; b=saZzwXytFfb1dngpanG8P0GA/4
	eqlTphxEviH9re+n8nca8lPT+AwXFFzKrwWrQVK9F8GqlRU4933blpAFhVbXC8XtJnHC2Ft54Of5A
	y7rxbjrJE+RHA/6RGDh6Kb9ZxsSl092hfZT/mYL5qtXonpa55x84lGi7iUc36SciqkPwdu6vjYVRM
	6dvDPNC6QtV5qheYNeL2k0TEszAKEqqxU9t7tRtJl6/MWXvS+ljhmeMNSD6QdUzlYWslnp8P9+xOV
	i5anfEZYbM07oFBynENKViJMhVvz3i95GtXXnS7D4Zo46noBnnBak+3Y0QEV4qxZsbDJB73Dsjm4r
	XHJ2f2Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkDa-00000005bj3-09Kx;
	Fri, 31 Oct 2025 08:10:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkDR-00000005bef-3IZM;
	Fri, 31 Oct 2025 08:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09819445DE;
	Fri, 31 Oct 2025 08:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D85D0C16AAE;
	Fri, 31 Oct 2025 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761898231;
	bh=vGQHDMPDFqEek7AC7vioPrkUtMWkS6rFq2XnbYgZrn8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=baDVtwGwWEZYt+UDEM1ar6vK3vKVjULz9eLKORPnskN2po4rxCskU8oFZenmpRKkr
	 qs14Pz+dSqjSVp2Jhh5SXuTiPua8NeDGm43iSI0QKdZ83Nms1S67eaylQ4QKcoCSc2
	 RvtBpF5jtR21A2OvzBiOlYe8c2l4ua+Zq5R76SnJ/n/H7v6h0/q97KeefItvZVruLQ
	 CcrYPFXGr8b1eqzFqbDIsogDr1KBNllpGrpHmStINcgRVd1P9+KPD89J/QFz37gpzj
	 blqY/wtXsqdGU58bMuzu4ybC/bGybzSZLWuLU6Jvn6kUr7QuV7rb6qJjJX98xyJ01T
	 mc2Gnog6RucHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB94CCFA03;
	Fri, 31 Oct 2025 08:10:31 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 31 Oct 2025 16:10:10 +0800
Subject: [PATCH v3 3/4] clk: amlogic: Add handling for PLL lock failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-optimize_pll_driver-v3-3-92f3b2f36a83@amlogic.com>
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
In-Reply-To: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761898227; l=2329;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=hkOzDZETVE19YzYRyq9fWVkEGr8gDuc+o46inhx8Qtg=;
 b=0yISSorwaI3PsvRLs+sLpQCAQG8APu1fcHkVfPqejUNW58Qb+QbEUwch0hht03EjjJUmhPrDL
 YPlIXd+xxd+BAdMzBnAflA8/WX+agqrhOJvNxWA2XSdMK3A0BrXGNW+
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_011033_952074_684FF9C4 
X-CRM114-Status: GOOD (  12.29  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

If the PLL fails to lock, it should be disabled, This makes the logic
more complete, and also helps save unnecessary power consumption when
the PLL is malfunctioning.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 70c8c7078046..cdb39a723bd0 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -353,6 +353,23 @@ static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
 	return -EIO;
 }
 
+static void meson_clk_pll_disable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
+
+	/* Put the pll is in reset */
+	if (MESON_PARM_APPLICABLE(&pll->rst))
+		meson_parm_write(clk->map, &pll->rst, 1);
+
+	/* Disable the pll */
+	meson_parm_write(clk->map, &pll->en, 0);
+
+	/* Disable PLL internal self-adaption current module */
+	if (MESON_PARM_APPLICABLE(&pll->current_en))
+		meson_parm_write(clk->map, &pll->current_en, 0);
+}
+
 static int meson_clk_pll_enable(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
@@ -399,29 +416,17 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 		meson_parm_write(clk->map, &pll->l_detect, 0);
 	}
 
-	if (meson_clk_pll_wait_lock(hw))
+	if (meson_clk_pll_wait_lock(hw)) {
+		/* disable PLL when PLL lock failed. */
+		meson_clk_pll_disable(hw);
+		pr_warn("%s: PLL lock failed!\n", clk_hw_get_name(hw));
+
 		return -EIO;
+	}
 
 	return 0;
 }
 
-static void meson_clk_pll_disable(struct clk_hw *hw)
-{
-	struct clk_regmap *clk = to_clk_regmap(hw);
-	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
-
-	/* Put the pll is in reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 1);
-
-	/* Disable the pll */
-	meson_parm_write(clk->map, &pll->en, 0);
-
-	/* Disable PLL internal self-adaption current module */
-	if (MESON_PARM_APPLICABLE(&pll->current_en))
-		meson_parm_write(clk->map, &pll->current_en, 0);
-}
-
 static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				  unsigned long parent_rate)
 {

-- 
2.42.0



