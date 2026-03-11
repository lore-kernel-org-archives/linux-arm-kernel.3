Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4451125851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqgqpLsdGTD2GkM4HPXhpFG+RergPXzIGdNet5/k1ZM=; b=xzNu/BqNGS7zuiSEUrMBQcmGGu
	/hMaJg5e90csdeXm3isISPvU+kd8lmSkYjiuY8zg/KRuWARFF6tdOADnIbwzhepq7liai8QRT/Hhf
	8OZeuYbozNg+OeNi/0AzocOm34nJRV47oRLMwa4JpBDbNnSKFlA6hzxkJVxsMIrYVT3R9Ztk+DoHX
	t2NEJqilRIN7NnQwuvDO82tDdzx+7Kflj65yXHCC/bQT+7on38ffKYi4cCBDhk7JcY1fapWUBp9/2
	3jN3t7F0MAZZDxUs7nJNP1P1rWah31cotKbifD87GmQ8ON7tg8sOXPKdYx1ZJLEff/I5tNSWaM/Tr
	5aYgpT/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M76-0000000BseY-10L8;
	Wed, 11 Mar 2026 16:08:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M70-0000000BsYD-2IBm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:08:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BD7t2l4032606
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VqgqpLsdGTD2GkM4HPXhpFG+RergPXzIGdNet5/k1ZM=; b=XNjjWnPBbwbg4f/u
	fdJ8WIaP62Mb9MDNpPrbML8yLfg5pXq4CDRRlGh3iZwhuPUkFl0glVXLTQbvFmjy
	xsYlsA1/LRkIw3pDIP76VcrPCe1mSRd9VRXbTaq9cxhJrxxDW4UcjWRJLZdFN3so
	rZ6MtNtXWjesC+Am4eRSoJLZ6xzkdLrK+8//OsCK1c90iFAClxsO8RU/Ac1T6qEh
	28KpnKPYadl9Fl2LLIwfMn2FKla2MPuEl1v3MT6zY8FOmKmqR7js/GH/Pf6xrfby
	1jA4YL0jKufXgSiM5QR1W0Adw7uQsC/YOT1xaMfR2bRpq73g64vFZYGwsvoxS9id
	d82oPg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu90t8qyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a15bb70easo2652946d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245321; x=1773850121; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqgqpLsdGTD2GkM4HPXhpFG+RergPXzIGdNet5/k1ZM=;
        b=STd4qLg4Pjd3Y8BKi4TDHZPiMlKEU9YZiWVjvhguIsD6A9yMEIvA1+cV005jblbeW2
         uYH/Qu1Z7PdGnuLvY2mCEd/UdGyI20CkSA4ss06hSViZGgDQdeRCgEjSW393XpfBPsoB
         fBe/hxKZFeYd/T0x0R1/ua5491Z4K3JnlmUYOwMmAxZJCjbC2mfVJylUFRQcX3JorGiI
         Ow7CX3OQfetS5rZ+Xk3D/JCp2/g1x/UjNRdlzSIuBUrGrqrUwCxJEhTR4I78kVBoaT2/
         Py4jzP/EdC3T9tKDYEoIywTHBzcOOsnHhbtCdl9SEI+TQwvGRxVbg3DmQl4GXH42B1n6
         oEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245321; x=1773850121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VqgqpLsdGTD2GkM4HPXhpFG+RergPXzIGdNet5/k1ZM=;
        b=i+TBHTu7w5+voD2u/gd+HesqoCwCKSd0bTqyW6d1/LVLs3pkAJYF0aD4YsmZJABUEC
         pAoEWHu74m2GjGCPrSnEx90dJtBK72egDzkDIelG5XNH0EhaM+yLKmaMWqj4LJ++vgme
         4aY3GdO8i4UhzBO9hS/flh/Bd9DJ8LM51q3YGZFZ7UWsY1FsWxAmy6dloOmcSUjD4Rpg
         uxq3IPrnz7U4C+DnE7MiRhzm8otyuaei6W8Od4LzDCNbErdGdochp0eOB/NqVtHEUp1v
         eaT2yNdKZyOZ914gGUKcqbXx33GsL6wdaeXxK9rcUU2fr2QIgQOZA7+zHy5NCol5nadW
         8XOg==
