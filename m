Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BF8C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 20:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SpzTEMCS0usPe+qhcbBbwM7rfUiZglJZQw1TpXaV4w=; b=x0fqdbES1xFHh/juO30zpDOum8
	ICkV5+MXjXmlMhog8MQdBRN68RCA1gxLzkEpLQFgPhPEFcKYwRNAiUJd08jWazuFX8e91nVVMDq9K
	biBmppY+G/5wvykvamXRK1fz3jNWpfr4K87l2Nr2HNDd/7qt/xqD8Mx5IATSH1sel4rt5tr1lbO6c
	nWSaFWjrUenHMbV3uoda7jBLftypailgQM+Un3BgDLw3yizrgQoq3z3Hpd3gic74fiI+DAyK6tTIG
	w1JtLbam0fM015STQucBSjxaaC98Qx/i57+3HiRCj6EA0ZXBl8dJ161giCuSyYj7Ucn1NBUJGW38c
	FB3HRpTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttY5z-0000000Govc-2izf;
	Sat, 15 Mar 2025 20:26:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXvQ-0000000GnT6-2cPA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 20:16:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 34CD0A48B96;
	Sat, 15 Mar 2025 20:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF49C4CEEE;
	Sat, 15 Mar 2025 20:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742069763;
	bh=xB6ldgyig7nN1oawfCv8XbECiYxHY/R3QbJPHcluIDk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LEjL2sg6NL0sBUo+hdJ1COcu8uVHTNW6Xk6LjpHobFVf9FX2ljnsE2FyUu1Hz6q/P
	 HD6QapKbbHHeH7h3xE2hQIry9GVELimvZqxXUCDjW7jCZeV7hy69nK1dcOURThHpNo
	 sRq4ew3NsXblUUdC54i1mDoYxDMtmhpaPUKoob2ECHXMfWfy9M9ULcpo3EC7OnM02m
	 C65wRKrBWp5CwsL5cdsMRJ8BLv6u7DiehUeLZt+YtLYLPiKRKkuN4UMLryvLiLamH2
	 /YWoiqUaBSOzn5uRsXeMmCssNKbPEqOY6uzJJmn2fF2NuhgySFAq+4m2mDXfSq44Zn
	 Mi5Eve/5HMoYg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Niklas Cassel <cassel@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v12 05/13] PCI: dwc: Add dw_pcie_parent_bus_offset()
Date: Sat, 15 Mar 2025 15:15:40 -0500
Message-Id: <20250315201548.858189-6-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250315201548.858189-1-helgaas@kernel.org>
References: <20250315201548.858189-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_131604_789830_8A956EA6 
X-CRM114-Status: GOOD (  11.11  )
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

From: Frank Li <Frank.Li@nxp.com>

Return the offset from CPU physical address to the parent bus address of
the specified element of the devicetree 'reg' property.

[bhelgaas: return offset, split .cpu_addr_fixup() checking and debug to
separate patch]
Link: https://lore.kernel.org/r/20250313-pci_fixup_addr-v11-5-01d2313502ab@nxp.com
Signed-off-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/controller/dwc/pcie-designware.c | 23 ++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 9d0a5f75effc..0a35e36da703 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -16,6 +16,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/ioport.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
@@ -1105,3 +1106,25 @@ void dw_pcie_setup(struct dw_pcie *pci)
 
 	dw_pcie_link_set_max_link_width(pci, pci->num_lanes);
 }
+
+resource_size_t dw_pcie_parent_bus_offset(struct dw_pcie *pci,
+					  const char *reg_name,
+					  resource_size_t cpu_phy_addr)
+{
+	struct device *dev = pci->dev;
+	struct device_node *np = dev->of_node;
+	int index;
+	u64 reg_addr;
+
+	/* Look up reg_name address on parent bus */
+	index = of_property_match_string(np, "reg-names", reg_name);
+
+	if (index < 0) {
+		dev_err(dev, "No %s in devicetree \"reg\" property\n", reg_name);
+		return 0;
+	}
+
+	of_property_read_reg(np, index, &reg_addr, NULL);
+
+	return cpu_phy_addr - reg_addr;
+}
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index d0d8c622a6e8..16548b01347d 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -500,6 +500,9 @@ void dw_pcie_setup(struct dw_pcie *pci);
 void dw_pcie_iatu_detect(struct dw_pcie *pci);
 int dw_pcie_edma_detect(struct dw_pcie *pci);
 void dw_pcie_edma_remove(struct dw_pcie *pci);
+resource_size_t dw_pcie_parent_bus_offset(struct dw_pcie *pci,
+					  const char *reg_name,
+					  resource_size_t cpu_phy_addr);
 
 static inline void dw_pcie_writel_dbi(struct dw_pcie *pci, u32 reg, u32 val)
 {
-- 
2.34.1


