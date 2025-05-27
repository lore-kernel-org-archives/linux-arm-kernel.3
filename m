Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E068C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 21:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+R55bDvd2i6fMCr67D+fFGu07eFzF+YQ+BvBZJYOtis=; b=v/52ai/I+WbECnf9Ei4Cgd/GsI
	zPbHajcrC90cf5lt+g9JM7TzF4LQci1VntegMl6GQKo1/ZoY8NfGgUo64ECcAGzjE4gsn87C+6Nx6
	/v7zGKurXHFNvpPfdp7TcQc4b7wSmzyVwVeczhLQFxfsrboNpYiO9rP/cM4XQdZ+yZXJazupk7pIG
	vQ5tHEu1NyG6gReitXCQYIc3nKn0SQ/E61JUa+m+Xx0nUEwkhrOSVYjixGW/nHaIafR7TyWWIHPqt
	htRZcUh3Gfc8hV/3vFDn1625imXVWi1yw2Rt1Arg4wPjwg+xRK6f7V6Dm9WOd24TD5nSToibFdg0G
	wYfIS1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1km-0000000Bany-119T;
	Tue, 27 May 2025 21:22:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1Tu-0000000BYw1-2Wjd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 21:05:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RIg6ZJ001576
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 21:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+R55bDvd2i6fMCr67D+fFGu07eFzF+YQ+BvBZJYOtis=; b=nASkK0tzI9M1YF1e
	ctEpsw+a2EFynb0E/6ceqpE8PeV4GAzsEDI9iYXQntOBVWTRIlHX9M7B9WM+fKLr
	1hGJlfYIYMdLa+BsoguxUDJlsnJblXFi6ZxLuOdGoShuc9aBYgZ4fzmGMASjy4cI
	OPIddWCpeSHtzS13QEpCA8x3NjQIFAjKNIrOdS+6HDWVw4yTpWK2WgpmEAjU3HDJ
	uCGmSYGRA2YUSMQd25LtJ87QhOX4PzIcJSoSKW0HG2Rx82a0MP8VXNfW0c+GIF7U
	7BK2OGf5L/bAy2gXt0ifS5GfYf3nTXCwyambSHbnp5tzje6QaBmnNDUG+8GuD6Rh
	97d8tw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavksyfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 21:05:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74292762324so2585377b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 14:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379905; x=1748984705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+R55bDvd2i6fMCr67D+fFGu07eFzF+YQ+BvBZJYOtis=;
        b=RGEiwhERLBwLfHbMGkpIry9/CraFhgunA9pQljiqLNmFj3cNn+MJRJHmS6+rnrTTqv
         WXXh32aE8345v7UM9eTt59hRuWQ8w24k3v3DRMA0fJ0WDw78uczy64AdjvafW8e918Yq
         AI7SF+Zzpb8/TKIRli1giKNKU/T/8csvxFtELUMQFxi6lBlpz821nozPR1aLZ7NEgVU0
         C2MrHeAzgFT86afPqNTkxiSgNw/YxlKhSKTY/PpKW2AoqcbIUyDQisVISSA9UJbqEj4P
         xdLIZbPxpJLIldyPRzgPJSewDFrEhrOX4wWrJHTBhgT/PeYgDiLsoSFTIkZUjRaUAnma
         i8mA==
X-Forwarded-Encrypted: i=1; AJvYcCUHxZ4HH4BJ3j3Xc04eohYflHoWOMiPsEOPuhpVa0BeGjCuO23yUmROlIRIc7/XYMtzD0iEZG6HK20mCgap9nPT@lists.infradead.org
X-Gm-Message-State: AOJu0YwIXDprAaKrwCa7BpHlnWPlxMZob5b7ZB83szIO7Luzwn4tpOIN
	muFoaT7fiPXeyFRjztAzy/s6mcro7aBwmlqhj7jvYkdHrFrQ+KmUzdVWJv4l+8mfnkHQ0egrsh7
	x6m7p99zFvC9zGL9KLUbhqeBXcZPtvfcg5nXXw6fManK4om16zwTWnVS2HpYdIjarmkE90UkcCD
	gI3HaBIvaZ2w==
X-Gm-Gg: ASbGncu3DWusiNHwrBKLhLFHrDr5uVmK7WKGgPh7Nz3r/kv3X1chvIWLpga7cIWhuO/
	Sh/BiRdT0Yt2+z0rB5ijM8ph3Zw3NFWHNmLaTerSmIwx6JEWR6LZeCbkIcaIVSWRijHdkDiUYNv
	8Tx980tFJmllNsq/3/HeIX/Z3mW797krmbEvkSFBc79LI8VNTaMzypMs0Kzh70hDI34K7vGgpCt
	jtGTjoTJRwKQ8vfq79iYw4m8BSRhPHFT9wfKQOONj0bk4DnIip7h7CNZyOw3p+QFHpVW1HRchKW
	BKbwPqrEnc4HL6nuqz5aRvhmFv69y4iuILN1zi5wmFhZyT3o0+5aONu1SSV62hbmizI=
