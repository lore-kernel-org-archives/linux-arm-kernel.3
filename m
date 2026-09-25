Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E676C98318
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 01:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wql0u/3ksmOdy8r//TkBURdk2dF75TPdcHGkWL4FBiE=; b=ddFQ1zZpKFEXsiNC5ZxELmfWiM
	4b7LuQqQJBfifagXlFmGZwZMbws57hBOBfiCsZvWjRWHvNUir+BYRc1em7HtNnLxiYW18naBC29Pi
	nzlppoXwD80b95FUkH1hs9iV9M7ejbtvQ3a2kDnbX26SdLWFFnng1IlWJ8d+Me0bLhB8TEs488xhp
	szPX/WrfJQjpIS9U6Dca7BhGEetI3w/FyTIKbEbpPsAynWFexP3lqOdROHmaa5qC+md1XkQ1J9JId
	4H5cVczOzdgCl5CyHDkk0jlIjdmYtXtQKAzd9C/EhGytuoYcrWoNrK3ZFo8MEACGh4KX8hV+Bs2hL
	NeGzw6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9uVI-0000000CU8X-066O;
	Fri, 25 Sep 2026 01:13:32 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9uV1-0000000CU40-3ZYW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 01:13:16 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so149447a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 18:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790298794; x=1790903594; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wql0u/3ksmOdy8r//TkBURdk2dF75TPdcHGkWL4FBiE=;
        b=sxkXiK4vPufSaAhx0Nbol7EkkAgme9PD5o9ARo52YErMwJtj5/9LffjG0FvMG73cDL
         boKXbzNJa3nhxRefvRYfn/rVn0fKAIWwYSNJPyRtfDNIIVCtPrrGGffDAuWg7+3Od18i
         xol+50jgr8RYcfzlak6k7r0NZ+8fp3OsWVTlcLoxCxygS1rcgdu9vDGsFsBNmSM1ekQV
         yPkHJ2MiVwqztmSgNuTVRmD8AjsXUIuo/0cfFYzoOgvDkwpHVGl7OjYsqW3O8iGFToUM
         vuJG3vSYeph/kcCVO1vKc0qJDc5jNiKPxICh494L0wIcNBgKOMvEKGeOZoJ6Xv7G725Q
         DWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790298794; x=1790903594;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wql0u/3ksmOdy8r//TkBURdk2dF75TPdcHGkWL4FBiE=;
        b=B6zpcNpNCAbzAVMdP8s21TGjbf44v+CGfdihOBs/F1dcLrBMyOgY/bMHkFiEeBEDwj
         3MBu9o0kpWJOAJ8Twej+2kzXqVG31y6EFCV31Cg4oumnj2gYjMfFiGjo6M7FH9ZXXtIJ
         67u/XOO7GWJ5tQHsWlygen/ioPGuDuiSXkJhToXn6h/YsWaQ1O2Jt298kTpqywdeBbun
         Awu5avMuZ61Ivjp2CKnHMO8ffrRfD16SU3RUtIofThpK7QYLy1bIc8X/rp0WTdzNs0Sp
         CFVqL1C7RBQcbJ+ONASkGwfIHiyzImVREQDkXxglP2oZ/YWsi0Qf90DcLe+Ntuf1j9ao
         TxPA==
X-Forwarded-Encrypted: i=1; AKwUvBxomW9O6naEGSwbcLG8DB44DoOxW7YYoGFc1n0PkExAlSa1OOIxbTr/o55BaWmojwDUiq9SmDsgppw9xwghREL6@lists.infradead.org
X-Gm-Message-State: AFuF++kd1Otvo/a+pUWOOWbPb57zu2bbeOsufb94WB3RxxnY0+DQVq1Z
	ElkygmaHgxBPjZDLf4LkNkn/Yyx8lc1IazfjSBCpwP1lCdIq+6oO4YEDMTF1TlrKsuRHcmS3k51
	YMKWLcodamiCklg==
X-Received: from pgbbf22.prod.google.com ([2002:a65:6d16:0:b0:cc7:620f:a25f])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7485:b0:3dd:a195:fa1b with SMTP id adf61e73a8af0-3de0e9a0863mr3871178637.64.1790298794332;
 Thu, 24 Sep 2026 18:13:14 -0700 (PDT)
Date: Fri, 25 Sep 2026 01:13:07 +0000
In-Reply-To: <20260925011308.3381953-1-skhawaja@google.com>
Mime-Version: 1.0
References: <20260925011308.3381953-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925011308.3381953-4-skhawaja@google.com>
Subject: [RFC PATCH 3/3] iommu/arm-smmu-v3: Add support for hitless replace of
 S1 domains
