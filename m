Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0EDC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=; b=ksOxFF2YLt/kSTxP1ex2DE4O/1
	/Gx22FZ0OvXArBccXJNzp1ll2zt/ETr0t1c36I2p1ehHBEpSldUzQRFcdlt4HPUBjjgiVlAoKRcUu
	kFZqZQCuBwshUbGDt/wA7W8lb5mONMl/LBwxYDiUmyCjEkqOFlwbEGdMEfXnJvfSRh0znd9LF6VJ9
	JVylF3hcyu9chxMEfQ8giYwL6b3rqBkEZb5uKDS/BiUva60GLiMkPSCUNsBgYA1aGY2e0T5hlS1ty
	4H58iRpEwc6A1BcrWWybcPCeiCjXiBmi402kVTsw67+D9BLwuAP4P3ct83pPa31dc2uIrySXseCTd
	NIgtiwvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkcB-00000007s5H-1ZX9;
	Fri, 03 Jul 2026 20:35:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkc7-00000007s3F-1MXo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:35:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPZwO972986
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 20:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=; b=kbXCX3ZfPE8xGbMt
	vMJtWU22XsCFV4p57+53pKeA3sF8erE5WGjuAIJ4v446eiEkXE9zyhh9NUiRUtAV
	vtfMB12w8Zz7nIM3aJN8gA/DmwzV0BKfCjhOp3EVC4ygnbJAzWsHakrDG4oyQqt+
	nG3cBLf8FbOA6iGXzcsCDQbwZYAI67JatbACMAOe+6vCX0AyEq7EJrxcz3AGLtfo
	qBoQg8XhoCRmU5wJTrTsMd1eqsCOXQpB9KeAyrASJwukltn14xq18TPfZY57Z0Bi
	b7pMwGhGFFb5tNuFjx1PGGYtj9SN/GmngMJfETIFQlcjhqyyIifDM1pqW3uDuvwz
	HJ+mog==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b03a386-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 20:35:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fc0aaa94cso1478820a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 13:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110953; x=1783715753; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=QVm8AWPt1X7yO6xMyeAkFbl6ZXd8f5mBK+vjGrMTRMXVq3je9Xq6t68DB6Ds6x8LQR
         RkZV4h4hzn0mffHy4D36yXbklSazmillUgar1KICoTLWX4ANl5k9YNKNuSbxXyZptFO6
         boJ2BpUZUREiBF3rCQkZw9tVZb+OQR5eWVBzDtjaSsqEnLifIBoJsDZeEjyDDQX7jJjP
         9zKvfhkvoos79K7Rw/CKoTt40XeV9hEU/aqa08DlVXG2di1xZeWinwvvDc/GkV35w4+p
         O60UXXG3KjKD1cldbgOJqzj5YfJkfX5TS8lCiez3klfJnPpILeDmtsIKCAmfbcAqcNXE
         oWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110953; x=1783715753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=ahmfi5cklZ/VdOwPITqybxxJCIyZXr/g8sTWRCDGsRznsVdzdMQ+PTSpD54Uw5OcsM
         NKIdAKNRmjBegMiLdPyJvN2bgPGV4ns1bokTWSBWwXGHResMPrYaGDiS/lB7eBP99IMQ
         w+AiFBXR1LFU4iqQvEBvKNrIfO3KOfkM3ear398N/PHogQSyx3MuF+SUykvqhuQtmEX4
         pTuFmK4F3sV0/AMty7L3LfDxfRR6vgYHrjUKYmuUnCdB0dzEO7T1WMUQwKECnhJChDVN
         vP4Ex9crhTm30HFb1Yjw/poWx0KuvzHvmqEzjsRuHL4MJsItHrAbyhMgcH2KBogU5dOd
         C7NQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqa8AdfvbEgK7phSdnS7vCowInTIRurhmtTKpEUukSlTzkMjZCe+LWqsHaICSq12QRX4yrko7PvZAA/pof7RLCK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw12DyIVm///YND/jtN8kbHofl2u6vk/Dk9okyblsHjZQ3HbdgR
	QxVTIQFWh3oztc2zcsfmU/jX2+jWUotumeyOSOpuJsEk9ml547N63FAnczEo1Bl6IkGz69zqi/y
	UTjTPAifnTGOIywgdvZe82et4a386rTO4cQMG2bOhL+HAtDYH5cDV8q+awqi74reXN/bn3TXgng
	lSGA==
