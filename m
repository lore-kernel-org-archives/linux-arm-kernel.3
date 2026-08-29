Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459D7C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 19:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6P26DwrRHs6Nh+TbrqSZhsbcxSipg8Yf1pSl3q29CEY=; b=lqpdIvTROS+hwZ3vtz/tb8KPIQ
	9gktxj22MoaHE1BECFWTky8WykrVRHvodv+4NMtyHxx6k1cY1zlRevksj8DDXJG1/lajEiZ6pTJdg
	QLDCuX68kOiM7l+XilkCKVRVQ4MrOSR04ST6rQcF2cbNSUSqyZrQhJvpAK7UY14ujq9BvJHnNWyCZ
	xQ1e4g9x935nCtmfZYN2EReN4MXkLohVTP2X1uAtBVoQIxJzTjDUTNZJFdUsi6ext9xyuGFoFW+PN
	+qVgpWUNv99z79zQeee3YQZcyZeVwWdxmG/zxQld3d1eDkH+xycz743nWVr8w7Bs6NSc9YIA1oWsz
	8tmV6W1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ouy-00000007GIJ-1fxE;
	Sat, 29 Aug 2026 19:40:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ouu-00000007GGE-3vqt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 19:40:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TH01e63456593
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6P26DwrRHs6
	Nh+TbrqSZhsbcxSipg8Yf1pSl3q29CEY=; b=PrW5MyWRVSwKB+zE6EUaWK7LwjM
	IrU54G5jmlKiI3KvfbHpTLuMyHF2YBLEvQp0NHWFS4lCOPBrM3lKSdNmP/sMSD5X
	MjlbFOEbNzMziNGGdwT3hUXKpPb79uvJ8zWBKXBesOOzEDolbeV4tCWWl6AWAwJg
	AU0sqB6HlQEkhk6P+yObOpejDOKT8lGJxbcuU476v/Jqkag/oK4bquM8l9t4lYeI
	U9N8/+gyLkhHPaTUq0Jnrh1ygH5NTqppwQJmBypfz0utHcWi8BFnKTlV2nmFUeBy
	rGBZYhrloq/aGMqeXTJtzeDIB7yxh3ZbgGHu51ZM7Ks8SSe7NXCdGL9FoYg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmsn8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:40:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ff14b1c02so42807751cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 12:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032439; x=1788637239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6P26DwrRHs6Nh+TbrqSZhsbcxSipg8Yf1pSl3q29CEY=;
        b=ggsmLJ7s39UwNi/I7WGTr7P3M+WZqVExjMsSJ7wmCiQv6PdTO0vldeFgwL/smPQDAp
         Uq7ZzbMDMDe9Lcl6k21pmI4bPgxHBjqRbRPQNgpaCaVR9QqOBBLN6MOpZdp7n88lukWN
         3A6v2GcuUzrhH6R4hzS/aiooEsfS/SV3TBShgYx6pILo0G0vxeoAu7OCL9a6vqU5V0nJ
         iPc6nxmHvdBeeWm71ZgrnxHmfZpDuT82Stg+ZIUgXVLdFwEJoYGZ6Vvkklce+QD2CUXk
         oxtCc3L5v2cQ1U2W2qS4pXHkrB14hb8UdDX0jP8QVW+Crr0x3CFmvq6PLnnaOdiyf0iC
         JQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032439; x=1788637239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6P26DwrRHs6Nh+TbrqSZhsbcxSipg8Yf1pSl3q29CEY=;
        b=KZolZfT8/OSQhA4EiRCfuyMx7PmyUkd7OefTi/4+5juMmOXfdKkd543/DzY+Og+yAa
         MP1VEAm7Zd7EZ+gjEK2GLSR6UO2ZQ+3LmHrmX5fQ1kYq3tlz/MuGILQddwuQPqLkfu09
         slGYXjuUju832EinAzOxeLopYHz/Jp7p+S2GSD3AXz7bg6+/NWfbscAUQgywv7iUtx6x
         YagADhJdMIMqBhlzz7g5iFlwPgChKv8RxAhPU/8g8uecTuHIDP8fhNrQhe/wHbPDXGqs
         y1PW2FJZ4aCSXuEzEmmx5msXaQyDhNc2kbVDlt5PNFdmQgveg4d8gg8wqZieB2j+2WLW
         Ovdg==
