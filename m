Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37909C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 16:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPCGxIUYl4POIr9N0NKrm5SUrmGGDmP+r/3eqJJEr64=; b=jpGYSPiVKvPosvRVCv9QclVsW+
	I0x9GhZfFaWJKHp48V265i4vdU565Dhg31tD+ByHUPUc5pBSXCQhG1A+jEWruLT0YLNZJ4KmopD6q
	nyhDPk6K6DnUR2LE11L/K1iM8bC2VKflwavNOCnGBBp0RMi3ZrAtbGtKamWx2tN8RNFyfyouT9wCB
	CuwXKiX+T4zSUzDbhWyrngG6HaQcX3AVLJREfEZHAA5GtuI7Oe0YZrD8GUt1hmzUUFxztAjTuTjQD
	0PSJSAYbZ5NpkWIsySNzG2uqx3jHkyo0a93rFGwqXed2xGjCsUuXaVaqJqrGj2Xe5V8fkEmkxgNO6
	3RSn/9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9nY-00000007XpJ-3MGK;
	Sun, 11 May 2025 16:45:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9eD-00000007WHv-05AU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 16:35:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 612B2A4BA19;
	Sun, 11 May 2025 16:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016D6C4CEF0;
	Sun, 11 May 2025 16:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746981327;
	bh=WM4iVRpLhz+0Y4LZdK+pjtHeHUh/P8d+elq7ZVpAd8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t4Alog4WA6uqvAd2IOMp0V2SmzhOtQhADFTx/KQTmEkcfvur5HmNd0mTB9/E6i8to
	 mJSikDZOWrAEvS7HC6oFDzinJ9LToFXH7J3RMCJi/j2/qTpr2LjtlB5AmsL585VZaw
	 FLe1DdnwFnm8AojwebaMPmcaDZUKKe9Y+xz75ihAPPk8d0/v97PzJt2to40NMSDAKz
	 ULf56oicYum7pxGKeMrqpLqG3YA0Vn5Rdkito0hsfkLdrWejs/aA0G94Y8HiPz0CuR
	 xX6tv25/gY1U39EcyPaImQp58R/jjEcaaAwPwQx6C9fbUxwyusUIGL2Hm0vFSodNS9
	 B2xeYZZ/3cXlg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uE9e9-00Dt22-4V;
	Sun, 11 May 2025 17:35:25 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH 3/4] genirq/msi: Move prepare() call to per-device allocation
Date: Sun, 11 May 2025 17:35:19 +0100
Message-Id: <20250511163520.1307654-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250511163520.1307654-1-maz@kernel.org>
References: <20250511163520.1307654-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, lpieralisi@kernel.org, sascha.bischoff@arm.com, timothy.hayes@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_093529_202851_B86B3DE2 
X-CRM114-Status: GOOD (  23.79  )
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

The current device MSI infrastructure is subtly broken, as it
will issue an .msi_prepare() callback into the MSI controller
driver every time it needs to allocate an MSI. That's pretty wrong,
as the contract between the MSI controller and the core code is that
.msi_prepare() is called exactly once per device.

This leads to some subtle breakage in said MSI controller drivers,
as it gives the impression that there are multiple endpoints sharing
a bus identifier (RID in PCI parlance, DID for GICv3+). It implies
that whatever allocation the ITS driver (for example) has done on
behalf of these devices cannot be undone, as there is no way to
track the shared state. This is particularly bad for wire-MSI devices,
for which .msi_prepare() is called for. each. input. line.

To address this issue, move the call to .msi_prepare() to take place
at the point of irq domain allocation, which is the only place that
makes sense. The msi_alloc_info_t structure is made part of the
msi_domain_template, so that its life-cycle is that of the domain
as well.

Finally, the msi_info::alloc_data field is made to point at this
allocation tracking structure, ensuring that it is carried around
the block.

