Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1A2CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 05:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+Y5nCYPwx7u+eftr16tQ9QPU1KFxFK+YtBkCK2a/5c=; b=0zSaPtrsHqWFwleXnNoDGgZIUe
	hjwHQpy3e1VBFs5rHaY9bF70CFonM8lMeZcnK+IHC6PnRdMMhcPS0DelW/+SH6XynhUVWfWjigKYg
	4M8JAq1odMCLo/pqbuJzAZAF0LNR7Nt+x2x3kDYG9Ogr0ZpkPjCtfGgZ87G+Qx0/DeSg4hNaWGcEX
	slNhlSGDgbhKvb76VZWEkerHTr6QuJoBlpBBGy6ss2Yh6r9hcSj3SAoxEFf/kG3nx5OskrkFXMVgg
	B+0vjjiSfmdR5wks2C5CaES7wXC5W6dtPhCYcRfbCXVKNRjYFVc9trcKB1s0CFligPH9mHo2Yo9b/
	jbdklsrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TFY-00000004HI2-0xnw;
	Tue, 30 Sep 2025 05:50:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TFV-00000004HFj-1ALa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 05:50:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HeWU020474
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H+Y5nCYPwx7u+eftr16tQ9QPU1KFxFK+YtBkCK2a/5c=; b=ii2dq5xcszBZzzX0
	Wi7biX5+UML7GS+Tb/ZhgIoxVbQ+1qwEi/cDIlAlwf/fMA+qWG2mMqDq0E5F/7or
	CrNK46VHO1RKASZLO+qYahBGFq9ZBDEKVRtMXpcZhjOv8/Cv2DfBe0oiO/Ty0rYi
	3oKTq53euWSqlqF/2G/TEoD7vGRm3FFtUleXnsc7tixui7wh+DJjFBhZtE7gJNdd
	Yu9Zd74aPJByCatfs3g22JX1hxj7zf0s22sPpklclSv90dzTNvRcZJR+z/5orn2V
	uqTSTu09oFreAtcz+gHSTmKM4E+H+Qc34tSDcm7/H/F9d8Irz2PTIhzUpYeog369
	uSWR0A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5qujx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:50:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-269a2b255aaso99551165ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 22:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759211403; x=1759816203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+Y5nCYPwx7u+eftr16tQ9QPU1KFxFK+YtBkCK2a/5c=;
        b=vUIRuUVC+eY7SklhNKd2GTH5QQr3ZwgusiAfgz2yELx9iU7XlSeg47Ay1vzkhAwVrr
         wpqQC7uPM/6xyQmqJSFs/BlRcAk24nP8lbuWDAG1Gc5OS3UvK4KYz2m6zPiDWNgh5EJX
         Pa8dqRIcACpiv2xSfNUUlb+eYhswZtHXSL7hFEB87wKvMZmKBN4aeqOJozSqKvup+2pY
         0eAMZsGPkzmoIUbDBM3CPebxsOfkS4KfeMLxARlliNgrC4YaF7DcUy1XC2SAzGsd+NwZ
         ostCz0Gfp5yKC/maqS/7A/uX5nQQAwjrU5ZHRx/phk0HwIBKu9BcZlXkR6wfu/LhN+Nf
         h+wA==
X-Forwarded-Encrypted: i=1; AJvYcCWVJIJ/lHn1wth8cZWCG6jcmint4mqLG1oVCKd7nFcocfDQLHU7BXCHDbk6oVFk2x1Otcp+/Peero+Stfq4H/IM@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh9VzPPtEyr0/hvH62FuHIs8y0ViD3lVFelLhJxFr4IU5J1CiR
	7NpZ4jNhCibp9GeCsxIQrZW7g/uoMWmsisxUaG3x8MYsUhwCUpN5iphFoG7OmH3tY8+JNZmIWHy
	1j0aaC+QqPqokJQINSNBOqsjY6fvZ0+1CZVByFVcpteq9thlfYikyza/gVO+0Hul4TZY2KTl3MB
	JYBg==
