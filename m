Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DB4CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 23:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QLGehsG9TWs7vYu5jUxb2yk8sP6DWLxxs21XC/HL6E=; b=5DSb1OXV7cnus2TPbQd5LXbqS9
	J91vY2F9B2x2BroLrLzVdYbYKifc2axw2FUqiI8q4LxH+PzVoHlAQiTgAU7CWMLf8jc5NYHPacDx3
	uUieSw5nhnnW9viDh8RV6SCGfF1UFq4sWfVB+V4G3FHAoUdeO7RvYvvTrGYYcORK+pKW810jjzUk4
	q/cVSIXufimkX2g+rgot1HGHIn/q9YzbdJIBp1YWzHgspNxyzdlpsvj1KKb8+oU5dvjICmMeK0eW5
	tpFzDYQPWb+yCtHbhnmeG1nOm6iHiO30rqhP4+Tm5HzBWq/tm/9gF2dmpQr+5km+C16KLt8LXDP16
	qz32eJPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoW6a-0000000Btsp-1sYC;
	Tue, 19 Aug 2025 23:51:04 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUFs-0000000BfQA-2CLg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:34 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b9e4166a7bso2877631f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640350; x=1756245150; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1QLGehsG9TWs7vYu5jUxb2yk8sP6DWLxxs21XC/HL6E=;
        b=NpWbbZrd88v0OHPXEcKtugodQIxVj5jh8X7uX1Vo/A300Fs4EcZhbjaMF9MYE6ZCY+
         rlg/U+rYFz7YwIKKaPcGJbTEKrE3AIIhHjNyrnDCFUvutlzR7UOstUfR4FbwaxW5ngKh
         k/xnUWx8PhFdsD3n9YfthL+2GFqPBzNiUNIzuwP7IpCVpRGMZWlx7/kunlO4hBb+I+pI
         inPscmjxVwhNG/5VXEes3cz5QJ86t1W3XPhwbV5871mphAcyv7rK4OjmKR8CjoT+SIx5
         J2Fw7xhtUHk8chPLdMSPLGIJmNhR7Ei0a2O3UG2ieox1pY2hSgU7/8Ws8ruLZWai7MT0
         iSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640350; x=1756245150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1QLGehsG9TWs7vYu5jUxb2yk8sP6DWLxxs21XC/HL6E=;
        b=F688TLgqeNAoQFQO/kh/lGRh5rk3mHdybkgiRlUUPmM59NxQsniqQNypsjnOQrIJqG
         r8yuM/xsGtV5gauYdyynqHlrJGCFaDEkdu6K0C+xER4MxaPej8xF9bmMJCbaEH5Jcjio
         PlGjSy6IzA19+BKsmTSJr8CYGQZFt9deu47gy5zx2B0xFb/NVfHRDOxwlq8Su8fy+Zpx
         m34DxNKO5PHU/38Ej3x2IDASP3QJbkir+L6r8W2zly/g3fuPDlMQWG6KMP80JT/+ugaF
         Oj9V193W/3gMSQHunzhCst8fN2Cnqji3p8sc5lRev2P8IjionIzxWtY2qefd5iCMTmdA
         qIrA==
X-Forwarded-Encrypted: i=1; AJvYcCVbior7DKuJG+h9R6cpeykOfBqgC4buwrRDtfOwW+vI/P21u6YWh0qvD08EjvrndNZhP1HlUL+XoYON+vlAqttB@lists.infradead.org
X-Gm-Message-State: AOJu0YxC2l/FgMqVZ+mNQ3T7zBKCY/byvQhQU+srKjbXsOH4R6Yc82Wj
	YjlviavFw8OmhMrUinqVwVpepODmDcFkDXya3I80y7/MaBC9yOtmT9FmszQr57aXPSgPTcSNKTs
	nN7Vgbu4ZNG/IvA==
