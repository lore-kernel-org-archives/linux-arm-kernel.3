Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223B3EFCD7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZC0oGY8rRbgVELeb0RF2I7S6lvyMsAod6S1xdxvL7A=; b=ldrgKMYSkyDQxPj8zycm5dAGjg
	oGgxF8GMOTHg29jntyIu1z1ZaCrnkcTW1bF+hmrkvna5bPOKqBmRCRWSQ7FU7ChwEqIG/N6ne3tr2
	hkyGbRu43kbsqWJxJ2YXYUWl/4nNjLy3EAxGURKhufd2vPUJWxi0f96NOou+Y0lYGAr+QgEwA+Fvr
	TCLxLakfG2X5hBJiTIDqWbtTBs98j1fbSJ3BI+IyZlOccVm9I6HIg46PLzNnvC+Cic4bHGqEb/8PB
	I0Pdi4yppwvMS54D/PVq5y6f9oif8SD3N7y7DxRfIBCvtVIYxlZ5N5SUjyg7y0XrFR5V61rjUHqrV
	Zw7WoIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXXx-000000073Qg-1v5K;
	Mon, 09 Mar 2026 10:09:09 +0000
Received: from mta-64-226.siemens.flowmailer.net ([185.136.64.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXXr-000000073OM-1W3a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 10:09:07 +0000
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260309100859df816a603000020718
        for <linux-arm-kernel@lists.infradead.org>;
        Mon, 09 Mar 2026 11:08:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=RZC0oGY8rRbgVELeb0RF2I7S6lvyMsAod6S1xdxvL7A=;
 b=Hne3b6DAZ3NK7o4qoULldXDLZAioGXj00TLOCqWII02dWiqBeW9ksPi0pSmxSD2Y8cqUUM
 jEFdseMXYtuDX00HoVtHOUsEOLNoAxjIIETNjcPPRuvBOXCdeFdtEZ6Ls9uGwwZDOrOOeAst
 4l0I2FqgW2J/Xc4EMQvPyopa+8IWLLnLvgkvsn8pwOplo666b9/cDTdBD9zrZ07k0lVa9AFE
 Kk02DYKSt9W8zWRLgFbp7GcSjg4nOpLRPQ3oJx79is4Dal2nOibKA0bdoBKcVVEtVb/t5QOn
 7nqOIqncK0YiodNYDcST5ujYKsOYfZhVCJd8E5Ke2V8E00diV4FE2Clw==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Abraham I <kishon@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] soc: ti: k3-socinfo: Provide reset reason information
Date: Mon,  9 Mar 2026 11:07:55 +0100
Message-ID: <20260309100800.1134701-4-alexander.sverdlin@siemens.com>
In-Reply-To: <20260309100800.1134701-1-alexander.sverdlin@siemens.com>
References: <20260309100800.1134701-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_030904_767246_A6DB66E6 
X-CRM114-Status: GOOD (  19.31  )
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Add reset_reason attribute decoging the RST_SRC register present in AM64x
and later SoCs of K3 family. Textual representation of the bits was taken
from the AM62x Processors Technical Reference Manual, except the POR, which
is not signalled explicitly by the reset module.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/soc/ti/k3-socinfo.c | 88 +++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index 676041879eca3..3736c982fd0c8 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -45,6 +45,8 @@
 #define JTAG_ID_PARTNO_J722S		0xBBA0
 #define JTAG_ID_PARTNO_AM62LX		0xBBA7
 
+#define CTRL_MMR_RST_SRC		8
+
 static const struct k3_soc_id {
 	unsigned int id;
 	const char *family_name;
@@ -123,6 +125,90 @@ static const struct regmap_config k3_chipinfo_regmap_cfg = {
 	.reg_stride = 4,
 };
 
+static u32 k3_reset_source;
+static const char *const k3_reset_sources[] = {
+	[0]	= "Reset Caused by MCU Reset Pin",
+	[1]	= "Power On Reset",			/* Reserved in HW */
+	[2]	= "Main Reset Pin",
+	[4]	= "Thermal Reset",
+	[8]	= "Debug Subsystem Initiated Reset",
+	[12]	= "SMS Cold Reset",
+	[13]	= "SMS Warm Reset",
+	[16]	= "Software Warm Reset",
+	[20]	= "Software Main Warm Reset From MCU CTRL MMR",
+	[21]	= "Software Main Warm Reset from MAIN CTRL MMR",
+	[22]	= "Watchdog Initiated Reset",
+	[24]	= "Software Main Power On Reset From MCU CTRL MMR",
+	[25]	= "Software Main Power On Reset From MAIN CTRL MMR",
+	[30]	= "Reset Caused by Main ESM Error",
+	[31]	= "Reset Caused by MCU ESM Error",
+};
+
+static ssize_t reset_reason_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	int ret, i;
+	int total = 0;
+
+	for (i = ARRAY_SIZE(k3_reset_sources); i >= 0; i--) {
+		if (!k3_reset_sources[i] || !(k3_reset_source & BIT(i)))
+			continue;
+
+		ret = sprintf(buf + total, "%s\n", k3_reset_sources[i]);
+		if (ret < 0)
+			return ret;
+		total += ret;
+		/* Note that several reset sources may be active simultaneously */
+	}
+
+	return total;
+}
+
+static DEVICE_ATTR_RO(reset_reason);
+
+static struct attribute *k3_soc_attrs[] = {
+	&dev_attr_reset_reason.attr,
+	NULL
+};
+
+ATTRIBUTE_GROUPS(k3_soc);
+
+static const struct of_device_id k3_rst_id_table[] = {
+	{
+		.compatible	= "ti,am64-rst",
+	},
+	{}
+};
+
+static void k3_reset_reason_read(struct soc_device_attribute *soc_dev_attr)
+{
+	struct device_node *node = of_find_matching_node(NULL, k3_rst_id_table);
+	struct regmap *regmap;
+
+	/* AM65x/J721E do not have similar registers */
+	if (!node)
+		return;
+
+	regmap = device_node_to_regmap(node);
+	of_node_put(node);
+	if (IS_ERR(regmap)) {
+		pr_err("Cannot obtain %s regmap\n", k3_rst_id_table[0].compatible);
+		return;
+	}
+
+	regmap_read(regmap, CTRL_MMR_RST_SRC, &k3_reset_source);
+	/*
+	 * The register is only being cleared on POR, so we have to clear reset
+	 * source of the current boot manually
+	 */
+	regmap_write(regmap, CTRL_MMR_RST_SRC, k3_reset_source);
+
+	/* Simplify the code a bit and use HW-reserved bit for POR indication */
+	if (!k3_reset_source)
+		k3_reset_source |= BIT(1);
+
+	soc_dev_attr->custom_attr_group = k3_soc_groups[0];
+}
+
 static int k3_chipinfo_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -183,6 +269,8 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 	of_property_read_string(node, "model", &soc_dev_attr->machine);
 	of_node_put(node);
 
+	k3_reset_reason_read(soc_dev_attr);
+
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev)) {
 		ret = PTR_ERR(soc_dev);
-- 
2.52.0


