Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAD1C53200
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYEWRW0PHq2V9fq3m8eDc5+VKauFhMXll8srcAue+VQ=; b=ZkMEoRSXsXwJJwR0vXCqXaIXrf
	fyzcJ45J+MTsOKxuAFO8hedEDrpDea99ky/uhoO16WElE9YJ/gsbFX/GW2sSv7aZGVHRoOUM3s/vL
	jRHZYEeLb12hGojocKVyb+DWTTPt9H5wLO7+ApAOk7eThkHdsdkFoRmjeRr+pfCztiBHt+wexB/eU
	YwY+0k1UavsxWY54rE+yqWnolRDZD2IV1Brs3512LQiaqkkyYh9FPPiuflufI9F9aPoRPzEE4GNBv
	fyl6YCzuCNyQexitt5toqt81L/a9l7uSH+1HjKXABD3irgcpDEHAXvrXGXi3cw2Ihwlm5uhOVm2Bu
	3X402+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo2tX-00000001QzE-3Heb;
	Sun, 26 Jul 2026 17:44:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo2tU-00000001QwU-1Djh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 17:44:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QHDstK1348223
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 17:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYEWRW0PHq2V9fq3m8eDc5+VKauFhMXll8srcAue+VQ=; b=P0al+mQhnZ+RVhew
	tlSyAC60CwfR83K21+21eFCMjeqbRPG/k+Kapgipn+8nZkBf5LWA738CbEEyTJcn
	l6qQU1UrQJ9m3e6e9pYcpFNAnglDqhIWQBvnac80jRpcC2DG+GLd5bsPnCXrGZ63
	hEKHjUOZyeZO+TNV3G00jr5PHoN8eXbI9wPIrNg/zlyyS8fYb/LUUdIyOWJ5b55a
	4hGJyB4G0u57cOpKI4bic3JvEHfdfaCzj8ZsHA/Dx77JH0ie+nBPPfzupeZXXeJb
	5DNWfcPld4EdK52+gqhaJTbAwDTal///cOT4msMDdBM2QUOlFEhQf0dR+hLPB9LL
	5K2Vmg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7vbdyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 17:44:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a9764f0so27371731cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 10:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087847; x=1785692647; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYEWRW0PHq2V9fq3m8eDc5+VKauFhMXll8srcAue+VQ=;
        b=j046/7qfUONk8LwLFpTzpwxntfXqbd9uNcGxrSHbYu9I59FNF7xRWl1GMBXe6Kgnlm
         Wjsq2sD6cUe61MMsvtEWAGP1xMzBgD/uUomdcNnPoQN/MVUshtrocfQqOFLXwQioXh/j
         Ur6zE4kPQP2IbdbjDIWy3CKNAzV6++areZDsS5TSZ1cU24nAh1anYkchj0ARq3p0pD1Q
         a2qFnzpkmqs2wAf6Z/Aq0iKBwWUka97i+zPlsvAyAvLT++L5OlnLsbeBGlBVQZad77Yp
         asNEBslqqNzk+JgbS7rDZ59cWP3Z8+v9TqYcyfvU3uVOY2hdETw9g/HWjvv8vvfocQlm
         x61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087847; x=1785692647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYEWRW0PHq2V9fq3m8eDc5+VKauFhMXll8srcAue+VQ=;
        b=GFnKpYg8c5PLpfo9NdPVtCpFvXhLL7qubvKfIeA4AUfSdZJC1SiXrhpcakhrCEZLI/
         c3Ur+PmQ6cT7h87YzWGNTdjSHpVGjscDjajEL25BCMts8DOJdbY13xbHCs3WXJv3+WXY
         VOhou/BhETm+8IVtUji7LwyXtBZi1d3cQYWdCKy7sFm1feFnPYuIIZe7/82p4Dj581+7
         bBgaWS1MPkEsB/j0dL7xVZINrvTKdph94njhVYPqt7Ut40dtnsjwKK43FelgrrdUQw18
         IfGrR6BWC9nrN4m1yBDMovJ1e7kyxKppRZjKemEgM2scuFES9QHNC/3scTiQYT+7MaB7
         2TRA==
