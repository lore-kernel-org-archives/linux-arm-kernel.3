Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA732C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 10:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MUnIOBToN35CP/nmH5EvlNTTBQouiRwsm7taaRBA0g=; b=qwo+GmGfrwRryehPPDuUYsGl//
	pljEry642KZ34gLIuDFUD7SGTdik15uJAmbc46IPURWubx4l2km66c3VGhZzhV1En8WDqCylkirTR
	sxz8AEntv49Y9CwUcFo1vV5NHLA8E/hi1hb80Z6JH4ZPqXv1aTaq1nF1LU7mZ4H2OvVVhLVpcwMKU
	Wrvv9HmfHbcqZ2NQQ/ysPrtVr3OpaKAKav3mmcYukSJEUZNwthZ8SJ4XCHyUah51CrUeyHRKgCtwa
	YRwLhF/35Z0YkQIEvgvB2zsroKrRrgYT7+YodPJZsb8RBn6rLvTDX5YanWzBXDljboBwcQIKhWNu6
	O/2Pa47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taY1M-00000009wiJ-27fs;
	Wed, 22 Jan 2025 10:31:40 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXv6-00000009vT0-0Qxr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 10:25:13 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38632b8ae71so5402432f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 02:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737541510; x=1738146310; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MUnIOBToN35CP/nmH5EvlNTTBQouiRwsm7taaRBA0g=;
        b=i6Am7gNxoTfoApNgyY0OIws6jGa4W9X6tRL2wEseLS8rzCLU95xBmMtWvffyPNF4UM
         O7yS9mCOTIGvK7Brwm1ckpHQ6oA8W4UgXr8EWH0r8h1xw6k1xPflD+A031E/b7vWgDM8
         4GCax8MGHwbNCVww9V0VrzOlFVrDZBamqXx21tPCDDDkURUAf3i+ZbzE2YO/buMF8pLG
         XEKgltfaXHJ1ABZMjn1ZWXYYM/J/R/DiXw/71m0jah1hM+zy16vV1Z6Ski92KVKYsAI9
         VyYFANuiewxo8RRFQue8D5WawQ3/lsvCBQrwExvxFMemddSnmrloyUtgQ4lQ85uRGKi9
         A8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737541510; x=1738146310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MUnIOBToN35CP/nmH5EvlNTTBQouiRwsm7taaRBA0g=;
        b=gYWEPByB5hRaEbQfpc/RyVBgluipLUOqx6TakPDxXRwEOX6WgnYEaBB620Fwu7ycV3
         20fX+tkno+gCr3dtY5+7mBHLvJTgdFcLrlbItiP3KsA8maLvbgIueUiuuhg6wz6UXv7o
         qoUdUUduw7yw1+wdkpA81+LFHShczBDmcDN1EmewjjvNLCR6Avo3PB/ojtEU0QnobZqH
         00bHRN6AL9ibWVixM2D/nV20jst6rjV6tvhNz926czlOb8Cg4Ce2wHIMX9a8lK4a98e+
         rq55iUNNXZcpQHd4P5TMkXDTpGHTfMSPmc1ezq6AyhNxst65guoAQyGICg9pn1tTK+0G
         QPzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGmuR0eh9Pxs3kQSHtJ3jBs0TfSHbGNWeWWvDakLwPh1PeqmXu7ROipaLjSC48CnbR6c9g26GRInxm+KMvxM9t@lists.infradead.org
X-Gm-Message-State: AOJu0YzVY0do9K5CmU8Nwl5vnnoNYhIM0AfnPMjv2kBjZ6ot0d8vtqjf
	p6v/2pVaSbRuIMXksu39bPSDw5d328Ml2dORrbWDgO1GSdqa1kTSNeChRGyyjoA=
X-Gm-Gg: ASbGncupQgXrolbl2j3IkOFzPqdLn+FpqheppU758gAoR2qgyvdkGysx6etQcr0n7KL
	P6X/ZCBQx8tQ+TO7oiKN0pRwIUJg5nTYjKMbkKXDBKK0Xy4EiYuPhQlU/lgH+VGbc29BuKZIFh1
	zKpzDdqPNnq2HyQ3gB3hQkTSpNBMONQerds7wnBJAI3kOZzd3LNvSN0oRTj6g17dZIztc6vemV6
	/hmmo9vfM6O3tssRNAMKkzAw73XbcszFA/wYJx5JJkww453pehlicjCIGO/CPJJTwQ=
X-Google-Smtp-Source: AGHT+IG3p2/ZURppDC5moYvB99KxTy2F4dncMfmjtuSZbzYjEC77+NCRQAzrjRc47td2E0GsjB938Q==
X-Received: by 2002:a5d:4845:0:b0:386:857:cc54 with SMTP id ffacd0b85a97d-38bf5679b17mr14855240f8f.9.1737541510416;
        Wed, 22 Jan 2025 02:25:10 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327574asm15949702f8f.68.2025.01.22.02.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:25:09 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Wed, 22 Jan 2025 11:24:35 +0100
Subject: [PATCH 4/5] arm64: dts: ti: k3-am62a-wakeup: Add ddr-pmctrl,
 canuart-wake
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-topic-am62-dt-syscon-v6-13-v1-4-515d56edc35e@baylibre.com>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
In-Reply-To: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1026; i=msp@baylibre.com;
 h=from:subject:message-id; bh=nL5NgBgFV3S3eyc64fOPJA1k4CxbhbE3hID0Fqq8rxQ=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNInHC+re39GOCzreUjXhQOpmZPP+zYtPJneuvIT10wVZ
 8+jG1miOkpZGMQ4GGTFFFnuflj4rk7u+oKIdY8cYeawMoEMYeDiFICJpLMz/LPbtGGq4rEPnuUX
 v6rnvu32TNjBM81vblTiFUt9JuO/d94w/HfybW7Mn2rC5ZShtevRBFPzB79Cl94p5/sRo/h21dV
 wayYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_022512_145382_7E6C6AFA 
X-CRM114-Status: UNSURE (   9.89  )
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

Within the wkup-conf register range there are ddr-pmctrl and
canuart-wake control registers. Add dedicated subnodes for these.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
index 0b1dd5390cd3f42b0ec56bab042388722b4c22a1..a9bcda212c99d2f7669100ca29459eb13172da3e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
@@ -36,6 +36,16 @@ usb1_phy_ctrl: syscon@4018 {
 			compatible = "ti,am62-usb-phy-ctrl", "syscon";
 			reg = <0x4018 0x4>;
 		};
+
+		ddr_pmctrl: syscon@80d0 {
+			compatible = "ti,am62-ddr-pmctrl", "syscon";
+			reg = <0x80d0 0x4>;
+		};
+
+		canuart_wake: syscon@18300 {
+			compatible = "ti,am62-canuart-wake", "syscon";
+			reg = <0x18300 0x44>;
+		};
 	};
 
 	wkup_uart0: serial@2b300000 {

-- 
2.47.1


