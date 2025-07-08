Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13FDC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2WSxz+JMtsXBJVo1fTfILuMem/98S1AIbIxNay4E1s=; b=i57u8+BEAzXzjbjitJwdnvkoqa
	JICU5a7OTDk+HJjT4SY4kWKWWVeECU8+pQBqqwOpknCYdsseM/9e1JYT3b2vW4qI+Zj5vFbOWUjzZ
	8zBJA6l8PyQslAmYtqryKnv9XaEQLdcCXupAgYH3PBIQ0lC2+x/JqIXSZKV025+vWkttF0++tmi/F
	M9Q6iS8p4s6E+BKm7WblGBssaDUipEisUfZugyq3y4GlgdaUJr7fpM/uIDQmeTcIHlzkM9aIvJHQX
	mCwhU4g/Hj1sEmAHEDA6NIFqKLl1aZKdHCyC67406G22MF0DBLYWgDRFHg4bzLmMTW/h8M3WoUJa6
	jqOzX4vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEA4-00000006Md0-1BRZ;
	Tue, 08 Jul 2025 19:39:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCq-000000067mj-1oGj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:34:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DC8A46784;
	Tue,  8 Jul 2025 17:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150EBC4CEFD;
	Tue,  8 Jul 2025 17:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996051;
	bh=9TTQFkyY0M8aTj6Iv8cpYI5ilm3sw2M2ZI3G1K0Exkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iqsZbG6u6KjiRwauw+wclsVudQEywuNtzdpxpn9C7bV2B/q34vHG1nRvzKPrOf7CO
	 tOPDOmb0riqbgd1/sb0Qcuko+/844q1IXjDGb5xKRW25oqg1XpLTNXM7M3SAXv/0lD
	 ZbMwN64WXLItvlpolw3jhC+rPTi+LFJWdqns9ftjFrCWk1scsd81YbWVvAxPvhw6J9
	 c/VSdHAukMex41O+ZBO545kPBfkxNddAQJdIGrMQMZrZ7Y73+CfLOCoZFy+UvJHyYn
	 EdvpxrE85zkkyb3TAXTXTYwcmSdjX4KlITmtZJ7vG1H7YU+ZGG4GMI1sjQ71Dx7qmO
	 PsGhljKqrlMrg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uZCCn-00Dqhw-0H;
	Tue, 08 Jul 2025 18:34:09 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 02/13] PCI: xgene: Defer probing if the MSI widget driver hasn't probed yet
Date: Tue,  8 Jul 2025 18:33:53 +0100
Message-Id: <20250708173404.1278635-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250708173404.1278635-1-maz@kernel.org>
References: <20250708173404.1278635-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_103412_514449_A0F3967D 
X-CRM114-Status: GOOD (  15.54  )
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

As a preparatory work to make the XGene MSI driver probe less of
a sorry hack, make the PCI driver check for the availability of
the MSI parent domain, and defer the probing otherwise.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-xgene.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index 1e2ebbfa36d19..f26cb58f814ec 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -12,6 +12,7 @@
 #include <linux/jiffies.h>
 #include <linux/memblock.h>
 #include <linux/init.h>
+#include <linux/irqdomain.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
@@ -594,6 +595,24 @@ static struct pci_ops xgene_pcie_ops = {
 	.write = pci_generic_config_write32,
 };
 
+static bool xgene_check_pcie_msi_ready(void)
+{
+	struct device_node *np;
+	struct irq_domain *d;
+
+	if (!IS_ENABLED(CONFIG_PCI_XGENE_MSI))
+		return true;
+
+	np = of_find_compatible_node(NULL, NULL, "apm,xgene1-msi");
+	if (!np)
+		return true;
+
+	d = irq_find_matching_host(np, DOMAIN_BUS_PCI_MSI);
+	of_node_put(np);
+
+	return d && irq_domain_is_msi_parent(d);
+}
+
 static int xgene_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -602,6 +621,10 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 	struct pci_host_bridge *bridge;
 	int ret;
 
+	if (!xgene_check_pcie_msi_ready())
+		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+				     "MSI driver not ready\n");
+
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*port));
 	if (!bridge)
 		return -ENOMEM;
-- 
2.39.2


