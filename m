Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA126C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 23:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbgR3JgBhEAkRzgKwkufgpKWN8aMxzm7tKt1AN1jroU=; b=y5lvpKZjirOzbt7dwSyBawCy08
	CLv19dwgUiz9CiP5V1KDS1xy7F8VoqC18ZX1K+uekRCIs2udpTrIFbnVdrHPOd9MLv3+KHNaY+YF7
	zS+Pv9fPHqkPV1SjPRoggQj+xS1ut8vF2bCAC57/AefY6DCOuvSsUjP19kLR/i/Mm7brlY0a5zgI5
	l3acOyE30SyhWeB7Hqi935+SEYm54YOiyReQsCyRLPVWw5r94jGlnI3eMqvfPkUy/uiXtLW54GdmZ
	dDhh4+PVSv4mklABS5DkhAtCskpi/LP/6wNv9IosBi0ZqRv3KkiibwIH4uRJVtXSJ3/O9Ei1FocxV
	+I8G8GXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5CIH-0000000BAwF-0uXW;
	Wed, 16 Apr 2025 23:35:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Bzx-0000000B8Jc-3cjv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 23:16:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMG4xV020808
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 23:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NbgR3JgBhEAkRzgKwkufgpKWN8aMxzm7tKt1AN1jroU=; b=FVyu1n/9qG3bAq0I
	rgKJOHEmOxHGMiAHw6p3GEfT7FWbvVyCyUtmpvXJqW5o6zBGnDe6XiDWmfGfingN
	gop5Gx276WqKbbxEx5FBfFndWM6IDEnHc9CESr4MZyRWMOs0qfUM6YEwZafyyQby
	DUABDzJap7GT0paRlCuGpANyUifVjGQ4SVy82CPeqyLV11BSa8Mu+aZwJo2egzk1
	s95EXzJG8pq7gg1PoAj7Y75sl/FdsFYbTiCOdA4Q6qX72I46b5W6t5mRPzhUuB6Y
	sBTUFSw47IyWS0HMs6a+i6X8DGLnEpheb42ix142ikt9tPD+onE7v4s1Pgfvi18x
	h03NMQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpvuq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 23:16:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so4566456d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 16:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845412; x=1745450212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbgR3JgBhEAkRzgKwkufgpKWN8aMxzm7tKt1AN1jroU=;
        b=bIB0V+vcFWmh8l2RSmpjiTqPDXreEi9ntVSWvll244IwWJREPqkUEYwjDyQYKs9cGc
         Uxg8iYYLnNjZK5Q8AFRqaZzLM3OpLjsNfxTa8TmGUo0GHEla51NF6Nz/13hJU3ZD9M7q
         DHBf6Qy2RMZzTBF1bPRGlPElkZ5cm58d1MiypEvaxpJwyKoqYfXgW1c8C04p+J9a2FJU
         HE0cPV1rU5+XoWou6SDGBbalAUcr1OjLnXzzswWwrVxNCruD8Bd6GF5un08XkV7BTzBI
         VIA6/uedlZunTsOqphZxwVmt/rzKoeUvN3P8ep1klEnqK3uMXoMmW3/h0C+L5UwWssTn
         qNjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPrpc/4Wqf2A3QF5hWRUIbEkOqH3l0HgUSQlXFNdgrMiOMpYQ6u954US+5XEVtZ572DVxeurwfCqVb8zsS4dXK@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkc9y1anAMwTrbIQ2dCD32LcS6RU0r15UMI2BXLVJmwlDR2UGE
	tXNDVSYkAEzpMNNLx40vtQoJSSakMbKmOi2xqEfkTubOAN0z075G82BSBTamKs841g1FBCQz7E/
	tDZ+wXHg3kMqY8wSde+dG94wvdLTftedDr6iIcQ7jYhucjIn4H1yusqkTKSfsFAAFWGO/cdlOeA
	==
X-Gm-Gg: ASbGncs5V0l+GVVrUV2kWZoj7FPHh0OI1+CRYaKi37KLYFMp7f7SylL02DC0FDnje4a
	sXnGPADPL5SdQu0koJFL40jl0tI2FNxgj9lfoqPc5/5OGSGs5ayHKig3PF3EHh6ZN8raIWeBujk
	4NQJ1r2cB3mTtg5Ds86gSQ2wk5KyS/ca4nK10Hm8/Q74orTS1WFN6ezmfU05N6GVS0NGVghCbOH
	wb2i7H8RB2XmzDoQ27v0iWJH5H34+nx2KHystnY8KbnVq++SL+LRa9Bo36nQbQCTTV7qV/0Fzk6
	EPEWNgbZJWcIdJMjc488mJDIhlXaph+34hP9/PM1Jxw3XXxAWx7E+qNUY3M8TUl/SzwW/OTzOxO
	fhQlulW0coyCo4eYk5TNHsrXV
X-Received: by 2002:ad4:5c48:0:b0:6ec:edf9:4658 with SMTP id 6a1803df08f44-6f2b2f41eadmr64009846d6.18.1744845412133;
        Wed, 16 Apr 2025 16:16:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdi/Heb10IV0ebjI/uQFj+TvnCj5AqRX0Qjt6hNOsivt7/zrNZzuLbnO/trLdOyvbT5hnuRg==
X-Received: by 2002:ad4:5c48:0:b0:6ec:edf9:4658 with SMTP id 6a1803df08f44-6f2b2f41eadmr64009456d6.18.1744845411694;
        Wed, 16 Apr 2025 16:16:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:16:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:16:39 +0300
Subject: [PATCH v4 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-sar2130p-display-v4-9-b91dd8a21b1a@oss.qualcomm.com>
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
In-Reply-To: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NsF5aI5nusL+eHX5Edd+WVqyrIto2M0m5QQZuN1UEGY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADpSKnBU7awkHhZMhjgjHssIKvg9kvxarVper
 lFtR4MryhyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAA6UgAKCRCLPIo+Aiko
 1RGTB/4pE1Ow3LIETtniR4dobV9KAs9aiHQuBL4xDkuFXUvHcqLMPBm43yr/IWRC1Vj1R5NZcto
 d3uwTS7Ec5SGa5NMjQyzh2TsSFE/EKJ7stGggTNPq/CCk9cw0jl4b45lX4M2M8kWznS7t1tijPe
 S+ogjHMwMGRLoyJ5SAbZb40dnlY8pZ1vnizWAQ943AE3HEk4kVl6R/iPbK214SjG4hxgtyNLYCk
 AZmXiPEwlGnWLFcRDijSeD0nsaUcaH3buR13R8islUBME9rnyQK2w0qfvl0juHq9cM387onaP+o
 d1YhMF4TOGDt7ZjO5R150dtVREjHY5iHizzyKbYL3BxdPzBK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -tlm_sq6Q4BaLfCHlJ-WFbRlQD7aTas8
X-Proofpoint-GUID: -tlm_sq6Q4BaLfCHlJ-WFbRlQD7aTas8
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=68003a65 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=GY4BWdjpb_dk1TMi0HgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_161653_913789_8D125E28 
X-CRM114-Status: GOOD (  13.30  )
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

From: Dmitry Baryshkov <lumag@kernel.org>

Add the SAR2130P compatible to clients compatible list, the device
require identity domain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..ecc4a1bc9477b766f317a58ef8b5dbcfe448afa9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -356,6 +356,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,sar2130p-mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
 	{ .compatible = "qcom,sc7180-mss-pil" },
 	{ .compatible = "qcom,sc7280-mdss" },

-- 
2.39.5


