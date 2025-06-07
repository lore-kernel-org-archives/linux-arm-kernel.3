Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB0BC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 14:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoPAj24rANcl5QX1l3xvSVHABOET41gWukC6+LZv+Rk=; b=HvQSiNnhYCutO0ieD097+QEwbD
	sjwHJyt1joWIMFc+90V7LyJQAsqjRqfsL1hUcv+iqKetRARguLUL6we57MVTZeq1N+vOv+h0kLwyC
	upgwlFQRWkuRSs7dRGXyagOE7shBbdr+Im1YLRziSs4GpJcoBe26+BKojS2KcdPmNpwOu4edZIWW4
	jcrTlPJ269DV2yqFvvDxUsxznd+0juPRLw2euU+6PGDXskX9seVpqcS32Nfqwzn66dc0+ug4ixnhr
	mX+n3pejKmbVnDq8SlUaOEQ5PE0LoZypThYMlEXQB5sycAdpRtyT+HcyuJYwmftJm24GZVnqV4vHp
	qLTChDOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNuRN-00000001l3a-2isY;
	Sat, 07 Jun 2025 14:22:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNuKz-00000001kZf-2kw4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 14:15:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557BXAs9025612
	for <linux-arm-kernel@lists.infradead.org>; Sat, 7 Jun 2025 14:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RoPAj24rANcl5QX1l3xvSVHABOET41gWukC6+LZv+Rk=; b=B/bvI6XiIRUGJm8E
	1KEoSC5e66CpGY+6d174bfC1hO/7oWyqxPk/cxVwAwwABoC/vIa9ZqPFvHUXSylU
	kp7W4Crwn8eC5JuMvMo5nzZsz/bwE/cqy9Ql/lBk1STFjLpSnVeneg91RfUigKEU
	qFfFfNSmTNkDFlj3pYMSSdByz4ciL3dDDj0aM3p0zL0fobgcAhW33E75NqPhz+Nj
	7vBZdl3cEkUTdW9YzvnJOUq8Xni08WDXJdOXaDzgbNy7S4wnu0alPB5wmo4yxVFf
	udTXlcHGeAxfTzQv/1IiLiF9hBDiYIUkTnj+QZoG0K9SHnCU8EtaFfaiPQh1K+HR
	el/T0A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6j8m5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 14:15:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311d670ad35so2828169a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 07:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749305756; x=1749910556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoPAj24rANcl5QX1l3xvSVHABOET41gWukC6+LZv+Rk=;
        b=NH5ezhUgCiTQkzMqocTz+lFyOe1ATqYvLOijg61HlXCF91pUszrKrY/d8UFIF/O1lY
         J1glTn5pKdq/8kt0qdEkDf1l8zE9PhXm1mMXFi+tlWtjc/GTXgm/E6vJy6XsafhF6o0M
         5Tqw4bRzRy8oMuDIaPG4L6TG38FIuvs6kY+FH7ABhCOnp9AaEx8q3TJusJkuY33+vYkA
         ZnAl3tssioVLm91IP0bUj1TvuSCa9l1XRxqYAB6W1GtVHbbOOeX03ep+Sk9+UJkf8rpx
         2WpPTfgldL3jAngG24gG4pV8qgmPqsiFQgalrNvQlM3UOrK9n991OSv+xBzcZMLaSm6u
         BBWg==
X-Gm-Message-State: AOJu0YwzlD6GRiwa0V2om/C533dkU6ZOIcjyF7/HlydPfXydj67DTaaV
	A1bRp1tbSV5zxMLsjlOO+eacnndyoLfXxyoy/d8jwg8ZC2Z1RifQ8nwdWHDsgdEzw6K1hZd7r+N
	0fCo+/ey9Hc1YENEi7NcbgcP+Z9rB8DVAIeT/IikXNib7Mpo8Bb0zogwu6fYcwWpf1WLsCCCNVA
	dyC3a/UWMKjA==
