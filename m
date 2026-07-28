Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFCFC54F56
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNoqOAY4je9wBsYGW6EWEKl1ijHq+m++0XLMmlJB/BQ=; b=cM2lxEkNWV6xSUMOL0Xh9vtl0p
	hi6zVQ+qdd8aXDt5lZsK6ExSjCu2W2bLOhNdGz63XOng3beWl304OXVt0LUeSuPnwV7mwElHpUUFi
	lUzdjb0jYsA/yZN+HnnakBeV8Hp5HBPOxdyLf4LR08j1ru2QNclU2ra0Lz1j6UQNvPJkrN9HkEZWE
	wPDOVgRh4WR8G4tzP8xHrwFx2zJRPe4VotoGHQcuQotAGmTU0BRqEYdjbpOWe9yPJ6Pi64vsNJu8C
	6HmeSoFy3I2BCBfDo5eRdbIWFiu614T9WlK/6vfODE0rTeF9ft+uO5gX5YPDHnc5if/MraDOputIT
	SN21TJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3m-00000006GYk-2fn7;
	Tue, 28 Jul 2026 21:09:58 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3e-00000006GSl-111H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:09:51 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-848544a8496so279659b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785272989; x=1785877789; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNoqOAY4je9wBsYGW6EWEKl1ijHq+m++0XLMmlJB/BQ=;
        b=HNdOctnxE8ojTY1db0b1xlYSEg/5S2crC09gjHzJs4mPt8Sf6mjzL6Iu9ZNTlCq7RT
         Ce6rYnegTMZFGPT1YFsTfUyL17Up0/3pa5ZHeuTS3iRDRNnFzR5UABve7MzUwjQh/3U7
         VJmL41OXNOI73NxtJtXR+DIyHmB/Qox+z9hipIhOTZLY0Fz26B5gHUXgvj2WasqGz264
         aIRGqyqWhode5HNd3pmnE6biXAbYiPJCBwARXFf4F0MO7rSMZ63hFrXuTeI/DyACgUOt
         fMwxTQ/P/9DdxRFuxbsEPKoli7a2wDckYr3iELAtviizkfEAs/yyhOGbhReDUPNH4ydW
         Y3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785272989; x=1785877789;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eNoqOAY4je9wBsYGW6EWEKl1ijHq+m++0XLMmlJB/BQ=;
        b=lEj7f3wpsaHyvYtxqPyraB1c2j5ikicS/qK++EI5Hz4yPX1UP4NriJpor3Ir0yGQku
         c96SLDgbkCF6kSEYzq3FBXTz0/wcajp3fNY/fx2qYW3KHKJbw8imkedUdJGuWFcYL/0c
         9oxounK52P06QquEVI10zJz8wB/lWgwaFMXP77sham+lemKHFTWWLjJS7t8ChZkzvrh1
         zVKXh5CPxtp5Aw4XQWRFqgRj0Yild0kvx+pqXmgDFOcG06y9/2D2BNaxv49gppiAR9eD
         xswzZ/ego6IBo4vr68Hw5EVYBkOL1l3V1+vAAHU/eEGgKROvTLn71fsk8BuXvn+fSU4X
         j5Zg==
X-Forwarded-Encrypted: i=1; AHgh+Rqp/o4QekyNDqqIn3bOZvv3A8Fcd97yEAejC3v5e68ZMM5YfOMhODlmDjzYfHRigN04kplPfZNBef0JKT6dVpcu@lists.infradead.org
X-Gm-Message-State: AOJu0YytJAlgEZb17XMkZukZzTXEa5T7rCbwZyd8SgEnqKZT/G11auz6
	csyEaeSh5p8DCL0E40XF1KYURkmW8f2VP9DOLFLrzgu6o9Pb8uu69cVJOuH85WjwX9TTcRgbsOs
	7FQ==
X-Received: from pgmm13.prod.google.com ([2002:a05:6a02:550d:b0:c8f:f76a:4b22])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:330a:b0:848:7071:9863
 with SMTP id d2e1a72fcca58-84e932b74a0mr3960583b3a.53.1785272988596; Tue, 28
 Jul 2026 14:09:48 -0700 (PDT)
Date: Tue, 28 Jul 2026 21:09:22 +0000
In-Reply-To: <20260728210928.1050849-1-praan@google.com>
Mime-Version: 1.0
References: <20260728210928.1050849-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728210928.1050849-7-praan@google.com>
Subject: [PATCH v9 06/12] iommu/arm-smmu-v3: Handle gerror during suspend
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	linux-arm-kernel@lists.infradead.org, Pranjal Shrivastava <praan@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_140950_282681_92165104 
X-CRM114-Status: GOOD (  12.81  )
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
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 03b80ab0a59b..2a976f210d9b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2352,10 +2352,10 @@ static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
 
 static int arm_smmu_device_disable(struct arm_smmu_device *smmu);
 
-static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
+/* Lockless; must ensure that there are no concurrent callers */
+static irqreturn_t arm_smmu_handle_gerror(struct arm_smmu_device *smmu)
 {
 	u32 gerror, gerrorn, active;
-	struct arm_smmu_device *smmu = dev;
 
 	gerror = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
 	gerrorn = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
@@ -2398,6 +2398,13 @@ static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
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
2.55.0.487.gaf234c4eb3-goog


