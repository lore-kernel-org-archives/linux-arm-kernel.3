Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8AFCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRnyONsjTJbkTxhyik3N20LZxPVoNoJ2Z/LPgYbbOw0=; b=GTPEuiyyZg++2jvXQG8UuA7OkK
	j6aHQNC6E4cT8MuWAPsa1fhYhdZleLa1BY6zTEJSWIOlKtkt9qgQgaXv8iqM7lcDEUFTVsM9am3rB
	05pUf3nIbNak/NfZRoQFvQaJvx9bwy5uWRH2T6C6txdOHbrSvjTE0bOC7i6fYbWTS20FpedIPIG3d
	x/zdmbs9JXSqQaZUeIL3QIxYiUX3Z8hkO2T35CYXQk+AzsOWC8Ej+pjLejAqmzC+USHSIUxySnP9M
	tRPZI4bW67ihQvHuGqtW1VOvn2DCa/3PEBnJoqK70oKNWrjhfJI6CD1BwO30zjsE5JHVdqc/anmhK
	6ytQW6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBS8H-00000002aNF-44iC;
	Tue, 29 Sep 2026 07:20:09 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBS8D-00000002aIa-0AC8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:20:06 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2db87f759c5so39126875ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790666403; x=1791271203; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRnyONsjTJbkTxhyik3N20LZxPVoNoJ2Z/LPgYbbOw0=;
        b=K7P06cyAPUa3S3AkdvfoR5Y/P12ZIGT5rFNR8d12uehD4qzDuBdZAGLjFIWaXCT0p7
         OA2Fiq3guUCkGt5Oglt4I9Y77Gh6loPkBtWVQvK+RlAMq+A3XgpCJEYgpQlyNVfABdB8
         56gjrb+hojNPGdcbJYJLZI2XipMTmnEeQdo1diHYQcF0m1x1qe1iPEAhk4DupKYlH9dP
         mqCyUWteo3BHkVZ/dfUPBh7Ec4TLtV7O/v1z4CU87MSB1YkW9T52FFvNQAuBFcNARs+G
         pzZ1nrh2N62VM216wzf9m2jV0dy+FuXBivNou1ogPjmRAKsmHoN5AIzKirN8Euh3jw4Y
         lbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666403; x=1791271203;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LRnyONsjTJbkTxhyik3N20LZxPVoNoJ2Z/LPgYbbOw0=;
        b=0AY0yDGFEMrNuR+l636OplTmQVY16r7UT2BQCGAF8YUC1KouiAwjTdEUJUHXzuo5SX
         FkmTPOaaNbW1pVJ7BTUO/O227Rl8S3aFnvNk9YO+m6fsee1xosGjNLOyDqRkrlsIXvXr
         jV0H8itvaeTKyU72mAHvZsbgeG+pvUbQwvsmTwLDvSuc0NY9lrBJtw99/RIGdP9Duv40
         EiyHNuMFuNo4mOoq/hBKx7qTfjbJe0DFvqCjS15DErZF2DNHGu8EepTBk2MgunuxcBuq
         i9CFp1SxTVJjosT78NblMsO/TCpBV5ZhNf0LblqwBVp46J5eQ2fvb1YjbOs1efwsOZZN
         nc1g==
X-Forwarded-Encrypted: i=1; AKwUvBzBYqgiwDdL6FMT4494amHuC5YfD2Ob1mXFiGEf47RLAP8St1Zyc70HqtN2NHZAwT0Mri7Ut9DhLu8a2WYJWf91@lists.infradead.org
X-Gm-Message-State: AFq9FYKd2WSWbyBlvIRCg4dYbNXB3g6H08QykoLbuXOHRiu/t9hOF9xh
	ZErXlussQN866giZCvymSfvZarXEN9V7N9s44j35IRaheCTLytdFMV8mqJN79HMzcJoqEueQmcA
	50g==
X-Received: from plbjk15.prod.google.com ([2002:a17:903:330f:b0:2e2:bc36:1c7b])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c40b:b0:2df:84e0:902f
 with SMTP id d9443c01a7336-2df84e098a5mr113133195ad.9.1790666403094; Tue, 29
 Sep 2026 00:20:03 -0700 (PDT)
Date: Tue, 29 Sep 2026 07:19:45 +0000
In-Reply-To: <20260929071950.2710070-1-praan@google.com>
Mime-Version: 1.0
References: <20260929071950.2710070-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929071950.2710070-5-praan@google.com>
Subject: [RFC PATCH v1 4/9] iommu/arm-smmu-v3: Implement Live Update Stream
 Table restoration
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Nicolin Chen <nicolinc@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, 
	Samiullah Khawaja <skhawaja@google.com>, David Matlack <dmatlack@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Daniel Mentz <danielmentz@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_002005_083244_7BBA4497 
