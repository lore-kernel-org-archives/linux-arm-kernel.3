Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03339C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2n7y60aIOX4DTHkldvRNAyFiO/yf8npMQuEZA/cu6dg=; b=uq4CWsmeQXWbmYtmVENiovA1Ht
	dnokszvHh+tBH83mN3vGIL3YozUyZJrLn39mZA7ahUbkldQFWCPuzxF9eUkPlc2XI7XqxwVXGAiOZ
	3qyFKzVbI8OP8ufgD+HLtUXM4GBz3pXhwwkQ9q37pmMpp6epoBsUpn1GketX0i64TXmE3NSeJyz5D
	yxO8V1Hpfq6QnwollQRrsDoO0PIH9OPCUxl8eQgEhVtXIuXSabPq4G2KKeOPHu0556ifYqhrNqWDL
	6BEsUjggsP1tZni9e3hoRNCuv+pzd0KwPJP1VtnsqA0YmuBykR5eJm1h08PD6rDIupwQrOwKw9rQA
	1gGlQTLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRRa-00000002TVg-2Wqx;
	Tue, 29 Sep 2026 06:36:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRR9-00000002TEm-0OjZ;
	Tue, 29 Sep 2026 06:35:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D15AF40490;
	Tue, 29 Sep 2026 06:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6991F00893;
	Tue, 29 Sep 2026 06:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663734;
	bh=2n7y60aIOX4DTHkldvRNAyFiO/yf8npMQuEZA/cu6dg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jDSapnQpQfTtP2gHBXdpx01ZPe3yBzadJMS7XFv3E4O4LmaTG7O7QVqsCdRaZ23Ae
	 wdjj4FLSAJumpWP0F77Yz43yolqmaDdx0d2rDjAJWDJGgxmzu77Sm3FCqZhfAVCUqa
	 ITwOQ3i1YX9ueuvjhrp4HmEDV0h+wXu7QzyXv0DaXDN2Wa1G89jO1mv28WLB874mfU
	 KaOOZPRR9K3ZjBtDVy8xpKUSwdvFVEShRmA5v4cI6dR6+oaqFFiLl0p1o5z4O7oaYA
	 /AyX/6F4rIOENP5sW0jk/2sS6+CL2PHay8jOWHIY+EWdQifybF1yjLuplQWb5SZ1GG
	 m8S15llqIU3CA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 12/20] pinctrl: berlin: add optional pinconf support
Date: Tue, 29 Sep 2026 14:14:09 +0800
Message-ID: <20260929061417.20733-13-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260929061417.20733-1-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add pinconf support for newer Synaptics SoCs.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/pinctrl/berlin/berlin.c | 232 +++++++++++++++++++++++++++++++-
 1 file changed, 228 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index 0c2179b98629..06c67f00c527 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -13,6 +13,8 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
@@ -20,9 +22,24 @@
 #include <linux/slab.h>
 
 #include "../core.h"
+#include "../pinconf.h"
 #include "../pinctrl-utils.h"
 #include "berlin.h"
 
+#define PINCFG_DS_10BIT		GENMASK(3, 0)
+#define PINCFG_IE_10BIT		BIT(4)
+#define PINCFG_PE_10BIT		BIT(5)
+#define PINCFG_PS_10BIT		BIT(6)
+#define PINCFG_SL_10BIT		BIT(7)
+#define PINCFG_SPU_10BIT	BIT(8)
+#define PINCFG_ST_10BIT		BIT(9)
+#define PINCFG_DS_8BIT		GENMASK(2, 0)
+#define PINCFG_IE_8BIT		BIT(3)
+#define PINCFG_PD_8BIT		BIT(4)
+#define PINCFG_PU_8BIT		BIT(5)
+#define PINCFG_SL_8BIT		BIT(6)
+#define PINCFG_ST_8BIT		BIT(7)
+
 struct berlin_pinctrl {
 	struct regmap *regmap;
 	struct device *dev;
@@ -56,6 +73,8 @@ static int berlin_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev,
 	struct property *prop;
 	const char *function_name, *group_name;
 	unsigned reserved_maps = 0;
+	unsigned long *configs = NULL;
+	unsigned int num_configs = 0;
 	int ret, ngroups;
 
 	*map = NULL;
@@ -75,11 +94,19 @@ static int berlin_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev,
 		return -EINVAL;
 	}
 
