Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E9ECCF9F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 05:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5HX5FnzKF15lqE+ybdxfRsJAVGm1M8hUYm5HaJRJCw=; b=11AA3N6SwMK2bKUKP7dsn2EZNU
	GkF2RpaOpzw+v7bVTeZDu0aeGhDnzMkEqS9FrLf7Vw9I+IiWL+31j5JW6EGVNYmIFRFr0WQAPKYSV
	GjAfNIZ4RJZv70s2Ox4U+OkHalPjDnwAnzkEvUjTaA1yGS7KMg/GvIURzg8fF6lhehCnVC0LpF6KU
	JULbJcRZEyl/hZ6I4lFrysy91BsKgn+nlwoBMY3NU66FDkJehqt1qwCNENV05FtVlLO8MiTQzeBJB
	dJAHEh5cFzN9Ms9/MKgbPCn0loQB5NPSs6J58Ix9col1J4C+6htIRIJy4n7cbBWPqvA4mXVXgPsvn
	E28smbqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEL95-00000003UxQ-3k4a;
	Thu, 30 Oct 2025 05:24:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEL91-00000003Uvh-0mdg;
	Thu, 30 Oct 2025 05:24:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79CD7604DD;
	Thu, 30 Oct 2025 05:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEB10C19422;
	Thu, 30 Oct 2025 05:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761801858;
	bh=zzksamsMZJOf1VT2cpshTei0QB7OGy3UaCYmRF0l4+I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Re3PalxXppg+X4cVfexljdnK7Rq7OkfLbTIsQpYACW5uPSmp9dwiuqRk/owTZwAz/
	 ZvZNS1V714JLYIR2jWFh6W++HPwQcTGIgNhxt8aAwcrOFpt8tVnCDxAtO6JSEWcy0T
	 wbEecwKaAoepL3qNOJG7A9aslcpoKnUsY+wOemOxm3Jz1O9/s3TxMBxFLQ7lkOR1iD
	 pRg2/Jx+oVmMTtIrbWYjDqe8C7TjVKhi7Dvavzbu8k59p96SgLyOrGx76cZAIQhhvb
	 jtesJy/LMawdLz/d0VXxknKYgCW7gc8GH+A6P4ZyhQQM8dkXe0oG4N4FQyPeFC6Ilb
	 p2hIcnSa4h5gA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B6FCCF9F6;
	Thu, 30 Oct 2025 05:24:17 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Thu, 30 Oct 2025 13:24:15 +0800
Subject: [PATCH v2 5/5] clk: amlogic: Change the active level of l_detect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-optimize_pll_driver-v2-5-37273f5b25ab@amlogic.com>
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
In-Reply-To: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>, da@libre.computer
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761801855; l=2920;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=EZQlp+ntQWH8wulP13OMEjecr2IO8R7gTLRrdJNlJqE=;
 b=tkTJCiK33Lo/TFJ+LelyksSbZKnetVKLe70d7ctvoJhRiAucDH840dF3/2GnHDeDNQika1syG
 p2IuaWbAkHsB2RTAIEHlBjlOt/J8081nbUxgd6kHxUu9KBv1e/jPZwI
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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

l_detect controls the enable/disable of the PLL lock-detect module.

The enable signal is normally active-high. This design ensures that
the module remains disabled during the power-on process, preventing
power fluctuations from affecting its operating state.

For A1, the l_detect signal is active-low:
0 -> Enable lock-detect module;
1 -> Disable lock-detect module.

Here, a flag CLK_MESON_PLL_L_DETECT_N is added to handle cases like
A1, where the signal is active-low.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/a1-pll.c  |  1 +
 drivers/clk/meson/clk-pll.c | 16 ++++++++++++----
 drivers/clk/meson/clk-pll.h |  2 ++
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index 1f82e9c7c14e..bfe559c71402 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -137,6 +137,7 @@ static struct clk_regmap a1_hifi_pll = {
 		.range = &a1_hifi_pll_range,
 		.init_regs = a1_hifi_pll_init_regs,
 		.init_count = ARRAY_SIZE(a1_hifi_pll_init_regs),
+		.flags = CLK_MESON_PLL_L_DETECT_N
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hifi_pll",
diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index c6eebde1f516..d729e933aa1c 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -384,8 +384,12 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 		meson_parm_write(clk->map, &pll->rst, 1);
 
 	/* Disable the PLL lock-detect module */
-	if (MESON_PARM_APPLICABLE(&pll->l_detect))
-		meson_parm_write(clk->map, &pll->l_detect, 1);
+	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
+		if (pll->flags & CLK_MESON_PLL_L_DETECT_N)
+			meson_parm_write(clk->map, &pll->l_detect, 1);
+		else
+			meson_parm_write(clk->map, &pll->l_detect, 0);
+	}
 
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
@@ -413,8 +417,12 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 	udelay(20);
 
 	/* Enable the lock-detect module */
-	if (MESON_PARM_APPLICABLE(&pll->l_detect))
-		meson_parm_write(clk->map, &pll->l_detect, 0);
+	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
+		if (pll->flags & CLK_MESON_PLL_L_DETECT_N)
+			meson_parm_write(clk->map, &pll->l_detect, 0);
+		else
+			meson_parm_write(clk->map, &pll->l_detect, 1);
+	}
 
 	if (meson_clk_pll_wait_lock(hw)) {
 		/* disable PLL when PLL lock failed. */
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 949157fb7bf5..83295a24721f 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -29,6 +29,8 @@ struct pll_mult_range {
 
 #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
 #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
+/* l_detect signal is active-low */
+#define CLK_MESON_PLL_L_DETECT_N	BIT(2)
 
 struct meson_clk_pll_data {
 	struct parm en;

-- 
2.42.0



