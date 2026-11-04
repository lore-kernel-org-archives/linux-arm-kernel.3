Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA78606D80C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BM8Vi6T2;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=at5rsQ/j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8FaVhxguwgKI7Sj57jrxeuXDOLyYakEWO+TPFrvtixk=; b=BM8Vi6T2PeNLqy
	DWIeXIpw45yDPdt+ub1ry1CBsyK+CEwsejfqM5DvCdjBo9yVu5JvfsvU/d0aCz/00jI/F0xnJOrK7
	aI8HgsIsU+WzwCzUl+SZiGbyqoKA2VdCwGBI3/EvxSen69IfAgmMWW+c4ZxC9dB41BT+yxm0kWRph
	Vc83Bp33CFMwzCNCIdjfFekGGG7pl764+hldGAJe7Zmgg9/NxoNkx+2nYOU4XjodF+6gcIdBP/s7a
	q7E4FnrjxH2bI8mJKzke1a36JhJtr25iFls51RKAsTleIsVtO+6lDICJ5byYcJU02N4XCqfWzUnU4
	jQ5ASHmoiyfnNYYm5qJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZMO-00000005CfY-1We1;
	Wed, 04 Nov 2026 11:40:56 +0000
Received: from [195.39.247.168] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZMJ-00000005CZu-3Aw5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:40:53 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793792440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8FaVhxguwgKI7Sj57jrxeuXDOLyYakEWO+TPFrvtixk=;
	b=at5rsQ/jOkdtSPI+2QXw+EHXVB0TuvT/f3XdBQ1Di6LlgYRik4GL+5r+04gFo7VDr5l9Rl
	ggQpu/7Oh0QBbq+LQr2TqWomFiArzV9yOefxmasCliQWvFROLC1C85e4ct8RRClPiviwQg
	Hq/jJ3KP5RU7Yv6vjptFycvChAMiA8s=
Date: Wed, 04 Nov 2026 12:40:30 +0100
Subject: [PATCH v2 2/3] PCI: apple: Integrate pwrctrl API
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-apple-pcie-pwren-v2-2-216a4066965f@cyberchaos.dev>
References: <20261104-apple-pcie-pwren-v2-0-216a4066965f@cyberchaos.dev>
In-Reply-To: <20261104-apple-pcie-pwren-v2-0-216a4066965f@cyberchaos.dev>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_034051_963839_90E0C30F 
X-CRM114-Status: GOOD (  12.04  )
X-Spam-Score: -1.3 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Integrate the PCI pwrctrl framework into the Apple PCIe host driver to
provide standardized power management for PCI devices.

Notably, this allows enabling powering on the WiFi, SD card reader on
various Macs by means of the pwrctrl framework before probing the ports.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 drivers/pci/controller/Kconfig      |  1 +
 drivers/pci/controller/pcie-apple.c | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index d246bbe37948..791892a6c0c6 100644
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
index c2cffc0659f4..2d32092e2122 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -30,6 +30,7 @@
 #include <linux/msi.h>
 #include <linux/of_irq.h>
 #include <linux/pci-ecam.h>
+#include <linux/pci-pwrctrl.h>
 
 #include "pci-host-common.h"
 
@@ -825,6 +826,28 @@ static int apple_pcie_init(struct pci_config_window *cfg)
 	if (WARN_ON(!pcie))
 		return -ENOENT;
 
+	// Ensure all ports can be powered on before attempting initialization
+	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
+		ret = pci_pwrctrl_create_device(of_port, pcie->dev);
+		if (ret) {
+			dev_err(pcie->dev, "Failed to create pwrctrl device: %pe\n", ERR_PTR(ret));
+			return ret;
+		}
+
+		ret = pci_pwrctrl_power_on_device(of_port);
+		if (ret) {
+			if (ret != -EPROBE_DEFER) {
+				dev_err(pcie->dev,
+					"Failed to power on device: %pe\n",
+					ERR_PTR(ret));
+				for_each_available_child_of_node_scoped(dev->of_node, of_port) {
+					pci_pwrctrl_destroy_device(of_port);
+				}
+			}
+			return ret;
+		}
+	}
+
 	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
 		ret = apple_pcie_setup_port(pcie, of_port);
 		if (ret) {

-- 
2.56.0


