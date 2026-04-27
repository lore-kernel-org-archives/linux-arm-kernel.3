Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA68FFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgBGkEBwHEP2ZJytzCulPLbx2/rNMvsHtaAvCI3IiZ4=; b=DHHVfnGtClu4S15/H0t6osz4VA
	p+G04SQmzV80WPgKWYzDlB37DeTDk4j53GlBf7dTFYfRj33QFDuT3nl0Z1IkVkFbqPxcNq/yzVo7d
	DTINpnyfJdkpsup3GNBZnpL5GqRWe2ZkucrsG4oFrYYRj776qzE22KsYaUAcKS1c1UD1WlXOWhIXY
	PFmp2uHM6lcbOViyfU6Ot2sxecnA7mngogzg08eO9ZJGulCRoKdInzWd8HJsNRamXDmAGtztnyqdx
	ynnorzuv/robt+v6er7GdVwQQ5tmhXM1+eNBLKEyByvHIkkVAasUsptW9QEzPanisaeIav9YV7v+o
	nqlCU61A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHjU-0000000GUra-0TxQ;
	Mon, 27 Apr 2026 08:54:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHjT-0000000GUqI-0yAc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:54:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CD6561143;
	Mon, 27 Apr 2026 08:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A8AC2BCC7;
	Mon, 27 Apr 2026 08:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777280062;
	bh=5JldwqOz6d/PQ2tCB2GyOBMM1LTQvdiuh2P5MyoFZj8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kQyUFNwHTNq2nEzzkyEHIG3YexRLfjKtRrIW3nX86jeTpN/EsGThSRpCTBF8UY6Ac
	 Qndek+3O6W4fP1zkWtklb4FSyaxwmhYzpQKK4L/e8zG5Pg1ealJqcMHUxhzEoWoA0x
	 kjceO2++YsQi0chVfMPOzH3IGpJcgNxKtR1L10ElbvTgQ3BLeECbkmH5PlyZEOFJ7A
	 2tn7VyXCq704khvDIPMz1oRf5SYfJKsYenfHmTqQoe3wZe7uhhZDRhsxgR9iEd6YIn
	 324My719A/DRmp3L0JnZHaSUGgk4IUYCV4kswIM0gEYfLQGnVLOer0Tj1anC6qCC0A
	 dhSDPubODbADA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH v4 04/16] iommu/arm-smmu-v3: Track realm pSMMU users with refcount_t
Date: Mon, 27 Apr 2026 14:23:32 +0530
Message-ID: <20260427085344.941627-5-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427085344.941627-1-aneesh.kumar@kernel.org>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Replace the realm pSMMU active-state boolean with a refcount so
activation/deactivation is tied to actual Realm vIOMMU lifetime.

- add realm_mutex and realm_users (refcount_t) to struct arm_smmu_device
- on first Realm init, activate pSMMU and set realm_users to 1
- on subsequent Realm inits, increment realm_users
- on Realm viommu destroy, decrement realm_users and call
  rmi_psmmu_deactivate() when the last user drops the count to 0

This removes duplicated state tracking and ensures pSMMU is deactivated only
after the last Realm user is gone.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rmi_cmds.h             |  1 +
 arch/arm64/kernel/rmi.c                       | 12 ++++++
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-realm.c | 39 +++++++++++++++----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  3 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  4 +-
 5 files changed, 50 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
