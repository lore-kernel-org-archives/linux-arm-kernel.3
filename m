Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C63BCCA464
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FI4iSn8zAFr7RU3MPIgQJ9gzmtZlTDgEvk+laO2rSqk=; b=Ekbtk6rB6frHQZkPEOBHtDPcou
	WxVxcmRmag5yA6qeg1EGpaHb+r5hcT1UORpgIn3EyseNTzoHYpF5DLZfAa0cB+n5pAGwow42DkM1X
	gwBUnnrDI1DO6b1bPiQQs2DVnskMzHdul0stflpfOOHkXHLwyAmVFpcUIwnuDXTMbNdz+809Qxg0S
	8zxej2/NmYNfuJt266AORapgtGLE/FkzuTqvmPEUem0thaC31NMc2yV3ZqAvbAZrKox96Wctz/u48
	B2KtSTLdllRVxal9A5Oc5FZ1GFM23IRE5SO/xaD+4QVAif0arjHi+uKWjE3EUQDFBobTK7H6jbAfH
	+kBZWquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRnR-00000001K19-19e1;
	Thu, 15 Oct 2026 20:11:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRnQ-00000001K0m-3EGZ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 20:11:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FI4iSn8zAFr7RU3MPIgQJ9gzmtZlTDgEvk+laO2rSqk=; b=L5MpBPdQ1TaVF0hRMr12zwoH8I
	sR9WE9CnpLoFaLxwNlb+B4GZAUB2YGBoObNOQJDnVBToec4B3MAFFoGJ8uxeA9TNUh6zDj2mcNASH
	Rz0CWTMZM7HQQ2CvNA6rgQSlWkNgGJKTJpBN+qa4N68sHib5YRyJQZ0C5EnGNbmj1NZEXZS3Ki6cZ
	c1bByS4z5Os6Ibs8BRpAELSUlN039xH2dAYohn47H3Ut9LptXmIMmYqlaNY03ECur9d4n1S40ECKh
	S4HNmua/fXBDIXIJea4zNcKe4bBJRENVAYhNGfGF0q8HZBf5sfNHwNmKGIjcZHe9Ccbc6qeY2Yvac
	qj041HmA==;
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHRlg-00000000nse-2ehx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:11:23 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-48b09f01f56so3642203f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094974; x=1792699774; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FI4iSn8zAFr7RU3MPIgQJ9gzmtZlTDgEvk+laO2rSqk=;
        b=PINHNE0OGsUgVcYIIWfevYK+ub7ez8GuMMHSOHXJ28LDcMue2dhdtSUz2U74VPT5Rm
         S+z6yeGInQqBDkadj8Kh1GLUzl8gCrJVznKyY3V9K35pOCI/86UikYN2ewRWGIWuxFDT
         ckAT8bC57bC/CHFiHFIxuFkOfU2k4qDmsCsXDTgDGqpE0uZqlgRinAd049owfxcnOK6b
         M103TjANYEPdWIfbrY6ZfUhW+FBPEFgPWkdUrcGZmxaMlA09uGDGmYmlWM6KszNy2rtM
         UWhgsAQ0GQimdGoN4C1pKzRxLg2FBCEupGcO2gcrpNDXmHOG9gPQTJYUmQXqAFVW/LF/
         +MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094974; x=1792699774;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FI4iSn8zAFr7RU3MPIgQJ9gzmtZlTDgEvk+laO2rSqk=;
        b=XIO38JqAnFouV3Jt+fO2aPyzGcboKe5TvfgPDWp1GABcde9RPG+Xq51hAOKrKfoWsI
         GOcqo0ugv6nmvY90diio8fsebibqNonrGyzHizrfLyzEJCxbCnyOQX/BXeWPFrd/xbAg
         ZrQr6M84ylKz51vY6EM00xgigFRymLUkTrAPStJLfXs2R9cISPd8B3osjDdl1v4fakhZ
         y+r4tu4vBsN4RFVcx8yG1Jj5oGWhzdtFyywOJxL0wX949tfwR3kE/htqSEpmLCiPVETS
         ai8DFyyr2honxGOhoc8TSqUUmkWLe7FYMucSH/wpGBHQPAxIVk+h1pNzn+erUM3vmoCF
         zJoQ==
