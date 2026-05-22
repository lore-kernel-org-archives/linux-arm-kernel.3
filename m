Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3C6CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=; b=zNdOB41m5TaeV0uTxdFwlThq+J
	yQwVj4Gdvg+DeHiE2z6BCRpIpHHbrDji2s/2X/dsEcIlTmBvtkCKC6kg7V/ollqksFUduDMP0kWYa
	s1WfBKW+wVxykYJgiQ+ITR71phzjWUyVxK6G9WZFOrZpDdCWpVzKc106Ga0CJs4CX8yVX4p+mQdxu
	RXyWlI43aybVM/G3ykDoLVhw9eMI7dVWBVk++C6d7Y70jZnsQugYVwI1I/0hCl2KfWE/I+qOy7vos
	OZ9Dfqh7xXstLNtXAbytHXp884kUxmKYsjVpFQLBSpPbZus67BR9oYoy0aEy0QJeqpayxCHbqn/DX
	MSSZH+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMry-0000000AS4S-3Pw1;
	Fri, 22 May 2026 10:12:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMrw-0000000AS3k-2inK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:12:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M99ToW2765104
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=; b=aVtlyU7mQF+q/O1S
	1s04tHwI4DI6ylk6EAp4BO2qHva42VLz1V/Ejlq087p3/nTCbuE92byMZnA9fylV
	nu1j9+YacCsHELOvlfxUb03c44tZe4gRbhK+3oN7aTXp4hZ7itJXKvJPUWmhj3pi
	1U5QEDSzgCsWndExIMmkqkguioaXwwVJIBEvTxO5SvnUIJQJ7qKNSh2OQhYKmyNA
	24LvgUwTqVlOsGEHoLrk/dBU30/GH2XF4QHYcjE0RpgA3I6gM59AIEPo8ZglKWF5
	RaT2uikmyaW+TKHiNjBdbXS1IoyewaMCSuPar7om/Zn3fZ6fhIGyW6cptlQv3Igk
	0ZuU/Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7vg4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:12:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2babbeff9e4so78254305ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 03:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444758; x=1780049558; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=;
        b=gOo/fPwoSqUrpBe5wUt0MXB5qcbM+n4dorckSFG/2nOYwZPuHxyNy4fgfqxgdxDHTB
         zpRa4qPumH+W5mDK0aoBVg3U0FKfkKvtlo1+S2ncrXS6oeMX3izYZZIL0Wd8Ow3G11bs
         7EGuR6+mKS+a66BLtP7Pv6cOTXs7goZmyOl+fUWTnAFAm36UwE5+yWCpWXPO3Y7XCMg9
         uGgDN+EB4qImhFhtKXDfHGjClz3jwtrQilqCzBxqMpACKsz0ext4DAxpEtBSkB1fbKkH
         OLBQ5iWULtgmFWXGxrfXbT5mHpSkPgXgkqJ75X2epS+Vhj6UDc0zIu388C8Dm6Ib7arz
         7qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444758; x=1780049558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=;
        b=tFpctL9PCmMmzYB3j3iGX/tn6wWPu4JZNjbzNpxuX4D1EUU9fvJWlsB/hmcUVWkGNG
         LrvBqQJ9iI4EaMdEbYrzkUI/FAsII7C0tMTIL8A73bsLGQtv+2dloYPhpIRtoQN7/7hF
         ysPlt89CbMFLR9EN6F+ejAEcAN64rOlxHgL7Q0xNd2naOACEONT1Ob+zsE8LLhPFoaQh
         qiw7U6viPWvAsPLmOzLYZMZPrgs4oOiQwD0Dq0MzBDT0yrGpx/fA6+C7fyuVbVHxWVhK
         O0DCsEFuZoWG7dZ+Ld4e2Hba5yKgUjUWHE7Ee5tMaDqUgu5bCOw7rL/WAiNC9Rv5xcAd
         RZ5A==
X-Forwarded-Encrypted: i=1; AFNElJ9XOF8heJPwr/ObBmfQD8J3s7Iq+1pVcWbiurk91gSyAo1P5Dwx64QidK/zMFrUoyth01asZ+M0ANHTBF2hK0+W@lists.infradead.org
X-Gm-Message-State: AOJu0YwlRNjeTQU0xlIcgL4pQ7xZD+92TywnUgLcnTUL2t+Q+uXEw7U4
	oex4ejEkBN79IUIU6aGuXEtM/XrzOF3exZtkziFHGtdIhgm5Qwfw6ncY8QtNTktnz/BO4LyKHCW
	XlA4P7zySFynVIlfGgjVt2qIK/ahF5qkg7KPr6DfyN5LupDKZUtiMAegUf47BOQgQ8pnRkS1DFD
	8xtg==
