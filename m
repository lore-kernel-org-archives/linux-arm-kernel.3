Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FE5C44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TkRZqzKaTEbf88oqgt4IklNVBeRmMVYMA2DtoASnZk=; b=2gYNCxIdxGO650zQPwQKmGjQg1
	kP9vFa2YoNNDvxRNILC6+G0slRwKqkpxg8/CTjdCr1Oo1rvYlYeZccW2fkVociGrWUnVkNBQDch1d
	nxf/S4D34k3rl1e0qi9UOn9fn7vc5F22vRHH6aoYEmW80ItEGBY86fF7T7PfilOes2IowI0fz13mD
	vSzSIrFpnomny8ZI7gEZEFwhT0V6d9Qm2zGWBM61fK+0VotEH4BhnuT9Nka+EppCQ7UmDhKCsjIwt
	bwJ3C5npTVe6y52W+27L2W7Khb1dB06HUksKenDJnrA+tBRNlNaoYjpV09FSd9Nc9iwFWhmIF0NcC
	wn2/5FJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgI08-000000096HZ-2x1Z;
	Sun, 05 Jul 2026 08:14:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgI06-000000096GO-2kou
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:14:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6653ZCha559406
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 08:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1TkRZqzKaTEbf88oqgt4IklNVBeRmMVYMA2DtoASnZk=; b=SLZNNmCligj73r9a
	HmTSVxVWqJcHqpk5129dmpy7qmKlR3hvUrApOZdaL/B6xsrRis07VNYTQb3NuaiO
	E1V7NU/NgcStSN4LHLkr6K43wagLw1Uz3I5JcnoS3rTHHSm/IudS+ngwDC2Pvr8d
	qJjX6kuo6A1UuSChmy9ncv0KL50r6SLdjvCyeQ7hbS66oaOsZ4khPDchsMJmGq1+
	xAQxIsqsxDgVnVZB3KLIKCW7m9WWwhrVZbK7qWZhcT/4R1PvMGXu+kKdOnD59gYx
	vF39FU9+LoYsF+cnyBpU+lEWhh2Ikb0vCoWJwtxqcfXiTGObZxASozwujX6u/dp9
	24bQ+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnjmwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:14:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cae455cf6dso23659945ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239292; x=1783844092; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TkRZqzKaTEbf88oqgt4IklNVBeRmMVYMA2DtoASnZk=;
        b=JJYA+tdG+tx5FWzWXwGLSxepaKRPjTh5cm3YTrhws4cVm1Xsw8HADexAnzstrCsiMg
         fX6reQ67mDuRgSfnumSnxehkyVy+OKXnRHwuA3vF8kso8fkQpeXSwOx6OdAHmXAu+TzI
         jfZ8x6cS2X6ziR3Rps6G/FO7JGIznfhimfwUShLuEY12aJBZdGQJtJPUmoaC5t/keAEA
         9ma8n/SQWLsMjPnBUifX4CzF7s6+XQkOxbVYtRhLv8wck5pA8YB323nHZewcwI5GfKFw
         nmsxnmGq81ub6ooxLowgxtXby8H61hVQhUCZYGPncQK8fBJ2MNVM5U7FnhjTfNRHLweV
         Xtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239292; x=1783844092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1TkRZqzKaTEbf88oqgt4IklNVBeRmMVYMA2DtoASnZk=;
        b=NP0OvpA/I9D0k2SG+jbrWeyRL+9mhA6n5Sf2kcjaoW+0LBbrC+jmvGgnPdrdBThmsm
         +THoSyv9nssK3Xe/YRV2vFYuNCo2ls017soFXzuifcwhTuq39XIW7T6p33UGyJPK0beR
         i0415uDL3kx7z4Jg+RMKZjqGgW63Alld9t4Vxuz8+bmdZXqrpAzKgVzi4I9m4es3GGYY
         MfX+p9E3dNPZXLpAQZkWIpZg0gMI80O0T8gQmpqSJENmVHTtdfDtLABDywDkmGJtnPJZ
         j0/WMU6KxfpJdiszW7f+RFO7ETAqTcy0g3xA9CwKXIbZAeDVJwddAnuHMsacAOaAiRRA
         8nsg==
X-Forwarded-Encrypted: i=1; AHgh+RqZZqRDDYeI385PjG9vXzJMzyX1YlzrMyc0z/5jV7hqE8MYz3CkQvhfmbN3tw0cohNcEpAhnQ3HjXsUzt+H08JJ@lists.infradead.org
X-Gm-Message-State: AOJu0YySqv08HtXRYYTzV1va84FA4SGQZc5PifKmCb+nNIr0NA/rWgC0
	4wMGIkhiF1bvR+NciknciKi4coizSbaNO/66wFuI7rNFEXq0bqYkI61bB2uIpxXYY2o8XF+KKXV
	wvWxIwr+dfu8T5T2kigcb4KIRC6Ppr9EImAOB2JRZMzz380mUWWnzopMsbwzz2eziEW+/kbHoWY
	I6zQ==
X-Gm-Gg: AfdE7cmzYFTMfqK7Jl3hmM+iBFWn4WZ9CLGxe0PF4GWCKried4zohb8I//7sWtR2OSy
	A5SBJMRsrvGjpZPAsoyR5SjIxnUfAJHBkgxZhhijG28Iv9SozwqjGmeviV7PJEYQrrncah5Nxfp
	Dl0T+k3jQDp0Qg6xNy3OlwRMDyZI4kzrrMxz3FFWle54eEOWgqrR2/8DkgjtG1BiwCiBLq0OW78
	SPRlaXFOvkGkQmnFwz2EjuUrDcbK0k7yRbuHHTv5T/fP6fSin3OBJMHIlJKgNxcTe9K9jGljjxv
	KE7LMNgE2hSCzpeaipFArsoX5PMWwLXILJl88Slye4IH5XAPnkVH8tAvOf7feT4RGZUSVVCfrml
	15Ll55KewLFvenpmMezekUR+h5IvlN5DXPSE=
