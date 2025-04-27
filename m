Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ACBC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 07:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9JVDWMCAzqWR1u6UryQQDq/ChaGbeCp6KGSeOn1UL0=; b=2lb3j+A3xc3HA3OtU0lSZOrrup
	3sA8CwODnGGVoUQxwfGJ9riltZhGKO38dw0L2SZZgI33B4eOXlKDr2ZXG8fsCKbONv+bXpCUG6bFV
	hphVWNnpoxA9Udt+Lv75eQztQ4sjRt2DOJBqIzVv369LLBe/bJoxfbrAxDWRCvWXGFaNGzfR8DLhA
	hSBHYoPfFGps9J1loDke7UwnmGc+zfHquullZr0CnS1Hu08wVtL1mswY29cdx3lWw5J4JmQVyTBCF
	oiJVfeNmO/iZruJZW0qHV+x60TJIqXvToE5xQtC3oC4QbZQWbb4xXxBW9TDk+wlWfXeVANKf0yZ8g
	wRFRntMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wAu-000000034wx-43xG;
	Sun, 27 Apr 2025 07:11:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8w2H-0000000341W-2YyK
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 27 Apr 2025 07:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=m9JVDWMCAzqWR1u6UryQQDq/ChaGbeCp6KGSeOn1UL0=; b=hlHbSUiPDsQ/xGdHtAVedJPCYu
	A7m5kkVhybKcRhawdXHITyvTv91e5s5fSeGYIinXQNDcmh5+EqXenoTfjwvUKcN8hFA+KA0l3umpC
	L0OAasXti6W4n12UzovfPOcVCk8EEPetriIX9rPNVAgfG0xlryzw/1NT6hzNCX6MGyg3K1eOInI1/
	6Q+dP0ROFmb/LMR7ztmkMd01IP0Rr4VtJ/d6UXKWgX9k+6bzJOJbBFEmGwyN0rV0mbGI7NvJRzYm0
	F0HEA8uXyUczFuicEj8fvRzxApU5zVQ2pDZw95wXBUzNl2RyQcTl20EsND8U+7tcmJ+aBffkEUJS0
	WwIQ3wow==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8w2D-0000000CQ3S-3E32
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 07:02:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53QGM3fk012183;
	Sun, 27 Apr 2025 07:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m9JVDWMCAzqWR1u6UryQQDq/ChaGbeCp6KGSeOn1UL0=; b=niAFPxPumiZebquE
	O0Kt4/O4kR2pLb5aZyoIKnCymjhoAPcW9ZNNeFVSZq6xopPkusvVcp2yAzF+uMM6
	LqjQvA13fCYvAcbLhQ97A7DA7icP39N1rTMAPEZa1vGWeraltJ6w/rFchkF6dNfE
	sVo06h3c7uy0vv7JWVtGcuORDvDPqpqPKmLMMQ4uSxGRw6sRQxOKyGJsmst3F4qy
	EOqhxYAvTtcIPBJXMobyAgdCUpuiSl4BRoAX5fj3Bq39LQJKTITRRQfMDxe1IifE
	G8u06YSy+dJId63RZJUJUSi0+WTRR9sHETRXt4RUCZ9lNcJyK7ehoPkd7D+47CfX
	vSX70w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hk3yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:02:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53R72Voq005857
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:02:31 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 27 Apr 2025 00:02:25 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Suresh
 Vankadara" <quic_svankada@quicinc.com>
