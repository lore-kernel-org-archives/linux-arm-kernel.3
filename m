Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AD8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 19:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZCIb1sRY2uZibdnrFf+JjGAvdQfDmQTgUaE5fwgc6LY=; b=2hplpz1/8M2XCDWLOFSAEGc/SO
	vA/3Y6xLCYGEikv1Qen/HRXkaiCbtMpVZ6Elo8UoT91w7cLslJ2sz35zHGbCmjJefewZiQhVp231L
	9gytktM7xPrbG56AMH0S8a3nDoACgfsNpvTiUG014+szory0/9yAVvOye2aaJ9GiofiUKz1ATLVQB
	5gEc683htrslrzHbklVFCdJZnnx6jTqyid64dMP0eoJbPfHfLI3D0TpddWZ+9T85IqmIpcxKZzOlk
	FqSK6tsKU3L4wQSaYBGCOVKgHQw4L+nvijmJC6T1eBc1fx+esZpOETxwIh9aor2hRYPDWMT47PL5t
	aV0s6IYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weeVi-000000008v8-36xm;
	Tue, 30 Jun 2026 19:52:46 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weeVf-000000008uO-35Ct
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 19:52:44 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-51c0cea8883so10760671cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 12:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782849162; x=1783453962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCIb1sRY2uZibdnrFf+JjGAvdQfDmQTgUaE5fwgc6LY=;
        b=mQGDnMJTPx31M2DVHsdcKIwE2StILedkzMZRR6sbxfZckzT678Gw/OqeIFZREfJg14
         ATsYDG2U9MV1oF+O1+VpbqhFM3D7DCQfE/DMNsZViug/e0OMZxOWbq6Ry5DjIWmspejB
         j245mbF3rnyCj0GfUXPtcnUfQxfDBstgDiV42a3cGdRnrdWdShZw/VVByaoWVQAZkA5n
         135HmPwB3dIbbPnA1aiT6b41/9VvJvMYZrGhXgMSwnrVMjle16TcVxQOqS/tbCDxRRvg
         cHLD3mFJVisF8DqHVHzq+uj9SzAtpqcVkIbPwdIrUjvjnOW10IBoUC0fS5qjjcBwrhLk
         uxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782849162; x=1783453962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCIb1sRY2uZibdnrFf+JjGAvdQfDmQTgUaE5fwgc6LY=;
        b=bWZa9cw6/F7Ifp08TCTsczE1POFxo1KT5toNNGgELTyV5wiK5VGxD0R8dp1XHAXm1j
         nVhNZkTjS6COrNmms/inohtbD6m1XTKh2rVmQIWLjs8J/51UwYlIM5vqOpk5mzDqMxHD
         EiHCtspsSTa1M6gh62pLpwP3HLE2h6/nWoAQeEewI7sEByF76FT+w0IOX3gJFKeDa3Zj
         PyVzV/C4nUXS2u/tFilcA5KdgpCIMkQF9puYRvwil21zuDY4DPEGBES+EmP7aOkOwfgP
         zssbSSfhIZtMkPcob/QYcsijnb602/i1PMtoBmUKlALiot1Qxq+Xt2eMsRJu+/TWpJWF
         /TtQ==
X-Forwarded-Encrypted: i=1; AFNElJ90Ga+D0zZsmMlC0lmxRnKHqezsh2YlF35QmKnKA0quiefahAJCfZBeKp7s5gw10XgYrUE7tXZ3JkiVCwYkRfdu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6d9t6JcO23bBHaQ/lQ2MoLoXnhi+iaGCZyuJrhHNZRQaxlu9A
	qT7qXXNktrpACQXzKbfyN9pkxuRqVNBz6ogi6xNBwBvVW57+yLs9dlgY
X-Gm-Gg: AfdE7ckH9imYLQQXETd2ANnHtJYXToXGs9TxFi1w+D/hPG9kCKzwS3Oab+K4Y68WZW9
	/6ge6FO/mS38T11xMNB4raMBLofevgHnrolIac9fxX/8uF7V8tKl6e7GFhQYs4PX0pqtIqAyIfG
	ZMXGwy8DFMO2JENIPUbrwdxUfS1xMkytLPym/5fG5j5hds3+SWD59F2JWLPZAFjET60r7mbzg97
	o5JJy4YYfy+wkE5cB3iuPdNZbqVv73clyxMcETWAMmFUy8UrQObNLaeDlR4uW+pbF7x9lwXYzpN
	dNt/uNIu4pfugH5KKYAxx1+ECccIMtxf2qj5Etcx0JqTYwg8mR9wNqWotUWd8YF3Rm3jHLfoSLP
	YsOmyJr60YF37d2fT9mZWscwsLg2magAE3mcPxEG7cbrubKzJEFfe1paB2dETnt6MVwSkePnoUM
	W7DEbCJtYJw0aWIcg6/0YRN2+TCAY7f8pvd668vKKe
X-Received: by 2002:a05:622a:1212:b0:51c:558:cbbd with SMTP id d75a77b69052e-51c180050d0mr37857701cf.41.1782849161772;
        Tue, 30 Jun 2026 12:52:41 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a69c32c0sm31330786d6.29.2026.06.30.12.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:52:41 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] PCI: xgene: Drop unnecessary OF node reference
Date: Tue, 30 Jun 2026 15:52:34 -0400
Message-ID: <20260630195234.1871951-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_125243_778842_D06DB72A 
X-CRM114-Status: GOOD (  13.49  )
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

xgene_pcie_probe() stores dev->of_node in port->node with
of_node_get(), but the cached node is only used during probe by
xgene_pcie_parse_map_dma_ranges(). The driver never releases the extra
reference, so the node reference is leaked.

There is no need for private OF node ownership here. Use the device's
existing of_node directly in xgene_pcie_parse_map_dma_ranges() and remove
the cached port->node pointer.

Fixes: 5f6b6ccdbe1c ("PCI: xgene: Add APM X-Gene PCIe driver")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/pci/controller/pci-xgene.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index b95afa35201d..83c9a2930eec 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -58,7 +58,6 @@
 #define XGENE_PCIE_IP_VER_2		2
 
 struct xgene_pcie {
-	struct device_node	*node;
 	struct device		*dev;
 	struct clk		*clk;
 	void __iomem		*csr_base;
@@ -526,7 +525,7 @@ static void xgene_pcie_setup_ib_reg(struct xgene_pcie *port,
 
 static int xgene_pcie_parse_map_dma_ranges(struct xgene_pcie *port)
 {
-	struct device_node *np = port->node;
+	struct device_node *np = port->dev->of_node;
 	struct of_pci_range range;
 	struct of_pci_range_parser parser;
 	struct device *dev = port->dev;
@@ -612,7 +611,6 @@ static bool xgene_check_pcie_msi_ready(void)
 static int xgene_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *dn = dev->of_node;
 	struct xgene_pcie *port;
 	struct pci_host_bridge *bridge;
 	int ret;
@@ -627,7 +625,6 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 
 	port = pci_host_bridge_priv(bridge);
 
-	port->node = of_node_get(dn);
 	port->dev = dev;
 	port->version = XGENE_PCIE_IP_VER_1;
 
-- 
2.43.0


