Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7C9C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQDk0f/CX/nJddxBbewiApCN1TYaT4l9+ANcNSyara4=; b=oXApE/VRXVmZLs+y0zuFQMESmt
	iWgRN/CSd5OQT7xm9LTy/7g1s6JsaKs2TzaWvslR4TccfvoChQomGmEsG8zJyxdwoIaveiZKGNepz
	hGnwFlqdDFrgZm+uWvfvIhUGLiVIzwhaKu4OdqG2Gi7DG6E0Z9zgrSwHxDQCgyODpX2umAdwR0xgN
	UX5DQ4V7htdNgqCjKw0R8f0c3gqS1XAtOi6kdiC9h49uKUNotN5rye+QxVsBK0rHW7mLTrCYR+253
	BIMjvnnb1bXR5pINZQr452bLk0E/S1nA8+TfjI8cspHqqsp1zJPv6l7y7tGdtfaIz+/0gbWnoVyv4
	te4jku4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyydw-00000001W1I-2Mov;
	Tue, 25 Aug 2026 21:25:16 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyydm-00000001Vt3-1j9t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 21:25:09 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so23656066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 14:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787693104; x=1788297904; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQDk0f/CX/nJddxBbewiApCN1TYaT4l9+ANcNSyara4=;
        b=PLrK45sBw97j8c/0YmJamgL8FSlgiD47JMNR5kHHiraO2WeY7VbSMQA7FCCzODeUYZ
         aQhw4c6YTEwkUc4ztZbjvxWMGpNpDxY+4fmhsaD7RXyGXucg2rFtyMHpM6qvSiiTd5RQ
         v0YuYrrNA/GIczptT3SZWptlgKHxAnjD+Wc+pNyAVPjrRbHsFETY63Ae0OXQF1N/INYx
         7qSFoQuSqE2Dm/uK6dW5UzPO6m23JLfVcn9LR/5p1nAIrQEXFUHsPAf3OR6a/eGMXiyW
         4LRRMBPnC0O/I9xWkr/F3dc1fNYKSdNFyHuF1oOK9XBEVdhA9lN+GaY49YSPYlqUA9GG
         XXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787693104; x=1788297904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQDk0f/CX/nJddxBbewiApCN1TYaT4l9+ANcNSyara4=;
        b=GYMa51KW1tXiURmlkOJQCpjU0k1L0tjaepXLSDbNQVtuWvnaoyVFIeMMrN6mfYEJvW
         tcKo8nWtVh0M2vL5O5L/Lo6xUiMNaJqYAvYAAMuEg5VcWDzr5hbfR1T2x7CeYRuxVLnQ
         lpNDpn+WMcnh+oyFVWlM+fw9nXI26FohWIfMNcc3ROD7LbyDgfSedXCkzPneyLnoTuCZ
         beWnfv7ox01I2LcHRnhts3b8+xf229MhjB1Cs0srd7IILhjLE/FQK46hEfhzxhO4uBQn
         wXXsv1k4S2+/gOWuIVFweTN6IA2Gu85ddE8NdGqSIcuUMGRfEn1EsRZESdjBB4YqBPvO
         ugcg==
X-Forwarded-Encrypted: i=1; AHgh+RpNgfF83EWlHf6RodG19uTCOaG0bEAnagsI0NXIEg7nCfRkXuAcPjR/7j3tAHx0gmA2ab/o0EOALIIXSMlWPian@lists.infradead.org
X-Gm-Message-State: AFuF++n3+oxQCDuTpaJBnahOUStahCExmN6zc9EwoLlFlAga5SIAIjUb
	SOpxWJFMQ60sD2XMf7ayT6K4iyRBgQbz8W/EDLUwPqRqXQWeVwxLLqyi
X-Gm-Gg: AR+sD11+unwwJlRLvJpU5cszujTTX7uc5jVuqh+jt8RKfi8gkRpXSeDzkq55yHBx7DJ
	B3n6Mnan61KWRDi1fZkqGG30iuJaiDLr1rGtzWELevDXfRX5Ud792s6R9Ze8BsJX56J0VA0hQJi
	0Nb3BTpXrBdGEumk9uXXriZcCP/ub60MFwagY8Bcvs5kz+FfqW1jz2dmAmcIO5MXNkSBfE6CqOA
	OalfTGYcQ2ipCdWMkpuQWldJcde5Uexc5+UzL/4WR4l1F6wlXrNdpkH+PMe0zMGTSl6LC3ZI/Ky
	nih658pjcphNbD7yxoMMoQPfIFrnb35tAV+oCQDZgpP23r0hGmUsZxzTS/LCZJJ0LIQ8mItJn7k
	mbBH/AfZDd8xTatSRYCND1uHk/SFxZHNdXO76BnO59bW4fNGSdWC2YgZ5aHWOb+Nina4isJuw2b
	LAe9yYIasXISOaBLmtfjvRjqNdwB2epM+5UXFfUQ1UWuxPAHMoQFIDjHgE1rpHeSLSUuMEFA==
X-Received: by 2002:a17:907:9617:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c250c3529f9mr174769166b.21.1787693104284;
        Tue, 25 Aug 2026 14:25:04 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ec343sm98297866b.57.2026.08.25.14.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 14:25:03 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 26 Aug 2026 00:24:06 +0300
