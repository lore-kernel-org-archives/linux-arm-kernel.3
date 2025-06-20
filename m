Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5606C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 07:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cra5HUnd+Onw8p9cvyHZDcLODFatDJov6W4y7HTf2Q=; b=fqCZZJcutHxFVC5Y4vwLHB6xLG
	FyS2S5if4NKqKW+Ms7ncBQ7NcSqBHbeII/dTdnASeuHe+19mzAt3Q2QzswJkRlVmF/afZN9QQSfzg
	NkO2LNagtl2pift50X+g2bUmikC90GUSBm/8pF/79kc/9C6D0NU1ycqQ1u2J3EvWqxCD//9xPAcY2
	1pAzBQWsIfv4SLSn7rbGtM+LfJPiBLwGMSmm1aigmG9YRoHo734QmIlxEMudKEiL1cdxpt5bIAw9E
	NeBPiq8vdCPTHX6n7TXC4QNYYU8e5e6NDUGLnsj206UAhz38sIEq1OkZh8o2Ng3z+EwU4D7aGoQec
	S27KmlqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVpN-0000000Euzn-27Y9;
	Fri, 20 Jun 2025 07:06:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVep-0000000EtwF-0u8u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 06:55:28 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K4Fwvv020814
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 06:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/cra5HUnd+Onw8p9cvyHZDcLODFatDJov6W4y7HTf2Q=; b=Z7zW9rHgAvjhnm+7
	kYL4yUZtbz0UIW6nnqrODR/VmfF+4C/5FGxkDS/zx7TzGL8C9Ct2iiAdlwdUKpSZ
	SiAukqYqYzbaxcmKz4RTPXLA74cmmJNFYTepJ36kl/Ew21UnfcnQw3wUO7LwPE3E
	w+5A1jmH402taX7tIQjYAY9JjCgmshTMMQAW/jzUi7xFIcCsfxGstp5AKbgJitbQ
	SVWfbuzSyugfgB4/jWj98hadZnGarfXFrmDy+CI7pw+cXYlyzMIK71KxJHTB2nkN
	S2P37muGUrtu8FvQ+BzKlYl1gG9jtEYfhRGz+lwHnUPZM+O0j1DvBunp3V5nHH52
	5X/gmw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enta52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 06:55:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2369dd58602so14371575ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 23:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750402515; x=1751007315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cra5HUnd+Onw8p9cvyHZDcLODFatDJov6W4y7HTf2Q=;
        b=rnodXKJ5uZ/xIUWWoB63EqBhH+C3WYD7QNsZa6QpKGyfvIEVtwjmYbkJmifQEWDBNc
         SKMcfQP+zTKrGABf+zY3edR3nrIyvykUGUodKjR2iKPVwLsZRV7wOlbzpxMalCRSEXro
         Sykr9xGkv7+Wumsc/tFrGaztRxCriSa0+vC8axunuw6lGnVaBlrm+lVkLUiwab+2W8mq
         xKxzyF6nLZSEoNg6rbvb3ieCMlrMtWYw4vX84JL/MGPNEpOuWvAzyaU7EGl4S908KY3T
         Zm9kdsme2Dh/6JhxumE6pXSiW63O/0py0Zn7SPi8bTY0e03eAKoVOcy0ceW3Z0u66Wbu
         FOmQ==
X-Gm-Message-State: AOJu0YwWMW0CI0DYgPLHLZodvNk0hpGNk9y9x0U/P5i+B/3knOKOD76h
	CGDCpiy5eLqdmL1SCjSVR+c2nfpNAhH2QA5V9aQJ1pMSj0ZOv4TQI/41r3fdOXvJQgH9soKCV2U
	HDq9lFKnCetvUAh2V7UUIKTths+MfECmLx28+j9Zk6eeR+cFVJ2rssiHsiQLdJI/kCPouei+gkI
	6u4w==
X-Gm-Gg: ASbGncvsJ9TWv/5/Bq43GtOGMwKg+xulEgfee24oKW++JapwfQxCOllGEcNf9lyVgPa
	AxHnuCLnIPe1pnzApK3gXLUS0DioS6MNmC/RkxSq5M4LPNDjBZzjN+V9Fz3fHx6Xh8qRbWXJ0xh
	InmAGxo5eFN0tkTpIfUDqRFKBVutvrmdQVHCfYjnlftZUmTdpFhGARHNKZpG9/nREZawIf3P3DR
	jOaSzIeIrb6iDmmO/Yx8wZyGqevCREojmclLkNDnuGHzaV8CF6clJW8zBVfKxWGJdiWo3EO3FN/
	Kjtj6aj/0KUpixq/wCCFDc2mNNqzzP5Z
