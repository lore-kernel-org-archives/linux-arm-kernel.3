Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7BDC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWYcBPv/ClJ+iQbZUlROViXdeYZuC9cdTF1Lu36R6EI=; b=VTOpI0ETefWML4LTZEfjV5EWzN
	dh8o3SJaFe3rF9AMhNSb2EDFXQpi8wlPg5VMeZVeu3uZSQGQPUmqnaEOd9AV8UmKlfQKgNEV2k4Gb
	/jzhEtO6ERCQRmMgU+QRHegF4kPieVfM3psD32WEgDlgiJzzHJcxrOPxChH3nl0Uxbk85EEG/V5jY
	XPicgN9Zu81XDa96WRERCIxleBCC4Xe7LUldIfm6RiLR2Tmzf2GugTcnCP/328m5oxuHC32f+MdZO
	GYWJ/jg3vp3YOWJSmFESpLpxy6oZxKnCi4a6+4/hdrWAMyWvBk+UkVjJSbEr8H/kRldoNMSfbN6pn
	2EI2/ikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visG4-00000006uc1-1EG0;
	Thu, 22 Jan 2026 10:49:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visG2-00000006uay-0N8k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:49:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M6opWb484050
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JWYcBPv/ClJ+iQbZUlROViXdeYZuC9cdTF1Lu36R6EI=; b=UCtO8Bm69Ny4fOWb
	J0CkmHwGtesADdLxDL/Ya2+HSp1NLkP69uroSxxeesjfP2GWuLn3uQXTIVFBjHP8
	RUEzUAIG42gpGtxDW4Sc0AdSjTHeOHC/1hp7Oh5JY83G8NhBDG6qq/7bvYOwpuvs
	CfGi4bbyQOnN8jk107jPj11XnCAVoOedTccvG+11Ae3Gmdcvs2lbywAu0NLc5+RQ
	imtbLtJtBj+O95YNByiglMh9vWwVJHw0IePtM5RWCQUe9vRmIYMqlp9h2Q29AIR/
	f9cwQRTtSGGel/ZTZIq5kbUzKwk84hHcvrEpDcKShKvhurRZguyAOAC6J0S7jnoX
	dXXIOw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pj25sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:49:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a5bc8c43so261673785a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078984; x=1769683784; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWYcBPv/ClJ+iQbZUlROViXdeYZuC9cdTF1Lu36R6EI=;
        b=LsK/9tXe2JMYKBGb4py7k8KmM7F6D3SelqlgRTC5gSALZe0MwtDBPIq7bcG7x8MJTX
         DxxJhkxNO4mdNtX615VDNwVJyusSOE2z6tL24lkAUwoaowFnKRCKy0ziVRQDA7nAqdX3
         sXo+LQv2IotgoCMJEzkCNXoWHrLJEqXyavTteVlHdiKoZon9N1AufA2D7pwrTFQJUrYb
         Zv17UirOpZvLB50eIxSV/xmKfsZdQXckkqjUGeWwYXj7A2WiVZU/AlRIyhCgePgNoPQ1
         hOG1/Ec9jFSAyAyXxq3O/a93fg27UOby+wCBN/V/HMakQT2fjqVudegjhqH0PJ3C9RLO
         tUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078984; x=1769683784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JWYcBPv/ClJ+iQbZUlROViXdeYZuC9cdTF1Lu36R6EI=;
        b=DysGb3HnLY9+3/TeWsb2DUIhOU4veEXGAvGQtEJcS6T56q0UrFTtxJFlVBtLY+4E0m
         Av7Vks070f9S1v7NwR+QE2pjC5gYQMbmlaXGmQogDRXi7bGJV51hqHBXt6R3PrTVk2CU
         lQFGTs9J66UsYMJOuWqCtNSApisPSRB2RqNQSqjihm2BCyfwePy9fzvyIFuO/Jbu6tFz
         OPurvvVcn9bT6khD9pWCQz0zVCk7bJV048/SlLsyfdu+JulY+8/A9L1zyR7wvFrmqSGO
         4xifV0xG8s81wYQY936jDSjpx7QnOmfnNmMmr3z3Yn0fHzaN5Ur6xvYebDORC3Y5idTY
         inrg==
X-Forwarded-Encrypted: i=1; AJvYcCVUr2XyjAE8tKhSb594dYXEHqv+FW+fCQ1VN6GzipNdyY4IruDMx/XNVsmFI2BwbK6NnL06Douuayvwuo0PUBkU@lists.infradead.org
X-Gm-Message-State: AOJu0YxH7NTx58ICF0oVDm3fNB5jGnbeIhYloN9vq2xoC7S3UI2P9RLi
	AkQVfBeIRqG7TKYmtO+gqA2DIlNaFl5VZ1xfYOM2wyf0xdXzfiqGYxQqjp4wAWMtZBHkA7OTbTM
	Rk86Yusc9kyhV2Vz5pN2r7ZNbblQRYsGwYjDS33RwLxPQ6tgmj6gxi9R0ipVn5fvn/+BYDErqKx
	bPeg==
