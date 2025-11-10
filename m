Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FF4CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjiTt5ghvaBZ1ee5wBxftA1oQFTxDbd5jXrSSKPsmU8=; b=ldGaaih7RtzLlHbGGjeqsRDzpJ
	ar6lZ72HwE7mtlTGko6iZ3R6RcrUz6xxTMqOEMHAWKAYE8Ufz61+Go4gSvZqDkXHdbpwJjokmdh/k
	p1PvjsBgmXefF1lIP/yFtC7OkIA44TcMJATs201WSEHaHnM7w9OXM4W6TKUwRnVZQ2Auhgoalqe5P
	hb37wMbT7trZdu4QMm3kWhimrxG28mEvuhUBuQQ5czLiJt5bmBYlwFTHqsfd64dvhWye3PV7mdXQ2
	JXvD4uxh8GT1lXxc7Ogjg9CU2WZPROu6Ms5lR7kM9Stub6utKEcy1lN9ugPgFGMOL71SQ23odgFXr
	FFp4MTkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUw3-00000005pZf-0OKR;
	Mon, 10 Nov 2025 16:40:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUw0-00000005pXU-2AS9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:40:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGYOnS4070802
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MjiTt5ghvaBZ1ee5wBxftA1oQFTxDbd5jXrSSKPsmU8=; b=IdqjNAvFs95sCmbs
	MnnHhgwGJ8ALXcgJRJ7/Q+JVDTED6H6J9Ru/z/l40B3DoT/BduEjeDGX5YoFJj3l
	aZVc/E78gWHQiIy6y+P4kTYB6yF+Xfj1G39nzhtA8ydMKSsOwSR5/2FNFn+N2ME+
	WFKMzg434+TGrN7F5L4YPEPxp3A9gksw+S/FQFzyuECpxtisL86Zkoy/HLm1CHgt
	XWGwiRpx/G2KxiJ+ea0uofH/0ngW4Z9OpibZkHUtKD5Zld/VR7dFDapLbHpcYf2e
	80pdjbvn6Qd9/K8lgM70WdavcE1FNPriBppJgLXnX8ImY8NmP1XvHZ6D/WMEqSyi
	YZez7w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abkpj80s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:40:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso3750257a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 08:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792802; x=1763397602; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjiTt5ghvaBZ1ee5wBxftA1oQFTxDbd5jXrSSKPsmU8=;
        b=IoISLe8Si0A+CMx/5tYFa0+Jl85sbQKjvc+S10xVKhDeCGi6BMjy5hZZyjdb1NTxAr
         QlWKuIRJaJtXbuyQktI6H3mxqsC/Ll4m3E9jsdJrHHNnbGBJr28H9V11oV09MePMXZmx
         iN4/Imm4fZEL1+pIZTWLcWCylR0ng3TV8s+4KfWPUey/NvViseMXAuwUFTBEHdI25HYA
         yW3XHe8RSkE30FIx8NCth/M+XrxleZT776d3SKV8pEC/iWvz/asWYahc+VtFzklKzBPP
         yJ8SjhCkRCTXyGuXpVBoClj50MSLAf0yGYZQtSvJZ87pib0/vM4/9pWMsQEMj5YYny0g
         gGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792802; x=1763397602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MjiTt5ghvaBZ1ee5wBxftA1oQFTxDbd5jXrSSKPsmU8=;
        b=NI3ux34SkrEX6i/AtQUbLWjgEQZcUZuMKPMrCnyWgyg2qR8vd8zj//F/krzP2PoXdj
         fvZ8hOEltIETxOMWHOtsC7cnGauswOJSBcSWn4GIhIIvlTx/+C+kpOCEfff6r/aZUm6l
         vc4jf3BdXOMFfStmC/SIs6o2E8gXkaiVQbsqhixPOFu5EWXEqERdYjCAb9Mdahnh5S30
         Xs/4mc2pnK9+fApZidab/fQDyNhf2jbOtzGT5wZ3zHUsHC6ta0dMZ4M2OsHe7juzKYg4
         XdyAb2CqHEpYzXcKgzaMShjGyOio/ISermqr0DwlSYmyWle+GdIj1yGeG6xwFibPmwt/
         1U7w==
X-Forwarded-Encrypted: i=1; AJvYcCXH0MXdHqlKJw9RHVf+MwlKqhT6b9f0hEbasVwJmUlB4H4QmSCRL6clBLGHtUqP9M8ibGDSPga6AdbUSLjIR82I@lists.infradead.org
X-Gm-Message-State: AOJu0YwZowwoXfbOZXAwbTKJTf3/0GbwF5AtntpZYsc1rApwixKsEs2X
	moLZ4gajVPnTYFtHdIlnHTkfCQc9kWaVj7ndmJnz1RdrXDxounZbJbAuiJf/UoXiOGnEXW52uUB
	RZWAyAMXkYaM1iVZpomJ8+3cOD5uQI6RBnkXL7TvhjWpjJk5hphQrQEhAtH7ZRgeneM133YHYJZ
	tIsA==
