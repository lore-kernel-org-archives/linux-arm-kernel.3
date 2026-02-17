Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46754E9A036
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8l290N01INdEGDV46RV1qE15ZPFcOjbnuocE2MfqwE=; b=bla0xnwMKVinu70ekAuEF2wv4p
	NYNMNQyz2EfUjqThjTHDBkfDf+yNtG6p54Ge2P3NrsihTB8Mp0995mDh+ILoeP6ozNQUdO6IV91Ih
	+zKKf25O5luqXawqWDJoQ/1CsypCfIwGmN57jyFipwokwNYpuLeKQW1l3zHGv1uDGQtwH53ZAcRWY
	deNp5otJjmJgTED3w0L7wk26FA9Kyz8NzRbU2Nf4dMfjdFIIhUEr4XCdKbj/jXmoIsxM37UIzb3Wf
	zJ1NZVyDnpts2G4H6JTZLTl2InO8OrXK+MBeKkVFhkyNkCUrz5telGgYD9hz+LdVhz74rv/RcjnKQ
	OvWiahyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ2a-00000008kD4-1p0Q;
	Tue, 17 Feb 2026 18:43:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ2W-00000008kCM-3WgU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:43:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so32834095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353795; x=1771958595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8l290N01INdEGDV46RV1qE15ZPFcOjbnuocE2MfqwE=;
        b=gDTOM/RCHspKBLR4m9zne7OUNhjaki2H10n5wZFxVSql4LkoySe5jgjD/QmfDoz0ll
         G3Xd1gF3kOmFGOG7X5cjs0l6n4yTgarQMGbzhEesBIuw6pBfeLKard20i0OrzmJjfGbJ
         N6e7fHgq41KFbQtIZBcbe+FvvDgoXBTX0/rzCcYH+RNgstsQvb068ElFT7kYGuQJ4Zke
         VmuiHtPp+PejPZuuoKPP4V59G28Zd2/UJoaWq+Y1kCCx9Besof4HOlyA5NBqpYP9fods
         2Qa6Qnq7z1rsCI2eAugdqm2vdFEPyW9AXUUrURyH86QEjGPUaU+gy0TCc1Jypc5s9k/U
         GAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353795; x=1771958595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X8l290N01INdEGDV46RV1qE15ZPFcOjbnuocE2MfqwE=;
        b=HPIq7yEnrJsHB7EEE8LtpUYt4D7vHCv4uZIuGsvnJW4RUeGNqugszdtypM/mHGOx6C
         q7us9JlnNMVlFB6gCpd6eauQ/WtUfMnoAZIhGRpNQXr+tflFxUOCJZtKmrWkkZXWBchI
         p4B+bekjDKUIp7m5b+0Ddt/h2Gho5cyaweIdJu7jWte6WMzXmzuB0iTgoEM+WSmeqHkp
         s68bIXNvdxCZvnArDCBgvXr6xBF4YTmOx7fUFw6sHn7l4v5Rii2wOrU2Lp7mNwlEnru0
         /QoDHOoO0EuEKY4dqhofaGEyr3aLJt7OV0xcHPPe++wiJlx20XJ3wlFi3hx5giPRoO8V
         b0ww==
X-Forwarded-Encrypted: i=1; AJvYcCWQFQyRtyv94uVFWdodmFd7JMPLWiJk+mocC5zEBk/wf74ZAZhzOt7lRr0UoFQLqg5tfONg5wybX47xkrx5ygwn@lists.infradead.org
X-Gm-Message-State: AOJu0YzyGXB6NQcYTfLBLphgJu3m/t6lxpp/gm+h9Oqy6ioluBv3bm/1
	KsthR/wpNb6v3/2G501gOYsAD7YUNUYGgZdq85epMxN8VT2jFGbf/VRM
X-Gm-Gg: AZuq6aJP23xpvrFMukuAdLb0MgyXgto/kPdlQj1JBi3bAU+yTZgcN/D7txP68MOoT2A
	TJqtJET7idyeA04t4mK+hjlfHnB0rCbz+1Ba03aZ9WPVJ1f2KinDjZsVPR3Zsg9g0rPDgyGrLLQ
	keWA0NIX5E/SMrCCm7Fw2ZMTdI/KZ6w/n9Oz35jGTmN4buvZtTifsMebeVAm3tWg+KcitNOwN7W
	tk80Tise5ify9Zn3AV4ldlB/shuD7COrnwsL8QXkBNrNOT4fPOaOxH8CDyPgaYiFC2+nDT4TJyj
	u1nhjMSIoVu+54JIiWlltubQIUeJCIzklRE44ZzyUuMZlIcGTEU/OE8omNmeea/n/PAz+1L7uDl
	fDyjpKTpkddWbbHMT93PJbYik3JOe2VIpeUlBFTiyiv1oYcFF5/PGsXvaKGdV9kicFKd0zYMvBB
	C5ol+y6Wd/5hgthPnEXx468d5bqsmbAtrQNb0df/iy40scG0zRFKluayvD4lU32A8MG/Oj43tES
	lwk1/FFr4fCurnsdUM67KVCbyP7Sj4Zf8xTVzXbCUDlk5TQ9zo=
X-Received: by 2002:a05:600c:3f0c:b0:47d:5e02:14e5 with SMTP id 5b1f17b1804b1-483739ffa1emr277408295e9.5.1771353794807;
        Tue, 17 Feb 2026 10:43:14 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:14 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 01/11] arm64: dts: imx8mm-var-som: Move UART4 description to Symphony carrier
Date: Tue, 17 Feb 2026 19:42:35 +0100
Message-ID: <0ccc14794f4c77dc10b1d900597374061cd65919.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_104317_009049_27AE8DE1 
X-CRM114-Status: GOOD (  13.60  )
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

The VAR-SOM-MX8MM module does not provide an onboard debug console.
UART4 is routed and exposed only on the Symphony carrier board, while
custom carrier designs may choose to expose a different UART.

Move the UART4 node from the SOM device tree to the
imx8mm-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mm-var-som-symphony.dts  | 18 ++++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-som.dtsi     | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index affbc67c2ef6..819707e6f3bf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -11,6 +11,10 @@ / {
 	model = "Variscite VAR-SOM-MX8MM Symphony evaluation board";
 	compatible = "variscite,var-som-mx8mm-symphony", "variscite,var-som-mx8mm", "fsl,imx8mm";
 
+	chosen {
+		stdout-path = &uart4;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -156,6 +160,13 @@ &uart3 {
 	status = "okay";
 };
 
+/* Console */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usbotg1 {
 	disable-over-current;
 	extcon = <&extcon_usbotg1>, <&extcon_usbotg1>;
@@ -251,4 +262,11 @@ MX8MM_IOMUXC_UART3_RXD_UART3_DCE_RX	0x140
 			MX8MM_IOMUXC_UART3_TXD_UART3_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
+			MX8MM_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 190bde4edcd7..b6560c03639e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -9,10 +9,6 @@
 / {
 	model = "Variscite VAR-SOM-MX8MM module";
 
-	chosen {
-		stdout-path = &uart4;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0x80000000>;
@@ -274,13 +270,6 @@ &uart2 {
 	status = "okay";
 };
 
-/* Console */
-&uart4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart4>;
-	status = "okay";
-};
-
 &usbotg1 {
 	dr_mode = "otg";
 	usb-role-switch;
@@ -418,13 +407,6 @@ MX8MM_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
 		>;
 	};
 
-	pinctrl_uart4: uart4grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
-			MX8MM_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
-		>;
-	};
-
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-- 
2.47.3