Subject: [PATCH RFC/WIP v2 4/9] arm64: dts: qcom: sa8775p: Add support for camss
Date: Sun, 27 Apr 2025 12:31:30 +0530
Message-ID: <20250427070135.884623-5-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AvonUAahPUxxNKLaiIciRmGlqCoHQ9tT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDA1NSBTYWx0ZWRfXwJ0jDyywnW+f J0itzjRGN40O7YJ9AwXvvJBkdbqgbUeL/ibKsF9rY8wO5lg6FrVZEPnZZTl1fQ9biuxcaZ53Iwx Um+s/04ec/kPibkGONXKhHvaHSbJ44HmnLB1TkvWYqin8L3GkHsZknfdBMVxAU24hCWMuY6yImO
 mx+2425adcj+AwpOn9tI3y3g5jES0Szek5fZydf1H5HKoVqxyXm1JOAbsve3/wCyc1YEot5eWxm tFD/4pL4IDG/haKBAaIKeGZFXL6bvWZjnO+z6n0yDc2/dXqAw2FE+E7P3Pp0pymXBjcxa9Wz2bD UEbNBu62X4vL05kSPeM5aMMRWe3Ik65jYd2DlKGcTorm7LezgoklZu56Pe/8Ce8nl4r0qPZ5XGl
 FBXt9ZZIf24H9lFZNAP+Lal8Kna/hng7EZNtwyvY4a3IwD3kpmXqiqcQtwRFCJpi8JixnG2h
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680dd688 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=WgNu7LmV0eYBmLmTV2UA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AvonUAahPUxxNKLaiIciRmGlqCoHQ9tT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=871 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504270055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_080242_233024_883BD4AE 
X-CRM114-Status: GOOD (  11.72  )
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

Add changes to support the camera subsystem on the SA8775P.

Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 187 ++++++++++++++++++++++++++
 1 file changed, 187 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 5bd0c03476b1..81eadb2bb663 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
 #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
 #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
 #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
@@ -3940,6 +3941,192 @@ videocc: clock-controller@abf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: isp@ac7a000 {
+			compatible = "qcom,sa8775p-camss";
+
+			reg = <0x0 0xac7a000 0x0 0x0f00>,
+			      <0x0 0xac7c000 0x0 0x0f00>,
+			      <0x0 0xac84000 0x0 0x0f00>,
+			      <0x0 0xac88000 0x0 0x0f00>,
+			      <0x0 0xac8c000 0x0 0x0f00>,
+			      <0x0 0xac90000 0x0 0x0f00>,
+			      <0x0 0xac94000 0x0 0x0f00>,
+			      <0x0 0xac78000 0x0 0x1000>,
+			      <0x0 0xac9c000 0x0 0x2000>,
+			      <0x0 0xac9e000 0x0 0x2000>,
+			      <0x0 0xaca0000 0x0 0x2000>,
+			      <0x0 0xaca2000 0x0 0x2000>,
+			      <0x0 0xacac000 0x0 0x0400>,
+			      <0x0 0xacad000 0x0 0x0400>,
+			      <0x0 0xacae000 0x0 0x0400>,
+			      <0x0 0xac4d000 0x0 0xd000>,
+			      <0x0 0xac5a000 0x0 0xd000>,
+			      <0x0 0xac85000 0x0 0x0d00>,
+			      <0x0 0xac89000 0x0 0x0d00>,
+			      <0x0 0xac8d000 0x0 0x0d00>,
+			      <0x0 0xac91000 0x0 0x0d00>,
+			      <0x0 0xac95000 0x0 0x0d00>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csid_lite2",
+				    "csid_lite3",
+				    "csid_lite4",
+				    "csid_wrapper",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "tpg0",
+				    "tpg1",
+				    "tpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite0",
+				    "vfe_lite1",
+				    "vfe_lite2",
+				    "vfe_lite3",
+				    "vfe_lite4";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_ICP_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+			clock-names = "camnoc_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb_clk",
+				      "cpas_ife_lite",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "csid",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy3",
+				      "csiphy3_timer",
+				      "csiphy_rx",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "icp_ahb",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csid_lite2",
+					  "csid_lite3",
+					  "csid_lite4",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy3",
+					  "tpg0",
+					  "tpg1",
+					  "tpg2",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite0",
+					  "vfe_lite1",
+					  "vfe_lite2",
+					  "vfe_lite3",
+					  "vfe_lite4";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_0",
+					     "sf_0";
+
+			iommus = <&apps_smmu 0x3400 0x20>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
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
+
+				port@3 {
+					reg = <3>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,sa8775p-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;
-- 
2.25.1


