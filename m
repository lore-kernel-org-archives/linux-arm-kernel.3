Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934C5C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 20:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEJ0uZQVI09LETC6xozJYzAod+qX4DJ0MzQIJLZn12I=; b=ulc5h84eLLb0xjHitVOFu6PIny
	zCuUBuTnoALxiiT9xGKy0iQ+j9Avb6N52ww851qlxD1Lzm2KNcvzmuVlIBvDt429oOeaoQfgaAAQ8
	rQavVEB/V73YiusgZ4B6ft9/2SU5FZGEL8zj+OzhIOK7ZSOtmAiOrFdbnBzbhhAil0RW2Yn+Drds8
	zy5piaSctrGPLiAfn/ny23fDgANBNf/rY7XuGnwPK9H4hA0fJPUI0UNSap68n0fHj2hsmuxW5Iol/
	/KkYYh8GxKeGtCTinGBYRMLpddNIn0vlxfS6t5jLN8N9iwIXf6BD28/OKB7qS9XdWY2lPWaBzgBuH
	aV4xyBbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpNs-00000003DLP-2Coi;
	Fri, 17 Jul 2026 20:42:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpNp-00000003DKU-1ooA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 20:42:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtH9Y3901362
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEJ0uZQVI09LETC6xozJYzAod+qX4DJ0MzQIJLZn12I=; b=F8KWpHMRjsjMPMsl
	iZCB39fkxhgaevrxxSw/OnsjJu9+UxkQXWwyBPOT+jkzHSgljNuwfR7rUYwSxqBj
	97ZmV+/G7hGE5Xy3FoeF2vRifP56AW3n4++Q6qbFuWC9LZDrXBRmsdvMY9Y3m/3W
	JTladnYYNU26T2lZCh4aEjapaV/kTGlnmi8WGIEIlYuvhEiwWdNvxFT/fmuhoQu5
	HNiMz5Mxfl8UV9xci0w+ayfeCtSJ68XMLnAeCljwOQ6KhI7Oaqn3rihx1GWzciVU
	MMb8dhXBsTpKqwWFXnYvm/VipgnF/2ly2maxApBLr7xG32iInLxmzEiovSZ8DRVz
	Ih6oew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffqvf8yc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:42:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so2226759a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 13:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320928; x=1784925728; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEJ0uZQVI09LETC6xozJYzAod+qX4DJ0MzQIJLZn12I=;
        b=Yv/GHLZkQqlSGxlOmIRPjFRvt7VkJivRNPSB1rC0+d6XRLd5YcFJWBnDzzHZ1H0ygY
         zkeIwpgX0716o3AbNzvPTZTLAuE7aLYC4wiZJcSibslqAj493knxkEQQpKiTzqYy9KBr
         +dZX7Delk7bhdGy/fuChPH8cxCvZ8yy5VMJ3zPWfLLPInr5bDp1LO6Q0t0mV6DRFlMSe
         RT/xkJZvKQsvfR3qqAtljWQHhX+eXKWZLYAJB/lYJKIToT+RvHPx7GATujEycOZL8ysZ
         F2zXMDQVc/0qPDlu27wgmq4vvGKqxky+qP+ggZEtyEhnKnbQpc+QRi3Bpv7RpYULTO42
         UvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320928; x=1784925728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEJ0uZQVI09LETC6xozJYzAod+qX4DJ0MzQIJLZn12I=;
        b=Oh5Ts/tqpivSwJjIYJlXflqGlwbgJReNUJy+RgSehKMJjlaQI7tp3+jj5rStHg/+28
         9UUdgklY0uuCd3dGTTcPy29/kvpYrZ8fR8aCq+qcdvuw+D2DxFnHTphMNSpNP28mfv7O
         Clfw23J0m1NAJ91jexRPuEVcR5CZX/618KCWMBmOPTQy/AGugKYEK7qIl/F1Zs++hkZl
         EoGA9m4es/H0xULzBJmoUQRtdx8dlr9DNWRKDJDsDEoh4IUCY6vHzrbROHXWPYmg/xZS
         cmD6jXCMM408S867n79A1YYK933p9ZhU4d+gDg52EI4mRwxFNKrdrU7nco7nKDr3ZQFf
         qT8g==
