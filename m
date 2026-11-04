Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B496606D807
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=elEufZOm;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=yWfisoRE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GNEkLS7x3xup7k/Ojt7ZkvN366zwwDCNFWsahX9UKfI=; b=elEufZOmJeg9aH
	wdqOtKlI28YPrMtb5H7V2RO9D3abmXrDZsdKUzqusIE1k7+Pg01pkmrIIljFZh23Dueu9EBAm1Rep
	4+UWQcSz1aaGFZxQxtiyXcQ6tJ1swLUyPVJ1Zr3f2JInGb0TX/ja64Wee/bdINLiNuiVVkkvA24mG
	SinCCsTZEwP7OiIO/gCXO7qbQwalRCUbqk64SK8a2ns3BSo/abt88Fb6AWRlbFvOerRav4RjzzTkt
	rK5E+ppdfvGun78t2NY71VZNhJKDjoU6c9Oz+8E3TuZ7OSrNHHk3RtTa5RAF2qiAaT7l0uWftGFQu
	u91lELTFFXk6K5jqyJEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZME-00000005CaZ-3mCu;
	Wed, 04 Nov 2026 11:40:46 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZMC-00000005CZq-11BT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:40:45 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793792439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GNEkLS7x3xup7k/Ojt7ZkvN366zwwDCNFWsahX9UKfI=;
	b=yWfisoRENsW64pUOMDbkEuV3yPacTgGGhFKf/9z38WVNVD16MXsFRiolhs5oFqdE/x0vAL
	8GlEAtT85sRsNg2FbSLm02JsYYBSAgv3qzmpey/131p6h20seyO/y/kEiOjwCGUE1n1HRH
	HIN8KtO9OTfcYh0xBgTHl7DpjWqY7Uk=
Date: Wed, 04 Nov 2026 12:40:29 +0100
Subject: [PATCH v2 1/3] PCI/pwrctrl: Export per-device APIs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-apple-pcie-pwren-v2-1-216a4066965f@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20261104_034044_561890_3BED5D91 
X-CRM114-Status: GOOD (  13.11  )
X-Spam-Score: -2.1 (--)
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

Export the `pci_pwrctrl_power_on_device()` and
`pci_pwrctrl_power_off_device()` functions to allow PCIe host drivers
to call manage power control on a per-port basis.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 drivers/pci/pwrctrl/core.c  | 51 ++++++++++++++++++++++++++++++++++++++++-----
 include/linux/pci-pwrctrl.h |  4 ++++
 2 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
index 0e2387cf4657..b59dbedf251b 100644
--- a/drivers/pci/pwrctrl/core.c
+++ b/drivers/pci/pwrctrl/core.c
@@ -191,7 +191,16 @@ static int __pci_pwrctrl_power_off_device(struct device *dev)
 	return pwrctrl->power_off(pwrctrl);
 }
 
-static void pci_pwrctrl_power_off_device(struct device_node *np)
+/**
+ * pci_pwrctrl_power_off_device - Power off pwrctrl devices
+ *
+ * @device_node: PCI port or device to operate on
+ *
+ * Recursively traverse all pwrctrl devices for the devicetree hierarchy
+ * below the specified PCI port or device and power them off in a depth
+ * first manner.
+ */
+void pci_pwrctrl_power_off_device(struct device_node *np)
 {
 	struct platform_device *pdev;
 	int ret;
@@ -216,6 +225,7 @@ static void pci_pwrctrl_power_off_device(struct device_node *np)
 
 	platform_device_put(pdev);
 }
+EXPORT_SYMBOL_GPL(pci_pwrctrl_power_off_device);
 
 /**
  * pci_pwrctrl_power_off_devices - Power off pwrctrl devices
@@ -245,11 +255,21 @@ static int __pci_pwrctrl_power_on_device(struct device *dev)
 	return pwrctrl->power_on(pwrctrl);
 }
 
-/*
+/**
+ * pci_pwrctrl_power_on_device - Power on pwrctrl devices
+ *
+ * @device_node: PCI port or device to operate on
+ *
  * Power on the devices in a depth first manner. Before powering on the device,
  * make sure its driver is bound.
+ * Recursively traverse all pwrctrl devices for the devicetree hierarchy
+ * below the specified PCI port or device and power them on in a depth
+ * first manner.  Before powering on the device, make sure its driver is bound.
+ *
+ * Return: 0 on success, -EPROBE_DEFER if any pwrctrl driver is not bound, an
+ * appropriate error code otherwise.
  */