X-Forwarded-Encrypted: i=1; AHgh+RrYhNjDSUCxC6NI46azEWMwRmv9iACHIZIdL1MalBPKFYWCxo06jd+/Oxbsbe+N0AbjKY9u+9Mc100ijq5S+zpP@lists.infradead.org
X-Gm-Message-State: AFuF++kVPU/dC1eM7SVwH1IrqUn4hkDDCjlitTFK0jAR1wvvutz6Kn4v
	IQPstN0w18HGavKm7olWQc+dTaFTmlIcBN8+jeeFxm7q4Kc3Af/ABerUF4W5nJydkp5X15pu8Xl
	zGfU6nWBwzHHTKw7R7bU9fnuzDLP0jQlZWh/hxaLN4q6gzq8M1cP3MoCE7VIXNckvSKSZiyBz5T
	idnQ==
X-Gm-Gg: AR+sD11VN+wsNz84vMF3p+gHsKS5T0tE4kPi7jhIzQ1cR72kHvLcPqO/v3Ip9WvSMoc
	3TUnPylQSF2gL7Suh/PYDErevwN66aN81mipI97qnCJPhot92oAhHj145gfO8Z/ba2pURTzUzSh
	HhCNH16qQjzcSQyGyr2eXbgQbyiGikoqoK8AlZNF40c9stpNqc7WBhOYfZ8OphbzIIa/G4OyJVN
	p+rvHlFg+ATkHq4tfmR96AHUWLhvtkDNT+BUiK1WSdLW05oCHRUKhiHMhYvpdXbUAHZuqMbu521
	IzNbgy5ksU/R2+tkLHPFZhs/tvCTJDc4OMMcvWfves7aaELVYPGkalOEhd/Qcg97xQZrc/3vH8w
	rdavBebWJd6qN2Qo=
X-Received: by 2002:ac8:5e51:0:b0:52d:ea18:a8f with SMTP id d75a77b69052e-52fb9624e53mr184585381cf.29.1788032439225;
        Sat, 29 Aug 2026 12:40:39 -0700 (PDT)
X-Received: by 2002:ac8:5e51:0:b0:52d:ea18:a8f with SMTP id d75a77b69052e-52fb9624e53mr184585001cf.29.1788032438673;
        Sat, 29 Aug 2026 12:40:38 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b961820ffsm65736555e9.3.2026.08.29.12.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:40:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: imx8mq: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:40:24 +0200