X-Gm-Gg: AZuq6aIJU9T6kpAAqF05zw7e5pNJidYcGE98jgDOuljmu5RknsqnjQV2DHY60jwNOLt
	XIHR/5FkqgwT9WXhiU/Pc6Q619y5G8S3w9TC4hNUm+qrt15GHw7pc5+JB0GpIEqkeW/WiREqRQr
	6uBsNkESOst9HGIwyXZEqlTBX0MJ+XCSNZnoqa62YhNGbDAnM+UiWYCkTsVaYC05wEPg69H4oV0
	jeielJeEM7oZ1wZoPIJFQCj2I9mP7oafILJR7TnY6Jg6SoAj8+LT3EBJt9mWWcTq28eMOBqvVEd
	sbqSEWVSJu5peGsMj/D7Mtuk+eZJ+9XdAplMOutwXs6tOzLBQ6KGadcoqOEE7aYt0YTmkHTrSvk
	IoSJca6wCP3gnTpRB+NTytgCeQjPpVdcXRB1FBkIdVU9J/ifS3vWmF/O2Xzl5zagsXw6jT5yHrQ
	cC
X-Received: by 2002:a05:620a:5593:b0:8c6:e11c:5eb6 with SMTP id af79cd13be357-8c6e11c63e1mr4234985a.72.1769078984548;
        Thu, 22 Jan 2026 02:49:44 -0800 (PST)
X-Received: by 2002:a05:620a:5593:b0:8c6:e11c:5eb6 with SMTP id af79cd13be357-8c6e11c63e1mr4232485a.72.1769078984006;
        Thu, 22 Jan 2026 02:49:44 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm121704901cf.14.2026.01.22.02.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:49:43 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:48:52 +0800
Subject: [PATCH v5 1/5] arm64: dts: qcom: talos: Add camss node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v5-1-039b170450a3@oss.qualcomm.com>
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078967; l=6743;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=+gPwHSHSjjDjQ2M/iiVDFIMHqWIJ4UsMUFWEKECMfi8=;
 b=92Cldp/yWI6Eyw0Ll5MAPL3353hogHAsehrpQ1GhxVaWYVgDLLlWGvuXQDCCrWqu3eepb56lo
 YGHssiBpdLiD36OPmB8ewOdmsbT/mZMdrDEGJDPuWZOQl96NfIItbEa
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=D8pK6/Rj c=1 sm=1 tr=0 ts=697200c9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=aV1HOqfba-nwUXNNIVcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NyBTYWx0ZWRfXwoZm13HRu9Bf
 bVL9EbMbknbq/177fpDMZEvhL2wcJ8abLsvopqUBFdbOu0aBdfD9S+JhHCjj1hDsbstOR4xDD6Q
 Z7xq4X1iIM2n5Vp/+gw0tHMNjqkAT0ZVXeMUl5F/oFqVSirOldSx+DHUJGCulDUMbTpCAwMRGFn
 dQ7S9rrHb42kmfJOmBJEcjXA7Sny1NfvpJtcvkTsBDnv+RCC2/COp12z0qHKsrJSjAf+pUWLFgk
 Axas0mrblZeRHMQQKpZnuTAt05NDQ+DKDZAsBRvCBQzgLdo8EBa3r4cyDI5KFhGsdufbIdW5uOW
 yqnFDGU64l1CV/iN5AxHRS0Wix+BGc4qFlyr3H5zVE4KuvdEZnd4XiSMFmAt9s+hTpDQxIRWWNZ
 RSrPPHPq52KX9+3mAuyY78sHMzOMTlJb2b9xVBk3VZFy1zyf8JFF1+PLLfAT97EkEs5qqVS84sg
 3I6IYxJBNh29RpWp/sQ==
X-Proofpoint-ORIG-GUID: yEEe7nWVe5orxV9RO2pfQllY9wYOCpQX
X-Proofpoint-GUID: yEEe7nWVe5orxV9RO2pfQllY9wYOCpQX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_024946_141765_7874596C 
X-CRM114-Status: GOOD (  12.61  )
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
index 8491a6269c32e679faf0e4a40b451432ccd89237..3e1d85b6eacb90b48496ddfee2db27c586f3331e 100644
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