+	ret = pinconf_generic_parse_dt_config(node, pctrl_dev, &configs,
+					      &num_configs);
+	if (ret < 0) {
+		dev_err(pctrl->dev, "%s: could not parse node property\n",
+			node->name);
+		return ret;
+	}
+
 	ret = pinctrl_utils_reserve_map(pctrl_dev, map, &reserved_maps,
-					num_maps, ngroups);
+					num_maps, ngroups * (num_configs + 1));
 	if (ret) {
 		dev_err(pctrl->dev, "can't reserve map: %d\n", ret);
-		return ret;
+		goto exit;
 	}
 
 	of_property_for_each_string(node, "groups", prop, group_name) {
@@ -88,11 +115,22 @@ static int berlin_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev,
 						function_name);
 		if (ret) {
 			dev_err(pctrl->dev, "can't add map: %d\n", ret);
-			return ret;
+			goto exit;
+		}
+
+		if (num_configs) {
+			ret = pinctrl_utils_add_map_configs(pctrl_dev, map,
+					&reserved_maps, num_maps, group_name,
+					configs, num_configs,
+					PIN_MAP_TYPE_CONFIGS_GROUP);
+			if (ret < 0)
+				goto exit;
 		}
 	}
 
-	return 0;
+exit:
+	kfree(configs);
+	return ret;
 }
 
 static const struct pinctrl_ops berlin_pinctrl_ops = {
@@ -177,6 +215,191 @@ static const struct pinmux_ops berlin_pinmux_ops = {
 	.set_mux		= &berlin_pinmux_set,
 };
 
+static int berlin_pinconf_group_get(struct pinctrl_dev *pctrl_dev,
+				    unsigned int group, unsigned long *configs)
+{
+	enum pin_config_param param = pinconf_to_config_param(*configs);
+	struct berlin_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	const struct berlin_desc_group *group_desc = pctrl->desc->groups + group;
+	bool enabled;
+	u32 val;
+	int ret;
+	u8 conf_bits = group_desc->conf_bits;
+
+	if (!conf_bits)
+		return -EOPNOTSUPP;
+
+	ret = regmap_read(pctrl->regmap, group_desc->conf_offset, &val);
+	if (ret)
+		return ret;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		if (conf_bits == 10)
+			enabled = !(val & PINCFG_PE_10BIT);
+		else
+			enabled = !(val & (PINCFG_PD_8BIT | PINCFG_PU_8BIT));
+		val = 0;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (conf_bits == 10)
+			enabled = (val & (PINCFG_PE_10BIT | PINCFG_PS_10BIT)) == PINCFG_PE_10BIT;
+		else
+			enabled = val & PINCFG_PD_8BIT;
+		val = enabled ? 1 : 0;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (conf_bits == 10) {
+			if ((val & (PINCFG_PE_10BIT | PINCFG_PS_10BIT)) == (PINCFG_PE_10BIT | PINCFG_PS_10BIT)) {
+				enabled = true;
+				if (val & PINCFG_SPU_10BIT)
+					val = 2;
+				else
+					val = 1;
+			} else {
+				enabled = false;
+				val = 0;
+			}
+		} else {
+			enabled = val & PINCFG_PU_8BIT;
+			val = enabled ? 1 : 0;
+		}
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		enabled = true;
+		if (conf_bits == 10)
+			val = FIELD_GET(PINCFG_DS_10BIT, val);
+		else
+			val = FIELD_GET(PINCFG_DS_8BIT, val);
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		if (conf_bits == 10)
+			enabled = val & PINCFG_IE_10BIT;
+		else
+			enabled = val & PINCFG_IE_8BIT;
+		val = enabled ? 1 : 0;
+		break;
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		if (conf_bits == 10)
+			enabled = val & PINCFG_ST_10BIT;
+		else
+			enabled = val & PINCFG_ST_8BIT;
+		val = enabled ? 1 : 0;
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		if (conf_bits == 10)
+			enabled = val & PINCFG_SL_10BIT;
+		else
+			enabled = val & PINCFG_SL_8BIT;
+		val = enabled ? 1 : 0;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	*configs = pinconf_to_config_packed(param, val);
+	return enabled ? 0 : -EINVAL;
+}
+
+static int berlin_pinconf_group_set(struct pinctrl_dev *pctrl_dev,
+				    unsigned int group, unsigned long *configs,
+				    unsigned int nconfigs)
+{
+	struct berlin_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	const struct berlin_desc_group *group_desc = pctrl->desc->groups + group;
+	u8 conf_bits = group_desc->conf_bits;
+	u32 mask = 0, val = 0;
+	int i;
+
+	if (!conf_bits)
+		return -EOPNOTSUPP;
+
+	for (i = 0; i < nconfigs; i++) {
+		enum pin_config_param param =
+					pinconf_to_config_param(configs[i]);
+		u32 arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			if (conf_bits == 10)
+				mask |= (PINCFG_PE_10BIT | PINCFG_PS_10BIT | PINCFG_SPU_10BIT);
+			else
+				mask |= (PINCFG_PU_8BIT | PINCFG_PD_8BIT);
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			if (conf_bits == 10) {
+				mask |= (PINCFG_PE_10BIT | PINCFG_PS_10BIT | PINCFG_SPU_10BIT);
+				val |= PINCFG_PE_10BIT;
+			} else {
+				mask |= (PINCFG_PU_8BIT | PINCFG_PD_8BIT);
+				val |= PINCFG_PD_8BIT;
+			}
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			if (conf_bits == 10) {
+				mask |= (PINCFG_PE_10BIT | PINCFG_PS_10BIT | PINCFG_SPU_10BIT);
+				val |= (PINCFG_PE_10BIT | PINCFG_PS_10BIT);
+				if (arg == 2)
+					val |= PINCFG_SPU_10BIT;
+			} else {
+				mask |= (PINCFG_PU_8BIT | PINCFG_PD_8BIT);
+				val |= PINCFG_PU_8BIT;
+			}
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			if (conf_bits == 10)
+				mask |= PINCFG_DS_10BIT;
+			else
+				mask |= PINCFG_DS_8BIT;
+			val |= arg;
+			break;
+		case PIN_CONFIG_INPUT_ENABLE:
+			if (conf_bits == 10) {
+				mask |= PINCFG_IE_10BIT;
+				if (arg)
+					val |= PINCFG_IE_10BIT;
+			} else {
+				mask |= PINCFG_IE_8BIT;
+				if (arg)
+					val |= PINCFG_IE_8BIT;
+			}
+			break;
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			if (conf_bits == 10) {
+				mask |= PINCFG_ST_10BIT;
+				if (arg)
+					val |= PINCFG_ST_10BIT;
+			} else {
+				mask |= PINCFG_ST_8BIT;
+				if (arg)
+					val |= PINCFG_ST_8BIT;
+			}
+			break;
+		case PIN_CONFIG_SLEW_RATE:
+			if (conf_bits == 10) {
+				mask |= PINCFG_SL_10BIT;
+				if (arg)
+					val |= PINCFG_SL_10BIT;
+			} else {
+				mask |= PINCFG_SL_8BIT;
+				if (arg)
+					val |= PINCFG_SL_8BIT;
+			}
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+	}
+
+	return regmap_update_bits(pctrl->regmap, group_desc->conf_offset, mask, val);
+}
+
+static const struct pinconf_ops berlin_confops = {
+	.is_generic = true,
+	.pin_config_group_get = berlin_pinconf_group_get,
+	.pin_config_group_set = berlin_pinconf_group_set,
+};
+
 static int berlin_pinctrl_add_function(struct berlin_pinctrl *pctrl,
 				       const char *name)
 {
@@ -287,6 +510,7 @@ static const struct pinctrl_desc berlin_pctrl_desc = {
 	.name		= "berlin-pinctrl",
 	.pctlops	= &berlin_pinctrl_ops,
 	.pmxops		= &berlin_pinmux_ops,
+	.confops	= &berlin_confops,
 	.owner		= THIS_MODULE,
 };
 
-- 
2.53.0