X-Forwarded-Encrypted: i=1; AHgh+Rp7oB6rW2/Z4OhMlcjzmGwefikk5h6FeU3bsf9A1DvRYDOWVv47A44CtXKagFfaKqgpGoYFvq4LdemDFk9Pog1X@lists.infradead.org
X-Gm-Message-State: AOJu0YzYH5YwC84WIeGjJU9XjmRf9xKRMXwByGez8ENaw3wgRmiwCGhQ
	oI0XzbfdggtvnF9+QZ3HtuEfUJwYT77MCGbaoJ0nhegTg5I9tJQu1+/jpbuBDxeppQif6GeeJgz
	PvwxY/bTOaMD9TVg2B8ug7l2ZB+O9diSk0x5zOJsk0H3oo8G4DJTWbueUfrulvFBeySWv0rLfh7
	g3vA==
X-Gm-Gg: AfdE7cmnIH+Xz/jIyz4xNUd9AqVCE1B4wrQbBLpEf1riyTfo/NfDbiZbF9wus4dx58N
	ztlQ1EZoXaSqIyeGSpqmFcQKn/O3E9gs9bhhuLJsJIhwCPrYXBdCB2Bbp5FIFerc1cCdVF1NcBG
	vzIds7xuvISiPNXkd8I1KqWsMocgYjGHUcK0xtf9tDt3xLvHxi8/uK8dq/nl3BaDEy6L/Z0wbtG
	nCpjIPWUMqjw8MlX+s03teozqmADrduLaG0ZJ5UQ4lJrSJyoxoNLANTRROo3d3rsVd8i/30d1D5
	BYRfv4nkUy5StsPwfa25Mk/LdP05dJQGHMvqLTp9di5Fx+UsOg4VCfg39slkM/Qc0a/H3Q4zAmN
	ePghJVaI/MDBIO5mcX0LPvaeR
X-Received: by 2002:a17:90b:540f:b0:37f:e5b1:ec4b with SMTP id 98e67ed59e1d1-38e3d163538mr10090679a91.5.1784320927537;
        Fri, 17 Jul 2026 13:42:07 -0700 (PDT)
X-Received: by 2002:a17:90b:540f:b0:37f:e5b1:ec4b with SMTP id 98e67ed59e1d1-38e3d163538mr10090626a91.5.1784320926891;
        Fri, 17 Jul 2026 13:42:06 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:42:06 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:27 +0530
Subject: [PATCH v2 2/9] drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX-
 variant register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-2-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=3230;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OTjz/hUYsdXL1nGMP1P88FY2BvXLf3kfPOscxh457b4=;
 b=arW5LOtnhsz7GNASG3k6T6849UaVGE8SxWpxFRJrV5xGwidmIhco5hKA79Zbb2P93PIK0zXO5
 NW9ANLNRiHjBZZmVwziWRlZIJZJK1ayJsn7ebxeRUw+CxcdiSQZwX1A
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: bLHTcw2Sqb33wu6lFSPplPUYQa-C6ewq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX4NOqBkgVzpzq
 Xnc824V7JVDKH4I9/S/tTesx9U11lq7lxiUZ+1+/cqpvSLKkVzuzNSflBtWN58gafWoo79+wSs1
 CM+hDMf8dtW6durt+IKdO9IAV2AFMFm0wESlp01bs1gMwWWqc6NYX3tz+f68TcbXRXNIJP9DTvc
 Ah3sbRbwxQnSe6gQFxMvq9BbfRGqo3bzbDURYXGgu0rtyZ36k6bSMEk/YT0FJX+7qStZ3H4H2mt
 eTYhT+31pJ4V463FMZrcE0hfAIEqYJVh1nfQaDRopGrfqM5wc0T7AmpzwMOvqCgGMPR94o5NQQG
 q+iUMvJGF58jSSVHkStTVmdUKMPPZshUDAbLyQ+1DHZnQTO1z20L5Jm1hk4gA5mXhIokLVi+Ogx
 uR0zbLXEF+JdUpPyaUlimfeVeURKjdbydicOSf0NUnKBPpeIP/nEEPXIZsGQGcfQXdFnKfY/XzW
 L+Kxf1lFwBKKHxvicAA==
X-Proofpoint-ORIG-GUID: bLHTcw2Sqb33wu6lFSPplPUYQa-C6ewq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX9Qs8+6en8SHV
 +X8t5qmW2O7gWHVW+doop5H6zWNBaZhk9LFKpqw/opB2cifkVU2/OnqoxpUVWeUc295QBfw0zJf
 zKOqXZ6n07EuYWiTX14U0f23joS0j5w=
X-Authority-Analysis: v=2.4 cv=OPMXGyaB c=1 sm=1 tr=0 ts=6a5a93a0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=W9u8H8Hp_niEWJubwdoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_134209_488307_A8D4EFE9 
X-CRM114-Status: GOOD (  16.29  )
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


