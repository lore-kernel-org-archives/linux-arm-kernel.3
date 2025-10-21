Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45690CCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FhEdNR91OB7wHcY6CjzagXtafaTpzSURfdhhSy48Jk=; b=j9ZmHxH3AQxs5yjtHgoHbTN/Ru
	voFnhnZ6klLE2+sKLWL6+YycZ7Xj7WKjn4giPD8VNvzik2QxQlOZIk5JZPTr/xvx/ZPCWyHxBsaVE
	BZJrdUcy7mgXiH9wUBkbMJcY2yTH8D5oD3laKA5/A0tGbxsk6sCEwuMSS7f/++96SSIfNuKljQvN6
	zzyy6+1UahsKjzqOvPzwlS6B0z34LTDa4mof4FT2Vc0Ty3oDqxOH1vYgyp+BUqlFB2z+uVwId6uls
	3hmGbeTv0rkGuL7nMrUwnQmivP62NqjWTU+3kQ+V8KE9YNmlIt5qj289IZOxlHs/gUkVbCsaAqwbi
	aCkIZRpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBfy-0000000H06T-31lG;
	Tue, 21 Oct 2025 12:41:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBfw-0000000H049-1P9O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:41:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CBBF14525C;
	Tue, 21 Oct 2025 12:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F63DC4CEF1;
	Tue, 21 Oct 2025 12:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761050475;
	bh=r/G+FZpStTM0vbk0p20owxrN91C3+v6SvIg6ZwkVinQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t41wDtyCzusMv2f+XoJcJNP2U1VOcNslC7ZTMSGIYkeb6Vl21CxUDNgiibrqabq/l
	 Mc/GWVrBmnGLkZ5dMromcl0cQqI+KCJmRW64VL1pplho/ol8QclamFtQcA5wQcyT4c
	 vPS74W86Izx13lDO4yX+6zTHbTaVFtoQ8KG5Y/Vgd7d5Y8GX8R3MgYEMNZyVetUhTP
	 4pp+xS5o9KXvAJmwntx+ba48Nzobun9OHjtwvomac5wL5e/iUzhLDI7pgleO8EnIYu
	 wk/tbxYn6GGKobMswLSa+EZVe1vAw47vYL4zlD00yZJAWd6PDNxrIUmpA5A43KJK0k
	 iZup1PZMdPLgg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Rob Herring <robh@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ray Jui <rjui@broadcom.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: [PATCH v4 1/5] of/irq: Add msi-parent check to of_msi_xlate()
Date: Tue, 21 Oct 2025 14:40:59 +0200
Message-ID: <20251021124103.198419-2-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021124103.198419-1-lpieralisi@kernel.org>
References: <20251021124103.198419-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_054116_409941_26E071D4 
X-CRM114-Status: GOOD (  19.15  )
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

In some legacy platforms the MSI controller for a PCI host bridge is
identified by an msi-parent property whose phandle points at an MSI
controller node with no #msi-cells property, that implicitly
means #msi-cells == 0.

For such platforms, mapping a device ID and retrieving the MSI controller
node becomes simply a matter of checking whether in the device hierarchy
there is an msi-parent property pointing at an MSI controller node with
such characteristics.

Add a helper function to of_msi_xlate() to check the msi-parent property in
addition to msi-map and retrieve the MSI controller node (with a 1:1 ID
deviceID-IN<->deviceID-OUT  mapping) to provide support for deviceID
mapping and MSI controller node retrieval for such platforms.

Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/of/irq.c | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 65c3c23255b7..321d40ec229b 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -671,6 +671,36 @@ void __init of_irq_init(const struct of_device_id *matches)
 	}
 }
 
+static int of_check_msi_parent(struct device_node *dev_node, struct device_node **msi_node)
+{
+	struct of_phandle_args msi_spec;
+	int ret;
+
+	/*
+	 * An msi-parent phandle with a missing or == 0 #msi-cells
+	 * property identifies a 1:1 ID translation mapping.
+	 *
+	 * Set the msi controller node if the firmware matches this
+	 * condition.
+	 */
+	ret = of_parse_phandle_with_optional_args(dev_node, "msi-parent", "#msi-cells",
+						  0, &msi_spec);
+	if (ret)
+		return ret;
+
+	if ((*msi_node && *msi_node != msi_spec.np) || msi_spec.args_count != 0)
+		ret = -EINVAL;
+
+	if (!ret) {
+		/* Return with a node reference held */
+		*msi_node = msi_spec.np;
+		return 0;
+	}
+	of_node_put(msi_spec.np);
+
+	return ret;
+}
+
 /**
  * of_msi_xlate - map a MSI ID and find relevant MSI controller node
  * @dev: device for which the mapping is to be done.
@@ -678,7 +708,7 @@ void __init of_irq_init(const struct of_device_id *matches)
  * @id_in: Device ID.
  *
  * Walk up the device hierarchy looking for devices with a "msi-map"
- * property. If found, apply the mapping to @id_in.
+ * or "msi-parent" property. If found, apply the mapping to @id_in.
  * If @msi_np points to a non-NULL device node pointer, only entries targeting
  * that node will be matched; if it points to a NULL value, it will receive the
  * device node of the first matching target phandle, with a reference held.
@@ -692,12 +722,15 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
 
 	/*
 	 * Walk up the device parent links looking for one with a
-	 * "msi-map" property.
+	 * "msi-map" or an "msi-parent" property.
 	 */
-	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent)
+	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
 		if (!of_map_id(parent_dev->of_node, id_in, "msi-map",
 				"msi-map-mask", msi_np, &id_out))
 			break;
+		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
+			break;
+	}
 	return id_out;
 }
 
-- 
2.50.1


