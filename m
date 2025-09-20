Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B222DCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 11:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5qPv4ldTq9iLR5m/Ew1ytbLOJ+vLoqEg9E8nbrL4xZQ=; b=4rAEuCcSARx576t8igVLaqV1gG
	ehcrGaCbkfDWbv9BfaTPfQ0bbdcMk/0QuioaWam4fCRTSsGmRUop1P6WUKHdwfNwC+TVIpJx+HPn0
	gtVcKeWWjpKjsLMweFVmOCg8qYmf9E3Fz2+bmCKV032CCCNyypfahwBADcPFfdbRv0IBYoftpeKOF
	BHZrEO2/ywUjijpC/AgWAsqtTCeYDtQha7BFg3FB2F6Ua1gxXBw9fBtGZAz5aN6oZYCZpXmSssJTx
	JtGSG5Ais0+x2IrfxpMxl0QdAUSUCelT6oqmwFuqQAfY3z6HQtR5fl9kzKNWPPI322EFl6uCX96G+
	MmNnSxuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzw0U-00000005Gj8-2JBa;
	Sat, 20 Sep 2025 11:43:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzw0R-00000005Gi6-3Dtq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 11:43:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4687b41fb56so9322865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 04:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758368634; x=1758973434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5qPv4ldTq9iLR5m/Ew1ytbLOJ+vLoqEg9E8nbrL4xZQ=;
        b=c/fKlpA0RyPaE+CgR5hEGyOnfrOYisL486idxTUozAIusQ2aXvalxJEUEbhtSKAe/Q
         ynQ++rsimGrgV3/AjJYMeGbUF+mrY35IA1aDIiWAoBw31EvsMBz5PK+bnIeIYwyt2TlW
         qJrEuLFteVtA4eZOYf1uJwQhbIumxQ+QE4pkFx4SMMq2KG8rwdTw/OF3KDu83/TFpfNL
         VZX3n/JI8O3gBXKQStmbaA8BtXI7obmKODILvmY7wifhoZyoK3prc02/zLOEiTft4L1g
         c3cmzAGvTrwj2kC7lD6UUgK46sxIeOLWs7+1iE1Lsl3JbZPReK0zkhuRpsfmwqtNEqg0
         TyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758368634; x=1758973434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qPv4ldTq9iLR5m/Ew1ytbLOJ+vLoqEg9E8nbrL4xZQ=;
        b=KYruJEz6y1WLg545dNIT9NsFLyeCwZaixc995USbKzeP8h3o6bEJO3fxISezF/RS+Q
         qsRDKW3pS5Q2qxoG7qK3pRs0L7JybUO8vzjIXPfsnR8NfUUyBMG6enF9gqyuVRbUMme8
         QNG5FuImXDUxZK65Z0MCSbFnYpP/6mycOHqSi+GDEJ3Px46otVySzijeCxNKmUnuQndG
         giMax8s34WcQJ6R5TZwjk+s5t0Y1kDsZnEjZ+mEQ0v/RfNOHtfiTvR4u87lSeKn2Izvb
         vosnU/N8GfcuiHtk0kux0gMCm4pK/i1MEG7eiO1bt2lIqaFTjRAos8DUQYUew7QPmZ7G
         mt+g==
X-Forwarded-Encrypted: i=1; AJvYcCXOoYlgJbi5IOAHI5Z8L+Ron/04ok/ZJi9sc3Ny8ifHhDDgcHpvugZdD35kkuRuNmJXY12xA1NpWURjozg1I0od@lists.infradead.org
X-Gm-Message-State: AOJu0YwfXuCBthpM4NwxOSAN8VBVe8XZWi6t8AwUwESCr6Ax3W9hsfJ5
	fayox22LU9HBEPwEyUqNWEHeNbHSJVHC/+EC4FcA05eSMkWUufG3DrMNuv2wPg==
X-Gm-Gg: ASbGnctkxHXXtTJqfkZ/O8wd9302d8vYYPVM4IpLhZoXyWyaXGKQZuC3iWl1qMTYxu/
	7Nuz/bBPEoaxyDl0VfwyYUV/2dZZeMlhnkYuRMhlFlsMoOamieu+TWBAFJ7NV2XJyZw9CjVy6nl
	VUZsURgHBVcAO3kKQoPRGfeSXRGFIqsebyO844rviLMINE8aObllTiUoZEiZ/cAgF+zhkBglfar
	DmRlXik2c4bb92zjjWfPaGm+SBiZvXGA7scK+BwsOdojEb4lRh1ZMw4bB6qZkgqLmn974SuGi1y
	AtZlebDeKanfSi0UA1yfcbScoLs3z26I6P9Ckimpw7TyUML9msukRBJCcLnHftDx+RlebvSo9M0
	0pIPtcs7lDNqWQjKhH+ulHWHFdfrYdmpgh9DX0pgomLjoJddG2RBiLdIO30C5DLcH055qhCg=
X-Google-Smtp-Source: AGHT+IGeKLyKQNfti4n7pQMmmIvBvMIuHbECb0sWa4jGH1bzRgL7YqTQVCn/1cA7YHkHgqvs03ymNA==
X-Received: by 2002:a05:6000:40ca:b0:3f0:f7dd:4b76 with SMTP id ffacd0b85a97d-3f0f7ec90c5mr4643851f8f.15.1758368633761;
        Sat, 20 Sep 2025 04:43:53 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3f305f837c5sm3392172f8f.47.2025.09.20.04.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 04:43:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] PCI: mediatek: add support for Airoha AN7583 SoC
Date: Sat, 20 Sep 2025 13:43:23 +0200
Message-ID: <20250920114341.17818-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_044355_831344_1A8CB4CA 
X-CRM114-Status: GOOD (  20.71  )
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
 drivers/pci/controller/pcie-mediatek.c | 84 +++++++++++++++++++-------
 1 file changed, 62 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 24cc30a2ab6c..ad7d47c18f0f 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -156,6 +156,7 @@ struct mtk_pcie_soc {
 	bool need_fix_class_id;
 	bool need_fix_device_id;
 	bool no_msi;
+	bool skip_pcie_rstb;
 	unsigned int device_id;
 	struct pci_ops *ops;
 	int (*startup)(struct mtk_pcie_port *port);
@@ -679,28 +680,30 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
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
@@ -1105,6 +1108,33 @@ static int mtk_pcie_probe(struct platform_device *pdev)
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
@@ -1205,6 +1235,15 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7622 = {
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
@@ -1215,6 +1254,7 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
 };
 
 static const struct of_device_id mtk_pcie_ids[] = {
+	{ .compatible = "airoha,an7583-pcie", .data = &mtk_pcie_soc_an7583 },
 	{ .compatible = "mediatek,mt2701-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt7623-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt2712-pcie", .data = &mtk_pcie_soc_mt2712 },
-- 
2.51.0


