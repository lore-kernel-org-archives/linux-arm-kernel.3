Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4497AC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 07:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCXJnaWqE0fAgUs100fVOe2mb9c5kJtvlpY1ACqYb3k=; b=J0h5DY6J2H1XrkomTI7WADm6wW
	b8QfoD2JEZmBQ8FuuMaBju/LMS3QmsjmikjpkcPYFvzphwhYy1avqsYeV/rj8kGIalgxs5d6p43sA
	DLCkoKWt9O1VbWw5zGOpx4VD0wRQkSPME0BuIpiE9A+kEZXA4ne0dOsee4lGVEM1YCyrmCYhKX8G8
	1NZfBylzVAYl+08+2R/dlqat1sxO2aoLBwfb7PTSGLdj7IZ9JmiyNosMACl7g4JN5uTaNj/nw9von
	TBEdz9brZS3Rnc0fMmrV7nsqU7jtMvtYYIgLxAGvhD5vs8fm2I08RsY6LOYOL5WaUNsx1SJTX+tyV
	gQPaZg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvci-0000000HaQG-25Fx;
	Thu, 08 May 2025 07:24:52 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvOx-0000000HYF2-3IFP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 07:10:42 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a0b637db6eso360485f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 00:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746688238; x=1747293038; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZCXJnaWqE0fAgUs100fVOe2mb9c5kJtvlpY1ACqYb3k=;
        b=CZlVNR359gRAYiyh/lihS5bdFTdWtsp1NgXmAec/j6As5GjhO/HCj6Ed31cO8Fl7BQ
         giMOGjMLxmCjiyLzc304Gmj9EbRzOkB/fPWgLWCLFQRiFC4goIYHD3Z6gs2PU9kfdXvJ
         GHGsZ1iB5XRRh5Qhx6lBKSlQtH+rWrIKGp8zQc973rwnpbEZL7zYE3frcY2r/WussYET
         ZMFYuczSuU6cUkSDz8BhkSNQ/z5TheNMnQoPkAkc7JEJZ67mHaACLK6sOukGbDe3foM+
         NdIjDpyBx4+cPcqDShityZdvR1paE/kiHD751dqN3i7G9S+nNe5/Arzsi3N0gwfd8XEi
         EHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688238; x=1747293038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCXJnaWqE0fAgUs100fVOe2mb9c5kJtvlpY1ACqYb3k=;
        b=E9T9VlbKcBS36Zc8ZvlY0AefhOLua0HzWzL1QZiz/Ias7fHWRF64YP+DsJWI11ptNA
         GNpeEHUHTZEuR6KuhZyo46t0DqqiJJQ/jwbVWmIfkGV68R/nTvsj4QS0Cinei4VsfDPT
         3SfY8YFDcAoFE0Yu5134+eWebMVUBn9YrNsVLF2UXguQEcN7DzdYq7cxI/2C/CfXZImz
         uYSxORpKzi5DDPEmvptjhcZBg7lFt9mLQy4uvcndGXB1KU+2Mn8piaRPm3SsnjmnCAK+
         V0CRms7OQ/QPsQkD/j6CjLnT3YpP8qu9JZHNfmwWbe9ik5TyhGvrGgy5ff6Tk9hS/Sao
         hKXg==
X-Forwarded-Encrypted: i=1; AJvYcCUAFJWYg3fq6dH7QNflx9iwyQofN2TkVquHvX68cAtYxrpmrlJG00OQ7X/6zyUgZ34YdzAA9Fch507tSxl0BxYZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzRoFPiw+EbTEaJy7lVLXKiy+NJd8Kj/fnP3UhhAZM9RxG9P2t/
	C9nTDsL7Yy9NJsatdFJgYhmplqj+dS6YLPVr4RA5mbHhklg9ZcSda5OIq9yigQ==
X-Gm-Gg: ASbGncux2NDh6N+rzZDRZi8SdM2Kc6gOR8Cv/PDHuLnBSLOz/gs/AUhDqbRCKFzejdx
	TTuDfayEJpBW/NAe71v+x7msS4lCO5iLsW++WrK8WpHDbMkiCHyOepLpMAI64uvijJJ74w+mTpT
	vEIe51v2pJSObdHGxx0QyKo6bSpvQfr60oUPOExW3lIs/G9cluo+XUdhFsWBveFlYAW71oE/bTJ
	HKYA+n5lVJE35+C1KOYdXxSoGmQTiyO7veWfNWLLQLw/LQ+0VcxxjDgm0U7bNxTYJFao7HwoIKQ
	aNNrrqQoCfpgtYH96lpxBkq0PYkQ8/Oh6UpJpNzNwyi5UEWcKwo9Pa7pq5CrS6g7qy+Lh/L4y+D
	GgH7aEXrJILX9E8Vo8xcLAlYDhV4=
