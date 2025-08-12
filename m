Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5BBCA0EDA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcUtzC99ftVpjJ1J3VgzsG5YR1VSr0yd8VomMVp9if8=; b=lcsTYQrKXCgjU2WJ74xnOgXbHc
	WKGmY7Gz9cD/NoB//gBMFE+Ou9rZgZ0C9Km2FSKApfe7TmpzwciwpQd2x+/v5aG4CgR22zogbSg06
	uInwhYUr1c7SmXtxltQwf1Om0WLDrlfgWw6T8xlJFheW7WKUI6YZdsff7e8FVMa/6ZkRoN0RowgSF
	2dAeb6ZWnsIbUKrZ+v2NfGUrZGHJ4XHD1JJMkJGkS/BxlkOUkOw60l+1cLTOlKiRnFnWkl+UM5D+q
	RisrjG9b93I8H9mBac1vsP08iDW+7YZxOzvLWt9cu3I9/xEFdqLXiQZycuYazTk5kV5HpDvhh0pvx
	KN90HcMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIc-0000000Amzy-3Uag;
	Tue, 12 Aug 2025 12:40:18 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull7V-0000000ALln-3CPT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:16:38 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6154d14d6f6so6111516a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754990196; x=1755594996; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcUtzC99ftVpjJ1J3VgzsG5YR1VSr0yd8VomMVp9if8=;
        b=WWiuF2QCHFWgx1gtXGygPvT7YefabrX2+qVearY2FgSdmewIlkpC0KvLXf9oCajG9P
         B44XROaq1CrEtbztIeDJNEDnnFWQwfbInyEA55GbDCd75UUYbwE4r3CahqJcc9VXuAoE
         ZdspIFLLYU02WseenH1KYfxfjj6z1TDOjbTK4kpRuMhKwwMl6VbyrTCPu5klpN4OuIPT
         k2WUVq9jPYPa6zNRvQTpjuhZvFaipQb53W8BY66lXBKNu1cZuqFdt6Xoc27eR+D2QbI0
         PfSaXC+gmCpl74jP3j5y9P8UtlINFGmopXHRqP68P2vBtWMK9xmnEEL/EPrG/bPm2yy0
         z3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990196; x=1755594996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcUtzC99ftVpjJ1J3VgzsG5YR1VSr0yd8VomMVp9if8=;
        b=WgQYr7qBP8NX4ySoISA0I4UmiE6SQH3Y1FEzm0Pk+x/3570nhgc+s/ASEqqtVpbNIx
         hm644/aN5vHSB5N006891KV4bsh8BK4sC2ucXkkFbHUmDJwWC4kOd5oVRl+GBxie+8OK
         KhQDRPXBp2nDZmC1/rGariC+eAJ+dMZOoW0KxGRFKSNiEooHJog/IJ34V0xctPNE1jUI
         LX2xqlv1aluScwUSXEn5MYl0wsJ0fWz0wuqO8XcmPXdlTwxr8pzHNY4quO8dZgyvBUXm
         Vu/pjYnFOtKvN2uA5GxBZpLU1i/rIIK0d34J/KCmOjm6jyyVBf9DUkdOOVqikSi96M/I
         niZQ==
X-Gm-Message-State: AOJu0YxXig7pXpCmNl4Y4Qt59GaHFy9G7ERKDqUz4AQxdWPbw256EuLG
	ssrTr6yi+stDo4A/Gf1EMTGGsKWADNUQOt0TC87GFQv0SXBxM89pln/V/hVtWWMzYG4=
X-Gm-Gg: ASbGnct17qnPFKOy75R8rZqBu0K0+m97ISRW2Fvt+VEdedL2eUxSxS7+C6mDnus06zt
	4M+vi0YNCL+wXG+nV6iKMv6Uh2NIuIKkN0bfDZuvbyAsKxntjX/FMWKDpSbmKFQupiaRYzVomDj
	887AqVbb/L0U7/Glh+SQDnpQK+m9fTT4Y3gqtH+mwaEiRry+fKA5MNb8Q4F91izuuSZQ9WwIkjI
	cm3Aj7Sfq8MkmvQU1v6rmf54WnbO10LjZzyVJN1aW7UBwd/mI4tGYSaRv9LaH7IGjoHewZhr/oa
	ju7HI8CB/1lCJoYCdhkMct2AkSf3Erfu5OCGG+bwkfB/Pc26PnCIOgU0CpTbda2HwTrBtQKiHbJ
	/tan6ly+sb8wtzjPckA==
X-Google-Smtp-Source: AGHT+IGjmqCb8DEPLnwSyiS2QWeezAQQ+KKWlCxBysNRgGnNSYGKAawEo108hymrlXQ0G//GA/rI2w==
X-Received: by 2002:a17:907:980a:b0:af7:37d1:93b6 with SMTP id a640c23a62f3a-afa1dff7b28mr245132966b.15.1754990196377;
        Tue, 12 Aug 2025 02:16:36 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8691:4b7a:7bbd:bac:c56e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af91a23fec4sm2174076666b.121.2025.08.12.02.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:16:35 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Tue, 12 Aug 2025 11:15:24 +0200
Subject: [PATCH v2 5/7] arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-topic-am62-dt-partialio-v6-15-v2-5-25352364a0ac@baylibre.com>
References: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
In-Reply-To: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2943; i=msp@baylibre.com;
 h=from:subject:message-id; bh=OPrdV/kq3oQ4NMu6+ZP/Aox16FucBvf0qyM2mttIasw=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhozZbHFznnLvnFN71nNa7RbZsizHJx1t1zdy/vpZ8oNZu
 1byWd3OjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZhIqwvDPz3xjKeuj+amsZ6Z
 8Wwms9bqXUxJXnxrhVQ4lIu2LE0K/sfI8OH83Eklmz5P9pN5tudYSuKFIF+Oym6dbf6NAfIzTzg
 e4AIA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_021637_819203_584323D2 
X-CRM114-Status: GOOD (  13.24  )
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

The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
powered during Partial-IO and IO+DDR and are capable of waking up the
system in these states. Specify the states in which these units can do a
wakeup on this board.

Note that the UARTs are not capable of wakeup in Partial-IO because of
of a UART mux on the board not being powered during Partial-IO. As
IO+DDR is not supported on am62, the UARTs are not added in this patch.

Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
Partial-IO. Add these as wakeup pinctrl entries for both devices.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 60 ++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index 4609f366006e4cdf0c162f72634ce90623f60a90..0314f857ea05acc4ffc62bccb5184e58d19a6103 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -268,3 +268,63 @@ &main_gpio1 {
 &gpmc0 {
 	ranges = <0 0 0x00 0x51000000 0x01000000>; /* CS0 space. Min partition = 16MB */
 };
+
+&mcu_mcan0 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+	status = "okay";
+};
+
+&mcu_mcan1 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
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
2.50.1


