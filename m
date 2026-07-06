Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21A4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkXnf93yLRWoLQTfGMAiyn37G03qiS7uTjdBHZXSW0k=; b=C8WiaQv+cEDe+MB0zbEF07Nt9n
	5TcHPpt0rGm6njOiOm1sNBVt52SpGv6M++mxpTG0CpnQrOheD5rHJ4lGBFqFfT1ejIagRI8e9EOFG
	AdhFJp2rRQeq0LQieE0x/qB7aOO0OR4mTWWdWmIltKJUDCyGPyrlA17pPFt3ZNCPGfjPvQv/hOgEb
	k6BwopRVl9/pDx8ENCZHGYe+DeniDloK7U3kgNdqaWJua9LsLDdibi0thmA7xlnSaOR/w9gbkuSvQ
	mrKQzmr0M9uSows2blxql73R+EX1eKkJ6+NgLc4qfejF1URGT58Vg5SucsVAKAqnwQ9wTfF5gB0Qj
	yi8med9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr3n-0000000DewC-1ncq;
	Mon, 06 Jul 2026 21:41:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr3k-0000000Dev1-2WNj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:41:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEG0E1505081
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkXnf93yLRWoLQTfGMAiyn37G03qiS7uTjdBHZXSW0k=; b=ceZjQ8eBnqJyvJ/n
	yODW0D+GvmdiU6wVotMh8dFHnitj/J9b2rykVHx1hMIlo6l78Eg/RGEZdY/S85ZP
	eQWhwktOgE0fMKVx+pAsrYvcwOjivisetF/2tV3nn349JI3RAyDxYwG1RuZ7LeE/
	/mXXFkWArw7P508NXBDPdpu1CBETqAR3QEgMiihW0ybfhhBFgHRf/3+VZAmIaRT5
	JB0Vs6NYJKkyrZXeowdCoSvha5XAus1xmlH4gXvwGFpXnYFFM50QoU47z1wv200n
	VgygfrEsUrW+4ylZZBvVeUjTHwN/j5L0OtxjPeFoblqOkecHZ6Q59Fa2ECbS+K8b
	3Sj/kg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98jwqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:41:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc86a9ef97so38071065ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374059; x=1783978859; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkXnf93yLRWoLQTfGMAiyn37G03qiS7uTjdBHZXSW0k=;
        b=HSh2S44XtVrzUkDrUDqxXEV9WxsCAFDipbHDUUosbKMA9B4igyqkzInsi3r7OrhBk+
         V8vGvL6YDi87OskOiBn5qP/I89xE9ACudsBn9W+1nbM7Tt5hXJrhssn1ZXNBS8bTDsbZ
         h2eowjYC/39Cei73YXzMZgG10VQu02kUl4HQ//OE27gu0soROJutsmBbfZhyWWuUI0SF
         zmcB1Jbb/cAWhRcXIyoRKXN3WA2jlBoUxuhWIp4bl769G/9CZ4P1fgxeWjk4zlfFIUeW
         t5nNh2OYBzMCuFGHvJdJroR6PrL11HVzX5+pG2rOWm9pAtzivjH2hrx08jl55gzZn6Iw
         rOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374059; x=1783978859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fkXnf93yLRWoLQTfGMAiyn37G03qiS7uTjdBHZXSW0k=;
        b=c9AnC0kmTXo9toQvhombLUyTRKYghbg9V9PLLv148pHE95LAu1UGkzuq8tqCNuw7lN
         hfe4aF4Z/sKbZF0kUi48/sB1rEaDgbW3UWR9yH4gIp/DTFy75AGvCAaGqV6EZCeO+b4C
         uperAFUSecO0pde1oKRnfe6p9HcUOvuvv0AJvE6hxdZuXpOGWmQ02BbzydrlFHb51IbN
         MlDjLOfzx+tuwmII4EvdHTsijTX0eRRzIbtHvb/2loT5193ZYgCO4KgOJg9q3YmqzZSA
         1XMnTzRAR72j17VB3fj7qUBl0U1uUtLXCMuK1cNC5fh2Rbsds0c6ssHdwFbTYJq5XOOm
         xCoA==
X-Forwarded-Encrypted: i=1; AHgh+Rrb6DjtSQv5RYuKfLFlsxUhxEhuoeMr7IygqbzO91fkVAfqKRXry5dGgt8uxqCxpZRH8Z37KbETYjt38yPtGCrc@lists.infradead.org
X-Gm-Message-State: AOJu0YzSw2M7mrahMJTqUdCbVX/bmYIB1LJRMqZH/zmANjmWKiC5/O8G
	X4po4LuVIsvoBG36E/NZgNObf8ppOc9S5NCnv1oCfoUy6R5P4/OO8Espm6Uo4HAjLYSoZ0TEvQq
	2JWHhV2aZ120f5XGe3UYRiQ6Ut+SoKleu19qSLInCEQJZrFtbpS0/Zq0MRJ3i/iJaOwQx8msSjo
	SPBw==
