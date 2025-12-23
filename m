Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD894E6F093
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4N29TrFg1gCPgjEI5y4WnyahcCO246i8N1UXz0LWdyU=; b=Grl7KJUckcMQ3TQcF+DfzO+wMJ
	BmH0iAvldLCW51oC9jd+VJex2kghnr1EGv8RSUaQTd86qbOiYMDOtQm04rRnmnWlLP3pqcQ71n36Y
	aWMfeQBeWOLJv5Nqi6PVZuvIgYB6/T5qW/2bwICMfetOqsB66g0oRbYlDP10/iPPQTb5dv5cRO+1e
	JDn5HZG+6LtsWO7Ff+DOC26zqW9OlhGD4HDDrozj750iZBqwaosOnWr1CvhdQUPe8zYY++UMLWLVG
	o8UdB3OFQCCR2jJQIFbZgg+I/lfxpSXULAnUPeJIcpbDKvHnFBG1ffGBBOZtQGUssYqzSMAdD3Jxr
	+hgzhEHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Gl-0000000FgSf-0qtA;
	Tue, 23 Dec 2025 15:25:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Ge-0000000FgMD-1RUD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:25:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNCdOwe559812
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4N29TrFg1gC
	PgjEI5y4WnyahcCO246i8N1UXz0LWdyU=; b=aom3UrRxOPCr2LyCLGNdG0E2/RQ
	lb38aLgYZkNcazRMfpmk4clXIf5L6jBEHRDjUrNUQWUw1GOIsO1YWnrsQwXYCWHH
	Hj82CRtJ8OdmCiQw03OCKRg+HeECdaq4Tk3qiCBnrbEeMKwwtO6EILj4gz8pvg+m
	e44GbSkHvrtLY5NOth+oiDvuTfApJ3HgB6rxkuUp4ArWz6ZaHu/huoDnRg+5uPQP
	h1lNu9P+RrNZLqgz/LRjmNghcbC/kdiKp5KPpbDF4mjhMJwCXcRzOKrCz869IdHh
	NImYXDezgYVHi2hRVzpgfoc2keoI8wuZ6CmimG28Vfxl8HFJeO9ulEuLi8A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9credx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2e9e09e6so170954116d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503543; x=1767108343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4N29TrFg1gCPgjEI5y4WnyahcCO246i8N1UXz0LWdyU=;
        b=ODd+i1bJMdK4c1S1/j+q02lA3Q2mrxjPALh9D8sM20xFESxqhPuoz2iTG69R/rkfG9
         disGOaReo+O+EUzW6NLQwI1DdHRerYYIwNluH9EYLhv8sr1PcWWyPNTe/pqXn9eSQzVy
         Oh2pLOoE6nRRV5ba2GF4fgBzFluILEAHzeS9d8TgdD+Haf1LjDcgjLjVJBf6AZagx9cD
         TC0u5pbV74hzggEKeANNHoKHiH72lGLGAZ+kix/OMoD1w8vx5XOlh1Q3n05S3m+JRFjp
         kS+WfVNwF0aNmn1H2wuMEMfWEQihuS4r9leviSvZXhnHhEZtfPuEx5z7YgOEARO4SbTI
         8mXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503543; x=1767108343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4N29TrFg1gCPgjEI5y4WnyahcCO246i8N1UXz0LWdyU=;
        b=RAgnyV85KD5sE1QxCLauwU4flUce1IuBZmActrJl2nthYPQtr+tZ+8jPuRHPJcIOY7
         seBu3FtvxC5Pdcuys6xQT/p4/K5zo9hD/tGd7br5PSeB1IwHtzjzNrCKDaztig1tKsQd
         2fV+TK3WinPf4tHr/722mjXA0dIT67jd4fBj0ds7s09bS69uRKmrLPxuUaRLihpENkHz
         g9DLs8ptSrv3xGWbFKBvFI8DLszC4MExkEMVwPkfSyhFqWUPr4sEvQCnLLTr7J0a9W7V
         0J2tUMVybg6o3fQCRQ9Pv0ktxSqRD0gvwGEGjEnSdG0MbSATVeFgS+IVvhuslKdJghSt
         7A7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlEHCyPaB2Oj6XWIgsrgOuCY3B6IyrjscKt2C7XxcdCGWRpjjF4gj6+HYA7t3+iLTsSjKVZwZ/LXoawUGsrYAT@lists.infradead.org
X-Gm-Message-State: AOJu0YxdKqSMPhCsWzhhs6rT2bt346noIl0g1eVR8NLQHCv0vDTcJIds
	2cl8pfXxa3xubPh8TmUXQbTPrMxWL4eMLtfCSQdUtej70+95Wp+Q9ZHrQFbNxdMs41jJRzwhflL
	IBOsrdFhlTlO4p0BLUASKamUC6JCxjPxuU1zbSF4Vl9A2IHWxOjap3gljrtiEDTSzgw3xHRXuWG
	JfPg==
X-Gm-Gg: AY/fxX7oldAPs9LJM77CdrZaGGdsWH7MYfK44UIvBSUWzTSOqX0yeU+UhDp4VmYKSAO
	JQB4jYGT5otV2QOAH7AlMWDXViC6VNENXPuZqbT7FxODRxlJIe8ow2IHzyFGrzAStDcoY2fx3kW
	sTxGFMwi40D3F8ccsYiOQDSZ8Aq/52u4If4Ki+yIXxRG1NB16n9eIsLV90RfFRmNaSjCqnBl0at
	WoKsOADqbNtsofOOI3//rTDnG6a8ifbb4LPskQVcBuOIm4hZzx9pMzgqlMmyCvb5iGtq0mNdfTW
	9NAkfhWNx+1U7ZcLw148zAn3X5nKEc/PCHz5rsY1MojM5v/JkbGnZzGJcxygQ9B99B7D9HV+fiI
	aMyQwCxU3XcwmycCFhUK8oiSID2JuuJsNWH5fCwi6+KhGEkI4RScSy752YMMkR7WRaXs=
X-Received: by 2002:ac8:5cd5:0:b0:4f1:b944:bc9d with SMTP id d75a77b69052e-4f4abdb987dmr222414351cf.70.1766503542063;
        Tue, 23 Dec 2025 07:25:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW3a3y3tpqxviqP8lxNLDx3ldjOPcLiwTZ57FRsBrdUhyNkhzb5iU57RTiYXJKH5XHNtbrKw==
X-Received: by 2002:ac8:5cd5:0:b0:4f1:b944:bc9d with SMTP id d75a77b69052e-4f4abdb987dmr222413681cf.70.1766503541313;
        Tue, 23 Dec 2025 07:25:41 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de142csm1411511966b.38.2025.12.23.07.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:25:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: ti: Use lowercase hex
