Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDA6CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 21:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXEmkT3t0xuH0zfh1Vnq+1ZXPrn8uKJhrEd+Wqg5YrQ=; b=g1XpZ9+v1HuZvFMldd9cBmOweI
	DOKSIEKPIOg3iBDm0EhE/92dpS/Bs1O8ZwXy7A95M2I7Kv6CJSdviDSBuyguUDP84gZxIadeVEbO3
	d8/rMzqkicCHOcbeusNtWt29WLiuP2sVKAEchzvuV4w9Of8KzfRjO3UZZbVhpoBuSzDNur3Hcf2ku
	UDnHSST9cgoc9Mio7HRCBibposkqrWzIo0Xj6aYtE8dJOa4Vm7QUAXViQu7b1K9nxv7NULukOZ+0Q
	kx/IGmgmHIK0HoUBJKr3TKvOSgVllcX3d2N7CBc3j8OxePPYRUhm87dvkcEgn5+qfAA42R6QwBQuX
	ZXs+Bofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfQ-0000000BtNb-31jB;
	Mon, 01 Jun 2026 21:59:28 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfO-0000000BtKE-1VUu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 21:59:27 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c859d79c10eso2350782a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 14:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780351165; x=1780955965; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TXEmkT3t0xuH0zfh1Vnq+1ZXPrn8uKJhrEd+Wqg5YrQ=;
        b=rWnWA1jKU5ni3oEDac9RlsuZKL+s64DZEx8crAUsyKKVj8g0wbMiWf8PCJTcGkWia5
         GmFjtsxCiyrQ75iT9ZGNp8gO8hpx57C+RmN/2e2Jh2c4i+6vx4U71VoxL0jj5m93WZZZ
         D/Q3V4766AAn5l1e3Yteehx9qzYcmSoxKBtpChqblmkgvtViB8pAYCp8HDaB9T9tLn/4
         hooyxzYmXaz9TkkJTgaDFD9BUV/4H6iLGjpuWz+gMDfdMZuBQ+A8K9/fFcUjZ9V2ABJX
         +tWEuiCWdG6Waupy9AXHa4oEiA6xw7W0lZ380+KTxF3x1kjgijWdPqgzNcKyoUFvSeS2
         VtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780351165; x=1780955965;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXEmkT3t0xuH0zfh1Vnq+1ZXPrn8uKJhrEd+Wqg5YrQ=;
        b=lnfbPuqMEVqMn47HThA7nmfl1GeYLb7u7jxWklauL9KZ83PKCA2yX8VRlRNZcREJbh
         I9nEOuBHXLbVxye5ap+UJY4+/4aO3BeGuXALg7Igp8g4Zze/ahWZgRMzHLtkqvDb4IrH
         uOoxkzbbo81bex+DfiyAjP3T/m82Jrmak2QXj582i3YBUUnfYSctKKCxYWwfG0NqztgS
         F2cQLJcay5bQGLtfN/msvR8V+FESP6S2vePFTKPxcE3rik4gkHpW6XwXrmlIykFOXlTc
         +CCWAXbvewCLFR5jTRrejdkFujNI/qpAY8/nTAkCBvqUGTjnHeX2x1mL58RDOUxhU8QU
         /xxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mivAB8YcymknsF4B82uzAZezfVlURZ7RowFbcOSjB8PBUyYUXzBrGnkVz2S6aLwglYBowS2X0ps4qXwxRBANN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+ureVhKq39vAZiuSuVcYGT4TxTa2kCAx5sVcjvQOGCZfWsfjg
	mvPR0zd4RkWtUpk812Oow8/GWFo/255KXNDfnKEjkYUioEZUZGaRv1O00cxUoYcGE/ouo3EyJbZ
	KfQ==
X-Received: from pgbdr2.prod.google.com ([2002:a05:6a02:fc2:b0:c79:599a:d8e3])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e58d:b0:3b3:be1b:733e
 with SMTP id adf61e73a8af0-3b4280a4e36mr13722143637.23.1780351164578; Mon, 01
 Jun 2026 14:59:24 -0700 (PDT)
Date: Mon,  1 Jun 2026 21:59:03 +0000
In-Reply-To: <20260601215909.3958732-1-praan@google.com>
Mime-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260601215909.3958732-7-praan@google.com>
Subject: [PATCH v8 06/12] iommu/arm-smmu-v3: Handle gerror during suspend
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_145926_400962_049FCD6F 
X-CRM114-Status: GOOD (  13.58  )
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
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 93cee32f6c99..6c8631e2f153 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2257,10 +2257,10 @@ static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
 
 static int arm_smmu_device_disable(struct arm_smmu_device *smmu);
 
-static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
+/* Lockless; must ensure that there are no concurrent callers */
+static irqreturn_t arm_smmu_handle_gerror(struct arm_smmu_device *smmu)
 {
 	u32 gerror, gerrorn, active;
-	struct arm_smmu_device *smmu = dev;
 
 	gerror = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
 	gerrorn = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
@@ -2300,9 +2300,17 @@ static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
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
2.54.0.1013.g208068f2d8-goog


