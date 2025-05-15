Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F13C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 20:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWJZCHLwo4+rNxVq1K/n30vdDm3CIQkELPwI2pLPS/o=; b=fhWQSf0qrC27Q4sAJIdLacbKlI
	K/a/HUJR3zfrW1fZ7w7so0QMMAnKwlGCBAF0ac+35xeNFS7kw3e/ji/AUaVFEyJkRhQDxNa3Z/5Ni
	PBNzvfFakhSVSBo1NmVi7Gqogt2IgO7plBA5FdmoMjk8OtCIi0RO5gakMwp7PTL9fcLk1z1mEUGRG
	J1gqRWnTN8pOrLHq1u2q3vJvxJbu2aUMvCFab8AvzKELxNhTsQzAwjP+obwh2rTOZEL2vLBbIRLZ7
	Ga+CRKkI0sIti1LcYx7dAxTjQXB5PFCAqV+cXhpRkKEIFqB2UTW5YKrBqGcnxiSiCMJK+3CDkOzkx
	lFPyj1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFeo1-00000001koK-4A4V;
	Thu, 15 May 2025 20:03:49 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFejz-00000001k5b-1cX1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 19:59:40 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6f8b0f7c42dso404696d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 12:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747339178; x=1747943978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qWJZCHLwo4+rNxVq1K/n30vdDm3CIQkELPwI2pLPS/o=;
        b=KTzd2arKSCv6zclBuojXM2gTM+s4A1xblTKY+rwlZIcXhOlsU4VczUFU4ineQog3+f
         vf6HcPF4iSQu4Bfc9s/N5+pm5ZqEdmfNASg6GHkgmDbMbaSszVzvnS6FRkCvlRYRszf7
         PRZ3REoYE70WQdsxJzE63KE+BVNtzj7H+Ncwp/33qu06d/8Ii0Dx54PR6ajjObRrhfE2
         eKzHXydH2LYVg0Afg8s+eUrq3rbNIiNfee6Re6xa7bh0cwz2/YzToEZ87EADSsI7XyTl
         RyvcoasfcCOqialMjF+4uhpkxqijkXQsogLnPyiE8Ro31GteNCIhHFnE5bZ625/Pt7Qn
         ZHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339178; x=1747943978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWJZCHLwo4+rNxVq1K/n30vdDm3CIQkELPwI2pLPS/o=;
        b=ZhUI6MHxA/UDbPBI+zLimMrOjAVmSI8rs8xbwQUjU/FA08Bz477FiUBvKdPKDs0L2d
         QKXSzjIOy6l+myUMTnaDgjWhxKa/TghlisnaJBoAXbzk9S3H30SsIxZwI90mUls1P2W1
         bTTUEp4F6Z8DiKK8xg0PVy7Sj6VtKDEND6gRnaeF1V9bV/bbMYqjACQ1VJ98N2LpmiBN
         mvNvVd/Pyy8bBcpnQhuq82hj9SUTg+9u4jSX0Lg3IhEbothCCCxLXa8EuJSB5a/Dr4cD
         PrRvGvsGBzMgdiIhMHQnmcm7YORwVbXBFjRkNGU01mTp0Ha+t6lOZylf+HgkJNuQh6s/
         B8aA==
X-Forwarded-Encrypted: i=1; AJvYcCUqxws9whKhV2IKZuXkQhy7yCa0Apua6zf9/mw1GZvfwas5xgB0mht66q9VjwwSXyPZgarX3zfgAJ0WZfTo7Cu6@lists.infradead.org
X-Gm-Message-State: AOJu0YxjAHNbwzs2kpTWiubl2jcLXP1oeMaZKjyrweKe5OCgyxWRupja
	sPlbsROn3dlHIeYHvZmGmaDj/eKGPk2fAGo/Y3529OVgy+1a8l9oGOjV
X-Gm-Gg: ASbGncuoZWF/Uscb+vsA60sXhRwOOVbWrMTUUwXiYwvyYlvJcBMncrvdiv5a0gfLwS5
	hrw6Lho/E6k4vLjPIJ3ZNpsTii/ehzS3m04b6NQLVz8Shs5yEhjE2H55Er34/4XbLV2mSD8j05X
	pnqoREdHbbScAHTN5Tz39cttH358p6OxH9CJy/OS0YTHjsNPjrdXPEbUnmV49Hl5DbajjEnMHiZ
	Ob1wfXktxhwb5tEG/2b87ZbMaMQHLgLIXO6pO6Yap7oilOzoo///NJ/imCPpixvM20YHdCjktkx
	tZ+2Vx3fK28yKdGGs0BQeSLRne4lTnoh4RZED4KSRYTc7UdB6/AQKBJvT65NQ8wKdhG8v9UQQW/
	oIQkDFRfwA47rYKBPUIg=
X-Google-Smtp-Source: AGHT+IH82TQ9c8cVYqaXjsAhzpScTuQetKQyv8EkyvQLwXx7nU7GdytaDPOdEesc7oYyyCkeN49+/Q==
X-Received: by 2002:ac8:5951:0:b0:475:876:ac3d with SMTP id d75a77b69052e-494ae41e3a4mr3460681cf.13.1747339178066;
        Thu, 15 May 2025 12:59:38 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:59:37 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 15:58:43 -0400
Subject: [PATCH v6 1/7] iommu/arm-smmu-qcom: Enable threaded IRQ for Adreno
 SMMUv2/MMU500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-1-4fe2a583a878@gmail.com>
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
In-Reply-To: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339176; l=2173;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=DPKRVjaqGjt+UvV8ZZCM0hAEA0xW5F7yYBkPh+fJ4X4=;
 b=62Z0w3hpPUoa4KOiyVuNO04DfGNn3v70J7ZnmSCozzrwREkvpBQansvHOQaEZoUFL+zftDl/L
 uXXn7xCS28bAYrzU5iTGeMySBdN12STsv+/vLopzuc9rlGmgu1VXpvp
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_125939_430861_CD9A41DA 
X-CRM114-Status: GOOD (  14.00  )
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
index 6372f3e25c4bc24cb52f9233095170e8aa510a53..2b21b7208bc7b439d69e36ca678acd2eacbd5b85 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -468,6 +468,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.context_fault_needs_threaded_irq = true,
 };
 
 static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
@@ -477,6 +478,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.context_fault_needs_threaded_irq = true,
 };
 
 static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,

-- 
2.47.1