X-Google-Smtp-Source: AGHT+IHV1JSfv4qBQwupY4Va2+Wb9i9D07szr7SibcAfJ9Za0IJyccsIDSZGMhPonRwpb8x04FLbNA==
X-Received: by 2002:a5d:5988:0:b0:39e:e557:7d9 with SMTP id ffacd0b85a97d-3a0b49e9fa9mr4148948f8f.5.1746688238305;
        Thu, 08 May 2025 00:10:38 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm19500236f8f.97.2025.05.08.00.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:10:37 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 08 May 2025 12:40:32 +0530
Subject: [PATCH v4 3/5] PCI: host-common: Make the driver as a common
 library for host controller drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-pcie-reset-slot-v4-3-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
In-Reply-To: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
 Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7440;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=9YTGSyyEjJBWzKcv9X508Ju9+VcoznZB2wd8RCZhBIA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoHFjp1kFqMhXSTF/eBh/n6fZtF2vM5B0B0c5Ul
 nv49HMJlUuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBxY6QAKCRBVnxHm/pHO
 9du0B/sGQkAQ1jOTMZmz5FNWat7V9HdLSW4K3BY3FD4mEBtb8jIpZDNiJTYBb085icKcXYPQ31M
 FICFZzr47/EPEyJr5oHdHiHCT8+qdsDKMOpTy2RdIU+iNDY9GUhOtVFVMU28cHFcQsNAtOKy2kx
 6Qf1JpijCSxiu+KVABIWBz/rhP8pvPTX2kP+U22LEeMkDtoPjU0HsKK9f3VWPQbHlWZlbO8zQtn
 G889qzgpaWL0nyW20O6LrdnY/6FAo53jRjxSzQvt9/ufEIqUyTj51abVn0y2cNfYfLC+v1SLdW7
 HtCcl1pwMCMjjs3Q5IGertLvu1r/cz+TfDDhWWGVtWqkYZCl
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_001039_837425_3A66E480 
X-CRM114-Status: GOOD (  18.30  )
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