X-Gm-Gg: AfdE7cmMb86zK/CTc2W9g1fkroO6kx9LR70mDsiIH3D4IAjRuVWWxtEBxCm8lh7OoLD
	w/uXZPxNRgSu5O36msXLDfKrG1g92PQszyjVOJWc8RF1p1WNQpVfX/grkpEEImMrSUMFye8xmZc
	l3c87TrWuUtwz77Bqdf5TYKN0YtGXZ+3CjMUwsKfpMzhB0aesjPwMLK9Qt03WVyPY5ndqa5kEeS
	DYmz4PmqNB2KYTlhgtOnvl8+aCE12Tqo9McGMldjw0SXSUKFp0YinB8pTIZi17N+e4yFyEulpy/
	GoCtVFao85w3JZNWMkEWrrQb75bMS1eMhaHzXe4C4K1p8kUG2eDu4GEiYVdZ4ngjpgOWwUA1r+L
	vz6rwqBKd+ulmwbrfXqPumKo5MvNHq3HoS2M=
X-Received: by 2002:a17:902:f607:b0:2c9:e835:ac67 with SMTP id d9443c01a7336-2ccbeb1e2e5mr25480885ad.19.1783374059380;
        Mon, 06 Jul 2026 14:40:59 -0700 (PDT)
X-Received: by 2002:a17:902:f607:b0:2c9:e835:ac67 with SMTP id d9443c01a7336-2ccbeb1e2e5mr25480395ad.19.1783374058879;
        Mon, 06 Jul 2026 14:40:58 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:40:58 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:20 +0530
Subject: [PATCH v3 2/7] arm64: dts: qcom: kaanapali: add the GPU SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaana-gpu-dt-v3-2-8dac9a60dd5c@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=2533;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qEe8ApyufGdls1/59eRBgE6mt3fqa4nJlBW/WwvTUag=;
 b=LMc5mk+WE5iV1TaH/olVocdEf9bvwVBig/I7ERonQcpX3Z63ura+W+n63vue4peLfqeMvQt0W
 tZxG2RqFMvbDzM/WCwXmBJBo2DW8B0e75hW8EtxLW8A48IujYbwUZN4
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4c20ec cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX6L3QjEP/7g77
 rnDAaXtTOQT/o3vujH3GvBJflJJigGn5Yb8VaEPFJ0gEFhOvap0MQjbf1ewKnhIn6ce6yPRMsqz
 HuSKF5k6dc4Zu8qEhKbdDXPrbqhyp49fG/L6iaEwLZ+4ZJn9dWvXL21XKYm2a+mGDR6xaUZHmZu
 BGuhDlCkzATI+RKdVKsRjptDtSxzup+fhr43QUzKcaCqcTnpeyFIg53BuFbge7iEMAyBPM9a+PP
 toedtHEdxO+TeDYNtTyTIltsO0hwi5gDocuLGikJpv/pUnKXou1/end/y+0dOveg32dqktN1PX+
 OddJRzBVMpFSMisFUsFlrTYUd6AjP/ZfcFaPm9YntHt+woYG38+a/UAQBPhxtWi4sD0loHnV1FK
 XBWC95N/x0lq7H0oFhGRtnNMUz9UjFvDstB+1bGUYlyeExV8yKBmtzFMBS0xj5nmhIztQw1K0qW
 Q3id8I0q4A1WHgxVjEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX+K0/mRAAOV3+
 pvRwKPeDyvjqype2htJ8pxYfbYBH/z1VzeWQToBc7vjZualyLOQRZsoLCabcFUFR+OsE3BdQOjD
 BDIvEq8G8EVRdy98wQvAjjI4nPqMXzo=
X-Proofpoint-GUID: syoK3P14JDfnHAFtflkzcWYOLz06HZxB
X-Proofpoint-ORIG-GUID: syoK3P14JDfnHAFtflkzcWYOLz06HZxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_144100_655660_4DF8D172 
X-CRM114-Status: GOOD (  12.89  )
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

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

Add the Adreno GPU SMMU node for kaanapali platform.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 40 +++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..a41962366941 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2601,6 +2601,46 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,kaanapali-smmu-500",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
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
 		remoteproc_adsp: remoteproc@6800000 {
 			compatible = "qcom,kaanapali-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x06800000 0x0 0x10000>;

-- 
2.54.0