X-Received: by 2002:a17:903:1b66:b0:234:c5c1:9b5f with SMTP id d9443c01a7336-237d99064ccmr28616745ad.16.1750402515075;
        Thu, 19 Jun 2025 23:55:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiXAnjhsU81dzFSNF8XeE5n0aYS1wi4Wc4hIGCqzrClvvAQg3nAWi7A56J6kwNx3saDQ1gfA==
X-Received: by 2002:a17:903:1b66:b0:234:c5c1:9b5f with SMTP id d9443c01a7336-237d99064ccmr28616285ad.16.1750402514633;
        Thu, 19 Jun 2025 23:55:14 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8701c0csm10636185ad.223.2025.06.19.23.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 23:55:14 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 12:24:30 +0530
Subject: [PATCH v3 3/4] drm/msm/adreno: Add Adreno X1-45 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-x1p-adreno-v3-3-56398c078c15@oss.qualcomm.com>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
In-Reply-To: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750402486; l=2100;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=cb1ncv5kKe+9beezyK8P8PEh4cB50d4o5qsPw+1gBfI=;
 b=6DsTJ1+fRdhEPD5dnhpU8R/Gz1ebwrb9QGaqZxTAvYnxQjpNbqZZnZeVEtrXDr6XOrbHpho2d
 D3lSYE0SnesC8otPnX0urguqEuklaUZlab1toQoIuaDx+Bast0rjRDM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: -azARytyMKTjemPHZmnLcZBNO8teYPhn
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=685505de cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8
 a=xcvD53-FQScLkYWh0o0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: -azARytyMKTjemPHZmnLcZBNO8teYPhn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA1MSBTYWx0ZWRfX/sNGicrnvjeh
 KYdkhSOBVYCbAoITeckPqerN3gecg02ThUkASO3pza1eBYGqoa5/er0gBWumumHhdwzmp+M3dWn
 lx53rlYfSUJx1qtxRWH9yHK+6XPbmzCz72Kn29Q7fX6H98uX0xcVKw9HitXlOMG64fZSJ6DrXZk
 l2Z9R6gK3aAN046kxk7NTfJNDpYAEAg1OzMqa87r60w/kAXjAgxEYlRvWONtVY8Sy69vGlSa43E
 i9W1gEzIX/A+az7V/8j+xYfUR2xnZxVs9olb9VLNyKcJqLnkjjghl6k6HNT+ST01rCywG5BbPQC
 qZmz0j7IIInlSSZSm9Iu93Q0DOT2+mf0q5SsHkHUmjxPY1yrDzEZ4r+mo5edFezAf/bv4/eEl12
 QjAli6DUO9VIqc17rrKzcOasxwJEDCTVD1q9PNZFxKqHR+PpYRPbHFLQdvng/g8NB7kpSzsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_235527_390433_243BE250 
X-CRM114-Status: GOOD (  17.31  )
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

Add support for Adreno X1-45 GPU present Snapdragon X1P42100
series of compute chipsets. This GPU is a smaller version of
X1-85 GPU with lower core count and smaller internal memories.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 70f7ad806c34076352d84f32d62c2833422b6e5e..7748f92919b883bbcea839a61158ab52e6e4e79d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1474,6 +1474,45 @@ static const struct adreno_info a7xx_gpus[] = {
 			},
 		},
 		.preempt_record_size = 3572 * SZ_1K,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
+		.family = ADRENO_7XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen71500_sqe.fw",
+			[ADRENO_FW_GMU] = "gen71500_gmu.bin",
+		},
+		.gmem = SZ_1M + SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
+		.init = a6xx_gpu_init,
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a740_hwcg,
+			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gmu_chipid = 0x70f0000,
+			.gmu_cgc_mode = 0x00020222,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.preempt_record_size = 4192 * SZ_1K,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 294, 1 },
+			{ 263, 2 },
+			{ 233, 3 },
+			{ 141, 4 },
+		),
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);

-- 
2.48.1