Date: Tue, 23 Dec 2025 16:25:37 +0100
Message-ID: <20251223152535.155571-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223152535.155571-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152535.155571-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=29218; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=2k4fwBTetlBEAzXDv+wTWGPyWnj3TGAzDS7ZsLTt22Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrRwGWhza07VP7ZERnAQeBXr5nQ6uSaaCGaT8
 BPJfU4ZN9+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0cAAKCRDBN2bmhouD
 1/kUD/9jU0xrPPFwR4iip0+dhuAdw8HQmF8f145II3xgSeY+CPNU7CC2EIEjXqUURforSYCxeRI
 QpRX72FbvKx28hmhGW5c/lwlAxmwhm4yJsgaUCkpARYagrqWVhRDqh+M5QfJR6ikOXvHMvKffsB
 yIqrG7wjad11S6QWJmwrZ8TKF6oya/fZ6xcRaIuTnG0uGbJCYzTDfwoAiwO4Oq+nhHRkWHWIfuh
 iljOwj4pj9+N8hyZlivOtXFpFJaHy9lbhHznAFqeABq9e1RKjbiOS64WpsWjxRAaBCgSFO/FUOQ
 aOndFC6W79irlCr3ttGaXZrzWcAZuCmWt30ARH9d+k7dLohhLV15w4/YdvDNhPr/zXX8bubDyoy
 nAhGMZn8jU1MAj/tTrGT8/CQHnHcc4k9bpdwOlyfUC25OLfgvjmXoObQFSrqIW01DxdATzjsYjW
 aT27FfVERGyt2Up3t46uUSNUQJ3e/RwdXUqAluqWP0gC2rDn6qhsl5WElImsHespy+Ejmf70YSr
 xMLwihq6wh06mMK+D5UM14l16sCFpKLQD2wxgKNDB4xNTTsY262aftdsIDCKV1RcuTHSPUyXlKg
 gqEz/JPyRXqf6MVmAPyaWh6wrPwsbgQR+7NY8Xm4cypMq9DjIJeZYfiwxGZ6/uxkUxroF0Ija5w NYvP2984t7QawUw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tig-fEd4vIIrwZQH_Ng4vowk12IEqjOW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX6Z8JpsIBIccW
 EMF224hO6Bi74eUGxFDdRIiWT4xsUCWsepwykz+7wwje4QfuOFTyAKUS4q0cbOswLR6+UNyp0ox
 J0w9f+ZCxQNIpPH6FNETQibbI3pjcqEa2lvHEXMGgiGp9+Gbld7F7jdESKFxhrAj8v10Md7DPKG
 cft9OcE5YleuGGnnrWctOcH//ad2OS/8srbHIjc5R9lNHHvXQxQRUTtLkyoDIPKEYTlaCc0DTip
 mtzI5LvknsCWq0WnOo0M7W/M8js5tXerKYivSJXpuneOUivlGDeuhdUpkMtvJijc8MsEvvj15ec
 mUrFlwHhvCN2UOEHfHm3oc5Umehrijzj8EE9LAQ+T/pVFEax2h9RU14xfwgfPn2f9iHH+4Wv+V3
 xPryMtgAbBgtL01riU4o7AN2jmvFRWDvf56t+Cq3xjU17UlD8QK4hFpKXAryAGqquS7/0Po9tt/
 +XZRjvkk1pWeAaHa6Kw==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694ab477 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-tb9oAJ9HM1SEWaeko4A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: tig-fEd4vIIrwZQH_Ng4vowk12IEqjOW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_072544_790276_A595DCCE 
X-CRM114-Status: GOOD (  15.14  )
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

