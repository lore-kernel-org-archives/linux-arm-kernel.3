Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47042CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oes+EnLQiIXAxPUxYP+Mc2ycI3/yrDxiwXneiCBW2Ac=; b=yp8BIJ1DHrDjM3Wz+2J1DufVRv
	9Wjwh33Is0I8OoVEnU2W6dgEtykhp0bTppkrAfn0vLU+Ox9u0EtEJiL+coGoWWnyQHIejz+QZkve1
	8Um0y9hDO9xivdEBBHzPkxY47cRFgZID38sfbD/xRqCqQPHqUp9PV1aGvWmYRNWARZUEEl9REbWT1
	HZfEv51R4fLO8hjQkxw6yXnVRmNzSdUg+OjOr6O5UtAI4+tIsZw9LQCi8nn+cXZRl/z/AibG+XTuf
	bofdjJfrIPPFRtwZ3rrTNHiY5LpMsnaWsU5VIfWbKOQGxY00Y83H7ZiS4TJxRVcOTVgHqJnEjqwFC
	5KldLbbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUv1-00000005own-3aTm;
	Mon, 10 Nov 2025 16:39:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUuw-00000005otz-1D7Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:38:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AACMvlO3306807
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oes+EnLQiIXAxPUxYP+Mc2ycI3/yrDxiwXneiCBW2Ac=; b=Ns6ldHOfieujVYNh
	ghYYNnXV4LNbii660TohN4WhN+8dtFwvOhjTDagzEa0FHAHZz/xPpIgzs1zrjKiv
	upPq8U5Hx/igLzr/076pubKzv66l9wJ+jsewA9DhWsmPrm4TMR3cHzqkNxi6lSVR
	fgPWpOESTsJX8QNInYm3pTqDwuANk787cbS24AU97KwEXGw7jwn0ix70KgSUJl2W
	YucqnZw638bHZsBmDvUbsdeOXczN3M/VCRT3Bjeud0A7SKVWUdD51EeSSikdBfND
	ycnFm0L0XIXkO9n9rWLRuiTTkWY3zCEb/FMvCFWIb0cL5GuNPmovWLwGWmRg6gdH
	/XqVPA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abg0q8rue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:38:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34176460924so3139758a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 08:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792737; x=1763397537; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oes+EnLQiIXAxPUxYP+Mc2ycI3/yrDxiwXneiCBW2Ac=;
        b=CBEDhHGPfLkqBQ/l+wcVPXKLl9cjEBLZ+Z0zKASRoOIoM7EWZS54I0AR5oTcv7UeMR
         wTQZRQ8fBuBb9DZyQa2mdXwJo7Sd9hTVD1l+1t8OxqCqFLpExKVTdCC5H3IkORsC2hrH
         Y/+c/AU5r9Q3cbLi704zlQ4Ida4AB4DuFiOa5Uf414MxOKRfMGAnkKC9DAtT85b9s9rV
         MCosgPlX11vdwNq+jE1CukB5JogtjwM9EAj4CHIJEL1p/r7LN6jODNucwhFF8WhLqu2C
         ieKfOdHHbCO5LQZGb4yzAW90tfjTygQ0BGAZLKBRpU2m4pJ3pcUP0isay4z5XYPInz37
         bedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792737; x=1763397537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oes+EnLQiIXAxPUxYP+Mc2ycI3/yrDxiwXneiCBW2Ac=;
        b=Us2dzlAXtUNpr7JAASE5sLN/DvgWNj+GzsyQk5UKpW85ATr6HY57/+iZitod3RxwB9
         KJo0mOPmhBabV9BaOK22qst7dpkKr8JbjoMmfOfa3x8LYMXF34K7VIR9Iv5fjqIOY1bO
         behYbD+bnKJ7GEsjg3SyAmreTX6xd2AcNpD7Bu9PvrqbLJ7auGn6Kh2+CrVh6XaLU1KG
         f2ZSDYtYEKFJjxEOZcuvSJc/QhhFYn5kk4TSEaT8KuR8zRixwnbV6aCmDVXB/ZTELtFa
         +ChLOu5xXbvYg/Q5qMj7Ug8gzUBfZeVooFAYGA9P9dHxrCf4wNHW60T4hG0e4/zZDRe4
         NZdA==
X-Forwarded-Encrypted: i=1; AJvYcCVH3TKjUBA0/ALUT2uT3puTwurI6EGJoyXwGiOhVPb9Z1Ta5tgsUNhKc8KqmvemTc73tc2Ud0FShZdKv6+oNr0C@lists.infradead.org
X-Gm-Message-State: AOJu0YxcAdYOLcOURcyNwG/6SXjCn4kLhnWc7Jaaln1/abNTHiJBiOT8
	U4NR7a1wmuo0kSKRLwVw5e3pHjZmk5JInU18nzZhV78bao09z5Ixa1Q5PZA34Lp9xebNII0egDY
	sZe5cytflO/lP0vT0iHJbabcElsNVYcxjiNBMAoITFtyLwPWJSOp7YuSSketApplQY/Nnwd2Lxo
	DNCw==
