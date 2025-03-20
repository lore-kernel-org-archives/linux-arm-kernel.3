Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192F3C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2i/cLqH70rFIGQEh0as4tKq9BI5pDp8ooCRLadLuPs=; b=AMMhzpQl7xbU+t0xknVNOLmZz0
	3jgpAaP9RUr71TIXP2ltlNGeu+eECy31Cn95R09AjfsAxGiPGpQ8195CIuP144P8Uad6F6MyUHM6/
	nbMuk87D4NqgwmKFBjrRV9LF/tQGNouSuHJGp9D8ay5R+dnmhiPYTzRwhTastQjRJ/aqA8AW0Bq97
	LCWOm7c2Qc+N70a4i9XzKr4xSR3SzXteF2BlwcJSM6CEn2CWp6wU5n9xpQBfm2PAnhUQ1DJymgdXm
	cezUi4zelZNFAyVbYgmxNMBaOdh7zHphRD2+XY7QLU2cbuRb7E3qjJDV7w5PPaTE4dI2nkNQO4sYQ
	LaWxoSzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFpR-0000000CDKG-24w0;
	Thu, 20 Mar 2025 13:20:57 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFWy-0000000CAiQ-2fEy;
	Thu, 20 Mar 2025 13:01:53 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-399744f74e9so458029f8f.1;
        Thu, 20 Mar 2025 06:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742475711; x=1743080511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2i/cLqH70rFIGQEh0as4tKq9BI5pDp8ooCRLadLuPs=;
        b=UNWPclpawWJ3w+F3KFoSRSOnOOJZSEMyl5eDTmcLUKZCil7X79wgDrv+BjL0WjPqa9
         ykU5y811GsUY/ATdBWK0vnN6qcYlEc1EtSFag/fstwoBe4IN9ArLcCxrQEl7ziNTwVaG
         LMpjmQ8Yc7CXh5FWhgvJqDj33JH3BNo/ZdNGO1G9JPZnoTGZQj9pDede6wKUqwmkcB+k
         fYdT5H+qxXUE8aL74T5sURbEszmQTSbF+MnbD4VCECLODxINCVeKP5+Grs/ciAx2F3oX
         lo/2Z1GSfwpPUH4WCrbRYEdro4Gj8YJtgetzl7Wxl4NkVQdLlWtomQhBWuAjC+pg2Eru
         kEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742475711; x=1743080511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2i/cLqH70rFIGQEh0as4tKq9BI5pDp8ooCRLadLuPs=;
        b=nfuI5WEU2ScUHuUBNCtGTcWkScxr4l87wBKFYUKpLtQUvpdOU2wU6B0A/YKReKDBqL
         FteE8uhpSBrr+26sVBXeAnLTAtTrcY8sQv5GRLnJ4NBQa9nffBOOmVDkdQ2XH0PJlnTg
         RXAOByA/3I+BbR0rmLq+xDZGyULlL3dzuTPY+Oe5Rh09LnHtYE6glPuGvSmsiy/WOhtn
         UCpoi16xPAUObw68HRLZn8K/h8OjZY4W1hGyf9TDCEMxviQNkAhvW4pv6YFpcjOervS+
         3hNbcAhKfufKimP4SldAXi3O0ZCgRh5gN0cg1mR1dEAEuq3U53UN1ou5dBPyNeMoed4L
         jrLA==
X-Forwarded-Encrypted: i=1; AJvYcCUxcwdjIRGIb9TiQeg6VET3MQqnbMD89r2yyjVNVa2nI3DZ9UhEVl5Yx9rPETx5xPaw3eal3pLsvwa4I69s5Wh2@lists.infradead.org, AJvYcCWhEzRNpDPBZDpRkD8zqzJKU4tH3Qh5y3NfEIrj57CkjTiJjSIp69KmLK3vV5iTQxXjYBDyW7to/ev7@lists.infradead.org, AJvYcCXG9ndxBqfSXie13z2XWIwiry4kJjSfvGJy8sLy+QsQJ3eb9ujGpuxECTaWcnjaCJubmRGHh/5TdTpb/21iPGA=@lists.infradead.org
X-Gm-Message-State: AOJu0YztAb9aMAl0Yx48Qg7oZQSNW+2iWY8Q25ZEw+IIEO76UXJ+cvK1
	iuH6NwRBJORR15lEJKgSs6K+h+L6FcEuggNUFHPaYuZZNXS1AVOC
