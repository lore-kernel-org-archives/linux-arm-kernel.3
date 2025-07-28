Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECC2C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R18CRwRipna7yM1UAYryO2eun2b5lSz7TequZZhl+Fo=; b=PvlLGFn36IMWy6fpoUi5iytqwt
	iH5oOiv7GKgWla5AsdiW1JCXCG87oJQ8Zh1p0WwIXFiENjC6w5xqtJd/vp50SU81KoPG+2Tsd4j29
	CqtA4GN1GNZI+RCrZciWbo7hke1yf2s2mvCILqaKacdXXplDrSj7uFIpgRzfX5JCAGGZQqdyNQHF7
	N41O3p8/Vox4Wrl/Ewalq4A7pn/ri7sSXrrW2i4Th6g9Hq1gjGlSYyqkVW7nvu4Uicw+xyXU0AyLk
	8jTp6/n1+ISThkFz1FFbkCnUmt/q1xktEKQQtnTzEPNhuk7Bs9MpTztqwa7vIEBIh18thQYSBEPQq
	RouiG/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTif-0000000FHpS-0eiO;
	Mon, 28 Jul 2025 19:41:09 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2d-0000000F8sL-2AQS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:40 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-607c239c7f0so4391644a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725217; x=1754330017; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R18CRwRipna7yM1UAYryO2eun2b5lSz7TequZZhl+Fo=;
        b=XHqnkAkyQZsJCRzMArEHGJ6axfoMnTr1C48B72rv8O4z6Aim6hGd+H9ivvhAbFLlU5
         2BNe0UviK4uAHrVP3oNIr4OhAaK/uar50xSAHFw0XOGaEbyeIwmO7niquJIQlfuNpefg
         aSQkUoQIkixs+OYqiSy5yH9Va+bzJQ5Topre2ei2fmeWFxNZM/Vj2t9BXmA7suvO1Zd4
         vD+eluIvbO7Rv+HG8Ly95Xx6O/rNfh0UW9g/0DM4k1dO76MFQfYT0PIirpIYC0HVOWG8
         0V5+wy9t5kW3QCzmth9aBjI8vZ/11zgEBSRBUq5F2sgOe0v7GTepbcpvXv3RP4NCH9xy
         grwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725218; x=1754330018;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R18CRwRipna7yM1UAYryO2eun2b5lSz7TequZZhl+Fo=;
        b=BBdqizLluW4aYnrEtDwPkCyaf6xjRzqD++GAsGH5+T+OXJhrvj6IxZZKb2Y4piMT1+
         BwEsLw87q0a1d4fwbLI+0jYMlyYPaXT5fnmLVHsteoJzxvBsrvhu3RTNGqdCmE8FIjOM
         L+RKkEYdFeJFNIPS43ZDFC7clomygsKAdaHSMjQtEjUAEfZThs84lD2XWvFF7/239cn3
         3jAjj/RGJ0n72nn2dNMXCNBnVx0GGYaBkkTV3lpQ4Y1oz5gIJ48l3OUY6FUrJ6jTC+zL
         AktmbZJL2B6+WULuMsbPBn4Kfna2+VC0hLBWjwYAowomtBGIQq9rSKLsrfDyQKkyY1ga
         4V9g==
X-Forwarded-Encrypted: i=1; AJvYcCVdkufecK7xzflnXSjdRcS2C3Xo/THpYBDAcYPQv68pu9N19+xyA2NSQm4GKwS7okBlVnxtGhPHzdGrPppYoy7M@lists.infradead.org
X-Gm-Message-State: AOJu0YzAsUnoKnQuueAV6IruAI9kfJVQ4WGWT/eAu3AVO5q9YmaZya4J
	7MCCpI5AAQJsCsnEneSCfDpZNBUo4DJJAPtxLxv6/hzrgMngZOJOOwR1S0GF4tckubKZ16wnuBI
	NfZWS0h2CY4QPDg==
X-Google-Smtp-Source: AGHT+IGIrNMQeE/kWCI/brr7kS87BOY/bq6CCQ1xjchC98i6bmhfhF9J/7LevHBGbUwRoLbmWwCwzxtv61jC5A==
X-Received: from eddf14.prod.google.com ([2002:a05:6402:354e:b0:612:c149:d25d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:268f:b0:60c:9d90:93c7 with SMTP id 4fb4d7f45d1cf-614f1f12240mr12562721a12.34.1753725217591;
 Mon, 28 Jul 2025 10:53:37 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:52:54 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-8-smostafa@google.com>
Subject: [PATCH v3 07/29] iommu/arm-smmu-v3: Extract driver-specific bits from
 probe function
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_105339_555073_2C5EC427 
X-CRM114-Status: GOOD (  13.16  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

As we're about to share the arm_smmu_device_hw_probe() function with the
KVM driver, extract bits that are specific to the normal driver.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 10cc6dc26b7b..801b792dda36 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4353,7 +4353,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 
 	if (reg & IDR0_MSI) {
 		smmu->features |= ARM_SMMU_FEAT_MSI;
-		if (coherent && !disable_msipolling)
+		if (coherent)
 			smmu->options |= ARM_SMMU_OPT_MSIPOLL;
 	}
 
@@ -4504,11 +4504,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		smmu->oas = 48;
 	}
 
-	if (arm_smmu_ops.pgsize_bitmap == -1UL)
-		arm_smmu_ops.pgsize_bitmap = smmu->pgsize_bitmap;
-	else
-		arm_smmu_ops.pgsize_bitmap |= smmu->pgsize_bitmap;
-
 	/* Set the DMA mask for our table walker */
 	if (dma_set_mask_and_coherent(smmu->dev, DMA_BIT_MASK(smmu->oas)))
 		dev_warn(smmu->dev,
@@ -4522,9 +4517,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 
 	arm_smmu_device_iidr_probe(smmu);
 
-	if (arm_smmu_sva_supported(smmu))
-		smmu->features |= ARM_SMMU_FEAT_SVA;
-
 	dev_info(smmu->dev, "ias %lu-bit, oas %lu-bit (features 0x%08x)\n",
 		 smmu->ias, smmu->oas, smmu->features);
 	return 0;
@@ -4794,6 +4786,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (arm_smmu_sva_supported(smmu))
+		smmu->features |= ARM_SMMU_FEAT_SVA;
+
+	if (disable_msipolling)
+		smmu->options &= ~ARM_SMMU_OPT_MSIPOLL;
+
+	if (arm_smmu_ops.pgsize_bitmap == -1UL)
+		arm_smmu_ops.pgsize_bitmap = smmu->pgsize_bitmap;
+	else
+		arm_smmu_ops.pgsize_bitmap |= smmu->pgsize_bitmap;
+
 	/* Initialise in-memory data structures */
 	ret = arm_smmu_init_structures(smmu);
 	if (ret)
-- 
2.50.1.552.g942d659e1b-goog


