Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE5DCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVwNgHskrk/J1QB8XLyxKsyxPDVAl6g84xIBLcijALA=; b=Ydy7ZoJCxbylkPrPOr3fLyZYu9
	u09yh5MTRYKGZFXtHeMU7cYwbeLFkVOPKEEbSlbKNYWLcpsBpXzkRh4QZQnBe2mE6iizL1ZWEBde0
	SBxoaDbtl9sheIs6M1moQa3hTbyUxhYDEYNpdIITY0igBEAGyI1V51N4dlc8mlr8EmxUwwIRjLukb
	V4PFALNwwjiBZL3SfXQoHTZ6RK74UxpcWUnAzbWAya3ZDp2SWAXTBtSRDDvcTzjArqRkYNNuiy5Kj
	Bv+z4pPTseTXX6KS9tDVatpAkzoUYOu8mm2ZouUC94xNxQpIYvomda+I9TBiP9yOIbGvd4yTuT3iR
	9G1FGEtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUwK-00000005pjx-2FA9;
	Mon, 10 Nov 2025 16:40:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUwF-00000005pho-3te8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:40:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAG8egQ2992480
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nVwNgHskrk/J1QB8XLyxKsyxPDVAl6g84xIBLcijALA=; b=LDyVu4U4U23qcm5w
	FXqny6gDZhL2QVqETPkqez060RWmXNWbDqC5fB/wrmkHdwTKP9hBXMOx/bV+cnQX
	R/fkgi1TUDgejop2dxuUQcZ4C+rkj5PyncFNwqR+S2SwREjI6BbCWrhuf8M7tNVm
	WP+oBarVCmY8FWpV1oay1YQ0HUhuFGEDeXL0NbN6RFzZM6XhYtc06uNzZ0hKIa5x
	ofih62wKPsNUwJ8D/m/Dncm1PJUHCy56v0oN2+eQWs5lcU8nEFZf8cD7F/CXcNrb
	4tIGGbPgvhYH1/2RsXrXVZirt71+LH8H+ZeiCZIiJe1DWBX459zh1cYh+L7EnU+l
	ZsRoXw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd88saxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:40:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-341616a6fb7so4106345a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 08:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792819; x=1763397619; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVwNgHskrk/J1QB8XLyxKsyxPDVAl6g84xIBLcijALA=;
        b=K4BCcXN50Kkt5kfKjjoJyEit9vcctmzj6LdbIE52TIEwr141gsyOIQ0ShBsyQZg4LG
         1TZtFrHUV3Z/0eJCIQ6ETj86/gP8S1jxTIOUdxCmlPTirOgCl67kYfGqMy9p4ezXukNk
         ZT/bFNwsZUdvhhSaPr2553kvliuZfBr8pvz73oHfdT4MdVeU++T2UJli6HMJd9u8YpuL
         vXNzhGP2UbgcJk8Gif2MZRqguvkWEow21dVSt6eVgPUN9mUDxA8bpkGlbScoAe5Mzy1t
         SgA8ocz3OLcnahUvhzkDFiFqARqMogqkiJQFHqNye6sRqtLSNbpGug75r2o9R+SAFGF2
         Pi4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792819; x=1763397619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nVwNgHskrk/J1QB8XLyxKsyxPDVAl6g84xIBLcijALA=;
        b=Es8OTWgT/QSse1OLNFwpsCaYL/QXoLOKtRs5HR+br7BxGrCCkKEcqkOhLx5iorRJMj
         LOvmrXG3tThGNjzMb0nxabSe+nOMevzVWeHuVRX5CW83qQO99/J/FMN1lT0MQvdSix+m
         xr5iwxstXueyi2jJ0yFq7RrQzXyy3HE6pU3zj3psTMrO+/7PQTNTBcDeNcFtLDtl6Atc
         uX6jxgtrKuoghRARs3EtO5oKORFLLJqEvm8HlA401mQAhC9ZClPV2MUvecGpYGJia9t8
         0B0k+6sTYdCkRiXRPosFBQHPqFiXy6NQ0EkS/4lzV2OHs7zVCbj3Oo7RCWhmWx8xueoj
         vMkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi9FUj8RKerEGqSQcCg4wpChnueAOpQ33Z4nlrSO9PpuMUL9sFOcL3EguJ85Y25HknSzLb4sDvAwvSk81DNtnh@lists.infradead.org
