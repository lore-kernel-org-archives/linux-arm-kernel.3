Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5711CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZwXB4RhWASSlUxI/fZ15AWl1OAJD3U3jm7GNFqQCE8=; b=F1/RZXgTXeaX+s0ReBilusNNgu
	PE/AwT3xWIqJwAZH9qvQG00oPDV7CL02/fgdZqqFBtIKBtA6AC0NPNlt8XcLfNln87ZCcn4qv3qy3
	NnV546yW4c0D8s1MB/HTrnMhLHKNQ5nefjDjBs/ihSdbpx0hAqhLjncXfwiji00Mc0KepN9lcN3im
	8BQ2H9REzPYehd+woaE7vD2owha8kk/sSkg/MY0SydP4jYbEXE9nttcHYLSEhrparKe3c2Z1u8Ft1
	pbcmMlGWmO00iicAJd+b33SWmnlATQBpiOFoenkwDijuSM0x/769grpqh1rIcNh9lLrDrfosFOjLM
	+EBax7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHRJ-000000005Hb-1J6M;
	Tue, 18 Nov 2025 08:51:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHRG-000000005Fq-2dzF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 08:51:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6fRme2343406
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ZwXB4RhWASSlUxI/fZ15AWl1OAJD3U3jm7GNFqQCE8=; b=VD5WjbSlg10PR/Zz
	pPHjDzjg5RAlNjJdXNcCt6EyVw1dWV4LFvu2W8mh0ykFKrqWuXTocWOi9yKp1+85
	nDxGFvum+YIeTDyDfQvwMgiB1bUmFsHpAtzcZEB9PB8zC7dclNmKyW3n583iU5m6
	ptG+8Ij9EpKJcwubisfQ5WJ2OQIVSE0C8L36wzYO4RHQuoxfDPrPOVU/2hlHhq7q
	lvEDunjlQN5X9WIjfap/UgCyipt559vM0fGTzyXtUJGYFvvtLnN5eu7bzft+Q3kE
	CQ9/VR24JHsBtFu7xV2FrGn6TAMFeJP/tDYVg7nULVNcsmlzNIarK3/po60Y//zv
	HslQvQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrn0c18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:51:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29848363458so142975345ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455908; x=1764060708; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZwXB4RhWASSlUxI/fZ15AWl1OAJD3U3jm7GNFqQCE8=;
        b=fAgkbytwxLvDQg0tVnxI34UWBXXoMxkxjJ3jA/FOVFOcOAtZTWfRxhEV549i/VmRv/
         9pw2ISzAphQeKBn5OgbV8nQhS4vYSX9eFRGcaiqx91DIIWiYNbfnJfJ6nI0Ux6UYWHLN
         ZPOmuznR3moBR2rS9kA2igYkGa9dpx1ud8dEyvEVGd+SYJj9ScceAYHFSaNLU8L1bAGB
         8q1foj75tPvfa1WOV6Ek5BSpCadXVSs3KgPNFKemilorkLvOLpM31e+/pve+IhWYPhIR
         v+pLPoGi4oOWoOauqIukR2QLwfhdZdUjBkj+9HpTGXqJS4SbvZsEDxhOUPb4gKeY3efK
         7FBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455908; x=1764060708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ZwXB4RhWASSlUxI/fZ15AWl1OAJD3U3jm7GNFqQCE8=;
        b=JThOMTpXoqatVOE5U3ogAXhwVmT1fRAttk/UNRLRBQsRfAL6NvA7XY85qhQmtkGhEc
         7757wrerhDMNdfL4vfRZcryTFjBgKQuIXpfBifDRmbOQbHjNZVyktkRnSPhXdaV++qel
         d50tdgDJ6WYJN4YPrKywktXGiT/Eyt2B0Bvew84gYbBVX/ynBZjkD04NjRaJPPugjH/2
         Rn9x3BsnJ47WG/4GuGJGW7IY9CFUrt0Z9strBrZeBL/ZAPEgmcevw2gBUQxxMLpc/kau
         qxtDNi8Fkbd453+WlDhAPUCPNvOu8Bb2OnvFPwzVkLtBUZXW2GNqZgs+klCt+tL5rnTr
         xyxA==
