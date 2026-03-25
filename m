Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664FBFEA83D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 09:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8v8tAbQoKbSTjNpEbNtHGD1YISjFB6GU03P9dCTjvKk=; b=TLusFXBoDJfhPtC/vj4xKDK0PC
	NfLGWRmEc/oB0b8oLm5kWWFQnjrNwTj5AtR/ur2bTEmKcm+bhpVSItpw4e0KxJ0bpCQtxJn8fx2X/
	kg3HvG1vwBfV38nfAcleC+nmaZylZ7YASz8Um8zNpUJ2bMiiA1MU2Tqv39Hxa5BssJRnTSreU3g82
	5HQwJKl5sOBGihU2YcEyYw4P9YRuGFrFR7sIC3wAw0/qSXYYnn2oyIAEOjKc4FEOs67pD2F0jzXR7
	cipboHtIPZ/wbc//WDGgzbPEzCWLPEQsKcmk5ODfMRT21AKmOPbr2KfJGqTeVcFHFkdxVN53pu3TD
	GbXfkzlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Kt2-000000034z5-2NNJ;
	Wed, 25 Mar 2026 09:50:52 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Kss-000000034vI-1I5o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 09:50:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so52343115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 02:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774432240; x=1775037040; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8v8tAbQoKbSTjNpEbNtHGD1YISjFB6GU03P9dCTjvKk=;
        b=NEKtPAA8xT3HovEMfHR9rQ9MyaHe31+m3IvvsCPWxDXMcBoc/JUAJt7N5bxHUAN2B5
         5Rk1I8V6rdt3gkFVG6SqEw3citoiVdKG6NtGVn9DB7yhoToeHN7qlTPp4AAzmTPVVsFC
         8uXAFZQpuwqtE8JkSke55yczPg2hNnvQeYbCEKLFCdE+LB0oF0r/f4UfRasRuX+O5R3m
         di+ZNbuVFk62w4U4T7FBo9NoB9OCX9CqacI1VMegxvk3H72yGQeYOE//ybyFvN/fL4Cz
         j6dUFWAr5ayocZ+YfxVrIMcIQVu1Qh74gjlD7CrnAFb0VirOjUkd0WJlHVrMn6oI73rP
         QOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432240; x=1775037040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8v8tAbQoKbSTjNpEbNtHGD1YISjFB6GU03P9dCTjvKk=;
        b=q6XQ/iUMKN0coUlCot7gRhkfks+bO9FQ9ZWfn1gw1vk4Doe8DXt8L340n1YrWue/k0
         2mYw6Bfxvxufn+/HYXw7qmaEVhMedekKZuVR8jFO9o8Yk2JavyK0cBDjVrHQnObsNjkK
         wQS9+vi/z0az/q+eV04RKjuNoC2JHSanvBZOpFS2/oeyvb3O8wIiv0oqILNA3VGW2QDt
         ajxOLhXkCsfLpk2CpTiYLyRMfDl7Ktwz3lzaRTDVuVy4domI0ykhQ84uTcuMH0vcvtC5
         KrMUqbJUu4AXDK+UQYO17aITMi2USH1+2VF2d43oHpfqcp/V+lQ/UU+3h+IDWpI9SbkC
         yFsg==
X-Forwarded-Encrypted: i=1; AJvYcCVIBj2c4gYTNA21kANWRGfE2qWFjPNSNbY98TQSXvQHeVoWUMYehZPRKgvhxaeYDWLFtYZJn0pElZOGCTR80VB/@lists.infradead.org
X-Gm-Message-State: AOJu0YzIZ5p80HRcey79qssVYhAWncJy8ml3SnMu0L3X8IgmzQufDINt
	gVH/D4XAxl5KNQvxTFyg1NfQeROBIA94oJ+JPtgWKzBfmoKEvwWYbFVl
