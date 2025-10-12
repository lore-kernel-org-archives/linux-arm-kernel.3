Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45AFCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 20:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfCCKZmM8pHKKYsT+xDhYQD00mwQ4CthcxXjlQ/ajbw=; b=k4DvpuKiV83MfBmllAKvBu/5XX
	BXbLMRgZd3SPOh38Tg7bSncQyv9256bNi0VEZdgnhPE5au530kPx7maSwgnYMZ9j5yO2gfj2eowj4
	Z4o7FiKpRX9czx5R1ocECtZ5b7IScd+GsnuZrO2j8+JC+bqqmUgZu/SOcPxLwuR9uHnKykcgJLu6N
	gLVmR7RSz1tkWGV3r16vUhJqz05TTd6o68E2bXtNB5oHfpMu26TbXc9qXqqB3b55Xpxm//eH8M3V6
	wwu9A7CJN3+nuak1q+oTsEPTIzNwfzg4AVW/UvmuU6X0SrXyOAz3tRlYRf3+b9i+VtT1LLVrYH9Fc
	V8fuj9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v83A2-0000000BlcL-1YKJ;
	Sun, 12 Oct 2025 20:59:22 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v839w-0000000BlVY-2xqg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 20:59:18 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3fa528f127fso2568217f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 13:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760302755; x=1760907555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfCCKZmM8pHKKYsT+xDhYQD00mwQ4CthcxXjlQ/ajbw=;
        b=E+pbB39dKsLW0cXjGOeFZdbTfpO60blMkeFlV0czjch7mbJyDRu3gE2jLYpS4EkFQ9
         B2mkRwTTLRI1TYSNAbPW1ThD3rzzvhpRobiXHAvuTjIynPoc31FQ3jtOCtr28N++tX/m
         A0mgtDld0zHoU6o2BBborDXP20EI7lDwKB1irZ1t0oT+Q4GUETfvIIajaEIbe2+cx4SQ
         SBb/B0YCJrs+z45/sFZU8tdBD+X3sjkNJtBxixJ+RivRaHRCv+XfNXUYd2eOth55MDWp
         7Z+sIKntvMPBbvmiBnc3+wMaKVyDrPeEgebgfGpfUr1QKNW1ql0MPzMT3t0kNz9Yye3Q
         B6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760302755; x=1760907555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfCCKZmM8pHKKYsT+xDhYQD00mwQ4CthcxXjlQ/ajbw=;
        b=p2+kNe+n/RemuZKaA/3OfYCCHJi6E226i7khmJ+YmZSIQiaqpE3yzFAZLMpBBbungw
         iwbSXDgg6zH/NMPmq/zo3DIBlFBqGj7ZAHmND9EYL5xd0uRlIJPPDNVwPmkJD/pUXE94
         rUNhWcCZZlfC0D10iPlAjiGg/F6IGgG0Z5vNxpm20wCOVrHMZ3jYN8PZVp7zyJERijIF
         rvmMMy5YWbfkPbU8gNHMk5d1DErtgh2oi4iV4CkHu5ac43xjww1iOC9xSdGgxHGYmQBP
         8wC7IN5osTt6zbKExZ+2u9z3/55rr2UWN7TcjnfdlNxBiCqwLoJ8AlHzafmytrWAJG1W
         IFgg==
X-Forwarded-Encrypted: i=1; AJvYcCVlBtwb0vSCl1y5hWr0UB2MjhgfmMfi7SFB56+k8LNxzXgf6e4KxFZ0BmUhWJOvZp3UtojJ2318lybT0l99IaUX@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk+MLMd5TpuuP2Tda91PiLA0t4ewSJcyZYThvuAKTzHcNWCZFD
	0SLOCacXKmkWHqDpIq+JQsI7fDDuYymUkY61LnrRWxigxWu9d4qgpmzT
X-Gm-Gg: ASbGncumOjGPkBYXBcR4FCmesrbcb8+tEA4l+WwVEDBnAtnGPQ29Gbwok745dTBwpG2
	x30+vZl5ucoJZDohpTsSIAZlALgztxdqqxGKRSlBF8xI7OfFKb7KOPBAngn6oixmV00mJ3hx8OH
	FffJaU9CCj+kLrK1Py3MUle15/2MM8rnOUhMIYg1lA2QfyM6Xf0SyQ9xqWJ61+D83hIQuADLFkY
	NPPu4bWblR7L5M83WDNKsc4QCgdGEe3EERCfJPXXEGwBFUWhYDeF74CYQK1+Fbm26MUTNQ3CzQl
	2eztjRwaZNPJsHkZC1Nfj22I5adVAYJ5FbJF+//GoyLhJcBxfdJR2DWVuJ/aJCn4ktyy4jMh0+N
	xCsuzHlzQ7gWX2e22BKntvwc3nIw8hYD/LWqZB4RQalGUifQjfRzApwE7x4bEEbPtCkX4wgX5d1
	jSPffzDKku
