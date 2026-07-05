Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4839FC44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzQCh286Vg0S8d0fqoIRZWO4vh9rmDpADQm1Ym6AjIk=; b=TB+pNS98kRYhLK4b5kP5A6Hi5y
	Xz8RTcOVXMtg2E4Gq0cZzEjrHDNx18osh2dz9KGWewRaTA+zyutDr83ZcxFgMTo3vfbH5FFa53/DP
	QYtWkQT6zKYSSDwTDVHGSZ1233t0vviAgZea9+AFmoFl4zz8xw7byFq9O3w7tKEjw0pZPPGkTd827
	BPV9lRCc9xkPrIR7tUrLAFzDpw+Al4kUsiwbalO4yGFhNGO/jOz6X97M97OCYEeMj7zaRTC3ady6H
	6Ygrph++DIm265WXrrWUyLPZByEqwG0jOm4eo3ZptKvbObz1BYtwD3ZwGTLmyfFrNgZmksXi0rVr8
	YmmyGjJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHmh-000000094sn-07Bn;
	Sun, 05 Jul 2026 08:01:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHmd-000000094rd-468R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:01:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664Nt2SJ157149
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 08:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VzQCh286Vg0S8d0fqoIRZWO4vh9rmDpADQm1Ym6AjIk=; b=FawQpZ4fFI+jiPuK
	vx9c5ybAs1WcfqZtTaPGNDX6Akk81RRfV13sdz6DILVqBgDHkBzM8jTBXDvfDWOw
	4A3yUw7iTUqXUtdYCPY2wXwGxp/8gdPGxAmyR1t0Wez7Bg3Z+0SR+/9NO/RIxPKt
	NEsJebZGJN3l4oOuAWSOklB7ZlFlNV9WEQU+m9/mZ9ZWGHCZVGr/60rGhupFLusB
	F0KGFgTZJGea+9UBdjgKoOlx60c6jkQdfqDXDq3qwf3yRUX7GEdUs0rzWNp3RjtR
	IvV6neX6pnWlD6BpRsLhOeviczNpkzxDf1zL7qOfsewArvRB6OIBzzgRI4Qv49Wt
	4OT3Aw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8uj9p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:00:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so2304640a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238458; x=1783843258; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzQCh286Vg0S8d0fqoIRZWO4vh9rmDpADQm1Ym6AjIk=;
        b=D69NjTHaForqdm037f2mRqr+KIwiUJzpmdGYccLu/75Zb2AmrXQIUWXWviI7LzGHLB
         AgBQkfSHSN7x4Q8nzhKgBKN3cSGzokVJzIr1PFmvMxsan2c0i0iGc5R6aKP8eTb0ZHj/
         9UpctFyTfuKY0OJuMEGlx1pQPS2H6P4Qk+cVMGjy9sOpewDLeuFfsnT2afJTt9GTA8XO
         yfHPj5UcPYNNGpR7hFp6cdCSfDW9mW/EHTvYzZP+yYj5SNBKfx+7tQr4e8idfQLM2HG1
         KyzuLvP4IahCNE+NHFb0GZmiEF/kuuVFYzjcFD0LYtCb/3+0ehH/JpgXuDolQ1p+UfsM
         1A1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238458; x=1783843258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VzQCh286Vg0S8d0fqoIRZWO4vh9rmDpADQm1Ym6AjIk=;
        b=PBvGiJLTEMsB/iWeSD+au4ODGxpcDpKrv9MDtDuQ3Fk5+zEQC6vKe9eADIAstHAC8X
         YShMeEyEUnGtD5n9jyjvJ2gasNk3ingCboZf8idPsOzdZYVBz+fL1h15j4mNfqXsxF1A
         reMmmXNMYwGcMugrAFnqa/x6zCIMn9HNAx/dycODcmyHG+XjC74MHqq3S+iEVrVZiQ9J
         DBPIvt/FiSOk/o4xZB0mkcOX/74z28iVz9dnRUZKyauDc6ZERj79KmqDs/Xqo+b/UyaF
         j1RjF03TwOEmRm6t6tbbDhykB4sZAKaeCBEUkzLv7B7b4gTogjx4DB7jGziHkHg5IBNJ
         Zhpw==
X-Forwarded-Encrypted: i=1; AHgh+Rpt18N5rz9CtYXplgTJvL/6kcQ97ZiD0NIhl0H+5ozoqRrN4TQWfHrcFXuPszui8JD2LcLrEAvl5zyLC9IzpFqq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Lvzcf3n8qTPeaucqIhV2BefLKMe5T2A/jitV7eEnomNMmn7A
	NAIPmT3XFzhwmzs/tgPwruPKKu/10rXasSRR9jNKwlYoiN+oYwdpm2St09zmJBrl95JOiUInTzd
	1u6zi0Q4LwDHQi0+qryGy1CrtdYPUya074LSbTdXKd4MAMcL0kuI9EyR52VdJYUEkJMwiCAq+pr
	cwSg==
X-Gm-Gg: AfdE7clCCeqtm4ps04+yK4n3nbrP8+1DNEUEuuH+FAbCWTRtI3LMwfW9RhIjdSBNVUo
	y4+SQCEEceBzw0C7i/ur5OypB7Ldy/pGEN8cRcDbk3pdXKF/xxbqHVAMzTEET2YW/J47iz4LOga
	YiCnI/H7Gz2BVxOHQgNZvPkrqdFVz20TVjS4rqdsxAFiv4FFjEI1sY1o7MvfaLPJWVQ55njuA6T
	meDv9JVJsOtQdVoG4wMZgyogDPRSRfXMP0njakF+ALfQkQcnXoCl3XsxY2nlpxCh1wB4wtBLLJ/
	QIfEZq4GOldF+P5uKq5KIQ8YsIfN0e5gRwmgzWCKc22JjD/aRITXhiwV7A8o112zfQhfWa9vxNa
	C1hJ3kxG1auh3j8gNMZUK8VpDVTgW5oo8JKY=
