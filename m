Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB6BCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 22:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmNwprPA7hV2w0Jkxb+Nz3U2pfABHSvhMemy7L2s74M=; b=khHS9FbB97PP/wQgooRj5F9i9j
	TQGZaYyJruQm/XfXgFsOAGMAp+FYCeGwVmmUG2+S33mM15TJKQg9qAecl5SwLlEONV8DgXHnoZw5b
	MPzeXIq3vFKYkh5rO2ILvZichwqg1S+n9X2o4IaXx2FQ8Sv5KSLoSmRqM6ILl1BQbpog7rd1n+QId
	dm2Xa0cky9zqCgDx2C5NGU+mwzoE1lhRnKsW3ygZqIL6Un5s42Vzy09tM+S8nYJ8vqpQI39P/GIjB
	lBRyZXhT+sgWsvEj7j2svMXYvB+WRlrF13m9uk3LB/7b4mAzm+Skb+X8QguQLkYRUvBEYyMSK7GEY
	b2qwRabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMW7-00000004mMx-0FkK;
	Wed, 27 May 2026 22:14:23 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMW2-00000004mL8-1BAb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 22:14:19 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2bc7f9b2213so88117495ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 15:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779920057; x=1780524857; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xmNwprPA7hV2w0Jkxb+Nz3U2pfABHSvhMemy7L2s74M=;
        b=OzdjWcxq7Wp7AvwjplZraGjEjEY8mT1Iz8pVg1jJxVLpagB1t70WHSEMOwdUmHl++P
         AwmmgXPhfU0D4i+gXVNt8eCZIaNbUbwdApGU31RVUB5jewEfM4mrKkMLAvbMomuQq+hB
         j3IAe0RPIms4NfoYPCIlstCQzMqrEF9MfSHBC42uflRAUEU/3n1n1ZXQ/zyl+dIyGZOe
         uSkROHtdjXA3yk0e/jO5SY1/bdffbze4auNKrL9aTnxKC7K4CHfHuuEXjXQdMLa+xuze
         V0q6opqE+HKZSc4B7FGKnfTbLQeAG00iwTHqKBO/KGX34gf5YopCD6l+sTaoIhEcZfAz
         f9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779920057; x=1780524857;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xmNwprPA7hV2w0Jkxb+Nz3U2pfABHSvhMemy7L2s74M=;
        b=eRJT0UCK20umjjr3Jm+YQpE2JiBusqrBVxTFKRe2caZ4FVF0HWas82NQDzNMA0xR1C
         8j80cvHx69+EMOvgxvb9CDoyIbRzQ8sJOjh3nhhFj6OzKa5k+z6cns6dH3rFeBEPc0cc
         CtPO2tv7smAbZDyIal5CyAseZ2ANE4yW5EUC8s43D5n7sRKigLRqZnstzCMGQ5wKmr8t
         5J6qo9KtWx4g34jVqHUHQ7AEZhZRGsTW/Jxygj1cyN0YleYHJj/mTTIjHtQ7/sXVQ/iK
         +eYmon1snqahq8NIiDH77630ct/BwG1HpvXCAMvX8sfKDuLsYmhtqtHvq6g9YY9yJLrX
         NH+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/b0/+nthxKPVPYkP+2dad0etDa4SK9NQ7QgtIbY6nw+T9ZmIpd7HEhW7WHBPUa0UC7pmft3XXxH0eSt2I56Bfs@lists.infradead.org
X-Gm-Message-State: AOJu0YwyuhdFkQbqsgSsTEKL7qKM2ujpSXwI4Y7iMG/A/v++Jk7xnCEO
	GYh4Hn3oAPpKZwjnSGfr8eHOzAqlbSJY64xeXfTDJC2nRA0FaW1MDpMBWKl7EN1ia9FO0Tkgtju
	ryg==
X-Received: from plbjw17.prod.google.com ([2002:a17:903:2791:b0:2bd:7970:c1cf])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f90:b0:2bd:ef15:9fce
 with SMTP id d9443c01a7336-2beb063227emr277408735ad.20.1779920056662; Wed, 27
 May 2026 15:14:16 -0700 (PDT)
Date: Wed, 27 May 2026 22:13:58 +0000
In-Reply-To: <20260527221407.1756491-1-praan@google.com>
Mime-Version: 1.0
References: <20260527221407.1756491-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260527221407.1756491-3-praan@google.com>
Subject: [PATCH v7 02/11] iommu/arm-smmu-v3: Add a helper to drain cmd queues
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_151418_344273_D3DCDC19 
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

Before we suspend SMMU, we want to ensure that all commands (especially
ATC_INV) have been flushed by the CMDQ, i.e. the CMDQs are empty.
Add a helper function that polls till the queues are dained.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 34 +++++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  3 ++
 2 files changed, 37 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 3dad2c2d3283..0e77ef1e4523 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -884,6 +884,40 @@ static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
 					   cmds->num, true);
 }
 
+int arm_smmu_queue_poll_until_empty(struct arm_smmu_device *smmu,
+				    struct arm_smmu_queue *q)
+{
+	struct arm_smmu_queue_poll qp;
+	struct arm_smmu_ll_queue *llq = &q->llq;
+	int ret = 0;
+
+	queue_poll_init(smmu, &qp);
+	do {
+		if (queue_empty(llq))
+			break;
+
+		ret = queue_poll(&qp);
+		WRITE_ONCE(llq->cons, readl_relaxed(q->cons_reg));
+
+	} while (!ret);
+
+	return ret;
+}
+
+static int arm_smmu_drain_queues(struct arm_smmu_device *smmu)
+{
+	int ret;
+
+	/*
+	 * Since this is only called from the suspend callback where
+	 * exclusive access is ensured as CMDQ_PROD_STOP_FLAG blocks new
+	 * command submissions to the cmdq, we can skip the cmdq locking.
+	 */
+	ret = arm_smmu_queue_poll_until_empty(smmu, &smmu->cmdq.q);
+
+	return ret;
+}
+
 static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
 				   struct iommu_page_response *resp)
 {
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 16353596e08a..c855ab4962ed 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1165,6 +1165,9 @@ int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 int arm_smmu_cmdq_init(struct arm_smmu_device *smmu,
 		       struct arm_smmu_cmdq *cmdq);
 
+int arm_smmu_queue_poll_until_empty(struct arm_smmu_device *smmu,
+				    struct arm_smmu_queue *q);
+
 static inline bool arm_smmu_master_canwbs(struct arm_smmu_master *master)
 {
 	return dev_iommu_fwspec_get(master->dev)->flags &
-- 
2.54.0.794.g4f17f83d09-goog


