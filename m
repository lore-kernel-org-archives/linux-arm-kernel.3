Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC66BC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OYyQh2WrGx5C4Z4w/0Sz/FjCGm+vwC4M1ks09hw0k+w=; b=c9Oml1+FI7TcrVBvbkUH9nNNre
	Mu9XdHvM1CSRNik+E9sozarJp2yGSHzAaFlAdCpwr6nFBkJ8GtDsDuyh8HxJl/zgYKdrCR5PnFP5w
	gUrfgiHcq+6lkIMnKJOi678okMmuxM5wiIJWBaLae8FGXDBOgFPU3asaI37NNN2GteSvi0o66d327
	H59DBRK15N7iIEFi13iAvMTBk4iIS5/24j/GjEgS7w35jeNm7eWneZEZLMbOFjX+HjvfuvmAYJs9g
	6gbUCgTLvDlLvEl42Qqp2auLtIKOQevl1Hpissz3jIOolgMlvqb6JLbQYmVL09PBiCIA9AWr2at1K
	MRADZPbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uBn-0000000Dl14-07Jh;
	Thu, 24 Apr 2025 10:52:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sFe-0000000DOsw-3T1x
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OYyQh2WrGx5C4Z4w/0Sz/FjCGm+vwC4M1ks09hw0k+w=; b=hSPhDX/dLcSJQmqst7XMySy4Dp
	0MlZSJPULUashyaJiFSEX+XOC1KbagVzZNCEXYnDUnl6p+dOT2ZREfV70x7ycIBU4rC17J86jl5OQ
	6ZajJeBI8Zj46bssGIj3zRHx+oSRewmdXLo7BZ+fPfH0OtraJagTDCwcJhunI5D4N8ZwL4aIqndj9
	ZZb+V1UUTe2cRxeyuM7pfnIle5Bjbkkkp7EJeYlgfnF6FTevFUzyjT2SRaGkImiJZzgop4EE9eRGa
	MaWfcW9MetHTQqOAeyAPdGdRHwimxh/Apbj1adWhsig6ptwzCJX0Ren4UU4rIK10rIr0pzaii6AeF
	Im25gMDw==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7sFb-0000000Bdte-44xD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:48:09 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5ded500589aso123598a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484486; x=1746089286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OYyQh2WrGx5C4Z4w/0Sz/FjCGm+vwC4M1ks09hw0k+w=;
        b=F5omEZHpMn1pGue/b2jLXtz2p/X+kfrgGivfHp/X+GzxHd+StRCnQKNrpa7h3tkXAd
         TC+kTAETC8YyGtswaaY1o4X9GUxUVe7nZCdbusoUDAAc1Yy8b+YHqCxUrnb20ncYBniw
         cl5p/ADNUOp7y2iFfiBCLXOBAIs6E3pW2/7VMXyCwjfN+bhti+ivOekaDAE1SCaFo2V8
         txNR3ntg7kOu8fj7dzGvgmtb11h0+gu9qE2up+78rLPgsWIwo04eSahGk95PYbrYgW19
         cHuoT/v+sbtnqGFDVMu8CpDTZlJ3KxApz1StciryhZETo56g82U5gY9EzTAs8+p7+bur
         rzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484486; x=1746089286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYyQh2WrGx5C4Z4w/0Sz/FjCGm+vwC4M1ks09hw0k+w=;
        b=QtZhgQ7jGhyDY6AYVPWQmeT+KF8oKFdwGwZ4UNl6UIRJqjFVPPfSfQPflWG1SaNeqV
         ZCKWmSTM+W2UqJK8Puq/kS6ZGOZpReg2V5JNrh4HCZJl0VoFlcZRPcDXnv0N1B1hOZcI
         I+v6gd4qifk4E01hFpp3M2u8pfw1ugExUFW+EEGzgHTEajrN4JTRICbRD3vrNenJUh/z
         P1k77PUr73T9L9z+WRplIJdh5P/zjomVwtk+a+/zk0aTNmMWaRXEvx7Z7ldySPVKGNo5
         NqoejliFxdexZ6jwBS7T4KLtMq5h9aK/NmMXJMATC89c0LSHjFZN4+onK1M95yq3i+Mu
         OaOw==