X-Gm-Message-State: AOJu0YwTfYpKqriok/VVQKL/BR2CIC6KLaC8vdeTQdffhqbosFyEfXCQ
	q/pcPtmcHmI01TLsIGLcIkk7ZFRxTw8HplOszFMk9I2MXawxyFqMlkjn6j9yihG09DoiA6phN4o
	9BTEuxntX7l4/Y1SPPiB19/EmBKK6gXimYeTPJBjq4L+aTE6R480z//6rIxvGyJbnQDzEFSc9iH
	0DuuOSh/adQg==
X-Gm-Gg: AR+sD13qEcblA5h3uz/Nwv5wsC4XWXFNndPWlyI/vC7CQZy2sqAWuecXdrQLQLtAOdP
	lVpfA+4/cc3MqVU7hHYiLoEETBu15BJFebpswPZ8LBxV/jWI5xa2S8bzNkT/B9lcai1As2leowP
	wIE6YpnoWkcrr/eZQanvd+pAlyA5Yt6xeL9f9+x29+fmHMkG1Tqyvi2Jxdjrw/4mFObWQAYNJAK
	1Darl9bUbB/ghBAfkyhWwEw4eOP4m+ufv07VQG5ntEwg4wSoCxoPzJ1i7g9EqV+4YrQ70k8PymX
	zIuJCjVefFoeP5oVZ7qws9ZEQsE4+yrAp8Pg67z8K/LuCTFGtmv3Gr4odrFD5EHaaQ1LAvJow8J
	K2oMA/Wj/oP08+mWU/BhjnLWx
X-Received: by 2002:a05:622a:2448:b0:51a:8aec:9bbd with SMTP id d75a77b69052e-529a8353f25mr61789221cf.19.1785087846709;
        Sun, 26 Jul 2026 10:44:06 -0700 (PDT)
X-Received: by 2002:a05:622a:2448:b0:51a:8aec:9bbd with SMTP id d75a77b69052e-529a8353f25mr61788861cf.19.1785087846280;
        Sun, 26 Jul 2026 10:44:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:44:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 19:43:40 +0200
Subject: [PATCH 7/8] arm64: dts: fsd: Move 'status' to the end to match
 coding style
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-dts-coding-style-strict-v1-7-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6074;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9Kdc+t7zEowlwHOut1CYSzTz7wD6Zy1nYRHG/ARWJm0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdOTo4JZdSInPTNsae/rPkvBcq2DkLeb/n0h
 E1eSIPJiP6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHTgAKCRDBN2bmhouD
 11fbD/kB7w+BCZ2Wl6vmGP5t1Gdr1C47gKiZ7WNxO3SskdUUknoEbhSAzctvfmJjFfI1VLyxzBo
 w/XCU6uezm9TLAqhaN3PSxHvQWdrlgUdUPyRNUBopvt58838pgy1bnMqvYLI2Naij6/zRg+w4Pe
 vMthXochuhM7SKokWPgVq36ZwuW6sKotzdojFashb/vtswaAeV7xaXwlJFV36pHivEEJY6fncyy
 dlLzVeb/whkff6QpLpgZLA92G7JdEJYEV/2bTO8XQBbt0KAIy9u6U6PuKr0YoOxAH2I0E5dx93/
 R6e3DpksRbhWsDA9z/b4uVwfUhm/BCesTwQK2EqKJWY5ll/fkfV6EzCoB1AQe9SaUcSdy2t+H6+
 zdWWRzTwAbYXJmLXA3DDP653xStAgds/uaXXQlAPGrN1Z6z8wyPZv8+7JHC0ZCe0mjXjCna4p08
 LTPOsoZBH92gFwKVX4nmJdX2HFRIY2+yFTAepNcB1GOQgoxyHaMNDj5Si11N48jX2NhFYMY2xfv
 eB+wHlTPSrADPF1TDaLu9Z1hhXkGZjhm2P38iVLb9Oo35QrCGtS/R4xWiQqBmmlQbWjitujBfM7
 0wNiCvgJGBqj3RP0L3dxweiCC/Te/UsXaiw4jwEsLPRsykBgrKzN529706N/Ox0gu0tZ7rgkif7
 NkBRpXZarNZBGtQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a664767 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vEzWEtAh74nsurIt10gA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Duxb9dT835cMEE29P5sogW3aXqOmE9nL
