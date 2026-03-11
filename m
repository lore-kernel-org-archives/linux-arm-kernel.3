Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B061125850
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gX/y4X/Q6QOSCv7k16aN0suGNLFd1YkVqOqHYVfLXTs=; b=GvvxorHJfI2x2f/DL8AzIhUQGL
	/3Ei1Uu37rlFrceQnYsWMeOenAgH9pWwz8wfa92bf54iBrAn35zLaIDUgLy0OTevhNideGHTwiPC6
	DmBd3ZGG61AqyCZCjAKdM6qM1wlg5Hfo8Px5EuPsq8cPPSg2537C3t2JriOI8MV1PRsYnD+DnwWau
	vmJ6vLgaEU6adYM4m+4UlZ85PTyVfpmovYNjZqaMjxx2TxcG1NbMzMwfhVByLBmBOF2FpLEegfBdq
	pBGTfJXKt7WXP33Vs8lJC2MKcviOMKaxT1rjWweQJWK8T+gdzxUuStJOEAEGsbzxZ7owjOJ6mD4cc
	+p44MtKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6f-0000000BsIf-27TT;
	Wed, 11 Mar 2026 16:08:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6c-0000000BsHi-3tWR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:08:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BFp19V3171778
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gX/y4X/Q6QOSCv7k16aN0suGNLFd1YkVqOqHYVfLXTs=; b=Sdvv4ZjFZCL0yLms
	BgZ01xWzR2gWiedXQayJjxVU1EWp1b1kfUnVIQBu6bJT+fA3q9l9OFNpLDln/n1b
	N+52T0PpEg6ONh4yN/Zzs9bXwGejtpj/a/67hUkYb68+AFSc9kTODH8DlACjghAC
	nfFZXGi7lv/yPx8OJ2oVNcXLYvMp//nZUSWUDc6/BpacKZ4lnFbBU+E75EwJMzEK
	99JiAIHZqzGL8NzfHgc2WG5wd/aj9VTqODfytRNxl77ExgLzBlsMNi/rkiJI3DEH
	N41Ms6KBVAP0rGXle8La7m7/vk0HBTectUitrVupITN+JiW/wfmPP/QT9Grb/N8B
	vo+X6Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cubd8r2g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:17 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56af7c997f8so171280e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245296; x=1773850096; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gX/y4X/Q6QOSCv7k16aN0suGNLFd1YkVqOqHYVfLXTs=;
        b=QSC6wjC/jT58cqPZXHZCiqBWK6yfsWfp7EWdixGZ/ar+7HVLO+A6INQj3VKeY15VcK
         qNR13MA+EmV8DXg/fbaocUwQwIjKs9Z1jW00ItHrdJowWngQJelvFzHU1auKrAGU7MJc
         nOXf1hgrz46GaBh82aEXcCpXaNmKH+zpV/lsK9xl5WQvlWQ33u5BR2bLYz3iZsNj9gKf
         BMQyvMJCdmM0R1DWucnhxDiBHbYOKgJ8ieweWQbp7Mpszx1V8AxnqXoyfFrJVVdUgRFO
         xdvlE/MrnoedNAc8aafmm4WLTK0pJvV7ZvH1KnDkxbxyFey3CxpqOckRsqutP6W6Nk9n
         WkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245296; x=1773850096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gX/y4X/Q6QOSCv7k16aN0suGNLFd1YkVqOqHYVfLXTs=;
        b=veyzwAiXLb30d6z3rhAP359F9loSSR47hQ6iWN2e5pr5TuvHXactjYIzMe2eUKYw1A
         BI/sqBYns5/lvnF21ETHOan8UWWyowyO0SRnQrLbzhdYiBxb9Oi/FRgwSMff57aoZy2s
         QzcjdISR31r7tSLjBUZ1Q0H0KzPuc+CkOVQxYs60CsWwL6e/cF/oLPrh6bY4VFoYtNtN
         brStYFkxf00XTu+UbcD70xwHHCS6YHZOTebrWKQNzLyaIe6rMWNeJHlcfDovKJQgoljD
         6H++b39o23q1LPsAfn+v5J4pDhRfsKnASKe0S6tGdCG2YrsPZz9NAn44NKVepkIIYIbz
         FKFg==
X-Forwarded-Encrypted: i=1; AJvYcCUP1WDkdqnlWrmhQeiY6uwJsU+hO7ex+iTyxiZ02MYARvWGKwwRmqLeMXCMAlm1bXTgYOAyLQmIBg+t2BD55CXT@lists.infradead.org
X-Gm-Message-State: AOJu0YweAZ2E50maFkIwrwLohzBugQK41Uthy1ObTMqadNgtWVewRy+o
	luSyebcH4cDTj3cbN0zc7wd36QjnjVG81VVV4Q1xRDa8215fM0KR7mHjzoMUnDMErVg6pT/vce2
	mm05rPqKyYslvYo40WJKKkQ+phlfCHUB+gGfBOz3yXh2k6RIp6XBXrxbbWCWxIj5+wgfk0QO/lb
	eDEA==
