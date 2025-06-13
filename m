Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BB7C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ztUb1CK2ca+AmmvOq6nu5cc85DsCpI/YRfqf7x02fNA=; b=DkHFQVuuHpZPmnvIw3C2qlSqXI
	NXzylGXSFtc13KdWxv/rleq2C3BLiShVbYCmMnkQGRi8UA5IBAB7VXRT7FFUydgTTgmO3gMfPr+UD
	TRhTIQsnBGvevad3IM/w75KxU8v5D4k2XHySSWuMBrvq1Q/AL+QzdxX4G99fnEyak/gkiuCRIqAVz
	kYP8gM2QOEytUf220gEmfxjdiiXzFVPVrkRXmNc9B1rtIZEVvtRqk0udtbmrR86NKxsLekBUP/3VP
	jXHdkeKLRim1nzCvPoRpixB1eIaANfdWUsGzK8PKF9HSTtWTT7AgKWO5PrUXF2QVZ/UNW4QSY69iA
	9JqF4WYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9hD-0000000HNdR-2cAd;
	Fri, 13 Jun 2025 19:04:11 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8Gf-0000000HAPS-3V5J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 17:32:43 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a36748920cso2431973f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 10:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749835960; x=1750440760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztUb1CK2ca+AmmvOq6nu5cc85DsCpI/YRfqf7x02fNA=;
        b=gsFkbFsSdXCJHJXlPdUUOZ6lT+WV53YxS+F4ULI8jDIw8Z/CUCFbLu8Hd1peSI7E4H
         eShWJ4OV89Wd1amFZH6z24khTG2Dj3oHEKwNiU10oz2Qq6G6wo3jEAnRDbFTxiF1wfjk
         bG6L20nBNOJaQsl2RnE0dmpLWq7Fa5LzDKQIo71reFtWc4bWbdW0wQFNkAciwF6pH60u
         H8R2YoP9eQ9NMgzFvt/L+0jOhLb538mDLpzYSnt8TNsflLw5XCMQv1WW2tdIUJLPkf/6
         h7ius078y7cqzRjH93195hbxPerSPDw50P9kNTB3J/haoqjm31EZA0P2U1gL+qhmDvNt
         tHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749835960; x=1750440760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztUb1CK2ca+AmmvOq6nu5cc85DsCpI/YRfqf7x02fNA=;
        b=E/xiIoRmRQCC95LzWIR9+MT5RqmZcdgKE9p6D1ORmYboBOanCOW/yGkeEEdspLGN27
         ouRhTvSMH1Sdw2kZqoVX0v3yPMd+Yy8lptIHXXjYRs7uGcMLERe24VlrwzdpCtw+kWFV
         Vx67/1Z4vsTA7qP/mEMM1Z51mK1jzuFpFU50m6p2R99g21O0XixFte+lpJwjnB5gsTej
         F0cnAoZLcUYdCP2mEwNQu8n+WMmuV4akbSIBcSYIqe/IY/Av4T2Fq/aNlxe0Sheihji7
         or7yTSs+rxD9pxPlCTQLgFWISGaDEwSQ5fNVRtVD1m5hNlvZYqiuLvr7zKVMjmtShDug
         E8Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUG9m8Moqq6PX9K6uzrvtYkK15a3a7VYTW6ZOFcw3mDsP9Yyk0yCmgt1vEX1MczFCYff/lQ9HQSXdbqUmKFfoOI@lists.infradead.org
X-Gm-Message-State: AOJu0YwHOg2yKfz3NHpVuu0FZDumY4Did7Ybre4MygRDs522x7lniOaW
	ZfqsWBDTfcW9LmgNaOrsQ5tHhpbxwUwpg6Y2XmpLsOMRUVwn8lcOa5TPr9NPBjAr/Tc=
X-Gm-Gg: ASbGncsqRXKNa9SxQzJ4PasbAEJTIpe27SmQZDoeuZbs2+nwLovWVrMiRLTedQ1ZKee
	rZ9OcQ/Q+h/TiE1O2DPNasfFSruY3xvqoPFlTIHzfMfkR+WmbhoMZ9BR/AYTAIIzlSa97xaIWCa
	n1lEkIsWg6u+OlNqirWFbP2TcGXeveVNy2S3QxvVV8sMXTiq/czGp50ny6THRyYtG8JjEaknFEP
	X6KhD230mOeK0KtY1j9KDLfhUPEKX+3LCiYe5D4fChHHKI+OstEzOL8D8iOrojr8lgFf8sU+Lb6
	v94EEbxDxSKzlvKxR6PXAYrY2vk/yMmvQxm9rMk/pUuMNnUzQCBR8H47UqU+qd8wRVCrEg==
X-Google-Smtp-Source: AGHT+IEYT7vrlwuZEZwaQvZcRRnUXPS9FnrmpBGm7dU1PJcmsjyw9hFaJHssD/ILloIFSkFm7tbgkA==
X-Received: by 2002:a5d:6f01:0:b0:3a4:d8f8:fba7 with SMTP id ffacd0b85a97d-3a572367c78mr730290f8f.2.1749835959714;
        Fri, 13 Jun 2025 10:32:39 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:c8e2:ba7d:a1c6:463f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224888sm59212625e9.1.2025.06.13.10.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 10:32:39 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: robin.clark@oss.qualcomm.com,
	will@kernel.org,
	robin.murphy@arm.com,
	linux-arm-msm@vger.kernel.org