This common library will be used as a placeholder for helper functions
shared by the host controller drivers. This avoids placing the host
controller drivers specific helpers in drivers/pci/*.c, to avoid enlarging
the kernel Image on platforms that do not use host controller drivers at
all (like x86/ACPI platforms).

Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/Kconfig                    |  8 ++++----
 drivers/pci/controller/dwc/pcie-hisi.c            |  1 +
 drivers/pci/controller/pci-host-common.c          |  6 ++++--
 drivers/pci/controller/pci-host-common.h          | 16 ++++++++++++++++
 drivers/pci/controller/pci-host-generic.c         |  2 ++
 drivers/pci/controller/pci-thunder-ecam.c         |  2 ++
 drivers/pci/controller/pci-thunder-pem.c          |  1 +
 drivers/pci/controller/pcie-apple.c               |  2 ++
 drivers/pci/controller/plda/pcie-microchip-host.c |  1 +
 include/linux/pci-ecam.h                          |  6 ------
 10 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 9800b768105402d6dd1ba4b134c2ec23da6e4201..9bb8bf669a807272777b6168d042f8fd7490aeec 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -3,6 +3,10 @@
 menu "PCI controller drivers"
 	depends on PCI
 
+config PCI_HOST_COMMON
+	tristate
+	select PCI_ECAM
+
 config PCI_AARDVARK
 	tristate "Aardvark PCIe controller"
 	depends on (ARCH_MVEBU && ARM64) || COMPILE_TEST
@@ -119,10 +123,6 @@ config PCI_FTPCI100
 	depends on OF
 	default ARCH_GEMINI
 
-config PCI_HOST_COMMON
-	tristate
-	select PCI_ECAM
-
 config PCI_HOST_GENERIC
 	tristate "Generic PCI host controller"
 	depends on OF
diff --git a/drivers/pci/controller/dwc/pcie-hisi.c b/drivers/pci/controller/dwc/pcie-hisi.c
index 8904b5b85ee589576afcb6c81bb4bd39ff960c15..3c17897e56fcb60ec08cf522ee1485f90a2f36a3 100644
--- a/drivers/pci/controller/dwc/pcie-hisi.c
+++ b/drivers/pci/controller/dwc/pcie-hisi.c
@@ -15,6 +15,7 @@
 #include <linux/pci-acpi.h>
 #include <linux/pci-ecam.h>
 #include "../../pci.h"
+#include "../pci-host-common.h"
 
 #if defined(CONFIG_PCI_HISI) || (defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS))
 
diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index f441bfd6f96a8bde1c07fcf97d43d0693c424a27..f93bc7034e697250711833a5151f7ef177cd62a0 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Generic PCI host driver common code
+ * Common library for PCI host controller drivers
  *
  * Copyright (C) 2014 ARM Limited
  *
@@ -15,6 +15,8 @@
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 
+#include "pci-host-common.h"
+
 static void gen_pci_unmap_cfg(void *ptr)
 {
 	pci_ecam_free((struct pci_config_window *)ptr);
@@ -94,5 +96,5 @@ void pci_host_common_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_host_common_remove);
 
-MODULE_DESCRIPTION("Generic PCI host common driver");
+MODULE_DESCRIPTION("Common library for PCI host controller drivers");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
new file mode 100644
index 0000000000000000000000000000000000000000..d8be024ca68d43afb147fd9104d632b907277144
--- /dev/null
+++ b/drivers/pci/controller/pci-host-common.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Common library for PCI host controller drivers
+ *
+ * Copyright (C) 2014 ARM Limited
+ *
+ * Author: Will Deacon <will.deacon@arm.com>
+ */
+
+#ifndef _PCI_HOST_COMMON_H
+#define _PCI_HOST_COMMON_H
+
+int pci_host_common_probe(struct platform_device *pdev);
+void pci_host_common_remove(struct platform_device *pdev);
+
+#endif
diff --git a/drivers/pci/controller/pci-host-generic.c b/drivers/pci/controller/pci-host-generic.c
index 4051b9b61dace669422e5a6453cc9f58a081beb5..c1bc0d34348f44c9fdd549811f637fb50fe89c64 100644
--- a/drivers/pci/controller/pci-host-generic.c
+++ b/drivers/pci/controller/pci-host-generic.c
@@ -14,6 +14,8 @@
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 
+#include "pci-host-common.h"
+
 static const struct pci_ecam_ops gen_pci_cfg_cam_bus_ops = {
 	.bus_shift	= 16,
 	.pci_ops	= {
diff --git a/drivers/pci/controller/pci-thunder-ecam.c b/drivers/pci/controller/pci-thunder-ecam.c
index 08161065a89c35a95714df935ef437dfc8845697..b5b4a958e6a22b21501cad45bb242a95a784efc1 100644
--- a/drivers/pci/controller/pci-thunder-ecam.c
+++ b/drivers/pci/controller/pci-thunder-ecam.c
@@ -11,6 +11,8 @@
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 
+#include "pci-host-common.h"
+
 #if defined(CONFIG_PCI_HOST_THUNDER_ECAM) || (defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS))
 
 static void set_val(u32 v, int where, int size, u32 *val)
diff --git a/drivers/pci/controller/pci-thunder-pem.c b/drivers/pci/controller/pci-thunder-pem.c
index f1bd5de67997cddac173723bc7f4ec20aaf20064..5fa037fb61dc356f3029d1b5cae632ae1da5bb9b 100644
--- a/drivers/pci/controller/pci-thunder-pem.c
+++ b/drivers/pci/controller/pci-thunder-pem.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include "../pci.h"
+#include "pci-host-common.h"
 
 #if defined(CONFIG_PCI_HOST_THUNDER_PEM) || (defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS))
 
diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 18e11b9a7f46479348815c3f706319189e0a80b5..edd4c8c683c6a693401b47f5f056641c13ae89f8 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -29,6 +29,8 @@
 #include <linux/of_irq.h>
 #include <linux/pci-ecam.h>
 
+#include "pci-host-common.h"
+
 #define CORE_RC_PHYIF_CTL		0x00024
 #define   CORE_RC_PHYIF_CTL_RUN		BIT(0)
 #define CORE_RC_PHYIF_STAT		0x00028
diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
index 3fdfffdf027001bf88df8e1c2538587298228220..24bbf93b8051fa0d9027ce6983eae34cad81065e 100644
--- a/drivers/pci/controller/plda/pcie-microchip-host.c
+++ b/drivers/pci/controller/plda/pcie-microchip-host.c
@@ -23,6 +23,7 @@
 #include <linux/wordpart.h>
 
 #include "../../pci.h"
+#include "../pci-host-common.h"
 #include "pcie-plda.h"
 
 #define MC_MAX_NUM_INBOUND_WINDOWS		8
diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
index 3a10f8cfc3ad5c90585a8fc971be714011ed18fe..d930651473b4d0b406e657a24ede87e09517d091 100644
--- a/include/linux/pci-ecam.h
+++ b/include/linux/pci-ecam.h
@@ -93,10 +93,4 @@ extern const struct pci_ecam_ops al_pcie_ops;	/* Amazon Annapurna Labs PCIe */
 extern const struct pci_ecam_ops tegra194_pcie_ops; /* Tegra194 PCIe */
 extern const struct pci_ecam_ops loongson_pci_ecam_ops; /* Loongson PCIe */
 #endif
-
-#if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
-/* for DT-based PCI controllers that support ECAM */
-int pci_host_common_probe(struct platform_device *pdev);
-void pci_host_common_remove(struct platform_device *pdev);
-#endif
 #endif

-- 
2.43.0


