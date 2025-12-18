Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E73D6E2DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 19:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zx79JY8qDg1xmaSwg2kQCiQZA4ov318HoPLNBWo/G6k=; b=cRIJw65rh0G1grP22hZQb+f4F/
	jmQxRL3Kg462rGG3CXQEgTp5kyKp/uMVxoTH1qDrRJ+XOPV8gn7TEJ5ESCJgSDFsbP/XoEJrLzxki
	OV3lsnE1rDCZHVbvk8i6BO5uF2VqYNu6CUcxcWRQE82IEyngOuHYOC9Cf9bjpJFihuql5XccL8Qyt
	F2dVxUkZN/ZOneizDDQUlmeT5X0BnWpDkckYH3/TCCSYWJvltC6SQARzwhqwzN1q5ZF/AZVv3frRz
	g16XKV4brK8CqcjrMJ9/NqUA3ClbLQkPi1HP1XFUCvcRJEvQBMWx9tXAFSP/oTWiIBe8DCV7EUKFA
	+BR6fjhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJKq-000000092rB-2Pac;
	Thu, 18 Dec 2025 19:06:48 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJKl-000000092lj-3KxJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 19:06:45 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so139083466b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 11:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766084802; x=1766689602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zx79JY8qDg1xmaSwg2kQCiQZA4ov318HoPLNBWo/G6k=;
        b=TF5aPkbRovhvEYLinogkgejN9vMeuwa9R7AEiNdG9G9mOnDSkkU9Y1wKmKWaoMEqhD
         1VHE57CmqB6q2r4S0iCnDEgrNIYUA1AX5nlRUDRcwl3ud5+cgHkVMeNDPm93cyc+/IsZ
         J4wFbHa2WCZWIwFrx8vKeHj0BDnK5P0vF+9DkAx2RxvBKV5Iq+zz5OCzzryfNWRkqoqg
         zKFOu+88Y5DD2SGTCp7wd13h6guoo3r/ruDsPmVgCfBmn4FN2O2R9FIlA1wZ0tsc/Gnx
         TVqAtn2m6iCEg3Ry4gkpxELyF6cLqfCrP2rvkvDYc6KAlJTBnzMCXg4BrK8/xaniYdvs
         JNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766084802; x=1766689602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zx79JY8qDg1xmaSwg2kQCiQZA4ov318HoPLNBWo/G6k=;
        b=md84fbDqscdwo11aNqn1c9Ja+ZE9Bjxb/Jtfs3xbraPCIROk0NFHn44IR2ZEhOF8lF
         w0lLrUWy7UFDF6zgWOydqX5ae6ydAe7A5bLqEkZc2c/nXJemg7mBtBsRFT2Xc8x92Nrw
         jAwLI+kzHfKzUmzXHic3pwKjLhJOKKyLHPtzFBF7U4FMAerSXlc2T9KnnZTbPDpWCNHN
         eamUDOJYvlhQAlY/HIAWkkNfeT7eZhR0vpWIjYo5Dk0jqCwsKnkMxXBwcynOw5/i7tKW
         lJkzQJiUh5MzcAmDwLxIEmfi8Ohf9VddoJa1NcCXl0/eqbBpORk8SFY4VTYDDMTvO+ie
         CnQw==
X-Forwarded-Encrypted: i=1; AJvYcCUJJeMx8yZr4AHTdqEH/iLiZ/GGm4muFkAl1IkWlXwHrzAWkGZUpqNVNWJbk9ZOqhYjFszny5glp1PR4KCFgZSG@lists.infradead.org
X-Gm-Message-State: AOJu0YzVDxbSk6m/LhO77XSlAuV/1Bk8fx8luD1vFQPE71hGgFssOZ5X
	S4s8oREGK9Ug1z0wqGrVV7s+jHAFpPX7GLG6KnRLsFIUHvGWGgBkJAThtQlIP4SUzIA=
