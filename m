Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7503CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhWAU4GwkZc/7vJbgqlZua/hMbE+FKAm5HguK+Q4/xI=; b=3UkunKsC3OfaHb7ne+MckccDrq
	7XnHZdLNK2XlTgUuvWtx+uJtQoq32y3OCaEiFpKwu0yj7X9MGsTNbJvR3Gy3yR2S+VGJ/Do9bxpc9
	ZMFr0ZUHwcd4Q2R5EvodOvF/+sp/dWxdei4rn8ecGhB/u6295HreCH3M50ttX1Cx8UP1TJayGGa+z
	DZ4WruOEblMXMTzeqBiZx7InSf4rradKTYD3a0BMFDv3hRFsNYRONDNzy54tD+nDSDHmu9mTSOYkb
	ia9AWmjBU3RH764uANZipOJMF1SIa2JEhwkz6jhfSw4P3SH8bXg7fUrewhMBmi/A4JDjCEJgng7rV
	wvpPwO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUvg-00000005pJK-2UFE;
	Mon, 10 Nov 2025 16:39:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUvc-00000005pH4-18mI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:39:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAD0wAv3676831
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qhWAU4GwkZc/7vJbgqlZua/hMbE+FKAm5HguK+Q4/xI=; b=NfloY2UcabBEHbGh
	fl9Eps4ZBX7fNEkkBh8BEYS+32vOxrIK2m6yXUnyWDwM+rERBerTUbwIy0uBH/SL
	u/3DOWkDZeUjVkRKjme4f50ly78gXxUsNDnxiJV+ILo/qTdHLAmqpVtQ0P87xvIc
	ZFH9bvL+B39iKMvKb4P0QavNQ2z/VPkJSrxjl/EZq92g2HwjDzSWFkmwDpxDZSzo
	ZZLF+B6RrkPZLbAZgLbUssgeTb+j8BWwv3up7KXy/9GrwZPlU8z0twkUmiExaCpV
	8RjBZJYAZtzr3kDYlgmwAZDngc/mHntvaZ4GGSo5eIOo2vKfCzjvu/0JD2CBbaAw
	Cunn5Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abgjh8q47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:39:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340c0604e3dso4129128a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 08:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792778; x=1763397578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhWAU4GwkZc/7vJbgqlZua/hMbE+FKAm5HguK+Q4/xI=;
        b=S1TJJ6JinchtgyvC68zX3uNgAvymlvZ/ElxSZiKMJHfgiXs3qWtByd6tsyyExSabMr
         N0voe2xOzShSGjS2fuBjc2SRtnQZJB6aYgSHoYCSjZeZqHEtLl134pNnA7zjjoTLXy/r
         MdMaQ2qKpdGGJeKIzU5mLxHikgH9uwpxvSwfcOKGwCorYUYZZQxWaZPXwGviAt4ZFEfR
         yVGAbmMU1FldEjCJgc7m/IzXXcbB0s14MYo1Gjbh2FY0JBYqUPSNEeZeXV0hrU/dv0s3
         jyFOxB+vQXE3qc60HDF8jM51PyylCq8fbCV+KP28Eg1Y20gP6TnOwayDnyuaNYOP6ye7
         QjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792778; x=1763397578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qhWAU4GwkZc/7vJbgqlZua/hMbE+FKAm5HguK+Q4/xI=;
        b=jj9ko4FCkPVWFVFXt4sxJA8YLrjGw2CotRUbWJmcoHGA/yDi5FfxFMEnz0LRsxQ+9L
         pyxRQ2+jzjAlMcbNezkBS2862/JSrX/NoatrFWiaZb4VLVWwiXd+bYP51JFxsecCsjjE
         m7lIhJ0zSPEk6Iu+i9qn2D4Cs7mghl9Nt5lZ6wecT4OOFb7Rrd8R2EjPuJDFh4Zq554p
         hC53iGiJl8h8sZfPLIwwUzVAiz32NzfVX1VDgOg5Wpew3WUWvmpU92oh+Qrr3Qd6nhR7
         7vinpsQDggE+KFi6qfs720pcS5EtIj6GTF1E12L5BD7yLgpenaaM4/miAk0dqZBbfpHv
         QGNg==
X-Forwarded-Encrypted: i=1; AJvYcCVyurfaqPx6oA1TdkO12iBArwx0bqrqJEBNsByTNdkMsE904YoJLkrqAmrbGYtdOikisDayXGrgsRjwo7ivGNn0@lists.infradead.org
X-Gm-Message-State: AOJu0YwTNK8+G0pC8FBrmtMPAADiO/4Mnn7SnLcmTFQftoEyf4eVz7i/
	rqaN/23NwaAZr3n7mIBYiBnfBVnTEhLaFvF8/FCzKCLjAFhPxIlIFwbY0nUsiT0Y3kFAAGPPYGG
	qX9V8dmU7Tn6zIg8aKd6DTCaFfRqD00lt9iW4rpTa4hFnkCRsQpoTKjDl/k+HUvjDZDs1VZt1Go
	Zb+w==
