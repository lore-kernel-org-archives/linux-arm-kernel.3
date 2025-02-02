Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE73C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 19:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2aGAxjbAdwFKujLg/eNYHEFxNEe6obl2fXXxzMZFSU=; b=Dn5IITxY5Dnke75JBA5Ps0rRLq
	vPfcrenxlQ1t4wJMEq5lys8v6rxH2ySDs5gSz83mEf0QRj58fPRXWqTEQj/JRqw5o9LySZTvem/y5
	dHfAunzgUC58r6SYhOtcgyTCleWib5FEJjmN5qPIzr4Ybh5SLl680en/B7MEM93owLaLPoxLN+rVa
	Rt+PwpNDGX16GlQ3zfIfAR8I0Ot0kdEhsX40DK6uMarZjhvCWoxM5SmXzfEx4HIXLcSd5H5mffyzz
	J4knW+pPiMq9lnMpJHg0XSdT0q3RIC440tsD+qSE9cgm1ANAMFdpW3cDKdvGo9faZjoPXJawn0hdo
	KYzWClwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tefnw-0000000E7BR-2il3;
	Sun, 02 Feb 2025 19:38:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tefk7-0000000E6n7-1gNu;
	Sun, 02 Feb 2025 19:34:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F590A40C2C;
	Sun,  2 Feb 2025 19:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD378C4CED1;
	Sun,  2 Feb 2025 19:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738524894;
	bh=K2iI3AiKvjoEFvWs1oYEwnuQSWAbsXtBtq6KCTpCm8s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FbN+JRDrD7nKr2dLBNZOe1qC5aTOv060C1/q8JE2jiFqpQZfLWCDIQ+vBM7WVNPF0
	 CbNRTCsKPrraZwXbK+C6dIr8cRj8OoVb9fRzlKOqMkm9LWL0FWD7KpDaXQv6PnTzar
	 VYyYAbh0aY7JvMwLHcXdW/SeuLmpwdKUqCHbcN0YrtVzJZpxOZy/I0wErBhtYsTRJm
	 X2FTJAE44lFt05ch1YlEgJpGSE0vyBL87XergSHCM8bjAxtRsL1BGqHaFAZmZmqAXl
	 Myfn6cCiNzhPR32po55YKJNj9dVSeM5yczAgBdD94pJWhv+PV5PgwM7GMTBpvSf7Wt
	 /3kw0y5UnTBoA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 02 Feb 2025 20:34:24 +0100
Subject: [PATCH v2 2/2] PCI: mediatek-gen3: Configure PBUS_CSR registers
 for EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-en7581-pcie-pbus-csr-v2-2-65dcb201c9a9@kernel.org>
References: <20250202-en7581-pcie-pbus-csr-v2-0-65dcb201c9a9@kernel.org>
In-Reply-To: <20250202-en7581-pcie-pbus-csr-v2-0-65dcb201c9a9@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_113455_570336_77782389 
X-CRM114-Status: GOOD (  14.27  )
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
to detect if a given address is on PCIE0, PCIE1 or PCIE2.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 30 ++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index aa24ac9aaecc749b53cfc4faf6399913d20cdbf2..9c2a592cae959de8fbe9ca5c5c2253f8eadf2c76 100644
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
@@ -127,6 +129,13 @@
 
 #define PCIE_MTK_RESET_TIME_US		10
 
+#define PCIE_EN7581_PBUS_ADDR(_n)	(0x00 + ((_n) << 3))
+#define PCIE_EN7581_PBUS_ADDR_MASK(_n)	(0x04 + ((_n) << 3))
+#define PCIE_EN7581_PBUS_BASE_ADDR(_n)	\
+	((_n) == 2 ? 0x28000000 :	\
+	 (_n) == 1 ? 0x24000000 : 0x20000000)
+#define PCIE_EN7581_PBUS_BASE_ADDR_MASK	GENMASK(31, 26)
+
 /* Time in ms needed to complete PCIe reset on EN7581 SoC */
 #define PCIE_EN7581_RESET_TIME_MS	100
 
@@ -931,7 +940,8 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
-	int err;
+	struct regmap *map;
+	int err, slot;
 	u32 val;
 
 	/*
@@ -945,6 +955,24 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	/* Wait for the time needed to complete the reset lines assert. */
 	msleep(PCIE_EN7581_RESET_TIME_MS);
 
+	map = syscon_regmap_lookup_by_phandle(dev->of_node,
+					      "mediatek,pbus-csr");
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	/*
+	 * Configure PBus base address and address mask to allow the
+	 * hw to detect if a given address is on PCIE0, PCIE1 or PCIE2.
+	 */
+	slot = of_get_pci_domain_nr(dev->of_node);
+	if (slot < 0)
+		return slot;
+
+	regmap_write(map, PCIE_EN7581_PBUS_ADDR(slot),
+		     PCIE_EN7581_PBUS_BASE_ADDR(slot));
+	regmap_write(map, PCIE_EN7581_PBUS_ADDR_MASK(slot),
+		     PCIE_EN7581_PBUS_BASE_ADDR_MASK);
+
 	/*
 	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
 	 * requires PHY initialization and power-on before PHY reset deassert.

-- 
2.48.1


