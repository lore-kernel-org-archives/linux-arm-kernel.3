Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62D3C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 01:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7t3rulmgzdudnQm0VJU/fmU5yA2DaWNz98HbbPrWp/M=; b=Wiu0BS/Xvl5bpULaqej5SV3ovL
	RO+fwFkmdRNCkMegmrvPP60gOHgiQK1rNRFnA3PMbQKl5Fv3dKUwpkpG3u9R76z3SdWF5mfyjLbDU
	f0MsdwGIGEkk0gCBsKYLpWvcGLsCKhSz3Ro19exMpEoZhZkwKfWQE9bygZZ+TUkOfbOMPUT4OumrI
	EBFKOuKDnuNb26KDqaZVC/7LwGA9EY4iYqVKZMym9ga2LOK+UI76Tu9sv/67+4hNnLRObp74A1Xsv
	n9RgX8seg3ge8A6Bgq7ZY4y6BruhqN8qniAxqiI4R15VI01mfzFashYcVlli9wut2LMOHsC1Pz+MB
	45sbaaLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoA8-0000000DWzJ-3pHt;
	Wed, 15 Jul 2026 01:11:49 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoA6-0000000DWyl-00S8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 01:11:47 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cc6dd436c6so18817255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 18:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784077904; x=1784682704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7t3rulmgzdudnQm0VJU/fmU5yA2DaWNz98HbbPrWp/M=;
        b=WEce/tVaCcXh8rENki0Tbga5wHXhmkrIN70EciQ3VNfMjwYXl4UflYQRZBPJWYfXDM
         GUohHJKWn1nu2OsOhzslu0K/7q7I2u8hRD6rOTupK1dlG5Oz+ApFcCTLwC4fBPj4ga9k
         gUAsGwryjv7CLTRcRQQduKUZ9LLltvN9MxPsu9sY/S7FPC0m5yliuN98qSghdR+N5efs
         qv9yAhJUGA+z+extFXyah1xpHmR49xoGQxQvZ5zrtt1YflSABHNhRhGTGdv7WQ3Icwz7
         tKsEIXKkuZ7LowRRuGSpmOL824WYx2Bj0D7+qQn1kNw3U75ZWCKrW1xQ0xHpV4TFRzlr
         IXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784077904; x=1784682704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7t3rulmgzdudnQm0VJU/fmU5yA2DaWNz98HbbPrWp/M=;
        b=W2JIMNT9FCt6Pde/r9fJSPFPhKBJWvOaIhS19YsCnxcj57F5UcM1yH+J0ZQg13jRIw
         hA90hIubijXy4sssLGabfG7OAJMTZKuHTsey+UgQ7Sn1PCB9DPgFQNbz2BaBNOPWcA7u
         8T9c20Dj/O76Eaxmc1Fei6jZa46eYP5+P9BJIgcXcxwU7TUTqSC/rdj5sVYmRtlqUFKz
         JIVBt+AkBLil8SSlC5eIwejwSHm+n8lMwVedR8FhUW10SBXSzwy+8EoW9s4cKjDWWQHz
         acIcFwdaj/kOIo2aaO1eR3oEDNWrwOLRp817Zpvy6JZrkqtdYJMpOZTVzJ/KsPnoGW3m
         p4Ug==
X-Forwarded-Encrypted: i=1; AHgh+RrrfQO7mqgnfOP9l+KXwuUHBbKiCs/ykmroYCSZZxU6Ayx4Ec+hTBfeOw3aZWCGBrD6OrbzB4tld4f2fCNDESBt@lists.infradead.org
X-Gm-Message-State: AOJu0YzrBwUvJ4XtoLQWFvA/DQSjkq0I7Qb/yby/Ja/wx99CX2nLpT3A
	7Ctgvp2SX36Y5gRAIl+SqXg5U1ha4hS6c9iJRT/fFf6Obo4MDz+cBTer