X-Forwarded-Encrypted: i=1; AJvYcCUd7R744ei8g00k8iHrBjBsBhweqoRnl3eirgWWuF+A5LDjQmJI7m3wR1iajprBvMhSq3LdWwa0GFUq9r6ttf/9@lists.infradead.org
X-Gm-Message-State: AOJu0YwtBP5BPDx4m0D2fOfFWfevvFYSl8pyXE9cXBYi0RIiOLYpAdxg
	9+cDutJlxdjW5xXSi4VGWiO9Bp61gqKCk7qMkPiQRz4whtTI/EoOHVikLI9FLtr5u0tiz9xAxl8
	LQVfVLVOcAH/icq5poOyLEmgiIinJKxyOYL5cxF3EIyA2c7SbN5JDM+KczwTmnCr8bG4NIoquM0
	FNEQ==
X-Gm-Gg: ASbGncuxRsCBMl0cuCOE2DtE2tY5dlBJOs3TyKLzhtdDpZgqxvzDVuAg5i84hXld39t
	6+J0NLw0BKwHSf9tSlWBLQW+jZ8K3ApgWyeSrLq5cD6l2af2y5vrpYdouL7YoyOeSCXVpipDzhV
	HDOoHYyFC/7L9k1Lf4trlPspq5fUpYr2cp+k0BoQBol6HExN85uDeOaAZ2eukYu3/w7G3YU0QAk
	FLwjQsDVEVdaepIqTXgRTA3no2RiVyOqWPT0Rk78ErkZt2WqIng/HfIQ2nSvIhj2X56AURwfhiu
	8tvyqea17cIO9SzbVdV3tvE4qFvvK3RWIIbHphpBlCAKkE+vzoK79ds5kvhQvZbMUKpzpap714/
	fuJOfxk/FE+nr0mfsSAlacJs=
X-Received: by 2002:a17:902:d58f:b0:297:dad8:f265 with SMTP id d9443c01a7336-2986a6bd2a9mr208182455ad.3.1763455908402;
        Tue, 18 Nov 2025 00:51:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtBwZUTiYtLygrybb58YIF/amuW50qQQNcGd/n0p3+CKZ3EeqPoD0tAmXoPQD31iO91XcZYg==
X-Received: by 2002:a17:902:d58f:b0:297:dad8:f265 with SMTP id d9443c01a7336-2986a6bd2a9mr208181955ad.3.1763455907923;
        Tue, 18 Nov 2025 00:51:47 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:51:47 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:31 +0530
Subject: [PATCH v4 04/22] drm/msm/a6xx: Skip dumping SCRATCH registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-4-86eeb8e93fb6@oss.qualcomm.com>
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
        Rob Clark <rob.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1280;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=/bkGsdPodJ4SkKP3xxQOVAelGLT5UoB+go22DhK77KQ=;
 b=Cu8W/7U4vntfUypSIoT+e6ZMqwHXL7dXJoM/TB2ZZ5v2hzpBwXrk0KoTeeYPef/fxMeMm2NbR
 A2soFU6jNtJDglw1G9wBMZQVrVwgL6mvZP4CKOGIPlVdXK+L2shNBIy
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: G-IMFIFc5tFSDeB1JSJL-c3lJQsl8B27
X-Proofpoint-ORIG-GUID: G-IMFIFc5tFSDeB1JSJL-c3lJQsl8B27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX62QAN2dln+8Q
 oGhk1dIUeqeeReZyCZaxnUj38tlh0B6CkvK3tgOtLsMk1do33XO3/PQTP/9XpudZb2oK47IQmLa
 +UxpnvoGf8IEBHZUZ2shArXKZLu+7wVYJFYPEw+GZOjiNmzFUGmUeFQ6opOQRClWUak0N4MZV03
 jcQTQ9izGKlVy/TkaTqvS76y4pRVFwaF7XzEO0eB0GJ4SXwMkjQcO2Kp18FRBSxqiKmK0CFBy81
 7Gzu/s+Tlp6Q2RqsAQdYj5YTcsa6b6+UjM86plTsQJodYZw+dI6id6ag+S5Ltk4DZbDT1PEKvLf
 klVCVIIZBdRN5am4JpZ6PqLDxDtiKyf7nd7T9cwGN1yXaSN16YEf2raRWWWS1zRYPqDX6n29Pnz
 JkO8TC3fAp5O1E9oMcpe770EwIkVaw==
X-Authority-Analysis: v=2.4 cv=L+kQguT8 c=1 sm=1 tr=0 ts=691c33a5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rH6QHmREy2P50qlKy74A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_005150_825467_81768DDB 
X-CRM114-Status: GOOD (  14.68  )
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
index e6393ef0fd78..c6b2fdb86c17 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1561,7 +1561,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
-	int i, active_submits;
+	int active_submits;
 
 	adreno_dump_info(gpu);
 
@@ -1569,10 +1569,6 @@ static void a6xx_recover(struct msm_gpu *gpu)
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


