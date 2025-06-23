Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A353AC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 20:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8DVcSJ/dvopLv561u5ZgnhDKEYiQSLuZjoUf/lGc7y8=; b=RRXzpxeXbxZVlZ3R0Gnq5DUGAQ
	fcJmCKGC7M34r0iKPZ56OjXt5ACmQvSwnpG6JkKTdJbHoYHiW9VvbHz4jgfyjFth0FvdVFSetaNao
	+L3W0z7jT0k2E8YXkWY7nyNSi3HgtIyOu67W1F6HCmvtqmJoDUyzIoXL55B5hdIbt65NNoqPq3uJW
	t/U1yqVsKdxKp9F6OJSCb2HE8WqUtuC0Ucy1c/B+WzNE8E44mVh3pNuZxFz+4XGIqPPFr4EOnXsBg
	WtvP0K3sBbAhl6USB0J3D7FDwx21Pt2KSWkxr3SLtHBF67lMbTtxNKlLhJv69416781PTy6HDTxCJ
	TIlmoU7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnvG-00000003w2f-02Ei;
	Mon, 23 Jun 2025 20:37:46 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTihG-000000039SX-1JcI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 15:02:59 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ad572ba1347so703609566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 08:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750690976; x=1751295776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8DVcSJ/dvopLv561u5ZgnhDKEYiQSLuZjoUf/lGc7y8=;
        b=SnVxt1wQKa1UzVazeoJcq2Kx0HZiIomWKs7eWFGgxS6W3cS/7iK6kDYsogU0pbZGba
         TVKC7ODYS4hI3qjt8YCXXstkSvbyvqLljwAEUIliPY1EdJ3trGMWml2mtVxXgK4T+g+K
         IOXj5ZkjxaxCZuOlt/WG1h3pa0NCjOluIII28kUTF/j8t0ETsRb16Pi8KNZYn+drEInh
         mH7dvKea9GkMw2ivStJarZZLZJyNTj41LGVOEwdSs8H9S6lKoGdaMRs0h5mBtjpSAW8Z
         xF4zhjPecYxa7LRGOkioDxOO5OTRFkvFfQbOJs8jTNQOUxgqlWLU4+ri+X0eu61ZeCmR
         yU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690976; x=1751295776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DVcSJ/dvopLv561u5ZgnhDKEYiQSLuZjoUf/lGc7y8=;
        b=VnNDgsQkIvuIcwbPa+SE8Dg/FyHg4URd0dgs/u60SvPjJPtkG2n5q2ny/cUksX+2W5
         Z45yzJijPWpgoEpvZk0ne3ugpOg9smE5scrPQOYg/rA1r8sWoGDK4Gs8GyZBeBrqA5QJ
         z7kFrZtFfY3TkNG8tkk7bpa2M681gJDEkaSkO8UlotTJ2/ExY5JRrHo6OFhLFdZudePD
         wJMQ16nHMsK6j2ENtY7E0iYbKRL4JI/xJ6LBzCMlvY0jZ46C/c9wN3FZhrfU0q+MRKtC
         uxPd2OInKAte4ZhcH4BkSYcEABmsDqzT/OklK/hCvmH84MOerwx2YaI9zROg4+OpzF7i
         acWA==
X-Forwarded-Encrypted: i=1; AJvYcCWITEC2G9EtJmrVgYYRS0bLXG+S2UW5Vce5mVD8Qp32TX80fBvcTcI/L1Uj64k/pC3icjX4xdqhvOmHRR0YKczK@lists.infradead.org
X-Gm-Message-State: AOJu0YyhGwxtijqa3lSo2CrGqQS2ugoqJ1UkAfH7WwgsibjNUGP85g/b
	7B0/mm60xV4bBQ5Jf2eXIjw5tf6Typw8O+ZPSYlbbZy9OV9N30PikCOg
