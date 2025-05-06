Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40369C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 10:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+UkOOLDwK4zwT0GpMFAHZuKdW+fgfaluePHVkFhnzQ=; b=miD577HWsrEjpYfexj9hj9I4uF
	nMWDDF7HuAF1+q9HbgiSIrfSG84XdK/c2sENSld6WPu8DW9wd8ZJNolmEC9l/3JjVbxw7F1vi605d
	shM/qDws0tKP0RESJnitb/wVPXXa3v9IiibviBHj6zIZfV7YLJ1bRRl8Nl2fdIjMn5EkUyh83+26Q
	30+8bB9vsgKCQrshwu+1js805zyxjRbySNh/5H8cAybFw2KFSksq1x6aoinCdWJL/7fM7aECdf9zs
	M3HAFWKc7gO1XoCbrpOHygfM2KUeqDfCJrkqPwbal/FBk4YmcAgGQosZRkL47EjGM3BHpFD0igB9k
	7R7OqcUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFq3-0000000BcYZ-0qai;
	Tue, 06 May 2025 10:47:51 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEW7-0000000BLux-3kYU;
	Tue, 06 May 2025 09:23:13 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9AE7E20731;
	Tue,  6 May 2025 11:23:10 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k22TyXZw3tdZ; Tue,  6 May 2025 11:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746523389; bh=KooZtKiKIS4kYyX45xKSekDnpaeKvpGX35KgXvdXVHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ed7ByAIgowDl7L0wG80IcxpsdGwUKPtgYkC0yox0lGF7IbJbHwXQskqS0yUH293Hr
	 PsCtNUxUGCEUrajTEArkxU8PveJb/P0b1hCZBWiQb5IMC/Tp8IcRqqyY20LqqgErK9
	 OCtxQ4rILSDLBgKjc9V5jvEJ9R6cQwJj5Dgor4jhaLcaV2TJi1+2KlwBrn1mVb9eB0
	 DLRVf1DlbGCFBgqJ/PayVoZvYXHsJlmb8F0HwBFg09Mn7+WUsHLKIc98bEwsHmjCN1
	 HNa+QjwNXoLl3VbHfw/Csh7OESXIS7mQQ0u/VelPLqs2rAdiz5sM8uRMmKo+GlEq9H
	 O0dgixJFL0dPw==
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
Subject: [PATCH v5 2/5] clk: rockchip: Support MMC clocks in GRF region
Date: Tue,  6 May 2025 09:22:03 +0000
Message-ID: <20250506092206.46143-3-ziyao@disroot.org>
In-Reply-To: <20250506092206.46143-1-ziyao@disroot.org>
References: <20250506092206.46143-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_022312_192464_B4BE4F18 
X-CRM114-Status: GOOD (  17.21  )
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
operations through regmap.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/rockchip/clk-mmc-phase.c | 24 ++++++++++++++++++++----
 drivers/clk/rockchip/clk.c           | 17 ++++++++++++++---
 drivers/clk/rockchip/clk.h           | 17 ++++++++++++++++-
 3 files changed, 50 insertions(+), 8 deletions(-)

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
index 34d96aa7cd51..0cba7e7e0c42 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -509,8 +509,10 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 		clk = NULL;
 
 		/* for GRF-dependent branches, choose the right grf first */
-		if ((list->branch_type == branch_muxgrf || list->branch_type == branch_grf_gate) &&
-				list->grf_type != grf_type_sys) {
+		if ((list->branch_type == branch_muxgrf		||
+		     list->branch_type == branch_grf_gate	||
+		     list->branch_type == branch_grf_mmc) &&
+		    list->grf_type != grf_type_sys) {
 			hash_for_each_possible(ctx->aux_grf_table, agrf, node, list->grf_type) {
 				if (agrf->type == list->grf_type) {
 					grf = agrf->grf;
@@ -612,6 +614,16 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 				list->name,
 				list->parent_names, list->num_parents,
 				ctx->reg_base + list->muxdiv_offset,
+				NULL, 0,
+				list->div_shift
+			);
+			break;
+		case branch_grf_mmc:
+			clk = rockchip_clk_register_mmc(
+				list->name,
+				list->parent_names, list->num_parents,
+				0,
+				grf, list->muxdiv_offset,
 				list->div_shift
 			);
 			break;
@@ -641,7 +653,6 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 			break;
 		case branch_linked_gate:
 			/* must be registered late, fall-through for error message */
-			break;
 		}
 
 		/* none of the cases above matched */
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index ebaed429a30d..d411de7a6f4a 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -619,7 +619,9 @@ struct clk *rockchip_clk_register_cpuclk(const char *name,
 
 struct clk *rockchip_clk_register_mmc(const char *name,
 				const char *const *parent_names, u8 num_parents,
-				void __iomem *reg, int shift);
+				void __iomem *reg,
+				struct regmap *grf, int grf_reg,
+				int shift);
 
 /*
  * DDRCLK flags, including method of setting the rate
@@ -664,6 +666,7 @@ enum rockchip_clk_branch_type {
 	branch_grf_gate,
 	branch_linked_gate,
 	branch_mmc,
+	branch_grf_mmc,
 	branch_inverter,
 	branch_factor,
 	branch_ddrclk,
@@ -1030,6 +1033,18 @@ struct rockchip_clk_branch {
 		.div_shift	= shift,			\
 	}
 
+#define MMC_GRF(_id, cname, pname, offset, shift, grftype)	\
+	{							\
+		.id		= _id,				\
+		.branch_type	= branch_grf_mmc,		\
+		.name		= cname,			\
+		.parent_names	= (const char *[]){ pname },	\
+		.num_parents	= 1,				\
+		.muxdiv_offset	= offset,			\
+		.div_shift	= shift,			\
+		.grf_type	= grftype,			\
+	}
+
 #define INVERTER(_id, cname, pname, io, is, if)			\
 	{							\
 		.id		= _id,				\
-- 
2.49.0


