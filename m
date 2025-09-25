Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FFECAC5B7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aly97HE4DbfA98BoW1r98QzzxmSOsTSspnaWMcDHFeI=; b=emKH9R3XwbnDMt3U4OwwH6EEnF
	vTvXiggkCO/OENiEjjT7+5rJVTK8++3tP6fKqOMv1ViaN/kyloWevewc2HBCYDQQOjVRfMwbOYYsc
	X19lYL/+i+pFY80gS/8cPcdp7/YtwMEz3Tw0X40I6a4Ql6h0HGZ1EJUtKr2QQ9TzPcJYoHXhzEW3d
	jttdMS/rqHInI7m5jAJWZnNXiDsDd+Fd8K7q6LQcKGCCSfAyHsO3hk1aU8OP8w/dGXYkCL9S9A3tY
	FyevNvNuLj1osABhmCLp5X5csVlyI/BfSAVJ/Pgk6fWBoOf1JFt3FEvVoR43m6/AdcMRQedqeleXi
	ot9Av89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1olD-0000000B57c-27hJ;
	Thu, 25 Sep 2025 16:23:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ol8-0000000B4yJ-18Wz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 16:23:56 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46e2562e8cbso10279435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 09:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758817432; x=1759422232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aly97HE4DbfA98BoW1r98QzzxmSOsTSspnaWMcDHFeI=;
        b=Y5SDkrgqQO7L3uyrsjbCb2+JfYFOJJEChW2Bh1mIeXM8JciNzaXEenYebQWP95kcMG
         v/+0GY0A5CSeG99ucqVWI/8dwvBHE6694NmZniRwYPU793osDrh0ohKP1XIUX7REgRPX
         dGwTguQC4M+Q5IkXH9dQ/dFWSSAuE5Oueibj+S+HuaxdmPTlKEcJ3mZRzSqaKFw+fXzb
         5MQNyW8Qo2jzWlpGBMqAob/Yi+ZT/jyw5vnONCJiePNYK31ldFHMOGlPBX30jGthrSAg
         /0xrJfwG2pzURTdSSiaHf8I6blK26CivnbowdDoS0VqK87h6tMp5dlNRQoXHpd5zGLLq
         +4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758817432; x=1759422232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aly97HE4DbfA98BoW1r98QzzxmSOsTSspnaWMcDHFeI=;
        b=iXjHB+pYhoLUOwBZDiTmY/g9MD5ARSKu97wZ9UnCQC0yUqkcsHbXO591qOm5TY5SpL
         eqIONXw2Xk2ZtvaZHi0duvk0Cn6PgSmcoaBY4GaYFors35ZMNWOqeK9dtyFXLSgpQJ5m
         h8GRvYJbH0Yp55PCWoih7I4ywLgnfM3Liv7QigDvMhAYaF/e1oz5uj7l4wBpN9Gnspnq
         aFU0rOln+ziadyH4rn9YSMUB5dOcCkdEc3dIr7V+JeaCpeBQw5OoIDX55M1h6+1Wpkta
         5w7FwlXiMOh0671Kw4meMJ8GYgk6uWgEa7xSgiv9EabZ6qv6stp/KvK3vP7F4bH1zubH
         kXOg==
X-Forwarded-Encrypted: i=1; AJvYcCXvD8PkQ97hcFrygy+sWtse+vuZ++I4pFQ5EzoDCrBkKc0svHGEvsFvGSOHycmPnX8tOAv7ofjv1+y0PPx9S62f@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt2drJcIVZ3Q4+9Ycumj49EskmhZCMyhD1MtsD2zxClJYB64ki
	/YJI5ByaIQFK0KpNwEtxZNZlwF3McjZhlE/CLEVk6tfgEbCIJcJaS7q5
X-Gm-Gg: ASbGncuZ9l2vRKRcHleoY9Ux1dfm9PW82LK5F6/knYbS5qITJFFAOoXgVZmzrwfP11c
	RqrG1X86jSlSAl5FJ2+m4+JsvOSHLAXJgj9MzV9eCa2C3jF1Jt59LoxK42RuMG+HZdqVhPr46B6
	kf3OS6+6ESKIcit46V0ahJarVTmq9X+gFgasU5/Mf5cNXGi6DcmQh0iFjHWNvlkq2Z3iC3+Me1W
	mWIqXereYUba+P9AP5a/yyGNlAJzgQXOqVQjwNEnaekvbA43vRhhimmgubXM/o6mZm6vCaDOpov
	BIZv6m81j1efsTn6yjLpSI2scHi6ljR5rPvr7AljnJOY5AJilYsBGnEISgzuw2y1AKIqCpdHytH
	/6jQWGumVyCp4AkCkalq7u9HX00evg31cF/QVb7jQq8KG7nPebxqWtx79OBBa+hPbXEUXHBU=
X-Google-Smtp-Source: AGHT+IFhkM3OKIYZ93q3zFo4tpZKrSRaN1CT2/veh5W7Rq8BDbOwn+wtTdHslVzv0uNMo1/McPbcEg==
X-Received: by 2002:a05:600c:489a:b0:459:d8c2:80b2 with SMTP id 5b1f17b1804b1-46e329af060mr29111225e9.7.1758817432312;
        Thu, 25 Sep 2025 09:23:52 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fb985e080sm3534819f8f.24.2025.09.25.09.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:23:51 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v3 4/4] PCI: mediatek: add support for Airoha AN7583 SoC
