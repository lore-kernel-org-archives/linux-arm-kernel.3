Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099C3C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 06:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8l1sqhvOS358KHBhSYMYV66VwE6jfqDj9d9WSZSjiVg=; b=mOQZK/GMywQxua5h7Oxy4V8fnD
	cpG8yAP/+39OfBaW7u4r7vVYD2rtUTLF8fv4FI/7R14plVa3NLcrU1cfkLTM7dZnEQpaUhtAynUqj
	fYBseVJkhtNrO/ICsaTvp+N7wOOuee1UbGMya4TvwruX4Q0PhfMw9bQF7jHO00dkrdBe2+6U/dsGo
	psyJdJrAOFTwc7DEOc6L0aG3b0AAvNB0lXqLCvsXkCAnWgtEa7Nb7Mf9/9eM8ffq5sCd2fB/lFoiq
	HjBKAoj3cf/doJHFANQn9/aVxCw6tEJdOlf6btAs9wyT+bG99sqFg6Px3TtaMdNRDNG+Ei/ekWnAD
	zw9fJg2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUbq-00000004AQV-4AjT;
	Tue, 01 Jul 2025 06:36:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWU96-000000046Ok-1x4P;
	Tue, 01 Jul 2025 06:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=8l1sqhvOS358KHBhSYMYV66VwE6jfqDj9d9WSZSjiVg=; b=dRFFJy/kBaT6eqAY68vumbLN3J
	NZFCmkH5FIvtI65gk/HPiOlRgWQ/iNxg6hxxk5S/la3Ov1w1DY5dr8m6oHOIRRJPciz6atmonCoLQ
	PWg/QhcT31+nD6CzN94vPAkv4C6B12chhBUJSZ5zgC6lSUVlwMyKBQBMS4XDj0qMr7BC5PiXe6T1m
	dsqMTTwZEz7RH8cYUIJX+x0kb3vrviNNypdufJ/2W1MzUIpsUcaki7of/euVhgJWjQ0LZ8TMYgxVy
	9KBS1qe2bNqvrsaST3BfVFId/lmgwAGO1lXAylJBQXriclBLkPD+M+Kuoq8759jbqFqrgGupY+pPF
	92ySaJ0A==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWU92-00000006wo9-0FrZ;
	Tue, 01 Jul 2025 06:07:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58073463BD;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D449C4AF15;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751350019;
	bh=AUPv/TDoKd6ieMqlLaY3QqCSEU6AU3dk77+aCznD0MM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Hdv65AWu04h6Y+USEVMjghPvOQN02pbP1+0CfOVD0eJ4F6lm2xh+1pyARpHMdi3Kc
	 BRmc8JrRIp7QNtdqsB5w0Rr/i81WVqrJas0Wcc32MlMeJfESAuoFSjnE545HiJkmQN
	 hTP9+iL78qgB/Pjgl6+gjl8SsKklixEXE6vSGcudhZP6m75OwR9vsJI4eKptuDiXg1
	 hU1tTUabAMOEaZx6Ir8bkbAQTO5Nbf0sF3CqtcnuvnQ3SZQVbds7eB73VE9C9XdL+y
	 uCXlitWi7eiDCweOUWbH50tq3DCTp8iOMlHDBFIC1oSmG7wRPTnXrrYbjo0BXwm3qc
	 wltqAa9uaj9eg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1631AC8302F;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Tue, 01 Jul 2025 09:07:05 +0300
Subject: [PATCH v3 11/11] ARM: dts: mediatek: add basic support for Lenovo
 A369i board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-mt6572-v3-11-8937cfa33f95@proton.me>
References: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
In-Reply-To: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751350015; l=2277;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=4u8PvwUsCoKzaBq7UBptniJ7BDz8n6fIUr+Q5q3mwbA=;
 b=Uzj5mcLQClajwlRJViaDK/g+mUwo+Ycev+dFwwINpM/yRdOPnJlTia8HWmEl+Cj5f5xt1nV4c
 OpIhwLTD21ZDdZUG46gR9BxG/ZM5Ene4w7zv/531j6oYrzLjCyuMgys
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_070704_608202_AAE56F1A 
X-CRM114-Status: GOOD (  14.78  )
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
Reply-To: wctrl@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Max Shevchenko <wctrl@proton.me>

This smartphone uses a MediaTek MT6572 system-on-chip with 512MB of RAM.
It can currently boot into initramfs with a working UART and
Simple Framebuffer using already initialized panel by the bootloader.

Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 arch/arm/boot/dts/mediatek/Makefile                |  1 +
 arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts | 56 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/Makefile b/arch/arm/boot/dts/mediatek/Makefile
index cb869a1aaec21a1d99f7f2a829b84672a3f52726..e48de3efeb3b9ab00108cc28afa8da525d0ec14a 100644
--- a/arch/arm/boot/dts/mediatek/Makefile
+++ b/arch/arm/boot/dts/mediatek/Makefile
@@ -2,6 +2,7 @@
 dtb-$(CONFIG_ARCH_MEDIATEK) += \
 	mt2701-evb.dtb \
 	mt6572-jty-d101.dtb \
+	mt6572-lenovo-a369i.dtb \
 	mt6580-evbp1.dtb \
 	mt6582-prestigio-pmt5008-3g.dtb \
 	mt6589-aquaris5.dtb \
diff --git a/arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts b/arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts
new file mode 100644
index 0000000000000000000000000000000000000000..523e93647fdcf564404b720abe35ec7322cffa1e
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Max Shevchenko <wctrl@proton.me>
+ */
+
+/dts-v1/;
+#include "mt6572.dtsi"
+
+/ {
+	model = "Lenovo A369i";
+	compatible = "lenovo,a369i", "mediatek,mt6572";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		stdout-path = "serial0:921600n8";
+
+		framebuffer: framebuffer@9fa00000 {
+			compatible = "simple-framebuffer";
+			memory-region = <&framebuffer_reserved>;
+			width = <480>;
+			height = <800>;
+			stride = <(480 * 2)>;
+			format = "r5g6b5";
+		};
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		connsys@80000000 {
+			reg = <0x80000000 0x100000>;
+			no-map;
+		};
+
+		framebuffer_reserved: framebuffer@9fa00000 {
+			reg = <0x9fa00000 0x600000>;
+			no-map;
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.50.0