From: Samiullah Khawaja <skhawaja@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Samiullah Khawaja <skhawaja@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_181315_890284_F3A0EEC6 
X-CRM114-Status: GOOD (  16.75  )
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

S1 domains are programmed by CD entries in the CD table. During a new
domain attach these are updated using write_cd_entry. Since ASID and
TTB0 are in different 64-bit words, the write_cd_entry considers it a
non-hitless update and sets V=0. This means such an update is disruptive
and would generate translation faults if there are ongoing DMAs.

Replace the CD entries by using an unused temporary ASID in following
sequence to allow hitless replacement of CD entry,

- Update the CD entry with temporary ASID.
- Update the CD entry with the target TTB0.
- Update the CD entry with the target ASID.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 66 ++++++++++++++++++++-
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5732f3ba0122..59f4b8cf89f6 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1641,6 +1641,68 @@ void arm_smmu_write_cd_entry(struct arm_smmu_master *master, int ssid,
 	arm_smmu_write_entry(&cd_writer.writer, cdptr->data, target->data);
 }
 
+/* Invalidate every stage-1 TLB entry tagged with @asid. */
+static void arm_smmu_tlb_inv_asid(struct arm_smmu_device *smmu, u16 asid)
+{
+	enum arm_smmu_cmdq_opcode op = (smmu->features & ARM_SMMU_FEAT_E2H) ?
+					       CMDQ_OP_TLBI_EL2_ASID :
+					       CMDQ_OP_TLBI_NH_ASID;
+
+	arm_smmu_cmdq_issue_cmd_with_sync(smmu,
+					  arm_smmu_make_cmd_tlbi(op, asid, 0));
+}
+
+static void arm_smmu_cd_set_asid(struct arm_smmu_cd *cd, u16 asid)
+{
+	cd->data[0] &= ~cpu_to_le64(CTXDESC_CD_0_ASID);
+	cd->data[0] |= cpu_to_le64(FIELD_PREP(CTXDESC_CD_0_ASID, asid));
+}
+
+static void arm_smmu_replace_cd_entry(struct arm_smmu_master *master, int ssid,
+				      struct arm_smmu_cd *cdptr,
+				      const struct arm_smmu_cd *target)
+{
+	struct arm_smmu_device *smmu = master->smmu;
+	struct arm_smmu_cd stage;
+	u32 tmp_asid;
+
+	lockdep_assert_held(&arm_smmu_asid_lock);
+
+	/*
+	 * Nothing is translating through an invalid CD, and an update that
+	 * invalidates one cannot be made hitless anyway.
+	 */
+	if (!(cdptr->data[0] & cpu_to_le64(CTXDESC_CD_0_V)) ||
+	    !(target->data[0] & cpu_to_le64(CTXDESC_CD_0_V)))
+		goto write_directly;
+
+	if (xa_alloc(&arm_smmu_asid_xa, &tmp_asid, XA_ZERO_ENTRY,
+		     XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL))
+		goto write_directly;
+
+	/* Copy the existing cd entry and update only the ASID. */
+	stage = *cdptr;
+	arm_smmu_cd_set_asid(&stage, tmp_asid);
+	arm_smmu_write_cd_entry(master, ssid, cdptr, &stage);
+
+	/* Copy the target cd entry and update ASID to the temporary ASID. */
+	stage = *target;
+	arm_smmu_cd_set_asid(&stage, tmp_asid);
+	arm_smmu_write_cd_entry(master, ssid, cdptr, &stage);
+
+	arm_smmu_tlb_inv_asid(smmu, tmp_asid);
+
+	/* Update to the target cd entry as it should be hitless now. */
+	arm_smmu_write_cd_entry(master, ssid, cdptr, target);
+
+	arm_smmu_tlb_inv_asid(smmu, tmp_asid);
+	xa_erase(&arm_smmu_asid_xa, tmp_asid);
+	return;
+
+write_directly:
+	arm_smmu_write_cd_entry(master, ssid, cdptr, target);
+}
+
 void arm_smmu_make_s1_cd(struct arm_smmu_cd *target,
 			 struct arm_smmu_master *master,
 			 struct arm_smmu_domain *smmu_domain)
@@ -3664,8 +3726,8 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
 		struct arm_smmu_cd target_cd;
 
 		arm_smmu_make_s1_cd(&target_cd, master, smmu_domain);
-		arm_smmu_write_cd_entry(master, IOMMU_NO_PASID, cdptr,
-					&target_cd);
+		arm_smmu_replace_cd_entry(master, IOMMU_NO_PASID, cdptr,
+					  &target_cd);
 		arm_smmu_make_cdtable_ste(&target, master, state.ats_enabled,
 					  STRTAB_STE_1_S1DSS_SSID0);
 		arm_smmu_install_ste_for_dev(master, &target);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


