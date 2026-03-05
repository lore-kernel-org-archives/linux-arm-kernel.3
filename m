Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6485CF30924
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNl9QehoQmMFloQ4hlvF/Qk1jGOkXZVFRf+hUaNh9lg=; b=2zAG01ubX6AUK7Ex6A59Gy+k7q
	fuIrQXWBOMeWgxgpPn2C0415AbWQqx5Q0gEdMWiRKZimfzfN/Ps2c7tHP0gDdW+0cHs51lPS8tlCA
	0ImXIwHSwhTDsaNmGB516mwhE4e4TjwNJs4Bp6TOVasH2x0I6PlwSo4kOfvwliD9jADLLKiNF2t78
	7h1ocFyD6LeV10t1inCRxD2b4BGeMCv7xsFMMmTkY7PHubigrCW59VyoPmWbHoXnjYvFv/HowDcpu
	FyUxiVCO0K+To+uK4/izLmvIEEgJwLPj07K5Q1t+SVYSZtSeSPbR/RP1eG0wTDt/qhRHHrirtuYHf
	2wkB4CrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5K3-00000001Rg5-04nb;
	Thu, 05 Mar 2026 09:48:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5K0-00000001Ref-2luS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:48:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254KL5L1853136
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNl9QehoQmMFloQ4hlvF/Qk1jGOkXZVFRf+hUaNh9lg=; b=KZQzHGR8Tot2iguw
	3/keQudGyFTqPbRXtQ3wPq3FpnTgqkKkNlwfZe5+eI9piKZ0SZP7jZtgRVV8EEO3
	uIme+U9rCxm7Pxcp+VbrsZc/IToG3i1RLRVd69cRzHSxDvgZ8bF8Udbw7CL3Npqj
	Rlr+vYJbVf5y5HOqnKgQSG2aVGcw/deNmedg5p8jxbVXt0k/M1sYIh5mwSHGaliI
	KpMSVAYtu7MmmBgwfXAX5MI1RmycyDb1dc0muWJBIXSSrD1dBODHEd5oGZfZW8vz
	SzbH6TaQ+mEMZMvEX9rKzeF3n90nPqgNvi15guqhKcPmWPPkHqTqJNysC8+VFNOU
	n4z8Iw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq2q812bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:48:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506b4005ab7so755221531cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704123; x=1773308923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNl9QehoQmMFloQ4hlvF/Qk1jGOkXZVFRf+hUaNh9lg=;
        b=dVzy8FkxEXEOAqxIbrKKwQi87ljOuGJlOzKu994Y4iucPIVPh7QipGEJ6gj1SBN7nB
         nc6B0r1sFhssz7l1g3CCmfOP8Zv50MonyM0WeV5G6R7YCrbcYo8nlRr23B6XL0Ylk9jK
         z908Idsal2fFEZF7l3wOG70JW+JbnWxA4zG45oeClQaEwmHx/0yNM+sGMZf7SoaH/pab
         gv23EXCLIx2p+/4w1qzDi/WYNkmXCg9jkB7UZszJB5RtO2VlM/ffzoC2cOZBg5ImVsdu
         bvE0Y6pCn2CV81YIL8cRF5Z64yVUoWXBBkty1nOrcmXpf7iTyyFqB3LQLw4zbXEhr2Ca
         phIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704123; x=1773308923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RNl9QehoQmMFloQ4hlvF/Qk1jGOkXZVFRf+hUaNh9lg=;
        b=Yb6feQsAsmvyVBCWowsXYFkAuO119A7uBGBl9dnhF4FsRmvEwblPmGMJZYYh5TWJMW
         uGAZY8D1LknbDjNNJOMgIw3eRmRLb53j0i064ynZX87bp05VABK96Jpdd6OVWJgcsX91
         1qL5Ni3j63nXRgwVWzCQ3SEZkFVZY2KSfXVZc02Achq5O+XRboa+jLV99NwNpIQKhJDW
         PojiFX/r5unNR4vKKxuiBjVXXcOZLSqShFBfgZQPt8OfTlsn4TfT7LglYPpmQKMTg2ev
         62aU+hjXMbG1hNfbF7bThfFQqeI2UQNP40ovucIgHDlKh5X12wnJJAkvgqU9+Ct5ulZj
         wFdw==
