Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA3CC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 23:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bOyY/7st0w/fOk4vhmzD7NcnvHphtli0+U32ViasH6Q=; b=W+jLl0Tl6jDmQwi310PclCMPxl
	mXLOYBn2RQB/KT7kQ8PANlgRhxOayKZ8VKOeN4LuSTQ7+lgEcSAsuUKjPgJbAnjDbhlarJB8RJMux
	yp3fVItKABLNGSuK2jMz+wzv0NvIsfxrjs7S/l2MlAorxyISqDuJNn4x0IVTXCJ0FCAmqWhrPRpoK
	C9VG4c2/F0xY783UWuhnDJRRsgZQQBz86FASkYwS1bJB8VwjtrUw+RxifqssDtyIeP6wLuwEiojPk
	ZnAre8zfOQQjL9j6VbFSgvcMUZHtMOC5nkVLLRMxrdW3u4bQgabBxZm+wHVzLGek9ZHn9DfXg68gy
	VDUBEozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUzW-00000004611-4C7R;
	Mon, 27 Jul 2026 23:44:15 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUzU-0000000460X-1eeO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 23:44:13 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8eefd0c5f59so27444446d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 16:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785195851; x=1785800651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bOyY/7st0w/fOk4vhmzD7NcnvHphtli0+U32ViasH6Q=;
        b=Qq/dCsrZpWu31SgOI5/Ew1GvQH6hLvQL4HIQjr/vymvJMRKYW9vRy5xGMk2YcU+b+2
         l2JSJy4MekVX8mApXn+EsO1f1JkhRsN2RI+f/IaYQ5JSLtBLUYAsPyjMj5MQLaOYEg0V
         mvYxFBlstJq+XHdWaUMbcGX9wojNoo9yTtBa9kYJKtdC5B7pGPuF03vdytElFcNm4hNK
         zZVgwVJWQ6QxCgURoYLA+UH73dWxDxLW7qWGSNy9ZLTp3zjr6C+oLcgj7+BLFG1NUwGT
         OHgxzdcInSobRaReoCUUF3EbaXePNPPGxCK9oKn7azkBn16N5JsDgrktWXWqEwZOmQBv
         1DoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785195851; x=1785800651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bOyY/7st0w/fOk4vhmzD7NcnvHphtli0+U32ViasH6Q=;
        b=ZgRC+fwDif2cswGYgsFC0hFtQnZmOfrWWjubP/pVFq2xWupZO8+MzSeMuMxVsGnzO2
         qCBBW0STq7xmkSc3rIy+9LGE3/t01foGkGkXkKwd6ylOogOYu+A4rRMNZ1qI9RVnq9lM
         jH2ej57wKX+hLGvjQWigamrzqEBr+daRQwaYVKrS1NP5ReQ4ClvwCRg8GiQMp89C/wqx
         IvJ1FYvrwtrGnutndF6+GAsjG0VE26LPzN+RDukgbrvSakSOE2yigBwya1GZzggP5WaZ
         /7M0l0NtbUymJ3NSevTk7vilmu+q5Bo1fGThKXvy3RKUpSdldYN8a8+eTjK/wYD7Q7pi
         CFBg==
X-Forwarded-Encrypted: i=1; AHgh+Rq52oz+ZPkKqXFeUHBQ3WvSMgKudmVvdkKAMUahynRKR8BiyGTIgLc/z+rw+UaBrMZDVDLraNNSBHJxAXw8yPyi@lists.infradead.org
X-Gm-Message-State: AOJu0YwyrTJAXcMZUCXOPdFSKXoX43huEzEXKcg7zya1YluwI2uE15iI
	489WldXe66S9fvFbs27UNSVHAiyhTWFcq33ypvxi7PqSX5SbR+mJm9b1
X-Gm-Gg: AR+sD10kFcfj2n1GR7yuENpHfM0PKXVD3h2ZMEcK2mmqNjydPYPQCXmBkDvuYESzEth
	FuJTtAIzBdWc2w8LQgyExDtaHgFgw/mFWYB0tkWFWVaAQaXKJNqsHhEmoSSSFTDiLMJr62i2EZE
	8obXEdt5Wl2KeO5ZEL+MiprUvbq+Ov0QP16M1k7uiLTvcD+WiV9eKAi3A0dI/zvaN0bpurQAgzG
	yvX0syWM44p//QH2A846bOtXvbS0SuvarFM4ku827LOAtZS32WqJsUJZ3QciNLd/vh0eeC/A2PR
	XX/fEoGQT6GqP2N6IIfHZwA0Cg4xz4QZwNBOT/S+CszTskU9FTzGXuP8Q82PYD38dGJ0+Yl9pJj
	9PTZ/vEYtH5NgtXBVWHjVeP+dhCFHG+YwRaM+d6oFpkdUA6gH4cakKk/6urieek/GxxyAg0gNDn
	hRnv4KXtMTDgPXRwFQd8pAjw8PIV48O3+BilqtmzpHPnlqThGQwZbnKTGKWf0h97EWRsHObte48
	232BuPJxH4x/notEXcImDFFvSe0kgifqXqNHJFjdS98TBSnOu7yw8k=
