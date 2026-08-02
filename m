Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E77C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 20:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkbxqvrSP7FNKqOtnrygIoBIqlq6kCfy6ei6tYOO/2c=; b=ASfYomtI1u3ijcxE5F4ebuyPiY
	JeUsHm0+MKHUY84cTMjIBSOrBFwLiiJp8/5uBb43h5svqCmUhqLcTLILxbkLhYizHC7CXDsHqSGXZ
	6n93bpXSjEfiD4cH2xMrMYXdvYFiePcw/eKB2h01sVmxSNP36uQC859QF9gRDN6ofLsesf5C39IiU
	jjgl7X5M+kFnsUVX7Y4bAGs+CNBP+iYApVOYN7v52LoHu3paJJuYvG/HUDXOCHihb8ClP2M9yf2JT
	6o/ZkZoUygs1e4BqhWoEpQwwi8Q1nihEvZLnlMMaUfGRwRyi8wkDcOk/14r5LUDDAsRW7/dgiq5J1
	97ZhLhRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqctK-0000000G1h8-2clx;
	Sun, 02 Aug 2026 20:34:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqctI-0000000G1dB-1wpn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 20:34:37 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-495437bb891so10670405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 13:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702875; x=1786307675; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkbxqvrSP7FNKqOtnrygIoBIqlq6kCfy6ei6tYOO/2c=;
        b=EV0MPp6iSswOCIv8ARzyOen0Hh5wMErK+RcTGHoAgSO/JQl35fm+wz4NXsnk2hXymZ
         gfutsv0KG3DjYkNSo6mX5o6YcZdF/ZOcDZau6eKgFBXNqQ8jViU5/hkcJwkxWyEf0cGV
         TS1jN9W1a75/IDZp902dwbAoEzn7Qxoo+rxepqsXtd6nD5RAi3PswXaOCKgZYZ69YjhF
         aeRyoz5HzOE9qdoqVRtP9wll79ZWJFSnCJajrb+DdHcLhH0QchvSVylsgaFT5yWTri9p
         m0h/uuESO5HNHX1sL+rDl4CAx/0WbIOo3/DAHvjuQ/jHTtMHUI7tpDbzVywjY9p9J7Dd
         hNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702875; x=1786307675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkbxqvrSP7FNKqOtnrygIoBIqlq6kCfy6ei6tYOO/2c=;
        b=kyTZ8H4shu4sRg/M0YfY9HpLTXl80+r5u9DKUHU2AAKvZe1dgvoy5wuVpx8gKaRp6c
         MLkokJvkDSGMzR2VJ8q7cIWhz+DCbuMCaq/lbiKA0O/y9ULxkb4IEwIA3+GUlA5DcpEc
         4Z+U7LUKk9Q/dFFl9YsIQbbUr7sWRDHhRzRJcNxnPhcl6FBWKXtwwheyThXm9NOVlDfr
         GhuocMERamCwH3pgpP2496ZjwTpQb5EblJpTr5S2wg2bcx6NUMZIKGh4Vyl2qMsFrFGt
         O0D56GjIq0jkhISIjh55LyHexPgCI9zbByx54liT26LNY0fy03BVb+ZQsYFCmvreWm6A
         xlXg==
X-Forwarded-Encrypted: i=1; AHgh+RoCP1J6BSPzAFiPPkNYFfpbvUtfLiD1OuPawiWTtQzBsyXcxLPRjt7zAUwXfrzISLbmye0hjVfUonryNZjTu1lC@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu+LQjORDpj5iNPFEEhG7MBxcbaImqDuy0HwJXx/pupGeIy66A
	mT8j6L5FgyYN3AH15Br/szs+ucWb3TGvsxOeNLcpJFflC1xT9GKAWjd4
X-Gm-Gg: AR+sD10bIUycp009azZgx3/dyRRWQI3zRTQcsHZIPqQbYYUh1X1rbkYQHQo3x3j2Vje
	V6ZPtx1M5tsoUhQ82Ib0nhP0aaO+PbvKiPV0nvmNn0XzeYemb9nbAI6K9ioXWH79/estYCjKMR5
	xHsuQaNI15iw6g90RC13LWtOq0lcOrvuoy7q/87MmcgCucKbuM3YR7XmP8QsfTqAZ0vkrmEDzpf
	dVpcfYI5w4yr0qI8UuOfTNOxHSnlNbp50brPHqqwxucrjEyMbsufRuoLlkuJS7TXkD3bBBYZDtV
	vJ0KZuqo2ZwEgeO32WJ//lgPOXpxq4p2i4eJtuu20qxDQ/W8dwE46AK6sVJ7GBi/4KLeZ4i23ne
	K6LME+06bI1r1QxAS+2/GJTHSDxe5WyGIJwkrql/sPu6/2xKj2nKPeKKalC7lmVaewNWGXfWa6A
	T9DE0hCAaewL1g6Q2Ua9ZU4Snj0LH0GOYNR6GYWyrzLE7xd6+mPScL9Nw4Aolu9i9iTU/ImRkc
X-Received: by 2002:a05:600c:6298:b0:497:ff5a:38b9 with SMTP id 5b1f17b1804b1-4980ebc216amr136043935e9.9.1785702874569;
        Sun, 02 Aug 2026 13:34:34 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:34:33 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 02 Aug 2026 23:33:38 +0300
Subject: [PATCH v9 06/12] clk: zte: Add regmap-based clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-zx29clk-v9-6-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
In-Reply-To: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7881;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=hwocxe5+u6ehkp1tzrBoab02wtvHlqFQtFOPzVR5cRA=;
 b=kA0DAAgBPRO8yFRPGiIByyZiAGpvqbLIugDYVd/qJHlvaMqXemgRyFkWffskH7DS7eUe5stJh
 4kCTwQAAQgAORYhBEMW9LaqBVsnlTJdbD0TvMhUTxoiBQJqb6myGxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjEyLDIsMgAKCRA9E7zIVE8aIoNPD/94Qr+VzDNoe4cx4Roq2IynmbVoaR4tXLuaea48bgg
 /GdYV+iVXrv90AxkFbnYE1Vtni2NTVQjnLOIUlU8E8ThHTNaBTTmbokhwNals0RAXymiknmDZTJ
 r8sCB77VJoKofuszKxQ4587XXQTdZb9rncLubvZzxPOY5R3+1OPYuluk8PDitHFgfgYLqAFGspQ
 XsLdzFBvo1kE0RsTsV7BskK+uqSn5eKtc/ut5/ydUKeu9xMyRiceN9MSChzxcBoBl7bjjZyAw+d
 xx5y5+H7us6/AsZ8U0bELZfD38nICBNN/9oyxlHyo0odC+ithC+cn2daPTSNN59/Oqrjzim9b7d
 wrweTLaQOjsZyGSrLfyfd95GDev6e1CkYmz23MEtmmIWN7a18YF7wYUglpl4Mlw41TFI+zvKszw
 MK8fmSQPcJ/DdA/VaK1jyJnYSmwEXU0Bttf+VcDPqU3h+Cv2bnpda7X6Y1ekam2vMbT3LdKNAyp
 5xYqxMhBbak70vQz73K65cnO9PJnIxonf0mVE5LZ6XyYLx0h9bpzSKbPHLyK+LmgSC5adi+l8hI
 B5NPzpLLwIYspB/1cifD5AtioUFV/YZxPGVJf5nLeey08juVB7syGM6kSwIyELm8t3zR4ltL3eP
 gscMXYCYladS5bF5SebGuBVzwDic908k/iKw38geT1A==
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_133436_557007_49EC9A59 
X-CRM114-Status: GOOD (  20.75  )
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


