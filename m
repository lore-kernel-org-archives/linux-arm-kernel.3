Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EB4C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 11:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9xJi6VAHCUEzm3dN054EmcisgXFfpIHGR5lwkOb/cw=; b=RrK+R8ncNMXwa5wAcjeVJQVuTk
	03xXHcOq+OJucOpgbA0g43tvMHNWtjDAY6Y4PGOPp36qQ0hhUibbwwnem1bU75Ph6Z3GPD9CBVwY5
	aJJkk1LWaR1dk5aNCMiPSK9TqU9kERdZ1bH0pv6EMEh94ns+o8vhvgpydkohD0GwOeF6vxRqWx9ck
	IeH80crOOY5TmfXH8J2jxgC8DkPF5kFAEqeB9AyENPfsKprs2DE+szxb8+/zGqjty+1eTkvxEkiZo
	amghDrdWso8hhS6SQZ87T8SNL/nlhDF563T+7mOSsutqLDz9yfh3rzPk5pkRoyKl4V7nv2q3PLi5r
	ESrktZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viW0W-00000005Jpk-1gbt;
	Wed, 21 Jan 2026 11:04:16 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viW0T-00000005Jow-399X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 11:04:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768993443; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iDTfN+GYmWGpF1sSZ11lnR14TiFZh3OC/Ih137nMp+2sefu85bBNBwzzDbiFNG8yoXOJoWAZSXyxlPIxpMCcfx7uloVHPnJwAruq2ltCeWN3Nz1KEjm1Z4k9MTKFDASaRf4dVQq5UdFNCAkcuWvM/BddIewSoGBcwI1vRLzkzCI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768993443; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Q9xJi6VAHCUEzm3dN054EmcisgXFfpIHGR5lwkOb/cw=; 
	b=Ca78poVEBiD+NghCzY024n0Gv3UYAjMHSAWWfc/+i4W38Rpued1SsOqXx1Tl3w9J4pLuT46KQGvSN+i7gGkbm1hePKWX+NJKy24h+dsRvfFmAOPVmXquxqS/RHHDI3Rcy9R0sFKXQWR1kNDqCJ35XTjuAyrZ8IuDxfBTmJidy8E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768993443;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Q9xJi6VAHCUEzm3dN054EmcisgXFfpIHGR5lwkOb/cw=;
	b=TgZjJLE+/3LfqohAS1g2WUBUaPANu6Boa3mjmtk1FrjvQlXjMxrB29QNHs3y+71N
	NEMROp13HrdHf9vnuQHEotkvK74UfKweRhU8uykp2y17Gf02Wq+x73sEP/hOB0PiK3l
	uSWtvZ/fK5vNBPWeur3uS8OkaKHaa2CSSwwoKnUI=
Received: by mx.zohomail.com with SMTPS id 1768993442305964.352987418435;
	Wed, 21 Jan 2026 03:04:02 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 21 Jan 2026 18:59:09 +0800
Subject: [PATCH 3/7] clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC
 calibration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-a733-rtc-v1-3-d359437f23a7@pigmoral.tech>
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768993386; l=3422;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=EaZwUZOL/6KRK5E3haLUyKQNLv0B7SELQtluH9yrJLU=;
 b=UOl1J6qZ2N2m3kr+ssXubB+UY59HWZGQsOMSAIyLazGm1HLOdoP/dR/8xP4BC17QNEHm6JzQ6
 NTr7syE0uSxBbQsuBFT80Y6HLE/5dwOBOzNIwmT0u96arwwE7OQLsKN
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_030413_830316_1CA624BB 
X-CRM114-Status: GOOD (  16.43  )
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

The sun6i-rtc CCU driver currently uses a global static variable to
denote whether calibration is supported, which makes IOSC operations
tightly coupled to this file.

Convert this into a feature bit to decouple the logic. This allows the
IOSC clock code to be moved into a shared module for reuse by other SoCs.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 17 +++++++++--------
 drivers/clk/sunxi-ng/ccu_common.h    |  1 +
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 3088f247d927..6f888169412c 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -53,8 +53,6 @@ struct sun6i_rtc_match_data {
 	u8				osc32k_fanout_nparents;
 };
 
-static bool have_iosc_calibration;
-
 static int ccu_iosc_enable(struct clk_hw *hw)
 {
 	struct ccu_common *cm = hw_to_ccu_common(hw);
@@ -81,7 +79,7 @@ static unsigned long ccu_iosc_recalc_rate(struct clk_hw *hw,
 {
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		u32 reg = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/*
@@ -120,7 +118,7 @@ static int ccu_iosc_32k_prepare(struct clk_hw *hw)
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (!have_iosc_calibration)
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
 		return 0;
 
 	val = readl(cm->base + IOSC_CLK_CALI_REG);
@@ -135,7 +133,7 @@ static void ccu_iosc_32k_unprepare(struct clk_hw *hw)
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (!have_iosc_calibration)
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
 		return;
 
 	val = readl(cm->base + IOSC_CLK_CALI_REG);
@@ -149,7 +147,7 @@ static unsigned long ccu_iosc_32k_recalc_rate(struct clk_hw *hw,
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		val = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/* Assume the calibrated 32k clock is accurate. */
@@ -168,7 +166,7 @@ static unsigned long ccu_iosc_32k_recalc_accuracy(struct clk_hw *hw,
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		val = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/* Assume the calibrated 32k clock is accurate. */
@@ -366,7 +364,10 @@ static int sun6i_rtc_ccu_probe(struct auxiliary_device *adev,
 		return 0;
 
 	data = match->data;
-	have_iosc_calibration = data->have_iosc_calibration;
+	if (data->have_iosc_calibration) {
+		iosc_clk.features |= CCU_FEATURE_IOSC_CALIBRATION;
+		iosc_32k_clk.features |= CCU_FEATURE_IOSC_CALIBRATION;
+	}
 
 	if (data->have_ext_osc32k) {
 		const char *fw_name;
diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index bbec283b9d99..d9dc24ad5503 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -21,6 +21,7 @@
 #define CCU_FEATURE_CLOSEST_RATE	BIT(9)
 #define CCU_FEATURE_DUAL_DIV		BIT(10)
 #define CCU_FEATURE_UPDATE_BIT		BIT(11)
+#define CCU_FEATURE_IOSC_CALIBRATION	BIT(12)
 
 /* MMC timing mode switch bit */
 #define CCU_MMC_NEW_TIMING_MODE		BIT(30)

-- 
2.52.0


