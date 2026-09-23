Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491DAC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 19:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mp6wBBpQsQq5uAJhpRvAfRITa5kH/kGE8kQJrdjyLoY=; b=1TRp4hsokDTO5+j3ocEImLCq8Y
	vT5h0Fa0qDHHTaCZ3gE5PmGQhO7zh8ALk0B4DzY3G0jOOPlkz0L6pA01cepKictzDeWEljVaFgpBK
	xg+hKpb632GK4l/HCVt5SPWl7Wi8dTPFUcdVIivwDHthOmtOo19jtl3RU0y+vNNr9HKO8yfegcZ8R
	VOYOhdAWLM2aQVzw89il83XT6B9W/cjdb6NGiSj8PVfOzqQM1Y7kvVyh1V062iuP7Osuccfrv5mCn
	zergsfZxIJhlrOPLnRajJC6Rc5+NozrvDrsmVupvyo6KVXSVG1xZqiLlazGk+e4KOPLS15KYLwsEC
	/419RhyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RjP-00000009CLD-3eyO;
	Wed, 23 Sep 2026 18:30:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rj7-00000009CAl-1Hmj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 18:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mp6wBBpQsQq5uAJhpRvAfRITa5kH/kGE8kQJrdjyLoY=; b=ddrjshvgPeOvRpfGr7poMOQA8S
	zapdelOajgRSEIkPuTKErWupUppQS9lZpJpeMOnFGis+AwbXADHLJ3S7/V2tukAocopyeThGrE1SC
	8rE4hbaAT4n3CkN0ZUW08w7usfkk8QaHImq55Jz4QjqgH0KvADKG6kSebw7s/7Y8CU8W00dSNkAP+
	KgXo26raW+YCBD27Ao6TLm+WJikiMgQmeyZvJznlbeagqZ2xDljjCX7EPRZT4mYIrn7S+EpunQIQ2
	fmtmI4rCKJbvbGZ/WBU2lD1TN4xa72lCGcSXAfod4Wk6vawAPEAbqg+HSFvHmU+tontxhDTw0nBMT
	/hcJ1huA==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Rj4-0000000F9fW-1ATZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:29:52 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912e2406so6197615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188189; x=1790792989; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mp6wBBpQsQq5uAJhpRvAfRITa5kH/kGE8kQJrdjyLoY=;
        b=ZR5qypoTvsmMrB3hsLFsLL3WBYGRxx9SQ8FpUqkbmHXNB+bML49vabmKszs2leX6JC
         /e4opI/P+PbHaJeduEAdIBV4ZeZ2dpjlxpLtYHJmhB4qnsZckYtsLHl4gy/SwL31GA++
         hAduXgZpXeNmu66mjV04Pqq58893yYCMdr8aDgtpAYpwhjyt5p3bSOZA2ACIGFBsvnkV
         U0wZyniSLTYLK2CJGpiZYFMkepuwfD/B2KwxISHe6NT3tZ1vi3FQFdqdfyAHp3DHqQx4
         ocuP9VVqV/+Wtu5PVAxiDnNFxrTPP6VcCDABBjaLHF9cnEbNM2NB2XhOTGFNTTw2lBqu
         UFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188189; x=1790792989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mp6wBBpQsQq5uAJhpRvAfRITa5kH/kGE8kQJrdjyLoY=;
        b=0tv4B+ePtDoT1SxU6y4YhuCl1rhR6w+Skc687OY4LC9It1l44WxY7tb09ymCVvPnER
         9U6GxDJN1iv0KAdu0Qqki482zlhtMVqfmtSW6B2+vhuygMmYX0nyeuwoNnKLQ1/GU/U0
         oiLVTxKvnTfoQwfT6ubqo/M8FHWOMvu8tCX6x68/520FNwdGQU3pQYLsgOuCUMZuWNlp
         5tj56GbGw9GrS9rK6LXMwUWObcpU3Rx2VRlujwLaEjJ+p2jO7jQ5uDO3w5MrD7FBgVaP
         c4VHMpl9TzROQvayiYWaJWVTg7sd/TjhHeA3kwbcbP3GWisCoBht5Ug8eDJcGnf/kPNP
         AUjw==