X-Gm-Gg: AfdE7cktXtBeByQM7byNEVfLYKTr47JRyzSkToYAOC7nMuc+hqCGXqW8oKryZ5VMn3z
	SfO8KW8Wc5caNkDqCXRipmDr/vxZIh6cxJtH4o9yljyWtjxRBi/QGMG3605/EDkd8B+hmqJAjmN
	6nGdfwMzCvswEKKEiUPbMAI1m47dfvf8LV3wHr9rDDOlYNPqOOI+/1k8DlbvIrIWRg2PPSd+VAg
	Nc4tu2NycXPzMayXQm4vkrCF7313xKboHZfDek00KfqRGN8jJvAZmv9qDKdoKHbTKXTKD3Hkluc
	GZ8TjG30ydkx2VZjUT5auVXqwIdGL69TaQZsReMnzX0u8xhsNSsywswbdXfTwU+tE1VNMsAPUKU
	9vYJZ4YeEvuCWpPK+0wBgrum4r2dQHRFKhxpGXetXmCr+HwhZMMevqxsgMCKzx0bAqyFS9jDoPr
	tpbr1qsE0Lk63iv+NBhqJVw0H8uMslXiG8Zbg0yOwitQ9cbTR7pubDaGboHHGQ7UK9z8Ur/iWZ6
	lz95i4+6NgYPIdT1Co7PT7dAu6jkT22P4DaGZRbx5IMP2IMQJSsTQDT7ymBKfAHvg==
X-Received: by 2002:a17:902:f706:b0:2c9:97a8:afef with SMTP id d9443c01a7336-2ce9f3c2c44mr142226605ad.40.1784077904158;
        Tue, 14 Jul 2026 18:11:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cee5ccb579sm26357165ad.52.2026.07.14.18.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:11:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pci@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Michal Simek <michal.simek@amd.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] PCI: xilinx: use fwnode_irq_get() for INTx IRQ lookup
Date: Tue, 14 Jul 2026 18:11:41 -0700
Message-ID: <20260715011142.1261469-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_181146_077038_4529BFCE 
X-CRM114-Status: GOOD (  15.23  )
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

Replace irq_of_parse_and_map() with fwnode_irq_get(dev_fwnode(dev), 0)
in xilinx_pcie_parse_dt(). For an OF-backed device this is equivalent to
the previous call, but uses the generic firmware-node API.

Unlike irq_of_parse_and_map(), fwnode_irq_get() returns a positive IRQ or
a negative errno and never 0 (it rewrites 0 to -EINVAL). Store the result
in an int and check for irq < 0, returning the error (including
-EPROBE_DEFER). This also adds the error handling the previous code
lacked, where irq_of_parse_and_map() failures were passed straight into
devm_request_irq().

Built for ARM (multi_v7_defconfig + CONFIG_PCIE_XILINX) with LLVM=1;
drivers/pci/controller/pcie-xilinx.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pci/controller/pcie-xilinx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index 4aa139abac16..a7b069f7673a 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -20,10 +20,10 @@
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
 #include <linux/of_platform.h>
-#include <linux/of_irq.h>
 #include <linux/pci.h>
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #include "../pci.h"
 
@@ -535,7 +535,7 @@ static int xilinx_pcie_parse_dt(struct xilinx_pcie *pcie)
 	struct device *dev = pcie->dev;
 	struct device_node *node = dev->of_node;
 	struct resource regs;
-	unsigned int irq;
+	int irq;
 	int err;
 
 	err = of_address_to_resource(node, 0, &regs);
@@ -548,7 +548,10 @@ static int xilinx_pcie_parse_dt(struct xilinx_pcie *pcie)
 	if (IS_ERR(pcie->reg_base))
 		return PTR_ERR(pcie->reg_base);
 
-	irq = irq_of_parse_and_map(node, 0);
+	irq = fwnode_irq_get(dev_fwnode(dev), 0);
+	if (irq < 0)
+		return irq;
+
 	err = devm_request_irq(dev, irq, xilinx_pcie_intr_handler,
 			       IRQF_SHARED | IRQF_NO_THREAD,
 			       "xilinx-pcie", pcie);
-- 
2.55.0


