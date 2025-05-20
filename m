Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDDDC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 19:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvaowTnmN7oLC96D2HQ8Iw/m6LXgQG1UkyHMoTmfSNI=; b=K9yn9rr1MWdNtJDLfiwu89rXjQ
	F5dSLkx0i5cPH51DqVWdvCDGCyLJ4UAG9O2Nb/fG7L0tWEPks+tJ4wbw8nKS8w/Tvz7Vjr2D0UKu9
	MAjzSMI7VHe4CvQHD/RrvHEG+bL0IZG/dV2gdq9YOPH0Tp5b9FxAfULsvMSiMAmJmsnVFFLeF2PBM
	UWCnuGgRr/ndH0F3tWWJNaBsZd7oP7P93n+ubM84XgoshH3qXIVB9GQ/hM0GFdYv1GNGA6RAecqpR
	YskP7h1ms3eAY/V1MPSoOXT4n26wH0iPDnTZwNpY8RPSeKENIZqHTNT3hyFfZSyVtK5HlhhwO5w23
	6cJi5KTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSOy-0000000Du3D-2gOT;
	Tue, 20 May 2025 19:13:24 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSKj-0000000DtUe-2Drb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 19:09:02 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-479009c951cso12610231cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 12:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747768140; x=1748372940; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvaowTnmN7oLC96D2HQ8Iw/m6LXgQG1UkyHMoTmfSNI=;
        b=DGcjoFmKtCUvq6s9KW/+PncTFO1cGIifr0iDvVU2kHGXfanuzpRYQ0oWGNNgKHEnST
         MOe4VI07Rr+mu1D0qwHSCGVDCo2QqJ8eah8hbUIKNvg7gBXPle4Oi0kEVLqMXCL/ZskC
         j4bryjJLxTn/vEYBJX9/IpPFCysOnOzePZPuFlU1RunjcnXRkl4Hnb/ZcPMmSZfoVJ4u
         BRFiUruDn7yhc5JW3tz0jv4pOv3B2fFPuIw8/rUN/h5FSc6/ZIwTWjBp66rggygrRB58
         t7hEW8rkHJnf95u193A3XRWH1cikrQ6nKsByC/fAEwJBLzAoW9KZlCx4a0JiD4UmCu+N
         mp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768140; x=1748372940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvaowTnmN7oLC96D2HQ8Iw/m6LXgQG1UkyHMoTmfSNI=;
        b=h2nlYwYtPlCRQuxYYImtPawyeNNVaq+JUpQhyJQ0z4vt/3pX9Ybu8GRY5ihlYM8u7H
         t62jg0FWlIr9PxeH0IhgkmIGkYn3tNr95a81eV9n+qbtl9ySuaKpm1IpMuKcdp/+R68C
         BM8f1akrpk3AQIV6KKjJwAHZ4LGUdCLr3srHdGkpbF1tyrzV8AallwQnFc2V24Vsn5ep
         r/7Z0GDo3pesFFgg4xwcOL0PnFlGNGsTh10WUf0TZI8Z2CK2nhdB6+NxKSJebv7+Le0r
         z7cmvUOYyHWsPwH/QvKfD8atQzQnsLpIzbGt8CH+rlAbckOptu3hcv+0woZK4aejclwf
         H2VA==
X-Forwarded-Encrypted: i=1; AJvYcCVG7fWNdJP5NS7oMJtsHcwPVX8dWgWmaDVJBNx5AKWJdxCYWaQFQtoVG94dWesJTEuaVvb2KzgRTo3c2GWxlOJk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8xuij8YBzy8DAi7DODmCYD7tkUxU7K35JF+s5a5rjHpYNxZYp
	KP4dSz/gCgKjzVtqjgtFyU02qCja0MGNHkAmkg8HiL2Hpuw9HdLyHbeY
X-Gm-Gg: ASbGnctWTv18pY+y1yRiuUOadID7a0MJBv8cSalCSBYPz4XEbnACGKZ0QFouJn0wh0o
	MzvIDwdQqgHs+bmUUsfdYE+ytPFoj9YOvWTiUqmUxTojjKEjDg9gZThITzIBaEBUzkXZnWxi/n3
	Vg+3dFryR4sXbIqbGAWR7zv3vLrdS/YbfwyyT+jxQv8UrKwycA+bjJn4AoHTbR1KVACVe2tnkr6
	yNizDT1NIjWk3fWjWrZ6T0k52d8Ha2PF6cwmwYIpny8DR6ly6kqtNavCYOhnqOXREafQVlxjL5O
	Opg1qHLKKUJSCCCUsSLjv5jf65TDF82jNu0RmQSqnQwijhCcDd9eod4H/QGc2MuqLWtExFhxG5u
	yjE26sUPVm+LTsf3hF2NL6nWTjywULQ==
X-Google-Smtp-Source: AGHT+IHrhoVKr8ZuMW3LLmVacxqlRwznTBlrPPx7593+XpI6zjzFhRF7/0TUgT772pugTudEsg+iFQ==
X-Received: by 2002:a05:622a:22a4:b0:494:b869:ac06 with SMTP id d75a77b69052e-494b869b287mr85977441cf.6.1747768140371;
        Tue, 20 May 2025 12:09:00 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:08:59 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:08:54 -0400
Subject: [PATCH v8 1/7] iommu/arm-smmu-qcom: Enable threaded IRQ for Adreno
 SMMUv2/MMU500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-1-fce6ee218787@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=2173;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=ZBvYKn5K11+lNsz4zT1zMYa5IeR/X4du0GnqkshS5cY=;
 b=ViPeijvXoIUFv2QAC6sXPESomfVyzJ6s9UWCJTU2K3EndiqfiDH0VcJPIhmS25TOOhh6IVZsY
 tWgr3r9EDqOCOO+X64zLIEayNFmirrauIr4/BJjbDt38yQUW2T81wXA
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_120901_561762_1083BAA6 
X-CRM114-Status: GOOD (  14.48  )
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


