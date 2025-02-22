Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C56C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 10:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUMjeZEEX4SOM5RWgm2PEDVwvENlYP4zdM2HnLHNtDY=; b=swtBpepmjcYeJHKjSDIdNelTp3
	iUwvJaZoVO7wuvVt6AMVGuIuFuxmeSyLXFas+5BUNsgEXBsbA/bWg192Q6MSIr0qHRWqJau8r+j8w
	xRvRZ/w6Io8qwosMokEMJXNvS1dXL/oZs6XZowd8UMqRE5f3dsU3DdE2EX2csgGvneEEtIAWeCF4T
	8qLK/b5ryPKNU0+Fg9kPw0T2EqG3n3pQwmvqjv/NBSnqWrumE8/lDvvu+hhz62+IXTrY8fYxV2i1h
	ewg/ezGw8ZgDb9Jm150xD9U7tNb78viSJSDuwOkgtXLVo9NnfQxb+YcNsqB8ri6rNblfWbcLVudwN
	nReDk5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tln3v-00000007qhh-42lw;
	Sat, 22 Feb 2025 10:48:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlmzc-00000007qCG-3ykz;
	Sat, 22 Feb 2025 10:44:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 72EC55C552F;
	Sat, 22 Feb 2025 10:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF059C4CEE6;
	Sat, 22 Feb 2025 10:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740221060;
	bh=KklBsnKcVFSuYBzhg3x4RUn9m/fVl0ZPRbgJvxFW3Kg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TAWwjkpd+5cFg6+zzP9oLs1xn1rF2z5+dbD0nvnQlS8YjnyJWHp+/gQ+4ueZrNcX+
	 V0O8iEW/VgTO8jrhysPvVMFU7IRTf8vApyrqogJRYxD04B55UpF/q1OQbTYv4Uzeyr
	 Y+46wNkZA8wPM+Df41iCJz/K6YVexwN3W47XLGYlC8ufvCexlmHXozu9VGPZsixfq6
	 tcvJNg2ATFeFuDPq/AU2abj3/aSJqLFBZYdO32ryolKyfrUqJjCF1bRvSlmKcxK3mR
	 wllzj44pFCV6bMynfX6RT5XkQgByYhYo1surtZDfu7wWaqxxm9HCGRaHu2cAThwwy1
	 OL9xpO93NtnOg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 22 Feb 2025 11:43:45 +0100
Subject: [PATCH v3 2/2] PCI: mediatek-gen3: Configure PBUS_CSR registers
 for EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-en7581-pcie-pbus-csr-v3-2-e0cca1f4d394@kernel.org>
References: <20250222-en7581-pcie-pbus-csr-v3-0-e0cca1f4d394@kernel.org>
In-Reply-To: <20250222-en7581-pcie-pbus-csr-v3-0-e0cca1f4d394@kernel.org>
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
X-CRM114-CacheID: sfid-20250222_024421_082313_9B27C6C7 
X-CRM114-Status: GOOD (  14.25  )
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
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 34 ++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 0f64e76e2111468e6a453889ead7fbc75804faf7..51103b7624c09ca957c22a25536dc9da25428e48 100644
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
+	u32 val, args[2], size, mask;
+	struct regmap *pbus_regmap;
+	resource_size_t addr;
 	int err;
-	u32 val;
 
 	/*
 	 * The controller may have been left out of reset by the bootloader
@@ -944,6 +950,32 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
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
+		return -EINVAL;
+
+	addr = entry->res->start - entry->offset;
+	err = regmap_write(pbus_regmap, args[0], lower_32_bits(addr));
+	if (err)
+		return err;
+
+	size = lower_32_bits(resource_size(entry->res));
+	mask = size ? GENMASK(31, __fls(size)) : 0;
+	err = regmap_write(pbus_regmap, args[1], mask);
+	if (err)
+		return err;
+
 	/*
 	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
 	 * requires PHY initialization and power-on before PHY reset deassert.

-- 
2.48.1


