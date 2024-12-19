Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4D7E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpSkCESXzD33ldEw8LvJ7rj1ygUxBpHnL7ohb5Ul8P4=; b=rOTprgtZwMSJBoBmaid1vP49WW
	8H777uWeu4N6RYe+JsLQ7iYcQvUPA6L1DOAvxRzvzKimrTPBVCNRawaZXeJz8hKCgnCZRjeSk34PD
	rx+3HsaXQDp+UxCs4uJ80wRGfagmg5sNsmU60NWML8nGI2wLFl20MJOU6tR91qTNC9j6H8rqxUgwU
	nEJxmVDdIF1rKOkircAVrt0n5Vn1Iu6GAH3goG2VXnvbHiguF2Ma8T6+9oCaIKNLRmF0kE66xwmq8
	8Uhfmtq0564tI73yH3S7lwy2o8SdkPdGOLCzaEvr+Nnp49qaqZ+iuZvBPo/O+h2btWQ66A7t/S2aJ
	Ja3TRSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMvk-0000000301J-3Boo;
	Thu, 19 Dec 2024 20:15:32 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMkQ-00000002xbJ-2Bxi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 20:03:51 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so1706383a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 12:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734638629; x=1735243429; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpSkCESXzD33ldEw8LvJ7rj1ygUxBpHnL7ohb5Ul8P4=;
        b=ZrvnabzVTBVsR73QP6udv8nFWwIAK2o61G3ghVrFgmLPHO8J16KOnkYupsQjiMo+Vm
         dVpQeHEdt1hsXOuSQ4nnEO5kdKVD3Bhcit7ywbHl7yCBhDUUZGtDhb6TJK/qWmyjiB7r
         TbfKBT5MN7YfnZKtkGqbRfrBxtT4tl3uK2V/Mj++O9Xh5E1qO3P/0KMZLHQ7HCql3zxb
         NocTnWNSKiQqMKIMac+VUeUg++zcorucLthvjv85GF1uDtSiFUfAiOG3evQZCYwRjMvZ
         C8qFcvaI3a6tEkkdFjacS+hkthO8b8CQ87VQnOusdhUF1mawT7+loeSmkct3Luv6Oelr
         jXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734638629; x=1735243429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpSkCESXzD33ldEw8LvJ7rj1ygUxBpHnL7ohb5Ul8P4=;
        b=V6W4o/OfwFhFazttq17rjVp6+83YgEK6Dk++y1pwhOWbDpd2Gz1UWI9jryGXtzAk2M
         bvvH/ma4JfjRxHg+c6ihdICsLTRWP4K+xDqQq0CKPgGEr+P26Yxtsm7DWCRnj9C8p08F
         NZok6+niFGNwvggiqiBOfb0V6mINJFoNlwMvsSXL4p8xcNfciv6FcNGzJHBIwpyMKpKN
         ijGWQJhaCsPwOLtXlLm03m5MnVRk2kjhovylyctQF6vt3x2xU0ksRq5JaOY7l3iEPkAD
         CUo8XwDu40ULECZMfRR4YxtELjHEvzUav5IIFwLRYJh48uy9aHlBjjDBydL1Wpp5s7DI
         xCQQ==
X-Gm-Message-State: AOJu0Yxb1vyxSxmMm7aDsL4tVA/wYeAeXESMTnUKek86JpBublfSLXtl
	2XKXnqapISaXZG7Z7iS1otaR2aW9YiIAdhIyYA80Ts7vVJ9VPzGJBhqA647xvg0=
X-Gm-Gg: ASbGncvVgYp9nXedoxQMtOs8LEYohYVZqCHBlpHbVDGYWS2poUW1V+Dm2QqFVxha/eO
	HzmZy5mly69+YFdPuVL7eGGwYbm2ZPK7nT8QJc/PyBF9figC8Bm5pCmUPCFP9oMklcnttueqapm
	bIIUqUsoZB08whJ1pBCDJOgO6TEuCcSBCFvlNNKL/gJOwQDxv8nEKG70flnG0ItCxtez+QDxQJ5
	E+uQTcKCUG4JYHhBV5APu8DPomW+eij4cynWzQ3ADmOrRvqKQ==
X-Google-Smtp-Source: AGHT+IF82S/mlq+e2He9tjy3cysnJj4+yC4VHjyyy2VTYMe7y13y6XuWTxuoxho0NH4K7vaCcomgtA==
X-Received: by 2002:a17:907:9621:b0:aab:f8e8:53b9 with SMTP id a640c23a62f3a-aac345f427dmr6210066b.58.1734638628989;
        Thu, 19 Dec 2024 12:03:48 -0800 (PST)
Received: from localhost ([2001:4090:a244:82f5:6854:cb:184:5d19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f011f87sm98415366b.142.2024.12.19.12.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 12:03:48 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 19 Dec 2024 21:02:15 +0100
Subject: [PATCH v4 4/4] arm64: dts: ti: am62-lp-sk: Add wakeup mcu_mcan0/1
 pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-topic-am62-partialio-v6-12-b4-v4-4-1cb8eabd407e@baylibre.com>
References: <20241219-topic-am62-partialio-v6-12-b4-v4-0-1cb8eabd407e@baylibre.com>
In-Reply-To: <20241219-topic-am62-partialio-v6-12-b4-v4-0-1cb8eabd407e@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2255; i=msp@baylibre.com;
 h=from:subject:message-id; bh=IOefNd31nyYbDmidXJO9wxo5hzXqvpD8mI8ntPvadk0=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJTaiTq6r7J5Zyv2RT7eklD9UodC2fLU5s+uYeHt1SnP
 9PUn87cUcrCIMbBICumyHL3w8J3dXLXF0Sse+QIM4eVCWQIAxenAEykn4GRYedvBcGnond2OHxo
 eJH+Oyfg9YPrq2X+MP90NW7zP1Mw6zzD/yILA+GjCyQ+1Rc+V3g8y+/aMydGsXqHw3u1I+7xTFn
 yngkA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_120350_565324_BB8C79C3 
X-CRM114-Status: GOOD (  10.86  )
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

Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
Partial-IO. Add these as wakeup pinctrl entries for both devices.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index 8e9fc00a6b3c7459a360f9e1d6bbb60e68c460ab..22695715239644b1bfe209ba4f1c42fae4c59f70 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -232,3 +232,55 @@ &tlv320aic3106 {
 &gpmc0 {
 	ranges = <0 0 0x00 0x51000000 0x01000000>; /* CS0 space. Min partition = 16MB */
 };
+
+&mcu_mcan0 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
+	status = "okay";
+};
+
+&mcu_mcan1 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;
+	status = "okay";
+};
+
+&mcu_pmx0 {
+	mcu_mcan0_tx_pins_default: mcu-mcan0-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x034, PIN_OUTPUT, 0) /* (D6) MCU_MCAN0_TX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_default: mcu-mcan0-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x038, PIN_INPUT, 0) /* (B3) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_wakeup: mcu-mcan0-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x038, PIN_INPUT | WKUP_EN, 0) /* (B3) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan1_tx_pins_default: mcu-mcan1-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x03c, PIN_OUTPUT, 0) /* (E5) MCU_MCAN1_TX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_default: mcu-mcan1-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x040, PIN_INPUT, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_wakeup: mcu-mcan1-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x040, PIN_INPUT | WKUP_EN, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
+};

-- 
2.45.2


