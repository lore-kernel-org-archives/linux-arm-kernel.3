Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF8DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 00:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mCKUQ4PV+b6oGP9aITiW6m4Z4aNfJIHGPjXpLn1su+c=; b=ycJRU22e+DK2OfIHxU4mpSHl9n
	irYumI9jioCni39B6eOVV5/JAogHSuFNwDDL+QQoJgTQUVuN+MAi+5WK+lEY5VkyXi8PnanWC55Rw
	Fo4sl6nkB6Nze32pHrHg3Hp2dh9+90Us6vjb3ux9wx5rizEvGz8hfffOMFuxnUdTsmJt7owbFWZcX
	ddj3aaCmuDKI3sAyf9z99Wn/sjfpZFJgxvgeNf53SX6t2l3Ui9R195eQm7pQdxL8dpNoFjrGFncjf
	bXozZnAMD4Mh6xwZwocDF+X6MtvXi0cpSwl+I1lhrNWYcKrDjhJLRnZtxr1WEpZWaHF1CF9cV1HPC
	hdbv/tIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOPim-0000000Bo3j-12zj;
	Sun, 17 May 2026 00:51:08 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOPik-0000000Bo34-1VQx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 00:51:07 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [40.65.108.177])
	by linux.microsoft.com (Postfix) with ESMTPSA id DC9F120B7166;
	Sat, 16 May 2026 17:50:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DC9F120B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1778979059;
	bh=mCKUQ4PV+b6oGP9aITiW6m4Z4aNfJIHGPjXpLn1su+c=;
	h=From:To:Cc:Subject:Date:From;
	b=Ffb7RcNfkHey8LR+idMAEG98d+2zqhimWD7OPoj93CKiXPumPfhItYXAtzeJLGDEc
	 bR+w89A5rQ/LDdBH3eqOWjzuxlsnaFZiKfcOgCjd8gdyaMA75+hBCrPvsKgrJNSHT1
	 rLAp9byCJ+t4VrcmMwSHJ7B0XMPXHsfw5K0wjxj4=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: iommu@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	robin.clark@oss.qualcomm.com,
	will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	stable@vger.kernel.org
Subject: [PATCH] iommu/arm-smmu: pass smmu->dev to report_iommu_fault
Date: Sat, 16 May 2026 17:50:52 -0700
Message-ID: <20260517005052.3783378-1-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_175106_427969_2BE106D3 
X-CRM114-Status: GOOD (  12.21  )
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

report_iommu_fault() passes the dev argument to trace_io_page_fault(),
which dereferences it via dev_name() and dev_driver_string(). Passing
NULL causes a kernel crash when the io_page_fault tracepoint is
enabled.

In arm-smmu.c, 'commit f8f934c180f6 ("iommu/arm-smmu: Add support for driver IOMMU fault handlers")'
replaced a dev_err_ratelimited() call that correctly used smmu->dev with
report_iommu_fault() but passed NULL instead.
In arm-smmu-qcom-debug.c, 'commit d374555ef993 ("iommu/arm-smmu-qcom: Use a custom context fault handler for sdm845")'
introduced two report_iommu_fault() calls also with NULL.

Pass smmu->dev to all three call sites.

Fixes: f8f934c180f629bb ("iommu/arm-smmu: Add support for driver IOMMU fault handlers")
Fixes: d374555ef993433f ("iommu/arm-smmu-qcom: Use a custom context fault handler for sdm845")
Cc: stable@vger.kernel.org
Assisted-by: GitHub_Copilot:claude-opus-4.6
Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c | 4 ++--
 drivers/iommu/arm/arm-smmu/arm-smmu.c            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index 65e0ef6539fe7..8eb9f7831de07 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -399,7 +399,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 		return IRQ_NONE;
 
 	if (list_empty(&tbu_list)) {
-		ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
+		ret = report_iommu_fault(&smmu_domain->domain, smmu->dev, cfi.iova,
 					 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 		if (ret == -ENOSYS)
@@ -417,7 +417,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 
 	phys_soft = ops->iova_to_phys(ops, cfi.iova);
 
-	tmp = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
+	tmp = report_iommu_fault(&smmu_domain->domain, smmu->dev, cfi.iova,
 				 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 	if (!tmp || tmp == -EBUSY) {
 		ret = IRQ_HANDLED;
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 0bd21d206eb3e..92d8fa2100adb 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -467,7 +467,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
 		return IRQ_NONE;
 
-	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
+	ret = report_iommu_fault(&smmu_domain->domain, smmu->dev, cfi.iova,
 		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 	if (ret == -ENOSYS && __ratelimit(&rs))
-- 
2.43.0