X-Gm-Gg: ASbGncuwMRM3wWCOU1lEQPU/JW2UFKhrz3DMoHm2VtUJXNP/k5nLs3Nk5YoF2TCn2Tw
	HCGUo4fQuEaqyJXzKybUrtcHuviMn0jKGmDAnt3Q1XyUldtkYhHl4kIP+ooIpBId/XpZL6FMfCK
	Qz7MPKeipk0xcCQL1rf+O4CSI08nThbrfswNExuiNqZC/fojKkdN0rpbeuie4/KclvInvuCwv0l
	4Sqqxzt+E7q91Fbj2i+OxBRc/+VhCx5Y9PX2omJBJ1zNa8yliqkYi2SQgAVbnOfm+WwlmbWQldm
	g7eTnS9/g9xRNQhAZ/5gpEDVvjJIIAikNATkXmqgnUorxfMA7D1z2vLRsUkk9NPdZVx2RA==
X-Received: by 2002:a17:903:2343:b0:265:604c:17e7 with SMTP id d9443c01a7336-27ed4a89825mr178638025ad.60.1759211402701;
        Mon, 29 Sep 2025 22:50:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfxMz8cAOPh+Vs43kdCM5oU0zEFqqAy+EADwvCBEeDKHCk/6ncSzf9Kw1lSxzqRRosJ9WkNg==
X-Received: by 2002:a17:903:2343:b0:265:604c:17e7 with SMTP id d9443c01a7336-27ed4a89825mr178637855ad.60.1759211402274;
        Mon, 29 Sep 2025 22:50:02 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 22:50:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:07 +0530
Subject: [PATCH 02/17] drm/msm/a6xx: Fix the gemnoc workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-2-73530b0700ed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=1521;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JAlufx4bcWYhOFT96HAmSFs8ixvBu4zisfH0Ny260iw=;
 b=0SDd5GWlf6Z1edx32Bey18kAogkeePh7FfDo6CnNR1gZeWIj1Lj2prEncun2xLJyodvNcrtLE
 Us5ChPyi+I2AV+S7wi4gT4RlcjAd4tPRBxegTfXxDxVU9VnlSZRyDoS
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: OlZiThlEb8YpXJRN9mwAQTv_fCmnVLHq
X-Proofpoint-ORIG-GUID: OlZiThlEb8YpXJRN9mwAQTv_fCmnVLHq
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68db6f8c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gggc3m2WwWe7Cuz57AEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX/y0tvS5dOb4E
 XnVToKVpbsLGDwy/KHxL5geOGxOZ0Y+0ecuyAe4KEjqvsYJcDrKDmUfIqpXhCQj4vput98sCEYP
 jWFwG/ZIlO0iskbZBJoXBHc3F6WkEBrjh7iGJhGBXbWr1p/3GfAxrFSd8XE9pLAG4NkKjsBQ1A9
 SvF0Tleukmzb/iLq+UT03UsHGoCeDRwHW0ZqKar/TN/v0V7/ltRcMGQRC7gaUgjccbDZGCB22xQ
 W5hzOKIyS9r/2/I5cmudv03D7WzCgB/M08WhMMGs23dld79gE6Udf9ZxbJrKILW+7RCIi2VfQRt
 JCgBQ7mNKqztwodCyLGINFLJobdbwa068HA7EEWv0X57+f4O5q8AN0x4lC3F57ZLS628ne8s+GD
 B1jUFDdTb96Kpu0v+WE1nsuAY5ihWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_225005_448876_23B3826D 
X-CRM114-Status: GOOD (  16.50  )
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

Correct the register offset and enable this workaround for all A7x
and newer GPUs to match downstream. Also, downstream does this w/a after
moving the fence to allow mode. So do the same.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index fc62fef2fed87f065cb8fa4e997abefe4ff11cd5..e22106cafc394ef85f060e4f70596e55c3ec39a4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
 	 * in the power down sequence not being fully executed. That in turn can
 	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
 	 */
-	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
-		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
+	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
+				adreno_is_7c3(adreno_gpu)))
+		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
 }
 
 /* Let the GMU know that we are about to go into slumber */
@@ -522,10 +523,9 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 	}
 
 out:
-	a6xx_gemnoc_workaround(gmu);
-
 	/* Put fence into allow mode */
 	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+	a6xx_gemnoc_workaround(gmu);
 	return ret;
 }
 

-- 
2.51.0