X-Gm-Gg: ASbGnctM+BVEdQYHjPziJV70aD36Iff5nQ6jJWrnONIRnwALDGwCNUdhtqKEUv8A5GU
	oNyXWGnPq3hk0k99ziJCqzAXDNgWkB4dfn87xmoD9cAdbm+Ltm9qx+CQ5PWshRs/Ok0YikocmQm
	cLQ/eRVdwxLfmcJICvZSawsSwzdG6e7U+IT5FVLHOWdhHEGmvoijNJoe5LI4zkIIT3JPb6elPeG
	wJ7ShCIr2zuO2/1x2gyzrVbrR0Jn1EilJCp7mn2EOVSIcGO+1T9ujz0WMwHYYSatBZAulT2UVII
	oRF/x/DuUSm8d/1A6EoqhQ==
X-Received: by 2002:a17:90b:3506:b0:311:f2bd:dc23 with SMTP id 98e67ed59e1d1-3134740ab57mr10429740a91.15.1749305755792;
        Sat, 07 Jun 2025 07:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkvgNxf4i7eaFV8gciSY1TEWEqZHtGfJkioV1I3JEgDycgT9Fb002tmr5zfEQLdgdl6qQZiQ==
X-Received: by 2002:a17:90b:3506:b0:311:f2bd:dc23 with SMTP id 98e67ed59e1d1-3134740ab57mr10429661a91.15.1749305755008;
        Sat, 07 Jun 2025 07:15:55 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603405732sm27500435ad.155.2025.06.07.07.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:15:54 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 19:45:00 +0530
Subject: [PATCH 2/3] drm/msm/adreno: Add Adreno X1-45 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749305735; l=1894;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=oPf1vrGDHAcwS0lnY7K2yLQPMKwWkbyxLNEz+EtlmqQ=;
 b=Rtb+J/Uc9KqX4zEqOybb0NgOAX9BBtfxOnJaOBVeaq7UwfCOezjPAEZDGKLncFvUa2/eVR+KO
 IxqmpR9hO/1CczmdmW9aD4svEJuZXtzcb7Jc/JC3rqY8bAM0iYniba4
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=6844499c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=25T8ekUwwafyqMypFLMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: eD5lI44_aTBvobcsqW5DoVpJCFH0anEU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwMiBTYWx0ZWRfXzW47yltBSqRg
 TsDC1TuHKLEXQNz8XFKRCtWjZ2mvmoGwp28d2IcMwzsPVs6nF4ksWsiAQoTGJNJ49fJZFckxO6p
 wmuVSc6LmfGBQaVvTThjdREBM+ATgD5qqieYTtZc8QrvCKH1q7LUPpaEOW7xCt5AlxSEM/j36N0
 s6e2wURJLRxM45H3+h4yugn58tIUTOqkSsY8RyBJZft8s4FKb1ka8N2fCxWCZdbox1Yw1j5wRq4
 k+CG+UYPzpd9ep+fgkm88g0ZMIx+IPongRKPXVus62pcITrFSSyThWee7ZJRj+L+85v9iaOChHr
 eqyblo8zyrN8IMNTYwG3lSTJtAZSqzGHMnkYLHgSW3qa8IGaAXea92YzgeCSBWhnvrmmO/Vu2eD
 S2mucE/2auq11TKK4JGK4qTaRVLBT4RDA/J+Tt1/fTmd+QaLraMQVBGzOib5OISYfmOYDzSY
X-Proofpoint-GUID: eD5lI44_aTBvobcsqW5DoVpJCFH0anEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=976
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_071557_703617_83E5BB68 
X-CRM114-Status: GOOD (  16.54  )
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

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 70f7ad806c34076352d84f32d62c2833422b6e5e..2db748ce7df57a9151ed1e7f1b025a537bb5f653 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1474,6 +1474,44 @@ static const struct adreno_info a7xx_gpus[] = {
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
+			{ 141, 3 },
+		),
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);

-- 
2.48.1


