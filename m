Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873F9E9A04D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AzTzakBXerpsFjmK9f4GscJ93oBNHKLNJxS8JXaUyM=; b=nEYOhQKJeWp2lYO5vYF5V7DUiP
	XOeGOcZLjJkVpUr0u0RcQPIqtVV7tWgX5xMuHFqAJknzVzjp9XfF9oAcOx8rAtHF/dKGpeVcozHfH
	QiQ5hbM807PmQv5SRWAKH5+CCAwMPapsebaOGkbpcYqjVD/yqxKarPO3LtB2dpsrwqm41u8Z4KqWo
	yyzgCrOd725gWPidaQEQY94UvSWXBGjntPgWKUj9/7uxuoBwXe8w46eaMKcCY9m1EH2o01Ie+aogm
	3Ha/QY86tX2d2XkeUCUcZecjvkgVIQvy6hfGrmY5zoTWwR8JawEXc3SS/n5S7dH9E/Hju5wOpjgpQ
	A+0O3pNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshyO-00000009uAi-3QXB;
	Wed, 18 Feb 2026 13:52:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshyM-00000009u9I-0kM6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:52:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 914B56185F;
	Wed, 18 Feb 2026 13:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436D8C2BC86;
	Wed, 18 Feb 2026 13:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771422729;
	bh=KGxbgKznSWXiSbtw2Mu7H6wWeyOpFU6lUGSUuf6OwBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RAfebbQ5ZZNQ4Vkivk5kyjKdaRezd24cEthU11fmD7QgmdjD6oIZG5z2uRvdVVxa5
	 2ijsTJczGj8EXDSaxVKNIDc/oTBw1kgzaNeIKm+Xpdta6U4vtsEoSN+vonl49kY+Bs
	 57xZY5WkDb6Xu7EbkQqyLoaInIyQRKdsKElNK5svy7Fe+yYIJzrvK6wQqbvDGagapj
	 0+Gn7T5Jy4E+q+ARQCiXKumPJ8CIdMx5F2SzxXnDH/Da/il/TXX1KvnCc2X+a9L+le
	 nxMNdstjxOoiGFkjjCWDfynFIMGztfZ+mhqBud7CRt3uVcfDh4+Lrmaw7dyxrba3DV
	 4Tupp0uDWolew==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vshyJ-0000000Bu02-0M2C;
	Wed, 18 Feb 2026 13:52:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] fsl_mc: Add minimal infrastructure to use platform MSI
Date: Wed, 18 Feb 2026 13:51:59 +0000
Message-ID: <20260218135203.2267907-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218135203.2267907-1-maz@kernel.org>
References: <20260218135203.2267907-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ioana.ciornei@nxp.com, tglx@kernel.org, chleroy@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Add the tiny bit of infrastructure to be able to use platform MSI
instead of the current hack. This means providing a write_msi_msg
callback, as well as irq domain and devid retrieval helpers.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/bus/fsl-mc/fsl-mc-msi.c     | 50 ++++++++++++++++++++++++-----
 drivers/bus/fsl-mc/fsl-mc-private.h |  1 +
 include/linux/fsl/mc.h              |  2 ++
 3 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-msi.c b/drivers/bus/fsl-mc/fsl-mc-msi.c
index 82cd69f7884c6..c9f50969e88ce 100644
--- a/drivers/bus/fsl-mc/fsl-mc-msi.c
+++ b/drivers/bus/fsl-mc/fsl-mc-msi.c
@@ -110,13 +110,8 @@ static void __fsl_mc_msi_write_msg(struct fsl_mc_device *mc_bus_dev,
 	}
 }
 
