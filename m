Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD22C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 00:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gIINLTUaLnUoGc/shiZVTfzJewFDLRIL07KX6BIkMJo=; b=hmr/vHaqFLgq93Pi8dISiBRK7i
	iPLensWLvy1Tyx5z5eFp+VdzXraGY2t/zT+l6ptOaAiNXqnN1hakqL6nx1Ek/wMpRtqMhvKe1GDUT
	wr4MvnnTJmhMkZ+88W1tVNVSUbjZJ9+8aM8xJkr7DXvEA3Q3JztEcVW1k8uBy1HF7d+RBPNg2hpZY
	tpcADtZe25noSD0wAjRsImyY0RRJsD0FXTIHawkIaxyOuMZ93fc0a0OdeWePvZSubqKAHr4Hwn5D6
	1IjAd5EouxJJBOtknkNc1MGSZgwJCUOA90fNWiyFZI6jjA1/cDDVaBqXKwtjog+IIhVcEBcgPJ3bB
	MUSzMR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK4jn-0000000BqKg-0vGB;
	Wed, 28 May 2025 00:33:43 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK4hX-0000000Bpvx-2rhw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 00:31:24 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a375888297so218724f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 17:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748392281; x=1748997081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gIINLTUaLnUoGc/shiZVTfzJewFDLRIL07KX6BIkMJo=;
        b=T2f29wxVDz0GvFC0jBCZPHPq58mwgu+ASflvP98mPuuhuZ2tGnnT6nPfg8hsILVarh
         Zx+Q9PBqz0BUdNZzcSUJ6rIsOuzeRX2PT12aAnJUHkts84Bw8dIx7aZ2Ql259UcslRxi
         6c4UpYCS3/EHO4RoDiYCRRR4BjqT23Rwu8n7/ZMvlXAXKkusWV28+TRq07KxgnyI1GUm
         MSqrIc9Ddym1zX06wORXxSZF24uNsj+zCAg3PEPQfU/S4qp/oo1gwJ07Vh7an2dro12P
         l7LODv1R+VKax8REW4iy2eeQQ+HWRGX5PcP9wgzj49fW5OlXcwKgMctYHhu3dkyzT3PN
         Aacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748392281; x=1748997081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIINLTUaLnUoGc/shiZVTfzJewFDLRIL07KX6BIkMJo=;
        b=g+Tx+YzKK97Zn7IidY3BCAvXIxkBD9OJ7qKrQ6dIFdYmBWgQwz4fMawZ6YnxPcVIxY
         9utKlR/Dxl36KvXr3cQYzmPcBh8WgWZGgK7K3BmS7V8eG43UuCHAQI+ZePPMUq+W9ECr
         YaEqF6eg3RtsQDqLQlYE9jpLgvJDJTxW4wYnHTyePw6UpeSvB5P68FWo0dY+lFseMkN+
         pnMxc13eWGxXPacBrutWlShu/PFHtwCOzviB08JH+S+8Dbf17feB6utLbLR6/Qh9Hqw+
         ySdJUj345z8iDs7T7he8YNw2YDamE4zwgh70f1P3wOQM33Oy6tXqQfeZvoDN/JI1ijpk
         SUgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrbwJeiGyHFxclBbMMYAHcjLjq/ovapNT1NQHYbv7WlGCLmOQr7/obL7id4kPAFAoEnycpI2ho9sqoyjhknLW0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2y2xFECfX9Mf6rEaGRo4EM7woCDz0Xe7yQsv2L/f7o3+lWJH3
	K8FnVJw0G2TFt1zWqOae3OlJy5Pqm/ih6+dcVSM20hg8AJp+N+yV4K0xg62xK5R6+9BerGGGkq6
	12DIG
X-Gm-Gg: ASbGncuqaafqjqaILig5ifIOgay0iX+PQt/JLfrLDqfJgQEDvrx5uHUifulhFq+oY2N
	j+Wd007F8wuP1QXnC9Sru/I4gSpazyUDJyhhx8vGXbMmrOn93QlCIG7hQ7d2/51Fo+dX1fg2RqG
	1mEOd2h4fFT8px4DUn9wampFscmdleuX8N4YHYbVd4N+96/rtjflUK4wV5+N4HLTMW4C09ionox
	V9dVLgBqm449eDQMnBIg7pooVTxBfHZWnhKhMSKeOvEROS6g63j3mi1aJO+LHgXq3GqZzAVH+lp
	FlXzlrcc8aDSf1D1VGS2E4yAEkNMdVC8kAi5AHSMQrjvqK9qQBmBlVmDy24=
X-Google-Smtp-Source: AGHT+IFxSGQLHHLXajXUw+l8QvUa1GNINdp2fs5C70KSEXMnzFvKtHMrwh3iyD2kg9WD2MSpHAJ4sw==
X-Received: by 2002:a05:6000:12ce:b0:3a4:e603:3d2 with SMTP id ffacd0b85a97d-3a4e60303f3mr1695166f8f.0.1748392281383;
        Tue, 27 May 2025 17:31:21 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:f024:90b8:5947:4156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4e8bc3444sm431020f8f.64.2025.05.27.17.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 17:31:20 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: robdclark@gmail.com,
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
Subject: [PATCH] iommu/arm-smmu-qcom: Add SM6115 MDSS compatible
Date: Wed, 28 May 2025 01:31:18 +0100
Message-ID: <20250528003118.214093-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_173123_735272_C7C30270 
X-CRM114-Status: GOOD (  11.83  )
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

and also leads to failed initialisation of lontium lt9611uxc driver
and gpu afterwards:

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
Cc: <stable@vger.kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e..c919babcea75 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -365,6 +365,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sdm670-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm6115-mdss" },
 	{ .compatible = "qcom,sm6350-mdss" },
 	{ .compatible = "qcom,sm6375-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
-- 
2.47.2