-static int pci_pwrctrl_power_on_device(struct device_node *np)
+int pci_pwrctrl_power_on_device(struct device_node *np)
 {
 	struct platform_device *pdev;
 	struct device_node *child;
@@ -296,6 +316,7 @@ static int pci_pwrctrl_power_on_device(struct device_node *np)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pci_pwrctrl_power_on_device);
 
 /**
  * pci_pwrctrl_power_on_devices - Power on pwrctrl devices
@@ -335,7 +356,17 @@ int pci_pwrctrl_power_on_devices(struct device *parent)
 }
 EXPORT_SYMBOL_GPL(pci_pwrctrl_power_on_devices);
 
-static int pci_pwrctrl_create_device(struct device_node *np,
+/**
+ * pci_pwrctrl_create_device - Create pwrctrl devices
+ *
+ * @device_node: PCI port or device to operate on
+ *
+ * Recursively create pwrctrl devices for the devicetree hierarchy below
+ * the specified PCI port or device in a depth first manner.
+ *
+ * Return: 0 on success, negative error number on error.
+ */
+int pci_pwrctrl_create_device(struct device_node *np,
 				     struct device *parent)
 {
 	struct platform_device *pdev;
@@ -368,6 +399,7 @@ static int pci_pwrctrl_create_device(struct device_node *np,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pci_pwrctrl_create_device);
 
 /**
  * pci_pwrctrl_create_devices - Create pwrctrl devices
@@ -396,7 +428,15 @@ int pci_pwrctrl_create_devices(struct device *parent)
 }
 EXPORT_SYMBOL_GPL(pci_pwrctrl_create_devices);
 
-static void pci_pwrctrl_destroy_device(struct device_node *np)
+/**
+ * pci_pwrctrl_destroy_device - Destroy pwrctrl devices
+ *
+ * @device_node: PCI port or device to operate on
+ *
+ * Recursively destroy pwrctrl devices for the devicetree hierarchy below
+ * the specified PCI port or device in a depth first manner.
+ */
+void pci_pwrctrl_destroy_device(struct device_node *np)
 {
 	struct platform_device *pdev;
 
@@ -415,6 +455,7 @@ static void pci_pwrctrl_destroy_device(struct device_node *np)
 
 	of_node_clear_flag(np, OF_POPULATED);
 }
+EXPORT_SYMBOL_GPL(pci_pwrctrl_destroy_device);
 
 /**
  * pci_pwrctrl_destroy_devices - Destroy pwrctrl devices
diff --git a/include/linux/pci-pwrctrl.h b/include/linux/pci-pwrctrl.h
index 1192a2527521..f27be6489b50 100644
--- a/include/linux/pci-pwrctrl.h
+++ b/include/linux/pci-pwrctrl.h
@@ -59,6 +59,10 @@ int pci_pwrctrl_create_devices(struct device *parent);
 void pci_pwrctrl_destroy_devices(struct device *parent);
 int pci_pwrctrl_power_on_devices(struct device *parent);
 void pci_pwrctrl_power_off_devices(struct device *parent);
+int pci_pwrctrl_create_device(struct device_node *np, struct device *parent);
+void pci_pwrctrl_destroy_device(struct device_node *np);
+int pci_pwrctrl_power_on_device(struct device_node *np);
+void pci_pwrctrl_power_off_device(struct device_node *np);
 #else
 static inline int pci_pwrctrl_create_devices(struct device *parent) { return 0; }
 static void pci_pwrctrl_destroy_devices(struct device *parent) { }

-- 
2.56.0


