Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40408C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xg8JnQQa18VgOsg3xqJv8hZDkmulAWkx5pzvnSbFcLc=; b=c6zHmxTngE74u0z4mdGrjiGBfS
	KGR7za1bI6tf//eqIVhgWVWJkH43xJ8nhz34e7905P1qkh2whFa2zBtFvkkCQOXXilo4+gW5FxvEU
	GDt32g6De8AhreW133uHEPaQGI7sMcC70qU/NmDqbhVhDCNMvPouaKTtSqGiNUxTjHYAk/Z3LKJqA
	cDRoxI+e3JjJkhjbzboXXJeP3t8Lo7afBMYkTlWyYgSszD0cjpAqgpUchYkY/QCZIiA7j/MzcgObJ
	qJMYzqTtScEwu5v79GAVUj1WpltolNnYIUnfaD8OMiTGFIpyMR3GAqlEBPx3jfSxJbaZXBdpzUZHJ
	SkgQ3hOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTkv-00000000eZy-1jS2;
	Thu, 16 Jul 2026 21:36:33 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTkj-00000000eLV-1tfX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:36:22 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso4420180f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 14:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784237780; x=1784842580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xg8JnQQa18VgOsg3xqJv8hZDkmulAWkx5pzvnSbFcLc=;
        b=beWqP0ziPbbU0jHnA7XIhr6BLx09/wUZ08Mr1r0F2wkUTVk6jTvyGZcDo4ikemz7p5
         GUk38Y1wQEODWbmINxRS8rxNxsXQGj3xuVQKB5BuWlFCR0oMjkW5R2qmX7fBJ/v/HCHj
         poulDaDkGswPFacDgidrOA7iXCsqk72vr1Xi7TVErCjcmZx33eP5e5qSa3g8CjZMdFkW
         ruaOYuaPVVxSF2sb5Ofz2Kcrtf8p//LhqzwPZaIvnBs7f0ETdYVcxti4SkijFwSr/UrA
         4NoxO5i0Sqa7HuWdHFCicf3tkw38irEZrB/4+ML4353tkvouS0xle+Wzac6jPvyGJd6h
         4b5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784237780; x=1784842580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xg8JnQQa18VgOsg3xqJv8hZDkmulAWkx5pzvnSbFcLc=;
        b=TgYqAv8caz//bhenJj6Pf3EPxmpkk96nVWPPts+oiloh4NlnAI1tq7iQhoG+94ISSj
         3twJHXdQpOgDxP/Z7T9J2fF6Ue5I6d3Y//U7CowxOpAf0I0F2xcGsyW9cWWRIjNS8EQt
         eAzwdGQE1oKsBR6f0dbU60OpqDYSm+3hYFrVhEKdzvSI8gZEzX0XkCHz4gHS4a+S56sZ
         xPLBaehiedsWDmmgyU5yeXLhD/Q8P+vC5s2TWHIXD9fZ0t4UEkIjYKYhIBrydDf5fsbW
         TUQr6/VC+oXs+qjWiBeEkrBWT1xHF/SNmPkAYB7zFpf0oKbfbUWHRsDj9abMdJ9SrN9k
         KXdA==
X-Forwarded-Encrypted: i=1; AHgh+RoDcUQ81w6+gyTmDQ4/7x7/z+Cw4pP/NJBVymvxJ8HFhbkJlThEGeA7supT02K5GTt7IJamoIqhVyM6g0Ygcctc@lists.infradead.org
X-Gm-Message-State: AOJu0YxLEAQ4M9XCZ0cfWnaG2dr5vjC/u9EF8GHoDFoRDfwoPnDoEep7
	7J4ZkdpAEQPnBd8imLWScoeOD3dWY4k8N6lIKg1el/lt0mj/ba4xMd85
X-Gm-Gg: AfdE7cmXmNalUsTUTqHP4+d6d/L3iWz9pI83xFs0B4j08QALb678trW5o0gfdIQIFCb
	W1lnRR8jlfkCxuKaDN5z2Q54/2Wck8pcWBfZrUFXNXG6uBKF+k6euz+eNfveyj+ciaYKt9YX9OL
	GwrDmvhTI+RiI6VpWMnDiIqjgTYxJ5R00+HVZOQTJ8mXr/2XYltx4ukAOHH5QLRZFouzNWteBoE
	R+KxD3cIYLl18VYvZISvoyHFNwtPTGIafcqXrCoZZPotbaU2dfCq+XxzPsVxGE0niFtoKh+wnmL
	uDTCaz/9H4BwwddMc406OqcpdQ9QvwUh5+KatPMB/5t0z4boDBhIUCWUKmqJbD07BhVHecSL0Yc
	cmAvwoCO+Uis7/RX4gaz7Y84NMLcwOYYr7Dd1P9jtW6TDz7K+EXge9uTEQqd/ngT9r9VjE/VvvT
	XyoLlrA6pS96j8DEqnocmjx/c=