The DTS code coding style expects lowercase hex for values and unit
addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi   |  2 +-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       |  2 +-
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi      | 18 +++---
 .../dts/ti/k3-am642-phyboard-electra-rdk.dts  |  6 +-
 ...phyboard-electra-x27-gpio1-spi1-uart3.dtso |  4 +-
 .../ti/k3-am65-iot2050-arduino-connector.dtsi | 58 +++++++++----------
 .../boot/dts/ti/k3-am65-iot2050-common.dtsi   |  2 +-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      |  4 +-
 .../arm64/boot/dts/ti/k3-am654-base-board.dts |  2 +-
 .../boot/dts/ti/k3-am68-sk-base-board.dts     | 14 ++---
 arch/arm64/boot/dts/ti/k3-am69-sk.dts         | 26 ++++-----
 .../boot/dts/ti/k3-j7200-mcu-wakeup.dtsi      |  4 +-
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts        | 24 ++++----
 arch/arm64/boot/dts/ti/k3-j721e.dtsi          |  4 +-
 .../boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi     |  2 +-
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts       |  2 +-
 arch/arm64/boot/dts/ti/k3-j722s.dtsi          |  2 +-
 .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi   |  4 +-
 18 files changed, 90 insertions(+), 90 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index ec9dd931fe92..34954df692a3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -514,7 +514,7 @@ pinctrl_sdhci2: main-mmc2-default-pins {
 		pinctrl-single,pins = <
 			AM62PX_IOPAD(0x0120, PIN_INPUT,  0) /* (K24) MMC2_CMD  */ /* SODIMM 160, WiFi_SDIO_CMD   */
 			AM62PX_IOPAD(0x0118, PIN_OUTPUT, 0) /* (K21) MMC2_CLK  */ /* SODIMM 156, WiFi_SDIO_CLK   */
-			AM62PX_IOPAD(0x011C, PIN_INPUT,  0) /* () MMC2_CLKLB   */
+			AM62PX_IOPAD(0x011c, PIN_INPUT,  0) /* () MMC2_CLKLB   */
 			AM62PX_IOPAD(0x0114, PIN_INPUT,  0) /* (K23) MMC2_DAT0 */ /* SODIMM 162, WiFi_SDIO_DATA0 */
 			AM62PX_IOPAD(0x0110, PIN_INPUT,  0) /* (K22) MMC2_DAT1 */ /* SODIMM 164, WiFi_SDIO_DATA1 */
 			AM62PX_IOPAD(0x010c, PIN_INPUT,  0) /* (L20) MMC2_DAT2 */ /* SODIMM 166, WiFi_SDIO_DATA2 */
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index ef719c6334fc..4f7f6f95b02e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -283,7 +283,7 @@ main_mmc2_pins_default: main-mmc2-default-pins {
 		pinctrl-single,pins = <
 			AM62PX_IOPAD(0x0120, PIN_INPUT, 0) /* (K24) MMC2_CMD */
 			AM62PX_IOPAD(0x0118, PIN_OUTPUT, 0) /* (K21) MMC2_CLK */
-			AM62PX_IOPAD(0x011C, PIN_INPUT, 0) /* () MMC2_CLKLB */
+			AM62PX_IOPAD(0x011c, PIN_INPUT, 0) /* () MMC2_CLKLB */
 			AM62PX_IOPAD(0x0114, PIN_INPUT, 0) /* (K23) MMC2_DAT0 */
 			AM62PX_IOPAD(0x0110, PIN_INPUT_PULLUP, 0) /* (K22) MMC2_DAT1 */
 			AM62PX_IOPAD(0x010c, PIN_INPUT_PULLUP, 0) /* (L20) MMC2_DAT2 */
diff --git a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
index d872cc671094..1b1d3970888b 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
@@ -84,7 +84,7 @@ gic500: interrupt-controller@1800000 {
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x00 0x01800000 0x00 0x10000>,	/* GICD */
-		      <0x00 0x01840000 0x00 0xC0000>,	/* GICR */
+		      <0x00 0x01840000 0x00 0xc0000>,	/* GICR */
 		      <0x01 0x00000000 0x00 0x2000>,	/* GICC */
 		      <0x01 0x00010000 0x00 0x1000>,	/* GICH */
 		      <0x01 0x00020000 0x00 0x2000>;	/* GICV */
@@ -685,14 +685,14 @@ cpsw3g: ethernet@8000000 {
 		power-domains = <&k3_pds 13 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
-		dmas = <&main_pktdma 0xC500 15>,
-		       <&main_pktdma 0xC501 15>,
-		       <&main_pktdma 0xC502 15>,
-		       <&main_pktdma 0xC503 15>,
-		       <&main_pktdma 0xC504 15>,
-		       <&main_pktdma 0xC505 15>,
-		       <&main_pktdma 0xC506 15>,
-		       <&main_pktdma 0xC507 15>,
+		dmas = <&main_pktdma 0xc500 15>,
+		       <&main_pktdma 0xc501 15>,
+		       <&main_pktdma 0xc502 15>,
+		       <&main_pktdma 0xc503 15>,
+		       <&main_pktdma 0xc504 15>,
+		       <&main_pktdma 0xc505 15>,
+		       <&main_pktdma 0xc506 15>,
+		       <&main_pktdma 0xc507 15>,
 		       <&main_pktdma 0x4500 15>;
 		dma-names = "tx0", "tx1", "tx2", "tx3", "tx4", "tx5", "tx6",
 			    "tx7", "rx";
diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
index e4afa8c0a8ca..793538f94942 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
@@ -206,8 +206,8 @@ icssg0_mdio_pins_default: icssg0-mdio-default-pins {
 		pinctrl-single,pins = <
 			AM64X_IOPAD(0x0200, PIN_INPUT, 0)	/* (P2) PRG0_MDIO0_MDIO */
 			AM64X_IOPAD(0x0204, PIN_OUTPUT, 0)	/* (P3) PRG0_MDIO0_MDC */
-			AM64X_IOPAD(0x01A8, PIN_OUTPUT, 7)	/* (V1) PRG0_PRU0_GPO18.GPIO1_18 */
-			AM64X_IOPAD(0x01AC, PIN_OUTPUT, 7)	/* (W1) PRG0_PRU0_GPO19.GPIO1_19 */
+			AM64X_IOPAD(0x01a8, PIN_OUTPUT, 7)	/* (V1) PRG0_PRU0_GPO18.GPIO1_18 */
+			AM64X_IOPAD(0x01ac, PIN_OUTPUT, 7)	/* (W1) PRG0_PRU0_GPO19.GPIO1_19 */
 		>;
 	};
 
@@ -300,7 +300,7 @@ AM64X_IOPAD(0x0234, PIN_OUTPUT, 0)	/* (C16) UART0_TXD */
 	main_uart1_pins_default: main-uart1-default-pins {
 		pinctrl-single,pins = <
 			AM64X_IOPAD(0x0248, PIN_INPUT, 0)	/* (D16) UART1_CTSn */
-			AM64X_IOPAD(0x024C, PIN_OUTPUT, 0)	/* (E16) UART1_RTSn */
+			AM64X_IOPAD(0x024c, PIN_OUTPUT, 0)	/* (E16) UART1_RTSn */
 			AM64X_IOPAD(0x0240, PIN_INPUT, 0)	/* (E15) UART1_RXD */
 			AM64X_IOPAD(0x0244, PIN_OUTPUT, 0)	/* (E14) UART1_TXD */
 		>;
diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtso b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtso
index bea8efa3e909..39306bf8eec1 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtso
@@ -29,9 +29,9 @@ AM64X_IOPAD(0x0220, PIN_INPUT, 7)	/* (D14) SPI1_CS1.GPIO1_48 */
 	main_spi1_pins_default: main-spi1-default-pins {
 		pinctrl-single,pins = <
 			AM64X_IOPAD(0x0224, PIN_INPUT, 0)	/* (C14) SPI1_CLK */
-			AM64X_IOPAD(0x021C, PIN_OUTPUT, 0)	/* (B14) SPI1_CS0 */
+			AM64X_IOPAD(0x021c, PIN_OUTPUT, 0)	/* (B14) SPI1_CS0 */
 			AM64X_IOPAD(0x0228, PIN_OUTPUT, 0)	/* (B15) SPI1_D0 */
-			AM64X_IOPAD(0x022C, PIN_INPUT, 0)	/* (A15) SPI1_D1 */
+			AM64X_IOPAD(0x022c, PIN_INPUT, 0)	/* (A15) SPI1_D1 */
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am65-iot2050-arduino-connector.dtsi b/arch/arm64/boot/dts/ti/k3-am65-iot2050-arduino-connector.dtsi
index 7ff0abd7c62e..6c7fdaf1f2c4 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-iot2050-arduino-connector.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-iot2050-arduino-connector.dtsi
@@ -138,28 +138,28 @@ AM65X_WKUP_IOPAD(0x0048, PIN_INPUT_PULLDOWN, 7)
 	d2_uart0_ctsn: d2-uart0-ctsn-pins {
 		pinctrl-single,pins = <
 			/* (P1) MCU_UART0_CTSn */
-			AM65X_WKUP_IOPAD(0x004C, PIN_INPUT, 4)
+			AM65X_WKUP_IOPAD(0x004c, PIN_INPUT, 4)
 		>;
 	};
 
 	d2_gpio: d2-gpio-pins {
 		pinctrl-single,pins = <
 			/* (P5) WKUP_GPIO0_31 */
-			AM65X_WKUP_IOPAD(0x004C, PIN_INPUT, 7)
+			AM65X_WKUP_IOPAD(0x004c, PIN_INPUT, 7)
 		>;
 	};
 
 	d2_gpio_pullup: d2-gpio-pullup-pins {
 		pinctrl-single,pins = <
 			/* (P5) WKUP_GPIO0_31 */
-			AM65X_WKUP_IOPAD(0x004C, PIN_INPUT, 7)
+			AM65X_WKUP_IOPAD(0x004c, PIN_INPUT, 7)
 		>;
 	};
 
 	d2_gpio_pulldown: d2-gpio-pulldown-pins {
 		pinctrl-single,pins = <
 			/* (P5) WKUP_GPIO0_31 */
-			AM65X_WKUP_IOPAD(0x004C, PIN_INPUT_PULLDOWN, 7)
+			AM65X_WKUP_IOPAD(0x004c, PIN_INPUT_PULLDOWN, 7)
 		>;
 	};
 
@@ -348,42 +348,42 @@ AM65X_WKUP_IOPAD(0x0080, PIN_INPUT_PULLDOWN, 7)
 	a2_gpio: a2-gpio-pins {
 		pinctrl-single,pins = <
 			/* (L5) WKUP_GPIO0_43 */
-			AM65X_WKUP_IOPAD(0x007C, PIN_INPUT, 7)
+			AM65X_WKUP_IOPAD(0x007c, PIN_INPUT, 7)
 		>;
 	};
 
 	a2_gpio_pullup: a2-gpio-pullup-pins {
 		pinctrl-single,pins = <
 			/* (L5) WKUP_GPIO0_43 */
-			AM65X_WKUP_IOPAD(0x007C, PIN_INPUT, 7)
+			AM65X_WKUP_IOPAD(0x007c, PIN_INPUT, 7)
 		>;
 	};
 
 	a2_gpio_pulldown: a2-gpio-pulldown-pins {
 		pinctrl-single,pins = <
 			/* (L5) WKUP_GPIO0_43 */
-			AM65X_WKUP_IOPAD(0x007C, PIN_INPUT_PULLDOWN, 7)
+			AM65X_WKUP_IOPAD(0x007c, PIN_INPUT_PULLDOWN, 7)
 		>;
 	};
 
 	a3_gpio: a3-gpio-pins {
 		pinctrl-single,pins = <
 			/* (M5) WKUP_GPIO0_39 */
-			AM65X_WKUP_IOPAD(0x006C, PIN_INPUT, 7)
+			AM65X_WKUP_IOPAD(0x006c, PIN_INPUT, 7)
 		>;
 	};
 
 	a3_gpio_pullup: a3-gpio-pullup-pins {
 		pinctrl-single,pins = <
 			/* (M5) WKUP_GPIO0_39 */
-			AM65X_WKUP_IOPAD(0x006C, PIN_INPUT, 7)
+			AM65X_WKUP_IOPAD(0x006c, PIN_INPUT, 7)
 		>;
 	};
 
 	a3_gpio_pulldown: a3-gpio-pulldown-pins {
 		pinctrl-single,pins = <
 			/* (M5) WKUP_GPIO0_39 */
-			AM65X_WKUP_IOPAD(0x006C, PIN_INPUT_PULLDOWN, 7)
+			AM65X_WKUP_IOPAD(0x006c, PIN_INPUT_PULLDOWN, 7)
 		>;
 	};
 
@@ -411,21 +411,21 @@ AM65X_WKUP_IOPAD(0x0078, PIN_INPUT_PULLDOWN, 7)
 	a5_gpio: a5-gpio-pins {
 		pinctrl-single,pins = <
 			/* (N5) WKUP_GPIO0_35 */
-			AM65X_WKUP_IOPAD(0x005C, PIN_INPUT, 7)
+			AM65X_WKUP_IOPAD(0x005c, PIN_INPUT, 7)
 		>;
 	};
 
 	a5_gpio_pullup: a5-gpio-pullup-pins {
 		pinctrl-single,pins = <
 			/* (N5) WKUP_GPIO0_35 */
-			AM65X_WKUP_IOPAD(0x005C, PIN_INPUT_PULLUP, 7)
+			AM65X_WKUP_IOPAD(0x005c, PIN_INPUT_PULLUP, 7)
 		>;
 	};
 
 	a5_gpio_pulldown: a5-gpio-pulldown-pins {
 		pinctrl-single,pins = <
 			/* (N5) WKUP_GPIO0_35 */
-			AM65X_WKUP_IOPAD(0x005C, PIN_INPUT_PULLDOWN, 7)
+			AM65X_WKUP_IOPAD(0x005c, PIN_INPUT_PULLDOWN, 7)
 		>;
 	};
 
@@ -533,28 +533,28 @@ AM65X_IOPAD(0x0084, PIN_INPUT_PULLDOWN, 7)
 	d5_ehrpwm1_a: d5-ehrpwm1-a-pins {
 		pinctrl-single,pins = <
 			/* (AF17) EHRPWM1_A */
-			AM65X_IOPAD(0x008C, PIN_OUTPUT, 5)
+			AM65X_IOPAD(0x008c, PIN_OUTPUT, 5)
 		>;
 	};
 
 	d5_gpio: d5-gpio-pins {
 		pinctrl-single,pins = <
 			/* (AF17) GPIO0_35 */
-			AM65X_IOPAD(0x008C, PIN_INPUT, 7)
+			AM65X_IOPAD(0x008c, PIN_INPUT, 7)
 		>;
 	};
 
 	d5_gpio_pullup: d5-gpio-pullup-pins {
 		pinctrl-single,pins = <
 			/* (AF17) GPIO0_35 */
-			AM65X_IOPAD(0x008C, PIN_INPUT_PULLUP, 7)
+			AM65X_IOPAD(0x008c, PIN_INPUT_PULLUP, 7)
 		>;
 	};
 
 	d5_gpio_pulldown: d5-gpio-pulldown-pins {
 		pinctrl-single,pins = <
 			/* (AF17) GPIO0_35 */
-			AM65X_IOPAD(0x008C, PIN_INPUT_PULLDOWN, 7)
+			AM65X_IOPAD(0x008c, PIN_INPUT_PULLDOWN, 7)
 		>;
 	};
 
@@ -589,84 +589,84 @@ AM65X_IOPAD(0x0098, PIN_INPUT_PULLDOWN, 7)
 	d7_ehrpwm3_a: d7-ehrpwm3-a-pins {
 		pinctrl-single,pins = <
 			/* (AH15) EHRPWM3_A */
-			AM65X_IOPAD(0x00AC, PIN_OUTPUT, 5)
+			AM65X_IOPAD(0x00ac, PIN_OUTPUT, 5)
 		>;
 	};
 
 	d7_gpio: d7-gpio-pins {
 		pinctrl-single,pins = <
 			/* (AH15) GPIO0_43 */
-			AM65X_IOPAD(0x00AC, PIN_INPUT, 7)
+			AM65X_IOPAD(0x00ac, PIN_INPUT, 7)
 		>;
 	};
 
 	d7_gpio_pullup: d7-gpio-pullup-pins {
 		pinctrl-single,pins = <
 			/* (AH15) GPIO0_43 */
-			AM65X_IOPAD(0x00AC, PIN_INPUT_PULLUP, 7)
+			AM65X_IOPAD(0x00ac, PIN_INPUT_PULLUP, 7)
 		>;
 	};
 
 	d7_gpio_pulldown: d7-gpio-pulldown-pins {
 		pinctrl-single,pins = <
 			/* (AH15) GPIO0_43 */
-			AM65X_IOPAD(0x00AC, PIN_INPUT_PULLDOWN, 7)
+			AM65X_IOPAD(0x00ac, PIN_INPUT_PULLDOWN, 7)
 		>;
 	};
 
 	d8_ehrpwm4_a: d8-ehrpwm4-a-pins {
 		pinctrl-single,pins = <
 			/* (AG15) EHRPWM4_A */
-			AM65X_IOPAD(0x00C0, PIN_OUTPUT, 5)
+			AM65X_IOPAD(0x00c0, PIN_OUTPUT, 5)
 		>;
 	};
 
 	d8_gpio: d8-gpio-pins {
 		pinctrl-single,pins = <
 			/* (AG15) GPIO0_48 */
-			AM65X_IOPAD(0x00C0, PIN_INPUT, 7)
+			AM65X_IOPAD(0x00c0, PIN_INPUT, 7)
 		>;
 	};
 
 	d8_gpio_pullup: d8-gpio-pullup-pins {
 		pinctrl-single,pins = <
 			/* (AG15) GPIO0_48 */
-			AM65X_IOPAD(0x00C0, PIN_INPUT_PULLUP, 7)
+			AM65X_IOPAD(0x00c0, PIN_INPUT_PULLUP, 7)
 		>;
 	};
 
 	d8_gpio_pulldown: d8-gpio-pulldown-pins {
 		pinctrl-single,pins = <
 			/* (AG15) GPIO0_48 */
-			AM65X_IOPAD(0x00C0, PIN_INPUT_PULLDOWN, 7)
+			AM65X_IOPAD(0x00c0, PIN_INPUT_PULLDOWN, 7)
 		>;
 	};
 
 	d9_ehrpwm5_a: d9-ehrpwm5-a-pins {
 		pinctrl-single,pins = <
 			/* (AD15) EHRPWM5_A */
-			AM65X_IOPAD(0x00CC, PIN_OUTPUT, 5)
+			AM65X_IOPAD(0x00cc, PIN_OUTPUT, 5)
 		>;
 	};
 
 	d9_gpio: d9-gpio-pins {
 		pinctrl-single,pins = <
 			/* (AD15) GPIO0_51 */
-			AM65X_IOPAD(0x00CC, PIN_INPUT, 7)
+			AM65X_IOPAD(0x00cc, PIN_INPUT, 7)
 		>;
 	};
 
 	d9_gpio_pullup: d9-gpio-pullup-pins {
 		pinctrl-single,pins = <
 			/* (AD15) GPIO0_51 */
-			AM65X_IOPAD(0x00CC, PIN_INPUT_PULLUP, 7)
+			AM65X_IOPAD(0x00cc, PIN_INPUT_PULLUP, 7)
 		>;
 	};
 
 	d9_gpio_pulldown: d9-gpio-pulldown-pins {
 		pinctrl-single,pins = <
 			/* (AD15) GPIO0_51 */
-			AM65X_IOPAD(0x00CC, PIN_INPUT_PULLDOWN, 7)
+			AM65X_IOPAD(0x00cc, PIN_INPUT_PULLDOWN, 7)
 		>;
 	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
index a9a4e7401a49..f3ee73e64d69 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
@@ -266,7 +266,7 @@ AM65X_WKUP_IOPAD(0x009c, PIN_OUTPUT, 0)
 	minipcie_pins_default: minipcie-default-pins {
 		pinctrl-single,pins = <
 			/* (P2) MCU_OSPI1_DQS.WKUP_GPIO0_27 */
-			AM65X_WKUP_IOPAD(0x003C, PIN_OUTPUT, 7)
+			AM65X_WKUP_IOPAD(0x003c, PIN_OUTPUT, 7)
 		>;
 	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 61c11dc92d9c..d6ee7b9a6b68 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -884,7 +884,7 @@ pcie0_rc: pcie@5500000 {
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges = <0x81000000 0 0          0x0 0x10020000 0 0x00010000>,
-			 <0x82000000 0 0x10030000 0x0 0x10030000 0 0x07FD0000>;
+			 <0x82000000 0 0x10030000 0x0 0x10030000 0 0x07fd0000>;
 		ti,syscon-pcie-id = <&scm_conf 0x210>;
 		ti,syscon-pcie-mode = <&scm_conf 0x4060>;
 		bus-range = <0x0 0xff>;
@@ -905,7 +905,7 @@ pcie1_rc: pcie@5600000 {
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges = <0x81000000 0 0          0x0   0x18020000 0 0x00010000>,
-			 <0x82000000 0 0x18030000 0x0   0x18030000 0 0x07FD0000>;
+			 <0x82000000 0 0x18030000 0x0   0x18030000 0 0x07fd0000>;
 		ti,syscon-pcie-id = <&scm_conf 0x210>;
 		ti,syscon-pcie-mode = <&scm_conf 0x4070>;
 		bus-range = <0x0 0xff>;
diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index 46c58162eca0..e0262c2743eb 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -190,7 +190,7 @@ mcu_uart0_pins_default: mcu-uart0-default-pins {
 		pinctrl-single,pins = <
 			AM65X_WKUP_IOPAD(0x0044, PIN_INPUT, 4)	/* (P4) MCU_OSPI1_D1.MCU_UART0_RXD */
 			AM65X_WKUP_IOPAD(0x0048, PIN_OUTPUT, 4)	/* (P5) MCU_OSPI1_D2.MCU_UART0_TXD */
-			AM65X_WKUP_IOPAD(0x004C, PIN_INPUT, 4)	/* (P1) MCU_OSPI1_D3.MCU_UART0_CTSn */
+			AM65X_WKUP_IOPAD(0x004c, PIN_INPUT, 4)	/* (P1) MCU_OSPI1_D3.MCU_UART0_CTSn */
 			AM65X_WKUP_IOPAD(0x0054, PIN_OUTPUT, 4)	/* (N3) MCU_OSPI1_CSn1.MCU_UART0_RTSn */
 		>;
 		bootph-all;
diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
index 88f202f266c6..8178333fb2b4 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
@@ -359,15 +359,15 @@ J721S2_WKUP_IOPAD(0x04c, PIN_OUTPUT, 0) /* (D27) WKUP_UART0_TXD */
 
 	mcu_cpsw_pins_default: mcu-cpsw-default-pins {
 		pinctrl-single,pins = <
-			J721S2_WKUP_IOPAD(0x02C, PIN_INPUT, 0) /* (B22) MCU_RGMII1_RD0 */
+			J721S2_WKUP_IOPAD(0x02c, PIN_INPUT, 0) /* (B22) MCU_RGMII1_RD0 */
 			J721S2_WKUP_IOPAD(0x028, PIN_INPUT, 0) /* (B21) MCU_RGMII1_RD1 */
 			J721S2_WKUP_IOPAD(0x024, PIN_INPUT, 0) /* (C22) MCU_RGMII1_RD2 */
 			J721S2_WKUP_IOPAD(0x020, PIN_INPUT, 0) /* (D23) MCU_RGMII1_RD3 */
-			J721S2_WKUP_IOPAD(0x01C, PIN_INPUT, 0) /* (D22) MCU_RGMII1_RXC */
+			J721S2_WKUP_IOPAD(0x01c, PIN_INPUT, 0) /* (D22) MCU_RGMII1_RXC */
 			J721S2_WKUP_IOPAD(0x004, PIN_INPUT, 0) /* (E23) MCU_RGMII1_RX_CTL */
 			J721S2_WKUP_IOPAD(0x014, PIN_OUTPUT, 0) /* (F23) MCU_RGMII1_TD0 */
 			J721S2_WKUP_IOPAD(0x010, PIN_OUTPUT, 0) /* (G22) MCU_RGMII1_TD1 */
-			J721S2_WKUP_IOPAD(0x00C, PIN_OUTPUT, 0) /* (E21) MCU_RGMII1_TD2 */
+			J721S2_WKUP_IOPAD(0x00c, PIN_OUTPUT, 0) /* (E21) MCU_RGMII1_TD2 */
 			J721S2_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (E22) MCU_RGMII1_TD3 */
 			J721S2_WKUP_IOPAD(0x018, PIN_OUTPUT, 0) /* (F21) MCU_RGMII1_TXC */
 			J721S2_WKUP_IOPAD(0x000, PIN_OUTPUT, 0) /* (F22) MCU_RGMII1_TX_CTL */
@@ -392,7 +392,7 @@ J721S2_WKUP_IOPAD(0x050, PIN_OUTPUT, 0) /* (E27) MCU_MCAN0_TX */
 
 	mcu_mcan1_pins_default: mcu-mcan1-default-pins {
 		pinctrl-single,pins = <
-			J721S2_WKUP_IOPAD(0x06C, PIN_INPUT, 0) /* (F26) WKUP_GPIO0_5.MCU_MCAN1_RX */
+			J721S2_WKUP_IOPAD(0x06c, PIN_INPUT, 0) /* (F26) WKUP_GPIO0_5.MCU_MCAN1_RX */
 			J721S2_WKUP_IOPAD(0x068, PIN_OUTPUT, 0) /* (C23) WKUP_GPIO0_4.MCU_MCAN1_TX*/
 		>;
 	};
@@ -422,13 +422,13 @@ J721S2_WKUP_IOPAD(0x088, PIN_OUTPUT, 0) /* (C25) WKUP_GPIO0_12.MCU_UART0_TXD */
 	mcu_rpi_header_gpio0_pins0_default: mcu-rpi-header-gpio0-default-pins-0 {
 		pinctrl-single,pins = <
 			J721S2_WKUP_IOPAD(0x118, PIN_INPUT, 7) /* (G25) WKUP_GPIO0_66 */
-			J721S2_WKUP_IOPAD(0x05C, PIN_INPUT, 7) /* (E24) MCU_SPI1_D0.WKUP_GPIO0_1 */
+			J721S2_WKUP_IOPAD(0x05c, PIN_INPUT, 7) /* (E24) MCU_SPI1_D0.WKUP_GPIO0_1 */
 			J721S2_WKUP_IOPAD(0x060, PIN_INPUT, 7) /* (C28) MCU_SPI1_D1.WKUP_GPIO0_2 */
 			J721S2_WKUP_IOPAD(0x058, PIN_INPUT, 7) /* (D26) MCU_SPI1_CLK.WKUP_GPIO0_0 */
 			J721S2_WKUP_IOPAD(0x094, PIN_INPUT, 7) /* (D25) MCU_SPI1_CS2.WKUP_GPIO0_15*/
-			J721S2_WKUP_IOPAD(0x0B8, PIN_INPUT, 7) /* (G27) WKUP_GPIO0_56 */
+			J721S2_WKUP_IOPAD(0x0b8, PIN_INPUT, 7) /* (G27) WKUP_GPIO0_56 */
 			J721S2_WKUP_IOPAD(0x114, PIN_INPUT, 7) /* (J26) WKUP_GPIO0_57 */
-			J721S2_WKUP_IOPAD(0x11C, PIN_INPUT, 7) /* (J27) WKUP_GPIO0_67 */
+			J721S2_WKUP_IOPAD(0x11c, PIN_INPUT, 7) /* (J27) WKUP_GPIO0_67 */
 			J721S2_WKUP_IOPAD(0x064, PIN_INPUT, 7) /* (C27) MCU_SPI1_CS0.WKUP_GPIO0_3 */
 		>;
 	};
diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index abe2f21e0e1d..e56772a334c5 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -264,24 +264,24 @@ J784S4_IOPAD(0x0e8, PIN_INPUT, 8) /* (AR38) TIMER_IO0.MMC1_SDCD */
 
 	vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
 		pinctrl-single,pins = <
-			J784S4_IOPAD(0x0C4, PIN_INPUT, 7) /* (AD36) ECAP0_IN_APWM_OUT.GPIO0_49 */
+			J784S4_IOPAD(0x0c4, PIN_INPUT, 7) /* (AD36) ECAP0_IN_APWM_OUT.GPIO0_49 */
 		>;
 	};
 
 	rpi_header_gpio0_pins_default: rpi-header-gpio0-default-pins {
 		pinctrl-single,pins = <
-			J784S4_IOPAD(0x0BC, PIN_INPUT, 7) /* (AD33) MCASP1_AFSX.GPIO0_47 */
-			J784S4_IOPAD(0x06C, PIN_INPUT, 7) /* (AJ37) MCASP4_AFSX.GPIO0_27 */
-			J784S4_IOPAD(0x0B4, PIN_INPUT, 7) /* (AL34) MCASP1_AXR4.GPIO0_45 */
-			J784S4_IOPAD(0x0C0, PIN_INPUT, 7) /* (AD38) MCASP1_AXR0.GPIO0_48 */
-			J784S4_IOPAD(0x00C, PIN_INPUT, 7) /* (AF33) MCAN13_TX.GPIO0_3 */
-			J784S4_IOPAD(0x0B8, PIN_INPUT, 7) /* (AC34) MCASP1_ACLKX.GPIO0_46 */
+			J784S4_IOPAD(0x0bc, PIN_INPUT, 7) /* (AD33) MCASP1_AFSX.GPIO0_47 */
+			J784S4_IOPAD(0x06c, PIN_INPUT, 7) /* (AJ37) MCASP4_AFSX.GPIO0_27 */
+			J784S4_IOPAD(0x0b4, PIN_INPUT, 7) /* (AL34) MCASP1_AXR4.GPIO0_45 */
+			J784S4_IOPAD(0x0c0, PIN_INPUT, 7) /* (AD38) MCASP1_AXR0.GPIO0_48 */
+			J784S4_IOPAD(0x00c, PIN_INPUT, 7) /* (AF33) MCAN13_TX.GPIO0_3 */
+			J784S4_IOPAD(0x0b8, PIN_INPUT, 7) /* (AC34) MCASP1_ACLKX.GPIO0_46 */
 			J784S4_IOPAD(0x090, PIN_INPUT, 7) /* (AC35) MCASP0_AXR8.GPIO0_36 */
-			J784S4_IOPAD(0x0A8, PIN_INPUT, 7) /* (AF34) MCASP0_AXR14.GPIO0_42 */
-			J784S4_IOPAD(0x0A4, PIN_INPUT, 7) /* (AJ36) MCASP0_AXR13.GPIO0_41 */
+			J784S4_IOPAD(0x0a8, PIN_INPUT, 7) /* (AF34) MCASP0_AXR14.GPIO0_42 */
+			J784S4_IOPAD(0x0a4, PIN_INPUT, 7) /* (AJ36) MCASP0_AXR13.GPIO0_41 */
 			J784S4_IOPAD(0x034, PIN_INPUT, 7) /* (AJ34) PMIC_WAKE0n.GPIO0_13 */
-			J784S4_IOPAD(0x0CC, PIN_INPUT, 7) /* (AM37) SPI0_CS0.GPIO0_51 */
-			J784S4_IOPAD(0x08C, PIN_INPUT, 7) /* (AE35) MCASP0_AXR7.GPIO0_35 */
+			J784S4_IOPAD(0x0cc, PIN_INPUT, 7) /* (AM37) SPI0_CS0.GPIO0_51 */
+			J784S4_IOPAD(0x08c, PIN_INPUT, 7) /* (AE35) MCASP0_AXR7.GPIO0_35 */
 			J784S4_IOPAD(0x008, PIN_INPUT, 7) /* (AJ33) MCAN12_RX.GPIO0_2 */
 			J784S4_IOPAD(0x004, PIN_INPUT, 7) /* (AG36) MCAN12_TX.GPIO0_1 */
 		>;
@@ -347,8 +347,8 @@ J784S4_IOPAD(0x094, PIN_OUTPUT, 0) /* (AG35) MCAN6_TX */
 
 	main_mcan7_pins_default: main-mcan7-default-pins {
 		pinctrl-single,pins = <
-			J784S4_IOPAD(0x0A0, PIN_INPUT, 0) /* (AD34) MCAN7_RX */
-			J784S4_IOPAD(0x09C, PIN_OUTPUT, 0) /* (AF35) MCAN7_TX */
+			J784S4_IOPAD(0x0a0, PIN_INPUT, 0) /* (AD34) MCAN7_RX */
+			J784S4_IOPAD(0x09c, PIN_OUTPUT, 0) /* (AF35) MCAN7_TX */
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
index fec1db8b133d..dc5c02a025f8 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
@@ -212,7 +212,7 @@ mcu_timerio_input: pinctrl@40f04200 {
 		reg = <0x0 0x40f04200 0x0 0x28>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
-		pinctrl-single,function-mask = <0x0000000F>;
+		pinctrl-single,function-mask = <0x0000000f>;
 		status = "reserved";
 	};
 
@@ -222,7 +222,7 @@ mcu_timerio_output: pinctrl@40f04280 {
 		reg = <0x0 0x40f04280 0x0 0x28>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
-		pinctrl-single,function-mask = <0x0000000F>;
+		pinctrl-single,function-mask = <0x0000000f>;
 		status = "reserved";
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
index 050776cb4df8..689ba2ff81f7 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
@@ -443,29 +443,29 @@ J721E_IOPAD(0x154, PIN_INPUT_PULLUP, 2) /* (AA27) PRG0_MDIO0_MDC.I2C5_SDA */
 
 	rpi_header_gpio0_pins_default: rpi-header-gpio0-default-pins {
 		pinctrl-single,pins = <
-			J721E_IOPAD(0x01C, PIN_INPUT, 7) /* (AD22) PRG1_PRU0_GPO6.GPIO0_7 */
+			J721E_IOPAD(0x01c, PIN_INPUT, 7) /* (AD22) PRG1_PRU0_GPO6.GPIO0_7 */
 			J721E_IOPAD(0x120, PIN_INPUT, 7) /* (AA28) PRG0_PRU1_GPO8.GPIO0_71 */
-			J721E_IOPAD(0x14C, PIN_INPUT, 7) /* (AA29) PRG0_PRU1_GPO19.GPIO0_82 */
-			J721E_IOPAD(0x02C, PIN_INPUT, 7) /* (AD21) PRG1_PRU0_GPO10.GPIO0_11 */
+			J721E_IOPAD(0x14c, PIN_INPUT, 7) /* (AA29) PRG0_PRU1_GPO19.GPIO0_82 */
+			J721E_IOPAD(0x02c, PIN_INPUT, 7) /* (AD21) PRG1_PRU0_GPO10.GPIO0_11 */
 			J721E_IOPAD(0x198, PIN_INPUT, 7) /* (V25) RGMII6_TD1.GPIO0_101 */
-			J721E_IOPAD(0x1B0, PIN_INPUT, 7) /* (W24) RGMII6_RD1.GPIO0_107 */
-			J721E_IOPAD(0x1A0, PIN_INPUT, 7) /* (W29) RGMII6_TXC.GPIO0_103 */
+			J721E_IOPAD(0x1b0, PIN_INPUT, 7) /* (W24) RGMII6_RD1.GPIO0_107 */
+			J721E_IOPAD(0x1a0, PIN_INPUT, 7) /* (W29) RGMII6_TXC.GPIO0_103 */
 			J721E_IOPAD(0x008, PIN_INPUT, 7) /* (AG22) PRG1_PRU0_GPO1.GPIO0_2 */
-			J721E_IOPAD(0x1D0, PIN_INPUT, 7) /* (AA3) SPI0_D1.GPIO0_115 */
-			J721E_IOPAD(0x11C, PIN_INPUT, 7) /* (AA24) PRG0_PRU1_GPO7.GPIO0_70 */
+			J721E_IOPAD(0x1d0, PIN_INPUT, 7) /* (AA3) SPI0_D1.GPIO0_115 */
+			J721E_IOPAD(0x11c, PIN_INPUT, 7) /* (AA24) PRG0_PRU1_GPO7.GPIO0_70 */
 			J721E_IOPAD(0x148, PIN_INPUT, 7) /* (AA26) PRG0_PRU1_GPO18.GPIO0_81 */
 			J721E_IOPAD(0x004, PIN_INPUT, 7) /* (AC23) PRG1_PRU0_GPO0.GPIO0_1 */
 			J721E_IOPAD(0x014, PIN_INPUT, 7) /* (AH23) PRG1_PRU0_GPO4.GPIO0_5 */
 			J721E_IOPAD(0x020, PIN_INPUT, 7) /* (AE20) PRG1_PRU0_GPO7.GPIO0_8 */
-			J721E_IOPAD(0x19C, PIN_INPUT, 7) /* (W27) RGMII6_TD0.GPIO0_102 */
-			J721E_IOPAD(0x1B4, PIN_INPUT, 7) /* (W25) RGMII6_RD0.GPIO0_108 */
+			J721E_IOPAD(0x19c, PIN_INPUT, 7) /* (W27) RGMII6_TD0.GPIO0_102 */
+			J721E_IOPAD(0x1b4, PIN_INPUT, 7) /* (W25) RGMII6_RD0.GPIO0_108 */
 			J721E_IOPAD(0x188, PIN_INPUT, 7) /* (Y28) RGMII6_TX_CTL.GPIO0_97 */
-			J721E_IOPAD(0x00C, PIN_INPUT, 7) /* (AF22) PRG1_PRU0_GPO2.GPIO0_3 */
+			J721E_IOPAD(0x00c, PIN_INPUT, 7) /* (AF22) PRG1_PRU0_GPO2.GPIO0_3 */
 			J721E_IOPAD(0x010, PIN_INPUT, 7) /* (AJ23) PRG1_PRU0_GPO3.GPIO0_4 */
 			J721E_IOPAD(0x178, PIN_INPUT, 7) /* (U27) RGMII5_RD3.GPIO0_93 */
-			J721E_IOPAD(0x17C, PIN_INPUT, 7) /* (U24) RGMII5_RD2.GPIO0_94 */
+			J721E_IOPAD(0x17c, PIN_INPUT, 7) /* (U24) RGMII5_RD2.GPIO0_94 */
 			J721E_IOPAD(0x190, PIN_INPUT, 7) /* (W23) RGMII6_TD3.GPIO0_99 */
-			J721E_IOPAD(0x18C, PIN_INPUT, 7) /* (V23) RGMII6_RX_CTL.GPIO0_98 */
+			J721E_IOPAD(0x18c, PIN_INPUT, 7) /* (V23) RGMII6_RX_CTL.GPIO0_98 */
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-j721e.dtsi b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
index b6e22c242951..ba109cc5b2bc 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
@@ -41,7 +41,7 @@ cpu0: cpu@0 {
 			reg = <0x000>;
 			device_type = "cpu";
 			enable-method = "psci";
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
 			d-cache-size = <0x8000>;
@@ -55,7 +55,7 @@ cpu1: cpu@1 {
 			reg = <0x001>;
 			device_type = "cpu";
 			enable-method = "psci";
-			i-cache-size = <0xC000>;
+			i-cache-size = <0xc000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
 			d-cache-size = <0x8000>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
index 2a7f9c519735..fd01437726ab 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
@@ -87,7 +87,7 @@ wkup_pmx0: pinctrl@4301c000 {
 	wkup_pmx1: pinctrl@4301c038 {
 		compatible = "pinctrl-single";
 		/* Proxy 0 addressing */
-		reg = <0x00 0x4301c038 0x00 0x02C>;
+		reg = <0x00 0x4301c038 0x00 0x02c>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
 		pinctrl-single,function-mask = <0xffffffff>;
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index 7baf5764862b..e66330c71593 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -436,7 +436,7 @@ J722S_MCU_IOPAD(0x034, PIN_OUTPUT, 0) /* (B2) MCU_MCAN0_TX */
 	mcu_mcan1_pins_default: mcu-mcan1-default-pins {
 		pinctrl-single,pins = <
 			J722S_MCU_IOPAD(0x040, PIN_INPUT, 0) /* (B1) MCU_MCAN1_RX */
-			J722S_MCU_IOPAD(0x03C, PIN_OUTPUT, 0) /*(C1) MCU_MCAN1_TX */
+			J722S_MCU_IOPAD(0x03c, PIN_OUTPUT, 0) /*(C1) MCU_MCAN1_TX */
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index cdc8570e54b2..c8b634c34677 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -162,7 +162,7 @@ cbass_main: bus@f0000 {
 			 <0x00 0x0fd20200 0x00 0x0fd20200 0x00 0x00000200>, /* JPEGENC0_CORE_MMU */
 			 <0x00 0x20000000 0x00 0x20000000 0x00 0x0a008000>, /* Third peripheral window */
 			 <0x00 0x30040000 0x00 0x30040000 0x00 0x00080000>, /* PRUSS-M */
-			 <0x00 0x301C0000 0x00 0x301C0000 0x00 0x00001000>, /* DPHY-TX */
+			 <0x00 0x301c0000 0x00 0x301c0000 0x00 0x00001000>, /* DPHY-TX */
 			 <0x00 0x30101000 0x00 0x30101000 0x00 0x00080100>, /* CSI window */
 			 <0x00 0x30200000 0x00 0x30200000 0x00 0x00010000>, /* DSS */
 			 <0x00 0x30210000 0x00 0x30210000 0x00 0x00010000>, /* VPU */
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index e50735577737..ff3a85cbc524 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -509,10 +509,10 @@ J784S4_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (F32) MCU_OSPI1_CLK */
 			J784S4_WKUP_IOPAD(0x024, PIN_OUTPUT, 0) /* (G32) MCU_OSPI1_CSn0 */
 			J784S4_WKUP_IOPAD(0x014, PIN_INPUT, 0) /* (E35) MCU_OSPI1_D0 */
 			J784S4_WKUP_IOPAD(0x018, PIN_INPUT, 0) /* (D31) MCU_OSPI1_D1 */
-			J784S4_WKUP_IOPAD(0x01C, PIN_INPUT, 0) /* (G31) MCU_OSPI1_D2 */
+			J784S4_WKUP_IOPAD(0x01c, PIN_INPUT, 0) /* (G31) MCU_OSPI1_D2 */
 			J784S4_WKUP_IOPAD(0x020, PIN_INPUT, 0) /* (F33) MCU_OSPI1_D3 */
 			J784S4_WKUP_IOPAD(0x010, PIN_INPUT, 0) /* (F31) MCU_OSPI1_DQS */
-			J784S4_WKUP_IOPAD(0x00C, PIN_INPUT, 0) /* (C31) MCU_OSPI1_LBCLKO */
+			J784S4_WKUP_IOPAD(0x00c, PIN_INPUT, 0) /* (C31) MCU_OSPI1_LBCLKO */
 		>;
 	};
 };
-- 
2.51.0