X-Gm-Gg: Acq92OH30/sArIVuwjrXfeKaKpPPU823R7ZThZXzheBmZrQ0Qov4TJceM959sl82juM
	bO/Qf/T0XTzAMTKa7IZFm2j49RszH3uKnnn3CcQgWZ64wKFX4YW0FjA+M52oKJD4s9Iqj1POC5E
	ii/X5hhosWJ5MajOONJ10+ZXsfyBENA2cK2YCHHF+zi8OujxzW54peb2k8WlpY2eQVJw04exOq9
	vfytM1Avdr+CfqOqAVbFMTpjJkMKeb/vYqYVFwgyYSxtEYAD7uYHz+A5J3dOk7k1lOnXIT59YFC
	PCnnA58E+r/ovmVCnGgC7Y3ybHIxneL/nNVrd6AWtEnlVDKgwzNoTxU+3HV0hMylKehypdzU3gD
	4yj2sPlni9krCyIPnqayVid0B0YrYNParAhFROUMFR36ApQ==
X-Received: by 2002:a17:902:da48:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2bea22b759amr66987575ad.20.1779444758360;
        Fri, 22 May 2026 03:12:38 -0700 (PDT)
X-Received: by 2002:a17:902:da48:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2bea22b759amr66987095ad.20.1779444757875;
        Fri, 22 May 2026 03:12:37 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b4442sm1143498a12.12.2026.05.22.03.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:12:37 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:41:57 +0530
Subject: [PATCH v5 1/5] drm/msm/a8xx: Fix RSCC offset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-glymur-gpu-dt-v5-1-562c406b210c@oss.qualcomm.com>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
In-Reply-To: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444741; l=1052;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=obY0yd9A9w1nKiCc00V/sWC5PfbbK/PzpgmtQExUcNY=;
 b=pdp64ebXg5HPwlKwhpGKdCt4wHbjegnmKMSMu4DM25HTq8+oXTKxhTVqzHseUN+lTBUiptQH4
 KmSKIH80NuvCyqgY5lRGeS7K/Ol9xitlYW+htTssbvNc4sWExXaTNX2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a102c17 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4MPhRinBehVJTi7DQIkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: dezSmpTwtB6wvuuytToQbObq03pDOHRI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMCBTYWx0ZWRfXwGf8WSO3xR4e
 XXA7qLWRFc8YXFPtftYxWO+iarsqhzvQutMN/Zdc+e0l3vHmd+5pvNSFoBbFiD+l3A9WMQrlKBV
 O9Df3jQ3I3LsgQPGBcULOqnouOqo0xb8zX4AQVbhG4vDz69+Pf6va8ZBE7wboPAlupzvkTsJK83
 2vQbMLXuj4ExI1vhasLmL0n3c5Kwt762MQsIxTmKEYipPt3b1u2dKyu1sozNJMkQFs4KDY4sReG
 7ZMMz+vgj6bHyr/j5hParBvg4hplsxjHL3Vs8M0agXm7F/3LMAg3Wlnwihs07uM8TvNhM5g934H
 SnFQQEwjm9aSXc3eSgVOEX7KVYq2ciy/z3CT6trRYUEU9K88Xp28YfhTMc90xW/iacADZZpaEP7
 cANBupKpRtP4fHIiH7t6THHbU5XM+ph41LNwm6/BTXtpwHNC3GM7315gsJm9z6MmE7W/QfNIR2Y
 AecZnKJWJQPdLJ7XSXw==
X-Proofpoint-ORIG-GUID: dezSmpTwtB6wvuuytToQbObq03pDOHRI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031240_812573_07651667 
X-CRM114-Status: GOOD (  15.98  )
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

In A8xx, the RSCC block is part of GPU's register space. Update the
virtual base address of rscc to point to the correct address.

Fixes: 50e8a557d8d3 ("drm/msm/a8xx: Add support for A8x GMU")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 1b44b9e21ad8..cab4c46c6cf2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2357,7 +2357,12 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 			goto err_mmio;
 		}
 	} else if (adreno_is_a8xx(adreno_gpu)) {
-		gmu->rscc = gmu->mmio + 0x19000;
+		/*
+		 * On a8xx , RSCC lives at GPU base + 0x50000, which falls
+		 * inside the GPU's kgsl_3d0_reg_memory range rather than the
+		 * GMU's.
+		 */
+		gmu->rscc = gpu->mmio + 0x50000;
 	} else {
 		gmu->rscc = gmu->mmio + 0x23000;
 	}

-- 
2.51.0