X-CRM114-Status: GOOD (  21.44  )
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

During the boot phase of a Kexec Handover (KHO), the incoming kernel
must adopt the preserved SMMU Stream Table to seamlessly inherit the
IOMMU state from the outgoing kernel.

Restore it in arm_smmu_init_strtab() using the kexec helpers to validate
the live STRTAB_BASE{,_CFG} and reserve the in-use ASIDs/VMIDs. Enable
ARM_SMMU_V3_KEXEC for IOMMU_LIVEUPDATE for this.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/Kconfig                     |   2 +-
 .../arm/arm-smmu-v3/arm-smmu-v3-liveupdate.c  | 142 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |   4 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   6 +
 4 files changed, 153 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
index ad1693e3b9c8..8f98d3ad984a 100644
--- a/drivers/iommu/arm/Kconfig
+++ b/drivers/iommu/arm/Kconfig
@@ -113,7 +113,7 @@ config ARM_SMMU_V3_IOMMUFD
 
 # Common helpers for a kexec'd kernel, e.g. kdump adoption and live update
 config ARM_SMMU_V3_KEXEC
-	def_bool CRASH_DUMP
+	def_bool CRASH_DUMP || IOMMU_LIVEUPDATE
 
 config ARM_SMMU_V3_KUNIT_TEST
 	tristate "KUnit tests for arm-smmu-v3 driver"  if !KUNIT_ALL_TESTS
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-liveupdate.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-liveupdate.c
index 38b9d4e4ab4d..4998234e1e7a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-liveupdate.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-liveupdate.c
@@ -429,4 +429,146 @@ void arm_smmu_unpreserve(struct iommu_device *iommu,
 		arm_smmu_unpreserve_strtab_linear(smmu, iommu_ser);
 }
 
