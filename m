Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE527CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 19:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/0+8/7+L8DONYJQ3fWVSioDtnywAJwCJWEJlOMQxkV4=; b=jpy7iuPnfn+IqZ98IqGVIj0StY
	zcz/EJGwHvGjp5mnJmVhKtBM2Ue+uUORbVuFjRkhcMUtInTKR0ZmR22LnmLvSo1H+GJw44T7SqEL/
	UVtrnBs8fNdi0i+d0Yfa0w+F8yE5Dhu7QC1ipfEjk+axAcJdvpMq28IIxdQXSRVea4DKiCAkDWeeV
	gSRNzkqcjGdYW0Q02VXQ4GpiGOWB/78iiUTaD365wZifvyBdHCxU/9pXrtmHkGfJIXm5ecsvfRpoO
	mi84ZitYAezxC8Z5IDhNrAdtXe4jrJhfu14rIR2mbm/gJBOm8KHIj5bEgNSkBPXEuAtbzZF6NpHhZ
	hO89iDmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSEU-0000000FDlt-02xp;
	Sun, 04 Oct 2026 19:50:50 +0000
Received: from mail-dy1-x1348.google.com ([2607:f8b0:4864:20::1348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSEQ-0000000FDl6-2XiE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 19:50:47 +0000
Received: by mail-dy1-x1348.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1855081eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 12:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791143445; x=1791748245; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0+8/7+L8DONYJQ3fWVSioDtnywAJwCJWEJlOMQxkV4=;
        b=twsSrKN3ZSMe0cu4umCIlupHW8BaB+o9Zj5+g5ekO3CcR50wQFmxkUV01JH//28AoF
         /eyDwy2buOkcm/yMYjY6knM1D0cH/RbuRkp3STgP1dxFLE9FzoN/ljy0gIer3+Hx8TE6
         VIOOV5vKON9CMOKTdNxTh2JRFrw4iyLwMkEiJQYI9xeXrk44YDzmi71iinXhqtC77eMT
         SjfQRls2h862ioQO5dEeAlNB9KqSVFSv4JvWUXqaWErmrCYHeEQdVLHv4C6yvJ81mSp3
         1ucHVzqRcPVARN7FxePWTBpV4PQ3keQAqwTEcfiRNt6cPtYRURVxAUl+H/R8JJYRlWCQ
         5x5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791143445; x=1791748245;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/0+8/7+L8DONYJQ3fWVSioDtnywAJwCJWEJlOMQxkV4=;
        b=t82RIZgJJ39aQTaVn6dTrjlN7lU8EBXJWu6cA1xztOxFr7eEj0NIIr83NnnBM1k31c
         rqwqf5DQ9JpuPtbrmClMrCCitLZRaVGsDz1MyKMcdQEfWLrcX1mdyNg9tBWCHV2BLMyp
         LIdA06g73F4GkJ201JiP/FNJcpBdeBjc+iTSukUm5EK/6ZOvavhz4VIQbMZdjpRVhTgs
         fnlOTgNOLR9qo+EC12q8gZ151G/5hZHQCjcz/PxX+WArAzoPL2VFLgyHkf631YGeJSLL
         GCNMIWoXoQdxLzAyRfo2Zn1kcXzQtt4mQ0I/xIRdSqh+VDbMqse3Y6t6l2hxYZlrIW8F
         D5ew==
X-Forwarded-Encrypted: i=1; AKwUvBxz6kUFtqaV/7r/ORTPoRxdFJ6idUCVQ2AiHFfZTekI7fRlIS6QmjSEfY1N/F8oQx0F/lCSkKdInP5hrlb/tAXM@lists.infradead.org
X-Gm-Message-State: AFuF++lNAAr9jugJPYOVSW5/0Oz+6feInfc2WD1/ysZnDCS2iUCF+mwR
	q/vUVP/Kj481b98wPaC3EBOCriGC+27/dkUOATj0JYSax/za4MPBFuNdSe4CWYwKoSxiO0kwpRY
	GlEET07jM0I0kTEGetaz3+gfPCg==
X-Received: from dlbti5.prod.google.com ([2002:a05:7022:1b05:b0:159:4114:9dd])
 (user=danielmentz job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:f90b:b0:149:c766:3629 with SMTP id a92af1059eb24-14f5c5e9661mr13770215c88.23.1791143444306;
 Sun, 04 Oct 2026 12:50:44 -0700 (PDT)
Date: Sun,  4 Oct 2026 19:50:27 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261004195027.227748-1-danielmentz@google.com>
Subject: [PATCH v2] iommu/arm-smmu-v3: Align memory attributes for
 SMMU-originated accesses
From: Daniel Mentz <danielmentz@google.com>
To: iommu@lists.linux.dev
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	nicolinc@nvidia.com, smostafa@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dawei.li@linux.dev, jgg@ziepe.ca, praan@google.com, 
	Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_125046_677929_1D55764D 
X-CRM114-Status: GOOD (  14.42  )
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

The SMMU specification defines several types of SMMU-originated memory
accesses, including Stage 1 and Stage 2 translation table walks, stream
table accesses (L1STD and STE fetches), CD table accesses (L1CD and CD
fetches), and queue accesses (CMDQ fetch, EVENTQ write, PRIQ write).

While the memory attributes used for Stage 1 and Stage 2 translation
table walks are configured in io-pgtable-arm based on whether the SMMU
is coherent (ARM_SMMU_FEAT_COHERENCY), the attributes for stream tables,
CD tables, and queues are currently hardcoded to Inner Shareable,
Write-Back.

On non-coherent systems, however, memory for stream tables, CD tables,
and queues is allocated via dma_alloc_coherent() /
dmam_alloc_coherent(), which provides CPU mappings with Normal
Non-Cacheable attributes. Having a non-coherent SMMU access these
buffers with Inner Shareable, Write-Back attributes results in
mismatched memory attributes between the CPU and the SMMU.

Configure the memory attributes for tables and queues in
arm_smmu_device_reset() and arm_smmu_make_cdtable_ste() based on
ARM_SMMU_FEAT_COHERENCY, matching the attributes used for translation
table walks:

- In SMMU_CR1, use Outer Shareable, Non-Cacheable for non-coherent
  SMMUs, while retaining Inner Shareable, Write-Back for coherent SMMUs.
  This applies to stream table accesses as well as queue accesses (CMDQ
  fetch, EVENTQ write, PRIQ write).
- In STE.{S1CIR, S1COR, S1CSH}, use Outer Shareable, Non-Cacheable for
  non-coherent SMMUs, while retaining Inner Shareable, Write-Back
  Read-Allocate for coherent SMMUs. This applies to CD table accesses.

Assisted-by: LLM
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Daniel Mentz <danielmentz@google.com>
---
Changes in v2:
- Rename local variables 'cache' and 'sh' to 'cr1_cache' and 'cr1_sh' in
  arm_smmu_device_reset() (Nicolin, Will)
- Collect Reviewed-by from Nicolin
- Link to v1: https://lore.kernel.org/linux-iommu/20260929032229.3532247-1-danielmentz@google.com/

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 37 +++++++++++++++------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 34e916ea339f..02cc6fb83461 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1905,6 +1905,15 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
 {
 	struct arm_smmu_ctx_desc_cfg *cd_table = &master->cd_table;
 	struct arm_smmu_device *smmu = master->smmu;
+	u64 s1c, s1csh;
+
+	if (smmu->features & ARM_SMMU_FEAT_COHERENCY) {
+		s1c = STRTAB_STE_1_S1C_CACHE_WBRA;
+		s1csh = ARM_SMMU_SH_ISH;
+	} else {
+		s1c = STRTAB_STE_1_S1C_CACHE_NC;
+		s1csh = ARM_SMMU_SH_OSH;
+	}
 
 	memset(target, 0, sizeof(*target));
 	target->data[0] = cpu_to_le64(
@@ -1916,9 +1925,9 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
 
 	target->data[1] = cpu_to_le64(
 		FIELD_PREP(STRTAB_STE_1_S1DSS, s1dss) |
-		FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
-		FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
-		FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH) |
+		FIELD_PREP(STRTAB_STE_1_S1CIR, s1c) |
+		FIELD_PREP(STRTAB_STE_1_S1COR, s1c) |
+		FIELD_PREP(STRTAB_STE_1_S1CSH, s1csh) |
 		((smmu->features & ARM_SMMU_FEAT_STALLS &&
 		  !master->stall_enabled) ?
 			 STRTAB_STE_1_S1STALLD :
@@ -5102,7 +5111,7 @@ static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
 static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
-	u32 reg, enables;
+	u32 reg, enables, cr1_cache, cr1_sh;
 
 	/* Clear CR0 and sync (disables SMMU and queue processing) */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
@@ -5116,12 +5125,20 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		return ret;
 
 	/* CR1 (table and queue memory attributes) */
-	reg = FIELD_PREP(CR1_TABLE_SH, ARM_SMMU_SH_ISH) |
-	      FIELD_PREP(CR1_TABLE_OC, CR1_CACHE_WB) |
-	      FIELD_PREP(CR1_TABLE_IC, CR1_CACHE_WB) |
-	      FIELD_PREP(CR1_QUEUE_SH, ARM_SMMU_SH_ISH) |
-	      FIELD_PREP(CR1_QUEUE_OC, CR1_CACHE_WB) |
-	      FIELD_PREP(CR1_QUEUE_IC, CR1_CACHE_WB);
+	if (smmu->features & ARM_SMMU_FEAT_COHERENCY) {
+		cr1_cache = CR1_CACHE_WB;
+		cr1_sh = ARM_SMMU_SH_ISH;
+	} else {
+		cr1_cache = CR1_CACHE_NC;
+		cr1_sh = ARM_SMMU_SH_OSH;
+	}
+
+	reg = FIELD_PREP(CR1_TABLE_SH, cr1_sh) |
+	      FIELD_PREP(CR1_TABLE_OC, cr1_cache) |
+	      FIELD_PREP(CR1_TABLE_IC, cr1_cache) |
+	      FIELD_PREP(CR1_QUEUE_SH, cr1_sh) |
+	      FIELD_PREP(CR1_QUEUE_OC, cr1_cache) |
+	      FIELD_PREP(CR1_QUEUE_IC, cr1_cache);
 	writel_relaxed(reg, smmu->base + ARM_SMMU_CR1);
 
 	/* CR2 (random crap) */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


