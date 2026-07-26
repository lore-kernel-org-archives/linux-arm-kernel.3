Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F040C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 21:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tYa3vEt1DiiFt5roobZR/K438UfRZKbfVJpeTjMU8QI=; b=X3sPyQbFSc9RFCo1Ma131mBTxT
	wYUxL4NtHAhHJBI3pHP/Zk/NGv7vwDbTo6/Z7sy+bpEczdVms0MIQOGH8yCKTymR/Z65bBT6Bdi/2
	wX+w/LmM7tRUqiqNCRMuH0I29zVSiEZ9GlqgVhTww+CjUNdIaBJffiSP04DPtP4b0MAya14hydKTD
	kklR/8cNkiqkDAR4bBcNz5Oazz2KoQFgMOxh7FV4k1zeBfrnA+mSaE1EgSKHx3yzVbThQAYTZ7quq
	91WHITSdn3L2Qg1HihY3oQYrdwhXYQunE49mXiRYB9gZQ08OMFnSwHiURko07vaAQycMxL01dgF4B
	zL55CglA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo6pK-00000001fts-37iK;
	Sun, 26 Jul 2026 21:56:06 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo6pH-00000001ftV-3HDY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 21:56:05 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1562190a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 14:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785102962; x=1785707762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tYa3vEt1DiiFt5roobZR/K438UfRZKbfVJpeTjMU8QI=;
        b=cX53hh6Jd+K7IKJgxLrdOq+0vaWfVbYv2Y5IEPS0ExPJHR6/4Z1RnthNzxhro1dIGU
         +oI+YemUlvT+7cXWuukJ1ujqj9JCtHaWHva36VmhYGbju0ky2YITEYMppJRFmdz4PXSl
         wh5SZWXxF8bYm5vSRev3b3gRt9PqzihvgczlEM+gz18N5FNgfi3G01OBWP5pNyBe1JJr
         tSeVG3qmdR5N1bxl59gqrAMsYFL8r58Y4Zy2bXhyd5u9ibVKaaVHMphGRWmOeGnH4Mic
         g1kkJc8WUTGQfetqF0j7Lx0K/D1RBwf675t2XtxAEM8bDT9wvbzGSsEJ2BoL1M3s8dXH
         9W1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785102962; x=1785707762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYa3vEt1DiiFt5roobZR/K438UfRZKbfVJpeTjMU8QI=;
        b=cpJeq0Z/yoJ5MdmMy3WzK+kHWbFWcqub0DH5On3m+GKslHCgk/V+R9xJi+Ow0qyg46
         ktcYfTp6pP7EW6ZtyJFyrPYKMdpt3rzfI8D+q/k3ugJq/VZAgwowgCcKqL65OOcDv6W+
         RF0TmRnkzZ3aKAPaCgFqKZ1TjgCNGVOfui450dlRjbp1GP54SK1DbQgKhslJU3TqsAlW
         aBgn7sNX0L+21E6ly4TVOE02KpIwyF8ULfMKMR0FUZW5DkPFAwaRDSbINEUKKDqqCehX
         gIOWGiChPVFdoODrFmVFHEp1JjOPi946IUK43VVXG/5ZJqX7q4yQwZCmM3i4bYoWcpJY
         Cuag==
X-Forwarded-Encrypted: i=1; AHgh+RrccKHnXvS1poCvXsFjNnsyttc54s8g0ZqxLxHCoGi9yFG+E/u9dxjBINFaYHJkRIkzSCaxC9SCbjhXk24Mz+Wa@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0j5wPDTveqSa4AdPy0PGt2XOqH8xnjZ+wVoFMXiMC45PTMyYv
	rT/kSAnb2mVC9bDZtt42+lAZs54hqwaksajoA8oq/kQ8y/+bMWwah7pk
X-Gm-Gg: AR+sD10va9l+XTTjdI5UGCC+q8VDa9FjDUTfVpTffef17GWB/8duJWvvXitxqMKe1eL
	8gh2aOKYHD23W1tQ85VHJhLVN4BbbFTJpoFtdcW+1fUoUYFgvnCEv8KALW+J/iSfLlgagq3WnTz
	CqrI4tWn9unV+8OaUWG6go78l20KwERGVkt6K4A+7+n4+EFkcBO2sjSFz/PiyFm24QBi2M5Te9N
	JqBGeaqx3r0yeQLxHa6LBQw1TIAvXxNWrxjAfg2Ab+coO/isvJToZz9dHiu5I5kj+PdPZcvlbC5
	igI4RzpMmiU4zz+ZHaO4d9xsnLJSYObMKrAeuKlNejlVwREUo9UFStxGraN/g+F6E2KCe3oS1RY
	HT4FyYjD9hQVfrvjSamqogtF9uTNLuI8SFJuyUCXcPSaLaj+qqc8gXgolWRn1nNdLga4eGe2p0B
	EVc55J0V2vIjhUPrcZCxM/HEo08v2im3oQArybt0mcWLt4m+NEjbMEYG5afw0VsG4JfZy8rgUY8
	yFbIO/DexZfE66tv6Tq1XugsugVGdyQk9iywQ9guuHyFY0ZHHnzRQ24d/7x6tAKOMMtZYJ3F0s5
	/7WlkEB0n4FO6TfR0uaKsbeDNGLtX93WwMJtbA==
X-Received: by 2002:a17:90b:5106:b0:38e:59c2:cbc5 with SMTP id 98e67ed59e1d1-38f29522109mr5856966a91.18.1785102961837;
        Sun, 26 Jul 2026 14:56:01 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041bec23sm4087480a91.15.2026.07.26.14.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 14:56:00 -0700 (PDT)
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
Subject: [PATCH] PCI: iproc: platform: use device functions instead of OF.
Date: Sun, 26 Jul 2026 14:55:58 -0700
Message-ID: <20260726215558.34091-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_145603_830195_38D0A4F9 
X-CRM114-Status: GOOD (  16.47  )
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
 drivers/pci/controller/pcie-iproc-platform.c | 31 ++++++++------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/controller/pcie-iproc-platform.c b/drivers/pci/controller/pcie-iproc-platform.c
index 4c9a0c4bb923..abd04a05fbff 100644
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
 
+	reg = platform_get_resource(pdev, 0, IORESOURCE_MEM);
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