-/*
- * NOTE: This function is invoked with interrupts disabled
- */
-static void fsl_mc_msi_write_msg(struct irq_data *irq_data,
-				 struct msi_msg *msg)
+static void fsl_mc_write_msi_msg(struct msi_desc *msi_desc, struct msi_msg *msg)
 {
-	struct msi_desc *msi_desc = irq_data_get_msi_desc(irq_data);
 	struct fsl_mc_device *mc_bus_dev = to_fsl_mc_device(msi_desc->dev);
 	struct fsl_mc_bus *mc_bus = to_fsl_mc_bus(mc_bus_dev);
 	struct fsl_mc_device_irq *mc_dev_irq =
@@ -130,6 +125,17 @@ static void fsl_mc_msi_write_msg(struct irq_data *irq_data,
 	__fsl_mc_msi_write_msg(mc_bus_dev, mc_dev_irq, msi_desc);
 }
 
+/*
+ * NOTE: This function is invoked with interrupts disabled
+ */
+static void fsl_mc_msi_write_msg(struct irq_data *irq_data,
+				 struct msi_msg *msg)
+{
+	struct msi_desc *msi_desc = irq_data_get_msi_desc(irq_data);
+
+	fsl_mc_write_msi_msg(msi_desc, msg);
+}
+
 static void fsl_mc_msi_update_chip_ops(struct msi_domain_info *info)
 {
 	struct irq_chip *chip = info->chip;
@@ -209,6 +215,20 @@ struct irq_domain *fsl_mc_find_msi_domain(struct device *dev)
 	return msi_domain;
 }
 
+struct irq_domain *fsl_mc_get_msi_parent(struct device *dev)
+{
+	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
+	struct device *root_dprc_dev;
+	struct device *bus_dev;
+
+	fsl_mc_get_root_dprc(dev, &root_dprc_dev);
+	bus_dev = root_dprc_dev->parent;
+
+	return (bus_dev->of_node ?
+		of_msi_get_domain(bus_dev, bus_dev->of_node, DOMAIN_BUS_NEXUS) :
+		iort_get_device_domain(bus_dev, mc_dev->icid, DOMAIN_BUS_NEXUS));
+}
+
 int fsl_mc_msi_domain_alloc_irqs(struct device *dev,  unsigned int irq_count)
 {
 	int error = msi_setup_device_data(dev);
@@ -220,8 +240,10 @@ int fsl_mc_msi_domain_alloc_irqs(struct device *dev,  unsigned int irq_count)
 	 * NOTE: Calling this function will trigger the invocation of the
 	 * its_fsl_mc_msi_prepare() callback
 	 */
-	error = msi_domain_alloc_irqs_range(dev, MSI_DEFAULT_DOMAIN, 0, irq_count - 1);
-
+	if (!irq_domain_is_msi_parent(dev_get_msi_domain(dev)))
+		error = msi_domain_alloc_irqs_range(dev, MSI_DEFAULT_DOMAIN, 0, irq_count - 1);
+	else
+		error = platform_device_msi_init_and_alloc_irqs(dev, irq_count, fsl_mc_write_msi_msg);
 	if (error)
 		dev_err(dev, "Failed to allocate IRQs\n");
 	return error;
@@ -231,3 +253,15 @@ void fsl_mc_msi_domain_free_irqs(struct device *dev)
 {
 	msi_domain_free_irqs_all(dev, MSI_DEFAULT_DOMAIN);
 }
+
+u32 fsl_mc_get_msi_id(struct device *dev)
+{
+	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
+	struct device *root_dprc_dev;
+
+	fsl_mc_get_root_dprc(dev, &root_dprc_dev);
+
+	return (root_dprc_dev->parent->of_node ?
+		of_msi_xlate(dev, NULL, mc_dev->icid) :
+		iort_msi_map_id(dev, mc_dev->icid));
+}
diff --git a/drivers/bus/fsl-mc/fsl-mc-private.h b/drivers/bus/fsl-mc/fsl-mc-private.h
index beed4c53533d8..44868f874fd66 100644
--- a/drivers/bus/fsl-mc/fsl-mc-private.h
+++ b/drivers/bus/fsl-mc/fsl-mc-private.h
@@ -642,6 +642,7 @@ int fsl_mc_msi_domain_alloc_irqs(struct device *dev,
 void fsl_mc_msi_domain_free_irqs(struct device *dev);
 
 struct irq_domain *fsl_mc_find_msi_domain(struct device *dev);
+struct irq_domain *fsl_mc_get_msi_parent(struct device *dev);
 
 int __must_check fsl_create_mc_io(struct device *dev,
 				  phys_addr_t mc_portal_phys_addr,
diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index 897d6211c1635..bcc38c0fc230a 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -361,9 +361,11 @@ int mc_send_command(struct fsl_mc_io *mc_io, struct fsl_mc_command *cmd);
 
 #ifdef CONFIG_FSL_MC_BUS
 #define dev_is_fsl_mc(_dev) ((_dev)->bus == &fsl_mc_bus_type)
+u32 fsl_mc_get_msi_id(struct device *dev);
 #else
 /* If fsl-mc bus is not present device cannot belong to fsl-mc bus */
 #define dev_is_fsl_mc(_dev) (0)
+#define fsl_mc_get_msi_id(_dev)	(0)
 #endif
 
 /* Macro to check if a device is a container device */
-- 
2.47.3


