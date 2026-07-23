Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDC4C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 04:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+zagSHROFEodx+Lk0GjyCrhmWq2ocvbAsIK+kpUx1s=; b=1upzDBX1WWfJK4wGa3VIltg178
	DAc55yQOh6ubeYqtM9phGpvQ5GNLYvIA6n2jFwgbmQDSHwZnaFH2gr3V+GDXoajjpCw4uYwvfcQfL
	seEx7ImIg2gxL52dsEqvLPYXa9GPs4sswLbsa6jdVO98BeSLTrz5JRBi1y26udeblUjJYsSl9rL0S
	a1ebxVe7SI0w9latUcTy1dd2gYe6qlJNYYh4Rx8o8ZitNnzFGm+6M+8u2gxaSIyVkI1U0SPdJXa7b
	o/dwiB80Q6qaQD1Zsdv37FiTuk2xO8HTdzll+5bl9nUKbcFplB7hNiiLHPJtHPmKcWfJwDivL+7V7
	IWnxXSIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlIU-0000000DQ4z-1sot;
	Thu, 23 Jul 2026 04:44:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlIN-0000000DQ2I-3KtJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:44:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WpEa2260465
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 04:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+zagSHROFEodx+Lk0GjyCrhmWq2ocvbAsIK+kpUx1s=; b=gsniN3EXpXixFTom
	iuTVT4ew1b2CajxKkSUbAuahpegxuzwUMx5hvg2VO7x16+bx/R3feX7AeBcdLyLC
	oheTqkVwiotWCsTc7nrw5357q2PbZ2IoG/X8JBhPiDErXKXOgTcXL1NujV8Wcn/O
	nNyqjPoAAs+073/pkQbtqYvPDlR9ClqOQd/rybN3PIqDRsku3uUlCqWp3e58VNgD
	hlrUDYAuKY78L7QJp0ZPvIh+h+USUuH6NfSQFRex7sQJXjdrVxpbZqdf4Gzr/4i7
	oGFKTzq24xvJ15Q+yEicDgtuL4XTEgX9gCMtNBaS1fEoZg2jSRz1rln4dbFte4Jo
	aCw9YA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275jakj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 04:44:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e01a62d99so521893b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 21:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781871; x=1785386671; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+zagSHROFEodx+Lk0GjyCrhmWq2ocvbAsIK+kpUx1s=;
        b=Uae4ZlRrqqOhQgs0xkSUjg392pczGC2LCxLYvjWZtPavDxrrft0EVyWW6ptTx+Vz46
         nSGgNK3qBhQ/JzfkPknIOhRZ3VuJyvyV442M8tXUlnBDEOaDLTm2JLGqdqKtySmUq+P/
         uRvuT0uNYJTznq2xd4AQPDoaNrBwFb9laI8Dbg+6tQHn7GmXZapfjAV555xuOA1DHr9l
         mGXAI7pQELDWohBFx8As0nIesWFQXPO0PsHfdR0BQtykg94jlwqQjhE3thcYNAIeHx6Z
         sa53++dTT+rwoJG/6+3TruKjs1Q5crvmU30r7fceAS0w4miNKYkwEQbs8Ezg0N/+0h7x
         rcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781871; x=1785386671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+zagSHROFEodx+Lk0GjyCrhmWq2ocvbAsIK+kpUx1s=;
        b=QaO/PyXFGyfhdBS17UJY0/31SJttj7bLBLEqvRAHU1I/Ts/A30BjU5FZoK6Tu+JQPR
         m2Zc9vgXL97fHNPc85UZYmkT1K+cjYDUWsx5bEnBIbQ+EXEGz30U2To8DNKN1148CGoE
         TDLBhI/v+Lkez9M5Zv20QCl/qyqzGhFFNzIZTO3hSwbSWKg1/4mwBpPvE9h+mBwJ2Q1J
         SG3oeivZMIgrBBmWnzJVBZSGFVH3hB6+uwyo7AeJUPv4244pa87aQnWkumqv2abvHsbz
         aJmqKcXuYGmMRtHn4Y1UuHAwA2z6mu3hgIRhT6i1jRXPEQazXSQ3GR52Y9EPeT517Mak
         RkBA==
X-Forwarded-Encrypted: i=1; AHgh+RoYsPbb3TNJpvxWGcng91KsZIJuTKA3HPYarcbtQrYdlEDFQ9Mc2i3L1X1TPlDD3/UC9jfpjGA6F96H92aSwSWn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9kJtG7pPirOmgsA44q9F+KsmYfZXyAU+z4tY+LWnmPEdjyLwc
	VpHqhfbd9Wcg1R+S3CcC5pwaRC/XdXmlvJl6O1uj9QE9XBSYRpu8WuayQhwNy8IrFukJaS2FFiQ
	Xw1Pxf23q7OrpQFCsE2bdWVdnovZ1iC3JkjFdtvFgWOlQPfC/DGFoK2JdHQ037HAcrTVvCqEbU7
	xFuQ==