Message-ID: <20260829194022.107807-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829194022.107807-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194022.107807-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=20231; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=LjCRoQ9v6mm0gbK6meWatiEaEoIf8rfjgHpRbM2hWEc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzWnhwfUUzccb3AlGB6gDlyoRNkCodAxJsuVG
 vxXsJS+syGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1pwAKCRDBN2bmhouD
 13UqD/0RnhndcbIijGFdo+AHm/J/QA5RdHWUl7ou0MFjBuJKL5OnFH7QQG8px999D6sXGOj1YO3
 A9IftuKRZ6sAzMr0iJz7MOKHuissMGmtWV2tnoggcbdSyTZ2WZeYCZvZnTmfYTC20TneaLrl4KP
 WQW4cRLiFiGUjoBI6h9913EKbLOMIiKwrsP6gAjGvXYdxa3VzvoF4+48fMWGlJpKAkHt0WH0jwR
 mxQLq8mQp539LQk7ZvM8Gjaylal4nxAShwEliI4ks6eMesYlpjnAVasSr26NkIj9lX/MT/grdBE
 etSFv7OLKT7kw9D0w51yoP7BQjEoM5xKVb7uEWqQFhDsRw7q7sq0oX3RDCIDqwoIAtkC9GRBV5K
 MH7gTW1YHQ0plEh7jQajbAdf8exQTjjmYx9c4tmp4Vtbkex7egi1xZ+wS80nRedd732WDx/BA9x
 q8kBuMUZ1bvRlM41eCWMTcmPRYxYEjO+FdKWjCE1xgwhjObuFsSmXXyZAwc/+do6q7PnRwFgtfg
 1RRSkTzHft1I1puGcRmyGZT0xpEFYZXWpZyE2sOo5LDWCHHMq+GNyO75fH9YK8ENLVGGFm3yX85
 PQ7+HVRoZCQ9dC7MRWQbaDj9MUx4MiVqePQqX42ULFhLNwp5Cg7iV5nY+vJv72UzUAI8r3VICEe OPDvGvEMVc+D89g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX//Dnt0x3rfQr
 2rVYREcBXi+HcIe8erkd7xF6qsOWo4sw4fbclmC7F2acT7u0Mwz/urxRSfhPbKXj7HsODBYJu4f
 BUMfrfITJ06Qwk3UQ9tM29LEl7IY5/4xdrvusA5zFlhpS9eGaD2j8GEoPb/zlZ6nL4xKHZMxTSi
 056WDrmGVEheQqmCHpeGv2ighR91z+TLnGhIXzF6s5iim0016vdxSB7Wnneg4Sq1XdTyZaZgg89
 XJfVwNmuMTAna3o/g1iUX0MSAK3FXu64WVKSIkBuFzJ6c+ewcbmAlzOCBQE8jKnBX8rcONAfwLO
 rDVFWcBWDQgyDFuKiO2urrSBwkSLfriyYdgZ95WlzfKE6ZcHQyJimLQrxlue+S5Clw+Yu7OfouO
 niuLuyjNVt4dvSXY07NGPs79kJRXdxPndCCPFwu1VatygBUUJdLQoT+8WnkkF6Rmo3wqQY66x02
 uyiexB70kj0Rnj4u7Dg==
X-Proofpoint-ORIG-GUID: IfNJlTIdX1c60mugqBsWXGAVZCzrPk4p
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfXyr32nongBbcq
 jo+HLOGTJMfBzPXrK5gGPNFBrq2q0qOaLa333ck1itgGhfrCXYPoZ4WXlX+osbYhvj81Er1eqfJ
 r7g6Jf3JlqETi5KmgeuRpvi+cISW3mc=
X-Proofpoint-GUID: IfNJlTIdX1c60mugqBsWXGAVZCzrPk4p
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a9335b8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=aA66hxyf1CaHEeRaiHIA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_124040_988381_B481962F 
X-CRM114-Status: GOOD (  14.79  )
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

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/freescale/imx8mq-zii-ultra.dtsi  |  16 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 168 +++++++++---------
 2 files changed, 92 insertions(+), 92 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
index c7bbba45f368..a272c1bd7548 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
@@ -99,7 +99,7 @@ reg_arm: regulator-arm {
 		regulator-max-microvolt = <1000000>;
 		gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
 		states = <1000000 0x1
-		           900000 0x0>;
+			   900000 0x0>;
 		regulator-always-on;
 	};
 
@@ -295,7 +295,7 @@ ucs1002: charger@32 {
 		reg = <0x32>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <17 IRQ_TYPE_EDGE_BOTH>,
-		             <18 IRQ_TYPE_EDGE_FALLING>;
+			     <18 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-names = "a_det", "alert";
 	};
 
@@ -549,9 +549,9 @@ &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	reset-gpio = <&gpio1 3 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
-	         <&pcie0_refclk>,
-	         <&clk IMX8MQ_CLK_PCIE1_PHY>,
-	         <&clk IMX8MQ_CLK_PCIE1_AUX>;
+		 <&pcie0_refclk>,
+		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
+		 <&clk IMX8MQ_CLK_PCIE1_AUX>;
 	vph-supply = <&vgen5_reg>;
 	status = "okay";
 };
