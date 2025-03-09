Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11697C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 06:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8anoiPfCBp5xWCmHFsTQxkLpQEr2Bdhp1Zu8IeIq9M=; b=DigcNHUIAb4yi4rFz3VbwjamWW
	YJcdqkELefS1PFJJVMF7UJi+BAArFgTZloRG0NjgSWeW88ftKMEiZ5yqTPmjwoWiu87oc7gpjCB1A
	pFIASB7JVX3IiJOyjGvY2i9Bx5587qz+9PcZtAgBJXT2wdyAxdNB14gtUZS45MXK7v/yAzkM+f23d
	eNdxVmd39n2ek2Doz4Z+UNdXCj4m0JM/1zb5lneBsgscTYJ46j46bp4cAEmwyEnPSop3/CWIUeVmp
	esWcH2HCurdkQoC4R4g05EhbX0xVpYBjnZbUzS2OIw6Cwryxw0pMk9Ghh2GMIrpcyggjwmA/y484v
	cCHiGgHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tr9ie-0000000006u-2WHM;
	Sun, 09 Mar 2025 06:01:00 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tr9cn-0000000Ha4D-3UW1;
	Sun, 09 Mar 2025 05:54:59 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4EF6325DB4;
	Sun,  9 Mar 2025 06:54:55 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0CfSGvB03gT; Sun,  9 Mar 2025 06:54:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741499694; bh=bL/x2ys+EM9SZYaqL9CiNuhB4mRB/IyUdJVwcVX0rig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ix/hadYlG9xn3S8jZCWOG6CCYQMUnJWWvSM1h+DYt9UlRnNQGQeXCWU4gh+MC3XTC
	 ajzFcYbYkjt9ILxaDZOrLIWhkggcHTYVY7m6U4rKUnviwxwoG067miUlMuC6BX9NsV
	 p9WF3PSdYRk1OZYhpUakKqOitHiNAaqiyoXB0oAIuETXmqltDApsT1yW1XvqOq0Pbo
	 tzu5Qkr6tgxXo/RlWCqMYXechHsqipHm/FS4t2WesJA//1XNdg3nhBChfi8iOd5eHW
	 2mqio5cYp6KDhhS6dxN12RZvUmRAwgkUbMxcM4jm5RLAKfAuR2Td71Lj8hmEVgcwZ5
	 /mmKjZ8KMnGEA==
From: Yao Zi <ziyao@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v3 3/6] clk: rockchip: Support MMC clocks in GRF region
Date: Sun,  9 Mar 2025 05:53:45 +0000
Message-ID: <20250309055348.9299-4-ziyao@disroot.org>
In-Reply-To: <20250309055348.9299-1-ziyao@disroot.org>
References: <20250309055348.9299-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_215458_133955_7BF8342B 
X-CRM114-Status: GOOD (  18.47  )
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

Registers of MMC drive/sample clocks in Rockchip RV1106 and RK3528
locate in GRF regions. Adjust MMC clock code to support register
operations through regmap. Also add a helper to ease registration of GRF
clocks.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/rockchip/clk-mmc-phase.c | 24 +++++++++++++---
 drivers/clk/rockchip/clk.c           | 42 ++++++++++++++++++++++++++++
 drivers/clk/rockchip/clk.h           | 20 ++++++++++++-
 3 files changed, 81 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/rockchip/clk-mmc-phase.c b/drivers/clk/rockchip/clk-mmc-phase.c
