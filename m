Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E52C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6SQvoA/hsmf1DwxqNw3StjNX9OkY0Jq4rZHFA/ExSA=; b=L9Wt8k1cKfTGCa1zycBOlVK7qH
	ghNA2v/suDKHIiubBOkcd2ML2LftZfRl/n7VF4VE8xbsNPVk4EdunYKWQJvNsHCoeVF8GWcBNvPwW
	Ua6J5DiYtus/5IFvxs4Ye91WAYwj5bAt4CGoLcskPKBdCHmV+QePaNn6l+Qt2ob6GRtmZKaw6j/Gw
	X64a7704Pn7qNvyBDligCxtw5qpZGXFiwP1x8f5tx0DjbWHYCPsEhzNtfR3sichfa35LTaY8kP7Rb
	8I2PKEyz0nJ0Bc0b5efB1i8BFX0FePzPnM38bRLKkGyzUrsjGXAYvk3rp55fQL4xc5AlSA9VP/giN
	lQnWB0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsfu-0000000CxzK-0njG;
	Tue, 13 May 2025 16:40:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsXp-0000000Cvuz-1yH3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:31:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B19E4629E9;
	Tue, 13 May 2025 16:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628CAC4CEF4;
	Tue, 13 May 2025 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747153912;
	bh=WVNzJ1QslGOZvrM8+INHuUbrNxIwVxMRLbrLof8UGE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h9kMzXXDBuRa3vfoSYnrhhdB5pvIx2WCKZ71M0Pmc2Lept3bgCBcto6sgWuvVOqro
	 bBcP5w5R2OtBt//zq3TGAw24/hnSQcAUBq0MDr0LiyVbOtAR02KfPej14Aey3jH/4t
	 hC2A/uBZasZ8xAw7a09lCVCzznRqJ9nEgWmNctrkza/7yBewxiIDQhxWfqP9neKFVA
	 NLY8E9bYBe0hrXcqDdiTDMJ3DHOxPRUWSffMDrUoQcfklHtrg3+xkGh7jhR7m01zSj
	 ZvKOIaFI4A8l8H5fzHJi9OiKWFr5ra38eRKnk/xoZkkT1Bk8DSc3ar50F4KdFRE0Kc
	 mX5Jj+HKhMtOw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEsXm-00EaLc-Ba;
	Tue, 13 May 2025 17:31:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH v2 3/5] genirq/msi: Move prepare() call to per-device allocation
Date: Tue, 13 May 2025 17:31:42 +0100
Message-Id: <20250513163144.2215824-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250513163144.2215824-1-maz@kernel.org>
References: <20250513163144.2215824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, lpieralisi@kernel.org, sascha.bischoff@arm.com, timothy.hayes@arm.com
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

The current device MSI infrastructure is subtly broken, as it
will issue an .msi_prepare() callback into the MSI controller
driver every time it needs to allocate an MSI. That's pretty wrong,
as the contract (or unwarranted assumption, depending who you ask)
between the MSI controller and the core code is that .msi_prepare()
is called exactly once per device.

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
 kernel/irq/msi.c    | 35 +++++++++++++++++++++++++++++++----
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index 63c23003ec9b7..ba1c77a829a1c 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -516,12 +516,14 @@ struct msi_domain_info {
  * @chip:	Interrupt chip for this domain
  * @ops:	MSI domain ops
  * @info:	MSI domain info data
+ * @alloc_info:	MSI domain allocation data (arch specific)
  */
 struct msi_domain_template {
 	char			name[48];
 	struct irq_chip		chip;
 	struct msi_domain_ops	ops;
 	struct msi_domain_info	info;
+	msi_alloc_info_t	alloc_info;
 };
 
 /*
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 31378a2535fb9..07eb857efd15e 100644
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
@@ -1023,6 +1024,7 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
 	bundle->info.ops = &bundle->ops;
 	bundle->info.data = domain_data;
 	bundle->info.chip_data = chip_data;
+	bundle->info.alloc_data = &bundle->alloc_info;
 
 	pops = parent->msi_parent_ops;
 	snprintf(bundle->name, sizeof(bundle->name), "%s%s-%s",
@@ -1061,11 +1063,18 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
 	if (!domain)
 		return false;
 
+	domain->dev = dev;
+	dev->msi.data->__domains[domid].domain = domain;
+
+	if (msi_domain_prepare_irqs(domain, dev, hwsize, &bundle->alloc_info)) {
+		dev->msi.data->__domains[domid].domain = NULL;
+		irq_domain_remove(domain);
+		return false;
+	}
+
 	/* @bundle and @fwnode_alloced are now in use. Prevent cleanup */
 	retain_and_null_ptr(bundle);
 	retain_and_null_ptr(fwnode_alloced);
-	domain->dev = dev;
-	dev->msi.data->__domains[domid].domain = domain;
 	return true;
 }
 
@@ -1232,6 +1241,24 @@ static int msi_init_virq(struct irq_domain *domain, int virq, unsigned int vflag
 	return 0;
 }
 
+static int populate_alloc_info(struct irq_domain *domain, struct device *dev,
+			       unsigned int nirqs, msi_alloc_info_t *arg)
+{
+	struct msi_domain_info *info = domain->host_data;
+
+	/*
+	 * If the caller has provided a template alloc info, use that. Once
+	 * all users of msi_create_irq_domain() have been eliminated, this
+	 * should be the only source of allocation information, and the
+	 * prepare call below should be finally removed.
+	 */
+	if (!info->alloc_data)
+		return msi_domain_prepare_irqs(domain, dev, nirqs, arg);
+
+	*arg = *info->alloc_data;
+	return 0;
+}
+
 static int __msi_domain_alloc_irqs(struct device *dev, struct irq_domain *domain,
 				   struct msi_ctrl *ctrl)
 {
@@ -1244,7 +1271,7 @@ static int __msi_domain_alloc_irqs(struct device *dev, struct irq_domain *domain
 	unsigned long idx;
 	int i, ret, virq;
 
-	ret = msi_domain_prepare_irqs(domain, dev, ctrl->nirqs, &arg);
+	ret = populate_alloc_info(domain, dev, ctrl->nirqs, &arg);
 	if (ret)
 		return ret;
 
-- 
2.39.2


