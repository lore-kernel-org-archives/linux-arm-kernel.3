Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AF3CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 05:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DcOYuuJJ+cW6vFNFMyOqLHX/YGKWTBxTGWvOie70iM=; b=42MtKRbcPZQSFDAGohz3q5YTQp
	FO2HCd2ncF2bD3B+1PF27Flp6ybku/b5Z+JwTuZuZXzxjj3YP5zQE6AF8fOroytEKo1mlU4C2SvkY
	jogvPclkOS7rIu0ho6t/gK7QG/CWv8Ez135jxA/FL5QHm66mnIx3LNIXdYEKIhZFRYn/JD+hkpPQi
	KLEx8fcWoLRIq0WQTkaPhUatVodxJy+Xyn4fN/RHRdHFniI1uDQzE+b8xHAVre847xR2p0d6lBoPr
	X4EA6Q/qR7leHFij62tt4PYtqOQiCOCwEfZ11pK5lICG2x1q0zuDAwKwbDiLM7w6T34amHo5atqEf
	9PlG4V6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TFu-00000004HVF-1HlF;
	Tue, 30 Sep 2025 05:50:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TFr-00000004HSg-2WYN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 05:50:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HVhK024443
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5DcOYuuJJ+cW6vFNFMyOqLHX/YGKWTBxTGWvOie70iM=; b=maM9JAzgC8bn3UtP
	bK3l9Mr5pbIBVnd51dGsizmhHoKWbbpPi/8nG7N4p9sJEp+cARaCmUjI/BafMMBS
	OShbyK0S7NsVakVVhBPMC4di37if5ePlKzRjD+GcdQ+CjyaUmHzJt07bNQu42aDB
	nIlUYI6k8sfMZbjTEQKa41YRiaeXreNbDHN52R5E/qafzwncU7iaFwjom1g8Rb1f
	Hv4nzvTG68XgnXz7uoQMVUPqb7cA9QMwsFlMM1lj3AHvrhfTZ+8Rlj7Jzd09iudx
	tO+gOPVF28/UYIXaIVF5CW51UdhMXIA0SlO0BMYVP8hrofLC9foRJ2DHMtvG470Z
	SC9o0A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n04yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:50:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3324538ceb0so8812556a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 22:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759211425; x=1759816225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DcOYuuJJ+cW6vFNFMyOqLHX/YGKWTBxTGWvOie70iM=;
        b=SjA0bYPDHwwawKhcnyZvuZk+S5j+FUYxbF4xG72qjcq8xLDzkVHy9NYhXdks5uuSr5
         E16Z5U3G/tE9CUissLPAB6LZtte0WLaJmyvjuacHuAEHbvNgfDBbOWQHhjEzCpabrt24
         fnAcfZLlHu2Hq9qc+Cos57Kq2ETyDSfYlGVJxSy16TwzymGfVxpQfg4yFIpwNtPEF1+7
         SRdKswGhEYWptF3NE7SHcuSH9cq8CZptq3ZXTorM7DrWlYFRSgmnh9LBuPoRwprZ7DCt
         okdrxOHJbpe9TS1vNi87WXBONimp1diBuuUmLLXJ08csEPDxSz7uTXtlgocSrazrG31s
         E0Xw==
X-Forwarded-Encrypted: i=1; AJvYcCV+y0QBAXkxFZ35Po4BJG7fKp6fDAeO6D69OzEjh/+tfXbispyCTfgKbYwqXTMRGICKyVgk79ZUUZ2AklvASy6A@lists.infradead.org
X-Gm-Message-State: AOJu0YxM7+Xt3IDegUVDlMaJpVqhKVAo0RDFF31OK9q56rdRMZjKT6P+
	A59zl7TBLIzlcbG4YXv7vQ+EZauNqFz/Qf+0ZSlfKfdYl+uqhJkXNk5lBUOyPQ3iJii72CLs9O0
	68IkVfFe5NyKmrCvN9fQiaeceIS5B4Ly2F4RZ8psOBEQ/fyld2zmliD8itfcmEyf0SpAKRUfXWQ
	EFkA==
X-Gm-Gg: ASbGncvHkUbuHwecWzmgJhiVu6hmZxomJOex4XqX5Vs23o1okPWmljYQIYhv0cllvN3
	zbO6mYGWAipXR0XxLj56b66Ufv6+1w7A5nmpz3ktQV/xWPAPc1NnOuD2LHH4Lod0P9eUrjapsho
	bpF/C7p1MiRAzkoxgCKA15DAv+uheXnjh3I6+XiM25XdlAikENp9brb+HKWxiHiAuLAKQ+NLC7i
	+TacVRF3F0/yuakp4zBu/Jr2W4eQjTdAHWP+OcQ7ZiWOlQijbFwCYQP9+z12xK2Hpj5bG9LObIj
	eUJEfbTemJ2W3u0QRogs3YGvlsj7SOMuFwXAe9yldJ+TL4LbA4eRU9yafP6zMxNEb1f9AA==
