Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7EBC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 20:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZivD2QNfEmbneZZ6cONahTTfy2owWO3FbZ42lF8SzY=; b=BdUlEygkpcpxVrQOG3ca4e3ren
	WAwj+Z64Z4hucDE52af9ssb7R7c9N+oV+wbKuucUOVxSA8DW4OtmgHDzzRlcd21YFqtfzHg9cP7DY
	2ZkTi1Xsd+JU/7jfZJsNHIcGy1hy3E2s08S4oroJ7SYR8UfVBgGWH22/Mdpxsd3sUNaFx3IheAAWK
	ClRIRN4i5MpX9ngfNIfZC8uHxLqhdUJVloy/UWWCIu/gU6WbI4DrYUlB7aCoFgEeCs7HhlCzzp7zw
	ip7WVGBA3MOYkIOzzfAbN0YSSUF5pAhLwrdrkSH6fKozuI605M3NTN/qS4lNngtKQxadhNjYNOcHb
	xD89XYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfO1n-00000005Rgh-2JHN;
	Thu, 02 Jul 2026 20:28:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfO1j-00000005Rbo-3bgg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 20:28:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so15435155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 13:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024130; x=1783628930; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ZivD2QNfEmbneZZ6cONahTTfy2owWO3FbZ42lF8SzY=;
        b=ZQR+oTjrZ1OMBpDXxJWJLjWnqvMxpnX2s7y1t3qz0NW86+okfwtovuz8oAfIg/WZnI
         zWcN1lYfwA3pmoe1girw8G9jw/HoR6ndw44s5J5/3JCXRC8Xr6BVW0kf2Gt7JcH/vExi
         lsYmJ2kMLKIMyJxLa40fC87KWYqEMpAhIp8LSBzt0M3jIb5FHId1DrZKFiTCyg2sNFBN
         QTyZeu5okIGDbZk4Fj6IJEDFugcFaCF4dbYOf3GXjU4rOLgcC3cBoz+OZ8Lu/IR3Dsau
         1DHUYpHheSMVb5FN0SmZMV8fWYfiUGrL6bhFBIqZ9CI/7iwMM7+O4WguZ5gdFg+U71xV
         9J3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024130; x=1783628930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ZivD2QNfEmbneZZ6cONahTTfy2owWO3FbZ42lF8SzY=;
        b=LybqTQcanvg7SrbAu9nJQGjtE1chGFoiUNqOYgcaABR0Cp3HOQ5cHnovPEtKAOD1Za
         Y6YDwKinKFT9AymAs9eq18tYVCvB+T4DU5UPe5BhYgQh6yfGQR1zyEBaiUnqhG38ECZe
         NqMjwge6mMjHysnVya37XUniYUBqUAyOkkQZK9XJXXuj63lCN4n+CCzrjQWSyrnxVk4X
         FLNqO9oHddK7u3SL9Lua45YM3C58Cmq1Np2uI5LSXEbEGLJWRTpAz6TrZKA7dPGZM9pY
         +ZXWFax9FX30d4qy3K9X9gqOEimKc55pxxrXM24BocVz+JmFBsGD9hGYVQWywd+5w4QP
         /PPw==
X-Forwarded-Encrypted: i=1; AFNElJ/LMFNNFjmgIwDjih5NU1YuP6rjODCM+sQ9Xn5wEeOLEdnd/b9THeGjMp/Oeq7c3y28srA0TCYNdIbA47F+PLxa@lists.infradead.org
X-Gm-Message-State: AOJu0YxJsiicxMzlt8z9Fqq8YA744KfKpNoMPVt+h5QaebHTahfkgNRO
	BPICqLEehbl7r2HBhtji/QU9GQwzaZvIMNwoun7/ZaoVEQQhYghyt6d1
X-Gm-Gg: AfdE7ckWkLKOlMg2ooXoEf3LM+IsdZE+cYHna9EPWkQnqIDdKCAeMmRXHpGubW6CNZO
	vQYqzpP1aIsIXEnopB0K5YTD6qci4Aw7vQ+6FN1FeiufLRZTB8vl9OLFGOKw2xmJW6bSYCtoncy
	XLHNvJTrvJOjH6rBTp5E3ZAIEX/r42+5+TCbJrsVmBjW36DKkdVryHwcSflHQjP6DKmQonZRCNh
	9CnbQmasNF4+LZJJi5UAWVql+tMdBSFuuii5WnNu+KcPEPTIXuoYbYOAcgM3bl5xxI6YXsFxiwJ
	bRM/Q3xKn5Rb63LJrCttfNmYZxEmOh38Kice7qrQBk1lz3wjKpJAZNRNjkNt2rtei/eq08POqFp
	pMHJgEqv7sALxf9OEApSrfhsLAFptPdZcLCskkFVnxvSBHDGtWNT43j5iPeW+wsTQq+Qu3Or0n9
	tT8hwH8k6e8QjpNSCNjoAe4aI=
X-Received: by 2002:a05:600c:34d4:b0:493:a5d4:3798 with SMTP id 5b1f17b1804b1-493c2b3a6camr106126825e9.1.1783024130084;
        Thu, 02 Jul 2026 13:28:50 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:28:49 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:28:01 +0300
Subject: [PATCH v6 06/12] clk: zte: Add regmap based clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-6-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
In-Reply-To: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7587;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=2jrY2goJwHqx0QF64e77XWB3kl4hSelit10NU180RzI=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnpzGKYz7rhnkLlcbV+yYeEafn5yjHtbdK7i
 Pe+JVNWdryJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ6RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI4nw/+IrddksVAYQrK61nzNX3tkrz76coJtSm
 DLC7t/PdfPSyvufFwHDd4WRYZvjkhHChmMMLYuYhDvVFzLqo9+FNmCiJLnr4eKlrc3Jzt4LIm8w
 ygr8afZ7RiDuZphPrIfVW9G9IXO3X9wGSZjzqxoK12cow3SYziRwBcZFr+9pNYVkPruCpqV2Fkz
 9Wsz7SusrXl1Xeye9Fk2IX/0++aUHEM5jXWCOfxcjanyKYFKlMvWkB+U16dA+obpC7JCTT4jG5h
 7zFKlCw5nBAbTno2Tq05s3i5/VZoxuPLfhjuS8cW85hFx8LXz+tgM2mOqrYexKOiJLoWf/bBoKb
 5nx8Z9m9edcHYSdaLgf5BBEw9JkH+Ar7fSr5bejoD4cDiVBDxMPBm9Aj2WS212CV2MnmgV6tk32
 AQ2lkpvPgAgBqcbtDdaGq2KU5NNWx8+u4AaEHiq8+HI/wq9xZlZtVR7aSwlhIqPj9cveqjPYtVh
 KHxSQSzxB1R50o6ti0Ob4tsFKHvDoQBgp1NeYN7AxwH1PCpsgCR64YQZc9kA55qGto34OFAqjSA
 Mhfn3LNkaSq1I35J/7jfoYTlEAmlKexK4UVoTjQjGZcmdUDQTFtpYJCMXVj9lwg8xxRYSgdnGgK
 hjceDOHpPkdY7s3A3axeT+SlkMy1TbhRkrAPWqHBfk5Ah40fIhgI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_132851_958369_9EC6256D 
X-CRM114-Status: GOOD (  19.61  )
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
 drivers/clk/zte/clk-regmap.c | 221 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 218 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 1180d7aa7d62..642db1aaac0a 100644
--- a/drivers/clk/zte/clk-regmap.c
+++ b/drivers/clk/zte/clk-regmap.c
@@ -7,29 +7,244 @@
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
 }
 
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
+}
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
2.54.0


