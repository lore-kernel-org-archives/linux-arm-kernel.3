Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6DEE77191
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 18:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKu1TS5Psj7hTyzCNbm0iN4cOOpfVFcu5dCXNycI6ow=; b=TvKDgSwkyLPOBxlk8yigDO9GgQ
	v9PG1HGVG3wO5yBf6Cyp4k/r7dbO7zfkxfennLSh7XA2AJAw4dBU1VMlq1CIcIQegcLVq75LZoZGE
	5+EdEHo6FOYrhCTU3b2HuGSbfj//2L6Qq3m9iRlnjTPFeINpgpyaGX++GMifaQnwP/r7r9S5S67Wx
	dTIHYGfsx1jSKinvEAvF7bpp+rRzH0pfsEhbSZI+LEciTNiLOCtofH++tKgEMJ82H9s6NZvPBVhRn
	ETzCj/e1LhJJhd7fdWsMfiYgVNvbBkVg1Z6a7DVLE/lYOEUJoI4d8wiki9D70rkXfDEh45YArvI1O
	6tB6spmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyNQ-00000003lvz-1nyu;
	Sun, 29 Dec 2024 18:51:00 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyHo-00000003lCy-3U60;
	Sun, 29 Dec 2024 18:45:13 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-71e15d9629bso2193579a34.1;
        Sun, 29 Dec 2024 10:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735497912; x=1736102712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKu1TS5Psj7hTyzCNbm0iN4cOOpfVFcu5dCXNycI6ow=;
        b=cWcROaASCHvxoTkgBDB3wNbC7xNgEf9X/3DmcV9e9cXWi1zaYr/X7Hf38KSKq3PAha
         7+a2OVEKXGq3Ie7V0VzG+J4G+8a+JChR6w3tKZ1DVOT5z7FoNO/Fe2IzE4V25fjSJEiO
         RfLzaT7iQk8dFbZUrCrmf8XUHhm/BzaBMwV4wkBnrJ7zpHLHCiaCJXjYqRvG9wjVvlBy
         AHP/3KdsxUg5Uvycl56eHlgiuGPH4JWfGFUNK1dJpMYPOr3bsriBef0KqmJmcwhZcQ6m
         d1dYSCIcdg7x0TlDuUKVFLvv4qDylTNLGGfEEJUCN5FDtCLg2B9NXrGh1qvi3cfy7esz
         Vxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735497912; x=1736102712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKu1TS5Psj7hTyzCNbm0iN4cOOpfVFcu5dCXNycI6ow=;
        b=W0bbZQ4MKPQ88515RpMlMm0HQR0tSJqolMA4L2HdUcPhJfgcdOMRR4Pt/bMPhd8veJ
         Bj792nTLy+d8tZVUUWnLx0aa6kCvpVINZ85+vx0YIpPFrKoOacea2hvOxLTkUfJ2ETTh
         Nz/0nfsIltvDibNxv1EGmdZNLPOn9hbJceKa4sfCxVJ/XdeXhD1p4YTGVgSjaXak/iQB
         2aVNXHplpqn+G7demoKUQiOSzJImebHZKYri+5+HzFwMgqcKLbc2EzEri2Pg1Nztunxi
         /Gq3vPgaz2lG2je3f0XkMfXYeiy3s0HsEm6ZMlDmNREVOFqYOI02JgNDAoVbviaxQ0w8
         dMGA==
X-Forwarded-Encrypted: i=1; AJvYcCUje92UaN5zc8c260FNxs/CVzC6P59yIaT9flk44SvacRJ877sv5wSJnVKL+nBe+gsIYtRjzyAjT3umEMYCgeo=@lists.infradead.org, AJvYcCV6nLyCqLpghp/Np/WJ7Eu4/wjTOpBhJx4V89MFi+qZMej0sRNhJPhG86KKlnhWarjzGTiwS4g6q2gPKqjvAUTH@lists.infradead.org
X-Gm-Message-State: AOJu0YwxXhYnDWYQ5e78EFnrwaqzFD4r3bTAkyq2NkLiI4eL22ZtPZuH
	ZL6KhjnaAMkD0gWGevm9FMhTRY7eiDCQWCRucTP9ZUaRoB9mn7iU88qYCknk
X-Gm-Gg: ASbGncsjPztz+28gKf4xarE/nUlBIUUsuFCoEY264/FOK9i/UJRN0eVHt1ahAbo8uf9
	UfmNOrs6kIB4ZJ0sNcEfjsQ7QBvez/7EyVnOC1SrPk1TgP9lpnKwo15CqinIqSqEhK0pSvJEbtM
	rq8+89p83kFWEu34hLzEZZdErmNcmhmu7rUK6rhmNjsBLDEBifX2B2k2VJG6l2ITuYlmoUUHGSr
	E8Kl/FwBd6FINb0hy3etTyKW73xd2W65jRNPZ3MTJcx3TXc4/3Qh4nP8xBGG2yF
X-Google-Smtp-Source: AGHT+IETOyubIpNaewSb5YWblmDG49HSLncL7ygLwmf7mXu2oV9Tarb4CVAUQOoSuZ0xPYYC/d9Emw==
X-Received: by 2002:a05:6830:718c:b0:71e:223c:1789 with SMTP id 46e09a7af769-720ff894f99mr22567508a34.16.1735497912149;
        Sun, 29 Dec 2024 10:45:12 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:e765:a49c:5c4:1103])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc97d6fafsm5515645a34.31.2024.12.29.10.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 10:45:11 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [RFC 5/7] arm64: dts: rockchip: Add Orange Pi 5 Ultra board
Date: Sun, 29 Dec 2024 12:41:33 -0600
Message-ID: <20241229184256.1870-10-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229184256.1870-2-honyuenkwun@gmail.com>
References: <20241229184256.1870-2-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_104512_887979_4781D7E6 
X-CRM114-Status: GOOD (  12.85  )
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

The RK3588 Single Board Computer includes
- eMMC
- microSD
- UART
- 2 PWM LEDs
- RTC
- RTL8125 network controller on PCIe 2.0x1.
- M.2 M-key connector routed to PCIe 3.0x4
- PWM controlled heat sink fan.
- 2 USB2 ports
- lower USB3 port
- upper USB3 port with OTG capability
- Mali GPU
- SPI NOR flash
- Mask Rom button
- Analog audio using es8388 codec via the headset jack and onboard mic
- HDMI1
- HDMI IN

the vcc5v0_usb30 regulator shares the same enable gpio pin as the
vcc5v0_usb20 regulator.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3588-orangepi-5-ultra.dts  | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 83ad11650f0b..7c7560b8fda3 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -144,6 +144,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-lts.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-ok3588-c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-max.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-plus.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-ultra.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-quartzpro64.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5-itx.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
new file mode 100644
index 000000000000..41d8d297ce4b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rk3588-orangepi-5-compact.dtsi"
+
+/ {
+	model = "Xunlong Orange Pi 5 Ultra";
+	compatible = "xunlong,orangepi-5-ultra", "rockchip,rk3588";
+};
+
+&pinctrl {
+
+	usb {
+		usb_otg_pwren: usb-otg-pwren {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
-- 
2.47.1