X-Gm-Message-State: AFq9FYIRYsQufrYsZ7M+FIba6EoLsYHoB4lkHqcW+L49E3XYfv9XTIyj
	BE5bqMvsdYFRnLD33FREEbzSfrCKD3iI4QiKNSAmTNYwvc05scwxnMbYA1R0CsvH9/xKRdGTNdf
	t1kizOU+3V3YFDHbj20u5cgtaU3RxFlhos2sDHkTpwuU6sJw9CjFhCp4miW8dyDdrac3McY8u6r
	Aayj/sR3IKBrXrsE4He7pmKcseUigVktKYE7CX/sLzcqQypyJi9QksiClBB7wCKF/1Hg==
X-Received: from wrqr3.prod.google.com ([2002:a5d:4983:0:b0:48b:9d:e37d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2dc1:b0:488:8850:50ec with SMTP id ffacd0b85a97d-48de2b4d7e5mr19390320f8f.46.1792094973106;
 Thu, 15 Oct 2026 13:09:33 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:49 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-19-smostafa@google.com>
Subject: [PATCH v9 18/25] iommu/arm-smmu-v3-kvm: Shadow STEs
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_210938_214870_DF7CB0D5 
X-CRM114-Status: GOOD (  23.35  )
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

Shadow the STE when the host sends CFGI_STE: copy the host entry as is
into the hypervisor-owned stream table, which is the one the hardware
uses. For 2-level tables the host L2 table is shared and pinned while
the entry is read, and the hypervisor L2 table is allocated from the
IOMMU pool the first time its L1 slot is used.

STRTAB_BASE and STRTAB_BASE_CFG are no longer passed through: writes are
recorded while the SMMU is disabled and reads return the recorded
values.

The next patch attaches the stage-2 page table to the shadow entry.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 124 +++++++++++++++++-
 1 file changed, 118 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
index 0fa98915e00d..132f3a9ba308 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -25,6 +25,9 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 #define strtab_split(smmu)	(FIELD_GET(STRTAB_BASE_CFG_SPLIT, (smmu)->host_ste_cfg))
 #define strtab_l1_size(smmu)	((1UL << (strtab_log2size(smmu) - strtab_split(smmu))) * \
 				 (sizeof(struct arm_smmu_strtab_l1)))
+#define strtab_hyp_base(smmu)	((smmu)->features & ARM_SMMU_FEAT_2_LVL_STRTAB ? \
+				 (u64 *)(smmu)->strtab_cfg.l2.l1tab :\
+				 (u64 *)(smmu)->strtab_cfg.linear.table)
 
 #define for_each_smmu(smmu) \
 	for ((smmu) = kvm_hyp_arm_smmu_v3_smmus; \
@@ -290,6 +293,91 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+static int smmu_get_host_l2_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid,
+				struct arm_smmu_ste *host_ste_out)
+{
+	u64 *host_ste_base = hyp_phys_to_virt(strtab_host_base(smmu));
+	struct arm_smmu_strtab_l1 host_l1_desc;
+	struct arm_smmu_strtab_l2 *l2ptr;
+	phys_addr_t host_l2_tab;
+	int ret, i;
+
+	host_l1_desc.l2ptr = READ_ONCE(host_ste_base[arm_smmu_strtab_l1_idx(sid)]);
+	if (!(le64_to_cpu(host_l1_desc.l2ptr) & STRTAB_L1_DESC_SPAN))
+		return -EINVAL;
+
+	host_l2_tab = le64_to_cpu(host_l1_desc.l2ptr) & STRTAB_L1_DESC_L2PTR_MASK;
+	/* Share and pin the table before accessing it. */
+	ret = smmu_share_pages(host_l2_tab, sizeof(struct arm_smmu_strtab_l2));
+	if (ret)
+		return ret;
+
+	l2ptr = hyp_phys_to_virt(host_l2_tab);
+
+	for (i = 0; i < STRTAB_STE_DWORDS; ++i)
+		host_ste_out->data[i] =
+			READ_ONCE(l2ptr->stes[arm_smmu_strtab_l2_idx(sid)].data[i]);
+
+	WARN_ON(smmu_unshare_pages(host_l2_tab, sizeof(struct arm_smmu_strtab_l2)));
+	return 0;
+}
+
+static int smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool leaf)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	struct arm_smmu_ste *hyp_ste_ptr, *host_ste_ptr, host_ste_copy;
+	u64 *hyp_ste_base = strtab_hyp_base(smmu);
+	int ret, i;
+
+	/* Leaf = 0 is not supported, as the kernel driver. */
+	if (!leaf || !is_smmu_enabled(smmu) ||
+	    (sid >= (1UL << strtab_log2size(smmu))))
+		return -EINVAL;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)) {
+		struct arm_smmu_ste *hyp_table = (struct arm_smmu_ste *)hyp_ste_base;
+		u64 *host_ste_base = hyp_phys_to_virt(strtab_host_base(smmu));
+		struct arm_smmu_ste *host_table = (struct arm_smmu_ste *)host_ste_base;
+
+		if (sid >= cfg->linear.num_ents)
+			return -E2BIG;
+
+		hyp_ste_ptr = &hyp_table[sid];
+		host_ste_ptr = &host_table[sid];
+	} else {
+		struct arm_smmu_strtab_l1 *l1tab = (struct arm_smmu_strtab_l1 *)hyp_ste_base;
+		u32 l1_idx = arm_smmu_strtab_l1_idx(sid);
+		struct arm_smmu_strtab_l2 *l2ptr;
+
+		if (l1_idx >= cfg->l2.num_l1_ents)
+			return -E2BIG;
+
+		host_ste_ptr = &host_ste_copy;
+		ret = smmu_get_host_l2_ste(smmu, sid, host_ste_ptr);
+		if (ret)
+			return ret;
+
+		/* No hypervisor entry, first time the L2 is populated. */
+		if (!l1tab[l1_idx].l2ptr) {
+			struct arm_smmu_strtab_l2 *l2table;
+
+			l2table = pkvm_iommu_alloc_pages(get_order(sizeof(*l2table)));
+			if (!l2table)
+				return -ENOMEM;
+			/* Ensure L2 is observed before writing the ptr. */
+			dma_wmb();
+			arm_smmu_write_strtab_l1_desc(&l1tab[l1_idx], hyp_virt_to_phys(l2table));
+		}
+		l2ptr = hyp_phys_to_virt(le64_to_cpu(l1tab[l1_idx].l2ptr) &
+				STRTAB_L1_DESC_L2PTR_MASK);
+		hyp_ste_ptr = &l2ptr->stes[arm_smmu_strtab_l2_idx(sid)];
+	}
+
+	for (i = 0; i < STRTAB_STE_DWORDS; ++i)
+		WRITE_ONCE(hyp_ste_ptr->data[i], host_ste_ptr->data[i]);
+	return 0;
+}
+
 static int smmu_init_strtab(struct hyp_arm_smmu_v3_device *smmu)
 {
 	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
@@ -410,8 +498,24 @@ static bool smmu_filter_command(struct hyp_arm_smmu_v3_device *smmu, u64 *comman
 
 	switch (type) {
 	case CMDQ_OP_CFGI_STE:
-		/* TBD: SHADOW_STE*/
+	{
+		u32 leaf = FIELD_GET(CMDQ_CFGI_1_LEAF, command[1]);
+		u32 sid = FIELD_GET(CMDQ_CFGI_0_SID, command[0]);
+		int ret;
+
+		/*
+		 * If STE update is required, flush the CMDQ and drop the lock as that
+		 * might require to update the host page table and acquire its lock.
+		 */
+		writel(smmu->cmdq.llq.prod, smmu->cmdq.prod_reg);
+		hyp_spin_unlock(&smmu->hw_lock);
+		ret = smmu_reshadow_ste(smmu, sid, leaf);
+		hyp_spin_lock(&smmu->hw_lock);
+		if (ret)
+			return true;
+
 		break;
+	}
 	case CMDQ_OP_CFGI_ALL:
 	{
 		/*
@@ -627,25 +731,33 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			val = smmu->cmdq_host.llq.cons | (CMDQ_CONS_ERR & cons);
 			goto out_update_regs;
 		}
-	/* Passthrough the register access for bisectability, handled later */
 	case ARM_SMMU_STRTAB_BASE:
+		if (len != sizeof(u64))
+			break;
 		if (is_write) {
 			/* Must only be written when SMMU_CR0.SMMUEN == 0. */
 			if (is_smmu_enabled(smmu))
 				break;
 			smmu->host_ste_base = val;
+			goto out_ret;
+		} else {
+			val = smmu->host_ste_base;
+			goto out_update_regs;
 		}
-		mask = read_write;
-		break;
 	case ARM_SMMU_STRTAB_BASE_CFG:
+		if (len != sizeof(u32))
+			break;
 		if (is_write) {
 			/* Must only be written when SMMU_CR0.SMMUEN == 0. */
 			if (is_smmu_enabled(smmu))
 				break;
 			smmu->host_ste_cfg = val;
+			goto out_ret;
+		} else {
+			val = smmu->host_ste_cfg;
+			goto out_update_regs;
 		}
-		mask = read_write;
-		break;
+	/* Passthrough the register access for bisectability, handled later */
 	case ARM_SMMU_GBPA:
 		mask = read_write;
 		break;
-- 
2.56.0.176.g3575e65682-goog