This is all pretty straightforward, except for the non-device-MSI
leftovers, which still have to call .msi_prepare() at the old
spot. One day...

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/msi.h |  2 ++
 kernel/irq/msi.c    | 39 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index 0a44a2cba3105..68a8b2d03eba9 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -513,12 +513,14 @@ struct msi_domain_info {
  * @chip:	Interrupt chip for this domain
  * @ops:	MSI domain ops
  * @info:	MSI domain info data
+ * @arg:	MSI domain allocation data (arch specific)
  */
 struct msi_domain_template {
 	char			name[48];
 	struct irq_chip		chip;
 	struct msi_domain_ops	ops;
 	struct msi_domain_info	info;
+	msi_alloc_info_t	arg;
 };
 
 /*
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index a65ccf19b15d9..b8dc3289958c6 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -59,7 +59,8 @@ struct msi_ctrl {
 static void msi_domain_free_locked(struct device *dev, struct msi_ctrl *ctrl);
 static unsigned int msi_domain_get_hwsize(struct device *dev, unsigned int domid);
 static inline int msi_sysfs_create_group(struct device *dev);
-
+static int msi_domain_prepare_irqs(struct irq_domain *domain, struct device *dev,
+				   int nvec, msi_alloc_info_t *arg);
 
 /**
  * msi_alloc_desc - Allocate an initialized msi_desc
@@ -1025,6 +1026,7 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
 	bundle->info.ops = &bundle->ops;
 	bundle->info.data = domain_data;
 	bundle->info.chip_data = chip_data;
+	bundle->info.alloc_data = &bundle->arg;
 
 	pops = parent->msi_parent_ops;
 	snprintf(bundle->name, sizeof(bundle->name), "%s%s-%s",
@@ -1053,21 +1055,28 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
 	msi_lock_descs(dev);
 
 	if (WARN_ON_ONCE(msi_get_device_domain(dev, domid)))
-		goto fail;
+		goto fail_unlock;
 
 	if (!pops->init_dev_msi_info(dev, parent, parent, &bundle->info))
-		goto fail;
+		goto fail_unlock;
 
 	domain = __msi_create_irq_domain(fwnode, &bundle->info, IRQ_DOMAIN_FLAG_MSI_DEVICE, parent);
 	if (!domain)
-		goto fail;
+		goto fail_unlock;
 
 	domain->dev = dev;
 	dev->msi.data->__domains[domid].domain = domain;
+
+	if (msi_domain_prepare_irqs(domain, dev, hwsize, &bundle->arg))
+		goto fail;
+
 	msi_unlock_descs(dev);
 	return true;
 
 fail:
+	dev->msi.data->__domains[domid].domain = NULL;
+	irq_domain_remove(domain);
+fail_unlock:
 	msi_unlock_descs(dev);
 free_fwnode:
 	irq_domain_free_fwnode(fwnalloced);
@@ -1250,6 +1259,26 @@ static int msi_init_virq(struct irq_domain *domain, int virq, unsigned int vflag
 	return 0;
 }
 
+static int __populate_alloc_info(struct irq_domain *domain, struct device *dev,
+				 unsigned int nirqs, msi_alloc_info_t *arg)
+{
+	struct msi_domain_info *info = domain->host_data;
+	int ret = 0;
+
+	/*
+	 * If the caller has provided a template alloc info, use that. Once
+	 * all users of msi_create_irq_domain() have been eliminated, this
+	 * should be the only source of allocation information, and the
+	 * prepare call below should be finally removed.
+	 */
+	if (info->alloc_data)
+		*arg = *info->alloc_data;
+	else
+		ret = msi_domain_prepare_irqs(domain, dev, nirqs, arg);
+
+	return ret;
+}
+
 static int __msi_domain_alloc_irqs(struct device *dev, struct irq_domain *domain,
 				   struct msi_ctrl *ctrl)
 {
@@ -1262,7 +1291,7 @@ static int __msi_domain_alloc_irqs(struct device *dev, struct irq_domain *domain
 	unsigned long idx;
 	int i, ret, virq;
 
-	ret = msi_domain_prepare_irqs(domain, dev, ctrl->nirqs, &arg);
+	ret = __populate_alloc_info(domain, dev, ctrl->nirqs, &arg);
 	if (ret)
 		return ret;
 
-- 
2.39.2


