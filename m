Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76793C54F56
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItDdBz/OEznItt090HL1h2V9CWsYvmHYiIvcswmhcxs=; b=Z0Gi/bJYJlb1vhe17zAWtlIqpG
	JxKuqkJm+3K2JfGDRHyOxy1+I2NtrnZSNmxRdDI6WyyLywBuGukP68pvVeaOh+IBJ4mu3VKlmFA5v
	f3y6QN9O6xOySRDl0UhmcKQcpdEFiR5yY+L/YKedYu5JRXTm1IZtd30OuIDlEdtMKWrvojL1RbzpA
	5ESVAWksNAWLRdOp3DWdUNQ9tufhpgumvEM1TKlt8e+/2rvkI3thwAf39+LfO/YFPlqkaNXIaieYF
	zcysIqf5KG0UvQabaC5xr1WPw+ZAmSwUt6rp5OGN8KuCnlS1kTUlBQipVd2FIAaItbMtEnEvJ7BHu
	HY4AGAVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3Z-00000006GQ3-0g5v;
	Tue, 28 Jul 2026 21:09:45 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3U-00000006GO1-32HA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:09:41 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-8482b95574dso320740b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785272979; x=1785877779; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ItDdBz/OEznItt090HL1h2V9CWsYvmHYiIvcswmhcxs=;
        b=jtP/f2Ccg4CO79s+X9ghu/nCfpJfST1/jlxFny7U3AR2i15g4v4+tDzXfzeDM4zPW0
         uIhZSDfjT26v7XaRAZ5etyMGNG6YYiTKJPe9bhOGHZfYd6n51Z9KffWcXqzyJgyN0fKy
         pn+LkO+K83epSnTmxTreIEFk/4TrEYQe0JSOxASSJ8xq6Lqc/LuId+Cj5CcKZju3JSod
         lwLG9ddyk4stE0R3ZehRqdIB2O06HZJhsliN3Aj3k3g3J07lDag2YcwhNCuZQVCVV7IH
         094djPrWZlk7wjUOvtqMj4V/ceJMPZsHGPhcgWXHa5OA41Y9MPaz8L8Lut3rzFCazjDp
         ECOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785272979; x=1785877779;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ItDdBz/OEznItt090HL1h2V9CWsYvmHYiIvcswmhcxs=;
        b=HTrHPTpRDl0N5HyYbJYL6rU6sJlhm57wXM4QOfIKMyI3jVAgQrH4AlovxDbSJIyyR5
         vVXCZepYjbcOWdlop/mfA16RfOaj/Wf67iAlEhdeJD9iE9b/hHahFQpo0zbou7/4xy8N
         6pHZRcMhO99Jj+OxAX8RMzZRtr5XFyquIhBn3PTb95p4GpJwk+J6LnisujHwMaIH86io
         s+yjma463BykYoSXGbWJLVeHl2pn0Va7VZ6nYmqOvWmxXj1HDw0EmhZv0kCqo1OgG7ch
         GGz0GVOoW1qn6qcgT1PHoXwkyqifRjYtBNA6xuOf9/exvoijMLoSyLt6R32Rg9l58Qqg
         Cfdg==
X-Forwarded-Encrypted: i=1; AHgh+RqmdBYTCpcxJjECcfkWujzff6EKyEDgSVZ4QQ9w/S33kk2BQXT6ZPQsq0pPR44j6QrX43rRhVr/1kw0gv0NUuUh@lists.infradead.org
X-Gm-Message-State: AOJu0YzO28Z1TEc6qeVlzFrRBCYkCbXU8CUW+cNG4cRMP00An3soJ27R
	n0sAEpip+dMDhSnsbamGLEAAi38bgmE7PNNOHCMlr/Av7i3w76iTw7nu0TOvjcDT/PlePy9OegD
	X3g==
X-Received: from pglf4.prod.google.com ([2002:a63:1004:0:b0:c88:b675:3609])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7d03:b0:3b4:e4f6:4f15
 with SMTP id adf61e73a8af0-3c8aafa2ac3mr5229665637.5.1785272979218; Tue, 28
 Jul 2026 14:09:39 -0700 (PDT)
Date: Tue, 28 Jul 2026 21:09:18 +0000
In-Reply-To: <20260728210928.1050849-1-praan@google.com>
Mime-Version: 1.0
References: <20260728210928.1050849-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728210928.1050849-3-praan@google.com>
Subject: [PATCH v9 02/12] iommu/arm-smmu-v3: Add a helper to drain cmd queues
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	linux-arm-kernel@lists.infradead.org, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_140940_779159_64BE61D2 
X-CRM114-Status: GOOD (  15.33  )
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
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 45 +++++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  3 ++
 2 files changed, 48 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a11f5bcbe77d..08b83f211ab3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -949,6 +949,51 @@ static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
 					   cmds->num, true);
 }
 
+/*
+ * Currently, only used for CMDQ.
+ * TODO: Update to handle PRIQ & EVTQ when PRI support is added
+ */
+int arm_smmu_queue_poll_until_empty(struct arm_smmu_device *smmu,
+				    struct arm_smmu_queue *q)
+{
+	struct arm_smmu_queue_poll qp;
+	struct arm_smmu_ll_queue *llq = &q->llq;
+	int ret = 0;
+
+	queue_poll_init(smmu, &qp);
+
+	/*
+	 * The events are only generated when CMDQ becomes non-full.
+	 * Thus, wfe can't be used here, mark it false explicitly.
+	 */
+	qp.wfe = false;
+
+	do {
+		WRITE_ONCE(llq->cons, readl_relaxed(q->cons_reg));
+		if (queue_empty(llq))
+			break;
+
+		ret = queue_poll(&qp);
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
+	 * We skip the cmdq locking here since this helper is only called
+	 * from contexts (like suspend) where the caller has already
+	 * ensured that new command submissions are fully closed.
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
index 43f4d24e7847..00ad2e0c257b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1167,6 +1167,9 @@ int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 int arm_smmu_cmdq_init(struct arm_smmu_device *smmu,
 		       struct arm_smmu_cmdq *cmdq);
 
+int arm_smmu_queue_poll_until_empty(struct arm_smmu_device *smmu,
+				    struct arm_smmu_queue *q);
+
 static inline bool arm_smmu_master_canwbs(struct arm_smmu_master *master)
 {
 	return dev_iommu_fwspec_get(master->dev)->flags &
-- 
2.55.0.487.gaf234c4eb3-goog