X-Google-Smtp-Source: AGHT+IH7sgN1Uipv2qIehYyfPkgfd4Xy/W9AcNWaxkV0fmExJBTYScLNQstD+s0qCJYHU+iZtjXiGQ==
X-Received: by 2002:a05:6000:4027:b0:401:2cbf:ccad with SMTP id ffacd0b85a97d-425829e78e9mr16695402f8f.17.1760302754926;
        Sun, 12 Oct 2025 13:59:14 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46fb489197dsm156506505e9.10.2025.10.12.13.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 13:59:14 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v5 5/5] PCI: mediatek: add support for Airoha AN7583 SoC
Date: Sun, 12 Oct 2025 22:56:59 +0200
Message-ID: <20251012205900.5948-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012205900.5948-1-ansuelsmth@gmail.com>
References: <20251012205900.5948-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_135916_809010_BB1A839F 
X-CRM114-Status: GOOD (  20.97  )
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

Add support for the second PCIe Root Complex present on Airoha AN7583
SoC.

This is based on the Mediatek Gen1/2 PCIe driver and similar to Gen3
also require workaround for the reset signals.

Introduce a new flag to skip having to reset signals and also introduce
some additional logic to configure the PBUS registers required for
Airoha SoC.

While at it, also add additional info on the PERST# Signal delay
comments and use dedicated macro.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 92 ++++++++++++++++++++------
 1 file changed, 70 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 1678461e56d3..3340c005da4b 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -148,6 +148,7 @@ enum mtk_pcie_flags {
 	NO_MSI = BIT(2), /* Bridge has no MSI support, and relies on an
 			  * external block
 			  */
+	SKIP_PCIE_RSTB	= BIT(3), /* Skip calling RSTB bits on PCIe probe */
 };
 
 /**
@@ -684,28 +685,32 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
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
+	if (!(soc->flags & SKIP_PCIE_RSTB)) {
+		/* Assert all reset signals */
+		writel(0, port->base + PCIE_RST_CTRL);
+
+		/*
+		 * Enable PCIe link down reset, if link status changed from
+		 * link up to link down, this will reset MAC control registers
+		 * and configuration space.
+		 */
+		writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
+
+		/*
+		 * Described in PCIe CEM specification revision 3.0 sections
+		 * 2.2 (PERST# Signal) and 2.2.1 (Initial Power-Up (G3 to S0)).
+		 *
+		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
+		 * for the power and clock to become stable.
+		 */
+		msleep(PCIE_T_PVPERL_MS);
+
+		/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
+		val = readl(port->base + PCIE_RST_CTRL);
+		val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
+		       PCIE_MAC_SRSTB | PCIE_CRSTB;
+		writel(val, port->base + PCIE_RST_CTRL);
+	}
 
 	/* Set up vendor ID and class code */
 	if (soc->flags & NEED_FIX_CLASS_ID) {
@@ -826,6 +831,41 @@ static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
 	return 0;
 }
 
+static int mtk_pcie_startup_port_an7583(struct mtk_pcie_port *port)
+{
+	struct mtk_pcie *pcie = port->pcie;
+	struct device *dev = pcie->dev;
+	struct pci_host_bridge *host;
+	struct resource_entry *entry;
+	struct regmap *pbus_regmap;
+	resource_size_t addr;
+	u32 args[2], size;
+
+	/*
+	 * Configure PBus base address and base address mask to allow
+	 * the hw to detect if a given address is accessible on PCIe
+	 * controller.
+	 */
+	pbus_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+							   "mediatek,pbus-csr",
+							   ARRAY_SIZE(args),
+							   args);
+	if (IS_ERR(pbus_regmap))
+		return PTR_ERR(pbus_regmap);
+
+	host = pci_host_bridge_from_priv(pcie);
+	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
+	if (!entry)
+		return -ENODEV;
+
+	addr = entry->res->start - entry->offset;
+	regmap_write(pbus_regmap, args[0], lower_32_bits(addr));
+	size = lower_32_bits(resource_size(entry->res));
+	regmap_write(pbus_regmap, args[1], GENMASK(31, __fls(size)));
+
+	return mtk_pcie_startup_port_v2(port);
+}
+
 static void mtk_pcie_enable_port(struct mtk_pcie_port *port)
 {
 	struct mtk_pcie *pcie = port->pcie;
@@ -1210,6 +1250,13 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7622 = {
 	.flags = NEED_FIX_CLASS_ID,
 };
 
+static const struct mtk_pcie_soc mtk_pcie_soc_an7583 = {
+	.ops = &mtk_pcie_ops_v2,
+	.startup = mtk_pcie_startup_port_an7583,
+	.setup_irq = mtk_pcie_setup_irq,
+	.flags = NEED_FIX_CLASS_ID | SKIP_PCIE_RSTB,
+};
+
 static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
 	.device_id = PCI_DEVICE_ID_MEDIATEK_7629,
 	.ops = &mtk_pcie_ops_v2,
@@ -1219,6 +1266,7 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
 };
 
 static const struct of_device_id mtk_pcie_ids[] = {
+	{ .compatible = "airoha,an7583-pcie", .data = &mtk_pcie_soc_an7583 },
 	{ .compatible = "mediatek,mt2701-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt7623-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt2712-pcie", .data = &mtk_pcie_soc_mt2712 },
-- 
2.51.0