X-Gm-Gg: AfdE7cnAbpAQkvdtiyS+yOol2++Vp3PmzxFW1o3IWBmGb8q6izk/28L25snGYtbkYAH
	XS1VixCLarMxxMZ9x5xCipKSJ8alnYETzTeNot+0MohD6iv5Jn3o7D+iDW3d2aCvsAwwZ6UTMT9
	rrRGjUKvjevd1nO/CwV7mT3Tu6S3l8X+IXFnXml5VMQRKC/SVKsnL4roOc3wM2WluFUFRAgjCFM
	BSZntvIGb6ReQDjIq70Rl1yzqcl8+2jkqObDdYSiWEHVh56Wh2WmJGLvBUFe+wNhDgmufQyf4Yy
	NYbRHGDr1lj3EoJ60jXaC/EG9MnFs5Wlmi37qDsCBIaOX8llupqvakOkDaO+TyesFQOQd6z7vcJ
	G8LnmVVvKthegP68oHRj779r2dIDape9D55Q=
X-Received: by 2002:a17:90b:51:b0:37e:2053:348f with SMTP id 98e67ed59e1d1-3829f7e86c6mr859261a91.25.1783110953173;
        Fri, 03 Jul 2026 13:35:53 -0700 (PDT)
X-Received: by 2002:a17:90b:51:b0:37e:2053:348f with SMTP id 98e67ed59e1d1-3829f7e86c6mr859230a91.25.1783110952611;
        Fri, 03 Jul 2026 13:35:52 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:35:52 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:30 +0530
Subject: [PATCH v4 4/9] arm64: dts: qcom: shikra: Add Adreno SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-4-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=1898;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=EYNcq3OFs2Ql/wREKtEM5ji0GMxwTnKnJ9RpGAjMe6E=;
 b=VV53sBo/O5fZ+NGsyhq4LtyFTf/b+WQ8uGjvE91A7dZXdXWNqRQAjopFaqZ2FFIMEKi2ZmO1b
 iWCZ4r056a9Aa6iGB0aED9govTFpDOH8j0BvDycAX5GdmmELVWBCWVb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX1W+DBAUipibn
 O9fOSAmk4jROH15UAQ8Gm64IkbfZjZi8Jw59ET+RSDmbmb90fkfDbyOgRaeLTIrMduqdoGwTkeO
 jPNP0fJhvdKyzyQrMzB9P/GaqDLGaFU=
X-Proofpoint-GUID: 2XGxrDyeNyEYzuzUp572t__ssBRGudiK
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a481d2a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zTWU315qYGxAnKAOPQ0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX6ep1A7jBTCPS
 t5XkerGXW0dqa6XAHoQPPy79lUgG1jVztMJE2UxhbUHnAocdXscVBHREyC85YuMKoQGtu8MvYJZ
 mJGWtFckYG184oB6SyIoxY8WhgAiVD+HNxUmBRQT+oMgY+BVvoXsGIezaV1ltabGUfua+CA7Vsn
 st3nxmWgj74r7PZdHb5hz6PYT6p4OTdWNactDg7uTw+y1CpDf4MFhvJQnymzzEH0E/os1b6rbzL
 EBtZ9UWKahhC54KEqlibLC6mMGm3X98meMs80o5qxkifXmHYzuhm/+iD20YF98CHp5gFTexrZNe
 /6+jxfzVQQIxvcNnoxHrH3U+H6e6jS1YA0GqcLXfLRahXyemUr6zQmY/JVlXhb3/8N9Ah8mpbID
 z34mZk/7dEw2zudxjXCenH58DvYQaP51aALSOepDoRjLlN+edtknU8dV7N8Akb7UZD/SIcoR8kR
 z6f0l2qh599G6os9oSQ==
X-Proofpoint-ORIG-GUID: 2XGxrDyeNyEYzuzUp572t__ssBRGudiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_133555_483327_F55BC381 
X-CRM114-Status: GOOD (  11.63  )
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

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index be443b362576..bb11e832d9a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2005,6 +2005,35 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@59a0000 {
+			compatible = "qcom,shikra-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x059a0000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>;
+			clock-names = "hlos",
+				      "bus",
+				      "iface",
+				      "ahb";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.54.0