X-Received: by 2002:a17:90b:4ecd:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-3811238f60fmr10862377a91.18.1783238457455;
        Sun, 05 Jul 2026 01:00:57 -0700 (PDT)
X-Received: by 2002:a17:90b:4ecd:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-3811238f60fmr10862324a91.18.1783238456864;
        Sun, 05 Jul 2026 01:00:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:00:56 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:05 +0530
Subject: [PATCH v2 1/8] drm/msm/a6xx: Increase HFI GX perf level limit to
 24
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-1-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=1999;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=3Byd2iwGy8nbSKXVCEt6BL7u6F87e2rKPSvibHz74Wg=;
 b=tw/H1MbksYZS+PlUsCOdhIVPmvoITEFmuWZhx/fspqQLWZq2Uz+hdMwK37lq55MF8qglQRsta
 7jMqHdoWGJLBZrYt67Ukusw7TuMk9Jvgcz0QFBu7VPGvZi2gEF1f0ry
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: s-1tqZdcTqHLXwAKR8Y-DLZlF2HUzTnD
X-Proofpoint-GUID: s-1tqZdcTqHLXwAKR8Y-DLZlF2HUzTnD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfXyb3RKvVY3T3p
 jJcXxZaA0FUJ5cpPcYop+PQ6w4GpzUlUT9FXeOCWr1drSACh/DaOlHneUCZWYgif2HB/1bhxKI5
 tB7mgujAG2Q9eUp7kvF0GhjM/9/qk2g=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4a0f3a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bjN1K8ZYlNTK_pBii84A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX0RKWA6ROx/Fp
 LZvvydsr0X+A/NmheQ9JR+rLWf3qazUXJbVcCWU2PVEvHes3vsaDY62rpOCc8m+4LgInGJp0rLR
 IPJyD8PCvl1DaFSYI0uHzll3JFVsZ5sMzsKXlkAh8lCXVU/nxbhmgD0IJkBWupt7OPkyYKr5mEc
 pWtGcPv5GsEk40q/hXi22nd/pcbJRBASNIEDbv0OTKYONIDbV34h1JGEjw3/onJgpVVRyt6QhJB
 4c2GUmI4kinRfbWTLzodqkjUZgS1R/GhbZWaypE3O0rsSnTBjZUvzRS2IdOC4zRwIoqcQHhXoL9
 a+zxsVfkAgo6ChdNrKRivKFPXz/VoEk6GIcJ0UHjtFalp/a+6kzJhGUFs9BWqf91GS5AfLwyhIT
 X+r0bjYMBmPUilyE2TKzDVDHCxTr55vnJY0wLI3OZHNqTmwuRaCPebYErbVMIdNXjXnKG672OYi
 k+CSIIc21A7832cjtrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_010100_308773_D40FAD61 
X-CRM114-Status: GOOD (  14.74  )
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

Newer Adreno GPUs expose more than 16 GX frequency levels. Introduce
HFI_MAX_GX_LEVELS and use it to size the perf-table and bandwidth-table
GX vote arrays, and to derive GMU_MAX_GX_FREQS, so these levels are not
truncated.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 3f96b10b5f61..62e3fb230cd3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -20,7 +20,7 @@ struct a6xx_gmu_bo {
 	u64 iova;
 };
 
-#define GMU_MAX_GX_FREQS	32
+#define GMU_MAX_GX_FREQS	HFI_MAX_GX_LEVELS
 #define GMU_MAX_CX_FREQS	6
 #define GMU_MAX_BCMS		3
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index e10d32ce93e0..f4da73a555c6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -5,6 +5,7 @@
 #define _A6XX_HFI_H_
 
 #define HFI_MAX_QUEUES 3
+#define HFI_MAX_GX_LEVELS 24
 
 struct a6xx_hfi_queue_table_header {
 	u32 version;
@@ -119,7 +120,7 @@ struct a6xx_hfi_msg_perf_table_v1 {
 	u32 num_gpu_levels;
 	u32 num_gmu_levels;
 
-	struct perf_level gx_votes[16];
+	struct perf_level gx_votes[HFI_MAX_GX_LEVELS];
 	struct perf_level cx_votes[4];
 } __packed;
 
@@ -128,7 +129,7 @@ struct a6xx_hfi_msg_perf_table {
 	u32 num_gpu_levels;
 	u32 num_gmu_levels;
 
-	struct perf_gx_level gx_votes[16];
+	struct perf_gx_level gx_votes[HFI_MAX_GX_LEVELS];
 	struct perf_level cx_votes[4];
 } __packed;
 
@@ -144,7 +145,7 @@ struct a6xx_hfi_msg_bw_table {
 	u32 cnoc_cmds_addrs[6];
 	u32 cnoc_cmds_data[2][6];
 	u32 ddr_cmds_addrs[8];
-	u32 ddr_cmds_data[16][8];
+	u32 ddr_cmds_data[HFI_MAX_GX_LEVELS][8];
 } __packed;
 
 #define HFI_H2F_MSG_TEST 5

-- 
2.54.0