X-Gm-Gg: ASbGnctTTgweoq+BmWAnQuhFrV+mwfpwu4HH7hKcFjfuRejz3b0yHQkA+/czbnwBw+P
	flokxZqNc632JmkbQnLXosfV8pKA7ETREWB8KxoZgjrxLAOPWy2Z42CJJZMf+Q5Pzyu4Pa/heqx
	/iUUwEJTqZlzYnmZsPwRaVwcVJe9wd5a7kHLzxF8UKy8O1BKX9j3cxKpLCW4ErlWGwk4J7aOJzG
	OLPdU8/gREygyQSODruZPQ6+gETGsvIwsls06UySiYFvoiSB7Tmf+WuxyCESa1NESnUcGI5QH2N
	aPAhWQa9ZRmopMZvslYOc5U2LgvtHoWn30iazjJPTrfJMkElGHBk1hdMsJLEn9c3ZHrxQQdJDBZ
	qlRsgtWqcVFiruA==
X-Google-Smtp-Source: AGHT+IGPoVf9Gxeq+Z6YkgZOF9dLEtuHhARuJ5TNPwOSxmTqplkNjLTuQh6kUIXQk8Ui4saz4dpBhQ==
X-Received: by 2002:a05:6000:1564:b0:391:4095:49b7 with SMTP id ffacd0b85a97d-399739c8f6dmr6626914f8f.25.1742475709979;
        Thu, 20 Mar 2025 06:01:49 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-397f2837e61sm18492328f8f.97.2025.03.20.06.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:01:49 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 11/11] arm64: dts: airoha: en7581: add USB nodes
Date: Thu, 20 Mar 2025 14:00:34 +0100
Message-ID: <20250320130054.4804-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320130054.4804-1-ansuelsmth@gmail.com>
References: <20250320130054.4804-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_060152_673008_D2855AB0 
X-CRM114-Status: GOOD (  11.32  )
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

Add USB nodes required for USB support of Airoha EN7581 with the correct
define of Serdes Port and Monitor Clock for USB 2.0 calibration.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 49 ++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 26b136940917..d1cec63bb77f 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -3,7 +3,10 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/en7523-clk.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/phy/airoha,an7581-usb-phy.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
+#include <dt-bindings/soc/airoha,scu-ssr.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -195,6 +198,52 @@ rng@1faa1000 {
 			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usb0: usb@1fab0000 {
+			compatible = "mediatek,mtk-xhci";
+			reg = <0x0 0x1fab0000 0x0 0x3e00>,
+				<0x0 0x1fab3e00 0x0 0x100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+
+			phys = <&usb0_phy PHY_TYPE_USB2>, <&usb0_phy PHY_TYPE_USB3>;
+
+			status = "disabled";
+		};
+
+		usb0_phy: phy@1fac0000 {
+			compatible = "airoha,an7581-usb-phy";
+			reg = <0x0 0x1fac0000 0x0 0x10000>;
+
+			airoha,scu = <&scuclk>;
+			airoha,usb2-monitor-clk-sel = <AIROHA_USB2_MONCLK_SEL1>;
+			airoha,serdes-port = <AIROHA_SCU_SERDES_USB1>;
+
+			#phy-cells = <1>;
+		};
+
+		usb1: usb@1fad0000 {
+			compatible = "mediatek,mtk-xhci";
+			reg = <0x0 0x1fad0000 0x0 0x3e00>,
+				<0x0 0x1fad3e00 0x0 0x100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+
+			phys = <&usb1_phy PHY_TYPE_USB2>, <&usb1_phy PHY_TYPE_USB3>;
+
+			status = "disabled";
+		};
+
+		usb1_phy: phy@1fae0000 {
+			compatible = "airoha,an7581-usb-phy";
+			reg = <0x0 0x1fae0000 0x0 0x10000>;
+
+			airoha,scu = <&scuclk>;
+			airoha,usb2-monitor-clk-sel = <AIROHA_USB2_MONCLK_SEL2>;
+			airoha,serdes-port = <AIROHA_SCU_SERDES_USB2>;
+
+			#phy-cells = <1>;
+		};
+
 		system-controller@1fbf0200 {
 			compatible = "airoha,en7581-gpio-sysctl", "syscon",
 				     "simple-mfd";
-- 
2.48.1