X-Received: by 2002:a17:90b:2684:b0:32b:94a2:b0d5 with SMTP id 98e67ed59e1d1-3342a318acbmr22583482a91.37.1759211425537;
        Mon, 29 Sep 2025 22:50:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUIQWH84fqllYLQOn6xvNXBsEPOR+cZgKu2hLJ5kpoceLfbQeC3W3x6mtJBPFDPhqUZSJFdQ==
X-Received: by 2002:a17:90b:2684:b0:32b:94a2:b0d5 with SMTP id 98e67ed59e1d1-3342a318acbmr22583460a91.37.1759211425055;
        Mon, 29 Sep 2025 22:50:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 22:50:24 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:10 +0530
Subject: [PATCH 05/17] drm/msm/a6xx: Rename and move a7xx_cx_mem_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-5-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=2329;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=r9oQbEwLVJJDIQbYTusbpAt6OAJRxZxziR2i2dJYHBs=;
 b=XtsAQGS6JKr43XfgTE3f3PxKYwJMKqXqAQxlF0DEooff7/mkggdbd/tl5m3RDE7pPZll3vDo/
 khRRRuP4zrzCfhmz8gkqnP94SAjFhZEUgylnY6MbreRTFexF/VIk2LO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: DZJ-keuxhGDS8p4-ruFlN53PT0o062Aa
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68db6fa2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=HijK2bQ2CIbjB8v2WwsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: DZJ-keuxhGDS8p4-ruFlN53PT0o062Aa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX4Z4w79LL5Cxf
 fWN85BWM4cDFoG0Az0jO3D1PC41l+OYx71GJTi1tXVyei3PwjyCjIP1IH3ckONZFbMHKWFFLoYx
 HEqR5fE0BQ4xnaVdFtdmzOyzlMKjALmy1VIRcmU7FzRVG8EeTg2BDBX8saYRLUJSZ7koNHE1+0K
 lPVa13ONgT3AQUJFKLKc7kMU+nhNZaHquGtDF/Yr26MgJlwGAHt8jD/vOFiiE/+rfHZBJSU8LkQ
 L7xgef+HmQabIsdS06L2bdLsaPKB11oG5uvxhPHtBQCu1TBPbqSiFvpnhu0Nqju2kq+AczaXmUC
 vYfJB7r3osma45++U1xKu3IHWeyVBru0GTjLgYgw3aS9xfz7iq9i3wunQLkpnseHcerxUhdVDax
 c4TIiYEcNX81/44OBFhK4mvCPWmM7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_225027_833836_D446490E 
X-CRM114-Status: GOOD (  17.77  )
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

Rename to a7xx_gpu_feature_probe() and move it to adreno_gpu_func list
so that we can simplify the caller.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 11 ++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9cc2f008388929f0c8e8f70a3e3e79fb4d35ab38..4be0117c3ab1d56dc81b43ff00e3cc48b02b080f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2065,10 +2065,10 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
 }
 
-static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
+static int a7xx_gpu_feature_probe(struct msm_gpu *gpu)
 {
-	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
-	struct msm_gpu *gpu = &adreno_gpu->base;
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	u32 fuse_val;
 	int ret;
 
@@ -2621,6 +2621,7 @@ static const struct adreno_gpu_funcs funcs_a7xx = {
 	},
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
+	.feature_probe = a7xx_gpu_feature_probe,
 };
 
 struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
@@ -2702,8 +2703,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	if (adreno_is_a7xx(adreno_gpu)) {
-		ret = a7xx_cx_mem_init(a6xx_gpu);
+	if (adreno_gpu->funcs->feature_probe) {
+		ret = adreno_gpu->funcs->feature_probe(gpu);
 		if (ret) {
 			a6xx_destroy(&(a6xx_gpu->base.base));
 			return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 77b1c73ff8946fb0f8ff279e16c973cade50c130..5abe442637e321fb996402fd833711f0a948e176 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -75,6 +75,7 @@ struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 	void (*submit_flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+	int (*feature_probe)(struct msm_gpu *gpu);
 };
 
 struct adreno_reglist {

-- 
2.51.0