X-Forwarded-Encrypted: i=1; AJvYcCUIJ7jzLhc3/ooZfjHnC19luA5ndYdAKLtCfzt2Ml1GhZYh4jx8fRSlSOkkX7eOy1hIAbh6he4w7pbZPVqY4smg@lists.infradead.org
X-Gm-Message-State: AOJu0YxYSBbJvvl7+Rk6QrWId80MJwfCfwj6vSpyqAhB8kKyHp7dHTXz
	P+F9SE1NWRO11cw01FSfuSs3F4Fy0BQQJJkOLsoHcG2wozOEW9YIJunw1TO5rugfJiD8A6LB01o
	vLZb3/97Yo2uAL+SZw1cHYM91B3IdCDVs//OH05kedJiGU7KfNKU/e39n8VIIxy8vkFdmfwwmYl
	qjUQ==
X-Gm-Gg: ATEYQzwGHnDoQqoLKUDT3xDXAv6tL2VWrTtLHnqr3iRHbmd4Xc0ZQ9wzK0O4sBkLQY4
	sTtXmNDeGpiqoQEbAd/GzAagmNqrxuy+Ru5ivL8IZh4u1dnNKhMGjhXQD9yyMYwkcrWsKtS9vQQ
	eU4QbxH7qjV/Ls49fmkf6y3DKB0S8zuIB2oflMyLgCz4Sy1JNkEPuF6diNU7ePgYzwacPIhREbd
	2jjgE+cPXnJQsOMWXlMBjR2NztZ83rgTOiFxfwL29bBbaSNg1G5czZ5MfILM991mcOuffrQHFM3
	W0PbWgDV9Gh4bIBNp5Zkp6KQhCikUWOh2wEWiC0m23iG++0vouGPn1OB+pYWyMAaKitaxCnKttD
	b6RtQ4g2MO0/IEypV5F8ugzjROb/KRVxuPFsLZ0gXROlLsnDyQ/k8nNFprIyrY4NJaTXv8AEQXQ
	xLzJRb5Oc0B9Ng
X-Received: by 2002:a05:622a:28f:b0:501:423e:fe0d with SMTP id d75a77b69052e-508db28a748mr65556971cf.3.1772704122696;
        Thu, 05 Mar 2026 01:48:42 -0800 (PST)
X-Received: by 2002:a05:622a:28f:b0:501:423e:fe0d with SMTP id d75a77b69052e-508db28a748mr65556701cf.3.1772704122287;
        Thu, 05 Mar 2026 01:48:42 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:48:41 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 17:48:13 +0800
Subject: [PATCH v6 2/5] arm64: dts: qcom: talos: Add camss node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sm6150_evk-v6-2-38ce4360d5e0@oss.qualcomm.com>
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
In-Reply-To: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=6743;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=ocMeB6H+TQusRD1+PzIbc5H+47Yxa0gXugM3y6FQ0/Y=;
 b=r1eHe5363dGkktsWBQgmfDY0cwOEKvk+62PE8e02/Z9CUDDDGixmXrU/gxV+vhRkka2SeuPXa
 qzTWyKZvESvDoyhiUaOHfn8pLsIFBSTrjEhuJc1c253LDCwUozR2+7U
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: leo2eH7O2TfQh3lIOuO1Blktl0fbG9_T
X-Proofpoint-ORIG-GUID: leo2eH7O2TfQh3lIOuO1Blktl0fbG9_T
X-Authority-Analysis: v=2.4 cv=GecaXAXL c=1 sm=1 tr=0 ts=69a9517b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aV1HOqfba-nwUXNNIVcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfX3GYhfefGR9V4
 oBVvFOK0sYfu9Fiozn2UvYCK99yFF34Q4wGCmcRJPEL7ZPmY64ZwgtFoJ6HEDupf2dHuR1gsSbT
 bE1rl4QPuBI5R3NCxOQX9VRiamKP+hkd075bKlLR1cwBShdInlPrT0BbGHgugShy5ybe5O9RK8Y
 RzqoFtDKKFG2L56fQpyP+7r/9vLjV3bRFI6ca4EBUQR/10tfP+5TjDksCKuQAjxXSqAaaEHX8Vs
 tkgm/Z90eAs+gFPJ3uyT9tVbn1L1mFrE1p/5krRQf5/0FPZE+8RF0MA77m9Rv9G7VQGJF4L6EpC
 X/f7Q3gMH87uWGdkgNa6jFvwTolhJ/oYMU/zri6YB/mvqsEbc9RrJAxYcM9AOp33KQRlYiECIvL
 O+kRSqCwPHe2t0XSrNT4pSqGldfY57aa7OtD01m8NfM+uKqIzyD7yZESFKHCSQn19qeV2lNiwqa
 ElnaGMzduSXcYAUb8DQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_014844_716936_D276CB49 
X-CRM114-Status: GOOD (  12.57  )
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

