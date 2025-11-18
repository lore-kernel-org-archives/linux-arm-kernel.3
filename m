Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26ADACEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLaq0rEgvGtAfaQgBbzK+2z25S35G2xyAjIzDCq9mo8=; b=2teytQJoAra6x9ybivvYDB9lQg
	PQbixoQOrH2dvbdqgjBN4rBd0rJ7ekNJswpwSNk3/fGQSwezt2HnC9XNJmUuaFvwe2H8mazWOdqM+
	ehvVwHSgDgmnxtcBdOiERHrjohC/UG4Xws2s2TAJQTw7Vt33q/5U2yMw1VC4CesHaejBBZvIaqpM0
	EgAbZ2LNmZWKAHd7hEwGuQ5GEGhcriazpP355hhUFpEZK5go9tVS3MYGCIe8EwYOKBKU5dGCH5lyd
	lxZXDSFKOQocA68vf0hZcoIKQkBlNLFGvDSz9+ASOh0ZVTtvqA62jPaiIQiyVv0pWdv5/5HE/p0va
	weTXrMPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHRk-000000005Wv-1tVb;
	Tue, 18 Nov 2025 08:52:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHRd-000000005S1-0sIC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 08:52:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI2eJ0Z027779
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLaq0rEgvGtAfaQgBbzK+2z25S35G2xyAjIzDCq9mo8=; b=i4kJqj7HGJxBNHRd
	pTEmc03++M247mGtaHLvboxPV3bu9Cx4W7q9AzCFwldc6x6PFEwFQzlLT9olFPP6
	2F5xkVympvifrfPP/vdT0hCLa5elzwumkQ5poAPy/8MnxSpxRIziIjxzlIms8yKN
	R/aiXuF+BX5ORsP3dQ0xnf0QJccd8vVxxA7NYJVWNWM8nW/zEk2aSmMfEKqTYSNv
	5Tuh7izfesavFYjF8D7zHjqiIw8nvVZuvRHuDoNjaspnkdyhWR7JkOliPrFy3Yx/
	I6VcanGEQ4/4exxEZ9IAo8tBmPAamx+JagxHjp/S4KHGnDrl1G4MLd7XD8i9Hpba
	gYAZSg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t2eg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:52:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29809acd049so90922575ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455932; x=1764060732; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLaq0rEgvGtAfaQgBbzK+2z25S35G2xyAjIzDCq9mo8=;
        b=KhIzZaDcNZt1AWknROWPY5xUURv1S7PigBeCRWWs449cjZKXn6mGT3MdU0Yhzpt5gO
         KYxjk7wM97eHK1jUD2vYTzN6t3T3w8nfQMnzt1lxwfaM5jc7ixM7n3cIXDevsOs0/QdV
         dRaHOvSYD7edqq464GPIT4uVhLenrjqNVEr6xKQYxjd9qydSglQ/dCUNrL0/Qa4rOpsQ
         86BJ5BFNJNy4lR2rt2RhcwqrFDyxQxRU+FCZLXZXovxCkeeX7dZlgbjOFYYGGZ9imp4j
         iGRUh6Ku+0o7Q+oHh8tJoXm+0/uyJesM9vt2rdDqKCUX1JLcSuZj4R1B13HR3xEAF/Q9
         qXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455932; x=1764060732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eLaq0rEgvGtAfaQgBbzK+2z25S35G2xyAjIzDCq9mo8=;
        b=iJ5MtdHlEihKAzlT/N7ZpTqadPd9LWZ3tq9p3bxRatgkPT1pkUwV05Np+8HC2X/FGC
         9ChLcgs1sJQUdDm7s+5y3j9kxVk6JwlkurlauNSl9qw+g3te9VOsZ0mvnu3rr+kjCLc2
         CKv/L1z546K3LBg0Z/AzXN3Naq0kGF1xjgYcSTTpRSVk/cmIDDjhF234pRRFT+NtqgGK
         /+j3oTbDDLrRPpSVQZFbIIho2ElzK5Vc0GKypwh5FLNqBHPxkPNzaqw/MvV+/YbeXrvn
         QkC2roULQ/oiDkA1hLzc+TgvMMgbmkrgCAeMcr/3RLjc4NwHnQMJJY/j6yjk50VrZHsh
         f3jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIAw7T7T7eehXVnN5aVHQdvpOgBrCqsuKWvi4N9zHcEMZigvmGPPr4NW9MzVx5U+ocwcqUBzR0sCCMsVY+azzD@lists.infradead.org
X-Gm-Message-State: AOJu0YzCBMu50LkrDF3+MlLJ0w2FzHvgAsT6z8nJNCvqoq7nyZ4u/znj
	E0TQ8ukIUP0n68o7zh+LkPjcUoeGBiELv2P7/Js/1jHA0SGNVURQXoCzEjFXB58xGdlYBvFoCeJ
	NjnxMr9CzZA0SWw3GpdUyDomjusP3zZ682N9n0PHPHU+0IzCfQDqKfJzeRVzFcjo7M38M/xWJYg
	0bVw==
