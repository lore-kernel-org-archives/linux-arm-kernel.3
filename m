Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87462C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3eyPuG/7N0ePFJ/qBb/yJdx1/OQTbqvhMmqlXZb7jM=; b=OJjVrLLN4s+Hkh5d7HWTFJLcFC
	4foBf7umkUIOUyPxkLhXLIj91UbW3dfKHTDYkbSL6fDz+BzNqVYxQur25/0OusQBVuZGJzgVan9p+
	KeneaAAknP7DRklst3ESm+r8QYvpl4U7HJauk2sP62ZEXMYO36tVAVcdRYC39EeDbVeiZNbZvzQCj
	O/kY+rej4N8OjLRtzdspy+KH74i/gfFU43AfBZJFxkApnfOdjkACBZwkl/Dmdq6YjQqYqn6+9clpX
	m0YTVhYQ/Eh+kXQ8YupOz8w5cqvpUvDPvpPgsRDvcJrb8mdeFK/xBRq8nwRvgWgGoyj4xnOPeIXjP
	apq3SooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSII-00000009alK-0HR4;
	Sun, 05 Jul 2026 19:14:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSID-00000009ajL-1PKN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:14:18 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so20592545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278855; x=1783883655; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3eyPuG/7N0ePFJ/qBb/yJdx1/OQTbqvhMmqlXZb7jM=;
        b=OOfcEkudWyi89NmM4RnbpNghGzbPNExJ3FqDZ0oFL2iWBeO7PRPLO2NOkHxSc6H1bP
         G+dVOWI/Won7Woc8ChmnuPiqooBeInDrkBoRjp2XZWg7c9HzddfqL+tvIXWoa+oE6LUf
         YjbyPar+nyJP9TiixtS/8CkR1hW/KUBV/pIuGTFGmDbSiOJ4EQcNYacyHJgLVORN/zM5
         JhDO2p9wF9HvEWP6GIralGAT4SC9iSFgpjPD8DKJCg9SjDiK1SA+rs1CrDWBN660Sqxt
         D3vZ7FxsOk3FDKJyHMPy50qyzIpvPrumQAyaAqOJsUYw8JPOLQn6p7xlmqTmCjSsXqpj
         quPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278855; x=1783883655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3eyPuG/7N0ePFJ/qBb/yJdx1/OQTbqvhMmqlXZb7jM=;
        b=b8QdstJu5aTjZTLNuD9HUY23b8WkE4+UMkfcUJ1c/nPUDpav3vYSXqrnaal2/Yev54
         Bcs03ldT4vfDtwt+tR0L/zQso3l6x90A5WqbzmO0nGWi2E1hTRYvQrwjioW49M6ycqW2
         T1vQDKF59SsfC8TAvVWB3cVHebjmGO3/VpZnBEXbaf9oIieARRvOpSpidVJIdfyEbLT/
         Zrz94wqrRmTDmJplfDuwvFpX5BtjpI7zJ6MLRQXa72zt3W5E1GzrpcQGuQUI0C0gDd/Z
         9NvWQ6oeuC8fFm7ptYk42QfqE08MJKuQH9X3TZ9+qxksbf8tlfVm0orIk2xPVlR4jxJ3
         uWxg==
X-Forwarded-Encrypted: i=1; AHgh+RqnKjzm4PXZrqv69bektloiVa7GfSqWje7eLNFYYWOLqidu/DaUtnGAFsU3N0Oc8wfBLtOtnxTslKJTFnDjh5G1@lists.infradead.org
X-Gm-Message-State: AOJu0YxVul4Fp/4ShJzYPOVw/P8crskJ36Sgl9ehJcFJ21u8PH/J1/bV
	JuTQ44nhJZiIYtAQQL/fgHzFbNfpUyjfTGxod7uHBqwJ6VNQtUvDdkU=
X-Gm-Gg: AfdE7ckUk2GhCQuln2akG+UH8nQtKkcLnWmSPHNLCXGhNkYz/ekFQsEe2FcLE3mOV9b
	Iq3XsyODDRNWcVp4uViSNGdlmSZmWcAG9fr6J9xAOoefgzvbr/7tL/bukO/vrhTMPWmOaqMtZ7d
	GGNIiIpnkJAEemwy4Ih/dQOBQww4KYqS99mBj+5S8SuVP4iDOWtaCuZTOHwcDvhXiCDoQpE6LvS
	HZjEGgz93YeC7p23ltd++HiM8xMjBx2GG+E2czGWaQilzo1ANfD6kkk0N3npYqGibppyCNOrLO+
	iIkA4zB00qJcomNSmsDkPczWi6VjOxHSWz7F3XQKFVF2UekE1gv8iuaklhq7Npx9D3LOG9suL0M
	982BgR4jfnucaF1m5l1ArpWXR8UYkm9OukC9y9WUnSbauIwnZwgwFiZuVmwFDLdSrIRTM2/Wejp
	09QkBpJD7bIOKVTFjbbm6DsFTzIy5VKkU0SZS7ezgF
X-Received: by 2002:a05:600c:628f:b0:493:bf84:53d8 with SMTP id 5b1f17b1804b1-493d11d7d55mr92320425e9.9.1783278855325;
        Sun, 05 Jul 2026 12:14:15 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:14 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:35 +0200
Subject: [PATCH RFC 01/13] iommu: arm-smmu-qcom: Configure lpac device with
 split address space
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-1-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=2198;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=TOpopsFtZ1PPnGuz7Qdse1Rb2dSOsjvazts1+j2Qsuk=;
 b=swnPSg6jJwnfwPpO2lUtsliGm7jHo9gqL51QEmCML+oAIm1zPDuCFHYdt3TNVGcjeXVx38cVC
 13fGjbA8BMDAB0TZwyRx8GCJenaSAUzrSU2r89a5X2KYaRbtynBvrSe
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_121417_394637_542527CB 
X-CRM114-Status: GOOD (  13.84  )
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

We want the context bank used by LPAC to use split address space just
like GFX.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index edd41b5a3b6a..48a590aaeb5e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -35,6 +35,8 @@
 static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 	{ .compatible = "qcom,adreno",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,lpac",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,adreno-gmu",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,adreno-smmu",
@@ -217,6 +219,7 @@ static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_a
 }
 
 #define QCOM_ADRENO_SMMU_GPU_SID 0
+#define QCOM_ADRENO_SMMU_LPAC_SID 1
 
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 {
@@ -230,7 +233,8 @@ static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 	for (i = 0; i < fwspec->num_ids; i++) {
 		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
 
-		if (sid == QCOM_ADRENO_SMMU_GPU_SID)
+		if (sid == QCOM_ADRENO_SMMU_GPU_SID ||
+		    sid == QCOM_ADRENO_SMMU_LPAC_SID)
 			return true;
 	}
 
@@ -305,9 +309,9 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
 	 */
 	if (qcom_adreno_smmu_is_gpu_device(dev)) {
 		start = 0;
-		count = 1;
+		count = 2;
 	} else {
-		start = 1;
+		start = 2;
 		count = smmu->num_context_banks;
 	}
 
@@ -394,6 +398,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 
 static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
+	{ .compatible = "qcom,lpac" },
 	{ .compatible = "qcom,adreno-gmu" },
 	{ .compatible = "qcom,glymur-mdss" },
 	{ .compatible = "qcom,mdp4" },

-- 
2.54.0


