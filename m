Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0183ACD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 22:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DsoenszedeSjTu5gG8Ot5kkuypT3biJ+H2calxCYQ+I=; b=GvQexQ5LfwBMJhmM23uKLAVO5m
	vmVjyWOszqfLS/k1LmKtkgTChuxJ7dQ6iP8ysOF6G6E66kkj1BS2KbUe8w3Zuv8kHm2k3gUBfVfTQ
	yM+hQRk88K1e+35+CnQ2xklzKMCiIkOG9kNzzzEzvZzdluxaStnFjSdeaqfmgd3mAyxVqykedYrxn
	b6rQBr6mOkF73Q1h9v9XYm4kXiClTB4pxwxdZ6UzHUOiavto8BU91pJhy8EP4cFJclFwoDDcbrx8+
	Qo1UiV2NFshnl3h+U0ChqrY3PYyVEU4Qs5pb2kbp8It++M+fynolVLTWqYTWEYdtnyWMHJO0+VSFw
	HRqA8rGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMWG-00000004mRh-236H;
	Wed, 27 May 2026 22:14:32 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMW9-00000004mNq-3wVz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 22:14:27 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-366015bca9bso9982358a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 15:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779920064; x=1780524864; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DsoenszedeSjTu5gG8Ot5kkuypT3biJ+H2calxCYQ+I=;
        b=FFg3+6hI/+DnzanqarfQknq7Ln5brzIsSqqByi4hLP+edc9xVQCsqM9xBcavC+Gs6b
         IHie/8fmYAykxSD1bKyEmUEF0oplxOrE40EX1hiPAy8vwcJf+9IngPyCPBWOuFY1uEZT
         CXC6VNRknXZzT+xDi7E7hzD2/+9t+W3O6upAaEqpsogJXZSCkZ5ArNXsJsLCl038CnUV
         IjBuAS5OPG+bQMH6Qwzhs90CCOyooZh+NmP9sT3pIgalBWr7ph9nFWHJElOVG+eJcbaC
         IVmtUCCm98SBXzBNrWH/6iib1Yvuq3dr6nl6oE5aOyOUIDZRqzpbmQwzz2qnoqpmokNW
         4XDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779920064; x=1780524864;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DsoenszedeSjTu5gG8Ot5kkuypT3biJ+H2calxCYQ+I=;
        b=Ch0oJ1KbQ0X7qhPTvnZPWNW+aNS0syXrDm/6pZPl6D5b/5JAk4GNzxaWmpDeRfLdOk
         IRuLvp75BIPFV3swGaTBkwm28kAQq/Gtei7GkjUNDY3w+yUQuP7yeNcxS6SWWeiUTeak
         89tQmN3cG7qPRC1uhkcFyZYmmZoJeoemOrr4dxEQCyGA0bgX/YpZhayWt6H/I5qejy6g
         /IWxzqlcGkhC1zxCbbiRiluOdwYjLd/wAZnQR/XjF1QXaYaLrD2FJNt+1M1a/hh5y3Vo
         sIXng+PjfvdkynpCJlp/GbqRzLReeeGEiSchzOzJVjf2mraKYHjfvppp7vWEXY1ywRtb
         jNyg==
X-Forwarded-Encrypted: i=1; AFNElJ9h4WIJ/DqL4m2bVTWUvMvYTlk905pEOMrNmcAnijfHrN6XRFMXTWzQ4tL+0bN6h6W9V51/xQ1woS8GJ8/7VQmD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7hkOjCGYieaeYtRhpyGTK45IqC+9T8ujuVXh+DK8vlNSZ3MWJ
	ja1zNhk4wP/9gi7vPwPXkxMOUyytJGn3pUDJjp3NpvoK9SpHAkwqZO6s+fOtJJ69wXroD1xqcWf
	wbw==
X-Received: from plda12.prod.google.com ([2002:a17:902:ee8c:b0:2bd:4b8c:fd31])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f709:b0:2bc:dca9:f0ed
 with SMTP id d9443c01a7336-2beb087b062mr204197725ad.15.1779920064134; Wed, 27
 May 2026 15:14:24 -0700 (PDT)
Date: Wed, 27 May 2026 22:14:01 +0000
In-Reply-To: <20260527221407.1756491-1-praan@google.com>
Mime-Version: 1.0
References: <20260527221407.1756491-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260527221407.1756491-6-praan@google.com>
Subject: [PATCH v7 05/11] iommu/arm-smmu-v3: Cache and restore MSI config
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_151425_983674_684C0FF7 
X-CRM114-Status: GOOD (  14.54  )
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

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 8682be5060ed..93cee32f6c99 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4551,6 +4551,9 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
 	phys_addr_t *cfg = arm_smmu_msi_cfg[desc->msi_index];
 
+	/* Cache the msi_msg for resume */
+	desc->msg = *msg;
+
 	doorbell = (((u64)msg->address_hi) << 32) | msg->address_lo;
 	doorbell &= MSI_CFG0_ADDR_MASK;
 
@@ -4559,6 +4562,40 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
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
2.54.0.794.g4f17f83d09-goog