X-Gm-Message-State: AOJu0YyS39Xr/4AEJuHqj1SnKoVErnSScKALPVBNa0PtsRMeXFu8Pgcu
	FHfl6VcOY/kRpWYCIzvnNHBiOklizOR4D3ENyaA2+jwWEX6PS6czdNrZF6yaiMMbwUqXb4ff36r
	Xg/n9kE2MD0x9IoNo9tGHIn0c1SuyhUgm1eLJ76AruJwV8pLmAvtRXM7jVUC2p2ssFoiGXHO5uL
	x8xA==
X-Gm-Gg: ASbGncu2HSWFa3YdJRbdVOSdD1W1FMUAG1uF1N+FT56zOSbpBXpM6rqxsqXdVnDpvBO
	+a3+jD+pVFeAmANZlslsA7hKyENG0FOIbpIequNFG9BNr6uuueqi0y7MAlDTJ+Ire9MHc3VYTwC
	fxyCFDJbbU0Tq4tEjTQXMGHpoCFxPXA0TXxqufBlxQTSaH0Et6+XV8/Uo43WmiQPZmtrCKAgaA3
	egZ+y9Qma0dX4iaGcf67paswycsHc6Sc99L1OYeV1Z3Cgy5xN+mzmUlhjfTU6gex+yHf+RMf8+W
	3C1o9B3G/gh7Y6XUzjVSfPoYSML/GZMmSJPytPwpsRv1N3jm3H1MlkwNJYr4GO5v0rBwknW0p1u
	XdveE7Fx3EEgXjBoq+cqXb6E=
X-Received: by 2002:a17:90b:1d0a:b0:340:e8e9:cc76 with SMTP id 98e67ed59e1d1-3436cb22a57mr12950724a91.11.1762792818819;
        Mon, 10 Nov 2025 08:40:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzdHoNic/6IFzqu4jl1tCbYh2rPj7vbAgvXHYulBRCa4QJH00zgqH38AHljN1+VXxujQ9dOQ==
X-Received: by 2002:a17:90b:1d0a:b0:340:e8e9:cc76 with SMTP id 98e67ed59e1d1-3436cb22a57mr12950659a91.11.1762792818119;
        Mon, 10 Nov 2025 08:40:18 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:40:17 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:22 +0530
Subject: [PATCH v2 16/21] drm/msm/adreno: Do CX GBIF config before GMU
 start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-16-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=8336;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=LNBgIzkBqsqfEpWJzwTTcgD/um5V3p8naLGClkQuias=;
 b=Zzm37hB+BMAVa7JGIfy2qEzDAn4Yh3xcflkn3GYpt84o4E+iYsaXh/sd9wK6PYMy44T9Oj7Bh
 fMEvUTedm+5DgKyJ/B3MZIHfmWvN6WFelLy+b8O+xBiXorjDkRD5/6X
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 2_fKdMBIfORAv11f5P8A8k_7MvTGH6dV
X-Authority-Analysis: v=2.4 cv=PL4COPqC c=1 sm=1 tr=0 ts=69121573 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=beDsvRS2jwLRuxpa4okA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfXwhYdszMz/eyO
 Gswbj9iClHTNUS5Sni1n71ao5OPMmfy9MzlP/MkNYTmIM3Uv2/Zp3E7ZgGyqDs3MEWbtYDnld75
 nVrIuCeRwy98OTeevti//RlPJLTBQ2b4oHQu7lsPe5Vf1pNAXrCFhJVfusz7kfUZQRNS+eFaH1V
 pUjUnjBIKlFMYcehq6Dfk9lp3c8MlNZdiet48L8x3aV1ODyZbXcaGnLuxjS4wqt2Rgqi6Xx57GF
 j/lpaJ43alHrkEcQH3JZJisF7S++pdbJVQxaicdQnbtLj5xcB04Mv7z3QQ/RViGLg+c0VmmpoRS
 9p7QIy5T2lZsG5il9COqyynNfo8pLkbD+UfDrMvfJdbplthf57C2YgZvMx+s+ryvUPyXzwOb/5c
 htS9CsApkXUtpnWS5+irTypM4bqLAA==