X-Received: by 2002:a05:6000:46ce:b0:47f:4980:4908 with SMTP id ffacd0b85a97d-47f49804bfamr10491531f8f.47.1784237779628;
        Thu, 16 Jul 2026 14:36:19 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f09sm27517548f8f.26.2026.07.16.14.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:36:19 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 17 Jul 2026 00:35:43 +0300
Subject: [PATCH v7 07/13] clk: zte: Add regmap based clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260717-zx29clk-v7-7-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7477;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=KXSuXQNJk3ORRNd5NfnirVY5+QwyE07yYWtBz4DnKHs=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqWU6xTpEj+PxUq+psRhpDpZ/4YNqvMpdsmDv2W
 8iqLIm8VUeJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCallOsRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJWZhAAsXnirXDLIGyyGdIEHfrA8NyVaAwHdV4
 OZujxpH+1J+WDFbjewCh0Iy8Y3gBXSEcPDGYEfvlDYMfKlVBMFCS83saHLiPQez/TaQiYHaWlVo
 wpHLgP2v1buZOLyYLDVawk1cH/CQ+Pmwh0HvPmwF5Ea3DQxnc8G10IpoYHA62rIBeNcgMp8RzK3
 PkVlTMpK44sWlm/zZVpclBnT3KZZlpruFqfrSUGBjhkY9k9aPDlUU2/W6qDKVIARcty5gA4imwV
 1xGfUGeYeAQ6c9GRQhyyG4SAqiWjwbf5eP7Yw5EAi8gD7hxqUgk89IES3W1BKc7c/CuZhQwuhfp
 NeK1g/bCw9QyrIHHa0kbzGkjQV4gI0GhagvJuFkYjMEO86YzNGbdWiZ1dgTI0ft4Bjn7fUGd2Jz
 N9KnvuDjBQmi2PXPMFKV/tUBe4Jk8mL2jiubP5oOJZT6pKTXO/hV1ZesaFrGF2Qyqsm0olwL2DC
 h6cCsLeZQkbbD0paZtkp7xXLT2WsvEi0/fIZ+f4wl+FtiqMMujLZWRg1IGcHKjn8BCxJK/QgYUY
 90Xb+F0FDkJJoUenBB4ofWJLSXBoxx9whb/HNwxzHXJ5L+nkgCQv1jMDweJaiHvUm+IBT/eR/84
 eiPxQKNz0u87EUmgwvsiNkuym6CrZ1IlEJBrF9sbmGOXQov6s3lE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_143621_555579_492AA939 
X-CRM114-Status: GOOD (  19.03  )
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

This is based on meson/clk-regmap.c, although slightly simplified. I
have kept the copyright lines at the top of the file to indicate its
origin.

I see that numerous clock drivers have their own incarnation of regmap
based mux/div/gate clocks. If there is any version of it that is likely
to be elevated to shared code liks clk-gate.c I'll copy that and try to
use it as unmodified as possible.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 6: Remove stray regmap (Sashiko)

Version 5: Use regmap_test_bits in zte_clk_regmap_gate_is_enabled
---
 drivers/clk/zte/clk-regmap.c | 218 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 215 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 984abeb45ab2..198628f73b92 100644
--- a/drivers/clk/zte/clk-regmap.c
+++ b/drivers/clk/zte/clk-regmap.c
@@ -7,28 +7,240 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/container_of.h>
 #include <linux/device.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 #include <linux/errno.h>
+#include <linux/bits.h>
+#include <linux/err.h>
 
 #include "clk-zx.h"
 
+struct zte_clk_regmap {
+	struct clk_hw	hw;
+	struct regmap	*map;
+	u16		reg;
+	u8		shift;
+	u8		size;
+};
+
+static inline struct zte_clk_regmap *to_zte_clk_regmap(struct clk_hw *hw)
+{
+	return container_of(hw, struct zte_clk_regmap, hw);
+}
+
+static int zte_clk_regmap_gate_enable(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return regmap_set_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static void zte_clk_regmap_gate_disable(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	regmap_clear_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static int zte_clk_regmap_gate_is_enabled(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return regmap_test_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static const struct clk_ops zte_clk_regmap_gate_ops = {
+	.enable		= zte_clk_regmap_gate_enable,
+	.disable	= zte_clk_regmap_gate_disable,
+	.is_enabled	= zte_clk_regmap_gate_is_enabled,
+};
+
 int zx_clk_register_gates(struct device *dev, struct regmap *regmap,
 			  const struct zx_gate_desc *desc, unsigned int num,
 			  struct clk_hw_onecell_data *clocks)
 {
-	return -ENODEV;
+	struct zte_clk_regmap *clk;
+	unsigned int i;
+	int res;
+
+	for (i = 0; i < num; ++i) {
+		struct clk_init_data init = {};
+
+		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+		if (!clk)
+			return -ENOMEM;
+
+		init.name = desc[i].name;
+		init.ops = &zte_clk_regmap_gate_ops;
+		init.parent_names = &desc[i].parent;
+		init.num_parents = 1;
+		init.flags = CLK_SET_RATE_PARENT | desc[i].flags;
+		clk->hw.init = &init;
+		clk->map = regmap;
+		clk->reg = desc[i].reg;
+		clk->shift = desc[i].shift;
+		clk->size = 1;
+
+		res = devm_clk_hw_register(dev, &clk->hw);
+		if (res)
+			return dev_err_probe(dev, res, "Failed to register clk %s\n", desc[i].name);
+
+		if (desc[i].id)
+			clocks->hws[desc[i].id] = &clk->hw;
+	}
+
+	return 0;
+}
+
+static unsigned long zte_clk_regmap_div_recalc_rate(struct clk_hw *hw,
+						unsigned long prate)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk->map, clk->reg, &val);
+	if (ret)
+		/* Gives a hint that something is wrong */
+		return 0;
+
+	val >>= clk->shift;
+	val &= clk_div_mask(clk->size);
+	return divider_recalc_rate(hw, prate, val, NULL, 0, clk->size);
+}
+
+static int zte_clk_regmap_div_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return divider_determine_rate(hw, req, NULL, clk->size, 0);
+}
+
+static int zte_clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long parent_rate)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, NULL, clk->size, 0);
+	if (ret < 0)
+		return ret;
+
+	val = (unsigned int)ret << clk->shift;
+	return regmap_update_bits(clk->map, clk->reg, clk_div_mask(clk->size) << clk->shift, val);
 }
 
