Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58F1E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jsol/FD7xLO/XnO3v0kMgo+OuMQmHauwbh0Fn9n2Qc=; b=t+lk9N0JK5vxax2x8RpZW6/+xT
	u52WJfh2UzoFiBpxSCAAt/9NLYznLBwwCJXACMODgVCy3nD3eooDRvAAYNggfeya8/WGchFiI6mVa
	4axr5bB8vsgSlkoBIV8camup4W/mLe1f25XvNL8CDclDYCyAbC3mAVlnx3mPi1WtnfvdFTswQ2yXw
	MIFIMENBopij/nCCPyOuDfMsh8dtWIcg41gb+XT0ycjOslcGZ8EuhFFtPcrXgVZQgUO+6sXsxuCTp
	p4Y9FfWvN6uAWx1hDebWX1xLTtD11+aM6iMnllZq2u2Ii8dKp14IrrTq2AHqE16wC305yHo5855T/
	d90eoHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo88-00000001TLC-2j5X;
	Thu, 12 Dec 2024 18:41:44 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZU-00000001JuF-3PUZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:58 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4359eb032c9so7202165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026755; x=1734631555; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/jsol/FD7xLO/XnO3v0kMgo+OuMQmHauwbh0Fn9n2Qc=;
        b=2vufiFSmQxiN7+QvVHes6aqXk1NXXQ3dQeBhzU/QIk4yc21+zyOKDtNuJQSNH9pN1I
         Ye1GqvyX8JbYsmxxSTtL3FNCzqo7ZodlL/AkXRzwCTZlZVQMnA6fxOteA+26Fxkb21KY
         svikfnqqSa8WL4TnKZZIQhx0CSzc/YE6n9aDTvkcJNgZVAYz5zfqIKzgNucAZ2BHOc+5
         EZupTvN+9tSo2s7BqMRE+31EISUQKZ+rYpUjHf1Yx94ZxgxupUBFKXw8SvPsUdol5DsT
         e+RGA3eRuGi+Clh60wE6xbDVIG/ZQVXo1Yoxugs+2Z8RZbuSyPtoN5uGpD4ZbddaVcjx
         eiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026755; x=1734631555;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/jsol/FD7xLO/XnO3v0kMgo+OuMQmHauwbh0Fn9n2Qc=;
        b=mGEpJWzlk4/1r0nY61O9NQq+et3tTTEZGTOn6aclwU1tx/+YrHdbYiwuliirt6WkWw
         T88XqQ/FjTkaiYB3BaNy7w0HHTwaEEn+eTsKa9/687g4qBgvlQvoBaA7AU8kWQA7Z/cu
         HXheMK5j+J8q0++32s/sjCOlwX6WMsNDQBplPsJg1TudE3KHkoRrQHGIH3QXLJP5bH1I
         RiUUeP9/b1OH0nhjWzhzxpWvjPUUNXHT4ug7/icWIJUygf27PXloudDii67A566naRiX
         YQmPipFQGhoTebYTi0o3+tHgztKwtY+uFZ0TvH0VPIop6Hfk3yaaBEE6NpplRVvKyVpN
         XjNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsX7Im++xJcUfcWh2n8k2WF1hLpY8cWDJa6Qsn38gFf4YbmAoHHXkqXNRxFQbtSDaGIWUJa9ngFWYFZcRHeZ61@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr7PLP8AoE3GH5cP0ttictgBw/4iriGghle35OPKVQkTT3UsQM
	Ov5Vl5B8SPSd+Flja0lXs2r1AikdtJRiu3JTZjoscSlb2ejo+AnlJzKZ/wwPArONP9OQ44rJ+Zv
	erk/J5mL11g==
X-Google-Smtp-Source: AGHT+IFPvic4v0yXTXsiiS55qmyvRxNfbGXACyTICF0QYMQMm//s6fh52UUXvcsaAQ5ADTdRambhNe92sr/RSw==
X-Received: from wmol7.prod.google.com ([2002:a05:600c:47c7:b0:434:a471:130f])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35cb:b0:434:f9ad:7238 with SMTP id 5b1f17b1804b1-4362286391fmr34351085e9.22.1734026754968;
 Thu, 12 Dec 2024 10:05:54 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:58 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-35-smostafa@google.com>
Subject: [RFC PATCH v2 34/58] KVM: arm64: smmu-v3: Add context descriptor functions
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100556_850643_59962219 
X-CRM114-Status: GOOD (  13.62  )
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

Add functions to allocate and access context descriptors that would
be used in stage-1 attach.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c | 53 +++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
index 5f00d5cdf5bc..d58424e45e1d 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
@@ -215,6 +215,19 @@ static int smmu_sync_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid)
 	return smmu_send_cmd(smmu, &cmd);
 }
 
+__maybe_unused
+static int smmu_sync_cd(struct hyp_arm_smmu_v3_device *smmu, u32 sid, u32 ssid)
+{
+	struct arm_smmu_cmdq_ent cmd = {
+		.opcode = CMDQ_OP_CFGI_CD,
+		.cfgi.sid	= sid,
+		.cfgi.ssid	= ssid,
+		.cfgi.leaf = true,
+	};
+
+	return smmu_send_cmd(smmu, &cmd);
+}
+
 static int smmu_alloc_l2_strtab(struct hyp_arm_smmu_v3_device *smmu, u32 sid)
 {
 	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
@@ -291,6 +304,46 @@ smmu_get_alloc_ste_ptr(struct hyp_arm_smmu_v3_device *smmu, u32 sid)
 	return smmu_get_ste_ptr(smmu, sid);
 }
 
+__maybe_unused
+static u64 *smmu_get_cd_ptr(u64 *cdtab, u32 ssid)
+{
+	/* Only linear supported for now. */
+	return cdtab + ssid * CTXDESC_CD_DWORDS;
+}
+
+__maybe_unused
+static u64 *smmu_alloc_cd(struct hyp_arm_smmu_v3_device *smmu, u32 pasid_bits)
+{
+	u64 *cd_table;
+	int flags = 0;
+	u32 requested_order = get_order((1 << pasid_bits) *
+					(CTXDESC_CD_DWORDS << 3));
+
+	/*
+	 * We support max of 64K linear tables only, this should be enough
+	 * for 128 pasids
+	 */
+	if (WARN_ON(requested_order > 4))
+		return NULL;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		flags |= IOMMU_PAGE_NOCACHE;
+
+	cd_table = kvm_iommu_donate_pages(requested_order, flags);
+	if (!cd_table)
+		return NULL;
+	return (u64 *)hyp_virt_to_phys(cd_table);
+}
+
+__maybe_unused
+static void smmu_free_cd(u64 *cd_table, u32 pasid_bits)
+{
+	u32 order = get_order((1 << pasid_bits) *
+			      (CTXDESC_CD_DWORDS << 3));
+
+	kvm_iommu_reclaim_pages(cd_table, order);
+}
+
 static int smmu_init_registers(struct hyp_arm_smmu_v3_device *smmu)
 {
 	u64 val, old;
-- 
2.47.0.338.g60cca15819-goog