X-Gm-Gg: ASbGncuKwfy4nQxT0KKg2ApKEKt2TjPn7a7fnY18SJ/FLIroVM9HJ+I6MxCXsWX/kPd
	z1aYfMYbMRp/OgFUTkvLLBePilnAeF4k9BKyS5opdCb0dGNCh+UZKgM214rgGIDjoAmURDYyC55
	ueuQd4hFsrt93yphSWXc+Ga21aRQzdpsoV6WhbeNhz/pSp4Vf0SNSk9p5Iv85aygIG0K8+75Ala
	jZWPt2wyh/+4pOQix9YidulYWaKp5Jek00Layhjzz9btVXKcDEFqeMpHa+SPS6Z1wHSughh1YG+
	pTSXeP6i7K6IxuDzLhE+ign1UKO0TiyCA7P3GWyloQVA2uWhNFqkYllJ144YX2KC/+bKZZ/SSwC
	yIBullXQkngBR2SBHenh0oIk=
X-Google-Smtp-Source: AGHT+IFSO4725zW0tfiRfFFvsoN+L2INX8CRqzWeVA5SH7DGUv0pCu2PupV+KgzNzAz1wlydHfE6zg==
X-Received: by 2002:a17:907:1b1b:b0:ad8:a935:b8eb with SMTP id a640c23a62f3a-ae0579d1abemr1091515466b.3.1750690975318;
        Mon, 23 Jun 2025 08:02:55 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209ad2sm732870766b.148.2025.06.23.08.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:02:54 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx: add dts for the imx8ulp evk9 board
Date: Mon, 23 Jun 2025 11:01:46 -0400
Message-Id: <20250623150146.1398044-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_080258_356090_B4A87F14 
X-CRM114-Status: GOOD (  13.02  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DTS for the i.MX8ULP EVK9 board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4da7501ece17..4b288b324d38 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -322,6 +322,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 
 imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
new file mode 100644
index 000000000000..c610ec9aa30e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+
+#include "imx8ulp-evk.dts"
+
+/ {
+	model = "NXP i.MX8ULP EVK9";
+};
+
+&btcpu {
+	sound-dai = <&sai6>;
+};
+
+&iomuxc1 {
+	pinctrl_sai6: sai6grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTE10__I2S6_TX_BCLK  0x43
+			MX8ULP_PAD_PTE11__I2S6_TX_FS    0x43
+			MX8ULP_PAD_PTE14__I2S6_TXD2     0x43
+			MX8ULP_PAD_PTE6__I2S6_RXD0      0x43
+		>;
+	};
+};
+
+&pinctrl_enet {
+	fsl,pins = <
+		MX8ULP_PAD_PTF9__ENET0_MDC		0x43
+		MX8ULP_PAD_PTF8__ENET0_MDIO             0x43
+		MX8ULP_PAD_PTF5__ENET0_RXER             0x43
+		MX8ULP_PAD_PTF6__ENET0_CRS_DV           0x43
+		MX8ULP_PAD_PTF1__ENET0_RXD0             0x43
+		MX8ULP_PAD_PTF0__ENET0_RXD1             0x43
+		MX8ULP_PAD_PTF4__ENET0_TXEN             0x43
+		MX8ULP_PAD_PTF3__ENET0_TXD0             0x43
+		MX8ULP_PAD_PTF2__ENET0_TXD1             0x43
+		MX8ULP_PAD_PTF7__ENET0_REFCLK           0x43
+		MX8ULP_PAD_PTF10__ENET0_1588_CLKIN      0x43
+	>;
+};
+
+&pinctrl_usb1 {
+	fsl,pins = <
+		MX8ULP_PAD_PTE16__USB0_ID       0x10003
+		MX8ULP_PAD_PTE18__USB0_OC       0x10003
+	>;
+};
+
+&pinctrl_usb2 {
+	fsl,pins = <
+		MX8ULP_PAD_PTD23__USB1_ID       0x10003
+		MX8ULP_PAD_PTE20__USB1_OC       0x10003
+	>;
+};
+
+&sai6 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai6>;
+	pinctrl-1 = <&pinctrl_sai6>;
+	assigned-clocks = <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>, <&cgc2 IMX8ULP_CLK_SAI6_SEL>;
+	assigned-clock-parents = <0>, <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>;
+	assigned-clock-rates = <12288000>;
+	fsl,dataline = <1 0x01 0x04>;
+	status = "okay";
+};
-- 
2.34.1


