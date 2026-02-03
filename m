Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94C5E87847
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xOfr8pjwH28PafNVftU7ohx7Co+eTYIeJfUoKzgkrXc=; b=z1Tb8YR855FZwK5wwt0BHDLP8Q
	hb48F2PWISKCr/CqP/YuMqHA+zs+hhTgo9yEKHBvyB80NrHVd+Frkw0kqKOCvrJ6lRI/oNwFdCwEu
	sMTaHgBZUE8+MEYCRCP0VLkczQLMiwlQ21lLHBV3g3hww5txz8BvUHWt9QNgYVKaKnYNrGR09Vx+Y
	YqpOmhUHJkCpe4PR27AldPd9HSd2z/lbi62/9cEKZ+lGz0EYcj6zmIUdFjdwnZuWLH2mgGzq7eCoM
	5idWav4FoW6mjARbtq7IXvlcvobO5lN7YHz3KsBHHwZCreZu1e2ow3olZQgn7iMt5JAOCGV+WzfG8
	I/QmZ8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ5v-00000006uMS-0o0D;
	Tue, 03 Feb 2026 16:17:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ5r-00000006uLj-3x2P;
	Tue, 03 Feb 2026 16:17:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6747444F3;
	Tue,  3 Feb 2026 16:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8122AC19421;
	Tue,  3 Feb 2026 16:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770135453;
	bh=t0pahqHxkD8WOqNTV7Gd8i8Krv2yBRmUEy3BYV6hbWc=;
	h=From:To:Cc:Subject:Date:From;
	b=nW3HSxwNgImm+htCdGGb1KrWsi4WDyKQRZZVJ98XJJU0SkcoUKt9u4MYOBh089ig+
	 sD4vR65N+gXWMqaQTmMsZc8IKVG6QDN8aC2Gtyb4w1gg+1l8KliDwMbthLNPmu/0Ms
	 4NYAvLPgpQS6Aagb9RqoVhefNN1gkJWReWAG24Xasn4yvjUF1WWxIz8N4RGkciyjx0
	 xwMgHQ5EHR0rbh7WMFHC1/TNTNDmWf3sqh1F8BQMlryijIZBvaZc5XPE+rTwLP2rvx
	 ACJdN/RT9qP3e+zeAJg8M0iL1JwL1osMuU54hLcwi+BQivoNEj/fy0XUfzTyQUh7GO
	 5vnK83p6XgACQ==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux() to amlogic-am4 driver
Date: Tue,  3 Feb 2026 16:17:07 +0000
Message-ID: <20260203-craftsman-battered-3491ff68f462@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9541; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=fPiT2UToPxliK4qfPSkNC22QUXGjpLo8+s/WAHJ1Tts=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlN8o36yaICMmvvXBZz3tdtsqFAZcHaqZKPXr3c++kN2 9SjwcebO0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjAR5mpGhjcqDxfMyZgluO/G 2pVFuY8/Ov28uzA38ncpg6bHeh5hz9cM/519biecsWqeV/5OtPo1+4qVN26qNvZ96817GzpJ/3/ We24A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_081736_142338_7424C973 
X-CRM114-Status: GOOD (  27.41  )
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

From: Conor Dooley <conor.dooley@microchip.com>

pinconf_generic_dt_node_to_map_pinmux() is not actually a generic
function, and really belongs in the amlogic-am4 driver. There are three
reasons why.

First, and least, of the reasons is that this function behaves
differently to the other dt_node_to_map functions in a way that is not
obvious from a first glance. This difference stems for the devicetree
properties that the function is intended for use with, and how they are
typically used. The other generic dt_node_to_map functions support
platforms where the pins, groups and functions are described statically
in the driver and require a function that will produce a mapping from dt
nodes to these pre-established descriptions. No other code in the driver
is require to be executed at runtime.
pinconf_generic_dt_node_to_map_pinmux() on the other hand is intended for
use with the pinmux property, where groups and functions are determined
entirely from the devicetree. As a result, there are no statically
defined groups and functions in the driver for this function to perform
a mapping to. Other drivers that use the pinmux property (e.g. the k1)
their dt_node_to_map function creates the groups and functions as the
devicetree is parsed. Instead of that,
pinconf_generic_dt_node_to_map_pinmux() requires that the devicetree is
parsed twice, once by it and once at probe, so that the driver
dynamically creates the groups and functions before the dt_node_to_map
callback is executed. I don't believe this double parsing requirement is
how developers would expect this to work and is not necessary given
there are drivers that do not have this behaviour.

