Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0026CCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 06:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Blztc9HHMHucT+cy0nx3zuiTMaYFTwkTZftIDciBVXk=; b=KchRKOKvf/RnnwnObsHwPErKmz
	CMMGudHHEhqI3ad87dMlB9dtANTIvEmCynZM/SPxshxY2EOMn6QsRfcaezO5GTTCpCeyGtAXPIoWM
	/xT5Tm9Rjti6PL4nImcZgUz6pEio5iX89k/9G5kPIWpNyLxISJRrtK0h6KGShHRwTZye7TOMGCvk6
	qv8uTgXKVVhXN/8hPqjVkguaicV1lVAc4h51bxGhfzcHgVXOLs1sIc73Q9Gr2DTqtT5Jigm5vxCOy
	4Gcu16BIwl5BK9TFH2RWvIoW6ebuuIf5kbvkSQcu4Z4Uiu/rkSVt6lPXX/bqjLhVDsUcwW2kYmOm5
	suvQ4K0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSoL-00000001lAX-20hT;
	Wed, 22 Oct 2025 06:59:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSoJ-00000001l8t-1who;
	Wed, 22 Oct 2025 06:59:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DE45962866;
	Wed, 22 Oct 2025 06:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AEC0C116B1;
	Wed, 22 Oct 2025 06:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761116342;
	bh=tz1GN08S5uBHLdjHa0/ozlnw2WRGrO+4LkQLFLPDiG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r9hurdRub6sjGdNeStvNxLamcg5Bb540sE3Ej4LbE+9a9CKMk7vEQmem67Aoy80vZ
	 t0DNgRy3fMrNbD53L7H7QEgtAxv4d7dz4CsmqJYjZitDRXIfbJ3ZyrdeosV5lNqsVD
	 QG0k8rEUoUsDoqJAnsYTIsf21RGjIJBC14+4h6UOsYzMEV2MRedVKHsRDtnpnxjXQg
	 7SfRpc1mwq6zs+cL/WX1a8Y5jA1wT1kcToeTteC2njzVlIkm0vK8kRQjFaQWX9uhJt
	 rG8yLaRsefFrhvB2WmucpJv3YVAiVhUafBRqZTdAFasf6rjaAVKx3W6nlMnkxe3OT7
	 wGK3NrujhwxJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C64CCF9E0;
	Wed, 22 Oct 2025 06:59:02 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Wed, 22 Oct 2025 14:58:53 +0800
Subject: [PATCH 3/3] clk: amlogic: Correct l_detect bit control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-optimize_pll_driver-v1-3-a275722fb6f4@amlogic.com>
References: <20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com>
In-Reply-To: <20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761116340; l=2616;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=Dv3cPzZdf9Puk7bgGlGkCfNCiEdGxmv1X3Nj/+D8POg=;
 b=BHhN2TDgNFvv/uGPJJpyLvmLNfv+ZEmzL2S9sXilJFfhJvBFD6R+79Z2raY7XQiQGmLbIXNag
 V96WVa094xKBAJKEsbT4Kw52S5AzhIJN0wziJopr6yAfXB1pIQvlO+K
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

For A1, the l_detect signal is active-low:
0 -> Enable lock-detect module;
1 -> Disable lock-detect module.

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
index 26c83db487e8..602c93aba3cc 100644
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