X-Proofpoint-ORIG-GUID: Duxb9dT835cMEE29P5sogW3aXqOmE9nL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfXxsk2sEJMoYxJ
 BEFpnipyJwcEEvwQket9zx62ESqbE6g0xCHvvhJhvP76pkaHsZ0+dxa6B1Kt6O3gUIQObGDheTh
 y5NaimdJ8kxw1JxGl1WqztI8d0TdT6M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX1zh1gRkXFvGd
 N5+P04Yoqc6xDbFTPpgGqVRVGHiA/VZu0zIF0UjHBiHlX32fCS+HiIRWghB91C4REuLp/MQVf0H
 ytD5oHYAOH/ut8JvFgwR9lMDLYaaKFzclZ1QWdHNYF26zO+KFjfM4Vm8bY5CnsoxRGRCA9M1Mxh
 Cuh+ReR+Zs7CaUvkZUf5JfL+Q+REIba01lA/E2x33oWdYfi7aZmjRJwR4ti0Hayfw6RX3dnStMo
 b/Y+LPaJvF8BZ5gMBIkNFyZ0LGEzMIjOFveQNPQjZ+PuZRkmAK/yIpuyDHEQMx+XrF9AjLkPu8w
 2Yk9dTU8lcQkmEHhZQPlUTUV17DoflUjY3gXn/xHDFtHcNAS/lp6PEHGALPCDdsK37yEi94aoFK
 k8Pmnmtv/+7yu83zkc4Xd6a4QjoWp1lFG+nB7+eTDiGv3qSzPh45VWBo90B+22VDo4Ojn4zLD2o
 5bLiPaBOLONourOD03g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_104408_470124_1B559855 
X-CRM114-Status: GOOD (  15.44  )
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