X-Received: by 2002:a05:6a00:2d1b:b0:740:4095:4d07 with SMTP id d2e1a72fcca58-745fdf4aabcmr23423667b3a.12.1748379904943;
        Tue, 27 May 2025 14:05:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGF3F/0WuD1I/uFyifDLb+DPIbx6i8n8BnLXMFGs56DuGIiLm5xJPWIJar210TA0fKEm+zAug==
X-Received: by 2002:a05:6a00:2d1b:b0:740:4095:4d07 with SMTP id d2e1a72fcca58-745fdf4aabcmr23423588b3a.12.1748379904421;
        Tue, 27 May 2025 14:05:04 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:05:03 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:43 -0700
Subject: [PATCH v6 07/10] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-7-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=5686;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=+Rqpl60bvMJUwvbS+tvLZ+jZaj0RAwENmyzWKv4OcjE=;
 b=NQyoaBHmECAVGHIGRBOL8RKALjCiTvQacv/P61bnVDWHA0mO1TPh+XBlwznl8HgyNawFpp4lI
 ShPBlLR7OBsAggDbkxU57YRcprYao+1cAkvAwPmMuVq8iVsEfeefgHa
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: tbfex6VCT3vHtOlHONmHecWoyodaMaXv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX4aU8x/Mlprud
 msG7ObeGleWYqTVIDur0OUZIT3+hS6MuYs8IASSehHVG6sIbfNVTq2oYStWT/4Ak2zNBuHRppPL
 kUmH83oR80x7Qc+i2uRJJkCyiR517ux/79vSdlbgO714gnHFwjK7oZzZPdfVZbptLKCugyvhuWd
 Q9zZk+RxM8jeo/vlLC7PaSVtE4PHymoz7XadNgZtotpEy9NIDF+JoPcnqc2AxQDUpjQKXVbNLVd
 jg7JLNeHE5ICPemA0yb8gRkF2tSgBFKEp66uf1cgYCDHkL3twfkPG85jTQkemX0vRU5r63yA3gM
 4c367nZwFH/WEUrrAUsUWGT/FoyWiVMLBQwBbEMGr2LyUIGC630+wdYgL4U8zGg0yLTmoZ43zHz
 Ar3NjB97XBOXEeLqJFxBYokWSxTC//vVYzR54+hkfCKEAruJFuiEgd5FK0w6yCcvSCizWS/n
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=68362902 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=n1SQX4eW7R_9Zp26JX0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: tbfex6VCT3vHtOlHONmHecWoyodaMaXv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_140506_665251_18F730DE 
X-CRM114-Status: GOOD (  15.28  )
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

From: Wesley Cheng <quic_wcheng@quicinc.com>

Add the base USB devicetree definitions for SM8750 platforms.  The overall
chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
(rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is the
transition to using the M31 eUSB2 PHY compared to previous SoCs.

Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 164 +++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 980ba1ca23c487b9225b73872889f02c2611e68e..a1c54ced7fe5b83671ccab3bbf870c9c10c27e05 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
@@ -2462,6 +2463,169 @@ data-pins {
 			};
 		};
 
+		usb_1_hsphy: phy@88e3000 {
+			compatible = "qcom,sm8750-m31-eusb2-phy";
+			reg = <0x0 0x88e3000 0x0 0x29c>;
+
+			clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_dp_qmpphy: phy@88e8000 {
+			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
+			reg = <0x0 0x088e8000 0x0 0x4000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&tcsrcc TCSR_USB3_CLKREF_EN>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			orientation-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dp_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dp_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_dp_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
+		};
+
+		usb_1: usb@a6f8800 {
+			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
+			reg = <0x0 0x0a6f8800 0x0 0x400>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			usb_1_dwc3: usb@a600000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x0a600000 0x0 0xe000>;
+
+				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+
+				iommus = <&apps_smmu 0x40 0x0>;
+
+				phys = <&usb_1_hsphy>, <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+				phy-names = "usb2-phy", "usb3-phy";
+
+				snps,hird-threshold = /bits/ 8 <0x0>;
+				snps,usb2-gadget-lpm-disable;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
+				snps,is-utmi-l1-suspend;
+				snps,usb3_lpm_capable;
+				snps,usb2-lpm-disable;
+				snps,has-lpm-erratum;
+				tx-fifo-resize;
+
+				dma-coherent;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
+						};
+					};
+				};
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;

-- 
2.48.1


