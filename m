Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8012CC9833B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 11:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsynydf8YdSxO4Zx3OaC0heBUlHGl0XSiHygSQNebIw=; b=opxn9ZLonHaYJhvDsfPFv7oWXT
	e5GE3UZsVb5inl2z3xkwAEowVEEF7eNiQvDLADYYTKAKknABBhmO8mTY4jSzFGlVS7f0Ihcv8ZY7X
	J12kWCuJfKglRguxhl/7NeO3TjxZJrkVVA3xijrcDmhNABm/XNOAB+yKp5dGZIglbuA83flVQXeBa
	T/uwKRvYx7iF17++rWmHAwG4obBrM9YZ2lVd8f0zPyE9ywZzoutHFqwiJ3DMog7R1v9faUceP1Quc
	GHMjobbaSGgUZPYuIry0T46Izq1Rgb7/6jJL5MV7zflCDgk6FIyS9mILwdeonvQwzuLH6JUgL9qLU
	Vz+7w9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQEt-0000000FISS-3SFd;
	Sat, 26 Sep 2026 11:06:43 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQEM-0000000FIA6-19Km
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 11:06:13 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4885d4825adso963703f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 04:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790420768; x=1791025568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rsynydf8YdSxO4Zx3OaC0heBUlHGl0XSiHygSQNebIw=;
        b=TXnI7qwL7MqW8jZi20syuio9ub0oft12XCOJjcVqcMmzTYOpbETDK8ug7VwK7SVggc
         qO3NskbWFAM6O4AEbX68K9b/BmxpOuKkX6bWOMP6vqV6ZthBAnaD0pBPU2VNeuF9sqpH
         PAZng8YmlTOIF6g89UYeZorvVY662VPoJbpgcm4disWbEXuIUioTyTCqEY1NcekoSjbn
         jK8w4QXUPuRy+ZutqsGvtPZ7rmsxYG/UckaF2XXl/tuKmTJ4VaT6alynUrd6t1/O+bMI
         3xoOoEFpIShjZyptGrQBCC1ikH28DhNdsgSiMfkFKtrckFEQyojEL2aG4upXCyk/yXj4
         p1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790420768; x=1791025568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rsynydf8YdSxO4Zx3OaC0heBUlHGl0XSiHygSQNebIw=;
        b=U9h3GlRwnPd1y6Oqn3TO1f/IWi4FKKuGWjA+nw0anBfFgFFsxWC16oYJkRCAXrPmKy
         NlVArEQE8CGtBesiCPrKxJU6/RM6D3UenDiA6oq34alCZbNl7FwPHGOG5Z2T/iOer/ko
         e4HWpInfJJL9c3+7UobeMYNhEoYcqMUD4ZqvOb9PBl/UwUaQWd7Rc82AfPZ+W//po/AL
         EhBQ86GtAY1gOYc9gEwrmwZmVGev7RyIoj2ktWtzfXddAlZOa7FXUh8NCp7VrFlEIxON
         7bNdHjfKZ6mPVcn8JI2+TbpbXqWLFAsrhZIJZIEATcYjRHvY+w01zvVyrcb3EWg5A8lX
         7ZPA==
X-Forwarded-Encrypted: i=1; AKwUvBzMWyZuudNWuED8ldj9leCCWf+NKogGdaLWk2LkK+ijKvlCWMyedQo6xgcwR7BURODtIUVER7Ul9sYlZeT6Rh4P@lists.infradead.org
X-Gm-Message-State: AFq9FYLmSZQkLYGbOuXGebSLTZ/SIQS8ePXs5ZaAxlSzbGhBYGgqDa6w
	6kM3J2kg2KOtYSi7ZJaKPuSO8ASzuZBlDAjsg02Hml7pcwMwGDcD+i0/
