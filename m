Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B510C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nbnxr9RdLiFib7I0vJZMKCwm0eNPZ+LzHoaH168kko8=; b=YX6Z2F3EsV0P6I/61nmtc4hUr3
	lS6SGYP7cpsaNQwGlmBMfhAY3NCvKxrM/L5nRKHDLytZ5MNc+PKBfImaZO4/4jNneN4E1h+McE7ay
	1gWb/A5Crcam3QPz8twTOQuGcRTyJSQpGMI53h8/Q6MUbd6+aCYQ4YvPi/PipLVyc2or1ftiPxBhj
	JrZUDUHEhpaYHZFrbWUHWwolU1vbaN8LgVfFmnMFV4ZoAX8M+Rhezvp7Kb0WX1v8OL2cGkHSp0pB8
	nMfQq5yoi1B/CSXODpEs1ZDCmoZRNERAjuZ+ZhZ/35WiHq8thKZXPa5SesgPFJA/O55GckP/3YDiK
	ZuyBMuQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzY8j-00000002Vk1-272t;
	Tue, 01 Apr 2025 09:42:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXkY-00000002RdE-322Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:17:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2BE67A444EB;
	Tue,  1 Apr 2025 09:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986F8C4CEE8;
	Tue,  1 Apr 2025 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743499057;
	bh=JW2TE2r1cR57wQLKrvwB6bcnrT+ZGj91um79e0rab+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ptrUq3FGh1gzE3+DgT/l0b1lGlkd4t8knX/DzHIu60hktWMOjgwDh+S4YzHzoNd5T
	 MFatOxLFJ4FR4CGuq+hm6K/0cvoO2sgzeju87bOGWCp++NnQgenU2VUB3wjebgtoRk
	 8Zwfr4iON7Js3Yw61JIefUOG8sFYMIsJ3To0AOFmS9AtQHe4mj/2tDNArolEBJL/n3
	 Klk1AkLp87Hs31oWrCm+fDQ7Fi5SPSiWWhQzHt300wG8UexHhSwPGbls/hsvveCA7n
	 mbsmfK6TBHbXIBz49MK1dTQjRNNslCxtldhKHLpHGusiiVs3df4prWDGvO8uNjcD5n
	 HX0zcJdAMBEsw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tzXkV-001GqU-FG;
	Tue, 01 Apr 2025 10:17:35 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: [PATCH v3 03/13] PCI: host-generic: Extract an ecam bridge creation helper from pci_host_common_probe()
Date: Tue,  1 Apr 2025 10:17:03 +0100
Message-Id: <20250401091713.2765724-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250401091713.2765724-1-maz@kernel.org>
References: <20250401091713.2765724-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org, mark.kettenis@xs4all.nl
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_021738_894432_A19C846E 
X-CRM114-Status: GOOD (  21.42  )
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

pci_host_common_probe() is an extremely userful helper, as it
abstracts away most of the gunk that a "mostly-ECAM-compliant"
device driver needs.

However, it is structured as a probe function, meaning that a lot
of the driver-specific setup has to happen in a .init() callback,
after the bridge and config space have been instantiated.

This is a bit awkward, and results in a number of convolutions
that could be avoided if the host-common code was more like
a library.

Introduce a pci_host_common_init() helper that does exactly that,
taking the platform device and a struct pci_ecam_op as parameters.

This can then be called from the probe routine, and a lot of the
code that isn't relevant to PCI setup moved away from the .init()
callback. This also removes the dependency on the device match
data, which is an oddity.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-host-common.c | 24 ++++++++++++++++--------
 include/linux/pci-ecam.h                 |  2 ++
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index f441bfd6f96a8..466a1e6a7ffcd 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -49,23 +49,17 @@ static struct pci_config_window *gen_pci_init(struct device *dev,
 	return cfg;
 }
 
-int pci_host_common_probe(struct platform_device *pdev)
+int pci_host_common_init(struct platform_device *pdev,
+			 const struct pci_ecam_ops *ops)
 {
 	struct device *dev = &pdev->dev;
 	struct pci_host_bridge *bridge;
 	struct pci_config_window *cfg;
-	const struct pci_ecam_ops *ops;
-
-	ops = of_device_get_match_data(&pdev->dev);
-	if (!ops)
-		return -ENODEV;
 
 	bridge = devm_pci_alloc_host_bridge(dev, 0);
 	if (!bridge)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, bridge);
-
 	of_pci_check_probe_only();
 
 	/* Parse and map our Configuration Space windows */
@@ -73,6 +67,8 @@ int pci_host_common_probe(struct platform_device *pdev)
 	if (IS_ERR(cfg))
 		return PTR_ERR(cfg);
 
+	platform_set_drvdata(pdev, bridge);
+
 	bridge->sysdata = cfg;
 	bridge->ops = (struct pci_ops *)&ops->pci_ops;
 	bridge->enable_device = ops->enable_device;
@@ -81,6 +77,18 @@ int pci_host_common_probe(struct platform_device *pdev)
 
 	return pci_host_probe(bridge);
 }
+EXPORT_SYMBOL_GPL(pci_host_common_init);
+
+int pci_host_common_probe(struct platform_device *pdev)
+{
+	const struct pci_ecam_ops *ops;
+
+	ops = of_device_get_match_data(&pdev->dev);
+	if (!ops)
+		return -ENODEV;
+
+	return pci_host_common_init(pdev, ops);
+}
 EXPORT_SYMBOL_GPL(pci_host_common_probe);
 
 void pci_host_common_remove(struct platform_device *pdev)
diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
index 3a10f8cfc3ad5..bc2ca2c72ee23 100644
--- a/include/linux/pci-ecam.h
+++ b/include/linux/pci-ecam.h
@@ -97,6 +97,8 @@ extern const struct pci_ecam_ops loongson_pci_ecam_ops; /* Loongson PCIe */
 #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
 /* for DT-based PCI controllers that support ECAM */
 int pci_host_common_probe(struct platform_device *pdev);
+int pci_host_common_init(struct platform_device *pdev,
+			 const struct pci_ecam_ops *ops);
 void pci_host_common_remove(struct platform_device *pdev);
 #endif
 #endif
-- 
2.39.2


