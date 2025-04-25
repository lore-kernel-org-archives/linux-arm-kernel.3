Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAB0C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 20:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4JA/24tCVPu/6qLUwk7l1K+rvMBJ9EigZtYSNdrSX4=; b=Dw8AfFWTdHJUDZSPOY6x1NwZDt
	LqAqXLZsHU4zN7gV0LOhh6uCqrguFxGla0P+bqocDVbN79trMAn95z3yheQvqvI+2LO4qT5ttaGFm
	EpkFpeik4YQlRgTRLhBSkmtd98xtKeSuXnxbQ8FSo3lFRrY51tR4sDbAKnfSPTzrtKM0k9ggsNelv
	il7P6sNBfp8xbasCI+aoKBw5WpuK1VAfyjdBpetZv6LEBPRewZNnx7cxAiy9g37dm+qhSxXvZiZRt
	MdIIHFIdzVnV1E5Qo01aZ5eeefTPbpC+LW6iDRdKm9eVaMfXbBKxocS69q+oTfEnxK2rmosi1XqC3
	y5UFSRaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8PHA-00000000kj8-36XZ;
	Fri, 25 Apr 2025 20:03:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8P2T-00000000iAZ-2foB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 19:48:46 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso3794265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 12:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745610524; x=1746215324; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4JA/24tCVPu/6qLUwk7l1K+rvMBJ9EigZtYSNdrSX4=;
        b=ZXeRYR4gun3t7jZsMK8stUriVLYYApYD94/jUj6msscb6AR9fgqKSUvlLICJ9bdU/k
         s8cuSvqn0zFBet8qRdvkjraqdGtuu7+8KtCVea93zKCp1xDQjGY2Ymt49jhPr/zwV1a4
         6k0sstejHbDameSDpV0mpmpYrdG6CHFbnuzTVflVhPIyYGzRg1zafzAc25wISvrIJwsP
         FUQPa7fYpnghMYS24jl9JL1JSxt4KZ/bBszinsFBXexcOlT0zEZ940aisUqzAEB8mEgy
         pyh8mwQ1kC/I4VZR79e9PV2fhFLsedo8/NVjkaj/vCHSReyRTtwe8qze2Y7LinUeWbNA
         oOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610524; x=1746215324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4JA/24tCVPu/6qLUwk7l1K+rvMBJ9EigZtYSNdrSX4=;
        b=K7NBgCArKTUO9TFH+DREIfZKuBVyR+YASY0TQpLy+wBQqtLzovLb0RAP+OgcyT/1zF
         1Eq7VaavStS8w7U8gy1FuSIfyng650Ef29F1++GG1ePv6sKX8hHkXwpz70JWmHf7qK7X
         vhZBMMNdmyUcm0PN/49n+X8+rUNZdbVoTZ4CEIWFxVyNur0wJ6kQSFPYLN9PkI6idggp
         bcpHUTlbzalUI8p+TXiPfkSqOSVAqOlGXx74Tn5ckSKNEU42bbECyTanyFq2/ds2jUjA
         XVKZWZBcCb+13ojaWv5vpIIwn3K4yQX0BRUdP6RhYzQncp02Sqf2qHNWmIUa1NtPhgEk
         jBxA==
X-Forwarded-Encrypted: i=1; AJvYcCV1r1RV6328zQ+ICKDVJiXjOtAN5AASM7JFajHU3gQFQzl9qcbUX2QFPLr+30hOMLoW21PFEEHQRktIZT60a+Pg@lists.infradead.org
X-Gm-Message-State: AOJu0YxxaL7jqfAovhg8Y66jI1ZQLS2Vz1keCz5peN/eFRR8yIK9h6ms
	cehciMG3NEg/aA4N2ynLMHNrf6cgs7kXwv2I/351JiWR5pQPlZ/GHvDxDii3SCs=
X-Gm-Gg: ASbGnctWg86Tf19WQi5/FUC6dMVhCGbUqJLrswcZ4x4S8umwvw0YJyJ6K/TzilVjNLN
	8EVxyGafUIFNoPjP/pdDgSWZLsVH+MuUCS04TA9kDXsvLttWE+4svSI3Hseag31ufqDDPMSykcy
	yxplsi3RPF+7L1dswirydfHcqVk+M0G809mfn7xBCQ032I6ZauZaDsCd4HCBpaaP/PDpOi7inwF
	DjWDdEGCC2eDtSg5EsvrdC5jQXVEeTt0WWpdT3e/WOPxc0/iVSAB7SXxifGQQKqlyCp1OZ9uSJI
	MsVQkHsX0f7lWb4iSmlET8JycSDrbFwZO1npON6iaW/Y35aDxlQ14bvApvU=
X-Google-Smtp-Source: AGHT+IHe+1D/CKQHTHjSQgvbqI1yOD06loQArzvvujsE39fAx26XWsGVL+Vp/lnDEP0KbawfeUBn7w==
X-Received: by 2002:a05:600c:4685:b0:43b:cab3:1fd1 with SMTP id 5b1f17b1804b1-440a65bb7d5mr12401725e9.1.1745610523980;
        Fri, 25 Apr 2025 12:48:43 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2e59sm65922335e9.16.2025.04.25.12.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:48:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 25 Apr 2025 21:48:27 +0200
