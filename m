Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E256C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmQT3ZxOmdEiP4LKePsQlSnKUdnPc41UVBmmgnCjG8M=; b=kpaT++w8Vr3x+PsoqkibQcaS9Z
	jBVg/9hcjSq7pUI0yfy+e1zzIr0IdW1wAF+moOy8ONm4icNvWcFy/dz1W3a8BqUijLdi5ZVOY1zlE
	TIIGOEZSUsMokPt21G2W0qvsdo8RcIBmNz8P3PE8KeWGz/+XUVP/XR5jxNFAH/bmSsf89DwCTi+p9
	R5ol1Wpj0FUVUBdxgxcIrcvD+ryqwruQItSPmfXszvVNbezgiIcyNBqcyPi5Oj6qckr+AJ7uj/idR
	g+f99WU+163apoxLg4/eqwGk6qcqwNoKEoSHp4ZY+enNhl7UWdByzpwE/soGW8eWIkPI1HRkNpTV8
	UA1286Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRy-00000009mW1-3hwo;
	Tue, 08 Sep 2026 17:17:38 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRp-00000009mP8-1Je4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:17:30 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-862728814fcso976146b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887847; x=1789492647; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmQT3ZxOmdEiP4LKePsQlSnKUdnPc41UVBmmgnCjG8M=;
        b=qp0BdtVu7MjagWQbodaRLDGcPZxcr7aZRsrwmE97/uLTdisFP3aW0iueaAOeOJrijG
         nTrkzBjSbCpcM81lAKOfPRtsZaGUdc+RMlb1Hl4h5LG5156c7fZnFG5bxlR9D1CsbzAE
         vyLzh8NTvW0ZAl8pLau1ZmQPfYXdUJGJbjc5mBehUKcB3QvAAO2bKs67KzDgrPvYWicX
         10x1AXjWt6DBAylArSZ1pGO89diqL2GbsI7e1EzVoco+ZHMXAfFoOhDLc9VrVnJgagNL
         096k51fY8dQKaLR+CkL2cLS+8mxSoqKsctwae5cY3lPupEHZjWvoT0upMogxAz0Huaxi
         sr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887847; x=1789492647;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmQT3ZxOmdEiP4LKePsQlSnKUdnPc41UVBmmgnCjG8M=;
        b=TX3VK+sMN9g9j91dfxHHMQZMt0ikvAsJlvYs10lQMstfpSaCxQJ+V8HzJKvrjJ7+SM
         ODgp/bLp+HiLewt7XuJ8d+1qEJLNYmRsv53PqOrlhHFMoaQOJT/U4qc5xIEuwTm9M46D
         3WDiPClBt4NpECcwZ+slIxzgof/ViuMVUTRndrjx8owu4oErbbsr4VGS4mPnHfhijAIr
         Ay/ajthLEp1IuGui43acfw0SG0L8CrYsEzYyr5KKjRXYZf8Z8UgKtLqfXufqVs+NEShk
         3nwagLWe2I6pxR/XM2LdXhNfVQgklBqUhcF8OgZqBWxObHTgUtPavwnEcqXjueRwmO43
         +Zmg==
X-Forwarded-Encrypted: i=1; AKwUvBxjgONlZ0tFWUFBsDXDmCRpQQYyJpXN+/TxNZj9RP5rwIU/8aoyx+tmqdTQKvIs7pjQUGXywLe+Qy6RpxQ3S03U@lists.infradead.org
X-Gm-Message-State: AFuF++kdxNiGUlqWamYHfSpHmnmjUY+3laIiuhqN24umXtlV+hb6JqX6
	ITOKn+X9jnzHYJ3QL/8dwsJvekLqltCP1TTZc0Mp9W5L/bgmtKB3TjfU4pROD53orsTDDtqIF/R
	xRg==
X-Received: from pfbhw1.prod.google.com ([2002:a05:6a00:8901:b0:851:d12e:df63])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:338d:b0:857:73e2:9104
 with SMTP id d2e1a72fcca58-8616be5fd03mr41477096b3a.20.1788887846875; Tue, 08
 Sep 2026 10:17:26 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:17:01 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-6-praan@google.com>
Subject: [PATCH v10 05/15] iommu/arm-smmu-v3: Add a helper to drain cmd queues
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_101729_385866_0AB41611 
X-CRM114-Status: GOOD (  13.83  )
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
Add arm_smmu_drain_cmdqs() that drains the command queue using the
arm_smmu_drain_queue() helper.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 27 +++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d809b625f7fb..dc2fc02b5163 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1028,6 +1028,33 @@ int arm_smmu_drain_queue(struct arm_smmu_device *smmu,
 	return -ETIMEDOUT;
 }
 
+/*
+ * Lockless, the caller must ensure that no concurrent command submissions
+ * can happen (such as during suspend where clients are already quiesced).
+ * Polling until PROD == CONS ensures all pending commands in the queue have
+ * been consumed by the hardware.
+ */
+static int __maybe_unused arm_smmu_drain_cmdqs(struct arm_smmu_device *smmu)
+{
+	int ret, err;
+
+	/*
+	 * We skip cmdq locking here since this helper is only called
+	 * from contexts (like suspend) where the caller has already
+	 * ensured that new command submissions are fully closed.
+	 */
+	ret = arm_smmu_drain_queue(smmu, &smmu->cmdq.q, true);
+
+	/* Drain all implementation-specific queues */
+	if (smmu->impl_ops && smmu->impl_ops->drain_queues) {
+		err = smmu->impl_ops->drain_queues(smmu);
+		if (err)
+			ret = err;
+	}
+
+	return ret;
+}
+
 static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
 				   struct iommu_page_response *resp)
 {
-- 
2.55.0.979.g7e5102b832-goog


