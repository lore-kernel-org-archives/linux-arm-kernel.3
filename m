Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76618C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 21:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89MKnJVKCaLM+MA+nffQYSpI+ZY05JKrjUTkPxKBdMs=; b=ULrzsTxtTuT0M4CVYODwczKWG6
	qRSEq63ZLguVPlfoFmPX4oqXCT+ZZ56HeGPm6qf2jr46HX6qux4+0WoTlvbmqVRc7CXqZmnhF1jYa
	oPKjAzw8rzwIEP9YXB7IP+MV3JqxHPlMhJas2sG/nr8v5x7bWOfKGAAu6DBqWC6MJtFVyLV8bTeGU
	PShZRFq66qtzJOiqwx40l9Hq0At37+uJNdy5/j4tvaepdCtHUrcqHN2RKmQLD0OUNCLC8XQ0hHSeR
	n8BBAQinz0ZG2ARKvjcFqpQLUtFL1PLeDqnvEQdTSWf9BlMhRKqh7oQZH8ADpUiOxY0be5gHgXShh
	MAmpDGuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvfR-0000000DL2r-35Hl;
	Sun, 28 Jun 2026 19:59:49 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvfN-0000000DKzO-2tcW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 19:59:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493a285ff0cso4197425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 12:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782676784; x=1783281584; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89MKnJVKCaLM+MA+nffQYSpI+ZY05JKrjUTkPxKBdMs=;
        b=BI/iYculr7NyP44pn7j1tELkVLr3V5GTegEumlwnuKoW5SAE82u0MlqaL+3NBfBWlZ
         OAKUDqq0w8G7wFNOAIqZWM1zNSOxkGD1eEIC3alS00AVjOxqlUFEUxoZZSses2kOgPW7
         gODQFtzp11AFBd5UROEFQ0SnQ4I0WCfXYPChClcVZGrRZLbCizZRAx9gS5VEJepu/+7I
         Hu60K1GDAtUGEUqj0P/AoNsDxY+FiWxZycFnwjSQm0IriIcVngPK+myVy64zQqjOLM98
         itZt3/P+apLeJbdL1a6fXwwL8zT1H/9tJfXJ1E39zAirFoWgA9/DH+3/Hqrv5n7IR3Hj
         gTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782676784; x=1783281584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89MKnJVKCaLM+MA+nffQYSpI+ZY05JKrjUTkPxKBdMs=;
        b=O030LiP5Q3scPWRB4rwPLQbfwnxeBGGyRQRSQ9vvztu0ml6tf/L05lU0ofb9PT6Jac
         qck/OOtK2VRXac1oIa9wonZ1VsVnAgxEvoeOQ4W3Ih2HkJqDQyz91D7sRWz4FIA21DON
         pZkp8qK5Psr7nZstLnueDhrwgLI3/fvz8eEgxihbUjwfjhsnjdwDnCokfbw9acawHf6L
         iI3FchOGGp4TOhuerKMJDbWzjWTYoNHgBW7DKPtYol7VbF+r1vRBqO+DGExa085uxdt7
         4EnnNqEb0md+Pj9kI6utdSiHQZEuIGzhp8VPhA72RZ6dIgoDj/iXvv/O779xoFbJSIq3
         1xbg==
X-Forwarded-Encrypted: i=1; AFNElJ/azi96fB3xc/BmF/W2+tk2HdIhOSBpjS5fBcZndgbw+NNDM53kBHL3RBSmA8/izEMavf2R3o3heA73mHguwlZ+@lists.infradead.org
X-Gm-Message-State: AOJu0YzfU8qKCVJ1BWjVXR4Sd1RMlFKhYhQjl15YSTi5KREq9rA/Pp/T
	v/yexXp69LpMbt7J/sceWQY4pPMeiodrF4EJaXuoZ8YdfKy5L3Az2y1p
