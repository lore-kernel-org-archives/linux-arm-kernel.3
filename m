Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1923C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 18:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPLJsnr4mJ5WRyjiR/tQT2OoQCWwzvDXHsBaYmk+BYc=; b=pU44jQ2IkfPDiyq2i5ykfos3wi
	Gud5AD3BOy8M68d4xhr5Fq0d60CywvR7iyQ5J3dJu4EoIo2nQOzBNTB7tQLhNjNQRcLVZTKyYUp3n
	ogg+U63YA8Q0Lz2MtAG31aFyka88zmxvXXkJ5dBDSFnXdI0i5p9/nryd89chXiSWiHfUvWSi5qlkd
	59nrRIeH7c4f4MUzPWkUw5oZ8MLwTViNOGYK8uKVxX5Nf1Pq+pB6Rv8xaLu6AuRoRmjgddeORXzx0
	qVu/k6pLc2ayXS4WWT5b4Rk1W/IC1+lWTcu3BvxFNRK3OPy/RA/cGRAh91OFUR2ltg0xe2LxcqwsO
	OqP3EbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ1U-00000003dy7-2X1V;
	Mon, 27 Jul 2026 18:25:56 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ1K-00000003dod-1nFl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 18:25:48 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so1504777f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 11:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785176744; x=1785781544; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPLJsnr4mJ5WRyjiR/tQT2OoQCWwzvDXHsBaYmk+BYc=;
        b=s7SUJwUlAbgSC/y6YNNzOPBl5HphAxXL0g/W5O3YrPs5fO6WTG8Dlg8f9yWWSPJhyl
         IZ8t5xQYvTvk/Gtq5cfu83Mm5hEZhtSI57bwfUDSgIyISYZQ+EFWbCPiQRU0uWUoBIor
         VZkud3HgKtdZF4muQN4H7+QJNlr2Xgzq/jbsLMtBXxODZJ9bCqaTHrzfXSy2R9RlfkdI
         mvn03zwfETmkwAYO2N6yHEv2CPS+BP2TD4/EW+dnffa3lwyVza//1MwK5HKf31YaHZQe
         L3PNZy6LYamFhya2hUjbzXouNISm2xuiOuohZBElEZ7ZgH57orkPnFU/xhPN457y+QHE
         2YNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176744; x=1785781544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPLJsnr4mJ5WRyjiR/tQT2OoQCWwzvDXHsBaYmk+BYc=;
        b=UJiOVJWXZECgqHoT2rfIt12FfYeTwhjW5g5lbXI3aqHzLcF/jpIt0qJNuRiKj7bTDM
         Y9E1AiivkzEKDjOchwJd2RbJWeXWTtPNfDIO+HiuQOjq3rIA7FWhi/wLuiMsdwe9Rstv
         J2bPQWvvUFB5Ylob778h6JDEYr6kXZ51lU9RYcK1PWaD7N8GlxTYcVXOt5qAFqEKwZND
         nH7nWswP5vVpPsMw+zTUX2xtIhORIfKU/VKeAtXt6+k+AbGGwl2AzVkiZCeWbeQ0fASZ
         1fpwSTJULchQqJfRSY48vCjlnz8VeQs5tsZhW5PvWXigWlPl5n/8/4kZqTrBZKIMuY4I
         lF0w==
X-Forwarded-Encrypted: i=1; AHgh+Rr+jkycbKjTz02glASwwsBhBdSVrMC6jb12m+JsDdqnQBHwbs+wdG9M3L+uGwwnXUdj3Oan22EZCXAg2OrRHTx1@lists.infradead.org
X-Gm-Message-State: AOJu0Yza/QefJXNOhAJ6eqkkhpUm/JCAJL3K9r7AalJOJyNJUU7JCBha
	zsbGaSmUDC+YxSca4KusOqNcnwp79WhjtHkoMhcdrewMu8YGMS0OqApE
