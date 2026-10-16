Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37042CCF2C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTWugQ07RJZxi4zUckj+Gcw87y2zOdheX+TP0+T7qDM=; b=J2LLzt7YKn2E7/WaENqyvL3BJP
	zp3ZiNF48sVEArHXQQtw3NkV+bN7GuqUmgq1Sf9PazBcwfXCEyPEZSO/CDhGEGtUlx7A0zJyeB5gn
	LHrJDwQooUBKOa2Ugkr5jp7yc2ZUG6jEu4gphsgJpf2e7lvbokFU0BJeVcxS9LSaZD0lMn9/42IU2
	ECkLGxxWx4EKXMcGDAXqcxjz4UTq86MuiQyR0CcWfLFX+6iw7ZV34sifzhzPVjO1Bt7i+lQ7Hdb94
	6+FiN5nml8rdvd0Ey0Zhb0lStlDT3zZZHoFmyNf7WfdsdkyozODMHxOlg4lLE837pxtk97e2SJ8Fk
	ZBrJmNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7n-00000003AlF-1mFW;
	Fri, 16 Oct 2026 14:41:35 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7j-00000003Ai0-0r4M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:41:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so127785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 07:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161689; x=1792766489; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTWugQ07RJZxi4zUckj+Gcw87y2zOdheX+TP0+T7qDM=;
        b=c6Tgmy19M8Oyct7SYPYCJ23p3yfw4RHzxn3thUBzbdQWq43PN/TfsD1vszhRu6q25X
         WbYGTCHAhs7ZyLf2uV3I4BciAE5qRDQxrpe8cBhHHlC3aGOI06ZJMtwfU9tSHU+KfsHf
         V0JU6eD6FKXlUPDJKaMc8lrBOGdktEzvN8CF45mA8uvk3mNApdBw7VybdB6zQEEX8rJm
         ALauvpoxZy+yL4bOdS1ioj4btTGshukKoTZTMlNJq8b8hyBDc2m9Ps7H3WroKfS6v5xC
         Bp9p+k2UL93+oZWvXkMjJOINCULG9eXlNcWEgYXLTlA/X5RZ9eabjsETSMWNykj1NSkr
         QTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161689; x=1792766489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTWugQ07RJZxi4zUckj+Gcw87y2zOdheX+TP0+T7qDM=;
        b=vxysQFpf3uj5GGPpSCq4f11qzb8xiGkQNb6HIVmiLbvloinK2e299xbc15VLk4XuK4
         PhF7RPapEwb+BZy1f0OatUbJUtT2h0tHch5OFJ4PYhnEbPfDzUYwxJkjncnzvKih2R5c
         iJeAGk83xqmohzGjOsxCB1Nkn2DTzoFuPZq7fB3uQKoreKw4AGZdIDdE8tAI2zJOPBjj
         mdeo2wqXhciMCeGWrCcXfx4JPFE50H9pzSUPalIllBI3iwp+GZVcvESxpv4HqFP6C8Ux
         MgItaK7XYJIHTPVk3Nm55uzyuFxCxfzDGlH2gMxx641/5uJ/GWwZZkXnjWh/y/teSk8r
         XNrg==
X-Forwarded-Encrypted: i=1; AKwUvBwNp5Ru+2AW7wlGp2Nyv6/d+r6vQA0wY4ZU/8539JIEbEyDtx8ratxi6rT5r+fRTrmIFfmpoy/DdglkVI9EqB9a@lists.infradead.org
X-Gm-Message-State: AFq9FYKNkZdi8JcDrX8ZXZMRNS1OmKOZ/myawLNFGFeWSf2w1prqBr5D
	o3beVi7rlPj2sLH653IGK4ns9P8FzO1EwvYcCUT7zWDOetqHCSY5X3F8rc+k/qVwzpw=
