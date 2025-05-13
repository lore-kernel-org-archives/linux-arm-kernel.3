Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E20C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 22:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swB1Y7Qu5nV3v4fJ5qKmzudD8LkKar6pzlkj0R1vLvc=; b=Ld/CtxeehghBCpT7F8EDk+QEGN
	/SQ8NkpiJj6ke2sL0YG3IVsDYDu2yhf8JISwP4FRZDnNYe5eOBr71zM73pXJi/Q3J1d4X9d8bDf4k
	XPjVLSUL9ESVbuA7LTQmmY9aID0340d5LjCv44tH9j8lhClhppmNn1nXGPTmOjDHCwJbdbmf2tX7R
	JE82Y1frR/3GrGEU/7tv+qerh338CnTupvc30/3LqqpkUMzuM+Sw0VAFajmIHypdZws4uUozbBWdd
	in2UrB6YI51lFhFpjSL5/LSciwLpYqsTVf2uy6unoKpzENkyZ5LleP1QlYrytzM5MSHlTx8WRIpbj
	Ijb5beYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExth-0000000De6S-2ShN;
	Tue, 13 May 2025 22:14:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExfK-0000000DcQz-1tfb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 May 2025 21:59:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=swB1Y7Qu5nV3v4fJ5qKmzudD8LkKar6pzlkj0R1vLvc=; b=Akke9h9pTKmnrSPQvZsAT7ksvl
	p2/80Jj3XJd/YJDQyneOkZdo2DPE3ZA+33nwIqct7eQXPd18Kox7a/mNhXIhM+u6jTRg+8aLtK4G5
	YN9rxK7a15EQcinKb77u7gq+mEanNDFRNAn2tGKxLTtrwDOaTNByekXzuKdVGW/CyFSXFRbpfwXoG
	jE4qK/QuKkgoZOjnMGZBHZQFiTQVlkYZJcQXVNg8cr8J1N+XEiEsD0y9ESyUMAgtUe/haI/iOYM0E
	WUXNNBAm88DFZ8T5H7+5eDCtdgRNwkt+19wy/L0B5neweaps/VwoLPtN+w0YxhGl3s4VpY3rLBGMk
	Khs9DAfg==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uExfD-0000000H2lX-3NxY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 21:59:57 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54DLxaJ62965929;
	Tue, 13 May 2025 16:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747173576;
	bh=swB1Y7Qu5nV3v4fJ5qKmzudD8LkKar6pzlkj0R1vLvc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kUvyx8lh75X4oNKi0KM087tLc9Xn33YPUwac4zbXsuRzRyW+ob8G+n/MjuK/7Ea53
	 T+lRBwIUJFs5gt1Lj44sgx4PJq1d8sDpJgh74WIBFn4GL8SD+ellRpxMg1M4DGikvV
	 RkuHNw5BBa9ER1pO7eD/3C3nNx7N+pzgqMaPzR9k=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54DLxZ031005887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 13 May 2025 16:59:36 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 16:59:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 16:59:35 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54DLxYdG111031;
	Tue, 13 May 2025 16:59:35 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Bin Liu <b-liu@ti.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Andrew Davis <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 5/7] DONOTMERGE: arm64: dts: ti: k3-am642-sk: Enable PRU UART
Date: Tue, 13 May 2025 16:59:32 -0500
Message-ID: <20250513215934.933807-6-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513215934.933807-1-jm@ti.com>
References: <20250513215934.933807-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_225953_836765_62134D4A 
X-CRM114-Status: GOOD (  10.17  )
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

There is one PRU UART module in each ICSSG for am64 SoC.

UART RX/TX signals for PRU UART in ICSSG0 can be routed from/to the
PRU Connector J10 (pins 45/44) on am64x SK, so enable icssg0_uart by
default and add pinmux node.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am642-sk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index 1deaa0be0085..9065fc8a7569 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -25,6 +25,7 @@ aliases {
 		serial0 = &mcu_uart0;
 		serial1 = &main_uart1;
 		serial2 = &main_uart0;
+		serial3 = &icssg0_uart;
 		i2c0 = &main_i2c0;
 		i2c1 = &main_i2c1;
 		mmc0 = &sdhci0;
@@ -284,6 +285,15 @@ AM64X_IOPAD(0x0244, PIN_OUTPUT, 0) /* (E14) UART1_TXD */
 		>;
 	};
 
+	icssg0_uart_pins_default: icssg0-uart-default-pins {
+		pinctrl-single,pins = <
+			AM64X_IOPAD(0x0184, PIN_INPUT, 2) /* (W6) PRG0_PRU0_GPO9.PRG0_UART0_CTSn */
+			AM64X_IOPAD(0x0188, PIN_OUTPUT, 2) /* (AA5) PRG0_PRU0_GPO10.PRG0_UART0_RTSn */
+			AM64X_IOPAD(0x01d4, PIN_INPUT, 2) /* (Y5) PRG0_PRU1_GPO9.PRG0_UART0_RXD */
+			AM64X_IOPAD(0x01d8, PIN_OUTPUT, 2) /* (V6) PRG0_PRU1_GPO10.PRG0_UART0_TXD */
+		>;
+	};
+
 	main_usb0_pins_default: main-usb0-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
@@ -413,6 +423,12 @@ &main_uart1 {
 	pinctrl-0 = <&main_uart1_pins_default>;
 };
 
+&icssg0_uart {
+	pinctrl-names = "default";
+	pinctrl-0 = <&icssg0_uart_pins_default>;
+	status = "okay";
+};
+
 &main_i2c0 {
 	bootph-all;
 	status = "okay";
-- 
2.49.0


