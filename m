Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F63C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qSUr+pm3pdnbRsIh3hdQcHybpcWSk9Cg64DpmHfrRQ=; b=fXiuU+4KQFfE8MFMvaCUe8tuNS
	i3LUbprdJrFAspxVemnAQGpZjuvA97ooknjNeFqauYyt/ZceOuVUQAAFY8WbAnofu4LBiwtU2Q8e0
	Ju1LJfkuG8R8yvMdQ6dpMz6vzKaE0eEB1JGsJMzjTQ2JtC10OpOK6DE/8JH8GMctHQWJm2gTG+avO
	JZ8ocyrdvkaisOHG3sDfZrRxAyAJ4LtWr91shBhMIWM2HaccBF5IISRl9AB/m7jUFHhv0ARJRNmdd
	aY0CRVtxoYtqoA0nQlKZBjzRV7rAZSFMlVfvj2yuONSaayTtBs5vGp73+ssLiO9GZgjJYi6A9pgAp
	y1o08qRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUj1-00000005dPb-2sjB;
	Tue, 18 Mar 2025 11:03:11 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUfb-00000005caQ-2XPx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 10:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742295579; x=1773831579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K4Qh71+6FN2E5vhhDAN+lN9a5M2tg0WGTdBTyy5owTw=;
  b=cKflEbkIMcvQZsK8bz/bNAKxlbEtJJ0A/xJnxE+A4UX0V6qZLUj56/v2
   tAJdcejLt3ntHWMTeHd4mLL+LXyiaebC4eGzYgzgNuF4+u2kUTIJJQb9h
   ckfinVHoY80gSO6Qkbf6SklDKa9462SfWNYSc2AyBRpWwtumExjdZvkcl
   7wOcUNs2Tq1b/Unv4PAcBjyaNQfaxAnPA8r8RuEGMQEqcc8GyjfRIGv1C
   rE3NoCOtZ2z8CQgeeSeW7EYr+kdfyxTzt4lHuknnNTFEgTPhMzM2/mezV
   7A95vLn046KnYZqKOczEB4iTtJ5VbuiNHhfUHGHS9fkuNOtRGyGduu1gm
   A==;
X-CSE-ConnectionGUID: iLhv7NDBQ5OIYoY3EuenNg==
X-CSE-MsgGUID: 5ov7RuUJT26S6FRxJn6cfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="68781751"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="68781751"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:59:38 -0700
X-CSE-ConnectionGUID: 9KcpTX+ET7aels/yNDL6uw==
X-CSE-MsgGUID: TcQmfDf+TDiUMxf/WRhAPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="153215699"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2025 03:59:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1026A5DC; Tue, 18 Mar 2025 12:59:34 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 4/5] pinctrl: nuvoton: Convert to use struct group_desc
Date: Tue, 18 Mar 2025 12:57:17 +0200
Message-ID: <20250318105932.2090926-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_035939_652585_8EEAB361 
X-CRM114-Status: GOOD (  17.72  )
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

The pin control core header provides struct group_desc.
Utilize it instead of open coded variants in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 70 ++++++++++++--------------
 1 file changed, 33 insertions(+), 37 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index ad4f9ca414c8..da3c8d8e3eb3 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -106,13 +106,6 @@ struct ma35_pin_setting {
 	unsigned int		nconfigs;
 };
 
