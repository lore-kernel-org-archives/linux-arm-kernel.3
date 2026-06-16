Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E8FCD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 20:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGipdqLCxq5G0EmePkbO7V4LoprWK6DBkEcoR7sOMUQ=; b=MRkZZ1Aoe/9/iw4+vJwk18uT9m
	oWX99NXHNz/yONPbE3cDd12KFPUI/X9WbqME10Q6ve2w0CiHa2o1JYMwlvRuALaaoTpHjVjayLjbh
	Cudw6xOQhoMRJR+z+zW65twazwz2Q6+TL8//SpwIX2I8hyjnbaxT2NlouU1Gg8Tj9qUuVkz2ky+Zr
	iXHv33ySxB1HJHO4xUGlkHI44orGiOQTfuT5I0d9IUa7IUremoAxyswobhXl18XnI09hQh0n18OyM
	5DHB8/wibuygdPOZLjc9ZVZFgf9uaQbyyLFrRbV9Kr1H6sgcSLLJrwnPRB8+BR+o9YG7Z7ffW/Lke
	tzQS53Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaNW-0000000GI3j-1KUg;
	Tue, 16 Jun 2026 20:27:22 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaNQ-0000000GHyM-47Ne
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 20:27:20 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so50408945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 13:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641635; x=1782246435; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGipdqLCxq5G0EmePkbO7V4LoprWK6DBkEcoR7sOMUQ=;
        b=kl39BMkdJIFbms8k9rBgAFCAKgp5fY2RRZ5Rxr/sDII0kss5tz0KoJLp/u6OXgQSSA
         C01US7awLF0IOZ42ytSLuiqD/Fds8NDO0yC9IPYtGpmrSTH7Vw7a+6DQlYOwcoFTLxhL
         Hs+ACWenvwh6ghg+Og6y1n7EDVHE1UQ5BPVQaF3smbkNjr+gYk1m/htCE/Zx9a3/8qsb
         fVeSQZEJEqAosbesEYLZi94/9xhXWh59V/SkRBqOTtalKw1goAWwYS39N4OqBO7n6zqX
         nWRHXs/wOiuKINlryFcVj1XnCsm9gyKCuoCfH8fOKGok89gPGo1gvKP2wlA9lxYuYCwX
         xAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641635; x=1782246435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CGipdqLCxq5G0EmePkbO7V4LoprWK6DBkEcoR7sOMUQ=;
        b=pKWuYt5bKPysTaYIUm/LB8Cks59RzQxR1VhuaQ/smtpYbR6bRZZYX8m9Ddumo65GZv
         QamzSyjtTXSgEG7ffXtE4z6Vns6laaMBWnPywxDkKkYb0mCcaprYMr1/Didmi0ZqpH/g
         KgoNu3HtH9yRUUK1HNnqtU2GOKQ494ME2Trimy/pgwxESlcwEU6sebtp9i9OyRkNdid/
         wT8uJ5wu6MCg90qbYajFTW+M1PcuR4DqLHML/e87lRBEkpQvRhWF6+Pcl0T51uELxHGR
         +8LX+K18pBsEUJmz0ohQKpuUi7b4aaD+LDlfNnVlnokE78nKMPNN4oPYjY9HexSiy634
         ufEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wM1ex8yVMCaqca0BFxlmZ5Gf7VgpDSqi6RfsAX7sIzKw3rBzXDf7MsLQQHSmhLhs5Rf51Dls5nT77uepfLOWu@lists.infradead.org
X-Gm-Message-State: AOJu0YxSdT5w3i1r+O+80nngFxiEajgPjm+53LbYD5JaosBIW+NchnML
	V3ZC3EPuHM5B5uERVJu2C+dYycRwm+02KU2WYJXSTlPruUBm71lESNhd
