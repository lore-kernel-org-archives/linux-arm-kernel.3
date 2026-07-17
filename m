Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7192C44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=; b=MlLpIOmjrKmZBGZ/Rly306E+0D
	5fjO7vZrXYaA1mf9WxP73S+hdKPMec2T6VCFSovUm14QixHnSpv/3zkTAHIUHWpCqfXTnkvXs+Gt0
	54qUhsdeSB6QD+Q8aUs2smO7AU4ItBktqLNIg0+SRXsVYPh74HRChahiQg1uGOj2eGJ7d9xItTWT0
	QIN8fNkD6QgoxOCy+P+2Nf6QnLgbAoyv6TzhNJwlcN/09L9nY4biuouccuqlrNc4fewbTKgRJLwyu
	sldwEkA2rJtXQWZwfMKU9421zsfhG6sGNlfwRSP/7CGoUxCUYoSUl0Hp08FTubtNHx0hvHr3fy7FY
	xxVv35eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd4K-00000001T6Y-1c3c;
	Fri, 17 Jul 2026 07:33:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd4H-00000001T58-48t1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 07:33:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6ch6J661881
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=; b=MnJV9wErPEdcL4v/
	WKSR65zU1JUYIwRbmwphgTiecxEYF0PY2JjDk/ZyIWSX+n9PA5Cz701OLOMc9IC4
	SBsbmPbfI3xm0re/ch+V+4HQ7QlW0u3joQCw4030+CC+Ey/DqcBQ94bI42EXEbD2
	us9LDxyeN0q3y6uGLX8bg0AyqgjRTY9LI4xUplnLS3E/zLe14I9JkMOMsDZw0JP9
	Vg3OkzEnIcUlvm588nO/hpke/7LGc7lX8nIhHK2X6LhBUvOuvHTkmQomes7YELSE
	no3zRQEKtwRVME09mZadihIrZ216L9tE4vPw4OTNNXZHPznERfiywsWozSM9JFrO
	zAaUmA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1m9k95n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:33:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc8bde6318so135673845ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 00:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273589; x=1784878389; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=;
        b=cynFDIIogKlznftkeKQri/sSEtta7vMmYXgijjmGe5U5Qybhpiiy+5zW3dUeMKgFbR
         IP5hw0GqSKVk01+TWasPp2Mggw7Z/KdbB3VsiSxY28hjAmqGD9J3iZBXAImk7PNybhUU
         kFJhX8prb/TY+6fxSoIp389iI3zFksTiAXlZHgRyD8XvXz+G8Z7tDUWE3TDc0625b3Od
         3xjR3/54yztT+4APOrq8F6toL24xmuPUeQKXbsadXRQsJN6WMbJpDogo6CLPK1X+h8gu
         Dq5GrI2jdvfQGVaGufWpfkh1vJhz7/n62NuZBC2uIzepNG7FeyoPNIML5FBkMpVME6Mg
         nbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273589; x=1784878389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=;
        b=bVDnbQVAYcHzRJYmNDwI3JbFht5zO8cqub63RTytnZPS8iqoVNtirwBJyv4byU1SNH
         xY3OO514LQ1CgTBhIpFP2L3H0xVYRiFGCOURv6I0h9SEyi6D0lVxoxtVZS7wnAqAp6ke
         PF7OG5P/xyNfNg1JZ91jLmhVOAr86y5xbt1rFp7iWUXj4jiYqCPqRG81hZiGsAvgRIW2
         Q34iVU6lItERxrngibEuP944KCdYAniCvShFe4AFYwxT5nSwmsleA+uViHEhnps0w+eJ
         5f3t84Y4YbxvXjLDGo6qwlHZHJPnBuq5tmcK3deDne4drNlQJBYT0LmWvx5XDTVXbqGN
         FAAg==
X-Forwarded-Encrypted: i=1; AHgh+Rppnx7MrsUa9rl5kWm8FAFAi0qGWygr2jL7lHhS379GS/Cfoa5H8qKYO0vQ+hUmq09r448IYpGH6aX/ZvEYjo8m@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvi6EuCzRHwIi6IAnIObPDnvg0mlbgpeaSPGFPHloFq2aH+vrF
	Spn37xBc3a5ZXd+S/h0FrfGWI6bIBpQqFOMd1uYPPUoA8yPLIXKOecRs3mL0znDByM1po4SMZcd
	RQO7A6Hkb2tJjLlAcxYKuGTkpr4N9Z8TkJ65ltwd7sG6LroVOYR63OiOnyE/VE3YEhlyZvDphzj
	Gmrg==
