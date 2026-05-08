Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7921ECD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 11:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lUfbSzHokBAbhf+FTi5ZKM0wliKzbivz6yle+r6Q8Y=; b=B3c5LjlVaILp2v8BqqX06vHljW
	8Sq/dXjrWBtbiR6JUCov6SREVdWPh4lE5hCi5s5RtGKphk+lvBfoDcdMj6CrDGRHE0Q9/kyw13TtG
	ZCgVTyapdQPLl1D6u2lwu3rNOBxcsYRq1dIwPZRBdUNyYN+U7/5k2EQbHe85hnfB+0BlK9zGqyrBt
	j3F+uwCrFdsF+PnjalRM4RV3BseeNMsnbP9THO42+vASnz3/QDAhpAjGFZzCqlU8tqlvDd5Kv9uAg
	Z5MMz8zbzFIjEKOgyYD+xnh/ah36xiS3pnbHBGyVg+/M7WpuIVOItyTYbOvJm0zqj9g+q04NCIw7V
	eKd9XSWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJaB-00000006MrQ-2sqh;
	Fri, 08 May 2026 11:41:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJa7-00000006Mof-0N2q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 11:41:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64863cH21173965
	for <linux-arm-kernel@lists.infradead.org>; Fri, 8 May 2026 11:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3lUfbSzHokBAbhf+FTi5ZKM0wliKzbivz6yle+r6Q8Y=; b=Xebmvqyra6sMtzTX
	swcqjpfSqrvDMUqUE+Q3d8+0LuBvOi3FSH9SpZ+rMsHP72xE+bDtQZ2qF2GCTD9t
	iYbXpzdA2RIOyS+ykSFhon/g10NsJ1hRNzEoLjuQ1SYyc0jT9Bl3eslORXxAyQKU
	sBHy2A3g4s8Cg6Uc41/K6RXpFvmu5XLeU+n9gRQqxzAFBDc/G6QdEpC0b59ZSb/w
	FOY0IbpkvSfz33D4jFnPkx77ABTrPhDsaVVGKJ2hov6CttpuipyiGQ4u1CqHbkgX
	wm1RFdWKjZRAYtlTxk4Ve42+b8HJqoCx4+7PeVWJjHaA2vSjB7I2yFSiM/o9/C3x
	yD8y3Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132hapyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 11:41:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eaee67d1afso189828985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 04:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240481; x=1778845281; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lUfbSzHokBAbhf+FTi5ZKM0wliKzbivz6yle+r6Q8Y=;
        b=C2CZsHUpjDZ2LgGiTOq5PR5OW2a70euPj/k2GFXmwuS34Z1eKTjvzONQGZUx6ShCDZ
         pOXmOh02JgSI5MDeXfEwjaiPhbw7W0AB9EbjQ4FfPujkDgxAXKZtGXYLKa6iubQTGQug
         0dFVpxdgT9/4A0kF8dmz6iD+jg5fbmNW7H8N+m4WqxWP1pEgbDeXg0wl2/Gah6egCx7B
         9QQSMfs/CpakX6Ec30TueYMYe1r4GI+d3aq4+sc9VQndp8ogks0jvGAl8rgUx2uStpFb
         3G2geGV4llJqUh4DQjA2YqTdlX9A/Y+xffF348euHIxIT5jFrJ7JdGfCnGOz+rr2exzB
         x3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240481; x=1778845281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3lUfbSzHokBAbhf+FTi5ZKM0wliKzbivz6yle+r6Q8Y=;
        b=rXK8heNCfOF9weT/pxVso99B59L9QwPF54QYI6xOofPCxP0myVUEBq7XPJa07oCZ4J
         CbDnX+L91VebrNxqkUciJc1PeuG2XxYxWvKa5kavfPfr13GX85QHtWmSP3JECw9Cnyrg
         /OzbtMwDEzMOa0UBICT8OkV2NHcpJP7E+rgWLZuf6mRHuAzXD7OeuBpIybObcb98fPVX
         ioqmFvYuSdHwo+1b1ll6JCPVJTrI9yCLqSUxHgGPbQV4Pof3uTSNRc96zotVOK6Lq2il
         EPxHBbftFLmI3dmXS8WjwI0rUR4B0Pd0Oi3Pi4Jdzxde5syipyno8ebkPBPuWlPfkr+S
         lucw==
X-Forwarded-Encrypted: i=1; AFNElJ+VIS+Ovx/C7+5fTp9wJRZeU0bdz4xB5bKxQJs3ixHG+sln5MSj4QF61rHIWkPcAYY5lbYs6J3695HXvrlXGIuj@lists.infradead.org
X-Gm-Message-State: AOJu0YyafWNphZ2Z+uRDruTSdIlNeZwb4sCzWmfu7xp74JWCgTtPfCMH
	NDNlMNh0fAsS4ZdbwXM3Wwwea7oV+JK2KM0kqpu6r98Be2i5UjaA4+KZy0vhZM09Dmk167JQ1Tk
	WoWrBvAegehYV5y7xu6WyWGwh9cOcflu8vFHPxo2s9AGQZlcAmOwSSMhUjic/Jl/Yr7MPy0zbiv
	7VJA==