X-Gm-Gg: Acq92OF6R3oFRGvqr+fNN+3HD4ZUjD60vUWnDsKxIXOAS8aNPHx6rGOoPf3tXAPl76q
	o1yehVdSL9YU6uu5GidEWxzjzQqFS5Xw/wMHxtI1Cn9iyvJTSrHwdOhez0QuQJxFjlE+2gZotST
	lVXn4G49c1fDiDWIgXJD7C7kRtSgaC/L9GyIL8xW4FlXc8FEBv/dNs5dAAwZgHB7YSQLS/KiTjw
	cD2hh/sBBJH0B6Oa3aZP7c9Ww3UAnToucblBadcWUq2uvKsxm7E+YNhrGDIBBiCcqHS/kPWJVNP
	Hj/cs1gQjIIqyxENrCUrpgcnjn1TPIxQ82REbFsML0a8In3NSgc7cdYXumwjv+B65T/7tFRrYy0
	xnmWciBO0Xg8WX/3UIdZL+hSRdfWx0o7OYrfZm+PJ8C4tEjp6P0MbfwNuwKEmBuOD8ZDDnyaY2J
	Vr3jDCYY6WzObzwiYH9PQ+hi7TFSFY7lo/zX6Pif75nqU7
X-Received: by 2002:a05:600c:c3ce:20b0:490:c682:e37d with SMTP id 5b1f17b1804b1-4923413c249mr1984505e9.32.1781641634917;
        Tue, 16 Jun 2026 13:27:14 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:27:14 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:26 +0300
Subject: [PATCH RFC v4 06/12] clk: zte: Add regmap based clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-6-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
In-Reply-To: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7393;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=wYgtHGRukfQ+uMOMTNkE7udfhe0qluyVy0T100d++n4=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGGXar6sQjjyUXBAtw3LjbBqdR7RyhsyEnFt
 VfCX1LQt3OJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxhhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKpbA//aKmOhY9N5dT2IVBCWEv7XQWgU/O0TjP
 HlG+KI3DCoTnN/nOpBdPrJWBU1FIVGNQGvvwt2BxGoUmcss7JggfoCxtP+fkZ+YaXKgFuiDIMYT
 FuOWMQo3gz8Jr8QTFgaKocsCtPBgWRckgFqEr7UxHWbYcrF1Zv4maJyq0XPQlCO4BmGeS0MMmWM
 UNI2IQsagnRBhgMZybTzz38CamhZ8IsHcqIDVE6Ta5YU8yo/Qj+7QomX1M2yIiDioTIlmCGqjt9
 ppmVANKUzyfb5q+XWZhZCXzZJm2scbESYH6Zm4BusPf1lCtke2i0T2HTOCxPoSVH0gt4zxActKW
 F3HDeckj+6Bnyz85mGy0VpeJoWq1MHe8ct9pvMgrvI1387x7Y6LKMSJGEMamwZsoQN5iBg7ZgL/
 hwtWztJlo/ZlsUrvKBQ9fkMkB5fzYI6pgCkfZrCfoRKOVQ/MkC+5Kv4ld28GM4cetbm8LMrwwpe
 wVWq5IGN+uaBncXKg70S/hsHDDt+N0wwj7zKZi4eWUBEa4UzxxhsC6S0WCvVVEqVdcJJUVZn2Uf
 ORi8iiw/92PkwJpu3g7wF7EhB1OWvDTWZ7XlWVdEZXxiGzdvcjuYPy76uVCDxa+pX/DtBIe4iW7
 JqX79kd1OwqqjFsdAxrdmdxwZAhD9nTCuMdtToJaOxS+CLk6fpds=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_132717_325007_D11C214C 
X-CRM114-Status: GOOD (  18.26  )
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
 drivers/clk/zte/clk-regmap.c | 223 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 220 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 7908f1562f63..d9459417d17d 100644
--- a/drivers/clk/zte/clk-regmap.c
+++ b/drivers/clk/zte/clk-regmap.c
@@ -6,25 +6,242 @@
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
+	u32 val;
+
+	regmap_read(clk->map, clk->reg, &val);
+	return !!val;
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


