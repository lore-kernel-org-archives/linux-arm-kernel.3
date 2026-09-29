Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CCACA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oppeuWMIuYJb2+RCyuh9zePmLDu8NMomw2YlOiRHYbs=; b=bacBLgopRg1+gKfN1ivjr3G6rL
	NXX/3a1MVS17ZHKY5Gvv4MFWqY6WhQjCxkJIUK6N9/OS5tdbjqH2t+iDikENG/fb00mHrDSzxgT7U
	sbiopnOElmxYWLk1yqgiGdVAmhc1zAJIBGdt2fQ4d7eYC/hgCNpb+BeG35UrUEVPX/uAVqonQr+Rs
	HBB60pk30AvlHBWgVK4dFnBTCsIh7wjYKghgJE2+kmUKujpRILzaS2IwP7JQSKiT6O2oyuiGTWXtn
	FSvn7YOrRAjNFUqx3rP/Fl3Aqnx5XyWJQR7jJRmTgvG5xXSAjovFOW14MajNvVwRNUuI1FeK/QXv7
	HLD+4egw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBS8G-00000002aL1-1UWA;
	Tue, 29 Sep 2026 07:20:09 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBS85-00000002aDJ-0HsB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:19:58 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cc1b8088202so2722606a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790666396; x=1791271196; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oppeuWMIuYJb2+RCyuh9zePmLDu8NMomw2YlOiRHYbs=;
        b=Oi+VM87+onn23rEXIXIaSzO2++KvpSvTmt4gykdYYtjlA35LpGaYx2uYO/kSejckdW
         VPzfVPy+Adg+RT4s5uVmdl70JBAluw1EjS5E9bWlTpdW0OcTySuiSUvZaK39WmksGdph
         Wl0be4XV5VQx2FY539yuBfPIdOS0yK5PfQ9NLzvt6IOF/bCw8qXEfT8fWsYx5zUqhTWn
         YbAmn/sn5S7/hr7Hb/nIO+JrD92LHKOEECBgKGjnQQdknbG+nsg+uxggh8DuSeBv6VX6
         VxbdEe7Dzg4cO9vqkma9tOeRzLvddnJDUsLXts8awPPWr41GhUTqVl3tXMVx22W9yaag
         lmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666396; x=1791271196;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oppeuWMIuYJb2+RCyuh9zePmLDu8NMomw2YlOiRHYbs=;
        b=xFVG10/6iinwm+Pd4lPZDnbakclq7ei7H6VF4nnHYfMqN4EccLoyS+BnemC0mxfTKd
         97PuOUO6I/tJ5UKBA1SgHZIoit/NbMaxziCUuyEvUKHTg/e268zxhAbEwSSedngSfJmu
         zM0PADycSI+StfCrGwDQqTkI4A0O++U/6wwAG7rseM1WfUB8YQ7Xc82dAd6jqdv0U+hC
         /8+l+pVHfSfu8d7H1ECBrTdqieM2oWqPYAOKFdBcRMLMbj0OJbH4x5oziXkapZ6B4IT9
         qrI0TtDskid6xwSKLSX7e7DlqzXvq/xeteaGkDzvtRH1Hwq5WbVXGoMMXkeyc9GuLU2P
         jpIg==
X-Forwarded-Encrypted: i=1; AKwUvBx9HF48I1l3RuRnobsXLrldPgzLdnDOYYmCuy506VrLyknR3uBnqaZyeIorYjGUade0i4J8T9ec+cPqDl81f8zM@lists.infradead.org
X-Gm-Message-State: AFuF++lUBdKGUEqm3sAUC9HfGi+pYZJkr6vI0l/mC+txT0rr8g+PwshX
	CoDv2lwbaJvgRuec3K566DOJGXJbPVkODnmPy/3pniNUuIEqEpuJaEFFbyt/WRnZjGR+Iopt4XQ
	1fQ==
X-Received: from pga22.prod.google.com ([2002:a05:6a02:4f96:b0:cc7:97c8:bb2d])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d1d:b0:3d3:af44:ee12
 with SMTP id adf61e73a8af0-3de0e76eb53mr14711712637.27.1790666395477; Tue, 29
 Sep 2026 00:19:55 -0700 (PDT)
