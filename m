Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F8DCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=; b=KyB+DT+m8uOV8Gl8nle9yKV1aT
	o7zA12yGy59AsYdn+4PcanzL3SS1hJ1LoTidV3tdwSXjMKmEN8n1MuQnh/wnwOODhBQVnpetMel1X
	X9UJ/QY6ga+ZU+usDuyExAFUmT6q8g3/Kp/cNMyrl/V77HlCSiOaEtfHFPzvWIBaVa4iAChsryKSq
	Vj0BKEWZu4m2PESjeNGcUabzGCjKn93EKnO2PHhPb9lT7/X2T6us46a9/gAMYMLUttvZAuvZLC9cE
	j52QI2skhxqNUUX68bM/bX3DR1L3QvMwtRKvFbsVpuBeOeLzehAiFCvBOl2UOUfBBtu4SEphanEZJ
	PLHC4yTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMsE-0000000ASB2-0m5I;
	Fri, 22 May 2026 10:12:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMsB-0000000AS9Q-3oHl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:12:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M96VJQ3532232
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=; b=SZMJ1SOidQow36VO
	OmfNAX/lI/DPOfz4E1kbWdZb+QV76/Qqi9IBNmAhbtB7Hk7BRGIN+kyAeN9T0sec
	Qft7KZdza78Kf+glrSj0oRC9UOCWmhIujnxfnimp550FN4Rj+iOSKFZGNRkpw54L
	Xu8A+eACHkIogqYmc9aeJ2nF/Qtlochx8Dcn/KL935vFcx1VJCdaiu6IJJKpD7vY
	FJDPItryyTHcNER2akP46kPAkRgOfWZPnWslxEQBwQAJBxJkuYnSJWUfpcawHvR1
	v/ZiWePBSyL9JvR8OYXUStgoZPJPW/Tca/RKDGv4EuMuXDJHKYohFwkwUNoqsoAw
	PzEcPQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gvjky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:12:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82c4772950so3596631a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 03:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444775; x=1780049575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=;
        b=OragpyVyupKTICj2ScYw21NZr4w4KEbtgsDR4IiUsHmTeHjTdhA2hlKvlEePWy7dDz
         XGK4ZZOcZv927bNoLI1iVoiewUmv3tq7IaHm7yQZiJlHk83z1Xwa38DGdBDVgfvD0ve1
         DDXPCk60UmTNiVWl/0VKPX45wIehbVvtd+gUfSwOzesvbDJW2/8suTLg0j++vHp9/IAd
         6X2EoyhrRMBRdxw/p6TtA3SsMJSpA7CCTS9YhAgyfYoBVHgVdpo+0bW/d294CG3C3cHe
         N1bggygH7yJEfldDvHKUIWmV2/wwc0Vpw46nXeqMPmJFqfVxiUu5v+enZEGVeJsygY2G
         rE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444775; x=1780049575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=;
        b=Qn2Ji1HCogF9uh9Pxx8OQjmtIJdtNrw3WH7hApdXP8PMOGEmD1ElL+v2QlCoOmbBau
         8K7KUPOysTG12jiL5ETmXI+OuMP1LYH1YXTY/r1eyh+GZaare8Xa0/aA+01ZqbkaOqbz
         BYCYxYpHPVgZ/fo4FJr0uQ+WWB4Qx8eWbbXo3Uy9UXD8OfAEuYvxHNgwZjaSQxkwO33e
         3cC2fxPINxYB92bOHPFhKn96zapoSxx+QYZv38QO9GYg/w65GUWUVh7yTpCfhTzC+yRx
         jR2rXr9FpL0pCYp6FXOYRFYqOgU5ueAHvJKE044q+EaQ8eZNxf4CRF/yj48Jl7o7DXJR
         IA0A==
X-Forwarded-Encrypted: i=1; AFNElJ8HAv/lniK3y+bLo7S2jN8foQwf+Uw8NcR8Z7a+yk4mAKPipng5b70drYW+7XRG/+EAi1WNC2zJ1w7X9ojnXsxE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy56E6Drzp4pioB8+GCcbXO0QzgrnD5K1uJ13OWK4xk/9fUHHtb
	w7nSNOuW1NwyGCv0O9AMCI4ZTIlc3tWFBSACPnAivOcTLT/sC9M7YJZ8rTPJL4dnbmgmK0QRm5i
	5Vn885wr8jNFmzcjWQDppszNm5u3bEGrRAzLaTH8nsODuHAXjV+PXVPgRuTxfrP8S85eh+/jX8z
	faHQ==