Subject: [PATCH 4/6] arm64: dts: imx8mn: Move Ethernet aliases out of SoC
 DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dts-imx-aliases-ethernet-v1-4-15b9d5cca611@linaro.org>
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
In-Reply-To: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3688;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kSuXk+uGBBo5zpL4NHaxiMuuyBwuMVMpicPj/p6ATbQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoC+cRBRi68ut6cV5Tjk/mdUsM1uGe7/fx6IsUo
 4s1b2prBRyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAvnEQAKCRDBN2bmhouD
 1x9kD/9kquaUkWYhMNfhh+Js8oXV3Gat2PvlLz909ZtYnRSsHanzuUuyao1qvvPUc4ck+xR5hZ/
 zCqZaUCIIlm8MsDuA7c1YUGDAtqyrmwadhrp446TLcrM+apZVTt0xz6/jSV37ojsw2rYEemJ4vn
 ubDfeH1rURYsbPyCJ5DZMw0/nm3TsC7yDZKnTUG1DX1gZkngD3s05iIi9REF3HyNmnqO9eD3NGj
 DL5+ybWKrtOEsgdlg1260km5GsDCiS0cPmELEFU8MftrY9ngvG03stvGBih/L4OlQi+Vvseyndv
 b0XrCF09yqpzwxvmH3eMjblz6I4TzlLB3OT3TG+EoXJvpGqOmETVxlr2n5twLh53low1F8keKrn
 XBKlIwhLfLOTLy2ut6LDjuGqBJ6ExTAKXBlZysino9YfYpFauEH0wTj7Hk2vCFJsdGBpeNPmPMm
 gCn6ZgzNb+LGlfGEN/eakIkHB1wLr2BzsSZXMG2njxwjgbDxl4r/B8Y5b4PZhswCm903icm8xoP
 9NWhxjaT06hiHqYFB8hIRZAN0J1fV9mjqj6+ZgpYdDNJNlcbUSBcEudDHRIeLAFB3gAc9Gr8FJD
 Bs9aumoTLQvZ+Uyj0nb/yrCXaUs+Q8rJw6EohsDzj77z/HShc6eRm18CXI/qBttjbFZwyhVydAI
 fKvVTAEI0bAFMpw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_124845_680978_C8093FAF 
X-CRM114-Status: GOOD (  11.93  )
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

Ethernet interface, like other exposed interfaces, aliases depend on
actual board configuration, e.g. its labeling, thus aliases should be
defined per each board or each SoM.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi        | 1 +
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi               | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi           | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts      | 1 +
 arch/arm64/boot/dts/freescale/imx8mn.dtsi                   | 1 -
 6 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index 2a64115eebf1c68b69eb0076aa08558eface5705..625a647e1e8d603ad9399d87d74159da33cb013a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -7,6 +7,7 @@
 
 / {
 	aliases {
+		ethernet0 = &fec1;
 		rtc0 = &rtc;
 		rtc1 = &snvs_rtc;
 		spi0 = &flexspi;
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index bbb07c650da9c273a540976142197d9ff1bd5389..d34d37a4a09f328ca19ded10c36aae740196eeef 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -10,6 +10,10 @@
 #include "imx8mn-bsh-smm-s2-display.dtsi"
 
 / {
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	chosen {
 		stdout-path = &uart4;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
index 33d73f3dc18759295207fae76d67100387b86461..f91ce0d9b015f49422aeac9517b4e486e44e4956 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -7,6 +7,10 @@
 #include "imx8mn.dtsi"
 
 / {
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	chosen {
 		stdout-path = &uart2;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index b364307868f25eb05507c651afa6fee8d0c8423f..59fc9ae613bd3aa047c30776ff1bc1f556a53562 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -11,6 +11,10 @@ / {
 	model = "Variscite VAR-SOM-MX8MN module";
 	compatible = "variscite,var-som-mx8mn", "fsl,imx8mn";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	chosen {
 		stdout-path = &uart4;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts b/arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts
index 30c286b34aa535e1ac7ef5affd3b9bcb6a81b633..ed91f73802379d63c4b302c7b1d6baf91b8e962a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts
@@ -17,6 +17,7 @@ / {
 	compatible = "gw,imx8mn-gw7902", "fsl,imx8mn";
 
 	aliases {
+		ethernet0 = &fec1;
 		rtc0 = &gsc_rtc;
 		rtc1 = &snvs_rtc;
 		usb0 = &usbotg1;
diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 848ba5e46ee679166e96327f089904f317b0cf95..93a78b40dd41b804707dfce53ed2abd8586b0312 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -19,7 +19,6 @@ / {
 	#size-cells = <2>;
 
 	aliases {
-		ethernet0 = &fec1;
 		gpio0 = &gpio1;
 		gpio1 = &gpio2;
 		gpio2 = &gpio3;

-- 
2.45.2


