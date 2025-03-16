Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167FEC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 19:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pb1dxZGebo6nHqsuNHV+lx93/PLHdbwZTSKy7EcNex0=; b=Y2jyLSjmp2MSBjiNqEiCqHx0Go
	iVT/IcXp5c2OpkL2wFOTN8JffqyqJ6agIkEhP4lb0ng0FVxlS9MxG0jBuQ+TBj/GQ8A07nW/oueMY
	C3H5WITgbj0arI2L3li6oEQMIplyM3lCqRmw7whW3Akg89T7M8ZhOCVpuNYlv46fVlli3E19mZAhM
	E/OE9A9oQjIGl4e/JOqmyaDowzyh/D2FlXKzvJEdv+BF56ZPwY7qEg6Sf7bSap2XI2sHDXF7sTL2D
	KNBOsiG5g4+bbhq5Nr+Hw6e/uvAqzXt5wUa4ZnpofgE2VfQ1F3DJILYSRAYNBOc6EoGQHLjxHofp8
	rS+c5osw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tttIX-00000000Vr4-0rrO;
	Sun, 16 Mar 2025 19:05:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tttAH-00000000UNr-1uxI;
	Sun, 16 Mar 2025 18:56:50 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso14128835e9.0;
        Sun, 16 Mar 2025 11:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742151408; x=1742756208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pb1dxZGebo6nHqsuNHV+lx93/PLHdbwZTSKy7EcNex0=;
        b=NPBe7cW8KKAMMsJ70mMLELnVBS0LZdUrmRrVVyNEegFsUhI2ZQ6SVnDYlb7XT83+fp
         mjSP5doBTuspqsl8vONojAWe9VSlJ+jLNW2gf9od1Kz9nt68afQGlDshJDfU8TOk2Dqa
         Fan5YxuaJhNtuVRgwj8XiVHJiV4hMotpJ/7ZjJJf/TG4z0q0KTFb/GdVmnosj/XJu7z0
         JtuZtWwypivCl7aTs/r5HR7XmzVMFk6BpxG0opjoLqO89vVZkByZVGd4o4EbLZgjL0OG
         BS1HuoxD4bPARNiaHD+otZ3OapdAj+99Yl0We2TyuuBwK5K5NGhKYClba+M81SbWqqlc
         qQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742151408; x=1742756208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pb1dxZGebo6nHqsuNHV+lx93/PLHdbwZTSKy7EcNex0=;
        b=j2XYugEKlYq+5NoXXgsI+3+oP/lvVaXCZEoGZMU2+UutSpOnaR/udE3TsSivtV8BKi
         WUkGSw/D7XfE88GxF7tQl904dmBbdRInVT6BoQGWTSJ8LV635Nxr+3tMs3DaXZRfMwKo
         QCtTBvM1FU2Uo8OlOwOUr7CoLURxNRcM1gW5E4Za4kXpY9YhcxVwJvnN29FKp0h93MIX
         cnrMmg1efk88r0eR/m2mOcqY17HW8dDY7rDQbGbDLUu+xGNkPNMknCNNMtLm9/EPxrYq
         1I3rXL3yNI6h43C7pE0FVfZwzU3VVbvH3u/0j3uKRpl9peuDUGIjYZLcFThiBu5iv0Pn
         ljNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7ktgbAn9LnoXbQuT56JVdAUwjcYAd2m30agRDvVY4B2VcVyaJAhkaze2syeehQfaPdmh+i4nLXPmaPLY=@lists.infradead.org, AJvYcCVj7M4rar7DbmdXerOXOroCZkhbhWvpJgvlqC6Sz3T8KH8Yb8TEpxN6wyfChCG3XOf8sIHUzS8jbnOBj0JTmEGp@lists.infradead.org
X-Gm-Message-State: AOJu0YzzC2Au7cORRoWYb+4URipvvo1duSXYuSoX1SLZLo4ry43MT5f/
	2ailT4IwP+OkIhl2+kJKNC2dbnLlNs5af6KL1nC/yGZyWoS/7rrp
X-Gm-Gg: ASbGnct2TEFI7cqjsgB7NHO1HC1rckfyKkufTM0KTA2bCENok4mNnkFaI9sc03rKdKd
	YgACOfKlWhonSGdetSz+9yyKFGr83uxsNtj9e7rQFJBnrKf7mmrVvz9B6FmmsK0xkeIYnQgfnzs
	NFiLtP6zl4xQqx7wAg57vZtL2iH5yhaSPxBDz5nA2MPWdLnlab5oxo+cCYLgbhIyU3pVx96dKXU
	wSKG3mVlvoTiYJWMR/g/3uCLf21Kmnoh1xO1EKnw0nOx//oaTCD6Eoafcvzt0T5pQMNLWb0AzRL
	I8EPd0DLsHuGEH8GLD8N4/NF8YkKxV3AceXG8K4AgiUGpyxcnEhAVt/39Q==
X-Google-Smtp-Source: AGHT+IHFZy+0lw/Dp6DjLzQfA/ftWygxBDcebBKg38wTFmBJaPs8U389GwX3qDbhTwDISEehh/tR+A==
X-Received: by 2002:a5d:5f94:0:b0:391:4914:3c6a with SMTP id ffacd0b85a97d-3971e1b49ccmr12926932f8f.29.1742151407582;
        Sun, 16 Mar 2025 11:56:47 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb6292sm84692335e9.1.2025.03.16.11.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:56:47 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 4/7] arm64: dts: sophgo: Add Duo Module 01
Date: Sun, 16 Mar 2025 19:56:34 +0100
Message-ID: <20250316185640.3750873-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_115649_494980_A8C9CB4E 
X-CRM114-Status: GOOD (  12.56  )
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

The Duo Module 01 is a compact module with integrated SG2000,
WI-FI6/BTDM5.4, and eMMC.
Add only support for UART and SDHCI.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v5:
v4:
v3:
v2:
- sorted all nodes according to DT coding style;
- added "compatible" property;
- renamed the new .dtsi not to use underscores;
- added status = "okay" instead of deleting it;

 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
new file mode 100644
index 000000000000..bb52cdad990a
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01";
+	compatible = "milkv,duo-module-01", "sophgo,sg2000";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&pinctrl {
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <16100>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+/* Wi-Fi */
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+};
-- 
2.48.1


