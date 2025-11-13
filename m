Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C9ECD98F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGGfQ+tgLcU0SwBwQco9Wli6+1VrBRCLwj6tuxnqYmQ=; b=cf+w1IaL250t4+f5onWELsEFD0
	vJRoT6So7gO9NvKSpmnhMHiACzqN8CcZ76E4NEzKlsM6dqUsbsV2DPTIzp2oDaRQraSBPB3ytCOJI
	XdFD/Kv1jN0HkRp2de+a+ObMQs9GcRR85fdONtqHsh+PvvDo45EuJkIv5HAtOGsyuVUBiWB6A7ND2
	YJY2VZkd+6Vwho27JhGqdr74u0TI5aAKiLB/C1W6DvE6ys0uq/7GIllkw1KEB5dm90ZSRKgpyC7+x
	814vLQ9LpapEW5JTpzcWQ9j7ijrnT74HAhiv9KqCXhtmg19Wl6Cb/wS88NXn8FFE9+ANrfBwa9qEZ
	5uERQeWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJglX-0000000BGbZ-3c9B;
	Thu, 13 Nov 2025 23:30:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJglU-0000000BGZI-2jDW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 23:30:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMarum1582950
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jGGfQ+tgLcU0SwBwQco9Wli6+1VrBRCLwj6tuxnqYmQ=; b=meHSHRFkwINJu9p2
	ci1j8tDXOJnxz328kucGEK7PVSr+WtvS3Ls1Y2H3KmMsWr7+W3zpw1QIz2N0OTdr
	+z7yxCX/wL+2k62V9hwW/bCAHDn+vKNWjKgxmYsAvWEhLEHGgxNl+vQcO6f2sciL
	Nh/DZWJtBIgU5BwhFEo9wil/v4Wiy6o4Dm6VqptQHBml6gGMtIItlShm7z8hlJQ3
	WWYdQfDEMKGRvqkMv2Fu0C3oEULwKVxT9qmeyueuYRWOwPDfU5ci+6uydHqoM+ej
	vCuBEpqBYyjJVW2wMPwv015i1ROtDlAzmgCDd46qgtEvHu3SE/x+JQ5cjc7fc6P1
	rpBc6A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9fr43s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:30:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so1456107b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 15:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076607; x=1763681407; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGGfQ+tgLcU0SwBwQco9Wli6+1VrBRCLwj6tuxnqYmQ=;
        b=dWwNVf+y0zTTmg5EYh58h5H2Ksp1KoiQKqBVyJ0/44f1K1jngA/gS/Q/y8Fnb7GZiP
         VsqGccdeUybPx7CDA78ddWnNImRXexd5GThm612/ynjadtLYaFD7C5ZCKVoPp+HvdhDW
         1G1lSoeYove3hnCfjaqmiDFXe7e/2X5Iqv52VGCxniUKGrX4HD8uvfI09fZV83ETIiV4
         cS1IReMTeU2UPUsxkKudNn6bl/9VcJn2OQBfTikR+BY1xlZ0aXn4f9ON20Wa3rcUEKR7
         QRxdd3oi8WEWlyyLpAZd6+OEGiCXNJNLBCkYFi7jn8wQWrY43N4/w3dfaJN9cWWmp1mL
         v+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076607; x=1763681407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jGGfQ+tgLcU0SwBwQco9Wli6+1VrBRCLwj6tuxnqYmQ=;
        b=HjQH95nff1zWwGRPL2gilYlLjh13ILx3+QslToYwKHZgQnxmaTqRv1rkRq2sbuljgF
         bYid5yy1imqro/ZWvBUsF/ZqbC1CoGfS+jp9GTjNeoxw0aTocL/MmR6nIGR/eBaZpmX6
         BvpI2LWlnYqgXrtcn1TBLVKgXiWTLBvvO2BKXseB1r0i3eRP+eWUW7EmaDEZCUxSqAwQ
         olb9Obnf5GUzHOOK4aDgaH9ypoGIjd3fEW4vYD7ECbhK6/rRrhDBH0paSch7InN1ExsK
         sEL19utzbFQUF1DR45TkQtqEb6o/xZOlU0PYhyzHQHtvV6D0T0UvKkukuiVlZkpXfzIR
         i7PA==
X-Forwarded-Encrypted: i=1; AJvYcCUpGYtj7rHDfyT9I3mzWBgaUUl/3UXajJWK3nW1vL0sZP+YdYu9HEt8ONUMUZT3fDT991PC+L6DdvcPms8vTIKY@lists.infradead.org
X-Gm-Message-State: AOJu0YyMfP8Dlq67nGb4PFs89XUSlNJ4SMv9/VeYUgONkk4st2ll7LV9
	79B58bfxaSV6Yao/dl8J8lOU71BQFofBlm8k/9V2zDE1JVkiE4G5MMY0kCeRXPFmZZ29HaG5u+T
	86gJBfwrrQLtcJ54yZ9oR8kxBtIl20aTJ3Yh+QleEMq6hGCpboLu+/4osgx7HLp+PCyLMkIXPTM
	Mf8g==
