Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE5EC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 13:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BV3A9L+gcYLTgq/m2BBB5zI+0t3BKzwph1D1xLxuYPg=; b=jfvxUbUhfHozXLAhJg2X+NDf/5
	SOXBY7IWg15kjZedTPH7ezmFxVvvf/J6LjIIucq4gWaT37EAoIPtzUpIRHrPdVJrpr1ne3cxYpBIi
	fWBQMF/nAiSdop9NiMtd9XM4U+JaUvcED2frp4M/6tFtKMlSKGThdSQySzJghIegT0yEaKEKPTSEJ
	IcQkjCEHyvUVrRoBZ4UVx8DSaYOcmzVZa5WKLlAAyTHUaoaK3VYdUcV++j28wwctrsCg3/tFQ11yd
	kNpry0y5N2Jl8WtYR+zQpqIg5h3kLpwmBDoJBUVXieQsR2vEcg0i4JP27NC3tXRrgrLBVt/c27XD/
	mP+BF2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueD3Q-00000002Y9b-17C2;
	Tue, 22 Jul 2025 13:29:12 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueC2L-00000002QDR-1v9D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 12:24:02 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-acb5ec407b1so867738766b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 05:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753187040; x=1753791840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BV3A9L+gcYLTgq/m2BBB5zI+0t3BKzwph1D1xLxuYPg=;
        b=MLa4v/TzkK1DNGg+AJh3EWbGqrVFawg7W0m3jZDosO1zANU6Guon1+BaRAV9IF4VUx
         Pm/mGb7jcVCOJqB/7Ng9DDMqXzSNYIaB7ObLAP//uvoF8115v/wH3UKQC8xN4ZkFlJC7
         zXvZh26JsC6MBEHxmCVhrF5MMFmtwxbb3Y7cU/Pk7gJ6Tev3dt53hUqT6ywh2qEOj0Uu
         pM9ALXMi/tKchyI4U7dJQzaZ2ut7bqg2MR7Yg5XWLogx2tDwPTf/3AUnzN7u1UCSykUJ
         gp2ncYhHX0OnsgOKMGhriSC3UVfNYKOnOL6UDScmylsO+3ANLdE17ljGIQMWIEgsvl7r
         rj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187040; x=1753791840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BV3A9L+gcYLTgq/m2BBB5zI+0t3BKzwph1D1xLxuYPg=;
        b=kAW5AzacrZBiVjeYpAnJUUq9eYWTgiI8Gt+afYhn59utclx45/92m3YplBo5rAcZji
         I0t/4TGXxFHFgzmjeljNIgzauYCaNGrultSBBol8aOAydGkTTk194QBt7C5xEh4WoGmw
         IScIpiKBTIo+yl3IziPZ67G2Xxi1Ot2eW0SToSlqJuBZKCUOQYKbD8015yrZvHGTtEQ8
         /RlFtvG02zN/bg6+bavTdA6yZVOcbOxBGmRdoWBXqPdAS/nakc9Xhc+jph4SgL2O6WHM
         zQSgJWS9YLq9TEVumRQfeUerl7m3c82CHLMAX5aYJlkSqQ5MJ9iX79H54WSfagYRDuf3
         TEJA==
X-Forwarded-Encrypted: i=1; AJvYcCXPBand1LOesv9bKX2LelYCLP752f4D+XgB4eRDCSw2FU4z4U38Ja97mY0fzrsJzMABJd2h1V1bB9CoEJMgBLOY@lists.infradead.org
X-Gm-Message-State: AOJu0YxgRfOheDGOmU34fCXjO78WQOlerSBOGpPhUPIaUPAh+UfZaU29
	TTLW+58A4AZkAWMaU8SzdF8QfsJJ1pvGBEkCagXlGYjSwuyjZusxJels
X-Gm-Gg: ASbGncs2fLSPBtxxxrCKXqE3VuGtyRCYPUNS2mgcsbtodm1EGzdlpKgAY6paEsOocps
	3KcMgly8o1tlixcEfU6LdA5dBuTRwHP93wAqWjiK253cLTST96uSZkO/k+Qf/gl2bJ2hcNlQI3S
	zci3iBB9SHF9xrlsq6GeV4UxqMDPdq+Ul4/BOkyMvReawARsEgZJs+96nYjgzGhBsFOSFOt/gs/
	yxHxr7cWTklpNuzJ1VHF3naiaLZeTQziqQ/T2cRr+KOMA/R/uD5/Ey/dJqjDg0G1syGElGaJw8G
	9DNh7NOvU7ILjBgdTz62Bh16vn1P1Agz8QZBT1RV44MQOQjncol3GYkfFnky2jtviEPJCW7Z7Pm
	Mbaj3yZqNfFPoS7G5a7HX7OrT54sikSISJyt86DCcqXrfovvqrBHl8/8d4hHfENLTawJ6hp73Ug
	==
X-Google-Smtp-Source: AGHT+IEt4kn4A0JiyfUGDXpm1ICFF04OjDfTYiHETQRwdAG1iiF22fyhiLVJUDeFKq5N6QtGAEJdaA==
X-Received: by 2002:a17:907:72d1:b0:ae9:c849:fae0 with SMTP id a640c23a62f3a-ae9ce1e4d8amr2436788566b.58.1753187039780;
        Tue, 22 Jul 2025 05:23:59 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79a056sm861358466b.14.2025.07.22.05.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:23:59 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] arm64: dts: exynos2200: add serial_0/1 nodes
Date: Tue, 22 Jul 2025 15:23:49 +0300
Message-ID: <20250722122350.444019-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_052401_501416_43F27028 
X-CRM114-Status: GOOD (  10.20  )
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

Add nodes for serial_0 (UART_DBG) and serial_1 (UART_BT), which
allows using them.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos2200.dtsi | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index 3fa183c5d..f94a5907b 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -336,6 +336,19 @@ pinctrl_peric1: pinctrl@10730000 {
 			reg = <0x0 0x10730000 0x0 0x1000>;
 		};
 
+		serial_1: serial@10840000 {
+			compatible = "samsung,exynos2200-uart", "google,gs101-uart";
+			reg = <0x0 0x10840000 0x0 0x100>;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_UART_BT>;
+			clock-names = "uart", "clk_uart_baud0";
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH 0>;
+			pinctrl-0 = <&uart1_bus>;
+			pinctrl-names = "default";
+			samsung,uart-fifosize = <256>;
+			status = "disabled";
+		};
+
 		cmu_hsi0: clock-controller@10a00000 {
 			compatible = "samsung,exynos2200-cmu-hsi0";
 			reg = <0x0 0x10a00000 0x0 0x8000>;
@@ -458,6 +471,19 @@ pinctrl_peric2: pinctrl@11c30000 {
 			reg = <0x0 0x11c30000 0x0 0x1000>;
 		};
 
+		serial_0: serial@11c40000 {
+			compatible = "samsung,exynos2200-uart", "google,gs101-uart";
+			reg = <0x0 0x11c40000 0x0 0x100>;
+			clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
+				 <&cmu_peric2 CLK_DOUT_PERIC2_UART_DBG>;
+			clock-names = "uart", "clk_uart_baud0";
+			interrupts = <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH 0>;
+			pinctrl-0 = <&uart0_bus_single>;
+			pinctrl-names = "default";
+			samsung,uart-fifosize = <256>;
+			status = "disabled";
+		};
+
 		cmu_cmgp: clock-controller@14e00000 {
 			compatible = "samsung,exynos2200-cmu-cmgp";
 			reg = <0x0 0x14e00000 0x0 0x8000>;
-- 
2.43.0