index 659d68ad5f1d..205fc200d1db 100644
--- a/arch/arm64/include/asm/rmi_cmds.h
+++ b/arch/arm64/include/asm/rmi_cmds.h
@@ -865,6 +865,7 @@ static inline unsigned long rmi_psmmu_event_consume(unsigned long psmmu_phys,
 
 int rmi_psmmu_activate(unsigned long psmmu_phys,
 	       unsigned long psmmu_params_phys, unsigned long *rmi_ret);
+int rmi_psmmu_deactivate(unsigned long psmmu_phys, unsigned long *rmi_ret);
 int rmi_psmmu_st_l2_create(unsigned long psmmu_phys,
 		   unsigned long stream_id, unsigned long *rmi_ret);
 int rmi_psmmu_st_l2_destroy(unsigned long psmmu_phys,
diff --git a/arch/arm64/kernel/rmi.c b/arch/arm64/kernel/rmi.c
index cc4050db5a6a..884ab3f99f2f 100644
--- a/arch/arm64/kernel/rmi.c
+++ b/arch/arm64/kernel/rmi.c
@@ -436,6 +436,18 @@ int rmi_psmmu_activate(unsigned long psmmu_phys,
 	return 0;
 }
 
+int rmi_psmmu_deactivate(unsigned long psmmu_phys, unsigned long *rmi_ret)
+{
+	struct rmi_sro_state *sro __free(sro) =
+		rmi_sro_init(SMC_RMI_PSMMU_DEACTIVATE, psmmu_phys);
+	if (!sro)
+		return -ENOMEM;
+
+	*rmi_ret = rmi_sro_execute(sro);
+
+	return 0;
+}
+
 int rmi_psmmu_st_l2_create(unsigned long psmmu_phys,
 		   unsigned long stream_id, unsigned long *rmi_ret)
 {
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-realm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-realm.c
index 6f8de7cead9d..dfff493f96d0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-realm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-realm.c
@@ -124,9 +124,25 @@ void arm_smmu_setup_realm_irqs(struct arm_smmu_device *smmu)
 	}
 }
 
+static bool arm_realm_smmu_active(struct arm_smmu_device *smmu)
+{
+	lockdep_assert_held(&smmu->realm_mutex);
+	return refcount_read(&smmu->realm_users) > 0;
+}
+
 static void arm_realm_smmu_v3_destroy(struct iommufd_viommu *viommu)
 {
-	/* When we add refcount psmmu deactivate here. */
+	unsigned long rmi_ret;
+	struct arm_smmu_device *smmu =
+		container_of(viommu->iommu_dev, struct arm_smmu_device, iommu);
+
+	guard(mutex)(&smmu->realm_mutex);
+	if (WARN_ON(!arm_realm_smmu_active(smmu)))
+		return;
+
+	if (refcount_dec_and_test(&smmu->realm_users) &&
+	    (rmi_psmmu_deactivate(smmu->base_phys, &rmi_ret) || rmi_ret))
+		dev_warn(smmu->dev, "failed to deactivate realm pSMMU\n");
 }
 
 static void arm_realm_smmu_v3_vdevice_destroy(struct iommufd_vdevice *vdev)
@@ -140,7 +156,8 @@ static void arm_realm_smmu_v3_vdevice_destroy(struct iommufd_vdevice *vdev)
 	unsigned long rmi_ret = 0;
 	int ret;
 
-	if (!smmu->realm_initialized)
+	guard(mutex)(&smmu->realm_mutex);
+	if (!arm_realm_smmu_active(smmu))
 		return;
 
 	ret = rmi_psmmu_st_l2_destroy(smmu->base_phys,
@@ -168,7 +185,8 @@ static int arm_realm_smmu_v3_vdevice_init(struct iommufd_vdevice *vdev)
 	unsigned long rmi_ret = 0;
 	int ret;
 
-	if (!smmu->realm_initialized)
+	guard(mutex)(&smmu->realm_mutex);
+	if (!arm_realm_smmu_active(smmu))
 		return -EINVAL;
 
 	ret = rmi_psmmu_st_l2_create(smmu->base_phys,
@@ -229,12 +247,17 @@ int arm_realm_smmu_v3_init(struct iommufd_viommu *viommu,
 	if (!(smmu->features & ARM_SMMU_FEAT_RME))
 		return -EOPNOTSUPP;
 
-	if (smmu->realm_initialized)
+	mutex_lock(&smmu->realm_mutex);
+	if (arm_realm_smmu_active(smmu)) {
+		refcount_inc(&smmu->realm_users);
 		goto psmmu_already_active;
+	}
 
 	params = (struct rmi_psmmu_params *)get_zeroed_page(GFP_KERNEL);
-	if (!params)
-		return -ENOMEM;
+	if (!params) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
 
 	/* No ATS and PRI support */
 	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
@@ -261,12 +284,14 @@ int arm_realm_smmu_v3_init(struct iommufd_viommu *viommu,
 		dev_warn(smmu->dev, "failed to activate realm pSMMU\n");
 		ret = -EIO;
 	} else {
-		smmu->realm_initialized = true;
+		refcount_set(&smmu->realm_users, 1);
 	}
 out_free:
 	free_page((unsigned long)params);
 psmmu_already_active:
 	if (!ret)
 		viommu->ops = &arm_realm_smmu_v3_ops;
+out_unlock:
+	mutex_unlock(&smmu->realm_mutex);
 	return ret;
 }
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 1e3d4d682e32..e458c3818c34 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3946,6 +3946,8 @@ static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
 	int ret;
 
 	mutex_init(&smmu->streams_mutex);
+	mutex_init(&smmu->realm_mutex);
+	refcount_set(&smmu->realm_users, 0);
 	smmu->streams = RB_ROOT;
 
 	ret = arm_smmu_init_queues(smmu);
@@ -3956,7 +3958,6 @@ static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
 	if (ret)
 		return ret;
 
-	smmu->realm_initialized = false;
 	if (smmu->impl_ops && smmu->impl_ops->init_structures)
 		return smmu->impl_ops->init_structures(smmu);
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index d528b3212d38..b5d0e1341236 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -13,6 +13,7 @@
 #include <linux/iommufd.h>
 #include <linux/kernel.h>
 #include <linux/mmzone.h>
+#include <linux/refcount.h>
 #include <linux/sizes.h>
 
 struct arm_smmu_device;
@@ -812,7 +813,8 @@ struct arm_smmu_device {
 	struct rb_root			streams;
 	struct mutex			streams_mutex;
 
-	bool realm_initialized;
+	struct mutex			realm_mutex;
+	refcount_t			realm_users;
 };
 
 struct arm_smmu_stream {
-- 
2.43.0


