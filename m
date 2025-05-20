Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7391FC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 17:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvaowTnmN7oLC96D2HQ8Iw/m6LXgQG1UkyHMoTmfSNI=; b=gUA3lr3c70Hrho8E6dzXxdXcOL
	9p9EPvaKF/lB9Ydowa46toSzAUVX3IRBIMH/DTIJgim6dIiYcZ5Nujwa+buPTrIvQ8fhzB5emrzGr
	+QJ9NPzxQmAkmA9ogwwfYBmq0w3Lcji6LFnsXf38Np9f9S4gYXAO5gwZNWbmJuZndoMfbHcIfaAJe
	90J9QUM713MprJltPllRoo1gGiiLFq9l9M+VFY8WmQKYvab/vjDtV6C3kplJ/scE6x7F15bFdHPRb
	aqocj6Rts7EuMbbTpeBYZUMjk3VLAE4dw9guCOa7g6ODSfzXhFa5lAJOEDS3XjeYZ8Co4Ne9L01En
	sm0IMPZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHR5i-0000000DivB-2N2F;
	Tue, 20 May 2025 17:49:26 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHR1S-0000000DiA7-1VEh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 17:45:03 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6eeceb05894so7984146d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 10:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747763101; x=1748367901; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvaowTnmN7oLC96D2HQ8Iw/m6LXgQG1UkyHMoTmfSNI=;
        b=QZ7nvOy4K/mXoGd8bqAxpU5S7Y3V+wWCacFOM5PINxfgvElIOCMq0HIfHHuv/iELLW
         eNkmcTCSnYX8fD7B9HaCRbFnHq+KP01NKIYOS2XkzQo5hid2crLcOlTi8U5+dZg6Ch8k
         42v/AznvDW9HwxRk3RAzqP0C2tt6lm4b1MhczE/IWNX5iwk2M0cQV0u6FihFYqsNvR6/
         olWd4yrO/igjRvEuqwWdafGfBKc8M4gJ50CLSOqt4ojcRwLjHPi0Rp6OSppnP0k6ikfP
         og8SaXTcQ2zbew1Lo5NgjGuxIzMsTPCV8/m7dmhR+QZJoz1HrqxQqFHKhbZhOymHR+oo
         Polg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763101; x=1748367901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvaowTnmN7oLC96D2HQ8Iw/m6LXgQG1UkyHMoTmfSNI=;
        b=hL744iATaSTjkwNSN9sg3RG1lhG84NEoTO7EZAoYs5Ax1/1I0u/ygpifJ3MZZNIDA0
         V6hcyE0qJcKtyjG/0MdsEhpv0BwkFA7OEgeTXBvnXqOze6WtOQasSEOoG/XXWVN0mLQX
         Uh5r00ZTzfB2Ig4PGZxjhh5pJm0JkfsXUiFmF7F1+kPG+6/5rAGp9JNS6GKiXIjzXZbd
         QW0cLrMRNeChDCnUODMOk3YdETZAi8WDrK7Wk6QaSP0VVObFxCo2DecuZOUgimA7czaC
         QKG8pmBo5tqL3cy0XGU/ISYR2GFVjkPIXwc47ramYFd7M2YgZU56Nnu7+R5mvigALy4p
         lhdA==
X-Forwarded-Encrypted: i=1; AJvYcCVLHk19Ol1aMhIqAOPOGMQHeOWxEGqOOQps257JXdViVh2eFVKAmyHEKiXkTRZauRaBDFCzJJgorRv0TaePhLuY@lists.infradead.org
X-Gm-Message-State: AOJu0YxEI8CrG3TIUtE+SrSjo8CA3MAZworwMqwGnm9Z18QaqxK8zW4O
	HVNrka10nw4yRUoaiJeMOt8Gu2s/CIDOAZH2/A5T6EfQC2x2dM/aXKMD
X-Gm-Gg: ASbGncs6R+Th5BuD8CR4HCaTUfLOlIJBds6YWsCHgvmilRZq1DCfv4fnM9XcAsWewy/
	VLDVUf/idWscOVVUJauGm3GEZAQHc2ueH5w59o2BsjOIOjpzZ4NoiXiE32Qw2W62rBjR4+zeZLU
	kLjr8sicI2Z0UH9l+K97N1564jovmwnoFeY5egAgRE7VNBgTXyhZ518k4FO1YplHqHrsS89T5Rl
	j82i0FXlI8WEBy1iXQJpxhFnXgW2LJUN0hdRdlezAhu34obpa+IVVmkaHEqRiOdlt0M/n8kF/rC
	aHn+/bEi/k9U7tc5Wq1WkaL1vKcPpLnVGpxv8ejnvh/doT4x0lfj8dbZD+Imwn07w+LEBRzF+7Z
	fp/RlidxPvLU4XFUWi5Q=
X-Google-Smtp-Source: AGHT+IGqCzG1SvNWszzrmmzUY2oSx7dYJcoW7SuKzN1obqGThnOW42g+lUzHl4o0PdCvhz4+UPzvxA==
X-Received: by 2002:a05:6214:29c7:b0:6f8:e361:78aa with SMTP id 6a1803df08f44-6f8e3617c79mr23828486d6.8.1747763101074;
        Tue, 20 May 2025 10:45:01 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:45:00 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:44:50 -0400
Subject: [PATCH v7 1/7] iommu/arm-smmu-qcom: Enable threaded IRQ for Adreno
 SMMUv2/MMU500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-1-96cd1cc9ae05@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=2173;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=ZBvYKn5K11+lNsz4zT1zMYa5IeR/X4du0GnqkshS5cY=;
 b=JmZsTt+6O7fNx0yDUqUsXkrhtOsb8qvW7BpJuQ7B23u1tzp4qHdYnvwbwbDnWJiZvcItArAbQ
 1T514ek8rm7BoPLevyDE8Ux2jAjR0ELikP8fAA06vsIo8AQ7PBSk64A
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_104502_403392_B8FFE983 
X-CRM114-Status: GOOD (  14.38  )
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

The recommended flow for stall-on-fault in SMMUv2 is the following:

1. Resolve the fault.
2. Write to FSR to clear the fault bits.
3. Write RESUME to retry or fail the transaction.

MMU500 is designed with this sequence in mind. For example,
experimentally we have seen on MMU500 that writing RESUME does not clear
FSR.SS unless the original fault is cleared in FSR, so 2 must come
before 3. FSR.SS is allowed to signal a fault (and does on MMU500) so
that if we try to do 2 -> 1 -> 3 (while exiting from the fault handler
after 2) we can get duplicate faults without hacks to disable
interrupts.

However, resolving the fault typically requires lengthy operations that
can stall, like bringing in pages from disk. The only current user,
drm/msm, dumps GPU state before failing the transaction which indeed can
stall. Therefore, from now on we will require implementations that want
to use stall-on-fault to also enable threaded IRQs. Do that with the
Adreno MMU implementations.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..4d3b99babd3584ec971bef30cd533c35904fe7f5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -585,6 +585,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.context_fault_needs_threaded_irq = true,
 };
 
 static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
@@ -594,6 +595,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.context_fault_needs_threaded_irq = true,
 };
 
 static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,

-- 
2.47.1