Add node for the SM6150 camera subsystem.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 200 ++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index f69a40fb8e28de9559e8ea53394b86ab7188d6c6..054255a65c7fbb51e6c411d10252270bd7ef1522 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -3789,6 +3789,206 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: isp@acb3000 {
+			compatible = "qcom,sm6150-camss";
+
+			reg = <0x0 0x0acb3000 0x0 0x1000>,
+			      <0x0 0x0acba000 0x0 0x1000>,
+			      <0x0 0x0acc8000 0x0 0x1000>,
+			      <0x0 0x0ac65000 0x0 0x1000>,
+			      <0x0 0x0ac66000 0x0 0x1000>,
+			      <0x0 0x0ac67000 0x0 0x1000>,
+			      <0x0 0x0acaf000 0x0 0x4000>,
+			      <0x0 0x0acb6000 0x0 0x4000>,
+			      <0x0 0x0acc4000 0x0 0x4000>,
+			      <0x0 0x0ac6f000 0x0 0x3000>,
+			      <0x0 0x0ac42000 0x0 0x5000>,
+			      <0x0 0x0ac48000 0x0 0x1000>,
+			      <0x0 0x0ac40000 0x0 0x1000>,
+			      <0x0 0x0ac18000 0x0 0x3000>,
+			      <0x0 0x0ac00000 0x0 0x6000>,
+			      <0x0 0x0ac10000 0x0 0x8000>,
+			      <0x0 0x0ac87000 0x0 0x3000>,
+			      <0x0 0x0ac52000 0x0 0x4000>,
+			      <0x0 0x0ac4e000 0x0 0x4000>,
+			      <0x0 0x0ac6b000 0x0 0x0a00>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid_lite",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite",
+				    "bps",
+				    "camnoc",
+				    "cpas_cdm",
+				    "cpas_top",
+				    "icp_csr",
+				    "icp_qgic",
+				    "icp_sierra",
+				    "ipe0",
+				    "jpeg_dma",
+				    "jpeg_enc",
+				    "lrme";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_BPS_CLK>,
+				 <&camcc CAM_CC_BPS_AHB_CLK>,
+				 <&camcc CAM_CC_BPS_AXI_CLK>,
+				 <&camcc CAM_CC_BPS_AREG_CLK>,
+				 <&camcc CAM_CC_ICP_CLK>,
+				 <&camcc CAM_CC_IPE_0_CLK>,
+				 <&camcc CAM_CC_IPE_0_AHB_CLK>,
+				 <&camcc CAM_CC_IPE_0_AREG_CLK>,
+				 <&camcc CAM_CC_IPE_0_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>,
+				 <&camcc CAM_CC_LRME_CLK>;
+			clock-names = "gcc_ahb",
+				      "gcc_axi_hf",
+				      "camnoc_axi",
+				      "cpas_ahb",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "soc_ahb",
+				      "vfe0",
+				      "vfe0_axi",
+				      "vfe0_cphy_rx",
+				      "vfe0_csid",
+				      "vfe1",
+				      "vfe1_axi",
+				      "vfe1_cphy_rx",
+				      "vfe1_csid",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "bps",
+				      "bps_ahb",
+				      "bps_axi",
+				      "bps_areg",
+				      "icp",
+				      "ipe0",
+				      "ipe0_ahb",
+				      "ipe0_areg",
+				      "ipe0_axi",
+				      "jpeg",
+				      "lrme";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_0",
+					     "hf_1",
+					     "sf_mnoc";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 459 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 461 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 463 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 475 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 474 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 476 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid_lite",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite",
+					  "camnoc",
+					  "cdm",
+					  "icp",
+					  "jpeg_dma",
+					  "jpeg_enc",
+					  "lrme";
+
+			iommus = <&apps_smmu 0x0820 0x40>,
+				 <&apps_smmu 0x0840 0x00>,
+				 <&apps_smmu 0x0860 0x40>,
+				 <&apps_smmu 0x0c00 0x00>,
+				 <&apps_smmu 0x0cc0 0x00>,
+				 <&apps_smmu 0x0c80 0x00>,
+				 <&apps_smmu 0x0ca0 0x00>,
+				 <&apps_smmu 0x0d00 0x00>,
+				 <&apps_smmu 0x0d20 0x00>,
+				 <&apps_smmu 0x0d40 0x00>,
+				 <&apps_smmu 0x0d80 0x20>,
+				 <&apps_smmu 0x0da0 0x20>,
+				 <&apps_smmu 0x0de2 0x00>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc TITAN_TOP_GDSC>,
+					<&camcc BPS_GDSC>,
+					<&camcc IPE_0_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top",
+					     "bps",
+					     "ipe";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,qcs615-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;

-- 
2.34.1