Secondly and thirdly, the function bakes in some assumptions that only
really match the amlogic platform about how the devicetree is constructed.
These, to me, are problematic for something that claims to be generic.

The other dt_node_to_map implementations accept a being called for
either a node containing pin configuration properties or a node
containing child nodes that each contain the configuration properties.
IOW, they support the following two devicetree configurations:

| cfg {
| 	label: group {
| 		pinmux = <asjhdasjhlajskd>;
| 		config-item1;
| 	};
| };

| label: cfg {
| 	group1 {
| 		pinmux = <dsjhlfka>;
| 		config-item2;
| 	};
| 	group2 {
| 		pinmux = <lsdjhaf>;
| 		config-item1;
| 	};
| };

pinconf_generic_dt_node_to_map_pinmux() only supports the latter.

The other assumption about devicetree configuration that the function
makes is that the labeled node's parent is a "function node". The amlogic
driver uses these "function nodes" to create the functions at probe
time, and pinconf_generic_dt_node_to_map_pinmux() finds the parent of
the node it is operating on's name as part of the mapping. IOW, it
requires that the devicetree look like:

| pinctrl@bla {
|
| 	func-foo {
| 		label: group-default {
| 			pinmuxes = <lskdf>;
| 		};
| 	};
| };

and couldn't be used if the nodes containing the pinmux and
configuration properties are children of the pinctrl node itself:

| pinctrl@bla {
|
| 	label: group-default {
| 		pinmuxes = <lskdf>;
| 	};
| };

These final two reasons are mainly why I believe this is not suitable as
a generic function, and should be moved into the driver that is the sole
user and originator of the "generic" function.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Xianwei Zhao <xianwei.zhao@amlogic.com>
CC: Linus Walleij <linusw@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Kevin Hilman <khilman@baylibre.com>
CC: Jerome Brunet <jbrunet@baylibre.com>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: linux-amlogic@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 71 +++++++++++++++++++++-
 drivers/pinctrl/pinconf-generic.c          | 69 ---------------------
 include/linux/pinctrl/pinconf-generic.h    |  5 --
 3 files changed, 70 insertions(+), 75 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index d9e3a8d5932a..67c96e4661f5 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -24,6 +24,7 @@
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 
 #include "../core.h"
+#include "../pinctrl-utils.h"
 #include "../pinconf.h"
 
 #define gpio_chip_to_bank(chip) \
@@ -672,11 +673,79 @@ static void aml_pin_dbg_show(struct pinctrl_dev *pcdev, struct seq_file *s,
 	seq_printf(s, " %s", dev_name(pcdev->dev));
 }
 
