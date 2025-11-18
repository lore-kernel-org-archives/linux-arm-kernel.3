Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94811CF2560
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 22:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsSQ2wAGK0+ES4Vvtmq8MIPX2CBajCXRr5JRuygk4SM=; b=Bfa8gMZptP4cgvNVuY7vcQ1r2Z
	NHvWA3SdrefhEAHvM+ETvBFLZPOfm9kjU1u4u9gtxB/rk+LP9AEhTzIIu2+AKx533uW2qjgbG6Aa8
	tSITFbIWDFeXYUE7J7sCXEPMHqBs5e2cCSldJWqy6KWjUgbisj4WEjiWcuRyfVeR2PRq17nDuxRF3
	XTkFXKq9r2K/ljJbMQFc+SokQzmA9+G4Ju6B8Gh1Vve0MB35I/tVzem9BF3CY9D1u8baa1IPVUsbu
	e0HfLqYDpyiU+TRtibWCm8/bRh6bQfMCIRZVLayWdGOekAYTA9XHJCuUeg15U3979uWG4iWIqFjRJ
	NtC/EGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTyl-00000001ASc-3Nzo;
	Tue, 18 Nov 2025 22:15:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTyj-00000001ARx-3Vuu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 22:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763504113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsSQ2wAGK0+ES4Vvtmq8MIPX2CBajCXRr5JRuygk4SM=;
	b=VYjB+VnaMevGALbjcX5QMLU0TkQg6luM97pHCwmyIw7zFESljaL8Shu/plHPZBe8SNk/i8
	j3B/8FIwJya932gOv1HcmRNh7M+X/6psh3Rwc/S6P5J7jZiYd5j20rmKQwjVVo/hJI4SEy
	WwC0bOcPqENGDslGS5e5gAPY4V4ADQU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-468-aPMkPPLCP_CZDDwSlMrQIg-1; Tue,
 18 Nov 2025 17:13:38 -0500
X-MC-Unique: aPMkPPLCP_CZDDwSlMrQIg-1
X-Mimecast-MFC-AGG-ID: aPMkPPLCP_CZDDwSlMrQIg_1763504017
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E89091956096;
	Tue, 18 Nov 2025 22:13:36 +0000 (UTC)
Received: from thinkpad-p1.kanata.rendec.net (unknown [10.22.88.100])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9FB90180047F;
	Tue, 18 Nov 2025 22:13:34 +0000 (UTC)
From: Radu Rendec <rrendec@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] PCI: apple: Store private pointer in platform device's drvdata
Date: Tue, 18 Nov 2025 17:12:44 -0500
Message-ID: <20251118221244.372423-3-rrendec@redhat.com>
In-Reply-To: <20251118221244.372423-1-rrendec@redhat.com>
References: <20251118221244.372423-1-rrendec@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_141514_008309_7FC3DB85 
X-CRM114-Status: GOOD (  19.04  )
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

Now pci_host_common_init() no longer uses the platform device's drvdata
to store the pointer to the allocated struct pci_host_bridge. Use the
drvdata to store the pointer to the driver's private data, which is the
struct apple_pcie allocated in apple_pcie_probe(). This eliminates the
need to store these pointers in a separate mapping table.

This reverts most of the changes in commit 643c0c9d0496 ("PCI: apple:
Add tracking of probed root ports"). No "Fixes" tag is added because
nothing is broken in that commit. This is just a simplification.

Signed-off-by: Radu Rendec <rrendec@redhat.com>
---
 drivers/pci/controller/pcie-apple.c | 53 ++++-------------------------
 1 file changed, 7 insertions(+), 46 deletions(-)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 0380d300adca6..75bb6d51d31c2 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -187,7 +187,6 @@ struct apple_pcie {
 	const struct hw_info	*hw;
 	unsigned long		*bitmap;
 	struct list_head	ports;
-	struct list_head	entry;
 	struct completion	event;
 	struct irq_fwspec	fwspec;
 	u32			nvecs;
@@ -206,9 +205,6 @@ struct apple_pcie_port {
 	int			idx;
 };
 
-static LIST_HEAD(pcie_list);
-static DEFINE_MUTEX(pcie_list_lock);
-
 static void rmw_set(u32 set, void __iomem *addr)
 {
 	writel_relaxed(readl_relaxed(addr) | set, addr);
@@ -724,45 +720,13 @@ static int apple_msi_init(struct apple_pcie *pcie)
 	return 0;
 }
 
-static void apple_pcie_register(struct apple_pcie *pcie)
-{
-	guard(mutex)(&pcie_list_lock);
-
-	list_add_tail(&pcie->entry, &pcie_list);
-}
-
-static void apple_pcie_unregister(struct apple_pcie *pcie)
-{
-	guard(mutex)(&pcie_list_lock);
-
-	list_del(&pcie->entry);
-}
-
-static struct apple_pcie *apple_pcie_lookup(struct device *dev)
-{
-	struct apple_pcie *pcie;
-
-	guard(mutex)(&pcie_list_lock);
-
-	list_for_each_entry(pcie, &pcie_list, entry) {
-		if (pcie->dev == dev)
-			return pcie;
-	}
-
-	return NULL;
-}
-
 static struct apple_pcie_port *apple_pcie_get_port(struct pci_dev *pdev)
 {
 	struct pci_config_window *cfg = pdev->sysdata;
-	struct apple_pcie *pcie;
+	struct apple_pcie *pcie = platform_get_drvdata(to_platform_device(cfg->parent));
 	struct pci_dev *port_pdev;
 	struct apple_pcie_port *port;
 
-	pcie = apple_pcie_lookup(cfg->parent);
-	if (WARN_ON(!pcie))
-		return NULL;
-
 	/* Find the root port this device is on */
 	port_pdev = pcie_find_root_port(pdev);
 
@@ -843,13 +807,9 @@ static void apple_pcie_disable_device(struct pci_host_bridge *bridge, struct pci
 static int apple_pcie_init(struct pci_config_window *cfg)
 {
 	struct device *dev = cfg->parent;
-	struct apple_pcie *pcie;
+	struct apple_pcie *pcie = platform_get_drvdata(to_platform_device(dev));
 	int ret;
 
-	pcie = apple_pcie_lookup(dev);
-	if (WARN_ON(!pcie))
-		return -ENOENT;
-
 	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
 		ret = apple_pcie_setup_port(pcie, of_port);
 		if (ret) {
@@ -876,6 +836,7 @@ static int apple_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct apple_pcie *pcie;
+	struct pci_host_bridge *bridge;
 	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
@@ -897,11 +858,11 @@ static int apple_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	apple_pcie_register(pcie);
+	bridge = pci_host_common_init(pdev, &apple_pcie_cfg_ecam_ops);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
 
-	ret = pci_host_common_init(pdev, &apple_pcie_cfg_ecam_ops);
-	if (ret)
-		apple_pcie_unregister(pcie);
+	platform_set_drvdata(pdev, pcie);
 
 	return ret;
 }
-- 
2.51.1