X-Gm-Gg: AR+sD11K1GcrMO51hRT2a9apdRkkhooc3HRMbJ7qlgswG3YQr+oaHGE2D08vCmofp67
	SQEnWlTCwlEWCpFWltHdSR8OkWs/G0JQNgEFKtg0e978XnzOtwjsqmrWguSA2DZ7L/D/wVhgOtx
	Tpl1Ha3FVlk7xZMclOxoMxGc4W/VkRdD83tSf3VcoHvYYneQW6bjJ3nG332wsDH6W/nUv76furE
	sbRe1pdqIzZff5a4Amr00jV4uCMGyA2jMPtf7hfnzpifz+rkhqlqEFNF9sRm9xrHty+G2fGSbwb
	TDl7T8eI6fI3VpUfr3so+xOx6KOOpvyjXQkMxDZJiJuEEjtFWUvT2uWneyjgUezQS/t3t6FVa9m
	kalq8QATo+bAoaXEhnCmvwxVa2OlL5es=
X-Received: by 2002:a05:6a00:4505:b0:848:3f91:da82 with SMTP id d2e1a72fcca58-84e2bc69e37mr1849195b3a.32.1784781870575;
        Wed, 22 Jul 2026 21:44:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:4505:b0:848:3f91:da82 with SMTP id d2e1a72fcca58-84e2bc69e37mr1849167b3a.32.1784781870157;
        Wed, 22 Jul 2026 21:44:30 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:29 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:13:57 +0530
Subject: [PATCH v6 3/6] arm64: dts: qcom: shikra: Add CCI definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-camss-review-v6-3-7c46f9bbb4db@oss.qualcomm.com>
References: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=2668;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=fvp+ta5kyo9P1ISBE724MVFIdf/YdhpsBaN9p/esYwU=;
 b=aCFsFVSI+19VMBFO+CGAO6movLwyzk2+QHAfc13mdaxkAdQ3arJ42R1jN5tgn6crl6pwlEWUa
 0xPgJ779uO+D+oYwRatYhSbhwkpXFQDjQfx1EzVOZzDF7T1179TJlgh
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a619c2f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZbC1Des45MQyGPwI-hwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX5JKcJFAPXR7a
 jERwZFhlgGLbNCBt27JnmZRsM4NqTxK/QlujPMckYDtwJzY/GeVUeYMXmFcZdOFH6yBv5269wNX
 cpQQ28IX1o+677yQNUsDBn7+LT+xFYY=
X-Proofpoint-GUID: T4CfEwmljc3SanfbG643c0IqTdbfWNyQ
X-Proofpoint-ORIG-GUID: T4CfEwmljc3SanfbG643c0IqTdbfWNyQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXz7UwBAqsBaZu
 QSZSjvfrd8rUV4dxPU9NRx+K1AmfnneuyxDgehVwO0P9izxWNrC3OPO4oHi3PQaSYwn/4iwdv1e
 DlE3WMLX0lO/9MBplTLn4+S4V7YP7JFtfCjHvu/mhd5oOjcwFjjck6XoSi79eNDmlQNeZNEB665
 4j3K7lE9Mxge/FlbF26fgTs5+LDVG4NXBDuN+V54XuLLvoQ6zyWImxgQxW5iRoGg3jOXZsImKo+
 UaObTx2cgrrla79we9+GHKP7FSqedzyyk/0csKWOnPYmJBKh/kzkeBUaM7sBVmYjUin0+2dXDyP
 /EpWnU9+eJkYDVUz253CGUNEeKTddiqGdNk7hcrvCWyTdkAm6TB48cK8DM4AVG3dznq9/sli8YS
 y3mHFwIBQEBqjC+Gp5wp5KyuR3Kaq0gn1KCJi6QTpm82S4HtXjfDeQKajNdnWvp7pDNL/lmtJbC
 8S4vtz3/Md92PQrSPyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_214431_849144_1A351361 
X-CRM114-Status: GOOD (  13.38  )
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

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index f7caee4cffdf72b7e98f5dd33a33419087cb8b57..215ca0743d943dde71045c331f7cef6ee4d9e9d2 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -355,6 +355,38 @@ qup_uart0_default: qup-uart0-default-state {
 				bias-disable;
 			};
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -738,6 +770,44 @@ port@1 {
 					reg = <1>;
 				};
 			};
+
+		};
+
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		sram@c11e000 {

-- 
2.34.1


