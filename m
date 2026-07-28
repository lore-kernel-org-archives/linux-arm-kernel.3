Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3621BC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsPlyt/0X4oEp+lyWoaCkrwCBr2oTFOrLePbBqMkWfc=; b=LNRsXl/ZyOG4e3BBT7M/B1KlUl
	C6Fx0jG0PDmGXaoI5/OjYAH88nuQ6Bqv7fQoSGgXGfqc5Qkd0VQoJVO3zNexEZIlAHXc91BNj0yrV
	zS6TZkKlsp7NZq/wI3f6ZoXiuNMB0pSZd1noudqzWtlY68lu/VNbkvBxXE6OL04l6bIDWYpNIpZgz
	JIaHkGDXvNv6VvyKi6uRZpMj9Wk07hj8ssWMVL0r1zFxiYYScMRkMtSLcqZf6Rg9peB0XIBmLgBpY
	6exSwWtm3eUVvMWV1lopxfooxsZZJzJVRV3CHisXpkZmI65fSa6Tg3II8ZS/ZT1FW0Ea7Vx9IekHf
	WMiGrZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3m-00000006GYP-25he;
	Tue, 28 Jul 2026 21:09:58 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3b-00000006GRJ-1NxM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:09:48 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2cfa4e4684bso7537075ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785272986; x=1785877786; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsPlyt/0X4oEp+lyWoaCkrwCBr2oTFOrLePbBqMkWfc=;
        b=Z5YfjcUTyR7xzf2Hz237JlFKrIK1TFgAcLqklmEV+Ylo1/jHjxnnqPwCQlfCVnsPmm
         9dzyap1eYvSlTGu2J8kw+9+XHcCcbU4P19Zb7D6zI7mRwuvgDUYmPgEGhf+mIhCmFnYa
         d7HVgybl7e7bzOcXHiMI1y+Dum5EznSW3tZrv+ThF0dNFvWUKUHc7yUjcwkxRNZ5XuXc
         nSMMHLRPNvS9A+YvUcXT4cdaQIA7iI7olNeHv/2dqmfVQrmxLQTBYAtLDUI4LY60EPoT
         6HYE8afY2GttUWZiNpDOsQ7wZpt0w2qq/hDMAS84Pm5TxNf92rppNOoHzNXFQRcSlyGj
         Z01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785272986; x=1785877786;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsPlyt/0X4oEp+lyWoaCkrwCBr2oTFOrLePbBqMkWfc=;
        b=nQwcskFboqi3/umybU/IIZpHPCFDoMXSVyHVfcUeZem7nHresPcvLnKHJnHr1IJhxH
         5ktXbzivoPORKQsujL5JEjA9m8uNBwgsvsnNjcFMF4ZD5sUhX/W9p+aKOthRlKH//KJP
         xnSQlfAE2Smgc+r2q96yXuINjlJtbqfXYtHH1vkPOp3ZMj5XdYhfCNTO+fAV3dcSx0Cc
         wi24PD9odkGIvki3QnTnh+E3txsSxm2cWr8JQBzOdr9bNUQpXdsqs+t7lCCfM0JutC0f
         TUGTl+SEvlYURPdGgxfYVIjWyMXWhjGZW3mH2x/Ux8tqmkLgJXRnVLnZW3BaRtfbKd9P
         EiAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrapH00yF+3nDJnQXejAYWbxPWmrKAPSep9rD9lq4sDsWJR0rdz3DiX5OP0zR2fxpSl5/c0kH5D2L2AHkJZ8dYr@lists.infradead.org
X-Gm-Message-State: AOJu0YzeIj1+hnfbU9yjdx1U+EXDhKY3vvskggOxcI0xSsPtgc/hFnR5
	IdE+R3t5FVt784QC1X4OGaQ+3W2GoTIMZ8v+yddHQ4jNRB/ttdXl4u5yaIkB9CoPFWsHY38I6Q8
	F0g==
X-Received: from plsr21.prod.google.com ([2002:a17:902:be15:b0:2ca:be81:b451])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:166e:b0:2ce:fa3a:45f7
 with SMTP id d9443c01a7336-2d015d1eb47mr42785845ad.16.1785272985765; Tue, 28
 Jul 2026 14:09:45 -0700 (PDT)
Date: Tue, 28 Jul 2026 21:09:21 +0000
In-Reply-To: <20260728210928.1050849-1-praan@google.com>
Mime-Version: 1.0
References: <20260728210928.1050849-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728210928.1050849-6-praan@google.com>
Subject: [PATCH v9 05/12] iommu/arm-smmu-v3: Cache and restore MSI config
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	linux-arm-kernel@lists.infradead.org, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_140947_385640_833A1350 
X-CRM114-Status: GOOD (  15.05  )
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

The SMMU's MSI configuration registers (*_IRQ_CFGn) containing target
address, data and memory attributes lose their state when the SMMU is
powered down. We'll need to cache and restore their contents to ensure
that MSIs work after the system resumes.

To address this, cache the original `msi_msg` within the `msi_desc`
when the configuration is first written by `arm_smmu_write_msi_msg`.
This primarily includes the target address and data since the memory
attributes are fixed.

Introduce a new helper `arm_smmu_resume_msis` which will later be called
during the driver's resume callback. The helper would retrieve the
cached MSI message for each relevant interrupt (evtq, gerr, priq) via
get_cached_msi_msg & re-config the registers via arm_smmu_write_msi_msg.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 96ca4a024cdd..03b80ab0a59b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4710,6 +4710,9 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
 	phys_addr_t *cfg = arm_smmu_msi_cfg[desc->msi_index];
 
+	/* Cache the msi_msg for resume */
+	desc->msg = *msg;
+
 	doorbell = (((u64)msg->address_hi) << 32) | msg->address_lo;
 	doorbell &= MSI_CFG0_ADDR_MASK;
 
@@ -4718,6 +4721,40 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 	writel_relaxed(ARM_SMMU_MEMATTR_DEVICE_nGnRE, smmu->base + cfg[2]);
 }
 
+static void arm_smmu_resume_msi(struct arm_smmu_device *smmu,
+				unsigned int irq, const char *name)
+{
+	struct msi_desc *desc;
+	struct msi_msg msg;
+
+	if (!irq)
+		return;
+
+	desc = irq_get_msi_desc(irq);
+	if (!desc) {
+		dev_err(smmu->dev, "Failed to resume msi: %s", name);
+		return;
+	}
+
+	get_cached_msi_msg(irq, &msg);
+	arm_smmu_write_msi_msg(desc, &msg);
+}
+
+static void arm_smmu_resume_msis(struct arm_smmu_device *smmu)
+{
+	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
+		return;
+
+	if (!dev_get_msi_domain(smmu->dev))
+		return;
+
+	arm_smmu_resume_msi(smmu, smmu->gerr_irq, "gerror");
+	arm_smmu_resume_msi(smmu, smmu->evtq.q.irq, "evtq");
+
+	if (smmu->features & ARM_SMMU_FEAT_PRI)
+		arm_smmu_resume_msi(smmu, smmu->priq.q.irq, "priq");
+}
+
 static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 {
 	int ret, nvec = ARM_SMMU_MAX_MSIS;
-- 
2.55.0.487.gaf234c4eb3-goog


