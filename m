Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07292CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 00:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeYSHYki8PgcTS9r6L4gZ0UWYGmBnjKUI0qt2rKa1RM=; b=DYHe1FH9t8Ml8sLYtzOlFUgPGQ
	IQDFmONhzBDVnYk7IJc8RLegB8AGM5d8r/0Fe8o+Klm20WtV8lp+zQ4z+ocpGD/iVtLd5MW0oMtdQ
	R9AW0gJkCnl7m3Whd4hsc+qvYLDSaQUyiq3Lye2mY/1C3NEtn0r/JDq6s66kelSufM2CwcHBDSCOF
	PqkVVNYIly7JuwMRdur8T85I0dzIcTwzAGHtonYFM8DLP2wkLu3O8HlazYI1f9sJm39tgf4BRzfLL
	xeC0R8fFRgAVmguX9/Si+9gAfAJRwORwe4tjNy/FF7Cdodkwmv0MftogFLsF62tU3WmietSJVXrJ2
	Mrfb2dIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOZE-00000001TzW-01xs;
	Fri, 19 Sep 2025 00:01:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOZ6-00000001TvU-1raW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 00:01:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F7C11762;
	Thu, 18 Sep 2025 17:01:19 -0700 (PDT)
Received: from minigeek.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 760DB3F673;
	Thu, 18 Sep 2025 17:01:25 -0700 (PDT)
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
Subject: [RFC PATCH 4/5] mfd: axp20x: Support tri-phase setup
Date: Fri, 19 Sep 2025 01:00:19 +0100
Message-ID: <20250919000020.16969-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20250919000020.16969-1-andre.przywara@arm.com>
References: <20250919000020.16969-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_170128_607109_09B92B05 
X-CRM114-Status: GOOD (  17.41  )
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

Of the PMICs that support multi-phased regulators, all but one just
support a dual-phase setup, with exactly two regulators tied together.
This allows for a simple data model, since just two is somewhat of a
special case.

However there is the AXP806, which supports a triple-phase setup, that is
also used on at least one board: the Cubieboard 4, where DCDC-A+B+C
together supply the Cortex-A15 CPU cluster.
Since this is just one case, and a fairly old one now, let's not boil
the ocean by coming up with a complex data structure that allows
describing arbitrary combinations, but instead handle this as a special
case. This is supported by the fact, that the AXP806 only supports two
specific setups: DCDC-A+B or DCDC-A+B+C, but nothing else.

Add a function that checks for the regulators on this PMIC, and handle
the two cases, plus the one without any poly-phasing.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/regulator/axp20x-regulator.c | 45 ++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index e3acc4635a0ed..9dd666f228b1e 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -1569,6 +1569,39 @@ static int axp20x_find_polyphased_reg(const struct regulator_desc *regs,
 	return -ENODEV;
 }
 
+static int axp20x_handle_triphase(struct axp20x_dev *axp20x,
+				  int reg1, int reg2, int reg3)
+{
+	if (axp20x->variant == AXP806_ID && reg1 == AXP806_DCDCA) {
+		/* no other regulator listed: single phase setup */
+		if (reg2 == -ENOENT && reg3 == -ENOENT) {
+			regmap_update_bits(axp20x->regmap,
+					   AXP806_DCDC_MODE_CTRL2,
+					   AXP806_DCDCABC_POLYPHASE_MASK, 0);
+			return 0;
+		}
+		/* only regulator listed is DCDC-B: dual phase setup */
+		if (reg2 == AXP806_DCDCB && reg3 == -ENOENT) {
+			regmap_update_bits(axp20x->regmap,
+					   AXP806_DCDC_MODE_CTRL2,
+					   AXP806_DCDCABC_POLYPHASE_MASK,
+					   AXP806_DCDCAB_POLYPHASE_DUAL);
+			return 0;
+		}
+		/* both DCDC-B+C regulators listed: tri phase setup */
+		if ((reg2 == AXP806_DCDCB && reg3 == AXP806_DCDCC) ||
+		    (reg2 == AXP806_DCDCC && reg3 == AXP806_DCDCB)) {
+			regmap_update_bits(axp20x->regmap,
+					   AXP806_DCDC_MODE_CTRL2,
+					   AXP806_DCDCABC_POLYPHASE_MASK,
+					   AXP806_DCDCABC_POLYPHASE_TRI);
+			return 0;
+		}
+	}
+
+	return 0;
+}
+
 static int axp20x_parse_polyphase(struct axp20x_dev *axp20x, int primary_reg_id,
 				  const struct regulator_desc *regs,
 				  int nregulators, const struct device_node *np)
@@ -1610,6 +1643,18 @@ static int axp20x_parse_polyphase(struct axp20x_dev *axp20x, int primary_reg_id,
 		}
 	}
 
+	/* Special handling for the AXP806 DCDC-A/B/C tri-phase regulator. */
+	if (axp20x->variant == AXP806_ID && primary_reg_id == AXP806_DCDCA) {
+		int reg3_id;
+
+		reg3_id = axp20x_find_polyphased_reg(regs, nregulators, np, 1);
+		if (reg3_id < 0 && reg3_id != -ENOENT)
+			return reg_id;
+
+		return axp20x_handle_triphase(axp20x, primary_reg_id,
+					      reg_id, reg3_id);
+	}
+
 	return 0;
 }
 
-- 
2.46.4