X-Gm-Gg: AYBFou01qjti/FxY3PtyPeDwuUoC8G7HoHoas9wRkmuYfu7g0an008XPgQtPNbFmCQb
	MUApMo22jwmI6lB2c9ybTQDfg1xQ/S35PBfcFXbq2BuKSvDofxReXRM5M3ydHRqOOYzZwaYVjuH
	bzJON4AbY1P54uKx2laL/1T/I/9xg99NCf2Z8rL5JTMMyPlFQdZldqZaw7MaJF5w3BfkkxfcYjg
	ZCz9OXJwK+TO8e9C6jZhj7bt4VtFVQxKcE88IBy94hz2BrkDsrhfO/Z7aBpd7O+nEos5kRPiUIU
	4biJ/iLUDL3gnPDX4LBQI65bvGeek5KPFMRSuUhRIBIyvFLEXbJdbNdfkiEC712jRHUmv4LyxiN
	b71SeP63hcEUmkIo5DVIhqhVC6spmh4wGFCH6HsRhAnJ17TjAlPGd/fXNRF+qdh9t1DsVmZLUWM
	QbsxFLEW+MtR9JDpQ71MHrTWjcWBQrdTevxpCUZb77yV067hgvf1qm+2CkVxWYZMniCt+HZwdq7
	+0qvnPGXoJBP1LuyNCRWd5Vlqq7GRIGktQv45H4cZezVgfnMqq4ymv8qHGPR6Vzkv0wTkNOJhZl
	aaWm
X-Received: by 2002:a05:600c:3f06:b0:49f:ce78:356f with SMTP id 5b1f17b1804b1-4a18e4ca2acmr446522045e9.32.1792161689564;
        Fri, 16 Oct 2026 07:41:29 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:29 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:21 +0200
Subject: [PATCH 06/10] ARM: dts: omap: dm816x: Update USB node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-6-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=2792;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=yeoQMJZLdXTsEHqsBY6ksgO6GV/Huaox9D+QkSIjjJY=;
 b=hUsC6e73gt93LP3x/KbW6rl4RE1LBMRpaoGxAroE+S6HI6fgnl9crEsTbyV+xHq8m7uXraUxO
 l/v11BMwtZwCUNC481i6cYxwKSFdFrUcMGh2iu44yYm72A4iIqYpC2T
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_074131_290696_EC2A6B66 
X-CRM114-Status: GOOD (  13.20  )
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

From: Andrew Goodbody <andrew.goodbody@linaro.org>

USB node was not working correctly with DMA enabled as the supporting
code had been updated without updating this SoC's device tree. Bring the
device tree more up to date so that it works with DMA enabled.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 41 +++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index 7f3ef3a00ab8..5be9efc60785 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -574,18 +574,27 @@ uart3: serial@48024000 {
 		};
 
 		/* NOTE: USB needs a transceiver driver for phys to work */
-		usb: usb_otg_hs@47401000 {
-			compatible = "ti,am33xx-usb";
-			reg = <0x47401000 0x400000>;
-			ranges;
+		usb: target-module@47400000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			ti,hwmods = "usb_otg_hs";
+			reg = <0x47400000 0x4>,
+			      <0x47400010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <SYSC_OMAP4_SOFTRESET>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_SMART>;
+			ti,sysc-delay-us = <2>;
+			clocks = <&default_clkctrl DM816_USB_OTG_HS_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ti,hwmods = "usb_otg_hs";
+			ranges = <0x0 0x47400000 0x8000>;
 
-			usb0: usb@47401000 {
+			usb0: usb@1000 {
 				compatible = "ti,musb-dm816";
-				reg = <0x47401400 0x400
-				       0x47401000 0x200>;
+				reg = <0x1400 0x400>,
+				      <0x1000 0x200>;
 				reg-names = "mc", "control";
 				interrupts = <18>;
 				interrupt-names = "mc";
@@ -622,10 +631,10 @@ &cppi41dma 11 1 &cppi41dma 12 1
 					"tx14", "tx15";
 			};
 
-			usb1: usb@47401800 {
+			usb1: usb@1800 {
 				compatible = "ti,musb-dm816";
-				reg = <0x47401c00 0x400
-				       0x47401800 0x200>;
+				reg = <0x1c00 0x400>,
+				      <0x1800 0x200>;
 				reg-names = "mc", "control";
 				interrupts = <19>;
 				interrupt-names = "mc";
@@ -662,12 +671,12 @@ &cppi41dma 26 1 &cppi41dma 27 1
 					"tx14", "tx15";
 			};
 
-			cppi41dma: dma-controller@47402000 {
+			cppi41dma: dma-controller@2000 {
 				compatible = "ti,am3359-cppi41";
-				reg = <0x47400000 0x1000>,
-				      <0x47402000 0x1000>,
-				      <0x47403000 0x1000>,
-				      <0x47404000 0x4000>;
+				reg =  <0x0000 0x1000>,
+				       <0x2000 0x1000>,
+				       <0x3000 0x1000>,
+				       <0x4000 0x4000>;
 				reg-names = "glue", "controller", "scheduler", "queuemgr";
 				interrupts = <17>;
 				interrupt-names = "glue";

-- 
2.56.0


