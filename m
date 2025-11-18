Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BF3CEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/LS6JB3TR9Jq5PNnoArY9FVy6stZEsKrBfA/VJEO2c=; b=QvbfYqXBdkpcxsSwjiRFc6SEYa
	DJJllCxr26O4xqMfN7K73KT3Jl9MOcsqkn6fJWSGI+gcJuXbgHu/yRvur1m4cRKy9OJZLWYeveKXk
	rrOg6J2lWW0MKg6oSlGsg0LCDvvLaA3iiDwipzB6QSkkSZnDQO/uv0lv5cGl48nvYUobLk1stSLki
	zzTpEhk7tnunr9qZ6wSxDgbhwrGIJMU0Kep+p8r2SExbc67uibVCPnH9mMSSPMNikPQ7+18MjiM7n
	z0tP6ZS11+FnAPlUqmOzLwj1cQ3g86lq7py1vQd6+FcY3IbEmVgAKcgbn56q427CmVEh3Cx3mc9re
	LVsS7IfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHSI-000000005w1-2Hck;
	Tue, 18 Nov 2025 08:52:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHSG-000000005u9-1Yh1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 08:52:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI68reV624106
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/LS6JB3TR9Jq5PNnoArY9FVy6stZEsKrBfA/VJEO2c=; b=C6Wl2jGTF83SghDw
	cjpCfqtoBfgYeZlVvyVZyJymt5wmM6PXfDeqK/2pFfV7Tva0gu8TScDTvoOTH2Ya
	kIxiqmrzfD31BQHCiKybYdtfDmBxY4vPcc1wZnXyi/U6X6R+uNHsCTKu9/QVycOv
	2LchNttPmewBb5164oDXNA1jBU8emZyAGb/CorvOhTPd1XPUccfU8R24ulOHW0fR
	DRRYC6kZo3hrxloK9K1+RMccykIHzZq/XPVrvBmKYqjD8nahfqJsMlXnh3+lLzkz
	C31R3yIyWDNs6pAByqT5gTBxTmfmuMBqHLdcAgLutby8n7FBSOZXTdfI5hckgz+b
	P/Zovg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahf9spg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:52:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630753cc38so11399552a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455971; x=1764060771; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/LS6JB3TR9Jq5PNnoArY9FVy6stZEsKrBfA/VJEO2c=;
        b=bsQMaeld5D2LbJ8dji1e+jS6CSCbMsi/cXjiUj9jW8J8H1Jm4Jj3DzQHw1rLjwxf8l
         rihM4bvwqFX0RJCxTcD2VAt+xA3i5F1KbHXYJG3ufK+zI1Ygt2ZusUu5QDqSp1PbD7K3
         w3wwpTS39W3cVUraSFXYx/nOZwYbBenGU1bi0xJ5zQxlrnRMnMbxhj3e7NSWOTbPOsn0
         VRkhQgzcWTJ2ORWJTHB8fCfZ8Pxjp+P2vMCcalyiQyEx8UcigAKLk+VoApHhmjT6uVA4
         ZEv4lvoPnJ1JZpkflLLOYPG6QVXdpt/cPsWi5uGVhxPlZ+af27fbqzw9RBoK5AlhpVeP
         Vf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455971; x=1764060771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J/LS6JB3TR9Jq5PNnoArY9FVy6stZEsKrBfA/VJEO2c=;
        b=doUegnGNnHf/fz1B3IRGq1uJhCN+ek9zYLKXpN3IZm47vmZntKMFwlUygM86e53lLE
         2wp009HpavDpLXGGVYJDiemwoCexa4IqNl8yTtoJWIfo5gK8AF+xN0vGqB4/QJLTsa/p
         J4UZrWt8qUj9CR4UPymiH+CepZRmWBAgZ5uHPYzl4v6xDS6DB996UNDdN9M8u3dZ5PTO
         tYzJKJBFea/pK2Qghng1DX190t5joCRVwGOrom+NtjHHwxZbXsqoIAChkufRAdovQuEs
         NTxz6J+t8qVv5SJIabLrv6VpjqKTqPUy29bZYZAf7UfA1nRplKDMlVubNZ4LbkBSNehR
         SJyw==