X-Gm-Gg: AY/fxX7BJ+wqQO2l+OZyelEb8O51S9OTzEJvNbWdpaCpCsKAOq2SKFJGG/245Em6Rn+
	P1MscbXlAV//K3QbDkdYelLNP0Uht1hu1imQuTcT7uzTZX9HU8fOR01XANeRwM55njRTJ1t65W/
	+TJRtipN6VNdjDXV/+evGHoLgmuQ56/NqpqdG3cQkpmbLOj4RB+H550exd+Ah2Yyino3Pc/z01o
	B2BYLK2xayuTSMZ944PHJ5S2yRJzVsReBIrpDhMocNSmFIxcYTYsyPHpE6eB2LGE0uauOZcM02+
	AI/7ZMR5tk4LsOjxzb6rSkEiZ/xAe+aapxPDgzFjJayOue7NXKS00ejCmg0KgbKwJYdWxyHt697
	RTtPzISOK5OQeZ7OFtJFrl161i4FQvArBuui5oXI2wLjeDK1rFF4bfqQXWwMgPbCbzhDEN7X3eO
	ZcVw/VQLwfJWAYuW8dLsW1GRH18FIg5CzY3mYo4ohHIUJzrebz80v3fg==
X-Google-Smtp-Source: AGHT+IGz/hwriZCabz4pyg0PAJ/ezKOQ6S+SFGdp1KobFV5gJSyL5vIdIRhrdzKTifgKNcjBLVlatg==
X-Received: by 2002:a17:907:72c1:b0:b80:1d4b:bddc with SMTP id a640c23a62f3a-b803694fe6cmr39099266b.0.1766084801609;
        Thu, 18 Dec 2025 11:06:41 -0800 (PST)
Received: from localhost (host-79-37-15-246.retail.telecomitalia.it. [79.37.15.246])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494b94sm155859a12.22.2025.12.18.11.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 11:06:41 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH 2/4] misc: rp1: drop overlay support
Date: Thu, 18 Dec 2025 20:09:07 +0100
Message-ID: <4b0aa7160877cf128b9bc713776bcac73c46eb24.1766077285.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1766077285.git.andrea.porta@suse.com>
References: <cover.1766077285.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_110643_877713_6D20F623 
X-CRM114-Status: GOOD (  24.77  )
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

The RP1 driver can load an overlay at runtime to describe the inner
peripherals. This has led to a lot of confusion regarding the naming
of nodes, their topology and the reclaiming of related node resources.

Since the overlay is currently not fully functional, drop its support
in the driver in favor of the fully described static DT.

This also means that this driver does not depend on CONFIG_PCI_DYNAMIC_OF_NODES
and no longer requires PCI quirks to dynamically create the intermediate
PCI nodes.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/misc/rp1/Kconfig      |  6 +-----
 drivers/misc/rp1/Makefile     |  3 +--
 drivers/misc/rp1/rp1-pci.dtso | 25 -----------------------
 drivers/misc/rp1/rp1_pci.c    | 37 ++++-------------------------------
 drivers/pci/quirks.c          |  1 -
 5 files changed, 6 insertions(+), 66 deletions(-)
 delete mode 100644 drivers/misc/rp1/rp1-pci.dtso

diff --git a/drivers/misc/rp1/Kconfig b/drivers/misc/rp1/Kconfig
index 5232e70d3079b..2c13b3968b011 100644
--- a/drivers/misc/rp1/Kconfig
+++ b/drivers/misc/rp1/Kconfig
@@ -5,8 +5,7 @@
 
 config MISC_RP1
 	tristate "RaspberryPi RP1 misc device"
-	depends on OF_IRQ && OF_OVERLAY && PCI_MSI && PCI_QUIRKS
-	select PCI_DYNAMIC_OF_NODES
+	depends on OF_IRQ && PCI_MSI
 	help
 	  Support the RP1 peripheral chip found on Raspberry Pi 5 board.
 
@@ -15,6 +14,3 @@ config MISC_RP1
 
 	  The driver is responsible for enabling the DT node once the PCIe
 	  endpoint has been configured, and handling interrupts.