+static int aml_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
+				     struct device_node *np,
+				     struct pinctrl_map **map,
+				     unsigned int *num_maps)
+{
+	struct device *dev = pctldev->dev;
+	struct device_node *pnode;
+	unsigned long *configs = NULL;
+	unsigned int num_configs = 0;
+	struct property *prop;
+	unsigned int reserved_maps;
+	int reserve;
+	int ret;
+
+	prop = of_find_property(np, "pinmux", NULL);
+	if (!prop) {
+		dev_info(dev, "Missing pinmux property\n");
+		return -ENOENT;
+	}
+
+	pnode = of_get_parent(np);
+	if (!pnode) {
+		dev_info(dev, "Missing function node\n");
+		return -EINVAL;
+	}
+
+	reserved_maps = 0;
+	*map = NULL;
+	*num_maps = 0;
+
+	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
+					      &num_configs);
+	if (ret < 0) {
+		dev_err(dev, "%pOF: could not parse node property\n", np);
+		return ret;
+	}
+
+	reserve = 1;
+	if (num_configs)
+		reserve++;
+
+	ret = pinctrl_utils_reserve_map(pctldev, map, &reserved_maps,
+					num_maps, reserve);
+	if (ret < 0)
+		goto exit;
+
+	ret = pinctrl_utils_add_map_mux(pctldev, map,
+					&reserved_maps, num_maps, np->name,
+					pnode->name);
+	if (ret < 0)
+		goto exit;
+
+	if (num_configs) {
+		ret = pinctrl_utils_add_map_configs(pctldev, map, &reserved_maps,
+						    num_maps, np->name, configs,
+						    num_configs, PIN_MAP_TYPE_CONFIGS_GROUP);
+		if (ret < 0)
+			goto exit;
+	}
+
+exit:
+	kfree(configs);
+	if (ret)
+		pinctrl_utils_free_map(pctldev, *map, *num_maps);
+
+	return ret;
+}
+
 static const struct pinctrl_ops aml_pctrl_ops = {
 	.get_groups_count	= aml_get_groups_count,
 	.get_group_name		= aml_get_group_name,
 	.get_group_pins		= aml_get_group_pins,
-	.dt_node_to_map		= pinconf_generic_dt_node_to_map_pinmux,
+	.dt_node_to_map		= aml_dt_node_to_map_pinmux,
 	.dt_free_map		= pinconf_generic_dt_free_map,
 	.pin_dbg_show		= aml_pin_dbg_show,
 };
diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index d182ec84e2df..30475da0fd10 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -424,75 +424,6 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_config);
 
-int pinconf_generic_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
-					  struct device_node *np,
-					  struct pinctrl_map **map,
-					  unsigned int *num_maps)
-{
-	struct device *dev = pctldev->dev;
-	struct device_node *pnode;
-	unsigned long *configs = NULL;
-	unsigned int num_configs = 0;
-	struct property *prop;
-	unsigned int reserved_maps;
-	int reserve;
-	int ret;
-
-	prop = of_find_property(np, "pinmux", NULL);
-	if (!prop) {
-		dev_info(dev, "Missing pinmux property\n");
-		return -ENOENT;
-	}
-
-	pnode = of_get_parent(np);
-	if (!pnode) {
-		dev_info(dev, "Missing function node\n");
-		return -EINVAL;
-	}
-
-	reserved_maps = 0;
-	*map = NULL;
-	*num_maps = 0;
-
-	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
-					      &num_configs);
-	if (ret < 0) {
-		dev_err(dev, "%pOF: could not parse node property\n", np);
-		return ret;
-	}
-
-	reserve = 1;
-	if (num_configs)
-		reserve++;
-
-	ret = pinctrl_utils_reserve_map(pctldev, map, &reserved_maps,
-					num_maps, reserve);
-	if (ret < 0)
-		goto exit;
-
-	ret = pinctrl_utils_add_map_mux(pctldev, map,
-					&reserved_maps, num_maps, np->name,
-					pnode->name);
-	if (ret < 0)
-		goto exit;
-
-	if (num_configs) {
-		ret = pinctrl_utils_add_map_configs(pctldev, map, &reserved_maps,
-						    num_maps, np->name, configs,
-						    num_configs, PIN_MAP_TYPE_CONFIGS_GROUP);
-		if (ret < 0)
-			goto exit;
-	}
-
-exit:
-	kfree(configs);
-	if (ret)
-		pinctrl_utils_free_map(pctldev, *map, *num_maps);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(pinconf_generic_dt_node_to_map_pinmux);
-
 int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		struct device_node *np, struct pinctrl_map **map,
 		unsigned int *reserved_maps, unsigned int *num_maps,
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 1be4032071c2..89277808ea61 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -250,9 +250,4 @@ static inline int pinconf_generic_dt_node_to_map_all(struct pinctrl_dev *pctldev
 	return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_maps,
 			PIN_MAP_TYPE_INVALID);
 }
-
-int pinconf_generic_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
-					  struct device_node *np,
-					  struct pinctrl_map **map,
-					  unsigned int *num_maps);
 #endif /* __LINUX_PINCTRL_PINCONF_GENERIC_H */
-- 
2.51.0


