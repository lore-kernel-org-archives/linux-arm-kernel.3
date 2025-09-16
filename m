Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAA7CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 09:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T5oNgRq/fTvr03Q9owxaLXDfdsQwrjKfP38pRyXacog=; b=QsHakKelNw184oLtYOViKXjkIm
	XkpziFRJem7T4K9vhEUN3g8O7CYfQCKEZaHUpsFfQxY90lxLkBzRECncouF7V2KXzZ4B1kgTsy+EF
	LsUYydqN1hZEt1zvzJljwCaUlztOa4/FnpHjUR5Ezp1jqgi0HwQCghB/kRrP7yoCixVusoChi+3wR
	qMnHP6Z0rbpQgSBZPiZgiMi2Rh7JDeX/lxGR0to/CgYXwna33N63hw/ww9DdniqdPcGO3S0F6Zd/V
	yByfFl2yixl6r4m2aiZBN0BkpF9t9sT0gdVXsmPhRA83dWyzMuQjc4i3oFbVD5LQJhc2IEryzyeBF
	ZIo1+Klg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRq4-00000007LVP-3hSr;
	Tue, 16 Sep 2025 09:19:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRq3-00000007LUo-1kuC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 09:19:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BBDA6013B;
	Tue, 16 Sep 2025 09:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68820C4CEEB;
	Tue, 16 Sep 2025 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758014342;
	bh=qB2g+ZKw2xWUvs4kudjzzew1W4c1a8eYuOTpRkQDpds=;
	h=From:To:Cc:Subject:Date:From;
	b=Hk+ZZzlyxx3MGy8TLfOdkdC2u/ZQjIH5cGi7IH5AnKnDRtVqNnUeM84pRQPzJBujj
	 VcOB3EKTNUAl74KNtprTUCeEkaBLLv5mxbgOOSJLh9QFzDCtHPrWZ7RvmV+XYrL9II
	 LyZ0u1aliYpEr0TyAFAl7YiLaJ4SFHsNnhohg6l9RDHWx4tuZDgUZdXRRm2WBi+VA8
	 johVPGHutqMY4WsNWQL7V+KqBBWMbPx2vs8gP5B4i+yAUeDCq/d1LW+1vfFWKOaAzm
	 onjhGqRExD0Pe3Tab/o+c1OtCUI40hnEAMif/xNUPFnBhODNnK1jtXmcXJveLdY3qi
	 k8BOG99C9SZAw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Rob Herring <robh@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH] of/irq: Add msi-parent check to of_msi_xlate()
Date: Tue, 16 Sep 2025 11:18:58 +0200
Message-ID: <20250916091858.257868-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

In some legacy platforms the MSI controller for a PCI host
bridge is identified by an msi-parent property whose phandle
points at an MSI controller node with no #msi-cells property,
that implicitly means #msi-cells == 0.

For such platforms, mapping a device ID and retrieving the
MSI controller node becomes simply a matter of checking
whether in the device hierarchy there is an msi-parent property
pointing at an MSI controller node with such characteristics.

Add a helper function to of_msi_xlate() to check the msi-parent
property in addition to msi-map and retrieve the MSI controller
node (with a 1:1 ID deviceID-IN<->deviceID-OUT mapping) to
provide support for deviceID mapping and MSI controller node
retrieval for such platforms.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/of/irq.c | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index e7c12abd10ab..d0e2dfd0ee28 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -670,6 +670,35 @@ void __init of_irq_init(const struct of_device_id *matches)
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
@@ -677,7 +706,7 @@ void __init of_irq_init(const struct of_device_id *matches)
  * @id_in: Device ID.
  *
  * Walk up the device hierarchy looking for devices with a "msi-map"
- * property. If found, apply the mapping to @id_in.
+ * or "msi-parent" property. If found, apply the mapping to @id_in.
  * If @msi_np points to a non-NULL device node pointer, only entries targeting
  * that node will be matched; if it points to a NULL value, it will receive the
  * device node of the first matching target phandle, with a reference held.
@@ -691,12 +720,15 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
 
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
2.48.0