X-Google-Smtp-Source: AGHT+IEyv3kVrYIlmgHeAnLq3AxRjEMrVoo+46FdGKld4xfeBpJx0bEncQb2Yqr4jiUVqXM4bZQzPz6PEoFmag==
X-Received: from wrvb7.prod.google.com ([2002:a5d:5507:0:b0:3b9:c5f:d58b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f52:0:b0:3b7:994b:840f with SMTP id ffacd0b85a97d-3c32eccdad0mr317497f8f.57.1755640350354;
 Tue, 19 Aug 2025 14:52:30 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:35 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-8-smostafa@google.com>
Subject: [PATCH v4 07/28] iommu/arm-smmu-v3: Move TLB range invalidation into
 a macro
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_145232_563066_9332CFD2 
X-CRM114-Status: GOOD (  20.34  )
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

Range TLB invalidation has a very specific algorithm, instead of
re-writing it for the hypervisor, put it in a macro so it can be
re-used.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 59 +------------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 64 +++++++++++++++++++++
 2 files changed, 67 insertions(+), 56 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 1f765b4e36fa..41820a9180f4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2126,68 +2126,15 @@ static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
 				     struct arm_smmu_domain *smmu_domain)
 {
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	unsigned long end = iova + size, num_pages = 0, tg = 0;
-	size_t inv_range = granule;
 	struct arm_smmu_cmdq_batch cmds;
 
 	if (!size)
 		return;
 
-	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
-		/* Get the leaf page size */
-		tg = __ffs(smmu_domain->domain.pgsize_bitmap);
-
-		num_pages = size >> tg;
-
-		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
-		cmd->tlbi.tg = (tg - 10) / 2;
-
-		/*
-		 * Determine what level the granule is at. For non-leaf, both
-		 * io-pgtable and SVA pass a nominal last-level granule because
-		 * they don't know what level(s) actually apply, so ignore that
-		 * and leave TTL=0. However for various errata reasons we still
-		 * want to use a range command, so avoid the SVA corner case
-		 * where both scale and num could be 0 as well.
-		 */
-		if (cmd->tlbi.leaf)
-			cmd->tlbi.ttl = 4 - ((ilog2(granule) - 3) / (tg - 3));
-		else if ((num_pages & CMDQ_TLBI_RANGE_NUM_MAX) == 1)
-			num_pages++;
-	}
-
 	arm_smmu_cmdq_batch_init(smmu, &cmds, cmd);
-
-	while (iova < end) {
-		if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
-			/*
-			 * On each iteration of the loop, the range is 5 bits
-			 * worth of the aligned size remaining.
-			 * The range in pages is:
-			 *
-			 * range = (num_pages & (0x1f << __ffs(num_pages)))
-			 */
-			unsigned long scale, num;
-
-			/* Determine the power of 2 multiple number of pages */
-			scale = __ffs(num_pages);
-			cmd->tlbi.scale = scale;
-
-			/* Determine how many chunks of 2^scale size we have */
-			num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;
-			cmd->tlbi.num = num - 1;
-
-			/* range is num * 2^scale * pgsize */
-			inv_range = num << (scale + tg);
-
-			/* Clear out the lower order bits for the next iteration */
-			num_pages -= num << scale;
-		}
-
-		cmd->tlbi.addr = iova;
-		arm_smmu_cmdq_batch_add(smmu, &cmds, cmd);
-		iova += inv_range;
-	}
+	arm_smmu_tlb_inv_build(cmd, iova, size, granule,
+			       smmu_domain->domain.pgsize_bitmap,
+			       smmu, arm_smmu_cmdq_batch_add, &cmds);
 	arm_smmu_cmdq_batch_submit(smmu, &cmds);
 }
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 2698438cd35c..a222fb7ef2ec 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1042,6 +1042,70 @@ static inline void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
 	WRITE_ONCE(dst->l2ptr, cpu_to_le64(val));
 }
 
+/**
+ * arm_smmu_tlb_inv_build - Create a range invalidation command
+ * @cmd: Base command initialized with OPCODE (S1, S2..), vmid and asid.
+ * @iova: Start IOVA to invalidate
+ * @size: Size of range
+ * @granule: Granule of invalidation
+ * @pgsize_bitmap: Page size bit map of the page table.
+ * @smmu: Struct for the smmu, must have ::features
+ * @add_cmd: Function to send/batch the invalidation command
+ * @cmds: Incase of batching, it includes the pointer to the batch
+ */
+#define arm_smmu_tlb_inv_build(cmd, iova, size, granule, pgsize_bitmap, smmu, add_cmd, cmds) \
+{ \
+	unsigned long _iova = (iova);						\
+	size_t _size = (size);							\
+	size_t _granule = (granule);						\
+	unsigned long end = _iova + _size, num_pages = 0, tg = 0;		\
+	size_t inv_range = _granule;						\
+	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {				\
+		/* Get the leaf page size */					\
+		tg = __ffs(pgsize_bitmap);					\
+		num_pages = _size >> tg;					\
+		/* Convert page size of 12,14,16 (log2) to 1,2,3 */		\
+		cmd->tlbi.tg = (tg - 10) / 2;					\
+		/*
+		 * Determine what level the granule is at. For non-leaf, both
+		 * io-pgtable and SVA pass a nominal last-level granule because
+		 * they don't know what level(s) actually apply, so ignore that
+		 * and leave TTL=0. However for various errata reasons we still
+		 * want to use a range command, so avoid the SVA corner case
+		 * where both scale and num could be 0 as well.
+		 */								\
+		if (cmd->tlbi.leaf)						\
+			cmd->tlbi.ttl = 4 - ((ilog2(_granule) - 3) / (tg - 3));	\
+		else if ((num_pages & CMDQ_TLBI_RANGE_NUM_MAX) == 1)		\
+			num_pages++;						\
+	}									\
+	while (_iova < end) {							\
+		if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {			\
+			/*
+			 * On each iteration of the loop, the range is 5 bits
+			 * worth of the aligned size remaining.
+			 * The range in pages is:
+			 *
+			 * range = (num_pages & (0x1f << __ffs(num_pages)))
+			 */							\
+			unsigned long scale, num;				\
+			/* Determine the power of 2 multiple number of pages */	\
+			scale = __ffs(num_pages);				\
+			cmd->tlbi.scale = scale;				\
+			/* Determine how many chunks of 2^scale size we have */	\
+			num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;	\
+			cmd->tlbi.num = num - 1;				\
+			/* range is num * 2^scale * pgsize */			\
+			inv_range = num << (scale + tg);			\
+			/* Clear out the lower order bits for the next iteration */ \
+			num_pages -= num << scale;				\
+		}								\
+		cmd->tlbi.addr = _iova;						\
+		add_cmd(smmu, cmds, cmd);					\
+		_iova += inv_range;						\
+	}									\
+}										\
+
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
 void arm_smmu_sva_notifier_synchronize(void);
-- 
2.51.0.rc1.167.g924127e9c0-goog