-struct ma35_pin_group {
-	const char		*name;
-	unsigned int		npins;
-	unsigned int		*pins;
-	struct ma35_pin_setting	*settings;
-};
-
 struct ma35_pin_bank {
 	void __iomem		*reg_base;
 	struct clk		*clk;
@@ -141,7 +134,7 @@ struct ma35_pinctrl {
 	struct pinctrl_dev	*pctl;
 	const struct ma35_pinctrl_soc_info *info;
 	struct regmap		*regmap;
-	struct ma35_pin_group	*groups;
+	struct group_desc	*groups;
 	unsigned int		ngroups;
 	struct pinfunction	*functions;
 	unsigned int		nfunctions;
@@ -160,7 +153,7 @@ static const char *ma35_get_group_name(struct pinctrl_dev *pctldev, unsigned int
 {
 	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
 
-	return npctl->groups[selector].name;
+	return npctl->groups[selector].grp.name;
 }
 
 static int ma35_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selector,
@@ -171,19 +164,19 @@ static int ma35_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selecto
 	if (selector >= npctl->ngroups)
 		return -EINVAL;
 
-	*pins = npctl->groups[selector].pins;
-	*npins = npctl->groups[selector].npins;
+	*pins = npctl->groups[selector].grp.pins;
+	*npins = npctl->groups[selector].grp.npins;
 
 	return 0;
 }
 
-static struct ma35_pin_group *ma35_pinctrl_find_group_by_name(
-			      const struct ma35_pinctrl *npctl, const char *name)
+static struct group_desc *
+ma35_pinctrl_find_group_by_name(const struct ma35_pinctrl *npctl, const char *name)
 {
 	int i;
 
 	for (i = 0; i < npctl->ngroups; i++) {
-		if (!strcmp(npctl->groups[i].name, name))
+		if (!strcmp(npctl->groups[i].grp.name, name))
 			return &npctl->groups[i];
 	}
 	return NULL;
@@ -195,9 +188,10 @@ static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
 					    unsigned int *num_maps)
 {
 	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
-	struct ma35_pin_group *grp;
+	struct ma35_pin_setting *setting;
 	struct pinctrl_map *new_map;
 	struct device_node *parent;
+	struct group_desc *grp;
 	int map_num = 1;
 	int i;
 
@@ -211,7 +205,7 @@ static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 
-	map_num += grp->npins;
+	map_num += grp->grp.npins;
 	new_map = kcalloc(map_num, sizeof(*new_map), GFP_KERNEL);
 	if (!new_map)
 		return -ENOMEM;
@@ -223,17 +217,19 @@ static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
 	if (!parent)
 		return -EINVAL;
 
+	setting = grp->data;
+
 	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
 	new_map[0].data.mux.function = parent->name;
 	new_map[0].data.mux.group = np->name;
 	of_node_put(parent);
 
 	new_map++;
-	for (i = 0; i < grp->npins; i++) {
+	for (i = 0; i < grp->grp.npins; i++) {
 		new_map[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
-		new_map[i].data.configs.group_or_pin = pin_get_name(pctldev, grp->pins[i]);
-		new_map[i].data.configs.configs = grp->settings[i].configs;
-		new_map[i].data.configs.num_configs = grp->settings[i].nconfigs;
+		new_map[i].data.configs.group_or_pin = pin_get_name(pctldev, grp->grp.pins[i]);
+		new_map[i].data.configs.configs = setting[i].configs;
+		new_map[i].data.configs.num_configs = setting[i].nconfigs;
 	}
 	dev_dbg(pctldev->dev, "maps: function %s group %s num %d\n",
 		(*map)->data.mux.function, (*map)->data.mux.group, map_num);
@@ -281,14 +277,14 @@ static int ma35_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int selecto
 			       unsigned int group)
 {
 	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
-	struct ma35_pin_group *grp = &npctl->groups[group];
-	struct ma35_pin_setting *setting = grp->settings;
+	struct group_desc *grp = &npctl->groups[group];
+	struct ma35_pin_setting *setting = grp->data;
 	u32 i, regval;
 
 	dev_dbg(npctl->dev, "enable function %s group %s\n",
-		npctl->functions[selector].name, npctl->groups[group].name);
+		npctl->functions[selector].name, grp->grp.name);
 
-	for (i = 0; i < grp->npins; i++) {
+	for (i = 0; i < grp->grp.npins; i++) {
 		regmap_read(npctl->regmap, setting->offset, &regval);
 		regval &= ~GENMASK(setting->shift + MA35_MFP_BITS_PER_PORT - 1,
 				   setting->shift);
@@ -980,17 +976,16 @@ static const struct pinconf_ops ma35_pinconf_ops = {
 	.is_generic = true,
 };
 
-static int ma35_pinctrl_parse_groups(struct device_node *np, struct ma35_pin_group *grp,
+static int ma35_pinctrl_parse_groups(struct device_node *np, struct group_desc *grp,
 				     struct ma35_pinctrl *npctl, u32 index)
 {
 	struct ma35_pin_setting *pin;
 	unsigned long *configs;
 	unsigned int nconfigs;
+	unsigned int *pins;
 	int i, j, count, ret;
 	u32 *elems;
 
-	grp->name = np->name;
-
 	ret = pinconf_generic_parse_dt_config(np, NULL, &configs, &nconfigs);
 	if (ret)
 		return ret;
@@ -1003,21 +998,22 @@ static int ma35_pinctrl_parse_groups(struct device_node *np, struct ma35_pin_gro
 	if (!elems)
 		return -ENOMEM;
 
+	grp->grp.name = np->name;
+
 	ret = of_property_read_u32_array(np, "nuvoton,pins", elems, count);
 	if (ret)
 		return -EINVAL;
+	grp->grp.npins = count / 3;
 
-	grp->npins = count / 3;
-
-	grp->pins = devm_kcalloc(npctl->dev, grp->npins, sizeof(*grp->pins), GFP_KERNEL);
-	if (!grp->pins)
+	pins = devm_kcalloc(npctl->dev, grp->grp.npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
 		return -ENOMEM;
+	grp->grp.pins = pins;
 
-	grp->settings = devm_kcalloc(npctl->dev, grp->npins, sizeof(*grp->settings), GFP_KERNEL);
-	if (!grp->settings)
+	pin = devm_kcalloc(npctl->dev, grp->grp.npins, sizeof(*pin), GFP_KERNEL);
+	if (!pin)
 		return -ENOMEM;
-
-	pin = grp->settings;
+	grp->data = pin;
 
 	for (i = 0, j = 0; i < count; i += 3, j++) {
 		pin->offset = elems[i] * MA35_MFP_REG_SZ_PER_BANK + MA35_MFP_REG_BASE;
@@ -1025,7 +1021,7 @@ static int ma35_pinctrl_parse_groups(struct device_node *np, struct ma35_pin_gro
 		pin->muxval = elems[i + 2];
 		pin->configs = configs;
 		pin->nconfigs = nconfigs;
-		grp->pins[j] = npctl->info->get_pin_num(pin->offset, pin->shift);
+		pins[j] = npctl->info->get_pin_num(pin->offset, pin->shift);
 		pin++;
 	}
 	return 0;
@@ -1036,7 +1032,7 @@ static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinc
 {
 	struct device_node *child;
 	struct pinfunction *func;
-	struct ma35_pin_group *grp;
+	struct group_desc *grp;
 	static u32 grp_index;
 	const char **groups;
 	u32 ret, i = 0;
-- 
2.47.2