X-Gm-Gg: ATEYQzxAshRdteHMk2uBxGlbueK2vDuIAspldEMNU6BufimKq3W6zbU8n4e+y25FuFd
	QpDEDh67KR2QM5QRUKYObhB6HtbPHlKItc7Wqdsj9vDqnPmIuZJuhRdIrItHWz5f9zKLQ6cuUPR
	+ljf6DhGmodlCQKRkV6OJ3VRyNTJ261IMCdml1VrUHxnejKgMWeLL1Z8fHJ5lDCbnof7pB/kLYt
	US4ZxB24YudDZeOQpMs5WOKa2pylyUFm8av26k/WXjLRzNBRR/RfNlw9RJfRO6Cv1eO+EbLb8h1
	QWkB1O3s4VxjA1Q1WuuNaH/lKrObkThbWwDNsF+nfuC+SKDYpVq2D9lWAUPOpVHatjMjIqBAJDT
	OZ4KIw2Wf39Ee0bnITQpNZV9jgKyK4WlnbnBEC8M+A3Arsh1xfnC7H6W08BTq411mTPBwuAsXn+
	7v8wlxOh0vax0Y/VNKKfOH1sTsYJ2vNNnB4/Dk/eKexU2knMHh4VRp4WMbVfDd5MONBuXDf7ES2
	FxuUcQX0RUjbFWzZj8ZnbNg9xLTnxKny+6sT9pxaZvcWZQEoRQRY5BevuDJYxDRVo4XZzZxxqjr
X-Received: by 2002:a05:600d:8449:b0:485:39d4:2dd9 with SMTP id 5b1f17b1804b1-487160afe8cmr30769345e9.33.1774432240097;
        Wed, 25 Mar 2026 02:50:40 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116ee57esm111397755e9.14.2026.03.25.02.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:50:39 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Wed, 25 Mar 2026 10:50:21 +0100
Subject: [PATCH 2/3] arm64: dts: freescale: imx95-toradex-smarc: Enable
 bluetooth on lpuart5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-mainline-update-imx95-v1-2-b5ebe976655b@toradex.com>
References: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
In-Reply-To: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_025042_391980_93520DF7 
X-CRM114-Status: GOOD (  12.83  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

The Toradex SMARC iMX95 uses the MAYA-W260 WiFi/Bluetooth module, which
uses the UART interface for Bluetooth.

Add the missing UART support to enable bluetooth functionality on the
MAYA-W260.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Although Documentation/devicetree/bindings/dts-coding-style.rst
recommends an empty line between status and latest property, leave it
unchanged for consistency with the rest of the file.
---
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 1d369983cf7d..a90edefc5197 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -616,6 +616,19 @@ &lpuart3 {
 	pinctrl-0 = <&pinctrl_uart3>;
 };
 
+/* On-module Bluetooth */
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_bt_uart>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+		fw-init-baudrate = <3000000>;
+	};
+};
+
 /* SMARC SER2 */
 &lpuart6 {
 	pinctrl-names = "default";
@@ -830,6 +843,14 @@ &wdog3 {
 };
 
 &scmi_iomuxc {
+	/* On-module Bluetooth, UART pins shared with JTAG */
+	pinctrl_bt_uart: btuartgrp {
+		fsl,pins = <IMX95_PAD_DAP_TDO_TRACESWO__LPUART5_TX	0x31e>, /* WiFI_UART_RXD */
+			   <IMX95_PAD_DAP_TDI__LPUART5_RX		0x31e>, /* WiFI_UART_TXD */
+			   <IMX95_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B	0x31e>, /* WiFI_UART_RTS# */
+			   <IMX95_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B	0x31e>; /* WiFI_UART_CTS# */
+	};
+
 	/* SMARC CAM_MCK */
 	pinctrl_cam_mck: cammckgrp {
 		fsl,pins = <IMX95_PAD_CCM_CLKO1__CCMSRCGPCMIX_TOP_CLKO_1	0x51e>; /* SMARC S6 - CAM_MCK */

-- 
2.43.0