X-Received: by 2002:a05:6214:5b0c:b0:8e9:f62b:8f91 with SMTP id 6a1803df08f44-907ec8ec1f3mr123698276d6.55.1785195851166;
        Mon, 27 Jul 2026 16:44:11 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e854e43csm75945226d6.16.2026.07.27.16.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 16:44:10 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pci@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] PCI: iproc: platform: use device functions instead of OF.
Date: Mon, 27 Jul 2026 16:44:08 -0700
Message-ID: <20260727234408.296186-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_164412_459153_9D9DC831 
X-CRM114-Status: GOOD (  16.35  )
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

Since this is supposed to be the higher layer file, use higher layer
than OF to handle this. Remove OF headers as a result.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix platform_get_resource() parameters.
 drivers/pci/controller/pcie-iproc-platform.c | 31 ++++++++------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/controller/pcie-iproc-platform.c b/drivers/pci/controller/pcie-iproc-platform.c
index 4c9a0c4bb923..488ff737ec52 100644
--- a/drivers/pci/controller/pcie-iproc-platform.c
+++ b/drivers/pci/controller/pcie-iproc-platform.c
@@ -10,12 +10,8 @@
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
-#include <linux/of_address.h>
-#include <linux/of_pci.h>
-#include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 
-#include "../pci.h"
 #include "pcie-iproc.h"
 
 static const struct of_device_id iproc_pcie_of_match_table[] = {
@@ -40,11 +36,14 @@ static int iproc_pltfm_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct iproc_pcie *pcie;
-	struct device_node *np = dev->of_node;
-	struct resource reg;
+	struct resource *reg;
 	struct pci_host_bridge *bridge;
 	int ret;
 
+	reg = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!reg)
+		return -ENODEV;
+
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
 	if (!bridge)
 		return -ENOMEM;
@@ -52,26 +51,20 @@ static int iproc_pltfm_pcie_probe(struct platform_device *pdev)
 	pcie = pci_host_bridge_priv(bridge);
 
 	pcie->dev = dev;
-	pcie->type = (uintptr_t)of_device_get_match_data(dev);
-
-	ret = of_address_to_resource(np, 0, &reg);
-	if (ret < 0) {
-		dev_err(dev, "unable to obtain controller resources\n");
-		return ret;
-	}
+	pcie->type = (uintptr_t)device_get_match_data(dev);
 
-	pcie->base = devm_pci_remap_cfgspace(dev, reg.start,
-					     resource_size(&reg));
+	pcie->base = devm_pci_remap_cfgspace(dev, reg->start,
+					     resource_size(reg));
 	if (!pcie->base) {
 		dev_err(dev, "unable to map controller registers\n");
 		return -ENOMEM;
 	}
-	pcie->base_addr = reg.start;
+	pcie->base_addr = reg->start;
 
-	if (of_property_read_bool(np, "brcm,pcie-ob")) {
+	if (device_property_present(dev, "brcm,pcie-ob")) {
 		u32 val;
 
-		ret = of_property_read_u32(np, "brcm,pcie-ob-axi-offset",
+		ret = device_property_read_u32(dev, "brcm,pcie-ob-axi-offset",
 					   &val);
 		if (ret) {
 			dev_err(dev,
@@ -87,7 +80,7 @@ static int iproc_pltfm_pcie_probe(struct platform_device *pdev)
 	 * core driver. For platforms that require explicit inbound mapping
 	 * configuration, "dma-ranges" would have been present in DT
 	 */
-	pcie->need_ib_cfg = of_property_read_bool(np, "dma-ranges");
+	pcie->need_ib_cfg = device_property_present(dev, "dma-ranges");
 
 	/* PHY use is optional */
 	pcie->phy = devm_phy_optional_get(dev, "pcie-phy");
-- 
2.55.0