X-Gm-Gg: ATEYQzwW7o7M5XBPGKzDM3Qfwf785ocjdv4JGlKJqEuvp3l+J/8pJ4ZS47r3avK7vLs
	9XLqOU9Bqs54JdFCoIZNvGxdFJzhyJpG3BgFFAtKHdVm2dknU/qy1Ubmq4vBM2qp3dlXhTC2eMM
	g+SppW74lf8QuoDOiqcDpFw3u9AiW3JuqwhPIeBBpzzV2OFj8s20UdWKnAW0/nPWVvcvnb8kzsV
	ZP/IK1yW593uRWrgukIZq0NHLyctorC57SMB+VLjfwErVNcznxPMZSfqD7ajCfY/Gfhfjac9+hk
	bKoyyLhj98ry19JLMyKC3dYp9tJHVCqQJmwKcA/9lrFq5kk5x9nOMWCJmXZMltg0tGVPht4rULU
	UA7owiti/a3S6ecWkdHH+Do0eD09JeCoTGJIVDq+R/9jz
X-Received: by 2002:a05:6102:3e82:b0:5ff:de16:3697 with SMTP id ada2fe7eead31-601def03b2fmr997416137.19.1773245295950;
        Wed, 11 Mar 2026 09:08:15 -0700 (PDT)
X-Received: by 2002:a05:6102:3e82:b0:5ff:de16:3697 with SMTP id ada2fe7eead31-601def03b2fmr997393137.19.1773245295485;
        Wed, 11 Mar 2026 09:08:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:07:57 +0100
Subject: [PATCH 01/12] ARM: dts: imx6dl: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-1-ea1cc09fba84@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2702;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fvJPxiZJcDnoLtQ1cA0D6s3NXztANmKivfa8n0Cahy0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNfTn6qzffTPfY0KbNFgDxWfK7fwOPHPTt2+
 I6kAcYyRwqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTXwAKCRDBN2bmhouD
 1y7sD/4m3uYhaIFFi2AxPmLW6Zen8VvbRunfGikywBQxGCskhxH9LFYaPjaWvzOU1n7OV35JuQr
 SmwlIJHmhWVx8mweQL+ibp4UkdkpDgoYmx6Amwe9RPQ1gugK+UGDSxCRlcZjq1JbQWNCECk8LfH
 7pG2m6uAyn/WtNqCd9UkfVU1ZFsxgUq2WYx1ssucO7WMsHYeNDXkK5KCUx4YO8784IE/QmARuiL
 A2BiA8HmLGtEQYFOStotK9BA3js+cLobJud4Xq4yPr4//Aq6MF+3mSmph7US6teMwgDIi0p6K+O
 YYn59VubXnYGkk6NZVBm1p++vMt7bn3WuUbbqOzycWDJITB4puqzQIZjCfeZjwX1qOzBpAqWrr2
 pL3lPrCory7jYvSMCatwbPmwJm/f8gqwse4Fl2sLI1Ip0GZwQTmGNp32Py44IqdhNHCCUFn3GtC
 9VWKESvOa3t/ggqzfMaZhYnAlpaSlINf5mfkMq42wlh1UVJ1hWfot7K2M5oWUXwU4tDDJ73W6mQ
 neYYzwjKd+Yd/npbL07IL44x3SpuStruginHkBAcJSxn30eSjBPstTX8AjGk67PqBEoAQxw1MDw
 WXBWUoqkrOIlPgHuadiphhQFjlNYU9GpW1gJE4rsjeeF4U8knOMpUOzaNeV+hJeFj+X1dwag6d9
 KswsjuUyLZbWwgQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 0P7ZjdOzgotEADDIh0OwGAO09MwLu6oY
X-Authority-Analysis: v=2.4 cv=eqHSD4pX c=1 sm=1 tr=0 ts=69b19371 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=J5n0A9H0bXRu_Ym2jYcA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 0P7ZjdOzgotEADDIh0OwGAO09MwLu6oY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX5L2Syf9p5LzY
 gcekwfFSMW8rHSRg0GiYcx+qyWXIcMbJeGoKW2PyMFgG+hgX0w6EjUZKKMHfGOMbR9zS28075z5
 C9Rp1GhE4LOKacMu7wfATmGP6KwH0QhInkjE/Mwk9kM70b2zSXnwiZ0e1VxOHLPNOdTT9RmtlK9
 vGG8xyJogee9mbLBFkYa9j5O8Ndn+c6lH7np7DEd0HnibFDPRmIqtdMWKDIX5QQNTeFezGg5s+S
 ysnoMgRofhWo+C2BqjN83y09xMqtDZYNGLPNrchMO7jkr4fIydx/C7ODasN+a/JXCO9Uci+xF65
 OSV/9DWx08uoQog9047KuuWpMaZLQepzl5RoGq/EPVOr6oDBYNKzVAeYaSHxim9RcXz/OFJjBth
 7emRAZHgGQvbWCYHA551tY5Ya6BtN1siAOc0sPFcrf5pfgG3XJL+xSc2LcFxVSOATB9da/Dobjk
 IUublrOihna52S3eQng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_090819_112178_6F16F147 
X-CRM114-Status: GOOD (  14.68  )
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
 arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
index 1e0a588b2a15..a4e2fbdc0d0b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
@@ -318,7 +318,7 @@ mipi_csi2_in: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 9 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
index 5ed55f74b398..7b4c16e3fd5e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
@@ -321,7 +321,7 @@ phy: ethernet-phy@1 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 20 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
index d5baec5e7a78..de6473a0d262 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
@@ -271,7 +271,7 @@ vgen6_reg: vgen6 {
 };
 
 &pcie {
-	reset-gpio = <&gpio1 20 0>;
+	reset-gpios = <&gpio1 20 0>;
 };
 
 &pwm4 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
index 4a5736526927..d4911fad1d79 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
@@ -571,7 +571,7 @@ &ipu1_di0_disp0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "disabled";
 };

-- 
2.51.0