X-Gm-Gg: ASbGnctCgkwVz1qBjoaZRHgfmQM7i2D/IPGbwPLXih1FshIidmQezFOohv9+maaBKcK
	ZPTXgrNdDN/qikqKq8Tc0kd39/bcxaLtp+WrPRixkQg7HP7ShVmiNWWY4ho04Xcl5DFPRDGK24p
	xwmCCoNjjcO1OOnTP0SFxsTfgnMdjYknWaLyl8zfaxXySxEyghgOJAfMjiRc59MnSLpaDW58Nyy
	c2wrEpeLR9zQLtklku9LSsybafrGqN486OFs6r921rqTu+7W0928VLw86iW1j7Oor6pIm28xT4B
	RYQ/d4g3tzF6oDIQlDvmAj8VDio31gvEyX7v8rxj8ViniIJ9B/k85jArDcfWHQ5Ab8n8CVadAyh
	5kdheiKqN4+nEz14pO65zGnk=
X-Received: by 2002:a17:90a:c10f:b0:340:b501:7b7d with SMTP id 98e67ed59e1d1-3436cb22897mr10962376a91.14.1762792737046;
        Mon, 10 Nov 2025 08:38:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrUp9qwIPLGlfFgKZfxVyplHxc1TH6QJBrbZSSrUu4CbpB3XwLUpZQxF12o559s4wVWQ60Xg==
X-Received: by 2002:a17:90a:c10f:b0:340:b501:7b7d with SMTP id 98e67ed59e1d1-3436cb22897mr10962333a91.14.1762792736515;
        Mon, 10 Nov 2025 08:38:56 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:38:56 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:12 +0530
Subject: [PATCH v2 06/21] drm/msm/adreno: Move gbif_halt() to
 adreno_gpu_func
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-6-bef18acd5e94@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=3692;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=8uOk6MoHQ4XtxnDe/lI2Mr7cqNt7gTyTYYefSPfwTs8=;
 b=waJ7CLv76Kc9w1AzujDl/sZEg+E5ppNZ+FHPNnfO1xxCO2UX9m5a26YORP7ypnqLm1QwDLdf4
 5QXzTH756vTAoC8HJsN/CliDpX95vxnRX4qB/i1vXAs92UcBAP7iQwr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=D6JK6/Rj c=1 sm=1 tr=0 ts=69121521 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W_sW28Yvd0frASqVc48A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX+aVlR5KESMhH
 7uqUpp8l1iDSa4bJajtVcOgBYktVyENO3Q0N2xc61lkdJCuTtOp5GJNrfI6XC74oAHwl2pTs6jt
 WzXkRElifSV2r+id0HYTWjpDI5E2SBum3L2mWnTdumk3G3lvPo5Gan3QUaOfu/s01oXOTGYh1GQ
 Go1bmVqYZZAA8B/w1vpe015g4VGC/5SuXSFmr1FXOS5OdhKf6isr8C7g9CHxNst49GB8baQ9tQ2
 rl0Rp9PO6fkmOm+irKBUTqP4uMl8Q0fJt14d1BoBzz7+EWKQsU1bHEfwc+XC3hUQmFYpCShoI5l
 wHj0ctS0N9l7fa+yjx4oyKp7otviricw72qm9VkYL+x+JlUx46xNJj6WIVA2xuVbzWajgrvn32F
 i6FZK6Y9n8lxNIOlqhnCyKobv0khUQ==
X-Proofpoint-GUID: 2wKoqBOL0elp4nClsmSRqmx-_-5a0xWx
X-Proofpoint-ORIG-GUID: 2wKoqBOL0elp4nClsmSRqmx-_-5a0xWx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_083858_338535_D384DBBB 
X-CRM114-Status: GOOD (  18.56  )
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

Move the gbif halt fn to adreno_gpu_func so that we can call different
implementation from common code. This will come handy when we implement
A8x layer.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 605bb55de8d5..306fc08492e4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1053,7 +1053,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Halt the gmu cm3 core */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	/* Reset GPU core blocks */
 	a6xx_gpu_sw_reset(gpu, true);
@@ -1225,7 +1225,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 	if (ret)
 		goto force_off;
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, a6xx_gpu->hung);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, a6xx_gpu->hung);
 
 	/* tell the GMU we want to slumber */
 	ret = a6xx_gmu_notify_slumber(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6856b6faf6c7..7a87f6407abf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1584,7 +1584,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	if (adreno_has_gmu_wrapper(adreno_gpu)) {
 		/* Drain the outstanding traffic on memory buses */
-		a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+		adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 		/* Reset the GPU to a clean state */
 		a6xx_gpu_sw_reset(gpu, true);
@@ -2295,7 +2295,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	mutex_lock(&a6xx_gpu->gmu.lock);
 
 	/* Drain the outstanding traffic on memory buses */
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	if (adreno_is_a619_holi(adreno_gpu))
 		a6xx_sptprac_disable(gmu);
@@ -2664,6 +2664,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2695,6 +2696,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
 	.submit_flush = a6xx_flush,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2728,4 +2730,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index eeb31fbc69ae..acdc51dbec79 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -78,6 +78,7 @@ struct adreno_gpu_funcs {
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 	void (*submit_flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
 };
 
 struct adreno_reglist {

-- 
2.51.0


