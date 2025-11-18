Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70862CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrV6w/KNsg/+0gK7/2DObzlG/RNC5GFYtRF+8U90aj0=; b=YdVO+WnjX1VVvEJu2dSqk4TE0P
	EGWquCfvCUe6orOTF/p9mRuXPqmVds1g5Y78wnVhyQUT4FbLxt908W2nhM+ue1hvpe2zNbxm4uqc2
	vSpwZScB6EwF8/RJa1cuO5D13E4eE5XQ1TcgN4ZJR62HAgs4uZgL9Cl7t3H2090ALDoCbUCtZ/PJH
	PpgKUqTdE6XL+1hSTPgAt/uGkswqV9l22kja3VhyFYtUWhQYDsIcl5GaUVNkTXNDsIHEBt194MP9e
	+BX5T2GSv2yF8CKvSoYIbw9yjgUAigMmay1oupHySluXuMXGCdX7afeOUstJOl+zX0bmNlcrnFsXj
	ZHvlhg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHTX-000000006ou-3zvE;
	Tue, 18 Nov 2025 08:54:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHTV-000000006mX-1EyB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 08:54:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8E1WQ2194366
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrV6w/KNsg/+0gK7/2DObzlG/RNC5GFYtRF+8U90aj0=; b=XSJrKjwoVjc3E6RO
	PWDEeilTCueTASJKgSjrC3dJJBhl95aZ2GbxaMRERmW+cCH1EctTbG8YufS0NXS1
	elUEnVsHJfJqhC5O4e42Z3QfZsGtwJln1BhAzfla/PJE1oPmmGonbgBGJnSbG4S7
	uhsahzWLq29xyCVLAbR0KcDYFFgLR9PyT2/jElEqq9NmUl2UuMkvr9rGk13Xkm64
	jH+s/yuVabDyI8WYgBkIoNj+SQKARX4lmFL5hC2p8ZncvDbO7gXJ6XMvkfFdnf+G
	Q3gDpCgL2p23bFgPTwaXy804y7cUFKerC4U7LKdcxk40VWYDK7UWhQN5HiRg1zx5
	Z8Fmag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y83sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:54:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-295fbc7d4abso67847385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763456048; x=1764060848; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrV6w/KNsg/+0gK7/2DObzlG/RNC5GFYtRF+8U90aj0=;
        b=RJRRh1HGtcbg1NSUDsyTE4+bISqPeDdH/IFuwzHcWg6/iCDWKty87vccyQY9zUTwcR
         cZx9pOT874OH5MFk49PQ25EW2AqsAIaH3e54swdCOSPifEtNCQqE+1I88n6MHKep4nXF
         k8wnWNRWKvA2BccQRaJaye45JuM8/a0KGKmfiaEs7cPjoo97GKtFQNrGEXCekil86Ri5
         ezu2QbocJptb4z2z3WaM/+ZYGQmDL2ZusfbB8e6cv9GEb/44unjkncDaGobYlt3+PHHy
         za2yTTg+Zlrm3Qa1XHNwIfvyFJEmVol/FRa1SJB20a9HIPCbfwv0gASNB1cwBPbpvlhm
         zWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763456048; x=1764060848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PrV6w/KNsg/+0gK7/2DObzlG/RNC5GFYtRF+8U90aj0=;
        b=p/dE27UNhGgNjrG42k2Iazl7J327wQHaOlu2C0ZwbM39iTzTEv27Nqx8MFI1sZIz9F
         h9di+A70S2krfvjUdW6UwbZMXDesfhXiGY+ZSdATjCyKopRu3IpUJSP45kzh67tA6ReA
         YyW+3kgh/FX+TcuTnKlSa+51E1ou2Xtd1RRdaeKcDL5hdJvhgrXSY+I+OmukeNkuXMfb
         G+i1y+qh/fRFVpa3ylly3s822z4EkH59kBiwTL6VDNcrR7HiGKH/PFWQ4N2RtIMEbMom
         Ph+pcqr/npaiyyvi4Ppv6JJY+/shwaXTlBEQpxHAv50V/RysuUr+uEAR3dSXEQCLKiwT
         0iQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFXCHXXv7AufWnTSQAkMw+MkZt6ukrdyUU2cSeivf/S5+cdEkZ1NsSRikPNzv/O6rCXBDqRnAHTM7Q8ScxxzCY@lists.infradead.org
