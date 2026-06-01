Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D94CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 21:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONuLftC1PjDeNO3J1MQAL3fybeR67R0JRra2ClbgQzQ=; b=loozAchfvucXz7LgXT9EM6ByB6
	KX6XtPNUzHl1bOjb/D/v7x8jzc191OWN0F41JcR8zSpz9+xYlrUknTLyoZcuhXmsg2fBNUjsGjLCj
	1kqMstR+/8wvMq8WQ3+U0QfK9Mn4qSCAoZdt5JZWkclQtpmSq3b9DpAdYwQCX8tNpcLVl27LAczB9
	9ccr09XOT33GtNDp9D9CSC3zgA1gYN++/ykJIHEQvWecD07Sk6rYvKqtH3lWxV/TjBlYU9iAyEVk/
	S/wvLkreUdbv94C6LsmCvrGSNmtVUI6DzqOjmw2gezzDUYcOe1NBMwxP2cqs8gCrZyA9wMaIjxV8r
	cONu8iTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfM-0000000BtJ8-1Eqs;
	Mon, 01 Jun 2026 21:59:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfK-0000000BtGY-1Qjn
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 21:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ONuLftC1PjDeNO3J1MQAL3fybeR67R0JRra2ClbgQzQ=; b=YbWapdsAQPQ/yMpAmvQd1cEtOX
	xhlnBN3a8mHGVDS0vDzE68EP8QWsqGtVzrTo7qFu2JjI/rDLSbfMiqtPVilUjLTq7vZ8c8fZCCqDB
	iupxcWpKJQ2fz0TN5I8qoWzqoIoVARNsF22NI0c2IxvJ6JST2eLHnp9f6enIv/tI1z5NRI+OW9W21
	V2HOzsySpvdFkmTp7AP671Y4gt5MUH4EfCE9uW9xQCylrxgNfbss8d0wrLVEKYXc0Au5f0aTLGYjJ
	sPcojryOu0xC9prqsvfOZBGGWjz43k7TDL34a0VGc9Jn3hkgiqKnkte1/KTcPwTyllSwY8dGsWW48
	M0aFoQpQ==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfG-00000007oq7-374K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 21:59:21 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-842208d5b0eso1977760b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 14:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780351156; x=1780955956; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ONuLftC1PjDeNO3J1MQAL3fybeR67R0JRra2ClbgQzQ=;
        b=fESUAhlOmvRj33JWbLdJkXquHe+3UXq1eDNkciPrO2fIZfPI30Zjc+PGYGEF7mzZ9p
         fdywWrOXX1H6kZCd3KtrQ/dpdN73XfwTiz6ul9eFho+tiORUAPt3wT4cBqLxoF+fi/Ch
         mAhGm2WW6VC8pUMbzsCRQPUc4b92/+L5y/iJv8FdBlZqt0GPD+zA8+xWbcG+FTQNktWN
         upfnrJ9whsc+L46XAw3kxlQEi7xyiDoX80nZiPNp+pnRHZ3psQok3YGLqnr1Jl3K9Uca
         QMMb5nomibM3O58h7EiwBBBvc8+KPRw0RUDlISC5f6tcuR/NSPzzEKmO7wnO3R5Lx4Jy
         KRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780351156; x=1780955956;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONuLftC1PjDeNO3J1MQAL3fybeR67R0JRra2ClbgQzQ=;
        b=EdbN2jjvcDbXXOcnXx02nIwBcEWB7rpOHn1OxcRCy9M7+vsh8kJBA+b7xUOgtv/xpj
         XOHEyVRDzsCEWiAjgcK7hzQAElHHdgwX0J09UzBhjQnU4vZGoXjb5P2TPZuM7aVbWXqN
         2bWfJZEeaPDFVhJnh0RMfE9Xe3yqC3nkKUhGOW3Gpmdxb35YZs4+iC+ohY/cQeYfVzfm
         ytSrmOUt2yF1a3VHxbJQCFMhONBZp7bGsJ9UkZYqNdH1bFY0s9HRv1EyjLwa/rxbXXpu
         1NaZUKKnYpvOPjKanxURCdI+3bgrEb2VZHO3iPTP3O/0opVwuvrNr1BeoPv1dPwds3ZJ
         ui9w==
X-Forwarded-Encrypted: i=1; AFNElJ/MmYj1q3l+NnFh/IetqKhgOd1nM41QdOFEhIBPR6h0+yFdZJiG8gJiCszMc1kF0MU5lzK93IQmtRZaSsFSDtb3@lists.infradead.org
X-Gm-Message-State: AOJu0YzfU9vEmEIibapVCBjrvbhSyC/4ha7iQRbZ+k2rQ+2Q5hLWEYuB
	PwkrIW3l4DrqPdwJItQk82AZCFOhe+rGulyYs+237Q/m1jM3bokZ4izTdViGBg/bHStKPBpqodz
	92g==
X-Received: from pfbgj13.prod.google.com ([2002:a05:6a00:840d:b0:842:b0e:cf17])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:288b:b0:83e:ccd6:2dc8
 with SMTP id d2e1a72fcca58-842255cf64fmr11905631b3a.27.1780351156167; Mon, 01
 Jun 2026 14:59:16 -0700 (PDT)
Date: Mon,  1 Jun 2026 21:58:59 +0000
In-Reply-To: <20260601215909.3958732-1-praan@google.com>
Mime-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260601215909.3958732-3-praan@google.com>
Subject: [PATCH v8 02/12] iommu/arm-smmu-v3: Add a helper to drain cmd queues
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_225919_487560_E7538E12 
X-CRM114-Status: GOOD (  15.86  )
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
2.54.0.1013.g208068f2d8-goog