+static const struct clk_ops zte_clk_regmap_divider_ops = {
+	.recalc_rate = zte_clk_regmap_div_recalc_rate,
+	.determine_rate = zte_clk_regmap_div_determine_rate,
+	.set_rate = zte_clk_regmap_div_set_rate,
+};
+
 int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
 			     const struct zx_div_desc *desc, unsigned int num)
 {
-	return -ENODEV;
+	struct zte_clk_regmap *clk;
+	unsigned int i;
+	int res;
+
+	for (i = 0; i < num; ++i) {
+		struct clk_init_data init = {};
+
+		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+		if (!clk)
+			return -ENOMEM;
+
+		init.name = desc[i].name;
+		init.ops = &zte_clk_regmap_divider_ops;
+		init.parent_names = &desc[i].parent;
+		init.num_parents = 1;
+		init.flags = CLK_SET_RATE_PARENT;
+		clk->hw.init = &init;
+		clk->map = regmap;
+		clk->reg = desc[i].reg;
+		clk->shift = desc[i].shift;
+		clk->size = desc[i].size;
+
+		res = devm_clk_hw_register(dev, &clk->hw);
+		if (res)
+			return dev_err_probe(dev, res, "Failed to register clk %s\n", desc[i].name);
+	}
+
+	return 0;
 }
 
+static u8 zte_clk_regmap_mux_get_parent(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk->map, clk->reg, &val);
+	if (ret)
+		return 0xff;
+
+	val >>= clk->shift;
+	val &= GENMASK(clk->size - 1, 0);
+	return clk_mux_val_to_index(hw, NULL, 0, val);
+}
+
+static int zte_clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val = clk_mux_index_to_val(NULL, 0, index);
+
+	return regmap_update_bits(clk->map, clk->reg,
+				  GENMASK(clk->size - 1, 0) << clk->shift,
+				  val << clk->shift);
+}
+
+static int zte_clk_regmap_mux_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	return clk_mux_determine_rate_flags(hw, req, 0);
+}
+
+static const struct clk_ops zte_clk_regmap_mux_ops = {
+	.get_parent = zte_clk_regmap_mux_get_parent,
+	.set_parent = zte_clk_regmap_mux_set_parent,
+	.determine_rate = zte_clk_regmap_mux_determine_rate,
+};
+
 int zx_clk_register_muxes(struct device *dev, struct regmap *regmap,
 			  const struct zx_mux_desc *desc, unsigned int num,
 			  struct clk_hw_onecell_data *clocks)
 {
-	return -ENODEV;
+	struct zte_clk_regmap *clk;
+	unsigned int i;
+	int res;
+
+	for (i = 0; i < num; ++i) {
+		struct clk_init_data init = {};
+
+		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+		if (!clk)
+			return -ENOMEM;
+
+		init.name = desc[i].name;
+		init.ops = &zte_clk_regmap_mux_ops;
+		init.parent_names = desc[i].parents;
+		init.num_parents = desc[i].num_parents;
+		clk->hw.init = &init;
+		clk->map = regmap;
+		clk->reg = desc[i].reg;
+		clk->shift = desc[i].shift;
+		clk->size = desc[i].size;
+
+		res = devm_clk_hw_register(dev, &clk->hw);
+		if (res)
+			return dev_err_probe(dev, res, "Failed to register clk %s\n", desc[i].name);
+
+		if (desc[i].id)
+			clocks->hws[desc[i].id] = &clk->hw;
+	}
+
+	return 0;
 }

-- 
2.54.0