index 91012078681b..b3ed8e7523e5 100644
--- a/drivers/clk/rockchip/clk-mmc-phase.c
+++ b/drivers/clk/rockchip/clk-mmc-phase.c
@@ -9,11 +9,14 @@
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/regmap.h>
 #include "clk.h"
 
 struct rockchip_mmc_clock {
 	struct clk_hw	hw;
 	void __iomem	*reg;
+	struct regmap	*grf;
+	int		grf_reg;
 	int		shift;
 	int		cached_phase;
 	struct notifier_block clk_rate_change_nb;
@@ -54,7 +57,12 @@ static int rockchip_mmc_get_phase(struct clk_hw *hw)
 	if (!rate)
 		return 0;
 
-	raw_value = readl(mmc_clock->reg) >> (mmc_clock->shift);
+	if (mmc_clock->grf)
+		regmap_read(mmc_clock->grf, mmc_clock->grf_reg, &raw_value);
+	else
+		raw_value = readl(mmc_clock->reg);
+
+	raw_value >>= mmc_clock->shift;
 
 	degrees = (raw_value & ROCKCHIP_MMC_DEGREE_MASK) * 90;
 
@@ -134,8 +142,12 @@ static int rockchip_mmc_set_phase(struct clk_hw *hw, int degrees)
 	raw_value = delay_num ? ROCKCHIP_MMC_DELAY_SEL : 0;
 	raw_value |= delay_num << ROCKCHIP_MMC_DELAYNUM_OFFSET;
 	raw_value |= nineties;
-	writel(HIWORD_UPDATE(raw_value, 0x07ff, mmc_clock->shift),
-	       mmc_clock->reg);
+	raw_value = HIWORD_UPDATE(raw_value, 0x07ff, mmc_clock->shift);
+
+	if (mmc_clock->grf)
+		regmap_write(mmc_clock->grf, mmc_clock->grf_reg, raw_value);
+	else
+		writel(raw_value, mmc_clock->reg);
 
 	pr_debug("%s->set_phase(%d) delay_nums=%u reg[0x%p]=0x%03x actual_degrees=%d\n",
 		clk_hw_get_name(hw), degrees, delay_num,
@@ -189,7 +201,9 @@ static int rockchip_mmc_clk_rate_notify(struct notifier_block *nb,
 
 struct clk *rockchip_clk_register_mmc(const char *name,
 				const char *const *parent_names, u8 num_parents,
-				void __iomem *reg, int shift)
+				void __iomem *reg,
+				struct regmap *grf, int grf_reg,
+				int shift)
 {
 	struct clk_init_data init;
 	struct rockchip_mmc_clock *mmc_clock;
@@ -208,6 +222,8 @@ struct clk *rockchip_clk_register_mmc(const char *name,
 
 	mmc_clock->hw.init = &init;
 	mmc_clock->reg = reg;
+	mmc_clock->grf = grf;
+	mmc_clock->grf_reg = grf_reg;
 	mmc_clock->shift = shift;
 
 	clk = clk_register(NULL, &mmc_clock->hw);
diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index cbf93ea119a9..ce2f3323d84e 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -590,6 +590,7 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 				list->name,
 				list->parent_names, list->num_parents,
 				ctx->reg_base + list->muxdiv_offset,
+				NULL, 0,
 				list->div_shift
 			);
 			break;
@@ -619,6 +620,11 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 			break;
 		case branch_linked_gate:
 			/* must be registered late, fall-through for error message */
+		case branch_mmc_grf:
+			/*
+			 * must be registered through rockchip_clk_register_grf_branches,
+			 * fall-through for error message
+			 */
 			break;
 		}
 
@@ -665,6 +671,42 @@ void rockchip_clk_register_late_branches(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_register_late_branches);
 
+void rockchip_clk_register_grf_branches(struct rockchip_clk_provider *ctx,
+					struct rockchip_clk_branch *list,
+					struct regmap *grf,
+					unsigned int nr_clk)
+{
+	unsigned int idx;
+	struct clk *clk;
+
+	for (idx = 0; idx < nr_clk; idx++, list++) {
+		clk = NULL;
+
+		switch (list->branch_type) {
+		case branch_mmc_grf:
+			clk = rockchip_clk_register_mmc(
+				list->name,
+				list->parent_names, list->num_parents,
+				NULL,
+				grf, list->muxdiv_offset,
+				list->div_shift
+			);
+			break;
+		default:
+			pr_err("%s: unknown clock type %d\n",
+			       __func__, list->branch_type);
+			break;
+		}
+
+		if (!clk)
+			pr_err("%s: failed to register clock %s: %ld\n",
+			       __func__, list->name, PTR_ERR(clk));
+		else
+			rockchip_clk_set_lookup(ctx, clk, list->id);
+	}
+}
+EXPORT_SYMBOL_GPL(rockchip_clk_register_grf_branches);
+
 void rockchip_clk_register_armclk(struct rockchip_clk_provider *ctx,
 				  unsigned int lookup_id,
 				  const char *name, const char *const *parent_names,
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index df2b2d706450..ec86ba1dd38c 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -594,7 +594,9 @@ struct clk *rockchip_clk_register_cpuclk(const char *name,
 
 struct clk *rockchip_clk_register_mmc(const char *name,
 				const char *const *parent_names, u8 num_parents,
-				void __iomem *reg, int shift);
+				void __iomem *reg,
+				struct regmap *grf, int grf_reg,
+				int shift);
 
 /*
  * DDRCLK flags, including method of setting the rate
@@ -633,6 +635,7 @@ enum rockchip_clk_branch_type {
 	branch_gate,
 	branch_linked_gate,
 	branch_mmc,
+	branch_mmc_grf,
 	branch_inverter,
 	branch_factor,
 	branch_ddrclk,
@@ -983,6 +986,17 @@ struct rockchip_clk_branch {
 		.div_shift	= shift,			\
 	}
 
+#define MMC_GRF(_id, cname, pname, offset, shift)		\
+	{							\
+		.id		= _id,				\
+		.branch_type	= branch_mmc_grf,		\
+		.name		= cname,			\
+		.parent_names	= (const char *[]){ pname },	\
+		.num_parents	= 1,				\
+		.muxdiv_offset	= offset,			\
+		.div_shift	= shift,			\
+	}
+
 #define INVERTER(_id, cname, pname, io, is, if)			\
 	{							\
 		.id		= _id,				\
@@ -1132,6 +1146,10 @@ void rockchip_clk_register_late_branches(struct device *dev,
 					 struct rockchip_clk_provider *ctx,
 					 struct rockchip_clk_branch *list,
 					 unsigned int nr_clk);
+void rockchip_clk_register_grf_branches(struct rockchip_clk_provider *ctx,
+					struct rockchip_clk_branch *list,
+					struct regmap *grf,
+					unsigned int nr_clk);
 void rockchip_clk_register_plls(struct rockchip_clk_provider *ctx,
 				struct rockchip_pll_clock *pll_list,
 				unsigned int nr_pll, int grf_lock_offset);
-- 
2.48.1