+static int arm_smmu_liveupdate_restore_strtab_2lvl(struct arm_smmu_device *smmu,
+						   struct iommu_hw_ser *iommu_ser,
+						   u32 cfg_reg, phys_addr_t base)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	u32 num_l1_ents, i;
+	u64 *l2_states;
+	int ret;
+
+	if (!iommu_ser->smmuv3.l2_strtab_lu_states_phys)
+		return -EINVAL;
+	l2_states = phys_to_virt(iommu_ser->smmuv3.l2_strtab_lu_states_phys);
+
+	ret = arm_smmu_kexec_parse_strtab_2lvl(smmu, cfg_reg, base,
+					       &num_l1_ents);
+	if (ret)
+		goto out_free_states;
+	cfg->l2.num_l1_ents = num_l1_ents;
+
+	ret = -ENOMEM;
+	cfg->l2.l1tab = dmam_restore_coherent_allocation(smmu->dev,
+			num_l1_ents * sizeof(*cfg->l2.l1tab), &cfg->l2.l1_dma,
+			GFP_KERNEL, iommu_ser->smmuv3.l1_strtab_lu_state);
+	if (!cfg->l2.l1tab)
+		goto out_free_states;
+
+	cfg->l2.l2ptrs = devm_kcalloc(smmu->dev, num_l1_ents,
+				      sizeof(*cfg->l2.l2ptrs), GFP_KERNEL);
+	if (!cfg->l2.l2ptrs)
+		goto out_free_states;
+
+	/* The outgoing .shutdown cleared the L1 STDs of unpreserved L2 tables */
+	for (i = 0; i < num_l1_ents; i++) {
+		u64 l1_desc = le64_to_cpu(cfg->l2.l1tab[i].l2ptr);
+		phys_addr_t l2_base;
+		dma_addr_t l2_dma;
+
+		ret = arm_smmu_kexec_check_strtab_l1_desc(smmu, l1_desc, i,
+							  &l2_base);
+		if (ret == 1)
+			continue;
+		if (ret)
+			goto out_free_states;
+
+		if (!l2_states[i]) {
+			dev_err(smmu->dev, "L1[%u] has no preserved L2 table\n",
+				i);
+			ret = -EINVAL;
+			goto out_free_states;
+		}
+
+		l2_dma = l2_base;
+		cfg->l2.l2ptrs[i] = dmam_restore_coherent_allocation(smmu->dev,
+				sizeof(*cfg->l2.l2ptrs[i]), &l2_dma, GFP_KERNEL,
+				l2_states[i]);
+		if (!cfg->l2.l2ptrs[i]) {
+			ret = -ENOMEM;
+			goto out_free_states;
+		}
+	}
+	ret = 0;
+
+out_free_states:
+	kho_restore_free(l2_states);
+	return ret;
+}
+
+static int
+arm_smmu_liveupdate_restore_strtab_linear(struct arm_smmu_device *smmu,
+					  struct iommu_hw_ser *iommu_ser,
+					  u32 cfg_reg, phys_addr_t base)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	u32 num_ents;
+	int ret;
+
+	ret = arm_smmu_kexec_parse_strtab_linear(smmu, cfg_reg, base,
+						 &num_ents);
+	if (ret)
+		return ret;
+	cfg->linear.num_ents = num_ents;
+
+	cfg->linear.table = dmam_restore_coherent_allocation(smmu->dev,
+			num_ents * sizeof(*cfg->linear.table),
+			&cfg->linear.ste_dma, GFP_KERNEL,
+			iommu_ser->smmuv3.l1_strtab_lu_state);
+	if (!cfg->linear.table)
+		return -ENOMEM;
+	return 0;
+}
+
+/*
+ * Take over the stream table left programmed by the previous kernel and
+ * reserve the ASIDs/VMIDs used by the preserved STEs. Returns -ENOENT if
+ * nothing was preserved for this SMMU.
+ */
+int arm_smmu_liveupdate_restore_strtab(struct arm_smmu_device *smmu)
+{
+	u32 cfg_reg = readl_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
+	u64 base_reg = readq_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE);
+	bool is_2lvl = smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB;
+	phys_addr_t base = base_reg & STRTAB_BASE_ADDR_MASK;
+	u32 fmt = FIELD_GET(STRTAB_BASE_CFG_FMT, cfg_reg);
+	struct iommu_hw_ser *iommu_ser;
+	int ret;
+
+	iommu_ser = iommu_get_preserved_data(smmu->base_phys, IOMMU_ARM_SMMUV3);
+	if (!iommu_ser)
+		return -ENOENT;
+
+	if (cfg_reg != iommu_ser->smmuv3.strtab_base_cfg) {
+		dev_err(smmu->dev, "STRTAB_BASE_CFG changed across live update\n");
+		return -EINVAL;
+	}
+
+	/* The preserving kernel always uses a 2-level table when supported */
+	if (fmt == STRTAB_BASE_CFG_FMT_2LVL && is_2lvl)
+		ret = arm_smmu_liveupdate_restore_strtab_2lvl(smmu, iommu_ser,
+							      cfg_reg, base);
+	else if (fmt == STRTAB_BASE_CFG_FMT_LINEAR && !is_2lvl)
+		ret = arm_smmu_liveupdate_restore_strtab_linear(smmu, iommu_ser,
+								cfg_reg, base);
+	else
+		ret = -EINVAL;
+	if (ret) {
+		dev_err(smmu->dev, "failed to restore stream table: %d\n", ret);
+		return ret;
+	}
+
+	/* Keep new domains off the ASIDs/VMIDs used by the preserved STEs */
+	ret = arm_smmu_kexec_scan_and_resv_ids(smmu);
+	if (ret) {
+		dev_err(smmu->dev, "failed to reserve in-use ASIDs/VMIDs\n");
+		arm_smmu_kexec_unresv_ids(smmu);
+		return ret;
+	}
+
+	dev_info(smmu->dev, "restored preserved %s stream table\n",
+		 is_2lvl ? "2-level" : "linear");
+	return 0;
+}
+
 #endif
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index ae4a1c98228c..c8bcf901f1c8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4772,6 +4772,10 @@ static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
 	    !arm_smmu_kdump_adopt_strtab(smmu))
 		return 0;
 
+	ret = arm_smmu_liveupdate_restore_strtab(smmu);
+	if (ret != -ENOENT)
+		return ret;
+
 	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
 		ret = arm_smmu_init_strtab_2lvl(smmu);
 	else
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 7bce5bbe75e5..6b75f48671f8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1208,6 +1208,12 @@ void arm_smmu_unpreserve_device(struct device *dev,
 				struct iommu_device_ser *device_ser);
 void arm_smmu_unpreserve(struct iommu_device *iommu,
 			 struct iommu_hw_ser *iommu_ser);
+int arm_smmu_liveupdate_restore_strtab(struct arm_smmu_device *smmu);
+#else
+static inline int arm_smmu_liveupdate_restore_strtab(struct arm_smmu_device *smmu)
+{
+	return -ENOENT;
+}
 #endif
 
 static inline void arm_smmu_domain_free(struct arm_smmu_domain *smmu_domain)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


