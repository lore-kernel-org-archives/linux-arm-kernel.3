Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C16CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 09:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/m1Yzk4uIaA+Lqmgb22BCrbjL7vVHnbMItGeATIi4Jc=; b=KWhpc7xUk9hyCb7s/kY/pZXlob
	zz+yAu4Bq5J34+VlsoFkzzwGoMPgfFUu5oEybDznbm/9W7ldwk/hHvZMIqk3JUtxzuNe97dvE+XjB
	el3j5D5UKRbOZP6If3FRVI9LUa3EuY8m9oQwYdiGe631dKtMtGFz8h88c9BH10Fzh2iCtQdaP5G3H
	Xwd4HfnbHcJM5T6cZ7+GRrccPDuMMqCwI7JN6rDnudrkiNG742ayCgMWjs/5DOH9uga7VQtP+7SB8
	q44VLbVI+jd3IY0cPC70KnufrKfAU/9qjhk4ACL0GJxTAeKbcD+SqXE35Y6FsSmlUfppy0F3f6+97
	KP/mWuuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bo2-0000000FqMi-1mDB;
	Tue, 14 Oct 2025 09:58:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bo0-0000000FqLU-1AyY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 09:58:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0190B48794;
	Tue, 14 Oct 2025 09:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160DBC4CEFE;
	Tue, 14 Oct 2025 09:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760435935;
	bh=Pz/+OnScQH57lMVcQRcBDaL0cFCYDLZVarTyxcsqluU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=edoqiV/k6P/4eC65o+fGDDwFlqeSjogcWgXII7+/HSoXlyV+dVySXOkP951zajF1S
	 xSqlCB8VMUB/7DJUfLTnq4l8LetnDf95Se05UWSLoVaKkMmZkXqit/GUwMQ4XYkVh7
	 KbDpR4boCDapn1e1kPWP93/TYt99EAoIeFdgeRLiW9AuZVBFPmJMS86Em077WVIQuk
	 Em5p7L+9Atl1BdIhUa6Gx5uCvoeBXlOdDyCEXo/kZ2PjyIcBebc7LJLr4hvJwM+KWO
	 jwVSIQzQkSffP3QBaV6ZbWTo2Wty8jOl6WIiPZKX9dgKtlblkGfOEH3yUc5epe7lNC
	 xwVoE1jPGaQvA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Rob Herring <robh@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ray Jui <rjui@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: [PATCH v2 1/4] of/irq: Add msi-parent check to of_msi_xlate()
Date: Tue, 14 Oct 2025 11:58:42 +0200
Message-ID: <20251014095845.1310624-2-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014095845.1310624-1-lpieralisi@kernel.org>
References: <20251014095845.1310624-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_025856_358916_226C307B 
X-CRM114-Status: GOOD (  18.86  )
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
controller node with no #msi-cells property, that implicitly means

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
Cc: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/of/irq.c | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 65c3c23255b7..e67b2041e73b 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -671,6 +671,35 @@ void __init of_irq_init(const struct of_device_id *matches)
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
+	if (!ret) {
+		if ((*msi_node && *msi_node != msi_spec.np) || msi_spec.args_count != 0)
+			ret = -EINVAL;
+
+		if (!ret) {
+			/* Return with a node reference held */
+			*msi_node = msi_spec.np;
+			return 0;
+		}
+		of_node_put(msi_spec.np);
+	}
+
+	return ret;
+}
+
 /**
  * of_msi_xlate - map a MSI ID and find relevant MSI controller node
  * @dev: device for which the mapping is to be done.
@@ -678,7 +707,7 @@ void __init of_irq_init(const struct of_device_id *matches)
  * @id_in: Device ID.
  *
  * Walk up the device hierarchy looking for devices with a "msi-map"
- * property. If found, apply the mapping to @id_in.
+ * or "msi-parent" property. If found, apply the mapping to @id_in.
  * If @msi_np points to a non-NULL device node pointer, only entries targeting
  * that node will be matched; if it points to a NULL value, it will receive the
  * device node of the first matching target phandle, with a reference held.
@@ -692,12 +721,15 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
 
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


