Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87286CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 20:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aly97HE4DbfA98BoW1r98QzzxmSOsTSspnaWMcDHFeI=; b=3DYgkGeJxx7GIMd4c4lLUCB6FD
	VZ1y7lj+oGf4+5bDe+oWoNZRRaOJ1ojsgpyAzrGgkqCgBeiNHKC2kJaSh0pQhacr01sKggENvSYRp
	L0Xidh7uu1O7CX/KkaYZGqFlULqXpJyl8iZyB83cvx7MJEW+617xGoGHouH9ZJXZdau7oRooqytA3
	kKgXHqJMR32RSsLPKZH1EWRCO8ywpPjxgXFfQiozXV8Fx8HYLeR8940A3dn86szBVNZ2BOadQBHjD
	hadF7b4rDYhC+N3Dwp4cRIuhYx5E7cHysOTCRTYGiYGtdNqDMfBGr8PhJMz0RdxI0IUxfCHt+2IPy
	1E6rVs2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19Nw-0000000Ek5G-1M4y;
	Tue, 23 Sep 2025 20:13:12 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19Nl-0000000EjtP-25dK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 20:13:02 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3ee1381b835so3965809f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 13:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758658380; x=1759263180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aly97HE4DbfA98BoW1r98QzzxmSOsTSspnaWMcDHFeI=;
        b=USjrlY9Wvx4gUQrOvjdazQ3rkmn28gL6oIuEdUeFisRNAZgaSRNMsNL3Vi35uUgr/C
         kusMpw1dbIBZGJQQPAsTw9M20JcYWpTbBLkXoV5wA9gr657T25P5+tGdU/9cO4bS1KJw
         HgB82y6hMWu8XfCxSJaiigw1CIjUdNZFrPtaJCjCMhzROKGhzBEM4KUQKvTokp091EhE
         gLtBQeMZCZFatfpUGWNqa9Bbc0Vbk8PXswBqQdnyFS0IMGIMHyDvZZdcZGk1pRYO5Y0X
         noQp9pMXPTH4+kYMGV/0q9UxwrW+vyjrdLvEPzlFv2ucxmXShalVc7zrf5K87zFRp2yu
         aojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758658380; x=1759263180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aly97HE4DbfA98BoW1r98QzzxmSOsTSspnaWMcDHFeI=;
        b=Fl0gweZGAM23Bl1Sy/ff6BDvU/g1SEGtJHSCO80ra7JgZdNPXwY/VyuFK087VEne0x
         qsleLXw3JyzHHt7lF91gce/PSRE5Ix2+bYttvPAl2k7BV4v3VaaTChr4+uthA6AEh/2t
         c8/Vawdj3TuMJXvBL2IqtiEK0CVvccjxj9TCi9c9VYGcs81og+gGXDqApe/Hfrkwh10R
         uSEosps80vKCemZzAlEHV563FQLBLQIv9eLTlL1dtixhnqtSYcju9YLDyTDE3k5dRpjy
         hNObQmDs+TaviLZnQ9Rt/sC9QuTLLLRBgkIbdBUOazdd1gmTx1FmNwtis4z5EzZvVTNt
         JYiA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ7Bl/ebhCsQSV3GlpOHKWqLX/pd8srpx9bHhN/ABPpimSJ4se0vJuDdKxUcewLBnusTDOAcQyJYc/i6BIsHeM@lists.infradead.org
X-Gm-Message-State: AOJu0YxGur6kW2jdUf/RLRHnStqnFYWIYnk9NUwCN6cuhpEqT89pgruu
	NeE2TqwzPbTZr7siYsB7tABdBE9WDBbBsFmBoUez4h1rd4AGU9BLZX/b
X-Gm-Gg: ASbGncsEirHijCn+r/fptUlY1UGYnz6mjymiQWJDRMEeJprMT7/jmk236YecJn1iQqe
	3zSASmc9M5erb8hixEwrJ6Ph+4aNywtl8u2vwn8vS+nNEW/CDCw3vKEpqOG4DxlXJVjT4gWE7Nl
	gLtc4zluIOf+/j4VcjNs6F4wnZP8XpziMJCXYvQehZzMTEqxnktF+12W1E25l7SXOynuLncR5sM
	eipcOOKaj5yNdNQCiW7K1cZihXr0uZ7ZvbJKDHYouyYtzhmXBt4i/Mq2LkbrqoBImD4ThMyVwgW
	CKq81bGYGUB3aRUrcsZT/BpkdUdOo+DplJxjjBm3am1NYLRHOrm9mYrdO9HHXOCfjcDdC96D7dT
	bWb0tiQUExJkFcR7vSfvYqDXIi9WWV92XN7k3F/komWTw+Bg+osomqHliOL0b/VKQN9HcSL4=
X-Google-Smtp-Source: AGHT+IFbHn8VL6NabBiNOJDmra87r8MK+4nqnknbe3Uap+qkSdJFvH4B0H/cqDTPX4N5G1MGJJWP8Q==
X-Received: by 2002:a5d:5889:0:b0:3ec:d78d:8fde with SMTP id ffacd0b85a97d-405cb7bbd49mr3615361f8f.44.1758658379499;
        Tue, 23 Sep 2025 13:12:59 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee141e9cf7sm24889690f8f.12.2025.09.23.13.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:12:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 4/4] PCI: mediatek: add support for Airoha AN7583 SoC
Date: Tue, 23 Sep 2025 22:12:32 +0200
Message-ID: <20250923201244.952-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923201244.952-1-ansuelsmth@gmail.com>
References: <20250923201244.952-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_131301_573214_5898F9CA 
X-CRM114-Status: GOOD (  23.37  )
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