X-Gm-Gg: AfdE7cnwkZmb9Hvd34EVPawJ5/oj8W7Q/8pus/yKI8KedofRYz58h/8rhZmVxpWD2h8
	YwCHny252jbFTl5ag6wcrX7CK1qw1K5WiDPnxfT4nPdJJG6g4Wu/0Q2Y5kWnCUdzchVi4496dlp
	DggbE786N81Bj3NSORJbo8Vs3V9bvtiyJBjeKE7RmD0PSGCeplOoIy9lw8VtuXsKwzLHtbbJFdn
	ZsCr61fNEfjv9mnvgUDB8NEjhcyn+A3XmR3Q5IO3BzOQYnq9LGK9K2mMVS0mhwg7BnmK2RmrsLz
	bmYIBZel08gQqE+Mdut9x2xgBcHrUdgug5fkWYTWyrTMei2sfM6p59NAA7CSPeQzxb/rOYQMj2V
	Kh6PmillSM3X+I0CpJlVC/rhB
X-Received: by 2002:a17:903:249:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2cf3489556dmr16156645ad.2.1784273588711;
        Fri, 17 Jul 2026 00:33:08 -0700 (PDT)
X-Received: by 2002:a17:903:249:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2cf3489556dmr16156265ad.2.1784273588273;
        Fri, 17 Jul 2026 00:33:08 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:33:07 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:54 +0530
Subject: [PATCH v8 10/10] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-10-5cca1bef2e48@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=IMIyzAvG c=1 sm=1 tr=0 ts=6a59dab5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nFpjIs4uCRy3fSY36ugA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NCBTYWx0ZWRfX8yRK8S291QY/
 RE81I9Y9THdTctbz1KqauiIQhfZHWYf5KDMsIxs2prsfOXPcuTO+Bq0MFvuO2EqgGjaZF6vvbAk
 LfbGPWZB6DsPuQkU6tYLkse3J8GIg68R+w7zUXhCuP5rRShUb7FL/ozRrNMIQHDC0G4Aku8RNOZ
 xDqlye4bDQ5jlvy27yDoMJ7ZTcnSs8UEnyZ2ATrCakljWG3GoBBFajOT3XszoQDpjUBJqriKnTZ
 qEKtxkLvTp9vDGv0QXhqsQQp2qoHZp2EGUIVqPURZDv1NzVeccWfxJGM2NwsPtwlNI0/J/bXm68
 75XDjMvxBJ6d9gpNBkXREeqIGdKra3fjbJzCZlLgwZb0b2Kgs2ljLNUFsSOFGmLdj4J8mGqXD2m
 Bv5vCGgagi1hN0PsXF7pHnzURIOFOcwvXQlZvfCCdSqqG+XMEc5MBOsBQudc+6Hx8SupIYYxGCR
 2RH44bDsAMFXlInga1A==
X-Proofpoint-GUID: WGWehbSxSosEnpYA2yUF6V0tu1OR94vd
X-Proofpoint-ORIG-GUID: WGWehbSxSosEnpYA2yUF6V0tu1OR94vd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NCBTYWx0ZWRfXxMwvn/vleQGY
 bQ3BywCmYLh1G+ryncsVrIlH4obqEXkffkJUQZAiVyjEglM3uDVQKWk8iFAjmJJW+gUymTiTQAm
 DU2BtjLzoxOoMmETc/d0mRgEjfyQ49w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_003310_040008_E70B13D5 
X-CRM114-Status: GOOD (  13.19  )
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

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 76 +++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e4295dba89ecb77c6df60f6f08d15..fed88a699fc264cc49e0bda79870a8dfb0b6c7f7 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -4,9 +4,13 @@
  */
 
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-dispcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1779,6 +1783,24 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -2657,6 +2679,60 @@ mdss_dp0_out: endpoint {
 			};
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,eliza-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1


