Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E24CEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMp7HNJ/zmdg927vlU51I3Qx46lV/WtDLm/uWh7mI/8=; b=Necewq+S6m8/4hlmLfgTYTr7pN
	wl5ygoUS0+S0SVhLCMEZk8xc1tLNPEJtDGqm4Rk5RO996ix2MLmRbY9/fnCbgzyqZJvGuJCvtfvin
	WDI+iGVmRw5zFjHj3C7PnrzIUDYH/p11YdnMZ2P22HWr8efsYMAvsj+BYmt5Xjdtr4zIQQHRuxIm5
	nhNotd82/33MmcnYF/84oJ+jlxRWy7sgwpo493bK5wV0l3/SpbIQehZ6mp+k93DShoRq7JaMUoPGa
	k+djWaqdUlUYDFoWMA+Krqv54AeHuc7Otve5IDVkQ68XxC9HGW1LFNyvweqVZfSbaoAsi1yb96DRR
	5EVC4AXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHSp-000000006Fc-0ux6;
	Tue, 18 Nov 2025 08:53:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHSe-0000000069T-2lDP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 08:53:23 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8ln7P2756393
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMp7HNJ/zmdg927vlU51I3Qx46lV/WtDLm/uWh7mI/8=; b=f/+a2tYaAlPmGDBQ
	3dzwibIQY+tUEYHZoY+WC4YuaO+r2P+oNELQgHGt1v0Q7A5GOykbNg68VAsBGJIK
	3CtVihFmJiL9s3XTzHMwvn78cDeUlyNE7SvMuoD+PwNtpR/ZJ/WWT/nYPAosWuZA
	betmw56hEufcJYABmTntbL0RWFXxdryouVIfucvEUMDwmqAFwxuYBmZCFU0bAdde
	O/46oxGTPjXd3WjkZ9mVlFRqdiIxmqi1m+8bTKZcodqmJZkcZ2eB0ru9+fc5FiuR
	GMO+6w/Rqbp45CzCnEAh0l1iPWxOwZbgO4qVrlm5RHhDllxyy0HUN7ImE26a7eUF
	GT4c7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj00mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:53:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f587dc2eso95608315ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455994; x=1764060794; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMp7HNJ/zmdg927vlU51I3Qx46lV/WtDLm/uWh7mI/8=;
        b=D4DDM7noTJo2SWv3VqPFQLEeg8uc4k0ZePmagwvY95TOvUG2Fr3ver61G4faIvRm9i
         1aia7y9pF0xYUjZgM8h9X/mZtqK5QVX+Jk38r1Plkzk0wn/EadCQErYhhtbOrXRE0My1
         rDWEtp06Qsgli83WO+9WgKP2QSxz5KPwm/OsM7ZIX8Ij6WrPEizjDW4bEKpmUeP59NSt
         nL88canv2wfLaiOTlnHVVzJBW4XZ5tnCR+6ddnP37nEme/lcNA3VpSE5wlSMA2dnGKGp
         rrSnqXXvLdQpsKPoCmTg+IIxeKaouI39xmn3BbWciFdEaGd1u15ds9TAOmpW+izjD5Mp
         ptpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455994; x=1764060794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TMp7HNJ/zmdg927vlU51I3Qx46lV/WtDLm/uWh7mI/8=;
        b=Gu+ofKrveSAbJFn0EMV7qHLcp0MCG0P6c7/zzP8riakFwzSjpZC6Jy+11GxQID6gIt
         Ymm6e7dpwGHLfQ6uHYvFlWqrKXM3ByPCUWRsIdSQeFTB+0iAozC2RGWxdPDTvwexZAnb
         EwNvxtG9pyEbA4Eb8QYBo+XHlZcklWG4mfvCm/EarxXaM7SjWekP48NdCGpgdQ1RihRk
         PIhJZ21YKpW093Ze2c5CDehbpUKogGC5vRsp6Mv55Q8QQNUi+Pq0SFljtPT8S1qkMDsX
         i/3ntxOQd+j2WXAPhoZMegZFrzg4EbWm/M2LkXP6ertW4OCjANJM4SyfAs949IgvMa/c
         LDGw==
X-Forwarded-Encrypted: i=1; AJvYcCWzRVsxdibhmVVARi7v11gYH5KCeQ70zMlgwgFA/A94qz1lh+5rcikUI1/F70putkvV/GMsye+nG/d7sqb18pPK@lists.infradead.org
X-Gm-Message-State: AOJu0YwZG6FgX4c1x0YbEo0kTyE7QBuv6Nlq41gbO1uJQ4Ypfl7SsOEc
	/pQaz9KpYrNHLTKwYhcTDmDoH4lpO7XLiU1NqX6YpI6rrUSGLL66qbkxUoBLlKWCGY488hsXJWq
	aoSS/h+6MxFadKM2eb7rCcYv72IW2suHZap7oikQzd5+GFioY7iDnh7tepwbIRv8+Ic1cQ2MUIs
	Z5bg==
X-Gm-Gg: ASbGncvhSxuO8/UTK/WvIWpIOvG29gt4PEO5IvedfFIHN3Bxci1gJtPhm+uvd8k+lyu
	JGJxfKjpW6lKHxskCZTvMSUpe5TBE0woVlX7YQU/e+U3c0XRnuup01wQ7C72wFRoFyFSD8Xsk2G
	yv4FizaQ/FAZR1E0txBZB3wumur7Qruext1eP7bzhe/16RKiA+HM/MC3Inu1YV/tRiXDPHEl9M9
	D2RcAqda9x00E0BemCRabDY9iZV24VEQo7t8j+t9zWZqgtRe8xkhQjyMBtXwLsOK0qAOn8zBAYS
	5YSU+bsViMc3SypGcIYleamVE8OtSbeM3xJFls9dgVk1lt4xUWmIdgh0Ixf82tHozWy3CgJS/5e
	vFEzURSyK7uwioK62q1ZiSRk=