X-Gm-Message-State: AOJu0YzbrZ4tVZrBbwb7z41Xm6G3cvSMRGl8zgVTLwXXx53+T9qhemvs
	u9RFaZbMHTcPvqYeOrqnK4JujSOCgJlcwbUxRMpmRKQaMeC+iCzozAAmleUZRo4mJLBpgt4C+WZ
	gwxqkxQN4soDQTx7wSrg17hcs8PbZ6OCGSHuQR2SSbprPMQihPRPhYyLTI3ZN2Hgfoi6SUNt5nr
	o8Gw==
X-Gm-Gg: ASbGncuonW/viaSVjBSYoiCoac8HImES7qVJhDGWqoEUgP4FkRNCoK2rXvkCowfL3F2
	wxzvm5fJT8rdOpNXmXFmz1mLDTIbl6gT0lvrmsnA8HyRElV7+zMADNXbVLj3XY5OZLenCmj9Loo
	7kX5SZlvDhd7wy/B3O3++GRDYp7ghFHk06OFZZQ2i6EbW/Ck6xc1KDLq1ZjibHiMCXkXscnmMmN
	32Bw1cP3wBQlOmZgRBKX3v/MsZemocG90Hwe+MOYl4+bi6DLsSPtjvxsVhkEyvGXoCQttCrsbEd
	pG7dyc4Y24zdtLA9mcBOJbPeGGK7vGor737V154dGf2xuSrr4zH2drfRj4bz5qFHVfcKM6/cMUT
	8f7iWRRNcN5o1SNS5s+KCPHA=
X-Received: by 2002:a17:903:2b10:b0:295:915d:1eed with SMTP id d9443c01a7336-2986a752d2dmr184978035ad.47.1763456048190;
        Tue, 18 Nov 2025 00:54:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVjIlIvPTSiLdTNwr5hmoMfFZEBIQrZl3YPil3Ox+0tEXFjgQlXvbvrH6me3SXOyh31lsTdA==
X-Received: by 2002:a17:903:2b10:b0:295:915d:1eed with SMTP id d9443c01a7336-2986a752d2dmr184977645ad.47.1763456047717;
        Tue, 18 Nov 2025 00:54:07 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:54:07 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:49 +0530
Subject: [PATCH v4 22/22] drm/msm/a8xx: Add UBWC v6 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-22-86eeb8e93fb6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=712;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wceYkLyUbkNoE/pP8sWa3zSzsulvkqlQyOrCItWxr1g=;
 b=ab9CsH8NF32fs2MhCaQYzdCr2lNXGHBIXRiN2OcE/b/eGPfTzV94cxPkR/EkNz+ftEVQXOWXR
 YhM7yhyZPncD+Uqsl3lAE5hf7Myb66BTpP+CS3Bd1dT6SCaSlLLFKhI
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX/Nd4TW8Nxqcw
 4yZ+Q6NRhJmt8adzdm8bDRVQ2A1xQHt+2D06skOngX6sHIisPt1FpYWSXH9bHrhTDAiasRzB2kD
 t7qLxofveYIOoWE4ejbpZcFeTiCpyWrSkQU+wE+oFDf8ZGmPp7gVjxkRd1hGkK8AEMb2gzsiTQk
 TGTcfKOv4ZVx5hBfpa34i9QYNLU7J3c8EaobkUsfhHjEqwPeTVg2QJDCdvugJ4icNPiVWG459+a
 U3Lw6WAAhk8W4L5+LOCw5r3v4vqyVqlNQ+efn2U0HZ0trOTxSbv5B60xuqnHmSwQIskGDIIFGPd
 iy2hf9Vt/mXbuAJ6v1r2gbH4xrAk/QHGqqf3iH9X/oDVyqEbRMYaMlkVPHt9ae8eoHIUMUI9dfs
 xc1U/0kkUy4hVWz9mKSw1GoOzTcXKA==
X-Proofpoint-GUID: W4JfPbA-i2ASv1_eUJBDZXPDMgy26InJ
X-Proofpoint-ORIG-GUID: W4JfPbA-i2ASv1_eUJBDZXPDMgy26InJ
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c3430 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LUS0w5LV-g8XRIoliPwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_005409_359879_FF767DC2 
X-CRM114-Status: GOOD (  13.91  )
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

Adreno 840 GPU supports UBWC v6. Add support for this.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 30de078e9dfd..5a320f5bde41 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -276,6 +276,10 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	u8 uavflagprd_inv = 2;
 
 	switch (ubwc_version) {
+	case UBWC_6_0:
+		yuvnotcomptofc = true;
+		mode = 5;
+		break;
 	case UBWC_5_0:
 		amsbc = true;
 		rgb565_predicator = true;

-- 
2.51.0