X-Gm-Gg: AYBFou1mb6hyzAfVMR4x0r7MX8CbptIkuBgMLoc8mBc+JmZACT9HMl54h3qQi3z3G2H
	5OLLHm0fgguNRPDyZ5UgkC7GfLlKAKLPcDtvIr1k9V4mpl2zd/2WgZTCGt2+9LdbO96weJuVrrl
	l+F8Y2At7Q14or5i5qUPpj6UISUjKFTSQq2CpT0M5JcAumz5KGR1eEfLj/A5Ows+A/o7WPiOSdl
	3ZqyoaxbFt3LNtRD4skC4SypXkxPN4ubQu7d4YeX4fA6PdYyA0ati7eLt7Q+9L+Ab/Qh9GjdmZv
	GwiZjuFO8CJSoRV6MlyLXj486vP+WPzQZbc/p8R0+U4R5GGiTzF8P/xkWJTRAX1oUkaTEDtGXPr
	wK/wE9NjCiyqzpW+39cgPX6YB3py+lPhxEnXv5R1SGk9BgPxN1qX1QAGEC+dUAwZ+MOWiONOGs2
	UT7hIMccw4/a2zaajpiPGH6sKpBjDjQn09XwnMoGEFG1hKUoZCzP85Qf9dCeBWU9AMSnl/LD5Wp
	/9tL9/OsR9dOozQYz2gy6vNMxxxKYn0/upW7IVWAamTDDfZQtfyLb5MM7lWdYM96jrw3Gho5BST
	P5hDDn6OaXRvgVofdbZnoQ==
X-Received: by 2002:a05:6000:3108:b0:488:7fde:7b60 with SMTP id ffacd0b85a97d-4887fde7e77mr9512492f8f.36.1790420768344;
        Sat, 26 Sep 2026 04:06:08 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f795sm12124664f8f.31.2026.09.26.04.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:06:07 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v2 10/11] ARM: dts: imx6ulz: Add Variscite i.MX6ULZ board variants
