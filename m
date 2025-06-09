Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A94C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 00:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jo1dYTSb5N84GQeVh5+0QHCVJJnsbzuqHcvvt9y6zKY=; b=aOxd0UzizkHQZ43yDoVswKjGOP
	cgyXsolA3tGNaRdQwFanokM6vJCcRJl4voIf1uG2uLLjalfoop1xV1tGawdHMUPuADRYMh+eg64qJ
	eGGBr5II8bh8xFD1IiMMEwb/tAv99maz5MGKRy8p6lJdkpLN/naWGNLbXgLA2CPYyf64TAECzdT1M
	H2mx7nrbUsGeXOj2fgeFy3W5IIbhF5nd58ivUgTtZJ/tuKd1fkfv0IpMjLu49ePJ4HTQDAs0R2M9+
	82TNbEntpRcOHt8dZUUAPqMFNdQz6KKE8Q9dvsjbce+BF5sGa2bhPKHk25suXnCXRA4txIpcAaUAF
	mbWKAAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOnFP-00000005WiA-0jsu;
	Tue, 10 Jun 2025 00:53:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOm7l-00000005SEY-0L6q;
	Mon, 09 Jun 2025 23:41:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-451d7b50815so41848975e9.2;
        Mon, 09 Jun 2025 16:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512511; x=1750117311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo1dYTSb5N84GQeVh5+0QHCVJJnsbzuqHcvvt9y6zKY=;
        b=dByqyGx82iM8hDgXseYCHjuP3JN4ZcP1lNxgqQTZNz2Cqq6xqsIPmkcDExeVLHDFkU
         2eNyhNLqbmJgx+kCUcEBOFypWEFJBXXPMt0L8wvnfk0VZ1ukzpVuYoiF5cFtJ6YKBgXF
         /Hs3ehL0TOcnh/MUKZS1sVi7YkDCWZY4bU2TfxXegzk/q1WHPACtUVj5rf0TGSMLddwi
         00NiVMTNge1yEabvPiyee7KJRsip7FTDOwGBk+VDtquZ8Gbv+XvzqWI4kbhzSRSuIsyG
         rZHjKAS6GyK8VTo5RkRownBhVaUhxRYL+y+Ie0vbAyzjSEKUpkIdq5lbWFcvbDwdBJ3U
         8onA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512511; x=1750117311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jo1dYTSb5N84GQeVh5+0QHCVJJnsbzuqHcvvt9y6zKY=;
        b=JE2y+cHlRq4SBbPNk7WXBPr3km2cHFFZOP0xTRZjFZ+c9af8zp/ddUFzxs2BuGSoLs
         U0m4t8Ov3P+M5e8n4Lb8Q0BPjual9kanNI+BGaI3xayFmaV9O/eokVg3XYDm3m4FFPzh
         LfupkAi/iAepNqmXY1hIdxyhgR6Gvq2y9aLicQflHt7zB0M1i6g9WFpsg63Xw+SYanas
         VpnD2HC5EX3gqnZWcysE/CDre2TIqcTDqrbylDxkwxz8gKXX+NW7RQflWpI6vGmdOA6/
         pZ2yQ7XTdzeWGjlfY5TpEzf67BeJ1HwjEkVQXWyG5/aLljZ47W3HPPhMN7vg4xfe2YBO
         +Xug==
X-Forwarded-Encrypted: i=1; AJvYcCU67epLmR4pBWQwfpD7P+TF6i1vXjbzeqXCkizKsRSx9G5D2MrcqcwMiChRNm4jYObawGim+aLzBSDiCLamsGlk@lists.infradead.org, AJvYcCVGu7bldlF0uJXrKMqepj+Ip+Tn0PJCeAzoMtcuBNlbJcy0lWDIXyjgoxw8bxsTkL060VUWYpf5471NtMs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxg7XyMipAbjdUYj+M2YHxRGhondwDbiuF206/udWcCTiFiZ23
	orejQE/ByIapMzp4JIPVxPB32R+0NNssPl5Rm7BEwjaJuvH3w2//Ny4X
X-Gm-Gg: ASbGncspTmu2YPcQf6tV9+6NiFlXJzohGNj3xD1qOyD+/6lZ5oU3GH/iJHVLVXaMpnQ
	UImppWdgu0RScF8dWB1l8U1t9vBKM/zXlf6Vvq60pmgvW2D8pC7tZ85zK/GL7la4jXMFkw/hsgz
	h3k5bh3+v7uEYugn9WXf+whYyvDyPBrqb20bF/DevS7D1bHpkOfvZRhMEcazwkfHBQsO0F58l/G
	Vpvf+ynF6GtwuDLrkPM9c8759LBDiT+WlD7RkFA5sDCkyDjfsVwyovhiKAdzEvWL9mBeHlBK2O9
	PMzarwV7zsSj1DQRaJ9vyilqkOPtu+38FXV2LPeHm2vHLlmCJHBc91keiWTq6EIt30kjv879HUQ
	=
X-Google-Smtp-Source: AGHT+IFApIvy4cDz1KO3QF2Y2DufyzGd0D/WiNt6nw0laf5Xpx85PGR9pawpRsdmsQ43gv8vaIkl8g==
X-Received: by 2002:a05:600c:6205:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-4520140c06dmr126096785e9.21.1749512511504;
        Mon, 09 Jun 2025 16:41:51 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:51 -0700 (PDT)
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
Subject: [PATCH v6 3/6] arm64: dts: sophgo: Add Duo Module 01
Date: Tue, 10 Jun 2025 01:41:14 +0200
Message-ID: <20250609234125.722923-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_164153_123668_E9242327 
X-CRM114-Status: GOOD (  12.21  )
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
2.49.0


