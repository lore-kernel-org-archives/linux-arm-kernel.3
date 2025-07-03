Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD65C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 11:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4w8972VQoFJHXfCIGRgDiZDnx608RG+o5l/zeMyKw4=; b=fAxeNt/vGsiVM6Dl6FWBUNgCZa
	lKJevxmSJpUsdSkHh/QR2/l6noVibEQRZFxvzQgwUCW6rUg1j9rTBwaH+fklwfQUFs5ElEWjJAiO8
	zdVSMSKvuUmU1GWjSFrveljrzshqMagJ7v9YHLqo+H/Mae7eTrl77hFPE5xOUWRccBdWCGJtG40tH
	AV7PGEgXUbbRF9USfmzF0sBV1tnBdAKPkxb3vrNaa5WtvQUOcdCE2jY2tNR16LFkKVcYbMVRyJKeG
	S8WtdHVyxnugX/3eN3HFFJTOKo2Rt++ChUEvd/pUhAw/2dve/cK31ZjloQahiYKpbNB+vJIxh5RUP
	89dn0aIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXI3X-0000000B9EF-2aUd;
	Thu, 03 Jul 2025 11:24:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHA8-0000000AzGb-0u1r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:27:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9AC55613B1;
	Thu,  3 Jul 2025 10:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B21C4CEE3;
	Thu,  3 Jul 2025 10:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751538447;
	bh=DChQwWXvs3tE8B+jpm3p7q+cSXi9YVq9StAkRX8XLr8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mJiSWJHbV0OO0RGsSqGg8xwEU7oc30gH/MunHTuNLIT2ezbdIi4/y9UnFvOUpijKm
	 9XnhyhhdtUub0PitHfrLibSPJAQqKJVvsCZZXcmxtk5CZl2oIIAjKt1osi8dVHYpVf
	 g9PRlwpO3+U8nD/3E2C8YpCzYZtO6h2o/mPwSr19idZynLNJXsnj9BZnLoiPVA2Oib
	 YfH1rXbp0MsotBDTRJyBHkZI3Q+qwyOJPhmFOBdnWGWCPzbMbYj+aeNpHm9e3WyDG6
	 MlDt28xttTeY5I1sjEh+ArAweZgBJYl+AOZMQfNIFwLjobmVP89sKhVPbB8CudI6X3
	 meMA7p9anJBHg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 03 Jul 2025 12:25:14 +0200
Subject: [PATCH v7 24/31] of/irq: Add of_msi_xlate() helper function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-gicv5-host-v7-24-12e71f1b3528@kernel.org>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
In-Reply-To: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
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

Add an of_msi_xlate() helper that maps a device ID and returns
the device node of the MSI controller the device ID is mapped to.

Required by core functions that need an MSI controller device node
pointer at the same time as a mapped device ID, of_msi_map_id() is not
sufficient for that purpose.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/of/irq.c       | 22 +++++++++++++++++-----
 include/linux/of_irq.h |  5 +++++
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index f8ad79b9b1c9..74aaea61de13 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -670,8 +670,20 @@ void __init of_irq_init(const struct of_device_id *matches)
 	}
 }
 
-static u32 __of_msi_map_id(struct device *dev, struct device_node **np,
-			    u32 id_in)
+/**
+ * of_msi_xlate - map a MSI ID and find relevant MSI controller node
+ * @dev: device for which the mapping is to be done.
+ * @msi_np: Pointer to store the MSI controller node
+ * @id_in: Device ID.
+ *
+ * Walk up the device hierarchy looking for devices with a "msi-map"
+ * property. If found, apply the mapping to @id_in. @msi_np pointed
+ * value must be NULL on entry, if an MSI controller is found @msi_np is
+ * initialized to the MSI controller node with a reference held.
+ *
+ * Returns: The mapped MSI id.
+ */
+u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
 {
 	struct device *parent_dev;
 	u32 id_out = id_in;
@@ -682,7 +694,7 @@ static u32 __of_msi_map_id(struct device *dev, struct device_node **np,
 	 */
 	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent)
 		if (!of_map_id(parent_dev->of_node, id_in, "msi-map",
-				"msi-map-mask", np, &id_out))
+				"msi-map-mask", msi_np, &id_out))
 			break;
 	return id_out;
 }
@@ -700,7 +712,7 @@ static u32 __of_msi_map_id(struct device *dev, struct device_node **np,
  */
 u32 of_msi_map_id(struct device *dev, struct device_node *msi_np, u32 id_in)
 {
-	return __of_msi_map_id(dev, &msi_np, id_in);
+	return of_msi_xlate(dev, &msi_np, id_in);
 }
 
 /**
@@ -719,7 +731,7 @@ struct irq_domain *of_msi_map_get_device_domain(struct device *dev, u32 id,
 {
 	struct device_node *np = NULL;
 
-	__of_msi_map_id(dev, &np, id);
+	of_msi_xlate(dev, &np, id);
 	return irq_find_matching_host(np, bus_token);
 }
 
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 6337ad4e5fe8..a480063c9cb1 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -54,6 +54,7 @@ extern struct irq_domain *of_msi_map_get_device_domain(struct device *dev,
 							u32 id,
 							u32 bus_token);
 extern void of_msi_configure(struct device *dev, const struct device_node *np);
+extern u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in);
 u32 of_msi_map_id(struct device *dev, struct device_node *msi_np, u32 id_in);
 #else
 static inline void of_irq_init(const struct of_device_id *matches)
@@ -100,6 +101,10 @@ static inline struct irq_domain *of_msi_map_get_device_domain(struct device *dev
 static inline void of_msi_configure(struct device *dev, struct device_node *np)
 {
 }
+static inline u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
+{
+	return id_in;
+}
 static inline u32 of_msi_map_id(struct device *dev,
 				 struct device_node *msi_np, u32 id_in)
 {

-- 
2.48.0