X-Gm-Gg: ASbGnctk+qMDh6KvSz5YXd0jfg+5aR5fcmRlFn5DDJJ7/HAMGI5rNpXm4IbXNsnI8v2
	5xicnvhfRCQ0Kk/GTvfxXwQiO87WumBGeLO0e3u8LXsCY1HPp89n9RwxsdWMabmB0PQw/kKKsJB
	FVPC+PCh+9gfJCOPnRVSKvq33SPsPW5tAvSfhExiGu9HDgHSsRJE11qtb+qXJcFqHIqaPW4dPMR
	BSSsqFrnQczC//sJ2CHlf1Z8qNxg9dHzoUQHeC6ZTcGfRgCaI92kuJo7ZJU5eCqYU5GtCUmgKsS
	KhhWlRQTWUGkrWXHPWsJmHBvAKHs0vxjjnbEOJFR8K5g4VVHHA3IldqMadm6+HxKQgC0bjU9uku
	CgkMsFNTJQiCJsNh8/HWm2Bw=
X-Received: by 2002:a17:90b:3b52:b0:340:25f0:a9b with SMTP id 98e67ed59e1d1-3436cbc74d5mr10535194a91.33.1762792778277;
        Mon, 10 Nov 2025 08:39:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKuivtP5bPOxg4eqYPpqCiRonwpKyitk9efo7oMRmT6OqAejXcK+KdVc51LUlDkH4mfwy14w==
X-Received: by 2002:a17:90b:3b52:b0:340:25f0:a9b with SMTP id 98e67ed59e1d1-3436cbc74d5mr10535152a91.33.1762792777713;
        Mon, 10 Nov 2025 08:39:37 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:39:37 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:17 +0530
Subject: [PATCH v2 11/21] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-11-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=2950;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=LWOc612J9bhiyGK31kvlUfk/uc8PZDAIZt+/ViUR8y4=;
 b=Dyz4d2Rpgtz4n2FITe1odQAEtosB0h0Bg9zoRd3AwbZUYYMJMDaf74l7QdElyyEqfnmryp4KJ
 0My+qrkFhbTAtvi+hF5ODj3d82ls447n7pfXlXg7IJLPvV878p2Eal8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX7EQMgRkhaOik
 sCnsBoG71S8mWL5BBJMIZoMbQK/cMlUa4jQK+tM7pYLEOeJuBazAWuSIhN0STrns/SBDe0rmP0J
 Px5siIJ4BbqVROq8wKXRTWWLAZCHr82J8l2QGZ2WA6kzMmcDvqRgbixaOSsYgtp64LmbYrzGwQw
 nvkMb8gKPVcqIP3QOPtW9kE3CJwZ2zdqNnQPUwnPqOpKFZtN74W/HrDP/6mqucjoiQGvlg169co
 hZk54xuE7qkJ3mAATyFDl5yPQR1HqHNwu8GMuwLdl+U38xwdGIwPOMNJWd4wP/llm7195axHzwX
 PG8oCJjC7en1iYIssd4dx71ueBAvtGSBWvZbU8G3tm9j0VSSedHjyew8are8/DoYJVYCtdiZTi8
 D/1V1GWYxpCQXdUSCRG+GvWHMKfMXA==
X-Proofpoint-GUID: eXpLUxmvlBsl2XADraNaIctBbiVWX_ag
X-Proofpoint-ORIG-GUID: eXpLUxmvlBsl2XADraNaIctBbiVWX_ag
X-Authority-Analysis: v=2.4 cv=La8xKzfi c=1 sm=1 tr=0 ts=6912154b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=feIks7WodE12ze-Om1wA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_083940_437339_C4B13646 
X-CRM114-Status: GOOD (  19.33  )
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

Current logic assumes that the voltage corners in both MxG and MxA are
always same. This is not true for recent targets. So, rework the rpmh init
sequence to probe and calculate the votes with the respective rails, ie,
GX rails should use MxG as secondary rail and Cx rail should use MxA as
the secondary rail.

Fixes: d6225e0cd096 ("drm/msm/adreno: Add support for X185 GPU")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 112ef7ea320f..8597d7adf2f7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1519,13 +1519,14 @@ static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
 }
 
 static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
-		unsigned long *freqs, int freqs_count, const char *id)
+		unsigned long *freqs, int freqs_count,
+		const char *pri_id, const char *sec_id)
 {
 	int i, j;
 	const u16 *pri, *sec;
 	size_t pri_count, sec_count;
 
-	pri = cmd_db_read_aux_data(id, &pri_count);
+	pri = cmd_db_read_aux_data(pri_id, &pri_count);
 	if (IS_ERR(pri))
 		return PTR_ERR(pri);
 	/*
@@ -1536,13 +1537,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	if (!pri_count)
 		return -EINVAL;
 
-	/*
-	 * Some targets have a separate gfx mxc rail. So try to read that first and then fall back
-	 * to regular mx rail if it is missing
-	 */
-	sec = cmd_db_read_aux_data("gmxc.lvl", &sec_count);
-	if (IS_ERR(sec) && sec != ERR_PTR(-EPROBE_DEFER))
-		sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
+	sec = cmd_db_read_aux_data(sec_id, &sec_count);
 	if (IS_ERR(sec))
 		return PTR_ERR(sec);
 
@@ -1610,15 +1605,24 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	const char *sec_id;
+	const u16 *gmxc;
 	int ret;
 
+	gmxc = cmd_db_read_aux_data("gmxc.lvl", NULL);
+	if (gmxc == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+
+	/* If GMxC is present, prefer that as secondary rail for GX votes */
+	sec_id = IS_ERR_OR_NULL(gmxc) ? "mx.lvl" : "gmxc.lvl";
+
 	/* Build the GX votes */
 	ret = a6xx_gmu_rpmh_arc_votes_init(&gpu->pdev->dev, gmu->gx_arc_votes,
-		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl");
+		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl", sec_id);
 
 	/* Build the CX votes */
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
-		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
+		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)

-- 
2.51.0