X-Proofpoint-ORIG-GUID: 2_fKdMBIfORAv11f5P8A8k_7MvTGH6dV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_084021_016602_D6020CAA 
X-CRM114-Status: GOOD (  22.18  )
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
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 12 ++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 17 ++++++++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 10 +++-------
 5 files changed, 49 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 7a5887b5ee47..fa3ae725f389 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1331,6 +1331,14 @@ static const u32 a730_protect_regs[] = {
 };
 DECLARE_ADRENO_PROTECT(a730_protect, 48);
 
+static const struct adreno_reglist a730_gbif[] = {
+	{ REG_A6XX_GBIF_QSB_SIDE0, 0x00071620 },
+	{ REG_A6XX_GBIF_QSB_SIDE1, 0x00071620 },
+	{ REG_A6XX_GBIF_QSB_SIDE2, 0x00071620 },
+	{ REG_A6XX_GBIF_QSB_SIDE3, 0x00071620 },
+	{ },
+};
+
 static const uint32_t a7xx_pwrup_reglist_regs[] = {
 	REG_A6XX_UCHE_TRAP_BASE,
 	REG_A6XX_UCHE_TRAP_BASE + 1,
@@ -1458,6 +1466,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a730_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gbif_cx = a730_gbif,
 			.gmu_cgc_mode = 0x00020000,
 		},
 		.preempt_record_size = 2860 * SZ_1K,
@@ -1479,6 +1488,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gbif_cx = a730_gbif,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1513,6 +1523,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
+			.gbif_cx = a730_gbif,
 			.gmu_chipid = 0x7050001,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1554,6 +1565,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
+			.gbif_cx = a730_gbif,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1586,6 +1598,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gbif_cx = a730_gbif,
 			.gmu_chipid = 0x70f0000,
 			.gmu_cgc_mode = 0x00020222,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1785,6 +1798,15 @@ static const u32 a840_protect_regs[] = {
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
 		.chip_ids = ADRENO_CHIP_IDS(0x44050a31),
@@ -1803,6 +1825,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			.protect = &a840_protect,
 			.pwrup_reglist = &a840_pwrup_reglist,
 			.nonctxt_reglist = a840_nonctxt_regs,
+			.gbif_cx = a840_gbif,
 			.gmu_chipid = 0x8020100,
 			.bcms = (const struct a6xx_bcm[]) {
 				{ .name = "SH0", .buswidth = 16 },
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index cc969145f612..f9c0c82b5136 100644
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
@@ -964,6 +966,16 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 			  gmu->log.iova | (gmu->log.size / SZ_4K - 1));
 	}
 
+	/* For A7x and newer, do the CX GBIF configurations before GMU wake up */
+	for (int i = 0; (gbif_cx && gbif_cx[i].offset); i++)
+		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);
+
+	/* For A7x and newer, do the CX GBIF configurations before GMU wake up */
+	if (adreno_is_a8xx(adreno_gpu)) {
+		gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
+		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
+	}
+
 	/* Set up the lowest idle level on the GMU */
 	a6xx_gmu_power_config(gmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 029f7bd25baf..66771958edb2 100644
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
index 031ca0e4b689..cf700f7de09b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -46,6 +46,7 @@ struct a6xx_info {
 	const struct adreno_protect *protect;
 	const struct adreno_reglist_list *pwrup_reglist;
 	const struct adreno_reglist_list *ifpc_reglist;
+	const struct adreno_reglist *gbif_cx;
 	const struct adreno_reglist_pipe *nonctxt_reglist;
 	u32 gmu_chipid;
 	u32 gmu_cgc_mode;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 2ef69161f1d0..ad140b0d641d 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -500,6 +500,9 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
+	/* Increase priority of GMU traffic over GPU traffic */
+	gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
+
 	/*
 	 * Disable the trusted memory range - we don't actually supported secure
 	 * memory rendering at this point in time and we don't want to block off
@@ -508,13 +511,6 @@ static int hw_init(struct msm_gpu *gpu)
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


