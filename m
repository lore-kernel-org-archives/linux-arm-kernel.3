Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46450CCA46B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20qKmJOpxWxZsYx6berl9FrHJn60ekVP6T05FryarsM=; b=ltTOrSJFqacRc2/LDJtxsToEDf
	Ji0mNm439zLHpMCkloH5e3AM6LKuPEHXolY05UtqnrbZzcbZpLarme4xcNEAbTtfSMoIV2k+PLbjB
	hdETYnGOvj2H9zneN+yqPxofCiAoJFH1ykC9y4RjrFx2QXKFw4fIH4AYtvrPOk557FDLC8Z1VDgDr
	V7YW3QQJoKlShBZs6HDbXLwu9gXQ26qfBTfrOe1LoCMMmvqRAb3dutilmpuSw2Ml+6a2vKp4zdAZ8
	x/jpYf7ifLrfiQM1kT2Qn1z1OXwY0gCuxj+3C3GGkaRPDgv+67RXpXzRLHCvoKMvcp6yBEDXOafgC
	fLPbaDjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRll-00000001INs-0D0U;
	Thu, 15 Oct 2026 20:09:41 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlZ-00000001I7f-1TLx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:30 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-6b1c6f567caso5642797a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094965; x=1792699765; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20qKmJOpxWxZsYx6berl9FrHJn60ekVP6T05FryarsM=;
        b=T+j1bHdpRj0PFvZZ3xISykzZIkax0vMkcDp0WWkVL/iln59W7zkb0WUTEV4ToyC7cz
         TfHd9eNOtlA6P+uXw2+qS6OEYB7v0O55IUihmfljijVURwqY2hegwaGYxWFFysSlVacC
         f0pIpU376nHsx19mHq5FfplOoc22bQuatUQCw+O1t3tCzrw2n8nWXYEDxv5OqCc7Gb6f
         RGcOWvEIHbHeBI/qdLpARDjHEKv/RPMiE+T8Cz0qF/4T+ZH+3GiLBKBmfCFqY9xO9/Qw
         eYoHCkecH2otOQDbxfiC3W3q/FJTGGvKDtzslDjtGqtVfc7D5E1w0dJCPIvBb685E76q
         bTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094965; x=1792699765;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=20qKmJOpxWxZsYx6berl9FrHJn60ekVP6T05FryarsM=;
        b=WTF7RfC1cGK8QWZEm7qwRnSeKB1iWrSTq2H+wKZngPg/2Z2Foy5k/F5X4O1cTqSz9d
         fvSnWUYiz6eb17IXZHpWF3GUnt6giNXmQzxLewUwZbryZdKGdhtMy1SMiOAg28WA2147
         WKi91zUKPQO0wveuWyZcuqwqj9xBpseLF2vFQGVal/dlUxb5F3CnXNa1arx1UwjPGoQL
         ZzKak1UBXhf6cYLINRg43BLBKGhl6ZLsZ3pjlbspEIcG+CxAuPpMiiG2EuyODqxlXLFd
         a98UcY07ymcYwrvvgD2ykGrT5JhD6GWiczcTfId7OFBehLGhrUf43iObSfjvD7sN3q9a
         +cGw==
X-Gm-Message-State: AFq9FYJ0Emqoab3gxAHj/KwqWd938fSBkGaaf0721pei3TBfUm1EmVsr
	iEZjeW8acSiaPp8bEhECRsIfslfDq8ewBBf9PByo6Y5ZxwohDrFz6DpQ25DsVp7Q1ldPWJi/U6j
	oHAXNpd0J3X0AViTDILdEPCSt4F1MueqZbnJQ1FgNtPr3rNRVDJEJZPKqpzAL9ArfgAd7MAEIiR
	Ct9Nev9YSzgYKrAmWTS3n2bPfjNKGorVD46qHSQsIrhWyH+hJEtp/oPwLYj9XOwNj67A==
X-Received: from edai29.prod.google.com ([2002:a05:6402:f1d:b0:6b1:d940:d8b8])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4554:b0:6b1:ced2:dfd4 with SMTP id 4fb4d7f45d1cf-6b1ced2e477mr7043030a12.21.1792094964923;
 Thu, 15 Oct 2026 13:09:24 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:43 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-13-smostafa@google.com>
Subject: [PATCH v9 12/25] iommu/arm-smmu-v3-kvm: Probe SMMU HW
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_130929_409884_0FF459AE 
X-CRM114-Status: GOOD (  16.86  )
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

Probe the SMMU features from the IDR registers with the functions shared
with the kernel driver. SubstreamID bits and queue sizes are not needed
here: CDs are not shadowed and the command queue is set up later.

The hypervisor requires two things the kernel driver does not:
- Coherent table walks, reported by both firmware and IDR0.COHACC, as
  it does no cache maintenance on its tables.
- Nested translation, as the host keeps stage-1 and the hypervisor adds
  stage-2.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 46 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
index ba209951039f..2b4a0f961a66 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -31,6 +31,47 @@ static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 	smmu->base = NULL;
 }
 
+/*
+ * Mini-probe and validation for the hypervisor.
+ */
+static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u32 reg;
+	int ret;
+
+	/* Not supported yet. */
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		return -ENXIO;
+
+	ret = arm_smmu_device_idr0_probe(smmu, true, &reg);
+	if (ret)
+		return ret;
+
+	/*
+	 * Core code clears FEAT_ATS with !CONFIG_PCI_ATS, but the hypervisor
+	 * must know if it is actually supported for CR0 emulation.
+	 */
+	if (reg & IDR0_ATS)
+		smmu->features |= ARM_SMMU_FEAT_ATS;
+
+	/* Firmware says coherent, the hardware must agree. */
+	if (!(reg & IDR0_COHACC))
+		return -ENXIO;
+
+	ret = arm_smmu_device_idr1_probe(smmu, &reg);
+	if (ret)
+		return ret;
+
+	arm_smmu_device_idr3_probe(smmu);
+	arm_smmu_device_idr5_probe(smmu);
+	arm_smmu_device_iidr_probe(smmu);
+
+	if (!(smmu->features & ARM_SMMU_FEAT_NESTING))
+		return -ENXIO;
+
+	return 0;
+}
+
 static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	unsigned long haddr;
@@ -45,8 +86,11 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 		return ret;
 
 	smmu->base = (void __iomem *)haddr;
+	ret = smmu_probe(smmu);
+	if (ret)
+		smmu_deinit_device(smmu);
 
-	return 0;
+	return ret;
 }
 
 /* Called while the host is still trusted. */
-- 
2.56.0.176.g3575e65682-goog