Cc: joro@8bytes.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	andersson@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v2] iommu/arm-smmu-qcom: Add SM6115 MDSS compatible
Date: Fri, 13 Jun 2025 18:32:38 +0100
Message-ID: <20250613173238.15061-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_103241_875999_747677B0 
X-CRM114-Status: GOOD (  12.30  )
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

Add the SM6115 MDSS compatible to clients compatible list, as it also
needs that workaround.
Without this workaround, for example, QRB4210 RB2 which is based on
SM4250/SM6115 generates a lot of smmu unhandled context faults during
boot:

arm_smmu_context_fault: 116854 callbacks suppressed
arm-smmu c600000.iommu: Unhandled context fault: fsr=0x402,
iova=0x5c0ec600, fsynr=0x320021, cbfrsynra=0x420, cb=5
arm-smmu c600000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x420
arm-smmu c600000.iommu: FSYNR0 = 00320021 [S1CBNDX=50 PNU PLVL=1]
arm-smmu c600000.iommu: Unhandled context fault: fsr=0x402,
iova=0x5c0d7800, fsynr=0x320021, cbfrsynra=0x420, cb=5
arm-smmu c600000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x420

and also failed initialisation of lontium lt9611uxc, gpu and dpu is
observed:
(binding MDSS components triggered by lt9611uxc have failed)

 ------------[ cut here ]------------
 !aspace
 WARNING: CPU: 6 PID: 324 at drivers/gpu/drm/msm/msm_gem_vma.c:130 msm_gem_vma_init+0x150/0x18c [msm]
 Modules linked in: ... (long list of modules)
 CPU: 6 UID: 0 PID: 324 Comm: (udev-worker) Not tainted 6.15.0-03037-gaacc73ceeb8b #4 PREEMPT
 Hardware name: Qualcomm Technologies, Inc. QRB4210 RB2 (DT)
 pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : msm_gem_vma_init+0x150/0x18c [msm]
 lr : msm_gem_vma_init+0x150/0x18c [msm]
 sp : ffff80008144b280
  		...
 Call trace:
  msm_gem_vma_init+0x150/0x18c [msm] (P)
  get_vma_locked+0xc0/0x194 [msm]
  msm_gem_get_and_pin_iova_range+0x4c/0xdc [msm]
  msm_gem_kernel_new+0x48/0x160 [msm]
  msm_gpu_init+0x34c/0x53c [msm]
  adreno_gpu_init+0x1b0/0x2d8 [msm]
  a6xx_gpu_init+0x1e8/0x9e0 [msm]
  adreno_bind+0x2b8/0x348 [msm]
  component_bind_all+0x100/0x230
  msm_drm_bind+0x13c/0x3d0 [msm]
  try_to_bring_up_aggregate_device+0x164/0x1d0
  __component_add+0xa4/0x174
  component_add+0x14/0x20
  dsi_dev_attach+0x20/0x34 [msm]
  dsi_host_attach+0x58/0x98 [msm]
  devm_mipi_dsi_attach+0x34/0x90
  lt9611uxc_attach_dsi.isra.0+0x94/0x124 [lontium_lt9611uxc]
  lt9611uxc_probe+0x540/0x5fc [lontium_lt9611uxc]
  i2c_device_probe+0x148/0x2a8
  really_probe+0xbc/0x2c0
  __driver_probe_device+0x78/0x120
  driver_probe_device+0x3c/0x154
  __driver_attach+0x90/0x1a0
  bus_for_each_dev+0x68/0xb8
  driver_attach+0x24/0x30
  bus_add_driver+0xe4/0x208
  driver_register+0x68/0x124
  i2c_register_driver+0x48/0xcc
  lt9611uxc_driver_init+0x20/0x1000 [lontium_lt9611uxc]
  do_one_initcall+0x60/0x1d4
  do_init_module+0x54/0x1fc
  load_module+0x1748/0x1c8c
  init_module_from_file+0x74/0xa0
  __arm64_sys_finit_module+0x130/0x2f8
  invoke_syscall+0x48/0x104
  el0_svc_common.constprop.0+0xc0/0xe0
  do_el0_svc+0x1c/0x28
  el0_svc+0x2c/0x80
  el0t_64_sync_handler+0x10c/0x138
  el0t_64_sync+0x198/0x19c
 ---[ end trace 0000000000000000 ]---
 msm_dpu 5e01000.display-controller: [drm:msm_gpu_init [msm]] *ERROR* could not allocate memptrs: -22
 msm_dpu 5e01000.display-controller: failed to load adreno gpu
 platform a400000.remoteproc:glink-edge:apr:service@7:dais: Adding to iommu group 19
 msm_dpu 5e01000.display-controller: failed to bind 5900000.gpu (ops a3xx_ops [msm]): -22
 msm_dpu 5e01000.display-controller: adev bind failed: -22
 lt9611uxc 0-002b: failed to attach dsi to host
 lt9611uxc 0-002b: probe with driver lt9611uxc failed with error -22

Suggested-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM6115")
Cc: <stable@vger.kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---

v2:
 - added tags as suggested by Dmitry;
 - slightly updated text in the commit message.

Previous version: https://lore.kernel.org/linux-arm-msm/20250528003118.214093-1-alexey.klimov@linaro.org/

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 62874b18f645..c75023718595 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -379,6 +379,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sdm670-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm6115-mdss" },
 	{ .compatible = "qcom,sm6350-mdss" },
 	{ .compatible = "qcom,sm6375-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
-- 
2.47.2