Subject: [PATCH v11 07/12] clk: zte: Add regmap-based clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-zx29clk-v11-7-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
In-Reply-To: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7927;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ZNxJpzwsBO3OBV6aHCCiuyx42Ef/rjHbiRWZumnp96k=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqjggCIC28UmBdGZJ95zPM7HMHwPmFY6c9sa9Vr
 FqMgfkEmoqJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCao4IAhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJSVxAAlbmAMHPAVgwZhMZ6pj7+zSxR4B6+WwA
 1IYbbRDR956wUWkjR7Or9LJPNjJTv646vSGxpI+UwYC10ykyDZoXR/9tX5USecVD1Bkd8l1Vb6f
 TmbmF/7iazsEYM/d/8TbbjeD0ykzGaK7ntWCUUQecmVglODOq4Xf/2NEWhBjo0/AEUzkTEW8uXO
 1OBjq9cXlUdkZkbfNP9pt5DvoaNOrxqKCK6Diy4/HzI3FvOHqtzMOeM4tb2isti2FLMhQIJc8N9
 gATRR9Rdk0R//G9Jy/MctZxBA/8eF0cHwk6PTAtG2lbuckApw5ctnKj3nPjPOrZT3B5rSyECCvM
 2vFuztbY5oI2YqBCu7k/QPLO22EpBQ+hQahx33YOFYRT3MEvJ36fRlxtp+amjTXwc6up71EAnQl
 y4kd5qZP6nl5BXCS/9c4O44ojT/0u5mcU2tlBF0cze2HukRt5VaU8fbNhnjEkuZq9dB8kSy76Av
 hrxl3UetHfIs5mm1mo+06zxyOCySaEa32byJdcyVjIA1iQn8USjmQI6PtX91qdfwR+qXfZOIpqj
 NMvSa0Lw7lrB6d7TGf3zP+MTj2MxrYk1NAHAY+bmlprEiZVo9RdVuRGP4bJHUM5jjU2+eA/6htl
 Iu0vpG1uJl9m/18P2fC7JI6jCCNJJjTiqQwB3MBDU0jMVCJ0k96Y=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_142506_533264_8C502BDE 
X-CRM114-Status: GOOD (  21.06  )
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

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

I see that numerous clock drivers have their own incarnation of regmap-
based mux/div/gate clocks. If there is any version of it that is likely
to be elevated to shared code like clk-gate.c I'll copy that and try to
use it as unmodified as possible.

Version 9:
Register single clocks per function invocation, remove
ZX297520V3_CLK_NO_EXPORT again

Version 8: Use ZX297520V3_CLK_NO_EXPORT instead of 0 for unexported clocks.

Version 6: Remove stray regmap (Sashiko)

Version 5: Use regmap_test_bits in zte_clk_regmap_gate_is_enabled
---
 drivers/clk/zte/clk-regmap.c | 219 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 212 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 80332dba97f6..022b2be7bb3d 100644
--- a/drivers/clk/zte/clk-regmap.c
+++ b/drivers/clk/zte/clk-regmap.c
@@ -1,32 +1,237 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
+ * Copyright (c) 2018 BayLibre, SAS.
  * Copyright (c) 2026 Stefan Dösinger
  */
 
+#include <linux/bits.h>
 #include <linux/clk-provider.h>
+#include <linux/container_of.h>
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 
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
 struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *regmap,
-				    const struct zx_gate_desc *desc,
-				    struct clk_hw * const *clocks)
+				    const struct zx_gate_desc *desc, struct clk_hw * const *clocks)
+{
+	struct clk_parent_data parent = zx_get_parent(&desc->parent, clocks);
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	int res;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_gate_ops;
+	init.parent_data = &parent;
+	init.num_parents = 1;
+	init.flags = CLK_SET_RATE_PARENT | desc->flags;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = 1;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
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
+		return 0; /* Gives a hint that something is wrong */
+
+	val >>= clk->shift;
+	val &= clk_div_mask(clk->size);
+
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
 {
-	return ERR_PTR(-ENODEV);
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, NULL, clk->size, 0);
+	if (ret < 0)
+		return ret;
+
+	val = (unsigned int)ret << clk->shift;
+
+	return regmap_update_bits(clk->map, clk->reg, clk_div_mask(clk->size) << clk->shift, val);
 }
 
+static const struct clk_ops zte_clk_regmap_divider_ops = {
+	.recalc_rate = zte_clk_regmap_div_recalc_rate,
+	.determine_rate = zte_clk_regmap_div_determine_rate,
+	.set_rate = zte_clk_regmap_div_set_rate,
+};
+
 struct clk_hw *zx_clk_register_divider(struct device *dev, struct regmap *regmap,
 				       const struct zx_div_desc *desc,
 				       struct clk_hw * const *clocks)
 {
-	return ERR_PTR(-ENODEV);
+	struct clk_parent_data parent = zx_get_parent(&desc->parent, clocks);
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	int res;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_divider_ops;
+	init.parent_data = &parent;
+	init.num_parents = 1;
+	init.flags = CLK_SET_RATE_PARENT;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = desc->size;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
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
+
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
 struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *regmap,
-				   const struct zx_mux_desc *desc,
-				   struct clk_hw * const *clocks)
+			  const struct zx_mux_desc *desc, struct clk_hw * const *clocks)
 {
-	return ERR_PTR(-ENODEV);
+	struct clk_parent_data parents[CLK_ZX_MAX_PARENTS];
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	unsigned int i;
+	int res;
+
+	if (WARN_ON(desc->num_parents > ARRAY_SIZE(parents)))
+		return ERR_PTR(-EINVAL);
+
+	for (i = 0; i < desc->num_parents; ++i)
+		parents[i] = zx_get_parent(&desc->parents[i], clocks);
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_mux_ops;
+	init.parent_data = parents;
+	init.num_parents = desc->num_parents;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = desc->size;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
 }

-- 
2.54.0


