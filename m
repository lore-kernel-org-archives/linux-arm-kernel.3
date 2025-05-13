Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94756C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 22:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaXp3+Nc4om8rc2bk8qplk5oP4MocCsaSbkZb3DsCtw=; b=V3xzXNmKfYzpFp5NlK9iUxk50d
	MocgHSnVCTgWbCYMr0u0tsRqJCh7bjHGkkJ3wTelswx+JVMbkTWuWwxx6LEKjDUEROe5Y5IeXkaii
	UMyStjunGNdShpZbvMtzaBeue9dvaYuxUsSZzHu2O0rpR9ei7MkkWEFau8EwKCBFm066tNZKyiXHH
	23NGc8SQOc6gwtV738o1t/y91WWWQY3BZzTWu8uFcMn4YjaaRsMMn+6WbUA2jIYI73ih9ekHTwrPi
	eLg0qIj603tS8lA/b15vpQ+llNt2/eNh75+MxJPBTwOLUWusKvWv39FyuDNKYS1pm72A9y6VUA50z
	wtWkKkRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExpW-0000000DdXn-49Mr;
	Tue, 13 May 2025 22:10:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExfH-0000000DcQe-2xVv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 May 2025 21:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PaXp3+Nc4om8rc2bk8qplk5oP4MocCsaSbkZb3DsCtw=; b=SNIyAbVSbWAdhYjbjtYP3D1Cx+
	9Hx4539cpWmKAXevqQWD61dcJRRJgaiiKik6mvRsL7mhXtERTxAUTgfBvHoTssnVOJSVqHn1UxSnL
	FXViYi1uk6AP3mS3WIi7AhfzWTlC4zd5wANj/TEdiYBijSAu2dJFzGYuiKmSzXb30g0UONfVpNO8a
	y6s7FJLN1dOYpFHzVQJpEbOjRz7p5xlWQEYoxOUEA/VIXntgReeGJ5FqA6UlDg0Km579iipcclOxW
	gHjh+c6KYxfcFwU0aikeOamxypf7VWwyF83T9xVL73KKZlR4Ir6HJnt7CD6wuecBTYcnVZeKBgunX
	XaKsogSQ==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uExfD-0000000H2la-1kdg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 21:59:54 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54DLxaCl2431444;
	Tue, 13 May 2025 16:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747173576;
	bh=PaXp3+Nc4om8rc2bk8qplk5oP4MocCsaSbkZb3DsCtw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xtoa2PHH8NNnlNIvxtJ0iTBfsGyJcMXfl8yIJK0einXWti5e0cubP7ZTzilM75ENp
	 g2WwLiyouRLtfK6UkaueaGGSk1b3AZHHBwQM7Y+rMuzNGRq96l+5K/YBaqE/6HsIIO
	 LVIxl45889/QWNR6mwFp38foUMwOC5bTRXUmKrHA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54DLxZON1005889
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 13 May 2025 16:59:35 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 16:59:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 16:59:35 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54DLxYdI111031;
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
Subject: [PATCH 7/7] DONOTMERGE: arm64: dts: ti: k3-am62x-sk: Enable PRU UART
Date: Tue, 13 May 2025 16:59:34 -0500
Message-ID: <20250513215934.933807-8-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513215934.933807-1-jm@ti.com>
References: <20250513215934.933807-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_225951_974467_A72CFD1C 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

There is one PRU UART module in the PRU subsystem for am62 SoC.

UART RX/TX signals for PRU UART in PRU subsystem can be routed from/to
the user expansion header J3 (pins 10/8) on am62x SK, so enable
pruss_uart by default and add pinmux node.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index ee8337bfbbfd..c474e1d1a74d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -15,6 +15,7 @@ aliases {
 		serial0 = &wkup_uart0;
 		serial1 = &mcu_uart0;
 		serial2 = &main_uart0;
+		serial3 = &pruss_uart;
 		mmc0 = &sdhci0;
 		mmc1 = &sdhci1;
 		mmc2 = &sdhci2;
@@ -181,6 +182,13 @@ AM62X_IOPAD(0x1b0, PIN_OUTPUT, 2) /* (A20/D16) MCASP0_ACLKR.UART1_TXD */
 		>;
 	};
 
+	pruss_uart_pins: pruss-uart-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01d8, PIN_INPUT, 6) /* (C15) MCAN0_TX.PR0_UART0_RXD */
+			AM62X_IOPAD(0x01dc, PIN_OUTPUT, 6) /* (E15) MCAN0_RX.PR0_UART0_TXD */
+		>;
+	};
+
 	main_i2c0_pins_default: main-i2c0-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x1e0, PIN_INPUT_PULLUP, 0) /* (B16/E12) I2C0_SCL */
@@ -370,6 +378,12 @@ &main_uart1 {
 	pinctrl-0 = <&main_uart1_pins_default>;
 };
 
+&pruss_uart {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pruss_uart_pins>;
+	status = "okay";
+};
+
 &main_i2c0 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.49.0


