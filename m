Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C88C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQIZ1/JS/EZe8uaQG5MXz9aibtSuptWifTs0OB1seYI=; b=lg/AYM6YqN1bJKs+SSZBXSkXSS
	Cxdb4Q9MtITekvlqKbSCn7kYAxE3xFBo/EkAXtzd9+AAkr7VV3nnGB+AtbnrUh5kfy+530u9QiezF
	+G4CJnoisa/dDBPofhv7EHSkrOFPijk0c++i2FcAiGJLveaCpgS4F7qsaNvKuI794oG+NtWN0wvje
	HkJ8EADbFy6pyoOIKr/QM1kgjc3WMGToLTQ7NirgkD0sDOVNB+l8pCo8RrQbASyRhADjnn1FNZT5A
	IICnt5nuGf0eVwag7hHnCm6aUrpQJS4lten6pUz/xtRPWpWE0w3bAMagjuMvItlm68RGNiPk3dQJ7
	Qxy8B4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieuG-0000000CPDR-417D;
	Thu, 13 Feb 2025 19:29:52 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidqu-0000000CDCg-2s3x;
	Thu, 13 Feb 2025 18:22:21 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5de74599749so1814694a12.1;
        Thu, 13 Feb 2025 10:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739470939; x=1740075739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQIZ1/JS/EZe8uaQG5MXz9aibtSuptWifTs0OB1seYI=;
        b=eTl9ZCBh1XblGzN4F7cqCFzEIZXYDUapir7jLDjMHH7MHYLOk1HHponiFjSZei/V3x
         u4uoLo+JVr7WYDlvkrQpNf3/Aj9EejGE2aNVGPJKJCw8k5Nf5FqBelpoILqa0cRrGjgj
         pGqSW5aTKjGtf3uQeMnb2rhgNtW0irW+qWzVHUBIkW8aBFyTwKSuoWZbIH8wVIWEZyxR
         n6gu+F7NI/YVxmWQXBUZ7BO8GYAGy2YiMqU4NjoQB7umY7AFMpQNK0CGYc+lA5xxNi5c
         rJq5Mr/zYkV0DMHTgrD9Ibbv5xKxYyeARLP38sqTiP1XOPWIH2fm0zz8yOd/vbLqc2sP
         OkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739470939; x=1740075739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQIZ1/JS/EZe8uaQG5MXz9aibtSuptWifTs0OB1seYI=;
        b=JakWpgth57tWh+fxQKjNxOs7B1TsktfXfqyEkl7GTWR0JpJbiuQEFJxyMQ3NnfnnVU
         chOSMtqDvbcUeATsHEjWjRL3N6ytfxMm87dth1pR3RuJIO8oMjQhOMUa0/oCKRe3CpdX
         qktkMWcR/KbZdXZdJh2UClOb6LYzyHSZe0df/fZBEMzKSGT6U2VgbuFtUP+I93s+0ARQ
         tv05a+WM1VdD7yIHe/ZcEU5Dq8+i24neGHfcvLUYdVYMAHeTBuFeQY8uZpJm3yJkOKdd
         OujYVf0gz18/ulFY3cPCHfOCAGC6+Nel3urdiN9tbCmrMjOzlYg/06lHXc3Om0ekou95
         oL5w==
X-Forwarded-Encrypted: i=1; AJvYcCU29ZVIEcw2oMNM7SNs6ER8ZaAiTI+I8+vIsZxZGlfOLMnXR1zLJQbSMCOKo8+sMvHhX4fUT3zxX6VzmJ0ED4Vi@lists.infradead.org, AJvYcCWACZTraIcrGQX2jgMpZiqFwSzDx/XXmN7BX8UEuK0fhBs0PsJie+3Oc/OM4svHMgEwzbrp12G/KOH2A1U=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsrjH/kK1wgbtNpMNEkRJbv6luNHi+q7iY8u3YKd7i3JD1onSi
	nbij/wZSkmnSGNVmqHOcjb+1lOdltU3G3NuI98dxvrLr8avPO9R9
X-Gm-Gg: ASbGncuz7OOaiosRowK03Ff9/xBGmn8b3d5J+4TK9JVyL8XGIKng8SKIogav7diVitS
	4q8avfWKlmxJcWiW3/qYG5qnQ6FBK17XJo1n4+yngcftsEvV7Z+hcAH5hFnDy6YV4kkNM3HrI95
	9wo6mGlzv38vAjEa0prM/3XedQ3rfWzmwSWUZnDSHmpZb/n58xUbp5Mug3YxN5bAeWuwuiuWaim
	KNZo/IWPr8oQQ98mCv/NL89bET280g2UwmqeboHcy6K8+mAoxjsgil9Ih/xyql0+Howq2HibiNt
	+CUaK3HtGL0onc22jVA7xyXZnLDZ
X-Google-Smtp-Source: AGHT+IEK0PazKLsQo+heCo/hF/Iw69gOymEwNYP2zVHc0UNgs5uFW1IBvSpCogGh398D5LHBRlbScw==
X-Received: by 2002:a05:6402:4581:b0:5dc:7425:ea9c with SMTP id 4fb4d7f45d1cf-5dec9fabe09mr3983155a12.26.1739470938795;
        Thu, 13 Feb 2025 10:22:18 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a66sm1559230a12.52.2025.02.13.10.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:22:18 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 4/7] arm64: dts: sophgo: Add Duo Module 01
Date: Thu, 13 Feb 2025 19:22:05 +0100
Message-ID: <20250213182210.2098718-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
References: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_102220_736085_A16E1A29 
X-CRM114-Status: GOOD (  11.43  )
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


