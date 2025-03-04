Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EADC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5EzgLyFDTmhCErvGVVvwbq+cKJHcTR+SvQ3tvjXAPU=; b=S/ZC0GFwXbwUCZd6L8MM7SW4oS
	NiGSZOEFLnMO/EAeraNFf9x2fRYsN/FFiPf4dKUm2xY8FKMgqvt+f+jXYNc/ufOW+lfLYfa7MGZeG
	l4/dK5vcNRzNT83njLu1oJmO9M8xC/l1i6MFRD0iIvXDtOe+UxdEyz9x3dCZrh/pxBBAGPOTAmQ1q
	EBFMrQkIQs4Fdtx5Dc46v36ArsYUGJurzZi3sP9bGj0tSui5C351kZSPskVZDya2+akUYsyen3ZpU
	+VexOliifxJC1DNeBw2AuZEuq6ZQGnz5QGUrwK2oKCR6RLNDTv0Ks/w7G+5/5msfbaGVFXvP1JmpG
	KF10pCYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWph-00000005oHb-2Duv;
	Tue, 04 Mar 2025 18:17:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVaB-00000005WCI-2tFr
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 16:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=c5EzgLyFDTmhCErvGVVvwbq+cKJHcTR+SvQ3tvjXAPU=; b=Pl4v/wzKF5ZfmBz6UphIFHzEKK
	zwLNCoCm5Abylv0N3qQ8JCbo83dtZeLNEdm+4Hf3cjVENslgRTI7R493anNw+LtcJRLJ0Jbs8iQmq
	2/ChlLj523NXAKA9yJ+KJm0C2FuY8cuvjucHdTL53VfpuIq1yBenICZ0gayZF3B7WJzbpqp+jDOb4
	oDw3Q5nceBNA/V4S3Uh52k9orlloCbhV+UFvzHUt126gMnhDjsPj7oiGAvV0R3zjJ8OeAdEGbYjri
	/YjrY1NiSeMMbgRkfPP71YYeRH12QWk/c4j5ToSMgI/TcvQsePvFWwBgYLcYSVQbjdFI8SlLrXJyK
	L6P7DmMg==;
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVa8-000000006pE-2Wes
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 16:57:26 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6e894ceca36so6686736d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 08:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741107442; x=1741712242; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5EzgLyFDTmhCErvGVVvwbq+cKJHcTR+SvQ3tvjXAPU=;
        b=kSwLNzNi/393kqoGRtFtTPb4SDm27/Wm043W1bWDhUdCfbCMf6CjvDKiVdr9vDa6xy
         9q7jh3dxDnO3jIIUyd5B42QOviZZ4Gtu4qseEVzuCYxG/IkWgBAv7/0tK0ChNvJzlb3e
         gN38W44TT0ooAid9FWjCnHYwy63rIWXMRxZaVdOCiKo4BYI3zpGnoNOVpdL+C3/rF0ud
         sYHZXfqRyK6WKAnC+3Y9TbA/9jKOrTC+ZuAN6Eh4Hk/lt54IUNnkqhyIQmqkdF3WVHR6
         6IC07v4m00RGJO89+l9NkoCZbA33HQtsHU36R63CSkVJfmA7itrj8Z9re0ukHHqPgsJx
         UvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107442; x=1741712242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5EzgLyFDTmhCErvGVVvwbq+cKJHcTR+SvQ3tvjXAPU=;
        b=kRmxrsGfYgEmLyTj9Yi9LJITtovkGYh6H9FTbxy2ZmSeQ2lso7q8izFUc6izjIXPbz
         MWy6dw613PyNYzpEdr2KpUdojEQSzVD8VKU9ibuF2SSw+/+PsdZhSOBwK8tfIYlXnewo
         W95jImmfPNYWmNWS3yjGb8de0XowrxBX1BLc/j2Gu4rT+T3uNgYqZE8wVT7Xnppe5erS
         9Jdw/zKIxwAy5wIK9dpsFsBECqd6GklqQ/2TMDdbJFk0QN8iCdPkdDAmqnhbl4M9nbYM
         3PW0B8UVuJJ4Qm9X+yyB+k/p4URJlZGqsmPXv6+1pYIEOsjs9Vfelatn3/M4PkZRX6oT
         lAjA==
X-Forwarded-Encrypted: i=1; AJvYcCWtVsjZPidOiptLSh5UpD0my9l1h2AGKjEgFu81J7HJcX1lALbVuAQmgsa6l/rFesDISxENXdf4E4ZKbf6vmC+I@lists.infradead.org
X-Gm-Message-State: AOJu0YybpG+ilrFBHM6MpDMGaIY03Nx1kvxgUfzNKqoWLc46aToxASYp
	5+WEpId5EWdenDu78tplvkAFDUyskst/BsX87RzZ4jGibDjYVKQF
