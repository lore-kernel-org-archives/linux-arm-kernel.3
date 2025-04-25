Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2786C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmLIIsSXZlE0yxGj02mf0oBCyw8RS0RVRfp2xWsIfpc=; b=EYXiY6I8CZ/n8sxoXJ+sAYIoDC
	3pCmhT3x6FIRdNCzqzRxwWKLAbfZmltk6ij19ZHuCJfpZpXgWvBRbRVbJlflfAPNK7lAl6IWRuqXp
	0W7PkYw325tUTk+jB+CIouKkY3Jwx05QdKXqt/nBRjPvAGx4l0A5Zv5QzC03G8Oh0XU4B04pSYSdN
	IHCb63hUKPoUka34anAM3sw1rib/UcVXVco8rU0V3fEGsofsQuNGH84/N7f+sFo+yRsHARj6hZvtr
	qtSFWnQp/LHXLMidYoVXhAiLACZ7S78U63nU4nFB7I1gksWgmCLIuqiry4r/Nn6/uAZ+KX6xAEOJw
	CBGa+F6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8H7x-0000000GwX1-2vME;
	Fri, 25 Apr 2025 11:21:53 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FpK-0000000GdkY-1JS9;
	Fri, 25 Apr 2025 09:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=xmLII
	sSXZlE0yxGj02mf0oBCyw8RS0RVRfp2xWsIfpc=; b=Jehkz7ubRygGolxPxQNMg
	IcYsez6GN8mfFRtntr2kdYWZZL9Mf4Ws8fTuBicJ2wzAm6aAfXAk3Arew7yZjCx9
	0V4tO6BIsp3/cNDwrs2rcnWdDFjVQyDXSlmhsgYNBlpofAyO8OQeq3t9R7TbZNfM
	zQIrlFpvQQA/2+FIGlGpZ0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAnfJt2XAtowU4iAw--.17018S3;
	Fri, 25 Apr 2025 17:57:14 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	heiko@sntech.de,
	thomas.petazzoni@bootlin.com,
	manivannan.sadhasivam@linaro.org,
	yue.wang@Amlogic.com
Cc: pali@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	jingoohan1@gmail.com,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v2 1/2] PCI: Configure root port MPS to hardware maximum during host probing
Date: Fri, 25 Apr 2025 17:57:07 +0800
Message-Id: <20250425095708.32662-2-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250425095708.32662-1-18255117159@163.com>
References: <20250425095708.32662-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgAnfJt2XAtowU4iAw--.17018S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw1rKw18Cw47Wr1ftFWUurg_yoW5Jw1Upa
	yYkw48Jr48Gry3Wa1kt3Wv9rWYqFn5CrW3trZ8XwnIv3W5Aa4jqrW2ka1rXF97GFZayryY
	qr4qqFyUuanYvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziZYFAUUUUU=
X-Originating-IP: [222.71.101.198]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOhI6o2gLWelYOwABsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_025834_693645_D7C0253E 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

Current PCIe initialization logic may leave root ports operating with
non-optimal Maximum Payload Size (MPS) settings. While downstream device
configuration is handled during bus enumeration, root port MPS values
inherited from firmware or hardware defaults might not utilize the full
capabilities supported by the controller hardware. This can result in
suboptimal data transfer efficiency across the PCIe hierarchy.

During host controller probing phase, when PCIe bus tuning is enabled,
the implementation now configures root port MPS settings to their
hardware-supported maximum values. By iterating through bridge devices
under the root bus and identifying PCIe root ports, each port's MPS is set
to 128 << pcie_mpss to match the device's maximum supported payload size.
The Max Read Request Size (MRRS) is subsequently adjusted through existing
companion logic to maintain compatibility with PCIe specifications.

Explicit initialization at host probing stage ensures consistent PCIe
topology configuration before downstream devices perform their own MPS
negotiations. This proactive approach addresses platform-specific
requirements where controller drivers depend on properly initialized root
port settings, while maintaining backward compatibility through
PCIE_BUS_TUNE_OFF conditional checks. Hardware capabilities are fully
utilized without altering existing device negotiation behaviors.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/probe.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 364fa2a514f8..3973c593fdcf 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3206,6 +3206,7 @@ EXPORT_SYMBOL_GPL(pci_create_root_bus);
 int pci_host_probe(struct pci_host_bridge *bridge)
 {
 	struct pci_bus *bus, *child;
+	struct pci_dev *dev;
 	int ret;
 
 	pci_lock_rescan_remove();
@@ -3228,6 +3229,17 @@ int pci_host_probe(struct pci_host_bridge *bridge)
 	 */
 	pci_assign_unassigned_root_bus_resources(bus);
 
+	if (pcie_bus_config != PCIE_BUS_TUNE_OFF) {
+		/* Configure root ports MPS to be MPSS by default */
+		for_each_pci_bridge(dev, bus) {
+			if (pci_pcie_type(dev) != PCI_EXP_TYPE_ROOT_PORT)
+				continue;
+
+			pcie_write_mps(dev, 128 << dev->pcie_mpss);
+			pcie_write_mrrs(dev);
+		}
+	}
+
 	list_for_each_entry(child, &bus->children, node)
 		pcie_bus_configure_settings(child);
 
-- 
2.25.1