Date: Tue, 29 Sep 2026 07:19:42 +0000
In-Reply-To: <20260929071950.2710070-1-praan@google.com>
Mime-Version: 1.0
References: <20260929071950.2710070-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929071950.2710070-2-praan@google.com>
Subject: [RFC PATCH v1 1/9] iommu/kho: Extend IOMMU KHO ABI for ARM SMMUv3
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
X-CRM114-CacheID: sfid-20260929_001957_117691_85823E45 
X-CRM114-Status: GOOD (  13.53  )
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

Extend the KHO IOMMU ABI to support state preservation for Arm SMMUv3.

Introduce struct iommu_smmuv3_hw_ser to capture SMMU hardware state,
including the register base, Stream Table config and Live Update state
tokens for the preserved Stream Tables.

Additionally, introduce struct iommu_master_smmuv3_ser to capture per
master state. For now it is used to preserve CD tables for Stage-1
translation.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 include/linux/kho/abi/iommu.h | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/linux/kho/abi/iommu.h b/include/linux/kho/abi/iommu.h
index 308cd83fd3e3..397fdb0449a6 100644
--- a/include/linux/kho/abi/iommu.h
+++ b/include/linux/kho/abi/iommu.h
@@ -82,6 +82,7 @@
 enum iommu_type_ser {
 	IOMMU_INVALID,
 	IOMMU_INTEL,
+	IOMMU_ARM_SMMUV3,
 };
 
 #define IOMMU_SER_FLAG_DELETED	(1 << 0)
@@ -142,6 +143,23 @@ struct iommu_device_intel_ser {
 	u64 max_pasid;
 } __packed;
 
+/**
+ * struct iommu_master_smmuv3_ser - SMMUv3 specific device state
+ * @l1_cdtab_lu_state: Live update state token for the linear/L1 CD table
+ * @num_l2_cdtables: Number of active L2 CD tables preserved
+ * @l2_cdtab_lu_states_phys: Physical pointer to an array of u64 LU state tokens
+ *                           for the active L2 CD tables (0 if linear)
+ *
+ * Note: Currently unused for Stage-2 Live Update. Reserved for future
+ * preservation of Stage-1 per-device Context Descriptor (CD) tables.
+ */
+struct iommu_master_smmuv3_ser {
+	u64 l1_cdtab_lu_state;
+	u32 num_l2_cdtables;
+	u32 padding;
+	u64 l2_cdtab_lu_states_phys;
+} __packed;
+
 /**
  * struct iommu_device_ser - Serialized state of a device
  * @hdr: Common object header
@@ -159,6 +177,7 @@ struct iommu_device_ser {
 	struct iommu_dev_map_ser domain_iommu_ser;
 	union {
 		struct iommu_device_intel_ser intel;
+		struct iommu_master_smmuv3_ser smmuv3;
 	};
 } __packed;
 
@@ -181,6 +200,22 @@ struct iommu_intel_ser {
 	u64 context_tables_bitmap[VTD_PRESERVED_BITMAP_LONGS];
 };
 
+/**
+ * struct iommu_smmuv3_hw_ser - SMMUv3 specific hardware state
+ * @phys_addr: Physical address of the SMMU register base
+ * @strtab_base_cfg: STRTAB_BASE_CFG register value
+ * @l1_strtab_lu_state: Live update state token for the linear table OR the L1 table
+ * @l2_strtab_lu_states_phys: Physical pointer to an array of u64 LU state tokens
+ *                            indexed by L1 index, 0 for L2 tables that aren't
+ *                            preserved (0 if linear)
+ */
+struct iommu_smmuv3_hw_ser {
+	u64 phys_addr;
+	u64 strtab_base_cfg;
+	u64 l1_strtab_lu_state;
+	u64 l2_strtab_lu_states_phys;
+} __packed;
+
 /**
  * struct iommu_hw_ser - Serialized state of an IOMMU instance
  * @hdr: Common object header
@@ -194,6 +229,7 @@ struct iommu_hw_ser {
 	u64 type;
 	union {
 		struct iommu_intel_ser intel;
+		struct iommu_smmuv3_hw_ser smmuv3;
 	};
 } __packed;
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


