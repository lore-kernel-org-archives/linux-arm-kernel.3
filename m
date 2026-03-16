Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90539EFCBBB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 07:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vGAJVpZ1jpQDkOyacjMdeipgp709TifBFgj8Np5dLw=; b=dxCKOq6kg05SfmZmZKWZljV9hX
	lohE873vBus7druUUg6SxN3+ojhJIrEOqfoczInSZc3hKs3eFy6/coXiHIpTMSMwu3XohUQFg58bE
	NdzxBgweGFtprZpV9wnlD532QwamvMUkh6DorWHfFyzXi8iWIJ2C6+bU9OJ4TxibRNt3DpHVJOnIH
	IZHR2y7R0zI9/SFPiWunxbeWSziDkQ2SMPJs3hC/747wKtqH1esxW/cOg0Ca4weGg2AGBvaVQi134
	rHSa04G94qUWC/Vh3OXOZp+IpbDf8fiZVQr/jJDQrC9ZEKta8V8Hyj8wYUVeFl6a26Y9SbiCYLuKd
	lLz8p0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w221W-00000003RoN-1XWq;
	Mon, 16 Mar 2026 07:05:58 +0000
Received: from mta-64-226.siemens.flowmailer.net ([185.136.64.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w221L-00000003RmB-2QWn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 07:05:50 +0000
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260316070542f7a6084dba00020733
        for <linux-arm-kernel@lists.infradead.org>;
        Mon, 16 Mar 2026 08:05:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6vGAJVpZ1jpQDkOyacjMdeipgp709TifBFgj8Np5dLw=;
 b=TbFNW1DxAFl2RX3wTAh1skXmbZ9eD1YCqF8vA6rhSICghukMCpENByqULSz0EPckxAM8CX
 P627luJfeH6MYOjyABVydvAwq9JTjcUC7uOW+3RhRmmaZils4MxzSkLAzLYkmBBFMSJ9wEQf
 GtUlvX/E8CzRUknJasdu8Wyxky8CwZXswp5+THloQpnFagYUvAlHLdMqimhF9QTFzglvL3LS
 LvWFZ93YFzBPR2aseLPpNQefO93lsfXUEuLKj8lze4y6rqde244sgLdrAockXbRdIVL8Cxgd
 e2reS17M/ygqIt5mmbb9rdxdw2jsmWbLeHRZZRmGGupiIEdPiOp471Ow==;
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
Subject: [PATCH v2 3/3] soc: ti: k3-socinfo: Provide reset reason information
Date: Mon, 16 Mar 2026 08:04:25 +0100
Message-ID: <20260316070429.1545707-4-alexander.sverdlin@siemens.com>
In-Reply-To: <20260316070429.1545707-1-alexander.sverdlin@siemens.com>
References: <20260316070429.1545707-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_000548_233164_17A1BA55 
X-CRM114-Status: GOOD (  19.02  )
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
Changelog:
v2: no changes

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


