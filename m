Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21E5CDB463
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7lL+wHRlVycIkfmdrmoL7r3zk2jcr0ixS997W6ENF4=; b=RcBPXHmh1pBBTLIoYL8ziz9eyM
	H2a3SYTkku0Dp8gL1UB0W5x0aMSRkXBGTYNw22slfQTEptdyyU+HDmG8oO+bmiKrM8Zn0P+11D5Ld
	U//85faOv9IAY71pq0zyew2Ha2Yr9NLDOVuL6KBTrHRQNa6tUVo/S+cJb1qN/Q4VE+6Yo1nkedOVi
	KUGLpgCM4kwpYt72dLeJgIg251hj2mKS/LCOHE4dpXxPfuzW+1V9zpJi+09QjN8u1LVsQ0xn+1+CJ
	QJBbIgpdA5A5nhskhHiX0kvIT5PawLusd/RmvWEZnSsvQ4lHyaOc3GyP4tBzJDmFyLw7WZ+XkhAyU
	cMHbRUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgnC-0000000BHfm-3WJl;
	Thu, 13 Nov 2025 23:31:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgn6-0000000BHbf-1btQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 23:31:53 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMalsU1481724
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T7lL+wHRlVycIkfmdrmoL7r3zk2jcr0ixS997W6ENF4=; b=ma4ZdqkOFWK5JpVR
	NxAyWssPSxiaPkQMXjd+iy46jfJhOwhCFniUNeEvrd4K2xACE4Hn9MBrKRhfkIYg
	tWAdVORlZ6bJBGvBFXjOhd72wmLv0I+chYqHTBmXHAn1xJjiswFU2RTcECe6+kJh
	5qLQVZYyahSPonUopfe/jpTd91bCGPqxV+N/WPT9tKk9o9pBU5aNScRgT1OS/RRw
	7S3ZP9rmNq1hJIsrndO+RIlCgezfb5DJPPZ0vhWhjW3IepUdEI5qgteDke8DHWBW
	sbayo5ndCB6bXlwX0CiXpDgnd97tkUoXz5cw2O0BQqIHrQsmLBoEJ5yzH5howCLW
	xJghmA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9dr47m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:31:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34377900dbcso1992297a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 15:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076706; x=1763681506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7lL+wHRlVycIkfmdrmoL7r3zk2jcr0ixS997W6ENF4=;
        b=GTY1ehIYXCnGhoXg59OJSzS3JAwmIBhYQoS0VBxu3pno/pSmYT5X/4NY3otZAboAQ8
         08rHyYiHTMj7G73ElzjWaPswyriO8VvXw9P/uosOHnGOc9152+qJ8U8EYK3IcbpffTyL
         a9qO0v4brGF9GiZd73GZ0NJcsRUtVtIiCH4dQwI7c8aT3hVyWpuFcTWmtPUcPZ0GU7w3
         1EeBZbxXyCDyNiQINXcsLrwnmvBSedTCaq6X4zTMhEf5Wk+3Vl1N+tTwzkfPVSoNGXD8
         08IclFUNZvy4Rxzfg0jVCs/eXNi1Ecwfi905G1OzRQvxOgdlcTYEpo2rYmVvroJRMLiR
         XnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076706; x=1763681506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T7lL+wHRlVycIkfmdrmoL7r3zk2jcr0ixS997W6ENF4=;
        b=Wiw/XKrQFWmkNgaFjJlrv5XI+zTD+ZJOsr4rAcPPSyIb2+630OJ+thRhk/N9OcgooZ
         TnfiM/D29fvuFqYjUJWcvITthW+K8gwMeWWglZmCVn1ewMkTCbNN9x0LIjgbhbBUDCNb
         NKy5BTlfwl0OmwFqfIjd0TqRKBztUVagcfziRl5UISYhkiC+N+hm/ivkBjdHv6rrWwQ/
         mSTxhs0lcdZ8TylRHp1lWU2BU9JLNrZ3kBFN47EqdeyyoKV+6iqTlflWfmESxUPnzp6Y
         oMatd0JEerfb1jS2LXI4X/ye5VNjNIJ7IUTZKe3nJdqSkDrr+Ypvommon4pi2Gcu4JGj
         DxCA==
X-Forwarded-Encrypted: i=1; AJvYcCXAeal55gs2ffc/2If06r66gi1/RcIp5klnfOwbaLGnPz1nSrs2xZp9j/1B/ULhQu8nd22eSZRmBbRQzGNNCdX6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy15yZAoqQLnH3HmZSNk5FgyR7UDRMVvWrJAmkOPPAcf0X5zCBe
	A0o8vteos8yYEn6hmbLoljCuuwO0C9g7wrdBApnWI9B5QbZq7ir0MyLIByk9woXY8gjTTjVeV1X
	Xdz+e5+9ZhtXe4Cf5SuYR2DAyj7X8IkpMlFYRVJPqGccKiueyCX6a6Cu8rTZAZoeaYac2nkAfXe
	kLqg==