@@ -561,9 +561,9 @@ &pcie1 {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	reset-gpio = <&gpio1 6 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
-	         <&pcie1_refclk>,
-	         <&clk IMX8MQ_CLK_PCIE2_PHY>,
-	         <&clk IMX8MQ_CLK_PCIE2_AUX>;
+		 <&pcie1_refclk>,
+		 <&clk IMX8MQ_CLK_PCIE2_PHY>,
+		 <&clk IMX8MQ_CLK_PCIE2_AUX>;
 	vph-supply = <&vgen5_reg>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d75710cdb5b4..5545b5b20ab2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -363,9 +363,9 @@ vpu-crit {
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* Physical Secure */
-		             <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Physical Non-Secure */
-		             <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virtual */
-		             <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Physical Non-Secure */
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virtual */
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
 		interrupt-parent = <&gic>;
 		arm,no-tick-in-suspend;
 	};
@@ -531,8 +531,8 @@ sai1: sai@30010000 {
 				reg = <0x30010000 0x10000>;
 				interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_SAI1_IPG>,
-				         <&clk IMX8MQ_CLK_SAI1_ROOT>,
-				         <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+					 <&clk IMX8MQ_CLK_SAI1_ROOT>,
+					 <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
 				dmas = <&sdma2 8 24 0>, <&sdma1 9 24 0>;
 				dma-names = "rx", "tx";
@@ -545,8 +545,8 @@ sai6: sai@30030000 {
 				reg = <0x30030000 0x10000>;
 				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_SAI6_IPG>,
-				         <&clk IMX8MQ_CLK_SAI6_ROOT>,
-				         <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+					 <&clk IMX8MQ_CLK_SAI6_ROOT>,
+					 <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
 				dmas = <&sdma2 4 24 0>, <&sdma2 5 24 0>;
 				dma-names = "rx", "tx";
@@ -559,8 +559,8 @@ sai5: sai@30040000 {
 				reg = <0x30040000 0x10000>;
 				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_SAI5_IPG>,
-				         <&clk IMX8MQ_CLK_SAI5_ROOT>,
-				         <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+					 <&clk IMX8MQ_CLK_SAI5_ROOT>,
+					 <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
 				dmas = <&sdma2 2 24 0>, <&sdma2 3 24 0>;
 				dma-names = "rx", "tx";
@@ -573,8 +573,8 @@ sai4: sai@30050000 {
 				reg = <0x30050000 0x10000>;
 				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_SAI4_IPG>,
-				         <&clk IMX8MQ_CLK_SAI4_ROOT>,
-				         <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+					 <&clk IMX8MQ_CLK_SAI4_ROOT>,
+					 <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
 				dmas = <&sdma2 0 24 0>, <&sdma2 1 24 0>;
 				dma-names = "rx", "tx";
@@ -585,7 +585,7 @@ gpio1: gpio@30200000 {
 				compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
 				reg = <0x30200000 0x10000>;
 				interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
-				             <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+					     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_GPIO1_ROOT>;
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -598,7 +598,7 @@ gpio2: gpio@30210000 {
 				compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
 				reg = <0x30210000 0x10000>;
 				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
-				             <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+					     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_GPIO2_ROOT>;
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -611,7 +611,7 @@ gpio3: gpio@30220000 {
 				compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
 				reg = <0x30220000 0x10000>;
 				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
-				             <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+					     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_GPIO3_ROOT>;
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -624,7 +624,7 @@ gpio4: gpio@30230000 {
 				compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
 				reg = <0x30230000 0x10000>;
 				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
-				             <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+					     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_GPIO4_ROOT>;
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -637,7 +637,7 @@ gpio5: gpio@30240000 {
 				compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
 				reg = <0x30240000 0x10000>;
 				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
-				             <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+					     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_GPIO5_ROOT>;
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -845,14 +845,14 @@ clk: clock-controller@30380000 {
 				compatible = "fsl,imx8mq-ccm";
 				reg = <0x30380000 0x10000>;
 				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
-				             <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&ckil>, <&osc_25m>, <&osc_27m>,
-				         <&clk_ext1>, <&clk_ext2>,
-				         <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext1>, <&clk_ext2>,
+					 <&clk_ext3>, <&clk_ext4>;
 				clock-names = "ckil", "osc_25m", "osc_27m",
-				              "clk_ext1", "clk_ext2",
-				              "clk_ext3", "clk_ext4";
+					      "clk_ext1", "clk_ext2",
+					      "clk_ext3", "clk_ext4";
 				assigned-clocks = <&clk IMX8MQ_CLK_A53_SRC>,
 						  <&clk IMX8MQ_CLK_A53_CORE>,
 						  <&clk IMX8MQ_CLK_NOC>,
@@ -940,9 +940,9 @@ pgc_gpu: power-domain@5 {
 						#power-domain-cells = <0>;
 						reg = <IMX8M_POWER_DOMAIN_GPU>;
 						clocks = <&clk IMX8MQ_CLK_GPU_ROOT>,
-						         <&clk IMX8MQ_CLK_GPU_SHADER_DIV>,
+							 <&clk IMX8MQ_CLK_GPU_SHADER_DIV>,
 							 <&clk IMX8MQ_CLK_GPU_AXI>,
-						         <&clk IMX8MQ_CLK_GPU_AHB>;
+							 <&clk IMX8MQ_CLK_GPU_AHB>;
 					};
 
 					pgc_vpu: power-domain@6 {
@@ -1000,7 +1000,7 @@ pwm1: pwm@30660000 {
 				reg = <0x30660000 0x10000>;
 				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_PWM1_ROOT>,
-				         <&clk IMX8MQ_CLK_PWM1_ROOT>;
+					 <&clk IMX8MQ_CLK_PWM1_ROOT>;
 				clock-names = "ipg", "per";
 				#pwm-cells = <3>;
 				status = "disabled";
@@ -1011,7 +1011,7 @@ pwm2: pwm@30670000 {
 				reg = <0x30670000 0x10000>;
 				interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_PWM2_ROOT>,
-				         <&clk IMX8MQ_CLK_PWM2_ROOT>;
+					 <&clk IMX8MQ_CLK_PWM2_ROOT>;
 				clock-names = "ipg", "per";
 				#pwm-cells = <3>;
 				status = "disabled";
@@ -1022,7 +1022,7 @@ pwm3: pwm@30680000 {
 				reg = <0x30680000 0x10000>;
 				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_PWM3_ROOT>,
-				         <&clk IMX8MQ_CLK_PWM3_ROOT>;
+					 <&clk IMX8MQ_CLK_PWM3_ROOT>;
 				clock-names = "ipg", "per";
 				#pwm-cells = <3>;
 				status = "disabled";
@@ -1033,7 +1033,7 @@ pwm4: pwm@30690000 {
 				reg = <0x30690000 0x10000>;
 				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_PWM4_ROOT>,
-				         <&clk IMX8MQ_CLK_PWM4_ROOT>;
+					 <&clk IMX8MQ_CLK_PWM4_ROOT>;
 				clock-names = "ipg", "per";
 				#pwm-cells = <3>;
 				status = "disabled";
@@ -1124,11 +1124,11 @@ ecspi3: spi@30840000 {
 
 			uart1: serial@30860000 {
 				compatible = "fsl,imx8mq-uart",
-				             "fsl,imx6q-uart";
+					     "fsl,imx6q-uart";
 				reg = <0x30860000 0x10000>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_UART1_ROOT>,
-				         <&clk IMX8MQ_CLK_UART1_ROOT>;
+					 <&clk IMX8MQ_CLK_UART1_ROOT>;
 				clock-names = "ipg", "per";
 				dmas = <&sdma1 22 4 0>, <&sdma1 23 4 0>;
 				dma-names = "rx", "tx";
@@ -1137,11 +1137,11 @@ uart1: serial@30860000 {
 
 			uart3: serial@30880000 {
 				compatible = "fsl,imx8mq-uart",
-				             "fsl,imx6q-uart";
+					     "fsl,imx6q-uart";
 				reg = <0x30880000 0x10000>;
 				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_UART3_ROOT>,
-				         <&clk IMX8MQ_CLK_UART3_ROOT>;
+					 <&clk IMX8MQ_CLK_UART3_ROOT>;
 				clock-names = "ipg", "per";
 				dmas = <&sdma1 26 4 0>, <&sdma1 27 4 0>;
 				dma-names = "rx", "tx";
@@ -1150,11 +1150,11 @@ uart3: serial@30880000 {
 
 			uart2: serial@30890000 {
 				compatible = "fsl,imx8mq-uart",
-				             "fsl,imx6q-uart";
+					     "fsl,imx6q-uart";
 				reg = <0x30890000 0x10000>;
 				interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_UART2_ROOT>,
-				         <&clk IMX8MQ_CLK_UART2_ROOT>;
+					 <&clk IMX8MQ_CLK_UART2_ROOT>;
 				clock-names = "ipg", "per";
 				dmas = <&sdma1 24 4 0>, <&sdma1 25 4 0>;
 				dma-names = "rx", "tx";
@@ -1205,8 +1205,8 @@ sai3: sai@308c0000 {
 				reg = <0x308c0000 0x10000>;
 				interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_SAI3_IPG>,
-				         <&clk IMX8MQ_CLK_SAI3_ROOT>,
-				         <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+					 <&clk IMX8MQ_CLK_SAI3_ROOT>,
+					 <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
 				dmas = <&sdma1 12 24 0>, <&sdma1 13 24 0>;
 				dma-names = "rx", "tx";
@@ -1356,11 +1356,11 @@ i2c4: i2c@30a50000 {
 
 			uart4: serial@30a60000 {
 				compatible = "fsl,imx8mq-uart",
-				             "fsl,imx6q-uart";
+					     "fsl,imx6q-uart";
 				reg = <0x30a60000 0x10000>;
 				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_UART4_ROOT>,
-				         <&clk IMX8MQ_CLK_UART4_ROOT>;
+					 <&clk IMX8MQ_CLK_UART4_ROOT>;
 				clock-names = "ipg", "per";
 				dmas = <&sdma1 28 4 0>, <&sdma1 29 4 0>;
 				dma-names = "rx", "tx";
@@ -1481,12 +1481,12 @@ mu: mailbox@30aa0000 {
 
 			usdhc1: mmc@30b40000 {
 				compatible = "fsl,imx8mq-usdhc",
-				             "fsl,imx7d-usdhc";
+					     "fsl,imx7d-usdhc";
 				reg = <0x30b40000 0x10000>;
 				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_IPG_ROOT>,
-				         <&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
-				         <&clk IMX8MQ_CLK_USDHC1_ROOT>;
+					 <&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
+					 <&clk IMX8MQ_CLK_USDHC1_ROOT>;
 				clock-names = "ipg", "ahb", "per";
 				fsl,tuning-start-tap = <20>;
 				fsl,tuning-step = <2>;
@@ -1496,12 +1496,12 @@ usdhc1: mmc@30b40000 {
 
 			usdhc2: mmc@30b50000 {
 				compatible = "fsl,imx8mq-usdhc",
-				             "fsl,imx7d-usdhc";
+					     "fsl,imx7d-usdhc";
 				reg = <0x30b50000 0x10000>;
 				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_IPG_ROOT>,
-				         <&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
-				         <&clk IMX8MQ_CLK_USDHC2_ROOT>;
+					 <&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
+					 <&clk IMX8MQ_CLK_USDHC2_ROOT>;
 				clock-names = "ipg", "ahb", "per";
 				fsl,tuning-start-tap = <20>;
 				fsl,tuning-step = <2>;
@@ -1538,16 +1538,16 @@ fec1: ethernet@30be0000 {
 				compatible = "fsl,imx8mq-fec", "fsl,imx6sx-fec";
 				reg = <0x30be0000 0x10000>;
 				interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
-				             <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_ENET1_ROOT>,
-				         <&clk IMX8MQ_CLK_ENET1_ROOT>,
-				         <&clk IMX8MQ_CLK_ENET_TIMER>,
-				         <&clk IMX8MQ_CLK_ENET_REF>,
-				         <&clk IMX8MQ_CLK_ENET_PHY_REF>;
+					 <&clk IMX8MQ_CLK_ENET1_ROOT>,
+					 <&clk IMX8MQ_CLK_ENET_TIMER>,
+					 <&clk IMX8MQ_CLK_ENET_REF>,
+					 <&clk IMX8MQ_CLK_ENET_PHY_REF>;
 				clock-names = "ipg", "ahb", "ptp",
-				              "enet_clk_ref", "enet_out";
+					      "enet_clk_ref", "enet_out";
 				assigned-clocks = <&clk IMX8MQ_CLK_ENET_AXI>,
 						  <&clk IMX8MQ_CLK_ENET_TIMER>,
 						  <&clk IMX8MQ_CLK_ENET_REF>,
@@ -1639,23 +1639,23 @@ gpu: gpu@38000000 {
 			reg = <0x38000000 0x40000>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MQ_CLK_GPU_ROOT>,
-			         <&clk IMX8MQ_CLK_GPU_SHADER_DIV>,
-			         <&clk IMX8MQ_CLK_GPU_AXI>,
-			         <&clk IMX8MQ_CLK_GPU_AHB>;
+				 <&clk IMX8MQ_CLK_GPU_SHADER_DIV>,
+				 <&clk IMX8MQ_CLK_GPU_AXI>,
+				 <&clk IMX8MQ_CLK_GPU_AHB>;
 			clock-names = "core", "shader", "bus", "reg";
 			#cooling-cells = <2>;
 			assigned-clocks = <&clk IMX8MQ_CLK_GPU_CORE_SRC>,
-			                  <&clk IMX8MQ_CLK_GPU_SHADER_SRC>,
-			                  <&clk IMX8MQ_CLK_GPU_AXI>,
-			                  <&clk IMX8MQ_CLK_GPU_AHB>,
-			                  <&clk IMX8MQ_GPU_PLL_BYPASS>;
+					  <&clk IMX8MQ_CLK_GPU_SHADER_SRC>,
+					  <&clk IMX8MQ_CLK_GPU_AXI>,
+					  <&clk IMX8MQ_CLK_GPU_AHB>,
+					  <&clk IMX8MQ_GPU_PLL_BYPASS>;
 			assigned-clock-parents = <&clk IMX8MQ_GPU_PLL_OUT>,
-			                         <&clk IMX8MQ_GPU_PLL_OUT>,
-			                         <&clk IMX8MQ_GPU_PLL_OUT>,
-			                         <&clk IMX8MQ_GPU_PLL_OUT>,
-			                         <&clk IMX8MQ_GPU_PLL>;
+						 <&clk IMX8MQ_GPU_PLL_OUT>,
+						 <&clk IMX8MQ_GPU_PLL_OUT>,
+						 <&clk IMX8MQ_GPU_PLL_OUT>,
+						 <&clk IMX8MQ_GPU_PLL>;
 			assigned-clock-rates = <800000000>, <800000000>,
-			                       <800000000>, <400000000>, <0>;
+					       <800000000>, <400000000>, <0>;
 			power-domains = <&pgc_gpu>;
 		};
 
@@ -1663,13 +1663,13 @@ usb_dwc3_0: usb@38100000 {
 			compatible = "fsl,imx8mq-dwc3", "snps,dwc3";
 			reg = <0x38100000 0x10000>;
 			clocks = <&clk IMX8MQ_CLK_USB1_CTRL_ROOT>,
-			         <&clk IMX8MQ_CLK_USB_CORE_REF>,
+				 <&clk IMX8MQ_CLK_USB_CORE_REF>,
 				 <&clk IMX8MQ_CLK_32K>;
 			clock-names = "bus_early", "ref", "suspend";
 			assigned-clocks = <&clk IMX8MQ_CLK_USB_BUS>,
-			                  <&clk IMX8MQ_CLK_USB_CORE_REF>;
+					  <&clk IMX8MQ_CLK_USB_CORE_REF>;
 			assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_500M>,
-			                         <&clk IMX8MQ_SYS1_PLL_100M>;
+						 <&clk IMX8MQ_SYS1_PLL_100M>;
 			assigned-clock-rates = <500000000>, <100000000>;
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usb3_phy0>, <&usb3_phy0>;
@@ -1695,13 +1695,13 @@ usb_dwc3_1: usb@38200000 {
 			compatible = "fsl,imx8mq-dwc3", "snps,dwc3";
 			reg = <0x38200000 0x10000>;
 			clocks = <&clk IMX8MQ_CLK_USB2_CTRL_ROOT>,
-			         <&clk IMX8MQ_CLK_USB_CORE_REF>,
+				 <&clk IMX8MQ_CLK_USB_CORE_REF>,
 				 <&clk IMX8MQ_CLK_32K>;
 			clock-names = "bus_early", "ref", "suspend";
 			assigned-clocks = <&clk IMX8MQ_CLK_USB_BUS>,
-			                  <&clk IMX8MQ_CLK_USB_CORE_REF>;
+					  <&clk IMX8MQ_CLK_USB_CORE_REF>;
 			assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_500M>,
-			                         <&clk IMX8MQ_SYS1_PLL_100M>;
+						 <&clk IMX8MQ_SYS1_PLL_100M>;
 			assigned-clock-rates = <500000000>, <100000000>;
 			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usb3_phy1>, <&usb3_phy1>;
@@ -1767,9 +1767,9 @@ pcie0: pcie@33800000 {
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &gic GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
-			                <0 0 0 2 &gic GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
-			                <0 0 0 3 &gic GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
-			                <0 0 0 4 &gic GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+					<0 0 0 2 &gic GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
 			fsl,max-link-speed = <2>;
 			linux,pci-domain = <0>;
 			clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
@@ -1779,17 +1779,17 @@ pcie0: pcie@33800000 {
 			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
 			power-domains = <&pgc_pcie>;
 			resets = <&src IMX8MQ_RESET_PCIEPHY>,
-			         <&src IMX8MQ_RESET_PCIE_CTRL_APPS_EN>,
-			         <&src IMX8MQ_RESET_PCIE_CTRL_APPS_TURNOFF>;
+				 <&src IMX8MQ_RESET_PCIE_CTRL_APPS_EN>,
+				 <&src IMX8MQ_RESET_PCIE_CTRL_APPS_TURNOFF>;
 			reset-names = "pciephy", "apps", "turnoff";
 			assigned-clocks = <&clk IMX8MQ_CLK_PCIE1_CTRL>,
-			                  <&clk IMX8MQ_CLK_PCIE1_PHY>,
-			                  <&clk IMX8MQ_CLK_PCIE1_AUX>;
+					  <&clk IMX8MQ_CLK_PCIE1_PHY>,
+					  <&clk IMX8MQ_CLK_PCIE1_AUX>;
 			assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_250M>,
-			                         <&clk IMX8MQ_SYS2_PLL_100M>,
-			                         <&clk IMX8MQ_SYS1_PLL_80M>;
+						 <&clk IMX8MQ_SYS2_PLL_100M>,
+						 <&clk IMX8MQ_SYS1_PLL_80M>;
 			assigned-clock-rates = <250000000>, <100000000>,
-			                       <10000000>;
+					       <10000000>;
 			status = "disabled";
 
 			pcie0_port0: pcie@0 {
@@ -1868,17 +1868,17 @@ pcie1: pcie@33c00000 {
 			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
 			power-domains = <&pgc_pcie>;
 			resets = <&src IMX8MQ_RESET_PCIEPHY2>,
-			         <&src IMX8MQ_RESET_PCIE2_CTRL_APPS_EN>,
-			         <&src IMX8MQ_RESET_PCIE2_CTRL_APPS_TURNOFF>;
+				 <&src IMX8MQ_RESET_PCIE2_CTRL_APPS_EN>,
+				 <&src IMX8MQ_RESET_PCIE2_CTRL_APPS_TURNOFF>;
 			reset-names = "pciephy", "apps", "turnoff";
 			assigned-clocks = <&clk IMX8MQ_CLK_PCIE2_CTRL>,
-			                  <&clk IMX8MQ_CLK_PCIE2_PHY>,
-			                  <&clk IMX8MQ_CLK_PCIE2_AUX>;
+					  <&clk IMX8MQ_CLK_PCIE2_PHY>,
+					  <&clk IMX8MQ_CLK_PCIE2_AUX>;
 			assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_250M>,
-			                         <&clk IMX8MQ_SYS2_PLL_100M>,
-			                         <&clk IMX8MQ_SYS1_PLL_80M>;
+						 <&clk IMX8MQ_SYS2_PLL_100M>,
+						 <&clk IMX8MQ_SYS1_PLL_80M>;
 			assigned-clock-rates = <250000000>, <100000000>,
-			                       <10000000>;
+					       <10000000>;
 			status = "disabled";
 
 			pcie1_port0: pcie@0 {
-- 
2.53.0


