Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379BCC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 15:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RUidHi7AUTKhMLQFlQC/0IQeKDmIs/tIHkWgH++nWfQ=; b=hgBiCUxTl4rxVE2rahaEvTVLlQ
	P+m5KYO7sod0eR7P9ZG6f3N8C0Q6+Ac6QaqVqjHmrdKkKMyMTrQBbgLugMkrShESJPPfwT8kN4UPF
	i1z8IAyL9x5U97HmxG1i9Kl2tyP57VNp/ZHLkjTWAeCfZpD58nOmuXZjaLFtbPYIZCLHyPOP6xxTs
	YZoqHbK71b0vbjT7G9r9gKo10qaK0P5xohPJAV4gvBk14/cRAoKAtbr3K7FQbH+yq6oTbl8wj4D9t
	mBaL8dH3TN6+thu+6HmSqx/3RGhgYnGCahZU0SIduV8f2n3sx1B6yBBmL49ua8WJtp7ll62EPPdYz
	oULaMEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTZ5-0000000BHXm-0QZB;
	Tue, 03 Jun 2025 15:28:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSSv-0000000B9Jm-28ZE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 14:18:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBF4E5C5790;
	Tue,  3 Jun 2025 14:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62288C4CEED;
	Tue,  3 Jun 2025 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748960288;
	bh=lUFGuC5ycdcnI5caajtZ9t5Zj3/9mRBKp3NDiUwuLWI=;
	h=From:To:Cc:Subject:Date:From;
	b=sgipLgsomXQr5yJk2XUmUkEV51djBPrldROzvsO2rwa6QsBFE6sacVDIZF3IppF2v
	 LKHaqseAjjKnwvNqsokboTlK3NgOc+IbLaeCFNrbq7u+yQTf/jcQ1PyXY3rNnIAYQb
	 Aj6I2ONBI4KmVg+oxkV30PAIfs+zbDtTdzUq4fiH0+nUHeIjBl2FrbGcRs7vheQYVq
	 STsip0Nsljjv7ru2iZiVkYv7SL6Hi7LeDhsBGhWYEzch+dv8vzQcMZy67OpxWMaWMp
	 Ht1dOyY5zie3FXqktEPtZdb+BQsHyGgQL6Agxhe/fdxIIZ46pOPhAaE7dcDqLBAyG7
	 sI4P0V7sOqsYQ==
Received: from [149.88.19.236] (helo=localhost.localdomain)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uMSSs-002rPF-4s;
	Tue, 03 Jun 2025 15:18:06 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] PCI/MSI: Size device MSI domain with the maximum number of vectors
Date: Tue,  3 Jun 2025 15:18:01 +0100
Message-ID: <20250603141801.915305-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 149.88.19.236
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, lpieralisi@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_071809_633578_329A65E6 
X-CRM114-Status: GOOD (  18.27  )
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

Zenghui reports that since 1396e89e09f0 ("genirq/msi: Move prepare()
call to per-device allocation"), his Multi-MSI capable device isn't
working anymore.

This is a consequence of 15c72f824b32 ("PCI/MSI: Add support for
per device MSI[X] domains"), which always creates a MSI domain of
size 1, even in the presence of Multi-MSI.

While this was somehow working until then, moving the .prepare()
call ends up sizing the ITS table with a tiny value for this device,
and making the endpoint driver unhappy.

Instead, always create the domain (and call the .prepare() helper)
with the maximum expected size.

Fixes: 1396e89e09f0 ("genirq/msi: Move prepare() call to per-device allocation")
Fixes: 15c72f824b32 ("PCI/MSI: Add support for per device MSI[X] domains")
Link: https://lore.kernel.org/r/0b1d7aec-1eac-a9cd-502a-339e216e08a1@huawei.com
Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Tested-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/msi/irqdomain.c | 5 +++--
 drivers/pci/msi/msi.c       | 8 ++++----
 drivers/pci/msi/msi.h       | 2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/msi/irqdomain.c b/drivers/pci/msi/irqdomain.c
index d7ba8795d60f..c05152733993 100644
--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -271,6 +271,7 @@ static bool pci_create_device_domain(struct pci_dev *pdev, const struct msi_doma
 /**
  * pci_setup_msi_device_domain - Setup a device MSI interrupt domain
  * @pdev:	The PCI device to create the domain on
+ * @hwsize:	The maximum number of MSI vectors
  *
  * Return:
  *  True when:
@@ -287,7 +288,7 @@ static bool pci_create_device_domain(struct pci_dev *pdev, const struct msi_doma
  *	- The device is removed
  *	- MSI is disabled and a MSI-X domain is created
  */
-bool pci_setup_msi_device_domain(struct pci_dev *pdev)
+bool pci_setup_msi_device_domain(struct pci_dev *pdev, unsigned int hwsize)
 {
 	if (WARN_ON_ONCE(pdev->msix_enabled))
 		return false;
@@ -297,7 +298,7 @@ bool pci_setup_msi_device_domain(struct pci_dev *pdev)
 	if (pci_match_device_domain(pdev, DOMAIN_BUS_PCI_DEVICE_MSIX))
 		msi_remove_device_irq_domain(&pdev->dev, MSI_DEFAULT_DOMAIN);
 
-	return pci_create_device_domain(pdev, &pci_msi_template, 1);
+	return pci_create_device_domain(pdev, &pci_msi_template, hwsize);
 }
 
 /**
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index d6ce04054702..6ede55a7c5e6 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -439,16 +439,16 @@ int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
 	if (nvec < minvec)
 		return -ENOSPC;
 
-	if (nvec > maxvec)
-		nvec = maxvec;
-
 	rc = pci_setup_msi_context(dev);
 	if (rc)
 		return rc;
 
-	if (!pci_setup_msi_device_domain(dev))
+	if (!pci_setup_msi_device_domain(dev, nvec))
 		return -ENODEV;
 
+	if (nvec > maxvec)
+		nvec = maxvec;
+
 	for (;;) {
 		if (affd) {
 			nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
index fc70b601e942..0b420b319f50 100644
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -107,7 +107,7 @@ enum support_mode {
 };
 
 bool pci_msi_domain_supports(struct pci_dev *dev, unsigned int feature_mask, enum support_mode mode);
-bool pci_setup_msi_device_domain(struct pci_dev *pdev);
+bool pci_setup_msi_device_domain(struct pci_dev *pdev, unsigned int hwsize);
 bool pci_setup_msix_device_domain(struct pci_dev *pdev, unsigned int hwsize);
 
 /* Legacy (!IRQDOMAIN) fallbacks */
-- 
2.47.2