X-Forwarded-Encrypted: i=1; AJvYcCVgxeoLEsCN+9UwWNyoKiSnL/LqaFl8QtGwBoq0mHc8J1TyZVCJaMJBrf3cBDAFuR8z+wbwo6x52+x1jFvWF2r+@lists.infradead.org
X-Gm-Message-State: AOJu0YyXUWCbiYPvi+ic5ZuLukzLPUkG4Rlv/RbTBsubRjR9rI94sn+4
	iLa0BfHIZPx9lMBGvdzycoCzjeHIDFVbchFHOLS7knv1CitCWeYJF3uDy+jYrTmrmkUhA7Huw1F
	BA507Uxa0Rr6fanPyiTYl5WeJ5bghXkYz+k/hiFE+iIMbmCyKLeifaM0ILPLIic0u43eM7JnXU1
	Oh7w==
X-Gm-Gg: ATEYQzwEjQXOwqumQ901eVuNaW0MRt1L6Qb/c9ks54dRIW7CYtw418pp49InUR3t2Ly
	snIjdcnQ3b/V9ORDVREq4ZFxHHCBGc2T88N8L0qj0CRN9ucV5qOcFiObhlBQS8/Po32P2tRPNO8
	/vlzJWm+E8t9SQipTxLWaZxKXWuzY0+FCQkQdijp7W2sb1jnt05RSu4v2iKEMMRIDpwFiZLNN9k
	SGiLLFDKOZrWedakODukagfhWutzLe0oyWDuDIxeyboCpNHj8vbiCs87fOm+P4ePFe/Y5hFGpua
	Ib6PM7gxwDiyr/0qTbADPMPZEPyJc+7Gfx7nvrx5tIyHHiCitrzIN6hdSKkdOiV3jWEbRCuv9Ey
	A2/sAi/7AG71ihmMm2KLi29wzLSKPsUEPbPcZnvdYrhSt
X-Received: by 2002:a05:620a:1907:b0:8cd:8889:227 with SMTP id af79cd13be357-8cda1ac6ea0mr369653485a.73.1773245320795;
        Wed, 11 Mar 2026 09:08:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1907:b0:8cd:8889:227 with SMTP id af79cd13be357-8cda1ac6ea0mr369646485a.73.1773245320228;
        Wed, 11 Mar 2026 09:08:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:06 +0100
