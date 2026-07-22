Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE41C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 23:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A666YiddBzubQJ14vmQH66RggGZrJM+23a2vA9KOgG0=; b=fyc4FNkgmwbVjPruLhmJkZcJxm
	YYRuDLxCpA49O1KV+fYag1cwK1STssYhUvu/2TkeknUXsC0TFW/CmeLnYcpYgj0KzfBPTNAMHl1Q3
	UNaK3Xksv1WVldD1hdyf2UZKYT49bM6DSGg297J1vE+xuVuojvMflIx8xRBhPoj4ho/XGSTVA/bBj
	3wgEO2xfCuPs+VD5KpMr4QREZp1rup1RjtbVJJor3jCVD8EClKrwH6DI4s3VzAvPpHiRv0nLYWG8K
	edAk0g1CY9GpZbZZuoW231sxhnc/mmwEv0bjIZMOr92QSzIFaNi7o5V/lA8ZmOXrnLHFcq5c7M3B8
	Z48CZrOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgA6-0000000CwGN-2d91;
	Wed, 22 Jul 2026 23:15:38 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgA4-0000000CwFx-3Adh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 23:15:37 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso40354a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 16:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784762135; x=1785366935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A666YiddBzubQJ14vmQH66RggGZrJM+23a2vA9KOgG0=;
        b=WZUBQ/F41jjxsydLNGiBGgbLUl6hwi3uLsBBwV4khy8Brdb/pGkQme/gY0PSgwaI40
         EhOECq48P5EPjk2Zdd0pmktxZ0rXAUm66BIsGjFnBxyZ+rqZsvH8nLXNXDi/EZCzHmvy
         suxTRoGByukvFz8LFGQCObKSh4sK1DyXAuNNn074WZUf0qD9F/+OjsCIQ6+kn/dibsoh
         jd0zb2NX3bWXZDRGQKrD8f50tkIIkYsUp7TzWmxgu+mQeHBn9ltmPYLIR8MwxADOgg5h
         QdWOm/wlftlDxTmkqX7DTmC8CNw5LrmX9TOheprQbxl8q/s7FcKRRFH4zYH3AOsjjKgF
         Emng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762135; x=1785366935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A666YiddBzubQJ14vmQH66RggGZrJM+23a2vA9KOgG0=;
        b=lDO93E7tJf42E6Jear118wPCUL4TjLP7SQOlZCGDMG8CBTmO76VY3IdK33kzmsUenI
         e26j2EvwW5+S/M067AewHb8hj7oNjxEGFlc93yAYpTSOC9PFqIHzr1if72ZgjyN2UxEf
         pw0RYbUwike/Ne0dWA4GyoTUTN4PLf3HllPVTVEJaR57OtvTnDQfy0KODx5hfMN4qFxr
         BOZHtmytaUn6WDJtKt+MiA+KhR8r/dQ8w8M/n/YOhlvhOwCdIsRVtRIln6ntZmQV60w6
         8XZ91VoGqjgJ/mPL25uFWx76mRKnnnX+f/Y9/PaME6TuV+sIqajCPGxgV/szpNkzlH2K
         sT8A==
X-Forwarded-Encrypted: i=1; AHgh+RqALIe1q4rVqBq9pexrBvDyKA08noYixoqUEQxF+H+VmG2ZA5pD0I5OvpMubnXYxUkjj6faf5S23SXXEAtHV8fn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5BfQan9MSyWlJuTDBTIOSa8Sci80LPB4PoA73ERJhSuIlRunX
	OSO6AsyfOMfj6djY+/nAe0+9qNY9FzYdVVvk7lCAZWE6/lSXs772VoI/
X-Gm-Gg: AR+sD126fdSV53EmcMR3a7HoNgwyXr8ExYVVX6EQ4MJkb3Gh9b9NKLnUiGGstQEIaLE
	WA2PzdGuQr/yeXTJoHnxbyKWrY1ftoYiWK6XM7lCGcP/SeHd1YGcwpxy/CsccfLr0PmJBdTQZA2
	ThRQd2jmiyG3otcp5IUQSpLATITfgyp1TyM3LvIix6660nDv9tAFDilSvaV+kvPKuIeKyUT6L+w
	zqJLPe9Nyl84TEMl3RWU9dAzpvensX8Xa5ytnJNrucLEhWIfpwRc8Ng6hiwo0yRVUY6MpfLDBEd
	BChrOKvtLdB4PQSS5W900NbitPD7o/SDEnKGfbZ9/OybozAcrg9Zjr+tZTKRmnw7iOWe6jqrcSf
	mxlb3TfLfCGr2bCHxkQhrmrqe2bFTRjdR5F3zomFdEaH/DrmTsVltMnqx1nNAzk5bwyWLdr639B
	Dw7EL4qgq4bPL4A/haoXqXAHdHUMKtfkxJWRjMgMS0C1zkuTC5wAXTOBi0fSWAxCdyV2sA8/8l0
	7X50vIQnVObhCP6iux5YfCFKKjeiKjb/xl/1AuQuHfg0SSCjUIddurnl/x7/dSV5Q==