X-Gm-Gg: ASbGnctctGE+/PFOpIcMCZbkit1qJ+HNENYfAYZnEX+9g/kuGufeTBww3NzggyuTeaP
	mGECGfgdShYS4qJ9huK7CXKRDE7LN8TP9rSOfVIrPrS70Hc2gDeUTSMqyHE4as9ZAJsq3YaIYtg
	DQPm6MxrX7f4frx3jIfnmtdyW8KXpX7+sc9T80BsgS+/4pR7r7jEqblSCMZwnUhmfHfHoEiAK0v
	500592q+1ELNhUvoL/f8X3cTkGtXrW0hpRor/TZ+vImpiuAzvFsdN0qRRpTtLaZT5DrDIb1XXmh
	OiKMyXbzpkU2KcfP+TveMoieqcCYYBJiLRq6TWsjg4JoXCwEtzCpuSZ5DI5u3LDZLexqMp0ay6Z
	dDZeD2lNV2GuZX/hz7Zikr3E=
X-Received: by 2002:a17:90a:ad97:b0:32e:9da9:3e60 with SMTP id 98e67ed59e1d1-3436cd0f015mr8782678a91.36.1762792802456;
        Mon, 10 Nov 2025 08:40:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8dsQiFeXCA3fQRx1qGyG/iQYXdTGCJDeJX9jjxp7LxaCPRH2dmxyXa0Klr5WF7V5Abo/lOw==
X-Received: by 2002:a17:90a:ad97:b0:32e:9da9:3e60 with SMTP id 98e67ed59e1d1-3436cd0f015mr8782625a91.36.1762792801836;
        Mon, 10 Nov 2025 08:40:01 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:40:01 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:20 +0530
Subject: [PATCH v2 14/21] drm/msm/adreno: Support AQE engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-14-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=3675;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qO7+Zu0jaqw1wGzwD2M4glYIIsdjEUELmwQBxl1LlAQ=;
 b=hZZOFcaPhVuWtqncNPi1IHicthjYztjO/P4SCnU7EW1A8P0x5HCdnawmFDGbHm+nWpUXFDXsl
 jCAWRGM4iwACOOTExMrXI98NF5IldyXXWJfe9aGT5YfMU1e+uh9mzI9
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: FzfWmAKoVkmXEEcb698YhQo4KP0oZ44l
X-Authority-Analysis: v=2.4 cv=GZoaXAXL c=1 sm=1 tr=0 ts=69121563 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=o4z2bafxGXL3rZEXBYUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: FzfWmAKoVkmXEEcb698YhQo4KP0oZ44l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzOSBTYWx0ZWRfXzOCqLoaeHQIe
 KQijsba+8VOHZ3peoNgLNyTwJR4qLCFBFf35StyrC49oRnfhHPT8VGpgovpR/dZIQ62/BjaVqd0
 tTsnlkuGG0SUSQ8oc9SfFZEy+hKYAKmhQ4b/ZbkjiMD89UlU4dHX1nsRGgW5n+7UYcUxnhfVt3l
 BNXU1wzGjpdwCD8WG6h3i76iHGgkfZg04/uiExNqvsrBQLJVCnC0/rrr3C5T4O+k/nJV2QQhSUb
 dZsSoBh/ni2AL2/HWfyICBX3PYg7YCQYMlihgxZo3ouvasTDdA5LW2nimvfXgwjK2jdZW31Snfe
 +tgdA9ElnMj1GpNcsYljYFIZyPIuSWpqMspRIniZB3eI06AQ0kzHNmfLMep13Stryh+xDmcAkVd
 1MXEe8t1Sgl9XIkJ20pnws1c0xxD6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_084004_692174_43962B1C 
X-CRM114-Status: GOOD (  21.70  )
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 26 ++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 836100047be3..029f7bd25baf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1104,6 +1104,23 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
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
@@ -2132,8 +2149,13 @@ static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
 		 */
 		fuse_val = a6xx_llc_read(a6xx_gpu,
 					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
-		adreno_gpu->has_ray_tracing =
-			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
+		/*
+		 * AQE requires preemption records, so disable raytracing
+		 * if preemption is not supported
+		 */
+		if (gpu->nr_rings == 1)
+			adreno_gpu->has_ray_tracing =
+				!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
 	} else if (adreno_is_a740(adreno_gpu)) {
 		/* Raytracing is always enabled on a740 */
 		adreno_gpu->has_ray_tracing = true;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index b507ff4e1756..7921b4a68937 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -58,6 +58,8 @@ struct a6xx_gpu {
 
 	struct drm_gem_object *sqe_bo;
 	uint64_t sqe_iova;
+	struct drm_gem_object *aqe_bo;
+	uint64_t aqe_iova;
 
 	struct msm_ringbuffer *cur_ring;
 	struct msm_ringbuffer *next_ring;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 78dcb9bc3377..2ef69161f1d0 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -616,6 +616,9 @@ static int hw_init(struct msm_gpu *gpu)
 		goto out;
 
 	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
+	if (a6xx_gpu->aqe_iova)
+		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
+
 	/* Set the ringbuffer address */
 	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
 	gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 17863c3287f5..4c0d9024d497 100644
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


