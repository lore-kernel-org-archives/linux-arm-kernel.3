Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFA8C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuCDKY9mXTrdYYrt4yEzUU2rfGaRGeNzZjabp91Amlo=; b=YDDFUsZS/OvQbcv7uUr8Xc1ZRe
	SezUggxTbjU138djqte8883YFlcgC8bC5ERZXuH3E/JjmyMF3PDvNXBYcgZrRXusf6wBGJHbBHM4a
	G6t103s3kCGqu88kBJpjOMQObrw+zG6H3DnbpBuNiIFXwhr43mBzkn1WQa30miZnC36kP8crIsEEZ
	oFBpr2nhK5hqFAAVwehX/eWJclY5ocf6C8qlb+kceHLukGTt4HbT3UQIGjJ76KPSVCMEvoBmVt6ra
	0Z6VsKYrRTGHkxoXaRfMnEbqDzY2ZvzBJGQ+XI/AxYqCarqJGyW6doknxUok8oXrubcz4ZiX/wenm
	cvbmaGfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySTz-0000000GRtZ-0snq;
	Mon, 24 Aug 2026 11:04:51 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySTw-0000000GRrr-0fjL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:04:50 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c197eaaab00so550546266b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 04:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1787569486; x=1788174286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuCDKY9mXTrdYYrt4yEzUU2rfGaRGeNzZjabp91Amlo=;
        b=EVRAQ/RKipQf9z3Qe1t59oWj6AEgm1dTFTqrSECb2ObxfvyAZBDRn6SbOCLOhmhjiJ
         +Qq8Xx7ldUXVegkN8sToE3jqsiJJnkf4Y4fqIC3DhdlpdSfdwczzRO8MTu2vYGN8ZRTh
         tBLWN+LxqXbUXNa3Kz9ffgLfj7voF8AztLwQLDoOdZfONIgCe6z0FDFYrVub8ElT6mhi
         Z5f7fsRlMj8JKZZJLkIV5CEbxN2qQ/w2iS8gDRRFQBtmNmp/zIGpk/sNTDgJqK5gSTpZ
         FzGif0Y6av9aQHHRo0lrw/bOsB+zLo5xLVz+yXkvP011DRfmNKBvmlt5y9t2LW9EuFDu
         Iqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787569486; x=1788174286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YuCDKY9mXTrdYYrt4yEzUU2rfGaRGeNzZjabp91Amlo=;
        b=PL08tt2/WaVGCtQx8ixoqIEYECN2MBWkYLFiGfI5sfP5G4yCg/Zs1Eohr8XkQQypd9
         YD1gffp1IsnWExmmwSEUWKGxd4hY3JSoebFxuD9GjBqMmuv55dRL5vQdKlmtR+GQoh+X
         iGfwyOOmyNDObdmfbaOVYR9+/5opsvIjKOQICkco36EhbuOGEnN3vYALj0r0uMFai/3l
         ZCRtRDGwGTjO3x50Qaz5/lLBmVa51/w/CZjXwvdG6h9ScGd6naahPje+ALniNWhlyobV
         fUsT4YQcMCq8EH2entxS0jgikO2cur5l6UREdG+yjJKrhBtJciVOiMaJSj+IGXrZ4eS4
         MHJw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1S2iV2IZMTXt56rpPVCPzJcRFHBnvmbEOPb/5UyyAVg+i3DcnZX06c9lXymW5MFbs7FIzVfdRRVIGUac56tu4@lists.infradead.org
X-Gm-Message-State: AFuF++nLABwEfUGyHaaYac3gPUT6MgNfmynLC2+4Kt/Rxkj3KN+GOUGG
	zWIByCgwExXcKUnswqQzBtyyYKq0jWoeyY8dY646mH5ZbTyHaK83aoRGqBG7JpDIMqw=
X-Gm-Gg: AR+sD10L5fVVQdMGWkq7Paml7amHGvqHGDGloE3+O3TplzbAY0oWS44WxnAq5OK6ckf
	cR1T7ibJ8HSljrnq/d02w0S0CiTC3Hih+lq9SNW+Tk38OPcx1R7bziI4bqo5CX7FVmyG+JsM7fn
	Sys7PvTy+Gxl6Ns8+1z/LQ1H71LJ561aWetqdFJ0WGiFchoNhu5iRkW/oJFEi2tlq//QngXq4Kk
	bjsa2Sr/v6CtCzzy5Wy3KEyE3Rhp3+Pu2hJI1PUF8pSA97l0h8vXIJ0LhUj9ve2Jt8YhZ2UbXS5
	OHXGUVW+b0n5h8kjv/kPl0kuVxvpTOQ9p6tTY1qmleOgUUjojLXmNmcd5gkHVy5nYakrTGkglOX
	f3pe/a+IiLwAPPwIlq/InwkPdC/KYXneds+xQF8db+zisjOeF/TAw5kF+9K6Q7yNqAAOp20TRHI
	tTH8bVd64GRB2+EeYz4u43hfS8MqHjotZtgr4AjU3t9RDUwdrNnzOuRhXUMMxN8Ce7sJpbSzJam
	JaY8pOXrqWlkLHcxKsTdPpRZYlfCWaxgVBvE0lAXu35C+/905/spFr4lbPRqL35tkvXYJUkPBLm
	ub8GVYidBke5xJQnE5At3z+o7nEP5Eagg+J/ww==
X-Received: by 2002:a17:907:7252:b0:c16:8adf:f183 with SMTP id a640c23a62f3a-c246a683ff5mr2769437566b.14.1787569486011;
        Mon, 24 Aug 2026 04:04:46 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-109-60-82-103.zg3.cable.xnet.hr. [109.60.82.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e7esm1331954166b.46.2026.08.24.04.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:04:45 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	aubin.constans@microchip.com,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/4] arm64: dts: microchip: lan969x: add SDMMC nodes
Date: Mon, 24 Aug 2026 12:56:50 +0200
Message-ID: <20260824110432.1074136-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824110432.1074136-1-robert.marko@sartura.hr>
References: <20260824110432.1074136-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_040448_442079_074B5335 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

Add nodes for both SDMMC controllers.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/microchip/lan9691.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index a8541c6a098d..2d943ea75768 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -414,6 +414,30 @@ qspi0: spi@e0804000 {
 			status = "disabled";
 		};
 
+		sdmmc0: mmc@e0830000 {
+			compatible = "microchip,lan9691-sdhci",
+				     "microchip,sam9x60-sdhci";
+			reg = <0xe0830000 0x00000300>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks GCK_ID_SDMMC0>, <&clks GCK_ID_SDMMC0>;
+			clock-names = "hclock", "multclk";
+			assigned-clocks = <&clks GCK_ID_SDMMC0>;
+			assigned-clock-rates = <100000000>;
+			status = "disabled";
+		};
+
+		sdmmc1: mmc@e0838000 {
+			compatible = "microchip,lan9691-sdhci",
+				     "microchip,sam9x60-sdhci";
+			reg = <0xe0838000 0x00000300>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks GCK_ID_SDMMC1>, <&clks GCK_ID_SDMMC1>;
+			clock-names = "hclock", "multclk";
+			assigned-clocks = <&clks GCK_ID_SDMMC1>;
+			assigned-clock-rates = <45000000>;
+			status = "disabled";
+		};
+
 		qspi2: spi@e0834000 {
 			compatible = "microchip,lan9691-qspi";
 			reg = <0xe0834000 0x00000100>,
-- 
2.55.0