X-Gm-Gg: ASbGnct6kb7QIqIcBXZGMB2FS+jyZQXVdDE1lD7u9NLgfe3TxGJIGN6NfkPSJ0mv0Dq
	HLcF/YUbnOlb1zuvLHJfTtEnbL10fLCI0premA6RpqzhLRYU/+Ncb6zZ8T0FO5eDXyOW8/+Dldq
	TpLZt41CScx1T4rsj5613mhVvjlCoded7CUX21xixjKFfT6Tw0FerPtU3uFJrKXIaXVli2pRjMj
	9tSyjATHOnMD5v7iK4OkWJ/dC+hEdE9DMVaBvGdupvZXJN4HArnfXOEqL99ebP6Q4hKu+m2ni4+
	Q8n34LtG/lRDbFpOuYgMUssDN7aJPqvGJmK3A2k2eOW/YLxy+Wj6OHKbf7FCrr3JCa0BQnOwvae
	vskXtP4w157rvfkBKNBtAc34=
X-Received: by 2002:a17:90b:51cb:b0:340:ec6f:5ac5 with SMTP id 98e67ed59e1d1-343f9e915bbmr860669a91.2.1763076706283;
        Thu, 13 Nov 2025 15:31:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTwFM9CCphaQ5whCinTvXn5LPKMniluHIK/piKQ6bwD0tNBssWX7/1U80c08tDatxvglqrbQ==
X-Received: by 2002:a17:90b:51cb:b0:340:ec6f:5ac5 with SMTP id 98e67ed59e1d1-343f9e915bbmr860629a91.2.1763076705747;
        Thu, 13 Nov 2025 15:31:45 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:31:45 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:13 +0530
Subject: [PATCH v3 16/20] drm/msm/adreno: Do CX GBIF config before GMU
 start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-16-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=10308;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+vVNaPuZ+LbXCAiwTgYpXS3jmsHZyAtK5v4jSdPMdI8=;
 b=KYaJqUY7HtLKnHvUnLHMX6bKlSmvByb4fO6Gwh6IVrs8Ou3WPwvlS5DCCTur3SRXsAodquqV9
 qCpl1V2T0lZAIRKPk1pYVNcWOcz8G8TfQbCwfKCo0EcJ8rhiJvDmu+7
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=69166a63 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ntF6p7UtnlAjiWeDXbsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: -sLsQxWV2ptSkCarO8wgAY2OkrfHwM2M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX0K1NFacOlRgf
 klIJ7U7VXyC3mYXpjQXT5QvnSv2sn6hzsLylczhamgsdUtd9LZBGcBe9Q4c3WCIfrhyCJ3iT9Jf
 iwjQhVrlqbqN6bXzV8QYG7fjHopmLYidRvyn4bz8a8gfH2RXfvcm3dXcDK73oNGGN6rDPqiufID
 R+WTQoK/oA3sVrl7s1czct6pLl9g5hpUdUVTNk3l0MBAp7XLrxjN2wD7T5lMaA1D22iO4DQEJwT
 cM8C+Y1Y3PNQUGNCu0/3CMCiLNjZ93myxxHJ/VZDNYge7d9OVpV1z7qKJxZbRJ8ihqkTCM+Mh7a
 mC/4ris/Wfa6M/x7qt7nOO+fJSOyeh0OJVtv3tUsDGTmyuDiUOBLErq3hNCFQWQJI1b+/aZgyn6
 5HrzamqS0xcF7uACDSP6odNm4HzhgA==
X-Proofpoint-GUID: -sLsQxWV2ptSkCarO8wgAY2OkrfHwM2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_153148_566687_D93ED69A 
X-CRM114-Status: GOOD (  18.10  )
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

GMU lies on the CX domain and accesses CX GBIF. So do CX GBIF
configurations before GMU wakes up. This was not a problem so far, but
A840 GPU is very sensitive to this requirement. Also, move these
registers to the catalog.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 32 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 11 +++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 17 +++++++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |  7 -------
 5 files changed, 54 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index ffd977cc4ea5..f064ef6b8be1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -672,6 +672,14 @@ static const u32 a690_protect_regs[] = {
 };
 DECLARE_ADRENO_PROTECT(a690_protect, 48);
 
+static const struct adreno_reglist a640_gbif[] = {
+	{ REG_A6XX_GBIF_QSB_SIDE0, 0x00071620 },
+	{ REG_A6XX_GBIF_QSB_SIDE1, 0x00071620 },
+	{ REG_A6XX_GBIF_QSB_SIDE2, 0x00071620 },
+	{ REG_A6XX_GBIF_QSB_SIDE3, 0x00071620 },
+	{ },
+};
+
 static const struct adreno_info a6xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
@@ -688,6 +696,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a612_hwcg,
 			.protect = &a630_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00080000,
 		},
@@ -878,6 +887,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a620_hwcg,
 			.protect = &a650_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00010000,
 		},
@@ -900,6 +910,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
 			.protect = &a650_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00010000,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -982,6 +993,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a650_hwcg,
 			.protect = &a650_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00300200,
 		},