X-Forwarded-Encrypted: i=1; AJvYcCWaFEKLpu564QmigG/l/1O13/kWRQMmfN8wWbZGEkuWP7p77Q2jkLsmgxVpR8c5IeYu02VVm81nuzGNsHzKKJaH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7apqcSI5oca0gXKbkt23nBxjDz1xge3izmPk2PjK3Tqxwrmzl
	NJ4AU3lBWBfRDpbF+l0WElu1dgx6q7TAchLueviptv5+B92E3KKzLkdnpvJSgRMJ7l9iUm7jPhX
	JKb4tCOq5A+brkcod51mQ8JcyR9V8MvIcOd3nDNxLIx7gFkgW8bgA8uhsd0FaUYoytN3uo2m+Ub
	HX/A==
X-Gm-Gg: ASbGncuXZEsDcx7P7QYxKPjFn57ZA087BLFP/09EALd4IR3/CG0C06u5JZvCILzFxVn
	KxJBdNq1es0wdSV13q6QsFwZt2RLXvS8szW9q2OBzMc/tet6SXpPLcqdUMf26hsn8gHxV38JtOP
	iPcdPpcXJXIcfmS6pXDGehC6NbQkhM3wDXg6ddGJvVthBOOZOBd4Dbq/BcItg4NYTyFt++l3dpI
	ToX9JrOOKDkikfWXWjLjvG4xpxYAySkayWrYdzVzwbGQu8LhuChnbY8NY+vTauTp7+SE+jV4IdH
	0ZNRC6fJ7oFUNDqu7Y3lKgB5qHokatXWXIGCMVBxHgoYaMFQqT3IoySPKDGWTzgzqyesI840xS3
	y+BfrQoCRUk2q/LgY8VkHq+U=
X-Received: by 2002:a17:903:2b07:b0:295:2cb6:f4a8 with SMTP id d9443c01a7336-2986a76a1edmr156640735ad.51.1763455971201;
        Tue, 18 Nov 2025 00:52:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd2hB7SzLzqaWuYwjQZyt6QMGhA+S+3S+Uo1umciwE5IFO5bu8yrxyvQu4iby3vFSrcek1bA==
X-Received: by 2002:a17:903:2b07:b0:295:2cb6:f4a8 with SMTP id d9443c01a7336-2986a76a1edmr156640325ad.51.1763455970710;
        Tue, 18 Nov 2025 00:52:50 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:52:50 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:39 +0530
Subject: [PATCH v4 12/22] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-12-86eeb8e93fb6@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=3011;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vKTta3TyeGhxCas1ssgEN2kljhDiG+toGTM3SStGt9c=;
 b=RTi8VnHIWT8h3mjbCRZH3IO6SGjoieTo5yBHNHvoxtwhuGebkSTBl9jpJvKg+l0B9GXKeOno1
 bZ6HLGu4TV+AIaAEzsslZ9XMqZdc5d/c7TXsVihukbzwTQYTIb92Dha
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX3aKX7IBVK2LR
 81cbRCzZHcfHsAZ8S4aRVpH4WEc+D91q8trjA/eySKdVDsW9Lga6YVD0aDcSyWfg+1nz27WE6JX
 RtDVfwFoTameAkkOVpc1eRdbFH85N+uMLwnwFX4G4m6OtgZxMrwkx07qMeP6BDOuUQQ1F9S/p4m
 Zt1vDf8/0jbBsDEP14Vphx1Aof+tSVf1uTFRclRhsGrD0Uw+Vvn/attYkDcA3mPBai3gDSBkSYN
 H7FmkisQm56h326St9atq01+iLB6q4XApoiqGLJqlYp/PzfuQllAK3UXreBrb1Q6xm6U+HkBIdx
 uqN0LqDuuEQ2lXmeO5W9UnPspSlFMhpaeu3e9gI4NV57CNlsoJNmD9N8II8DEYrEmfdAiuTm50r
 hA9nyOLrCfvwut2S0g9aBl5QG64LIg==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c33e3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=feIks7WodE12ze-Om1wA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: IpxCEzJq_8Uedqi-zZL7dOTpIBem4tot
X-Proofpoint-GUID: IpxCEzJq_8Uedqi-zZL7dOTpIBem4tot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_005252_453143_9791918D 
X-CRM114-Status: GOOD (  18.96  )
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e566f3b7eab4..b76960c6d444 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1544,13 +1544,14 @@ static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
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
@@ -1561,13 +1562,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
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
 
@@ -1635,15 +1630,24 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
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