X-Gm-Gg: AR+sD128latgh466SbH31QjGxz/yugJAlVyLyaSpl55EQXleij1vfa6246xwReLWr+f
	NuzpXxD8rgvUSqLX5HGSHYJa2PGSc1tNyi9Y22hGzc3LPhwSrPAkastiHNjXjVAIyQxOMetwysT
	mFoTCI5LzVN7YZYJOStZZn5OHi5OpKsnutPtdpXMqGZNUuQp72WoyNNsRAvoC0qxPm7ojyQKUSY
	xp5OQ3ghm9M1N8HaUiPyrOZJpC/1bdj6lCUWGwspAJuggAoIfSbm+Ny7a/R0VjAUZmY6S2OUFS7
	gy+Wg2pRRf3u6OwRG/Hx9oSo4Fl/pwpw3GWXGemUSMiXPeECGIv8drp+fL/p5O9lGpO5W2J4u/K
	YHcEun3GgC3hCr39MZtH5nlBzLNM+LyhMdkjU7h9BART9dHJ4qtUXqMFDPQtp1eWbhwwQaRjFM5
	aUT2MYFYiDiqHj/qWbojo2McE=
X-Received: by 2002:adf:e012:0:20b0:47f:959f:f69c with SMTP id ffacd0b85a97d-47fafa52c34mr225094f8f.7.1785176744473;
        Mon, 27 Jul 2026 11:25:44 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm50689288f8f.18.2026.07.27.11.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:25:44 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 27 Jul 2026 21:24:21 +0300
Subject: [PATCH v8 06/12] clk: zte: Add regmap-based clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-zx29clk-v8-6-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
In-Reply-To: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7625;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=lkEo1hQX818bV8klOl1rHkApNx2dWCjcL/vdwmX3gt8=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqZ6J6voGaIGRnfkw/WsvKWgG7Xojp9nR0+4Hg6
 CO/uoksqHaJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCameiehsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI7RQ//Rzt23Kal4l7Ii5GLG5TwdgjHSQKUtSo
 //BFxzyh8/ITW3MgaZwGr63F49p9DbaVw8a/EK0IUaftdyU+P/RiqW3QEP4z6QXmQVp5MCedOIG
 NZzcXSkum6/iOCgcrr/eyMKM79SraSEKDQDDO1SB7qcMHAwVvi7109U5xisa6BkvRG9LX1YJ2Hg
 M3o2uAm3LxHxQyaoCnE6AS0dubNOMgkz4SLNyLCCaOCZkVT0q6wZ0vUAJR1yJYu8Fd+Ek0myu32
 5Y0UY7aECGe/Wzuj8auVqlge/zs8ggfiD0YFCvR2zYmVbGx2CLJmYxNTRVQ6heyrcZvoyXVvvUl
 7yja8y04XEshU5yWu9SFUHx+2F92CluaCJF/3AprE9yeZBsDlmKwJaEFGPV52qeLIMTgLXYpr8j
 WfgpxUcf+5dZp2iih/CxYpNmAXXJRnb+qojAUPVk2BC8UBxsW+U0L6aMqYPT7VZ3/iDXLEoBIbo
 x2tNfOigN8HMhq+1Q0qqRrur+kSQRsdVkS/3gFiBOFGZBBjHsOjI3oRVY5tJGzND/LfanPqL3/l
 unsr+j2+INDpDqNegm2M4+2SOU6t1HQt3jqvCgWxoyNKISY8BHI5q2DqzKHwZyAnkqP3LthN2RE
 PzOXzaaZs2RFT8QwlVadTzWb5DgCJ5ddpxDrc5omllc0HMzL0RSg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_112546_560377_05983BFE 
X-CRM114-Status: GOOD (  20.61  )
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

I see that numerous clock drivers have their own incarnation of regmap-
based mux/div/gate clocks. If there is any version of it that is likely
to be elevated to shared code like clk-gate.c I'll copy that and try to
use it as unmodified as possible.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 8: Use ZX297520V3_CLK_NO_EXPORT instead of 0 for unexported clocks.

Version 6: Remove stray regmap (Sashiko)

Version 5: Use regmap_test_bits in zte_clk_regmap_gate_is_enabled
---
 drivers/clk/zte/clk-regmap.c | 218 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 215 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 984abeb45ab2..671b81bcda4d 100644
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
+		if (desc[i].id != ZX297520V3_CLK_NO_EXPORT)
+			clocks->hws[desc[i].id] = &clk->hw;
+	}
+
+	return 0;
+}
+
+static unsigned long zte_clk_regmap_div_recalc_rate(struct clk_hw *hw,
+						    unsigned long prate)
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
+					     struct clk_rate_request *req)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return divider_determine_rate(hw, req, NULL, clk->size, 0);
+}
+
+static int zte_clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
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
+		if (desc[i].id != ZX297520V3_CLK_NO_EXPORT)
+			clocks->hws[desc[i].id] = &clk->hw;
+	}
+
+	return 0;
 }

-- 
2.54.0