X-Gm-Gg: ASbGnctNo1Lt0BbVg/v3pCjsSCvme96pwrj60qmy9jV9g6v4ZJdp1xf1+F06d2kPthp
	BqrpZR5JSVAD/plfD/NUBYIx2zcA3AxRxdJCpDrMAdTNSQ+Rd4So/u1QTXPkIYrbdumyEYXVF45
	D6ec4bn60RMq5zjd+TN6f19lmiesufLPhKSXEm5zW5PZUhjpgwLYbjHRW986vuRrTHi3y0QIVrq
	DYED7OpY/ven73Xg05qmduIUm3bC/SdQt7mtEJG86hQzmGQUSLbvr8mkb5WHZbIaR8Nj1OhSbUD
	0UuiF5hgFa66q9uTJnuP75MFcDoAq8mCJEdVdx1xabe9jdwSFhkwGSFOgDZR3+2HKwm5u3Y9b/K
	VfItVGlYXs5/S9eMxYbvjN8Q=
X-Received: by 2002:a17:903:40c9:b0:295:98a1:7ddb with SMTP id d9443c01a7336-2986a76b80emr187942535ad.61.1763455932071;
        Tue, 18 Nov 2025 00:52:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuRmrBbc/dLnfpzW67vqiSzLvO2GCc3zw2G2+R4D6v4gByj5OD0N9KHMTWShzhMrZVfqzGpA==
X-Received: by 2002:a17:903:40c9:b0:295:98a1:7ddb with SMTP id d9443c01a7336-2986a76b80emr187942015ad.61.1763455931526;
        Tue, 18 Nov 2025 00:52:11 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:52:11 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:34 +0530
Subject: [PATCH v4 07/22] drm/msm/adreno: Move gbif_halt() to
 adreno_gpu_func
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-7-86eeb8e93fb6@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=3603;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vVeIWVb6/O65xXMPCwHkJepVe1RNfzVF3KjNUn+Tu2I=;
 b=mn64hAX+PZCwaGr9mtLhPoTUQxvBfGlWdpJjGyPWSsKD2Excv+y0rvk1aaeOYO1krY2o7l16G
 MVdWNEfEquICZqxHjf1KDyr3BVVz/H3kL63znYGY+Af/M1j6u9EoU4w
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX6SX4PybFMX0D
 J8n8ckaZO6JscfVo1n1fGzq0H09DKWyIRl1pQ7pa+nXp3PwSUJZcflr0QYUSVC4me8GXtAaoW6r
 jPU0p+7nXQebDvTYlRfyACpr2nsB7lNUSrBw2veaXC1r4EMeG+DLbnGQ9KK+F79mWFKcZlDWxCr
 D+t7wMe+k0BXSL5Nmw61kRCdWfroW46HmyWJlKv0iVjrb6MFpbhKmbuZQ75SjqA8ZrgyY2ogcZD
 palEqf/3rvnJgAjcRrYjv69Lhgwn/neP1tL6OSXPitCL1P823FXQAKXmFqi1d8TKZvTd50CQit0
 47ssgWe2Sq3uHAsRinaJc9zVFXVN9yZWlvtHBevHjwgU442o0ojZ53Ey3SAl9XvyE8UQrqaJAeB
 Pm8sCUpv3G4D+P9wMn5v0ayMD/mXzg==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c33bc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W_sW28Yvd0frASqVc48A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: _TLdDPi7U_jOkSmWWxje7TM1QOYvCbfM
X-Proofpoint-GUID: _TLdDPi7U_jOkSmWWxje7TM1QOYvCbfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_005213_263216_F05436B7 
X-CRM114-Status: GOOD (  18.30  )
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
index 52653ad376fc..b0be246b44ab 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1079,7 +1079,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Halt the gmu cm3 core */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	/* Reset GPU core blocks */
 	a6xx_gpu_sw_reset(gpu, true);
@@ -1251,7 +1251,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 	if (ret)
 		goto force_off;
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, a6xx_gpu->hung);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, a6xx_gpu->hung);
 
 	/* tell the GMU we want to slumber */
 	ret = a6xx_gmu_notify_slumber(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ba95b29855a3..575f2f9d3b1d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1595,7 +1595,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	if (adreno_has_gmu_wrapper(adreno_gpu) || adreno_has_rgmu(adreno_gpu)) {
 		/* Drain the outstanding traffic on memory buses */
-		a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+		adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 		/* Reset the GPU to a clean state */
 		a6xx_gpu_sw_reset(gpu, true);
@@ -2316,7 +2316,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	mutex_lock(&a6xx_gpu->gmu.lock);
 
 	/* Drain the outstanding traffic on memory buses */
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	if (adreno_is_a619_holi(adreno_gpu))
 		a6xx_sptprac_disable(gmu);
@@ -2685,6 +2685,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2715,6 +2716,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2747,4 +2749,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 335acd5feb82..08bb601b3bd3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -77,6 +77,7 @@ struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
+	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
 };
 
 struct adreno_reglist {

-- 
2.51.0