@@ -1008,6 +1020,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
 			.protect = &a660_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020000,
 			.prim_fifo_threshold = 0x00300200,
 		},
@@ -1026,6 +1039,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
 			.protect = &a660_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00300200,
 		},
@@ -1050,6 +1064,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
 			.protect = &a660_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00200200,
 		},
@@ -1096,6 +1111,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
 			.protect = &a690_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00800200,
 		},
@@ -1431,6 +1447,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a702_hwcg,
 			.protect = &a650_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x0000c000,
 		},
@@ -1458,6 +1475,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a730_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020000,
 		},
 		.preempt_record_size = 2860 * SZ_1K,
@@ -1479,6 +1497,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1513,6 +1532,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
+			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7050001,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1554,6 +1574,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
+			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1586,6 +1607,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x70f0000,
 			.gmu_cgc_mode = 0x00020222,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1733,6 +1755,15 @@ static const u32 a840_protect_regs[] = {
 };
 DECLARE_ADRENO_PROTECT(a840_protect, 15);
 
+static const struct adreno_reglist a840_gbif[] = {
+	{ REG_A6XX_GBIF_QSB_SIDE0, 0x00071e20 },
+	{ REG_A6XX_GBIF_QSB_SIDE1, 0x00071e20 },
+	{ REG_A6XX_GBIF_QSB_SIDE2, 0x00071e20 },
+	{ REG_A6XX_GBIF_QSB_SIDE3, 0x00071e20 },
+	{ REG_A8XX_GBIF_CX_CONFIG, 0x20023000 },
+	{ },
+};
+
 static const struct adreno_info a8xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x44050a01),
@@ -1750,6 +1781,7 @@ static const struct adreno_info a8xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a840_protect,
 			.nonctxt_reglist = a840_nonctxt_regs,
+			.gbif_cx = a840_gbif,
 			.max_slices = 3,
 			.gmu_chipid = 0x8020100,
 			.bcms = (const struct a6xx_bcm[]) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 063dfc392b9d..cc2bb844cfb4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -868,7 +868,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
 	const struct a6xx_info *a6xx_info = adreno_gpu->info->a6xx;
+	const struct adreno_reglist *gbif_cx = a6xx_info->gbif_cx;
 	u32 fence_range_lower, fence_range_upper;
 	u32 chipid = 0;
 	int ret;
@@ -964,6 +966,15 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 			  gmu->log.iova | (gmu->log.size / SZ_4K - 1));
 	}
 
+	/* For A7x and newer, do the CX GBIF configurations before GMU wake up */
+	for (int i = 0; (gbif_cx && gbif_cx[i].offset); i++)
+		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);
+
+	if (adreno_is_a8xx(adreno_gpu)) {
+		gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
+		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
+	}
+
 	/* Set up the lowest idle level on the GMU */
 	a6xx_gmu_power_config(gmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ef79f4cfb80b..53187a228db3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1265,17 +1265,20 @@ static int hw_init(struct msm_gpu *gpu)
 	/* enable hardware clockgating */
 	a6xx_set_hwcg(gpu, true);
 
-	/* VBIF/GBIF start*/
-	if (adreno_is_a610_family(adreno_gpu) ||
-	    adreno_is_a640_family(adreno_gpu) ||
-	    adreno_is_a650_family(adreno_gpu) ||
-	    adreno_is_a7xx(adreno_gpu)) {
+	/* For gmuwrapper implementations, do the VBIF/GBIF CX configuration here */
+	if (adreno_is_a610_family(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
-		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL,
-			  adreno_is_a7xx(adreno_gpu) ? 0x2120212 : 0x3);
+	}
+
+	if (adreno_is_a610_family(adreno_gpu) ||
+	    adreno_is_a640_family(adreno_gpu) ||
+	    adreno_is_a650_family(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x3);
+	} else if (adreno_is_a7xx(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x2120212);
 	} else {
 		gpu_write(gpu, REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL, 0x3);
 	}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 0ec265d4b91a..6820216ec5fc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -46,6 +46,7 @@ struct a6xx_info {
 	const struct adreno_protect *protect;
 	const struct adreno_reglist_list *pwrup_reglist;
 	const struct adreno_reglist_list *ifpc_reglist;
+	const struct adreno_reglist *gbif_cx;
 	const struct adreno_reglist_pipe *nonctxt_reglist;
 	u32 max_slices;
 	u32 gmu_chipid;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 78b38b52da91..386ee1207622 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -523,13 +523,6 @@ static int hw_init(struct msm_gpu *gpu)
 	gpu_write64(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_BASE, 0x00000000);
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_SIZE, 0x00000000);
 
-	gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
-	gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
-	gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
-	gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
-	gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
-	gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
-
 	/* Make all blocks contribute to the GPU BUSY perf counter */
 	gpu_write(gpu, REG_A8XX_RBBM_PERFCTR_GPU_BUSY_MASKED, 0xffffffff);
 

-- 
2.51.0