'status' property is special, thus DTS coding style expects it to be
always the last property preceded with a blank line, as reported by
dt-check-style:

  [required-blank-lines] "status" must be preceded by a blank line
  [property-order] property 'phy-mode' out of canonical order (should sort before 'status')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts |  6 ++++--
 arch/arm64/boot/dts/tesla/fsd.dtsi    | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 9ff22e1c8723..73b6a25e0e4d 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -65,9 +65,10 @@ codec {
 };
 
 &ethernet0 {
+	phy-mode = "rgmii-id";
+
 	status = "okay";
 
-	phy-mode = "rgmii-id";
 	fixed-link {
 		speed = <1000>;
 		full-duplex;
@@ -75,9 +76,10 @@ fixed-link {
 };
 
 &ethernet1 {
+	phy-mode = "rgmii-id";
+
 	status = "okay";
 
-	phy-mode = "rgmii-id";
 	fixed-link {
 		speed = <1000>;
 		full-duplex;
diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 5b06e2667b89..214d33ca7177 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -603,6 +603,7 @@ serial_0: serial@14180000 {
 				 <&clock_peric PERIC_SCLK_UART0>;
 			clock-names = "uart", "clk_uart_baud0";
 			samsung,uart-fifosize = <64>;
+
 			status = "disabled";
 		};
 
@@ -616,6 +617,7 @@ serial_1: serial@14190000 {
 				 <&clock_peric PERIC_SCLK_UART1>;
 			clock-names = "uart", "clk_uart_baud0";
 			samsung,uart-fifosize = <64>;
+
 			status = "disabled";
 		};
 
@@ -658,6 +660,7 @@ pwm_0: pwm@14100000 {
 			#pwm-cells = <3>;
 			clocks = <&clock_peric PERIC_PWM0_IPCLKPORT_I_PCLK_S0>;
 			clock-names = "timers";
+
 			status = "disabled";
 		};
 
@@ -668,6 +671,7 @@ pwm_1: pwm@14110000 {
 			#pwm-cells = <3>;
 			clocks = <&clock_peric PERIC_PWM1_IPCLKPORT_I_PCLK_S0>;
 			clock-names = "timers";
+
 			status = "disabled";
 		};
 
@@ -681,6 +685,7 @@ hsi2c_0: i2c@14200000 {
 			pinctrl-0 = <&hs_i2c0_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C0>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -694,6 +699,7 @@ hsi2c_1: i2c@14210000 {
 			pinctrl-0 = <&hs_i2c1_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C1>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -707,6 +713,7 @@ hsi2c_2: i2c@14220000 {
 			pinctrl-0 = <&hs_i2c2_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C2>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -720,6 +727,7 @@ hsi2c_3: i2c@14230000 {
 			pinctrl-0 = <&hs_i2c3_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C3>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -733,6 +741,7 @@ hsi2c_4: i2c@14240000 {
 			pinctrl-0 = <&hs_i2c4_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C4>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -746,6 +755,7 @@ hsi2c_5: i2c@14250000 {
 			pinctrl-0 = <&hs_i2c5_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C5>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -759,6 +769,7 @@ hsi2c_6: i2c@14260000 {
 			pinctrl-0 = <&hs_i2c6_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C6>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -772,6 +783,7 @@ hsi2c_7: i2c@14270000 {
 			pinctrl-0 = <&hs_i2c7_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C7>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -789,6 +801,7 @@ i2s_0: i2s@140e0000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2s0_bus>;
 			#sound-dai-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -806,6 +819,7 @@ i2s_1: i2s@140f0000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2s1_bus>;
 			#sound-dai-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -840,6 +854,7 @@ m_can0: can@14088000 {
 				 <&clock_peric PERIC_MCAN0_IPCLKPORT_CCLK>;
 			clock-names = "hclk", "cclk";
 			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+
 			status = "disabled";
 		};
 
@@ -857,6 +872,7 @@ m_can1: can@14098000 {
 				 <&clock_peric PERIC_MCAN1_IPCLKPORT_CCLK>;
 			clock-names = "hclk", "cclk";
 			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+
 			status = "disabled";
 		};
 
@@ -874,6 +890,7 @@ m_can2: can@140a8000 {
 				 <&clock_peric PERIC_MCAN2_IPCLKPORT_CCLK>;
 			clock-names = "hclk", "cclk";
 			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+
 			status = "disabled";
 		};
 
@@ -891,6 +908,7 @@ m_can3: can@140b8000 {
 				 <&clock_peric PERIC_MCAN3_IPCLKPORT_CCLK>;
 			clock-names = "hclk", "cclk";
 			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+
 			status = "disabled";
 		};
 
@@ -909,6 +927,7 @@ spi_0: spi@14140000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi0_bus>;
 			num-cs = <1>;
+
 			status = "disabled";
 		};
 
@@ -927,6 +946,7 @@ spi_1: spi@14150000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi1_bus>;
 			num-cs = <1>;
+
 			status = "disabled";
 		};
 
@@ -945,6 +965,7 @@ spi_2: spi@14160000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi2_bus>;
 			num-cs = <1>;
+
 			status = "disabled";
 		};
 
@@ -1007,6 +1028,7 @@ ethernet1: ethernet@14300000 {
 				    <&eth1_rx_ctrl>, <&eth1_mdio>;
 			local-mac-address = [00 00 00 00 00 00];
 			iommus = <&smmu_peric 0x0 0x1>;
+
 			status = "disabled";
 		};
 
@@ -1026,6 +1048,7 @@ ufs: ufs@15120000 {
 			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
 			phys = <&ufs_phy>;
 			phy-names = "ufs-phy";
+
 			status = "disabled";
 		};
 
@@ -1056,6 +1079,7 @@ ethernet0: ethernet@15300000 {
 				    <&eth0_rx_ctrl>, <&eth0_mdio>;
 			local-mac-address = [00 00 00 00 00 00];
 			iommus = <&smmu_fsys0 0x0 0x1>;
+
 			status = "disabled";
 		};
 	};

-- 
2.53.0