Date: Thu, 25 Sep 2025 18:23:18 +0200
Message-ID: <20250925162332.9794-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925162332.9794-1-ansuelsmth@gmail.com>
References: <20250925162332.9794-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_092354_375165_0B265FBA 
X-CRM114-Status: GOOD (  23.09  )
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

Add support for the second PCIe line present on Airoha AN7583 SoC.

This is based on the Mediatek Gen1/2 PCIe driver and similar to Gen3
also require workaround for the reset signals.

Introduce a new bool to skip having to reset signals and also introduce
some additional logic to configure the PBUS registers required for
Airoha SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 85 +++++++++++++++++++-------
 1 file changed, 63 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 24cc30a2ab6c..640d1f1a6478 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -147,6 +147,7 @@ struct mtk_pcie_port;
  * @need_fix_class_id: whether this host's class ID needed to be fixed or not
  * @need_fix_device_id: whether this host's device ID needed to be fixed or not
  * @no_msi: Bridge has no MSI support, and relies on an external block
+ * @skip_pcie_rstb: Skip calling RSTB bits on PCIe probe
  * @device_id: device ID which this host need to be fixed
  * @ops: pointer to configuration access functions
  * @startup: pointer to controller setting functions
@@ -156,6 +157,7 @@ struct mtk_pcie_soc {
 	bool need_fix_class_id;
 	bool need_fix_device_id;
 	bool no_msi;
+	bool skip_pcie_rstb;
 	unsigned int device_id;
 	struct pci_ops *ops;
 	int (*startup)(struct mtk_pcie_port *port);
@@ -679,28 +681,30 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 		regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
 	}
 
-	/* Assert all reset signals */
-	writel(0, port->base + PCIE_RST_CTRL);
-
-	/*
-	 * Enable PCIe link down reset, if link status changed from link up to
-	 * link down, this will reset MAC control registers and configuration
-	 * space.
-	 */
-	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
-
-	/*
-	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
-	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
-	 * be delayed 100ms (TPVPERL) for the power and clock to become stable.
-	 */
-	msleep(100);
-
-	/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
-	val = readl(port->base + PCIE_RST_CTRL);
-	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
-	       PCIE_MAC_SRSTB | PCIE_CRSTB;
-	writel(val, port->base + PCIE_RST_CTRL);
+	if (!soc->skip_pcie_rstb) {
+		/* Assert all reset signals */
+		writel(0, port->base + PCIE_RST_CTRL);
+
+		/*
+		 * Enable PCIe link down reset, if link status changed from link up to
+		 * link down, this will reset MAC control registers and configuration
+		 * space.
+		 */
+		writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
+
+		/*
+		 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
+		 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
+		 * be delayed 100ms (TPVPERL) for the power and clock to become stable.
+		 */
+		msleep(100);
+
+		/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
+		val = readl(port->base + PCIE_RST_CTRL);
+		val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
+		       PCIE_MAC_SRSTB | PCIE_CRSTB;
+		writel(val, port->base + PCIE_RST_CTRL);
+	}
 
 	/* Set up vendor ID and class code */
 	if (soc->need_fix_class_id) {
@@ -1105,6 +1109,33 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	if (err)
 		goto put_resources;
 
+	if (device_is_compatible(dev, "airoha,an7583-pcie")) {
+		struct resource_entry *entry;
+		struct regmap *pbus_regmap;
+		resource_size_t addr;
+		u32 args[2], size;
+
+		/*
+		 * Configure PBus base address and base address mask to allow the
+		 * hw to detect if a given address is accessible on PCIe controller.
+		 */
+		pbus_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+								   "mediatek,pbus-csr",
+								   ARRAY_SIZE(args),
+								   args);
+		if (IS_ERR(pbus_regmap))
+			return PTR_ERR(pbus_regmap);
+
+		entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
+		if (!entry)
+			return -ENODEV;
+
+		addr = entry->res->start - entry->offset;
+		regmap_write(pbus_regmap, args[0], lower_32_bits(addr));
+		size = lower_32_bits(resource_size(entry->res));
+		regmap_write(pbus_regmap, args[1], GENMASK(31, __fls(size)));
+	}
+
 	return 0;
 
 put_resources:
@@ -1205,6 +1236,15 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7622 = {
 	.setup_irq = mtk_pcie_setup_irq,
 };
 
+static const struct mtk_pcie_soc mtk_pcie_soc_an7583 = {
+	.skip_pcie_rstb = true,
+	.need_fix_class_id = true,
+	.need_fix_device_id = false,
+	.ops = &mtk_pcie_ops_v2,
+	.startup = mtk_pcie_startup_port_v2,
+	.setup_irq = mtk_pcie_setup_irq,
+};
+
 static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
 	.need_fix_class_id = true,
 	.need_fix_device_id = true,
@@ -1215,6 +1255,7 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
 };
 
 static const struct of_device_id mtk_pcie_ids[] = {
+	{ .compatible = "airoha,an7583-pcie", .data = &mtk_pcie_soc_an7583 },
 	{ .compatible = "mediatek,mt2701-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt7623-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt2712-pcie", .data = &mtk_pcie_soc_mt2712 },
-- 
2.51.0


