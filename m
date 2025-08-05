Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A34DC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 13:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DhOxquyStsE5O79YeXSosHHFUYZj/A8kL5bEloNlApM=; b=brgxw7/TGIvqOD/Kx9NvYSkIaa
	XT53ryXjDl8wdDX4RFk1Un3mPygD9hUzGZqMdQiY4KLHmwVyCZW6CWD2XHDrmHmHZv/fUtKDSvci/
	W6Uv56hL3Gk4vgnhaR0Pdi2MmibgqUBHQpLQHfVRVWxUjJSJuiK0HIDyY98hXF0cdGMlelSHMzyON
	iPlj0mWoGMP9OCV5KTTFcJAplMmOipdhukwSsygIsuQDNqqnoHI1BJ1Pf84wtfpfE/0QenHQlLXcn
	6OWTtt0dlw/C13N6qzxGYR9MHOgpOpXZntcxEU215NBZhevkp5uY4xmXV6+FXI8jv8NjADXIem0+Q
	HT503YuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujI5l-0000000Ctee-0xG7;
	Tue, 05 Aug 2025 13:52:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHok-0000000CrOI-21wA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 13:35:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E673C5C6205;
	Tue,  5 Aug 2025 13:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C45BC4CEF7;
	Tue,  5 Aug 2025 13:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754400901;
	bh=/0ZE234TeSw9xjJpsbQakcX1dsGmzNxtfI+WMMXz2Kk=;
	h=From:To:Cc:Subject:Date:From;
	b=lU+lLa4Zrpe/uj+pWg2ZxX89B5r4JrzaxePFTDj8FhpjrDcq3CfN5sbou/RNgS0pJ
	 7jLrGu10EEKOou8IK+saOPLUuu5vIp2E0ynNnoM7IYXL9hDm1YeYhUVhm31lisHfdt
	 dtZwexUTb4hGIdQVru11j6aIKVCoyrpCtMwZfqymeBHOpKmnZeJHWL3AJYlCFjMkjR
	 4jZLhZzJmCbSKAILgJRPQ+atWOY4PJ2kWNDpFhKdVDPc+2lvF47AVAqD2NWlTF13lM
	 KDyU8JmdoRgMv8lmA6UUd/rDY8Pu/X38IYSDL/87TpfGbBtd53uMVnhuDtF0QF0HnB
	 Vc/PzUijScXxg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH] of/irq: Convert of_msi_map_id() callers to of_msi_xlate()
Date: Tue,  5 Aug 2025 15:34:43 +0200
Message-ID: <20250805133443.936955-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_063502_605830_7D04438F 
X-CRM114-Status: GOOD (  17.84  )
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

With the introduction of the of_msi_xlate() function, the OF layer
provides an API to map a device ID and retrieve the MSI controller
node the ID is mapped to with a single call.

of_msi_map_id() is currently used to map a deviceID to a specific
MSI controller node; of_msi_xlate() can be used for that purpose
too, there is no need to keep the two functions.

Convert of_msi_map_id() to of_msi_xlate() calls and update the
of_msi_xlate() documentation to describe how the struct device_node
pointer passed in should be set-up to either provide the MSI controller
node target or receive its pointer upon mapping completion.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
As suggested by RobH:

https://lore.kernel.org/lkml/20250627213241.GA168190-robh@kernel.org/

 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c |  2 +-
 drivers/of/irq.c                            | 25 +++++----------------
 drivers/pci/msi/irqdomain.c                 |  2 +-
 include/linux/of_irq.h                      |  6 -----
 4 files changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c b/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
index 11549d85f23b..b5785472765a 100644
--- a/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
+++ b/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
@@ -30,7 +30,7 @@ static u32 fsl_mc_msi_domain_get_msi_id(struct irq_domain *domain,
 	u32 out_id;
 
 	of_node = irq_domain_get_of_node(domain);
-	out_id = of_node ? of_msi_map_id(&mc_dev->dev, of_node, mc_dev->icid) :
+	out_id = of_node ? of_msi_xlate(&mc_dev->dev, &of_node, mc_dev->icid) :
 			iort_msi_map_id(&mc_dev->dev, mc_dev->icid);
 
 	return out_id;
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 74aaea61de13..e7c12abd10ab 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -673,13 +673,14 @@ void __init of_irq_init(const struct of_device_id *matches)
 /**
  * of_msi_xlate - map a MSI ID and find relevant MSI controller node
  * @dev: device for which the mapping is to be done.
- * @msi_np: Pointer to store the MSI controller node
+ * @msi_np: Pointer to target MSI controller node
  * @id_in: Device ID.
  *
  * Walk up the device hierarchy looking for devices with a "msi-map"
- * property. If found, apply the mapping to @id_in. @msi_np pointed
- * value must be NULL on entry, if an MSI controller is found @msi_np is
- * initialized to the MSI controller node with a reference held.
+ * property. If found, apply the mapping to @id_in.
+ * If @msi_np points to a non-NULL device node pointer, only entries targeting
+ * that node will be matched; if it points to a NULL value, it will receive the
+ * device node of the first matching target phandle, with a reference held.
  *
  * Returns: The mapped MSI id.
  */
@@ -699,22 +700,6 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
 	return id_out;
 }
 
-/**
- * of_msi_map_id - Map a MSI ID for a device.
- * @dev: device for which the mapping is to be done.
- * @msi_np: device node of the expected msi controller.
- * @id_in: unmapped MSI ID for the device.
- *
- * Walk up the device hierarchy looking for devices with a "msi-map"
- * property.  If found, apply the mapping to @id_in.
- *
- * Return: The mapped MSI ID.
- */
-u32 of_msi_map_id(struct device *dev, struct device_node *msi_np, u32 id_in)
-{
-	return of_msi_xlate(dev, &msi_np, id_in);
-}
-
 /**
  * of_msi_map_get_device_domain - Use msi-map to find the relevant MSI domain
  * @dev: device for which the mapping is to be done.
diff --git a/drivers/pci/msi/irqdomain.c b/drivers/pci/msi/irqdomain.c
index 0938ef7ebabf..555c61b1fc36 100644
--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -422,7 +422,7 @@ u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev)
 	pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);
 
 	of_node = irq_domain_get_of_node(domain);
-	rid = of_node ? of_msi_map_id(&pdev->dev, of_node, rid) :
+	rid = of_node ? of_msi_xlate(&pdev->dev, &of_node, rid) :
 			iort_msi_map_id(&pdev->dev, rid);
 
 	return rid;
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index a480063c9cb1..1db8543dfc8a 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -55,7 +55,6 @@ extern struct irq_domain *of_msi_map_get_device_domain(struct device *dev,
 							u32 bus_token);
 extern void of_msi_configure(struct device *dev, const struct device_node *np);
 extern u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in);
-u32 of_msi_map_id(struct device *dev, struct device_node *msi_np, u32 id_in);
 #else
 static inline void of_irq_init(const struct of_device_id *matches)
 {
@@ -105,11 +104,6 @@ static inline u32 of_msi_xlate(struct device *dev, struct device_node **msi_np,
 {
 	return id_in;
 }
-static inline u32 of_msi_map_id(struct device *dev,
-				 struct device_node *msi_np, u32 id_in)
-{
-	return id_in;
-}
 #endif
 
 #if defined(CONFIG_OF_IRQ) || defined(CONFIG_SPARC)
-- 
2.48.0