X-Gm-Gg: ASbGncsIQEcSy2frPur9vtoItHH0ED7YTQNtcCJIK5aupInsQaVAfREbK8rbd0m7arg
	7sJJ6OGW0wzSvfvPowKUxZmxGaIFevKSFNft5D22d701q7vhWXWBLMGr/fMnAicpuu1COrZK2OB
	S4Sqm391AkFlsJxi0oVVABvrN39CKzRozWdd64Xnm/7pNxBWAkvFbggjZrr1cKyUyzej8X5ygsl
	FLx1CPJL1lPuPGHgfeOBqcd+lh+H4F46IX0D6Fya/Dwc8TNBFAw5+Xnfhy3bK3j9XjA3XglXYSU
	P8AIe097GGCoRV1tQBGdpHyV0g07lb7lspDJlJsmo5GDvfstWKALecUn9Qf7z5BrutjhnmON6WE
	nhelBH2syWEsE9dIKNP/O98c=
X-Received: by 2002:a05:6a20:7d9f:b0:351:d6ff:dd0a with SMTP id adf61e73a8af0-35ba259dd93mr1575458637.49.1763076606616;
        Thu, 13 Nov 2025 15:30:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqb9xTf/1RdUkSb0wiuQ/LducqEzVd/Avvst0tIrciZXoTqPCwdrblFiddRcVRxAW8PRxnIw==
X-Received: by 2002:a05:6a20:7d9f:b0:351:d6ff:dd0a with SMTP id adf61e73a8af0-35ba259dd93mr1575387637.49.1763076606061;
        Thu, 13 Nov 2025 15:30:06 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:30:05 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:00 +0530
Subject: [PATCH v3 03/20] drm/msm/a6xx: Skip dumping SCRATCH registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-3-92300c7ec8ff@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076573; l=1280;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=dtSwkU/2MTVLwCFlRqqTYMozfSVMz5AGTKvrJ9IlCNw=;
 b=pSCBNHippoLHyPBaZa3ZDzn8ibiYCS5gdO400/t3T9Sn9xouKFOuo4y+vrWWiMmy+E3FJYp4X
 6WqXbKsGI6MDNSnLjrTIELBXTdLWZs4mQyMQrKTDeLZ2O1KboBgdl9V
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=691669ff cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rH6QHmREy2P50qlKy74A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: hQ_fd_qzt8fU6QsLATMbcVig31bwrRip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfXyCd2E8Nq+1Vp
 gZ2QSBc9NpbG666p+9d4K2Fp2PSIxMJsXJdCgAUwAm8gY0UuzfFR7kJFz0MhCRTXa7VcEABk5i9
 tqw63ySjic9QLV2GzZwZCDMsIwDWq69rB6yVX9teglvey/F494Wg/WG8EN6DLZzOdiERVMJZVr4
 uERwiuICdGoXehybSAScoJ/i+kaWrrt9dVM8dbW72wKqR90hRdo5wOTuNOMVPv1u046BvOLLd+P
 7Xfo/SK+QtOwp+gx7bXp+xnlSm+iPKTXXP4LLT7MVqCxw6sYX2RdVArJkQFBxlofrDy5SFvvzzB
 tGTWLtvMylcBFcH+f5ucX6L5Z2vLYyIq078HGZVHpirFUqAY7rj2/hW2dmsp8VmRsTmYtuAmVnx
 sB8rE50KcJeTC/YTPuePgrrOF3o7bw==
X-Proofpoint-ORIG-GUID: hQ_fd_qzt8fU6QsLATMbcVig31bwrRip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_153008_816982_DE73DD47 
X-CRM114-Status: GOOD (  14.60  )
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

Crashdec doesn't require SCRATCH registers anymore for a6xx and newer
architectures. So skip dumping them during recovery.

Suggested-by: Rob Clark <rob.clark@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6f7ed07670b1..0995aa1f7286 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1546,7 +1546,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
-	int i, active_submits;
+	int active_submits;
 
 	adreno_dump_info(gpu);
 
@@ -1554,10 +1554,6 @@ static void a6xx_recover(struct msm_gpu *gpu)
 		/* Sometimes crashstate capture is skipped, so SQE should be halted here again */
 		gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
 
-		for (i = 0; i < 8; i++)
-			DRM_DEV_INFO(&gpu->pdev->dev, "CP_SCRATCH_REG%d: %u\n", i,
-				gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(i)));
-
 		if (hang_debug)
 			a6xx_dump(gpu);
 

-- 
2.51.0


