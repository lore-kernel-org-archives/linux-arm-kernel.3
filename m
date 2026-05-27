Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C48CD6E48
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 22:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4i7eZYDXTe/LeahengnEklx9Y8dIPjrFEcOyyIxBlpQ=; b=dMG1gknq0nftclbQCGrBeogoIn
	uvIM1LsgpGEoo1aE0mA3u5vilrlROQ3vkXtNjn6y9Ul0x+vYHxGDLI4lNqfVCeKmmDKyB/nNrs2op
	wDVToJvyly7BfBdXtd2ym8RKSCg6rtWO+CULTS/ZvY4TTU1MR2+4jpwdzQTiEh3suiRcbwiEnyJ/g
	eXRvAvvomJlucYs7ZEy2Iu0RERo8FRhoHMQYgIFkYMv49pBUJfJnDU/rLkIUEHuUIULdZ8VdiJlaF
	X1/331RxJm6ltcmMdb5ymRw1H8JTSjqD4IjRKOjLxcckbiqzBd3pmCpEPyRoaQyDLJrTpATkaCwmW
	AhiH4DLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMWG-00000004mSK-3YWD;
	Wed, 27 May 2026 22:14:32 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMWC-00000004mOa-1eR1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 22:14:29 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c81086bf930so8037856a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 15:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779920067; x=1780524867; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4i7eZYDXTe/LeahengnEklx9Y8dIPjrFEcOyyIxBlpQ=;
        b=eWO33WLMARoFokjw0v8/UUW5HI3Wd1Z9pXJ1kuXdtJjxbGwFH6Mm3nmuD93I15HR3d
         CV7yA9W5YnIk/Wx0xf4vNTkdGNlmFGA3gc9/ZEYvdGDYe058yBCLtcNiSaEUefPdDUNi
         pXDEyf5DYNv5XnbkjsTVEAGoPGVt24YJOjreP70PynhLcWeuOKijuD3telG8SYNHorFT
         +FAuT+HdL4+jTf0Pcsx1kqRBx4jD8voYgs7/D8cDEdYe4aCSsRaBPpwanmxxQ7uODwob
         nFpRs87wPrsfPm/Djij6FPulQ1TZhBx2m9j20Wy0q7XVPWbfYXLuR7Ke5t1hNrNl7UBH
         nXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779920067; x=1780524867;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4i7eZYDXTe/LeahengnEklx9Y8dIPjrFEcOyyIxBlpQ=;
        b=hhYeEc7MY1IhoAKJ9yqGGBQvXHMA5nsQR7yClE3kgbHM0Ppqa7bsDDevNfDD8Ns43z
         VUXOC2Ko/BVB0L5jLEqWq1YNkSQ2W8fyjrdSz80I/WKG725mE9qeFNKc1KQ49fyy7ZsY
         SmI9d/LTa5mwODg8HR8sP4Bftrtj8wnIQFccQyWfW+JNmTpqqo2OOvmVwb6oGOJVeaSa
         TNCEngnGal2FI89RfHbErr1JmtBGLjO3v2+QAeQIHm1cei9IXtVRA/RMu9QbHnSE/peG
         MKzOlGAQcs+hRWS2PES57TK8TMEmolUZNWef61eDeADk7d0sRLrVKJbFjXlGnZxSfcPS
         S64w==
X-Forwarded-Encrypted: i=1; AFNElJ/Le5Dvory43Ur6+mziJ4+dOipRSCmSc573uHrS1igEPzCQ9T41Mlc0JstBnu/OtAU5WsiEkeDGIjNfBgzJNgFX@lists.infradead.org
X-Gm-Message-State: AOJu0YyKXBp8rVYgqiGldKTWvjKv3B2579dOQrQSq5xxEa1o8VsbBaos
	7pS6IhcG4ju9e+bBA+JeYFtpJa4SRQhRselA2iDP3lRcp1JPRjafa2MrQLElQNCCI7M7wnYmVpO
	PHA==
X-Received: from pfbmu16.prod.google.com ([2002:a05:6a00:6e90:b0:83f:24a9:a829])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a108:b0:3a2:ebfc:6bfc
 with SMTP id adf61e73a8af0-3b3296aed5bmr18621407637.17.1779920066375; Wed, 27
 May 2026 15:14:26 -0700 (PDT)
Date: Wed, 27 May 2026 22:14:02 +0000
In-Reply-To: <20260527221407.1756491-1-praan@google.com>
Mime-Version: 1.0
References: <20260527221407.1756491-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260527221407.1756491-7-praan@google.com>
Subject: [PATCH v7 06/11] iommu/arm-smmu-v3: Handle gerror during suspend
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_151428_432328_91022D55 
X-CRM114-Status: GOOD (  12.65  )
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

The GERROR register's state might be lost when the SMMU is powered down
during runtime suspend. Handle any pending errors before suspending.

Refactor the gerror handling logic into a helper function and invoke it
from the runtime suspend callback after disabling the SMMU. This ensures
that any late-breaking gerrors are logged and ack'ed before the hardware
state is lost.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 93cee32f6c99..191b5b5b805c 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2257,10 +2257,9 @@ static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
 
 static int arm_smmu_device_disable(struct arm_smmu_device *smmu);
 
-static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
+static irqreturn_t arm_smmu_handle_gerror(struct arm_smmu_device *smmu)
 {
 	u32 gerror, gerrorn, active;
-	struct arm_smmu_device *smmu = dev;
 
 	gerror = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
 	gerrorn = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
@@ -2300,9 +2299,17 @@ static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
 		arm_smmu_cmdq_skip_err(smmu);
 
 	writel(gerror, smmu->base + ARM_SMMU_GERRORN);
+
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
+{
+	struct arm_smmu_device *smmu = dev;
+
+	return arm_smmu_handle_gerror(smmu);
+}
+
 static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
 {
 	struct arm_smmu_device *smmu = dev;
-- 
2.54.0.794.g4f17f83d09-goog


