Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55077CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 00:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4avukQePd9mZUOr+zK1BhZMi6ZuMhz/Fed3IGlNuICk=; b=bz8bvpPOqPn62/td0N3XTWLYCw
	woz2+FS5RcyN9op5iw8Ewf2NH3tkeANhkpyv67vWyxJZZIKZYXEv/BnfK6qv6QsN0/64KOyglZ0SN
	ZOKG7MyOuzdd2N8zD9HK0sxf76ObHNZ8eoBMec0uunaJ/zTo5cmmUicxiOtrSxCDCdvCGsU8iWu5V
	+a6YeJTgj0+2eokaodpdgPEVB6WO+V/olQP8TDQI1jh1MIZEo6n15KRDdg4EWYo9/aMMkq0mpYzbT
	UZDGZSZ3JvxHveD5VfSnmaad54kJxynoCjIj039G+rna7WhdVgQyV69hkHFOBr5fhrYjJc83gd8yj
	aOSgYQWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOZD-00000001Tz8-3107;
	Fri, 19 Sep 2025 00:01:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOZ3-00000001TuD-2yX1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 00:01:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F191A1764;
	Thu, 18 Sep 2025 17:01:16 -0700 (PDT)
Received: from minigeek.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5E343F673;
	Thu, 18 Sep 2025 17:01:22 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: [RFC PATCH 3/5] mfd: axp20x: Allow programming dual-phase regulator pairs
Date: Fri, 19 Sep 2025 01:00:18 +0100
Message-ID: <20250919000020.16969-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20250919000020.16969-1-andre.przywara@arm.com>
References: <20250919000020.16969-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_170125_868185_C0FE1F80 
X-CRM114-Status: GOOD (  19.96  )
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

Some X-Powers AXP PMICs allow to combine certain DC/DC rails together in
a multi-phase fashion. So far we don't actively program those connections,
since the PMIC reset default for the multi-phasing setup was always
correct for the existing boards.
Now a new set of boards appeared where the reset default is not correct,
so we need to actively program the multi-phase setup.

Use the new data structure describing the dual-phased regulators, and
the new "x-powers,polyphased" DT property to enable or disable the
dual-phase setup on the PMICs that support it.

This works by checking how many regulators this DT property list:
- If it's none, this means any existing poly-phase setup should be broken
up.
- If the property references at least one other regulator, we can use our
dual-phase regulator table to find the register and bitmask required to
establish the dual-phase connection.

This supports only dual-phased regulator pairs so far, but we will
somewhat paper ov^W^W fix this in the next patch.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/regulator/axp20x-regulator.c | 68 ++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index 19c9a98d1835a..e3acc4635a0ed 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -1549,6 +1549,70 @@ static bool axp20x_is_polyphase_slave(struct axp20x_dev *axp20x, int id)
 	return false;
 }
 
+static int axp20x_find_polyphased_reg(const struct regulator_desc *regs,
+				      int nregulators,
+				      const struct device_node *np, int index)
+{
+	struct of_phandle_args args;
+	int ret, i;
+
+	ret = of_parse_phandle_with_fixed_args(np, "x-powers,polyphased",
+						   0, index, &args);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < nregulators; i++) {
+		if (!strcmp(regs[i].name, args.np->name))
+			return i;
+	}
+
+	return -ENODEV;
+}
+
+static int axp20x_parse_polyphase(struct axp20x_dev *axp20x, int primary_reg_id,
+				  const struct regulator_desc *regs,
+				  int nregulators, const struct device_node *np)
+{
+	struct dualphase_regulator *dpreg;
+	int reg_id, i;
+
+	if (!of_property_present(np, "x-powers,polyphased"))
+		return 0;
+
+	reg_id = axp20x_find_polyphased_reg(regs, nregulators, np, 0);
+	if (reg_id < 0 && reg_id != -ENOENT)	/* not just empty property */
+		return reg_id;
+
+	for (i = 0; i < ARRAY_SIZE(dualphase_regulators); i++) {
+		dpreg = &dualphase_regulators[i];
+
+		if (axp20x->variant != dpreg->axp_id)
+			continue;
+
+		if (dpreg->reg1 != primary_reg_id &&
+		    dpreg->reg2 != primary_reg_id)
+			continue;
+
+		/* Empty property means breaking any polyphase setup. */
+		if (reg_id == -ENOENT) {
+			regmap_update_bits(axp20x->regmap, dpreg->polyphase_reg,
+					   dpreg->bitmask, 0);
+
+			return 0;
+		}
+
+		if ((dpreg->reg1 == primary_reg_id && dpreg->reg2 == reg_id) ||
+		    (dpreg->reg2 == primary_reg_id && dpreg->reg1 == reg_id)) {
+			regmap_update_bits(axp20x->regmap, dpreg->polyphase_reg,
+					   dpreg->bitmask, dpreg->bitmask);
+
+			return 0;
+		}
+	}
+
+	return 0;
+}
+
 static int axp20x_regulator_probe(struct platform_device *pdev)
 {
 	struct regulator_dev *rdev;
@@ -1703,6 +1767,10 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
 					rdev->desc->name);
 		}
 
+		if (rdev->dev.of_node)
+			axp20x_parse_polyphase(axp20x, i, regulators,
+					       nregulators, rdev->dev.of_node);
+
 		/*
 		 * Save AXP22X DCDC1 / DCDC5 / AXP15060 ALDO1 regulator names for later.
 		 */
-- 
2.46.4