X-Received: by 2002:a05:6a21:d82:b0:3c3:9557:3b47 with SMTP id adf61e73a8af0-3c44b202c16mr432634637.51.1784762135338;
        Wed, 22 Jul 2026 16:15:35 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a2bsm1798981a12.22.2026.07.22.16.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:15:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pci@vger.kernel.org
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/UNIPHIER ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2] PCI: dwc: uniphier: use fwnode API for legacy-interrupt-controller
Date: Wed, 22 Jul 2026 16:15:32 -0700
Message-ID: <20260722231532.872962-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_161536_798354_06275851 
X-CRM114-Status: GOOD (  15.52  )
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

Convert uniphier_pcie_config_intx_irq() from the OF-specific to the
generic firmware-node API: of_get_child_by_name() to
device_get_named_child_node(), irq_of_parse_and_map() to
fwnode_irq_get(), of_fwnode_handle() on the child node to passing the
fwnode directly, and of_node_put() to fwnode_handle_put().

Unlike irq_of_parse_and_map(), fwnode_irq_get() returns a positive IRQ
or a negative errno and never 0 (it rewrites 0 to -EINVAL), so check
pp->irq < 0 and propagate the error. pp->irq is an int, so the negative
value is preserved. Drop the now-unused np / dev_fwnode() locals, since
device_get_named_child_node() operates on the device directly.

Built for arm64 (defconfig + CONFIG_PCIE_UNIPHIER) with LLVM=1;
drivers/pci/controller/dwc/pcie-uniphier.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix fwnode_irq_get() error propagation.
 drivers/pci/controller/dwc/pcie-uniphier.c | 25 +++++++++++-----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index 297e7a3d9b36..29eb1b9abd26 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -14,7 +14,6 @@
 #include <linux/iopoll.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
-#include <linux/of_irq.h>
 #include <linux/pci.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -262,27 +261,27 @@ static int uniphier_pcie_config_intx_irq(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct uniphier_pcie *pcie = to_uniphier_pcie(pci);
-	struct device_node *np = pci->dev->of_node;
-	struct device_node *np_intc;
+	struct device *dev = pci->dev;
+	struct fwnode_handle *fw_intc;
 	int ret = 0;
 
-	np_intc = of_get_child_by_name(np, "legacy-interrupt-controller");
-	if (!np_intc) {
-		dev_err(pci->dev, "Failed to get legacy-interrupt-controller node\n");
+	fw_intc = device_get_named_child_node(dev, "legacy-interrupt-controller");
+	if (!fw_intc) {
+		dev_err(dev, "Failed to get legacy-interrupt-controller node\n");
 		return -EINVAL;
 	}
 
-	pp->irq = irq_of_parse_and_map(np_intc, 0);
-	if (!pp->irq) {
-		dev_err(pci->dev, "Failed to get an IRQ entry in legacy-interrupt-controller\n");
-		ret = -EINVAL;
+	pp->irq = fwnode_irq_get(fw_intc, 0);
+	if (pp->irq < 0) {
+		dev_err(dev, "Failed to get an IRQ entry in legacy-interrupt-controller\n");
+		ret = pp->irq;
 		goto out_put_node;
 	}
 
-	pcie->intx_irq_domain = irq_domain_create_linear(of_fwnode_handle(np_intc), PCI_NUM_INTX,
+	pcie->intx_irq_domain = irq_domain_create_linear(fw_intc, PCI_NUM_INTX,
 						&uniphier_intx_domain_ops, pp);
 	if (!pcie->intx_irq_domain) {
-		dev_err(pci->dev, "Failed to get INTx domain\n");
+		dev_err(dev, "Failed to get INTx domain\n");
 		ret = -ENODEV;
 		goto out_put_node;
 	}
@@ -291,7 +290,7 @@ static int uniphier_pcie_config_intx_irq(struct dw_pcie_rp *pp)
 					 pp);
 
 out_put_node:
-	of_node_put(np_intc);
+	fwnode_handle_put(fw_intc);
 	return ret;
 }
 
-- 
2.55.0


