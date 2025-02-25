Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218D1C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 08:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vo+YK8GwUXppsrfkC1Lxtn4q/YlGVDS7GUOb54fs1rg=; b=tCq7VmeNc6+CAqIH1UxAuDg2RK
	2pgJWHpAzdJOsmTvW0vFa6rInb6ze0PZGAba0vlQluXOj2J93kY+Jl0US5evvjQHvdhwWJCyYS/T4
	KakkzH5g0S4m9XHavkgi1QSU5vQP8MrDahtrLogt8y4VIf2sNkcBFCIHP+9IjuZgKJ2KTRgqU2H4J
	x83McIXjXeAaznH9M7I41zyg/1f4l5wgvUi6OGzDvS3zlnBc83lwYSZuq4wBCN5OIpnyDGCFAuFbI
	7fxFhH6wnd0oPlVAM8J0pAKip/UNtgRQmCpmXYxGx78wxXDOqUGdzqY2Ji7M4yZZS5KMX/7COf4Zf
	DSe92UQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmq5J-0000000GL1U-01uy;
	Tue, 25 Feb 2025 08:14:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpvM-0000000GJa9-2FDr;
	Tue, 25 Feb 2025 08:04:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E0F25C6521;
	Tue, 25 Feb 2025 08:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA54C4CEE2;
	Tue, 25 Feb 2025 08:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740470655;
	bh=UIr6nl14PNT9O4sqrjXYAxiPPUTsIADVOWslxLJu8eE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HazrX7jcNWGDWPn00kfwIVFAZrjrOIBlHvF+GFuYvJW8uoqNS3ZZRIdbOhlVlMZlX
	 X3Op2ucNDqG6zvoE/1kq8WIEibknLRURU287GeRnMXwegTD6rBSZDv+0vOs2xF3UW1
	 AeEA9ZrFrsJh/Ke3stfrdxT7GPdxnHATTSCx3AU3HJVOonvZLgLz7amEVY+sD06SGu
	 0KbZqydZzhF/vAzBsf7V3m8s7ZE2jgTnBzF36r8mK2jGdrTPjBHXBJa2FA5Zlvzj9h
	 5l+ib7csstl5fMKyONEYosEt5Fqw/SNWUDIbQmLZnsq5FJ1HawjZ46XmzlLqBMzdPz
	 vEgzTqDtIV36A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 25 Feb 2025 09:04:07 +0100
Subject: [PATCH v4 2/2] PCI: mediatek-gen3: Configure PBUS_CSR registers
 for EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-en7581-pcie-pbus-csr-v4-2-24324382424a@kernel.org>
References: <20250225-en7581-pcie-pbus-csr-v4-0-24324382424a@kernel.org>
In-Reply-To: <20250225-en7581-pcie-pbus-csr-v4-0-24324382424a@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_000416_664690_340B8C1E 
X-CRM114-Status: GOOD (  14.53  )
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

Configure PBus base address and address mask to allow the hw
to detect if a given address is accessible on PCIe controller.

Fixes: f6ab898356dd ("PCI: mediatek-gen3: Add Airoha EN7581 support")
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 0f64e76e2111468e6a453889ead7fbc75804faf7..3583e5481dc8a6a357738048fc341c22204527d9 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -15,6 +15,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of_device.h>
@@ -24,6 +25,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include "../pci.h"
@@ -930,9 +932,13 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 
 static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 {
+	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
 	struct device *dev = pcie->dev;
+	struct resource_entry *entry;
+	struct regmap *pbus_regmap;
+	u32 val, args[2], size;
+	resource_size_t addr;
 	int err;
-	u32 val;
 
 	/*
 	 * The controller may have been left out of reset by the bootloader
@@ -944,6 +950,26 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	/* Wait for the time needed to complete the reset lines assert. */
 	msleep(PCIE_EN7581_RESET_TIME_MS);
 
+	/*
+	 * Configure PBus base address and base address mask to allow the
+	 * hw to detect if a given address is accessible on PCIe controller.
+	 */
+	pbus_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+							   "mediatek,pbus-csr",
+							   ARRAY_SIZE(args),
+							   args);
+	if (IS_ERR(pbus_regmap))
+		return PTR_ERR(pbus_regmap);
+
+	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
+	if (!entry)
+		return -ENODEV;
+
+	addr = entry->res->start - entry->offset;
+	regmap_write(pbus_regmap, args[0], lower_32_bits(addr));
+	size = lower_32_bits(resource_size(entry->res));
+	regmap_write(pbus_regmap, args[1], GENMASK(31, __fls(size)));
+
 	/*
 	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
 	 * requires PHY initialization and power-on before PHY reset deassert.

-- 
2.48.1