X-Gm-Gg: AfdE7cntElNwUZ9e9CQGhw1n4aUAASQ3rCxf64kApJZYEE5eLJTsDdIcJ5jblaszVLs
	fNtGZkngEtXuaDZs/AlPMrIupMO9JUo+qOVQ/B4txZWKxRdYXe3UhaDpJkKVCx4ixauvYC3w7zp
	jU4DIewpW/1pWbKkFpKGLnMKQleq4z7JuNgfkcPwGBpb3etCtQsJ742DVrpq+YTK8uVQTkBEjt3
	HfIHbEmTrePms1iik/kpppdyCXwU97Uh2nvnzDbF0kmpDU+vHmjKLN/4hmB70RaIpOMMbh+kJnx
	i5SPnE2tzanZG/p33Fwwm8r4pyVUMXJ07qbUZ15SQ5qrh264NvuWQDOyxeh9hskJZC404tf2NYT
	d4vVNb+k4FYM0RPu7fTpzytEVW7Yv0Dm1SBbzYRaUxDnmzfnEO2v3DlcUQ34yGrq4w0IMJG4q5d
	VOgYeJytriG8S4GSrFiFP8Jew=
X-Received: by 2002:a05:600c:8a0a:20b0:492:4c2e:9610 with SMTP id 5b1f17b1804b1-4926684a979mr157542315e9.11.1782676783903;
        Sun, 28 Jun 2026 12:59:43 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ae96c85fsm15133505e9.5.2026.06.28.12.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:59:43 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 28 Jun 2026 22:59:02 +0300
Subject: [PATCH RFC v5 07/12] clk: zte: Add regmap based clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-zx29clk-v5-7-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
In-Reply-To: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7463;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=2+l50JZBgJ31H5GA9uKbgWmub3sUmClTHJHKKamh70A=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqQX0UjKX2E86DwxPCXUsAMMepo2ureHZFl871M
 WedtZEeUFaJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakF9FBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJxiA/6A+OCQnWkENsb9XxqVtGn91amBUFZlKm
 vyASzY1vsaK95twy92Q+qvPnnKPO+9iICpy4vFtbdUXLMwDp6abwowAe6IqSSDZgNVe7Od7OnOz
 dyIDBO5qPsCObOtfERKTTOK5BJxcHZVU8MyTsS6GJ6aH6ocWqOGwbXPGxp3/ooGpp38xSVFY9cZ
 NmkPkqFYng+d0dIh/7/G1LO+Rrb7aTQT4E87/n47NHOqzxAi+dcjhUIGELNjnI0zADhOs7oQt0Q
 zmzRNHNpBCHHaKUaIFR6jitOtZ3vx+ALvTzRUxqDllXIiuLKSGH1OiVu6d0JSntWlDC9CkV3zLm
 5hyy3HbeKNN9yfuiSmppn6Hl17jzXJfzYD2L+pcRkKJ7yjjRADVTCKQX7cxKeVCR2SXZL9fQc48
 09sKNHiX886KNwAp4Ubj35HZ2OxktyU8x7fNGXNw0xTGRIR9dO84nnOBK6wHCrcdabD/Lp+AcGq
 O3uGb/zJ5j5tQF90iUb84QvtR9nScie6mim8hOzrNUJmxIZH0494Aw08hTMstsGaSxNb/It+HCw
 tjmnKvYJtOw2hakmy0n8yRBQnfmw+a4nvhmuR6VTenAuCrnlG3P54T22Cs0FHvZu5A0oZlN5AHw
 QgKe/pg3e0dTA3ZjY57d0Y5W5GdPLPBlCTIK4eFEZ3NWHK4CjqJE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_125945_779421_8C7760C1 
X-CRM114-Status: GOOD (  18.71  )
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

Version 5: Use regmap_test_bits in zte_clk_regmap_gate_is_enabled
---
 drivers/clk/zte/clk-regmap.c | 221 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 218 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 7908f1562f63..903998ca9508 100644
--- a/drivers/clk/zte/clk-regmap.c
+++ b/drivers/clk/zte/clk-regmap.c
@@ -6,25 +6,240 @@
  * Author: Stefan Dösinger <stefandoesinger@gmail.com>
  */
 
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+#include <linux/device.h>
+
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
 }
 
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
+};
+
+static const struct clk_ops zte_clk_regmap_divider_ops = {
+	.recalc_rate = zte_clk_regmap_div_recalc_rate,
+	.determine_rate = zte_clk_regmap_div_determine_rate,
+	.set_rate = zte_clk_regmap_div_set_rate,
+};
+
 int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
 			     const struct zx_div_desc *desc, unsigned int num,
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
+
+		if (desc[i].id)
+			clocks->hws[desc[i].id] = &clk->hw;
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
2.53.0