Subject: [PATCH 10/12] arm64: dts: imx8mq: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-10-ea1cc09fba84@oss.qualcomm.com>
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@dh-electronics.com, linux@ew.tq-group.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4292;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=A7AgCTNHOUuBG/1ldgBi4qaF6lQTEZbJE3fUOTYefj4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNnT/X5v8kltDvli+cG+fd8bBen4PJ5f9XLm
 kl7ClPP+yKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTZwAKCRDBN2bmhouD
 1+NTEACAM+QkMfiupfxi6WJwvjz5n9xYJWtCXl7A7ZDl9c7S698OfGyVJW6ywapcUUGsiOppPGm
 Vi37CUBrKO6VYQ+h4a1CKbrVtZUNsbAzRNcVFmRy+Wcp6T61gplJley4SEgBoapd8dtHuTHVFVE
 MvYDDm2RrSNQwn0MWE7fw+7M/5rCQnVIzfgzB4LFONiMy10I3pq2ppL/m0rVarJ7z47Q7tloNnC
 NHtVKOG37G9YVJLXdGvON8hde9c6u5bawVBtte24QPWrVzv7iycIvUjC0uqtCt+f0Y8bHBx7w0s
 RdJ/H6R0z2YkV7PlJRTuX10ggA297RttVjt2UXA9XnpPavepvIdGkKrgqffGXUi8uGFytjutmys
 03nAUoLs7u4DJefH5kERSUaG63PBylP96JzqSrhWXXdKux3ZDxT6tqEulT+229WclE0KnIcouWQ
 QS4Sjngxtn54uO7gRmQtEKk/5Ql9thONXQVfAMxpqVuHr1hm5s501UlHreT48qLjY9UJZhp//X2
 7aXgjslHqSD3/uQ3e2+bpGvll29eu5MqIU3Ht4M5nhK+JUCPlmxT0Wjdut9XNwq55xz1GqhaOKp
 J2weGMt7yjR27p3aBJpgZh286lHDdVCQGXZld1f9y9P0WYecBWfyz9HRe1zWextvob7BDAJIP78
 yIrAb/Xs9BRc8qg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: RDVivjrkd-ve9sZlvEmNJwvcdiV_9EhE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX9p5ayQ1MCDDg
 xKxbErZvIwPDpZU4rXwJCl9cxNtCdRMZgPhyiWxTTi2YHV7YNfbMxMB9eUltbVIyEB1TIZOiLEg
 BgGEHJ2qzYrTFnt+8rpFBX5+h1HpBMrvKHuMMpllHVmAOop1NVdHnQ75YGBOHuPxE8nX+KdVYWF
 jzFkeoDXweCfWp9FwB9EnjHl1rjlbFSHaTVxGnl7iRx6mUrdVGFB+kssSyUm0PdkHaXOgSKUpJz
 CGrdIpNrj/Y1YkJIcfhVoa1inGxf9XyD7X+n3idoJqx+WjsU3ENVQxkqS7DKuP//k1d5ZOpPTcy
 X9jMOIhf5S4onBb5Q2ocpKZgaLNndKwSO9++3+0YWnXJBgIi8R9u3i8MnidhipT1o32zx9hXxWQ
 mb1jOAWcgNMXQ99gNfKIUOPx7Dkpm4/XJQHJz0kBjoAoeZchd3or7IEDZfCs30Z40KYXzxI9Uuw
 Zjm6pW2gQh+ZS1uXZ1Q==
X-Authority-Analysis: v=2.4 cv=DfEaa/tW c=1 sm=1 tr=0 ts=69b19389 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nTlmypLvTDh5NzCj0PYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: RDVivjrkd-ve9sZlvEmNJwvcdiV_9EhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_090842_602565_6C5A6BD9 
X-CRM114-Status: GOOD (  15.08  )
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

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts                | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi         | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index d48f901487d4..54826420740c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -369,7 +369,7 @@ mipi_dsi_out: endpoint {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio5 28 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 28 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
 		 <&pcie0_refclk>,
 		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
@@ -392,7 +392,7 @@ &pcie0_ep {
 &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie1>;
-	reset-gpio = <&gpio5 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
 		 <&pcie0_refclk>,
 		 <&clk IMX8MQ_CLK_PCIE2_PHY>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts b/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
index d8cf1f27c3ec..2296ff065467 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
@@ -243,7 +243,7 @@ &i2c3 {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio1 9 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
 		 <&pcie0_refclk>,
 		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
index 3ae3824be027..09f2fb1ad57b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
@@ -195,7 +195,7 @@ mipi_dsi_out: endpoint {
 &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie1>;
-	reset-gpio = <&gpio3 23 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 23 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
 		 <&pcie1_refclk>,
 		 <&clk IMX8MQ_CLK_PCIE2_PHY>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
index 0165f3a25985..aa54182def4f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
@@ -93,7 +93,7 @@ &led2 {
 
 /* PCIe slot on X36 */
 &pcie0 {
-	reset-gpio = <&expander0 14 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&expander0 14 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
 		 <&pcieclk 3>,
 		 <&pcieclk 2>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
index c7bbba45f368..f3d0ebe98d5e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
@@ -547,7 +547,7 @@ &usb_dwc3_1 {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio1 3 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
 	         <&pcie0_refclk>,
 	         <&clk IMX8MQ_CLK_PCIE1_PHY>,
@@ -559,7 +559,7 @@ &pcie0 {
 &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie1>;
-	reset-gpio = <&gpio1 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
 	         <&pcie1_refclk>,
 	         <&clk IMX8MQ_CLK_PCIE2_PHY>,

-- 
2.51.0