X-Forwarded-Encrypted: i=1; AJvYcCXCUoaWUE5vXgwYi74+cikHm+jSFCvsiDJ2oGBykWTt2woCRvLiHX/qnWXHfJQxYstAlx+qhGVjT2xQnKXumIK3@lists.infradead.org
X-Gm-Message-State: AOJu0YyvY/+4D2qwrIJFpBCIPi4m6FFosiXdoyvROMUmyEdkpPZi4hZA
	PP3g22nXdfwcstnHIUOfd1hy9rh0qYKLONdu5B94Xczd4a7tWI7vm9f03Ofju5I=
X-Gm-Gg: ASbGncuC/1s979nX20bu4wGIszteuEXv42SUkJlP/tq3X1DLdQ+bCHb7KvVE/TBJFCx
	HZUwB6hDCyjZTmyWY8qAKB29TnXeGB3BA2X2wme5Uks1wwXSwc+WOiplvPhutvn9wYrb4n/RVYo
	u4zuf1uJsp7KDsQ/sKpOiIF/YfSMBTWMZ0IQpmcikmu6Y4AAzu7yHXmhKWuJp1F933Fez1FPAOr
	W5Ix2dFuZ3A+DlI7Qh0npVb4fuM0Ma4gN8gfwmhDXXFzOQpdkMw3o9TsJpDIPs+Qh1IA3isX0mD
	3dx0L9UrO19ptoBQFbfxZiRCdnWE3KWREpI1XqhmRulitTJVTQ==
X-Google-Smtp-Source: AGHT+IHf70Oe4hiSF1tedfQvdAAS0RVFcgU5DnHiUpIFgTF7Q4luw0vTUVOjeQvCbbh328Kf2cO9bA==
X-Received: by 2002:a05:6402:2793:b0:5f4:35c7:ff65 with SMTP id 4fb4d7f45d1cf-5f6de3b0cdfmr705505a12.4.1745484485612;
        Thu, 24 Apr 2025 01:48:05 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6f45fd3c1sm118998a12.3.2025.04.24.01.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:48:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@dh-electronics.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: imx: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:47:59 +0200
Message-ID: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_094808_249329_9772B930 
X-CRM114-Status: GOOD (  11.25  )
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

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  imx8mm-var-som-symphony.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi         | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 62ed64663f49..6fe0602b5b9a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -269,7 +269,7 @@ &usdhc1 {
 	mmc-pwrseq = <&usdhc1_pwrseq>;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index cdfacbc35db5..190bde4edcd7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -306,7 +306,7 @@ &usdhc1 {
 	keep-power-in-suspend;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index 2a64115eebf1..0ee7420f964b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -280,7 +280,7 @@ &usdhc1 {
 	mmc-pwrseq = <&usdhc1_pwrseq>;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index bbb07c650da9..d20393c2d901 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -265,7 +265,7 @@ &usdhc2 {
 	non-removable;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		compatible = "brcm,bcm4329-fmac";
 		reg = <1>;
 		pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index b364307868f2..38ef9e4fdf07 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -300,7 +300,7 @@ &usdhc1 {
 	keep-power-in-suspend;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
index a90e28c07e3f..7f754e0a5d69 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
@@ -590,7 +590,7 @@ &usdhc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	brcmf: bcrmf@1 {	/* muRata 2AE */
+	brcmf: wifi@1 {	/* muRata 2AE */
 		reg = <1>;
 		compatible = "cypress,cyw4373-fmac", "brcm,bcm4329-fmac";
 		/*
-- 
2.45.2