Date: Sat, 26 Sep 2026 13:05:38 +0200
Message-ID: <1e36d15592f904c045b7d787f26c14c5114508df.1790413032.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790413032.git.stefano.r@variscite.com>
References: <cover.1790413032.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_040610_570003_56283579 
X-CRM114-Status: GOOD (  13.62  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add i.MX6ULZ board DTS files for VAR-SOM-6UL and DART-6UL with their
carrier, storage, wireless and audio options.

Reuse the shared option and carrier descriptions with the i.MX6ULZ
SoC and module wrappers.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 ...z-var-dart-emmc-sd-card-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...art-emmc-sd-card-wm8731-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...var-dart-emmc-wifi-brcm-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...t-emmc-wifi-brcm-wm8731-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...ar-dart-emmc-wifi-iw61x-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...z-var-dart-nand-sd-card-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...art-nand-sd-card-wm8731-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...var-dart-nand-wifi-brcm-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...t-nand-wifi-brcm-wm8731-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...ar-dart-nand-wifi-iw61x-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...lz-var-som-emmc-sd-card-concerto-board.dts | 21 +++++++++++++++++++
 ...lz-var-som-emmc-sd-card-symphony-board.dts | 21 +++++++++++++++++++
 ...som-emmc-sd-card-wm8731-concerto-board.dts | 21 +++++++++++++++++++
 ...som-emmc-sd-card-wm8731-symphony-board.dts | 21 +++++++++++++++++++
 ...-var-som-emmc-wifi-brcm-concerto-board.dts | 21 +++++++++++++++++++
 ...-var-som-emmc-wifi-brcm-symphony-board.dts | 21 +++++++++++++++++++
 ...m-emmc-wifi-brcm-wm8731-concerto-board.dts | 21 +++++++++++++++++++
 ...m-emmc-wifi-brcm-wm8731-symphony-board.dts | 21 +++++++++++++++++++
 ...var-som-emmc-wifi-iw61x-concerto-board.dts | 21 +++++++++++++++++++
 ...var-som-emmc-wifi-iw61x-symphony-board.dts | 21 +++++++++++++++++++
 ...lz-var-som-nand-sd-card-concerto-board.dts | 21 +++++++++++++++++++
 ...lz-var-som-nand-sd-card-symphony-board.dts | 21 +++++++++++++++++++
 ...som-nand-sd-card-wm8731-concerto-board.dts | 21 +++++++++++++++++++
 ...som-nand-sd-card-wm8731-symphony-board.dts | 21 +++++++++++++++++++
 ...-var-som-nand-wifi-brcm-concerto-board.dts | 21 +++++++++++++++++++
 ...-var-som-nand-wifi-brcm-symphony-board.dts | 21 +++++++++++++++++++
 ...m-nand-wifi-brcm-wm8731-concerto-board.dts | 21 +++++++++++++++++++
 ...m-nand-wifi-brcm-wm8731-symphony-board.dts | 21 +++++++++++++++++++
 ...var-som-nand-wifi-iw61x-concerto-board.dts | 21 +++++++++++++++++++
 ...var-som-nand-wifi-iw61x-symphony-board.dts | 21 +++++++++++++++++++
 30 files changed, 630 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dts

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dts
new file mode 100644
index 000000000000..35b62a4fc7f5
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-dart-emmc.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, eMMC, SD card & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-emmc-sd-card-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..f102909e1085
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-dart-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, eMMC, SD card & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-emmc-sd-card-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
new file mode 100644
index 000000000000..1db02ae37187
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-dart-emmc.dtsi"
+#include "imx6ul-imx6ull-var-dart-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..c15267333c75
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-dart-emmc.dtsi"
+#include "imx6ul-imx6ull-var-dart-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
new file mode 100644
index 000000000000..a9c1bf09f57b
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-dart-emmc.dtsi"
+#include "imx6ul-imx6ull-var-dart-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, eMMC, WiFi IW61x & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-emmc-wifi-iw61x-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dts
new file mode 100644
index 000000000000..26acf395c8aa
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-dart-nand.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, NAND flash, SD card & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-nand-sd-card-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..fc59acb585da
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-dart-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, NAND flash, SD card & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-nand-sd-card-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dts
new file mode 100644
index 000000000000..866e274eca00
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-dart-nand.dtsi"
+#include "imx6ul-imx6ull-var-dart-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-nand-wifi-brcm-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..98d082e77e25
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-dart-nand.dtsi"
+#include "imx6ul-imx6ull-var-dart-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-nand-wifi-brcm-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
new file mode 100644
index 000000000000..a0c70b887979
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-dart-nand.dtsi"
+#include "imx6ul-imx6ull-var-dart-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, NAND flash, WiFi IW61x & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-nand-wifi-iw61x-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-concerto-board.dts
new file mode 100644
index 000000000000..4448bc53856c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, SD card & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-sd-card-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-symphony-board.dts
new file mode 100644
index 000000000000..12779f304819
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, SD card & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-sd-card-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..b5e6bdc1f494
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, SD card & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-sd-card-wm8731-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..04109c893034
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, SD card & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-sd-card-wm8731-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dts
new file mode 100644
index 000000000000..28b2672014ba
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-emmc.dtsi"
+#include "imx6ul-imx6ull-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-brcm-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dts
new file mode 100644
index 000000000000..4a7d638f0d0a
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-emmc.dtsi"
+#include "imx6ul-imx6ull-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-brcm-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..4315eb901f4c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-emmc.dtsi"
+#include "imx6ul-imx6ull-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..5f4622521293
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-emmc.dtsi"
+#include "imx6ul-imx6ull-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dts
new file mode 100644
index 000000000000..4fb02dffa9a4
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-emmc.dtsi"
+#include "imx6ul-imx6ull-var-som-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi IW61x & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-iw61x-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dts
new file mode 100644
index 000000000000..2809d7e6c32a
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-emmc.dtsi"
+#include "imx6ul-imx6ull-var-som-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi IW61x & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-iw61x-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-concerto-board.dts
new file mode 100644
index 000000000000..ba51ec37c273
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, SD card & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-sd-card-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-symphony-board.dts
new file mode 100644
index 000000000000..21fd6b106380
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, SD card & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-sd-card-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..64f17c5f082f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, SD card & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-sd-card-wm8731-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..b78b7ffe428f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, SD card & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-sd-card-wm8731-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-concerto-board.dts
new file mode 100644
index 000000000000..c3a63b8ab893
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-nand.dtsi"
+#include "imx6ul-imx6ull-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-brcm-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-symphony-board.dts
new file mode 100644
index 000000000000..0a64b2f5ed9c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-nand.dtsi"
+#include "imx6ul-imx6ull-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-brcm-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..d9994d1cbd87
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-nand.dtsi"
+#include "imx6ul-imx6ull-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..a60a02d0a3d4
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-nand.dtsi"
+#include "imx6ul-imx6ull-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dts
new file mode 100644
index 000000000000..6ff6527f7e8e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-nand.dtsi"
+#include "imx6ul-imx6ull-var-som-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi IW61x & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-iw61x-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dts
new file mode 100644
index 000000000000..36d063be402d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-som-nand.dtsi"
+#include "imx6ul-imx6ull-var-som-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi IW61x & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-iw61x-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
-- 
2.47.3