X-Gm-Gg: AeBDievskI7hlVRS5uNg0ivDIeIGMUjWx3A33zehviyY8AvN0qNYuwYz9YnOmgQF/Em
	WbCt8/ZRaZaBkfjFtFeRRK7BTfPSnr9gW0HTjoIgYNjCTKFxNy1v8LX3Y6TBcAF2ZpKgW2NXmzf
	3Q3Wbz6s+aTqE9UQ86vdjhJi8vIQwQqtp+sWQ0AQaH8FIx2+whe+jfkEd/9D/N/e3sNfaA43b20
	7cOyS8cVeRiIIilE+yU6sth01gskqhPPhWb5OCv9oFWiPV5S85iwHCeNgUN3fUvzarIvWgv+i+t
	dg2eyrVo9WT5WhB9AGJ9NhSSWTyIc0Lg+fpCsRLU++Sn59DKfv+xbDklqzmz2LKy+ArQHmyMdnV
	XiJDuSfSXk10i9ViJuAPQBzY5rl6LULV/KRbLPSK03fcPO4j2UCGfEPBQDmg4wnv0hzaMuzoso8
	qw1DZNvJDOJE/S
X-Received: by 2002:a05:620a:370d:b0:8d0:27b8:fb7 with SMTP id af79cd13be357-904d68e0a4dmr1850236685a.46.1778240481423;
        Fri, 08 May 2026 04:41:21 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:8d0:27b8:fb7 with SMTP id af79cd13be357-904d68e0a4dmr1850230785a.46.1778240480777;
        Fri, 08 May 2026 04:41:20 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:20 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:39:59 +0800
Subject: [PATCH v2 3/7] arm64: dts: qcom: x1e80100: Add CCI definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-3-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=5190;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=/I0mDof07x8EifLd7501yc6I3MTWZ4BBdf4ShwpUlpM=;
 b=CqwPvq9TmB48DqZyALYSV4F40gjNSmgNzB4Q9Ok04YbO8qTyGp4xqlb3vxMKLnirJRHw4MFZd
 pdss89cjjQyC/IzDy04KqUE0vjKKMazgFQA/K+rIFFMJQRDoChTfW6K
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX4Ts8lN62uOsi
 DTZvp8LDXaUyluc8K0LMDus9BJ80fbcmRRenQ3OZjocqmBCxHBdRrm9tbbccHEmGvh3a0pqHjTq
 COnUA+ui9AvnnRt8sgO36ID/HgUyG/io5EsuHfpNvrdD8pVben63JonijAcyxO7WShTnLhUljbj
 YjLlKgt4VIMCoPa9Kv5gcPSIBLbnkRnC8Kxpd86IQpQ0PnXdu67gT3GwyrTYcULS2hoA+Y4HOuR
 3AiTObSx/2dA/QpvD4kzDGmX8XZVKFTSFCrSXRMEf2fSg+/lrBpaCGACsMZ3cxlYCIe5AuKt/sF
 bvUVRblvVzUszbl2nhajmgyEuTThUfBYHDuE4KhVcF/J799RIIwG5xyr95jFibwxTVWYe5+23fT
 goqi6N0QHRWox9MLCM/DaztXDRzgS5Wvfzh8btYDqtAjA0xWOr/hmDvVNU2gkc7tdtJpbsnhGId
 ve5la4e6Kqd5PKLN9/Q==
X-Proofpoint-ORIG-GUID: -yp8WuyfbahqsHVHce5F2S-kfWbl9hdx
X-Proofpoint-GUID: -yp8WuyfbahqsHVHce5F2S-kfWbl9hdx
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fdcbe2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EFDngOt3UxJXKfoqbMMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_044123_258006_4C5B2360 
X-CRM114-Status: GOOD (  13.05  )
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

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add in two CCI buses.

One bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio101
cci_i2c_scl0 = gpio102

cci_i2c_sda1 = gpio103
cci_i2c_scl1 = gpio104

The second bus has two CCI bus master pinouts:
cci_i2c_sda2 = gpio105
cci_i2c_scl2 = gpio106

aon_cci_i2c_sda3 = gpio235
aon_cci_i2c_scl3 = gpio236

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 150 ++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index c31462ba393fd77b7124db2ce680663945e7fee5..74d6e4300506645a63e09490883eabf749829e58 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5551,6 +5551,84 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;
@@ -6201,6 +6279,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			edp0_hpd_default: edp0-hpd-default-state {
 				pins = "gpio119";
 				function = "edp0_hot";

-- 
2.34.1