X-Forwarded-Encrypted: i=1; AKwUvBxuVHwxGzYWrhwjoFwpQQA43kJLXh57mOPHu3QAdiqw5QnfGTbSSzvz63DyvpDZnQh+3wFEXq7pKhfkxGKUVGPe@lists.infradead.org
X-Gm-Message-State: AFuF++liMnxLTUiFz6J7+fws1g6ylMxSntm6KZR6rJGoeTtVg51Tb/dP
	gJe8piR3gf/cwVQ02cOObpmY+8Fqh4GK5XUMGD7tYU/zJW0cgtGab7vN
X-Gm-Gg: AYBFou3H4mehwR1YJrRP6DLU6vZkhZ6+CkoyRbM3RM7ulyrJ2nY7lRMJpsl9arkGbID
	+y/IRfID348NLf/yp/nAA09x1rTOl3CUlAg0eNo+FgGVVB6rtzEYc6kJcyfQ/u40NIsLbpEHVnF
	h56EfWm1+WLv5lhq2FAAi+4FFTEku6ICfSYF5MejbJjoavkjza/r7qJcWPzvwa5RrAP1v/VPLlb
	TVeF6LAi1evfgH4/4S+QVWye/jPXIyu5D7GPr4SdFnGpAGuBp34zJvZwBKerkXuslkRracuWnkV
	4iwBVXuqHcEGGlH0nfuZtX6josLPaK1CLvZh3I9hSYP+3akFQj962YSgRb+OynqiRAf6QdLZ6yj
	qyOHK8jqIS0hpg5SZJdBFuUSg7tBvmhwdYr3uabKfZb/dR8/s37gu5bnOEMVhmo4rNVpCdrQAYW
	U4jLxUFk+D6OsWHzzGtjsh4yjTmXGjagf9EI06w6qDmJu1Y+ecevEcNjQmBCzxoyoYjNe50hNLo
	TYt
X-Received: by 2002:a05:600c:6986:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-49fe66d05d7mr1547555e9.8.1790188189034;
        Wed, 23 Sep 2026 11:29:49 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd3d5csm4711835e9.14.2026.09.23.11.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:29:48 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 23 Sep 2026 21:28:52 +0300
Subject: [PATCH v12 06/12] clk: zte: Add regmap-based clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-zx29clk-v12-6-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
In-Reply-To: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7927;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=xrGH6M3bJ8igFRHyhrXgCckCWaOGHyA4X0Rt+3qQ9UA=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqtBpuQdGI3c2kAwgmD9hpZRBBsxjbvLmJKy6Wu
 p5HruEfARGJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarQabhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJx2Q/+OevB3ZmmFGlT6NVlxRxr4ntuHLQNJS7
 RH32sCWbWgZz2WSsIXW75LTsmV4ZfW2PUwKUPgrf8RSPgU8470MrRn06OAFvX8ngR2N7/dU5qZA
 dfqUxDC/CarcbwreIiQrllx+un3ZrrPLeuX7ZBQoScdfipYsoBntuaBpbJVNQNk4oLjgHyLFMO+
 YzAoKqk1vvxudjcH9AXR7eo4/RPgP6Z19CUy3ktVeIiIkdJEAaHgbOrAsrKC8qWPkwtyXjNm6Co
 oV52wpNqBZUSHKDXpQDG1fVRvK/+RxslHlD2lwfv9JbeCyOz23nDkv8aFu5da7cKRtPtrKHelFn
 V5k+meSKEEXSk0h1NHA5KZg574Ti7Sq/mHtjzQwjOvQNwhNd04g0f2vCpmbcEkofGcFXYjpNdci
 XRHCbnB3rPawe03Uwi9OmhqwdL+u/OMGRZhCJXwSC49hSrTG2sQ/4cb8FEDAkIcWXKyKC9Lq6a7
 r36w/8pZYXMfapW4zo6d0GEjgS0vJHG9+VzQ5pQRVi/Krzdf9f+lTH39rQANcj4T2vUdE9h8ezh
 2xm6r9Ahn/AoFxYwN0ciatadXSMMaFeGqkfyvzEfKXwLWEig9bjKb9rQvvq+pLzBovNOYaiKeoz
 41ajqIrhSNc5bSwmkGxItVObZGACI4TD2AM83sGB0nZF0kL816DE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_192950_481795_24ED1389 
X-CRM114-Status: GOOD (  20.87  )
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
2.55.0


