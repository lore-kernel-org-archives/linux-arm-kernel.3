Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB61C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 22:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rFa0sUM2ZNZURgg7xmwQHAayX2Vx/lL2j0bys8ap8A=; b=Fy4q06JJ2O8s642vwKR+ZbTEYB
	Fn7yfZRSvQj543jtE/3AcvTs8h2tTitWZny7sv/KrcmqcNJcxKgxeKSotNxJiEtNmvZxFBc6+eNAW
	+gk3Mi8OsVGbmNYE87HVlToIo1N8CN5VK7dp1tX6Vg5Nd+xjVKaTrsj4K88+yhEsXXSmuUv2DO5l7
	8RwD81daCEoerIMwXuNxd56A5AYc+iVI7nABmH4A5E5K5CbaKn2Gw13DFwhkMh6fb9ca1GWAMjNM4
	mtE5Pwux4FXsrHfp5Vx4q0pbP61QnJ5QLyhOkRvJF+EvJpIwn6pXMi6zDgS8VRI9YGf+F9Ys3PzxZ
	+KGN3jrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrxg-0000000Djh1-0n6e;
	Mon, 06 Jul 2026 22:38:48 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrxb-0000000Dje5-0Mmw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 22:38:46 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1783377519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3rFa0sUM2ZNZURgg7xmwQHAayX2Vx/lL2j0bys8ap8A=;
	b=v8aRUQ1siz7ifJ0JC1a+8OAQOU0AOT6dLhlF6kFKzp6NsIO709o9CYYkOy0X/T4INHI6y5
	Q7XqWjadaAIiyafY+MlsfKRoYe7qVEE57z9ItINet26/a/C+EZROUwunXQrNqh41AyGsnH
	81jl9t/JqVUsU2qXKTeHms+Ff818WiU=
Date: Tue, 07 Jul 2026 00:38:27 +0200
Subject: [PATCH 1/2] PCI: apple: Integrate pwrctrl API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-apple-pcie-pwren-v1-1-5a281b182fe2@cyberchaos.dev>
References: <20260707-apple-pcie-pwren-v1-0-5a281b182fe2@cyberchaos.dev>
In-Reply-To: <20260707-apple-pcie-pwren-v1-0-5a281b182fe2@cyberchaos.dev>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Marc Zyngier <maz@kernel.org>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_153843_299066_7D8A2ABE 
X-CRM114-Status: GOOD (  12.18  )
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

Integrate the PCI pwrctrl framework into the Apple PCIe host driver to
provide standardized power management for PCI devices.

Notably, this allows enabling powering on the WiFi, SD card reader on
various Macs by means of the pwrctrl framework before probing the ports.

Previously, a custom solution for powering on the WiFi and SD card
reader was proposed[1], but we can now use the new pci-pwrctrl-generic
driver for this purpose.

Link[1]: https://lore.kernel.org/lkml/20220502093832.32778-4-marcan@marcan.st/

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 drivers/pci/controller/Kconfig      |  1 +
 drivers/pci/controller/pcie-apple.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 2247709ef6d6..af64630d28fa 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -46,6 +46,7 @@ config PCIE_APPLE
 	depends on OF
 	depends on PCI_MSI
 	select PCI_HOST_COMMON
+	select PCI_PWRCTRL_GENERIC
 	select IRQ_MSI_LIB
 	help
 	  Say Y here if you want to enable PCIe controller support on Apple
diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index c2cffc0659f4..db038a9d4831 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -30,6 +30,7 @@
 #include <linux/msi.h>
 #include <linux/of_irq.h>
 #include <linux/pci-ecam.h>
+#include <linux/pci-pwrctrl.h>
 
 #include "pci-host-common.h"
 
@@ -825,6 +826,21 @@ static int apple_pcie_init(struct pci_config_window *cfg)
 	if (WARN_ON(!pcie))
 		return -ENOENT;
 
+	ret = pci_pwrctrl_create_devices(pcie->dev);
+	if (ret) {
+		dev_err(pcie->dev, "Failed to create pwrctrl devices: %pe\n", ret);
+		return ret;
+	}
+
+	ret = pci_pwrctrl_power_on_devices(pcie->dev);
+	if (ret) {
+		if (ret != -EPROBE_DEFER) {
+			dev_err(pcie->dev, "Failed to power on devices: %pe\n", ret);
+			pci_pwrctrl_destroy_devices(pcie->dev);
+		}
+		return ret;
+	}
+
 	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
 		ret = apple_pcie_setup_port(pcie, of_port);
 		if (ret) {

-- 
2.54.0