X-Gm-Gg: Acq92OFUPHwPVyWTp51Qhi2VJi6cHyMDYU+UwHK5v6ipuNBBpO+3c1RSxO58CBAEtw2
	qvwwpeUR77Duepr5Q8o0C7CQ6EiLCLThsl+LnLFBiDc4x61KUvDMhxQ7Px4RclVGssnaG83iUiC
	wS2fxSuonz2/Crh8epu5KO8SMjfTolhCAnxW30/J+LSKicTkm61tfs86pNWvNgT4+qFh5bYWvgT
	0b9UnQczg8MqHCqOpBkUE9kQm4TXvcbD/r0svYunbmJCMyAZtH8Catbpq1nAgjfMVDODuq5Su4O
	o3vQMut61E1pv5fYOuHx/WSqF+gUYBpIk5FXxR3f6BBhEaeZN+mckLUmh69GOdFR9GDepXwWu08
	6CJT5EcUAOmnXh5vdL98AOgXopIdrv3+OaVY7ZRZaGD2bDA==
X-Received: by 2002:a05:6a20:7283:b0:3a2:f05a:795e with SMTP id adf61e73a8af0-3b307bc9d78mr6490746637.3.1779444774657;
        Fri, 22 May 2026 03:12:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:7283:b0:3a2:f05a:795e with SMTP id adf61e73a8af0-3b307bc9d78mr6490689637.3.1779444774118;
        Fri, 22 May 2026 03:12:54 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b4442sm1143498a12.12.2026.05.22.03.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:12:53 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:41:59 +0530
Subject: [PATCH v5 3/5] arm64: dts: qcom: glymur: Add GPU smmu node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-glymur-gpu-dt-v5-3-562c406b210c@oss.qualcomm.com>
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
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444741; l=2464;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qFdQhBrAHggcU0GWES+ohMA4WsH2wnpDPMNFqXrANzE=;
 b=yNzqUhOCMXQvxrRtd7kxvs7YMFtzu8GiAVVxvYNsil7K96Pk0pY01/RxIvWewjoljNJUYvNeS
 3lRjHziweCfBb69K8ZhCLsCORtTB/RODIjYmlA7lEj942QbUt4Oh06+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a102c27 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 30YMDdPXyx_GPwQa9EE_J_G8zyxxcfhz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMSBTYWx0ZWRfX/Rsf+37PP0Vh
 j4BaGDMm92EehKsHj0GcyRjAuDTVn5BU7nluR8LXadyHaEv1j5olraiqHUzTGVAApEflzG5KS6H
 2Gg67qMi33NGSyXyFn/TuO2oJKjzOSIai091rsLrA3Tn5TPUyONkP3hVVCbWUHK0mtrO9cN9ypO
 SAE2vEjzt+v6nnUFT8mv6LwTngt+RsZzxTybuvE4OxKS964Wy6MbVFiM0OWiioGGOIKvPN9WjKQ
 BGfAd6RqErOE49qGI7W73V58o9BfGGqt0awsr2ClzsKbMhLuqgpNT5mrbfkyGnQrGWKjQYy6Zv9
 4lwCDCQU5fPfkwEkpG106aaLVCusv7HPvkNbfwXGEQCMf+W/cT97Kjl6e4IG+xfLHuepPI4n5NV
 xjNwQjXYqSBSdRs1R+UPhHKZWZAMWNGP5IjdfUnwF0iakVraJh07oeq8UOd66Ea7DkcLRSSBN9v
 II8z04SD85PVysAP0Rw==
X-Proofpoint-GUID: 30YMDdPXyx_GPwQa9EE_J_G8zyxxcfhz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031255_957913_39C6408A 
X-CRM114-Status: GOOD (  12.28  )
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

From: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>

Add the nodes to describe the GPU SMMU node.

Signed-off-by: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index ed9aac42fcbf..5e76a0d53f01 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3729,6 +3729,44 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,glymur-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
+			clock-names = "hlos";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
+		};
+
 		ipcc: mailbox@3e04000 {
 			compatible = "qcom,glymur-ipcc", "qcom,ipcc";
 			reg = <0x0 0x03e04000 0x0 0x1000>;

-- 
2.51.0