X-Gm-Gg: ASbGncu1gElTTn2HIW9lU/J924xT6zuS1Tq26a5JyWx2bhUJBLp/ia/mQ348+xK7rEL
	5sos6b8tSpuXQSMdeAPs3Y669EyzUMeDwfPHNbwr9yM+SkutR+iV0fzqjq0Z9N2YemlbWkFA8Oj
	B0dYz9utP5un0y0x5+AQxQ/ZVFg0spzTdmP8hLxISl+f3Oanml+XaFSd630CRs+to95U097JL3H
	/rb/jNJ/8EW44N5nGyInkJMyo7T73mOmwxoUO6+LP1F6VHrjShWVTjc4nsV8QCRAKbQeLrYiEkZ
	JCNKIp0jXzKncDyUaUa97H+fXM3VelIpzWCmPXYfAuCwInPe/ndx25CokFU/mP1WWtT8reVA+iL
	5tKM=
X-Google-Smtp-Source: AGHT+IGoupxASii7X7ZBE/b1vhvmyQma/ZYdh+Tbyfe+Zw9nzGDokCIyHSV+XP73s08QmxQbPXLd+Q==
X-Received: by 2002:ad4:596c:0:b0:6d4:2db5:e585 with SMTP id 6a1803df08f44-6e8a0c8667amr101294476d6.1.1741107441643;
        Tue, 04 Mar 2025 08:57:21 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976ec3b6sm68915966d6.125.2025.03.04.08.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 08:57:21 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 04 Mar 2025 11:56:47 -0500
Subject: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741107439; l=5429;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=0pLxdo5dIx3/jB5VJnMD05UBhNDf/ce6uNeBNzQSNFg=;
 b=Y1CairOsJ41mvDRtKq26OuucDooNFTjLoWPwbiBFIfoSNVkipQappptYF6gmvKXrHP1SoogsK
 PYXTL5Ae4q5CwQehnNi46RBvc1kI63x6VHaiJHQLf1iWq/3bMcW/0aU
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_165724_805438_24B10735 
X-CRM114-Status: GOOD (  13.87  )
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

This will be used by drm/msm for GPU page faults, replacing the manual
register reading it does.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 ++--
 drivers/iommu/arm/arm-smmu/arm-smmu.c            | 27 +++++++++++++-----------
 drivers/iommu/arm/arm-smmu/arm-smmu.h            |  5 ++++-
 3 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index 548783f3f8e89fd978367afa65c473002f66e2e7..ae4fdbbce6ba80440f539557a39866a932360d4e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -400,7 +400,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 
 	if (list_empty(&tbu_list)) {
 		ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
-					 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+					 cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 		if (ret == -ENOSYS)
 			arm_smmu_print_context_fault_info(smmu, idx, &cfi);
@@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 	phys_soft = ops->iova_to_phys(ops, cfi.iova);
 
 	tmp = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
-				 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+				 cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 	if (!tmp || tmp == -EBUSY) {
 		ret = IRQ_HANDLED;
 		resume = ARM_SMMU_RESUME_TERMINATE;
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba75eea1d5de23117de 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
 				      struct arm_smmu_context_fault_info *cfi)
 {
 	cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
+	cfi->ttbr0 = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
 	cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
-	cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
+	cfi->fsynr0 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
+	cfi->fsynr1 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
 	cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
+	cfi->contextidr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTEXTIDR);
 }
 
 void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
@@ -419,7 +422,7 @@ void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
 {
 	dev_err(smmu->dev,
 		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
-		cfi->fsr, cfi->iova, cfi->fsynr, cfi->cbfrsynra, idx);
+		cfi->fsr, cfi->iova, cfi->fsynr0, cfi->cbfrsynra, idx);
 
 	dev_err(smmu->dev, "FSR    = %08x [%s%sFormat=%u%s%s%s%s%s%s%s%s], SID=0x%x\n",
 		cfi->fsr,
@@ -437,15 +440,15 @@ void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
 		cfi->cbfrsynra);
 
 	dev_err(smmu->dev, "FSYNR0 = %08x [S1CBNDX=%u%s%s%s%s%s%s PLVL=%u]\n",
-		cfi->fsynr,
-		(u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, cfi->fsynr),
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_AFR) ? " AFR" : "",
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_PTWF) ? " PTWF" : "",
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_NSATTR) ? " NSATTR" : "",
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_IND) ? " IND" : "",
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_PNU) ? " PNU" : "",
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_WNR) ? " WNR" : "",
-		(u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, cfi->fsynr));
+		cfi->fsynr0,
+		(u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, cfi->fsynr0),
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_AFR) ? " AFR" : "",
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_PTWF) ? " PTWF" : "",
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_NSATTR) ? " NSATTR" : "",
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_IND) ? " IND" : "",
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_PNU) ? " PNU" : "",
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR) ? " WNR" : "",
+		(u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, cfi->fsynr0));
 }
 
 static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
@@ -464,7 +467,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 		return IRQ_NONE;
 
 	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
-		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+		cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 	if (ret == -ENOSYS && __ratelimit(&rs))
 		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index e2aeb511ae903302e3c15d2cf5f22e2a26ac2346..d3bc77dcd4d40f25bc70f3289616fb866649b022 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -543,9 +543,12 @@ int arm_mmu500_reset(struct arm_smmu_device *smmu);
 
 struct arm_smmu_context_fault_info {
 	unsigned long iova;
+	u64 ttbr0;
 	u32 fsr;
-	u32 fsynr;
+	u32 fsynr0;
+	u32 fsynr1;
 	u32 cbfrsynra;
+	u32 contextidr;
 };
 
 void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,

-- 
2.47.1