X-Received: by 2002:a17:902:f641:b0:295:9383:543 with SMTP id d9443c01a7336-2986a6f263fmr177242525ad.27.1763455994437;
        Tue, 18 Nov 2025 00:53:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUkzxk34yLBaUiwOncHo2aD71jLBaEEhzYr/v3YEhhdmJO40Uy+Hz/k4WFRUhKYfUH+Zvrzg==
X-Received: by 2002:a17:902:f641:b0:295:9383:543 with SMTP id d9443c01a7336-2986a6f263fmr177242265ad.27.1763455993887;
        Tue, 18 Nov 2025 00:53:13 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:53:13 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:42 +0530
Subject: [PATCH v4 15/22] drm/msm/adreno: Support AQE engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=3403;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2qp5AoAo/qQVsE3tG8Ep9+XuoxJnnHFPRYeeaqd6Nqw=;
 b=pITi3Rkt3UiF+9XwRl45qofQch1DIPinzsKbn6E7GtKqqlpYXha4M9LbQiAib7Jj/UqLM0eJ3
 1HVGec8z5ImAEZ3+mtrH8YeYQrN6lFRF39+iy8ewiQ1oUFPO2bhFvCr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: sfkxz8cLOU1uaLw4N8zmN_3FzMysei-l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX6DaU6He88tPV
 cmObR/rdJIiwQozlP2OpSlD2CrfFHwKVFWiKjnys8MHO3LynG5jJNVYuRcioEwSqF0QQw0FAm7W
 dvkgd6ysISddUUTuBN9yi8CtP7VYnnXOvexuDgC6GnA0oJFyWYboqooaanqSTp2LN/P+2NElqmy
 Iu5E3hhOdFbk5OPUe4HtEtR+ApRmxYS9YrXYEZUJy5LARa/YS8LE+K1m3w6uCEdUbMxa6j8djLe
 iDov/2a8AJDyLt5RGHoxzrej2uiU1W+NV8/gjS8M8aywFCdtRTQT5+7zO1T0DGkHp70HkDeIipd
 ZbOmob4ItqJwikPP1JaeNmz9/jAGdW7nVcjKpuUrZAel3nyu6MPC/pl4gPHrpYGq/UGXt9Pl2pc
 o7jyoiyarV8FmxRXvpDNuC1GHb+cqA==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691c33fb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qCSIj6eo76QuOecuVwMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: sfkxz8cLOU1uaLw4N8zmN_3FzMysei-l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_005316_884143_5D652F8B 
X-CRM114-Status: GOOD (  19.11  )
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

AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
in Raytracing related workloads. Add support for loading the AQE firmware
and initialize the necessary registers.

Since AQE engine has dependency on preemption context records, expose
Raytracing support to userspace only when preemption is enabled.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
 4 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 810b64b909f5..9a643bcccdcf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1118,6 +1118,23 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 		}
 	}
 
+	if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
+		a6xx_gpu->aqe_bo = adreno_fw_create_bo(gpu,
+			adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iova);
+
+		if (IS_ERR(a6xx_gpu->aqe_bo)) {
+			int ret = PTR_ERR(a6xx_gpu->aqe_bo);
+
+			a6xx_gpu->aqe_bo = NULL;
+			DRM_DEV_ERROR(&gpu->pdev->dev,
+				"Could not allocate AQE ucode: %d\n", ret);
+
+			return ret;
+		}
+
+		msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");
+	}
+
 	/*
 	 * Expanded APRIV and targets that support WHERE_AM_I both need a
 	 * privileged buffer to store the RPTR shadow
@@ -2400,6 +2417,11 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 		drm_gem_object_put(a6xx_gpu->sqe_bo);
 	}
 
+	if (a6xx_gpu->aqe_bo) {
+		msm_gem_unpin_iova(a6xx_gpu->aqe_bo, gpu->vm);
+		drm_gem_object_put(a6xx_gpu->aqe_bo);
+	}
+
 	if (a6xx_gpu->shadow_bo) {
 		msm_gem_unpin_iova(a6xx_gpu->shadow_bo, gpu->vm);
 		drm_gem_object_put(a6xx_gpu->shadow_bo);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e6218b0b9732..3a054fcdeb4a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -59,6 +59,8 @@ struct a6xx_gpu {
 
 	struct drm_gem_object *sqe_bo;
 	uint64_t sqe_iova;
+	struct drm_gem_object *aqe_bo;
+	uint64_t aqe_iova;
 
 	struct msm_ringbuffer *cur_ring;
 	struct msm_ringbuffer *next_ring;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index c9cd7546024a..e011e80ceb50 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -627,6 +627,9 @@ static int hw_init(struct msm_gpu *gpu)
 		goto out;
 
 	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
+	if (a6xx_gpu->aqe_iova)
+		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
+
 	/* Set the ringbuffer address */
 	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
 	gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index c496b63ffd41..0aca222c46bc 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -27,6 +27,7 @@ enum {
 	ADRENO_FW_PFP = 1,
 	ADRENO_FW_GMU = 1, /* a6xx */
 	ADRENO_FW_GPMU = 2,
+	ADRENO_FW_AQE = 3,
 	ADRENO_FW_MAX,
 };
 

-- 
2.51.0


