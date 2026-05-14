Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB54CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 03:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhXaZyjR5wnfmrnw0I8RLf6r41iRHOPfxchv5M6XoP8=; b=ysW1w3Qrho3vial8jSZTPWgDk5
	0WhIkQYROQews5fkuEsMGlSV1exOc37wGTE+l9v0QBxH+8LI+ocI7jEljBJbAcwtHj+tj6GNFFnhB
	mqI0EcM0ELAvFnNtf3R2vw9HaJtMCgLepjFSwnazll70w40D5lJDWUvtbf0hq+hej5vysNAvAr+vY
	gSbaoY4tnjm8jUXErz4oEa3MZweUDFxRHF2ftae3ruOeYNN9z1rJeee6ZjLjafTDUYHRmEYHw89/E
	n/IIOWwU2Y4sWMISN3rM3Z/+ErwL2ZxQRknoMN2JowCD0G+3wYTKF2E+nejBi6F1USDWxf3VUGOtM
	TTQd1tsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNMZ3-00000004Qmy-0Re8;
	Thu, 14 May 2026 03:16:45 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNMZ0-00000004Qlx-3FDl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 03:16:43 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3660b84347dso4976546a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 20:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778728602; x=1779333402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhXaZyjR5wnfmrnw0I8RLf6r41iRHOPfxchv5M6XoP8=;
        b=GMkAU5TJrmar9Cfa6dl6EpjcwHPZaGSC39MfZrhzKAE5FFHyTFJyJW9GwC8/2WiEdc
         0SfWAdYoGA/mnPs3Qc6inPrBS/+fZUw38zCuXusTx+39lKKUJrD6XXcZYcU/u6hJdkuh
         TBHgrIQ0b1dgPtEfbn78sT6rXjz3st/s4HYjZdIVSPjwFyN0CPzs68hclx5FcsDHq0TW
         cYiQpT7kJtIwOK9oKKCdekLc/XHNMgyLiidLQqAH+JvBeynpLwHntG/Awru4YjcdZDhD
         75Eao6vj/84KlD1qO3k5gdcxb7zPmWfvOhh3wmEfA2Ma+7qnU2YxSuOJfmMHDSdnvcu2
         ZoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778728602; x=1779333402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhXaZyjR5wnfmrnw0I8RLf6r41iRHOPfxchv5M6XoP8=;
        b=PRsiL8v55vGghOLiz3TkD85bq22LkUnNtmUg/Or4uo84FmOdb4xhiDeBJZHLN6tWHh
         R8m9+w4rJb405oBhzJK0EXsWTt1hy3YLE+PPEFG3G14SAZQ7aZp3jH5aowLshCLS01ON
         adN95tpdH7TtXmAh0oxIUFcsWGgHMZq4L22jM1JHE0TA/8rpDDXEgSWZb/h6z0bSS/Pg
         y+SPknwU4dvUSF/qVK9jcoqHAicu9Tyy3z45ZYO/omdW2u4pASMr7Hx3cukK086wfJ97
         8fy+azN123YqgS2obpA6t/Pyan2g0ZO39j0p9EADG5X9s3D1eGxhzOyl5wLP4lW8j8WB
         rcZA==
X-Forwarded-Encrypted: i=1; AFNElJ8Wu9wZ9cGPcTBWWRVbkmJe6mGW4G8w/gLxm9qZzkPQtMxRaqYTg9wn7pb0CDnXniF77NPC2dmou4T47xuR5VL5@lists.infradead.org
X-Gm-Message-State: AOJu0YxOQL85yN0Y1shqwdRAKNo7tcZTFL3runeEhuRBUjs/qVhh3eEd
	Y4rgOUxWN08AqjRRD0d2QfrGQduRsswIICDP/JtfULXgXS7Kpeo4Rcmu
X-Gm-Gg: Acq92OHmZdy/j3G5pUVdgHr+WdxB9zzJUOcmqJ4us34GaZh3U78pk14VG5lpFt36cJn
	bGVpHcpz52tPmjrVWkly2MoluwcFXmOii/HJEVlWn1DDe0UxYmJ2PIEtMAvbkR6PcCz2qh4vpGo
	FBpLwURacnsYGEsFp7UpotOmRl6drOA4yARkki8DQbdk7VGTlIJ05VN4cL0CHpdnUEF+mIZRcjb
	f+AsYrnwmvQNAMRnjiIHu4e+wO4oKpDWj55bgBg/GYq0jHBl1Ai/NwaGjDbyuL4+EqTuAwfe/v6
	Y19KYMyQpKFjt3t6dhKkaFnMKdTHXngpQgPgbTdAb/ERh6Try32e1ywEzT018ZCDHWMQvKC15ND
	1OSN4p+sO0iKH4l+24ENmvMrSd+l8f6Wr3J5QWTKD7daYR8Wrl46soMKjbPcy13Ev+Mf8b4+FiK
	ts62Cno5MN9S7JQJMiawejWoepXg3xrMs5pEj6WHuv
X-Received: by 2002:a17:90a:f946:b0:364:edd2:812 with SMTP id 98e67ed59e1d1-368f40a23dcmr6192258a91.25.1778728601594;
        Wed, 13 May 2026 20:16:41 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.138])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692a94205asm320047a91.7.2026.05.13.20.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 20:16:41 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v2 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Thu, 14 May 2026 08:46:22 +0530
Message-ID: <20260514031622.1416922-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
References: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_201642_818690_CEB9F097 
X-CRM114-Status: GOOD (  14.14  )
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

Add initial device tree support for the ASRock Rack B650D4U BMC.
The B650D4U is a server motherboard utilizing the ASPEED AST2600
SoC for management.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 71 +++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index c4f064e4b..124d4f8f8 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-asrock-romed8hm3.dtb \
 	aspeed-bmc-asrock-spc621d8hm3.dtb \
 	aspeed-bmc-asrock-x570d4u.dtb \
+	aspeed-bmc-asrock-b650d4u.dtb \
 	aspeed-bmc-asus-x4tf.dtb \
 	aspeed-bmc-bytedance-g220a.dtb \
 	aspeed-bmc-delta-ahe50dc.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
new file mode 100644
index 000000000..130b7f3e0
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	model = "ASRock Rack B650D4U BMC";
+	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial4:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+};
+
+/* BMC Console UART */
+&uart5 {
+	status = "okay";
+};
+
+/* SPI Flash Management */
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+	};
+};
+
+/* Dedicated Management LAN */
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mac0 {
+	status = "okay";
+	phy-mode = "rgmii-rxid";
+	phy-handle = <&ethphy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
+};
+
+/* I2C Bus for FRU/EEPROM Storage */
+&i2c7 {
+	status = "okay";
+	eeprom@57 {
+		compatible = "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* System Watchdog */
+&wdt1 {
+	status = "okay";
+	aspeed,reset-type = "soc";
+};
-- 
2.47.3


