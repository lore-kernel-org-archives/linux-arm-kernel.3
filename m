Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB01AC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yc0JE0Vzq3rvPR+d2ExHUD5Fgze3IR9FEptJkqrp6Yk=; b=0k344EadnHDcoBX/aVmIn1YORs
	qEMChRZczMHWuFF/4nD7RgYjeFLNkqSASjNh5WwPiTKp3ouaJCUEBg2OPSywSRdf6tcwmWhr49hEv
	1e4jXMPkTiORqxRPUHJu6KBJ0ZR7ideb4C/de1LMajEn9VRyMs5dERcJ3Y2uN5+TXC/tjVVARO2dd
	JfZzr/SQCYdy9nG+gyoAuc4oX1AlnCHWJMHzw05IQmNqiiBHv9DgTlVgA+A8t7r4kU3LOaHfxVOMG
	ltwZZLLS0YwooR7eMo0HUbHbOZLmZlQZuB1BWU096EgDiwGjC3eywPIZXejFCr+BlWsLbNVOIzRJi
	kkmR9eRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkx6-0000000BRFv-21gC;
	Thu, 26 Jun 2025 11:39:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjqM-0000000BHPT-3E4y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 10:28:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CEFEC5C6692;
	Thu, 26 Jun 2025 10:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A67CC4CEEE;
	Thu, 26 Jun 2025 10:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750933714;
	bh=eRi7cgKtm7Hi83Dms6X9G6hUMNMcr8aq7kDLX+cs8k0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AaSTU0ON63d9u0kaKt7uvaiiDvjwqzapfYhPLgKPC4AW8OUwqHD142e6btpx8cWh4
	 71fhZ+yEiNG0Ok3FtJ3fkQCq2lX3h4e9KH+kyTqoymEffcgIbSBc4YvydG95JPgaKN
	 OEwHvBYhS8HA2OJFVnya4sOqznGBiif6OKuwBXQmEU/ffjn7udFVpq6CDq+vOVgnaM
	 NZ5vTSH33BI6QdCPZAbBGnUhPkq1Bwntzh1iLD4/epMPj2yKD7hmI+34LSyrlFW4HM
	 GjZKx3uMmdPo3N9RLO7VFwL/2GK6ZIaqeSWiKFXly9YzjxR4rgz7/gTcI+x5u4Hsj+
	 CWSdRLAmXbXlA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 26 Jun 2025 12:26:15 +0200
Subject: [PATCH v6 24/31] of/irq: Add of_msi_xlate() helper function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-gicv5-host-v6-24-48e046af4642@kernel.org>
References: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
In-Reply-To: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_032834_901744_CAA39667 
X-CRM114-Status: GOOD (  15.59  )
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