-
-	  This driver uses an overlay to load other drivers to support for
-	  RP1 internal sub-devices.
diff --git a/drivers/misc/rp1/Makefile b/drivers/misc/rp1/Makefile
index 508b4cb056277..ab32b433d7ede 100644
--- a/drivers/misc/rp1/Makefile
+++ b/drivers/misc/rp1/Makefile
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_MISC_RP1)		+= rp1-pci.o
-rp1-pci-objs			:= rp1_pci.o rp1-pci.dtbo.o
+obj-$(CONFIG_MISC_RP1)		+= rp1_pci.o
diff --git a/drivers/misc/rp1/rp1-pci.dtso b/drivers/misc/rp1/rp1-pci.dtso
deleted file mode 100644
index eea826b36e029..0000000000000
--- a/drivers/misc/rp1/rp1-pci.dtso
+++ /dev/null
@@ -1,25 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-
-/*
- * The dts overlay is included from the dts directory so
- * it can be possible to check it with CHECK_DTBS while
- * also compile it from the driver source directory.
- */
-
-/dts-v1/;
-/plugin/;
-
-/ {
-	fragment@0 {
-		target-path="";
-		__overlay__ {
-			compatible = "pci1de4,1";
-			#address-cells = <3>;
-			#size-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-
-			#include "arm64/broadcom/rp1-common.dtsi"
-		};
-	};
-};
diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
index a342bcc6164bb..d210da84c30a2 100644
--- a/drivers/misc/rp1/rp1_pci.c
+++ b/drivers/misc/rp1/rp1_pci.c
@@ -34,16 +34,11 @@
 /* Interrupts */
 #define RP1_INT_END		61
 
-/* Embedded dtbo symbols created by cmd_wrap_S_dtb in scripts/Makefile.lib */
-extern char __dtbo_rp1_pci_begin[];
-extern char __dtbo_rp1_pci_end[];
-
 struct rp1_dev {
 	struct pci_dev *pdev;
 	struct irq_domain *domain;
 	struct irq_data *pcie_irqds[64];
 	void __iomem *bar1;
-	int ovcs_id;	/* overlay changeset id */
 	bool level_triggered_irq[RP1_INT_END];
 };
 
@@ -184,24 +179,13 @@ static void rp1_unregister_interrupts(struct pci_dev *pdev)
 
 static int rp1_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
-	u32 dtbo_size = __dtbo_rp1_pci_end - __dtbo_rp1_pci_begin;
-	void *dtbo_start = __dtbo_rp1_pci_begin;
 	struct device *dev = &pdev->dev;
 	struct device_node *rp1_node;
-	bool skip_ovl = true;
 	struct rp1_dev *rp1;
 	int err = 0;
 	int i;
 
-	/*
-	 * Either use rp1_nexus node if already present in DT, or
-	 * set a flag to load it from overlay at runtime
-	 */
-	rp1_node = of_find_node_by_name(NULL, "rp1_nexus");
-	if (!rp1_node) {
-		rp1_node = dev_of_node(dev);
-		skip_ovl = false;
-	}
+	rp1_node = dev_of_node(dev);
 
 	if (!rp1_node) {
 		dev_err(dev, "Missing of_node for device\n");
@@ -276,42 +260,29 @@ static int rp1_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 						 rp1_chained_handle_irq, rp1);
 	}
 
-	if (!skip_ovl) {
-		err = of_overlay_fdt_apply(dtbo_start, dtbo_size, &rp1->ovcs_id,
-					   rp1_node);
-		if (err)
-			goto err_unregister_interrupts;
-	}
-
 	err = of_platform_default_populate(rp1_node, NULL, dev);
 	if (err) {
 		dev_err_probe(&pdev->dev, err, "Error populating devicetree\n");
-		goto err_unload_overlay;
+		goto err_unregister_interrupts;
 	}
 
-	if (skip_ovl)
-		of_node_put(rp1_node);
+	of_node_put(rp1_node);
 
 	return 0;
 
-err_unload_overlay:
-	of_overlay_remove(&rp1->ovcs_id);
 err_unregister_interrupts:
 	rp1_unregister_interrupts(pdev);
 err_put_node:
-	if (skip_ovl)
-		of_node_put(rp1_node);
+	of_node_put(rp1_node);
 
 	return err;
 }
 
 static void rp1_remove(struct pci_dev *pdev)
 {
-	struct rp1_dev *rp1 = pci_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
 	of_platform_depopulate(dev);
-	of_overlay_remove(&rp1->ovcs_id);
 	rp1_unregister_interrupts(pdev);
 }
 
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index b9c252aa6fe08..280cd50d693bd 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -6308,7 +6308,6 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5020, of_pci_make_dev_node);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5021, of_pci_make_dev_node);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_REDHAT, 0x0005, of_pci_make_dev_node);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_EFAR, 0x9660, of_pci_make_dev_node);
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_RPI, PCI_DEVICE_ID_RPI_RP1_C0, of_pci_make_dev_node);
 
 /*
  * Devices known to require a longer delay before first config space access
-- 
2.35.3