X-Received: by 2002:a17:903:2b0c:b0:2cc:5fae:cc36 with SMTP id d9443c01a7336-2cc5faeceb4mr48253435ad.11.1783239292357;
        Sun, 05 Jul 2026 01:14:52 -0700 (PDT)
X-Received: by 2002:a17:903:2b0c:b0:2cc:5fae:cc36 with SMTP id d9443c01a7336-2cc5faeceb4mr48253135ad.11.1783239291889;
        Sun, 05 Jul 2026 01:14:51 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:14:51 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:17 +0530
Subject: [PATCH 2/8] drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX- variant
 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-2-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=3102;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ycJJry48vK1w/9pKWHhMt2Pa7b3Ht8W/8/Z4qRb1cBM=;
 b=RzMbhCYJ2ZVJ46j3xP2zUIMGGw8WVIy+lZYD70YsCCbS1sIJXmkNFXeiuEyreMuBB7MYQZS1g
 RXh6zlYFDeoD3GtnpNrTlKyIUkDM7BSY1PSqKYgqQVY0hbbpW7vVH5g
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MyBTYWx0ZWRfX7tegxFXHfWKQ
 oZ5OBeOlS1WPAKh5vD2cr9VAmhBaG4ZU8wVNTNakJM5bjUUoKYuqpRI70y8D7uU/tSDHG3/bJMJ
 REqlVoXrQRcncxNVpofGxfePceQaWKY=
X-Proofpoint-ORIG-GUID: oxXgN85wyP24NZ7mUPGDn1HyD_htJPEU
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4a127d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=W9u8H8Hp_niEWJubwdoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MyBTYWx0ZWRfX11G1+NeoD8tC
 hZYNWpV+TxWiJtUDDjcIJ585ojkqeFFtZAhfqCGrf5fAF1MOCcc43PMdwVTVrW9lXAK59xzU4ri
 ctnCqBOonGIw9NPMOGYyv9gEpfA2S280Vu+qEWOw3oKiTzzGjJvqdoSXplou0AMbjlok70P4ZWy
 YECgEY1oGChRzzypsWYYipxWOSzA248sVNJmc+OzL2+X9s/XwDw+uE5IVruh/721lxtTA9AbkJV
 p0LF5vHLgbfmLS17vmK07cllzCOF12ff2fUhM+k7YmL8if2OgOaHf9RdhJANqNnYM9DXL6yHL0+
 dfMwS2gQcO98F1DRibd1Ys4xT4G7t1p2EY1D1Q4knTH4WJulgId0zlu3/h5Kflp+uh1eN6sefL0
 DgS5xoNOVh30ZrVk6VvO9bfoIpNWPBi66z4cExEEm8P4gKsnjsJEQzzmvp2dTTm4xUkho3tCgCa
 3UgY0P0DB4RLvreOJwA==
X-Proofpoint-GUID: oxXgN85wyP24NZ7mUPGDn1HyD_htJPEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_011454_820697_5E8E56E4 
X-CRM114-Status: GOOD (  17.30  )
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

The GBIF_CX_CONFIG register exists on GPUs prior to A8XX (it is used on
A722, for example), so it should be tagged as an A6XX variant to match
the register spec. Widen its variant range from "A8XX-" to "A6XX-" in the
register XML and rename the generated macro accordingly at all existing
usage sites.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         | 2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         | 2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index a98d550b72d0..4b68416e4d05 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -2180,7 +2180,7 @@ static const struct adreno_reglist a840_gbif[] = {
 	{ REG_A6XX_GBIF_QSB_SIDE1, 0x00071e20 },
 	{ REG_A6XX_GBIF_QSB_SIDE2, 0x00071e20 },
 	{ REG_A6XX_GBIF_QSB_SIDE3, 0x00071e20 },
-	{ REG_A8XX_GBIF_CX_CONFIG, 0x20023000 },
+	{ REG_A6XX_GBIF_CX_CONFIG, 0x20023000 },
 	{ },
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 2e5d7b53a0c3..4a3c8dc8bb88 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1032,7 +1032,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);
 
 	if (adreno_is_a8xx(adreno_gpu)) {
-		gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
+		gpu_write(gpu, REG_A6XX_GBIF_CX_CONFIG, 0x20023000);
 		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 9e44fd1ae634..6a75bfb6cec1 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -228,7 +228,7 @@ static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		 * GMU enables clk gating in GBIF during boot up. So,
 		 * override that here when hwcg feature is disabled
 		 */
-		gpu_rmw(gpu, REG_A8XX_GBIF_CX_CONFIG, BIT(0), 0);
+		gpu_rmw(gpu, REG_A6XX_GBIF_CX_CONFIG, BIT(0), 0);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 3349c01646e1..69dd0446f8d2 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -1268,7 +1268,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0x3119" name="VBIF_PERF_PWR_CNT_HIGH1" variants="A6XX"/>
 	<reg32 offset="0x311a" name="VBIF_PERF_PWR_CNT_HIGH2" variants="A6XX"/>
 
-	<reg32 offset="0x3c00" name="GBIF_CX_CONFIG" variants="A8XX-"/>
+	<reg32 offset="0x3c00" name="GBIF_CX_CONFIG" variants="A6XX-"/>
 	<reg32 offset="0x3c01" name="GBIF_SCACHE_CNTL0"/>
 	<reg32 offset="0x3c02" name="GBIF_SCACHE_CNTL1"/>
 	<reg32 offset="0x3c03" name="GBIF_QSB_SIDE0"/>

-- 
2.54.0


