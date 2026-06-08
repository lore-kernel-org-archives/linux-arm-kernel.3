Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8735ACD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyc6FtIc4DT7UgqHVYAGSMmfSKaHs4aR3RARI0nuwjM=; b=G4TYl5XeFp/IODJYrGrhZpGqzY
	/EEQ+5SZVo/IQcPDPYfJwlPairTf8eEpqjiAASg+1r7jj0m92ReCuFJB32LL1nzksEr3TnaRwkBd/
	UL+dVQ9rQFm/ayMv2ENxeZVW/nLVBf0FL4gKCnIsXSOTA8ByS90VpN+O38D/zV9ws+VSqL8fgkJ+7
	U/AcVkGIoZ/R+TVtZPu13bRzZHQTmzackKjpLrwicFoF+oN7mYdnnqCW0heSAoStYEiRMhyub6YuT
	x8UZYufD6lcNV88ivfXOE9zZjJSot7wrLdZTmjRg3+NyFHygjacyfkOnT/nVv2yKF5CpxP3REhmuY
	1c3P5veg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvS-00000003HcQ-3IVg;
	Mon, 08 Jun 2026 10:09:46 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvP-00000003HYA-3pIH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:45 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so3098359f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913382; x=1781518182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyc6FtIc4DT7UgqHVYAGSMmfSKaHs4aR3RARI0nuwjM=;
        b=liEbRSz3afT7Ez+szqe+V1IxAP+q9tkmGL3eAaYQQBj01U0BpajDMrE86YIcfRckaf
         7HnMVwSus9FNEPa0kA9fxjrbgbQu7ye4IT19WXn+G3k3db72DTRWEXPBsb8EdA2w3iEq
         Kt+/mVBVgTcdyzZ4avv+o0xEyyHTm2C6YOgGvBlAwWzW5MYZpJQ0SvxPB2cMk4uxqgsh
         WRtGO53TQFXaG5l2B3XHEuoA9OJA5TgLWfczW5/AT3K7pDGcujS+7A5AFIcVjrQjv9V1
         HDbgugQaCkHq4mUfLBQI6S47HcYACOqUltYBsCjdVVVy2vbjgsPQ9M8XsELj44H0V3MU
         mIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913382; x=1781518182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fyc6FtIc4DT7UgqHVYAGSMmfSKaHs4aR3RARI0nuwjM=;
        b=kcOUI7UkY9hGtjwmkeGJKGaUvxCS16hKqTFqi8+G+vY0CxNbI7REVj8xClPCJTFEW1
         kns4bIl5+JxS24CwicfYKfa+8rYBBHALoWIoJY6DX2ug5oL0mFB0NyvkxyQA7q4EbIjS
         erQzt2huqRZ5pwov9vYFcBbZGK8Ux+6RbYBDD57yDv+H4pnjhQQM39MotSHSea4dwW9O
         dNi6xiSuzjGzJdJkV/daojBHMCiW0fKKpQI/+ytTxPiOvjPFdy3rcW/ro/VyQYrNojhU
         rJ7iSx4VLOHmU78xYoCli1VaRdyVQv5/BYGbXhw1A6EQnvuGC7h/IoBEwvZqZm+WkVxW
         XzhQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MRRPcLKFLJ0H6sj1Qm7+Siz6spQLdIsLQS2/tNci7XioX0/tbwhOFeSd8ZTmv0tkLqk62pkPEXxAmZyKnq3m9@lists.infradead.org
X-Gm-Message-State: AOJu0YzKw/K61thbt3MTvgzpy/sA5bmBLmFWoDWpA0Gzovy2GkLWloNe
	whHOOutve6o76LspSCmFi5gYg5Y5YWr44XzBpK1U1muutoJxN9ifo0Ow
X-Gm-Gg: Acq92OEY1wus8y39V9qOgsjCcmdtgKBUgQKlpoBkEHq35jolkOTDLfhafmYfASKnJy2
	vo2KU7+3B9rkR6ZFM4nUOKabXk2hUsDdFBMwLXljlKGT4+umN9eaot7fYzAzJlYHJJqyYufCzRc
	FUfnGxQaW1t1ouPiqmGBH5mePpKFADsr5RgurDW4hoAdhmDavzQBfUQesFUADoJ/1AevDeK+z89
	vNHdKVq3riZIOumvTWpbo87nbFtVsfGRleHxBQTnw8jrCKCcsMA5M/8Sq90dY+wKUvZ2uGC5eHA
	BrkW2pZo7th8cvUFUhj6BKhQSAwmw7WV1a8UTE83tc25t5bgt5jFq7nvI9Y7JQm1o58FGepnrdq
	T2lcXhD69ygc1qw+RKj2cHHsBCxV/7rJkW6t3vcWvsx7613hBAjaIksjvvcbBRke1Mb9ltR/Vak
	oeHPrljiznpNv+ThRD2MjRrY23gHvWPZ63A4fHvzb8DSsP7yBur1ER4l6waALfX8BXPaG3x6q+S
	lrWDDRmWn0LNhCdtH5kLRdeBVAPcrYQYzT5HaSidPFEwSJm
X-Received: by 2002:a5d:4285:0:b0:43f:e721:76b8 with SMTP id ffacd0b85a97d-46030624015mr16808494f8f.37.1780913382209;
        Mon, 08 Jun 2026 03:09:42 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:41 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 05/14] arm64: dts: imx8mp-var-som-symphony: enable header UARTs
Date: Mon,  8 Jun 2026 12:09:23 +0200
Message-ID: <dded56bcf066056f56435e65ddf9d200b0d7046b.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030944_006268_6EF7D559 
X-CRM114-Status: GOOD (  11.49  )
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

Enable UART1 and UART4 on the Symphony carrier board and add the
corresponding pinctrl configurations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 7b839efdbcbc..34a956c98635 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -154,6 +154,13 @@ &snvs_rtc {
 	status = "disabled";
 };
 
+/* Header UART */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
@@ -161,6 +168,13 @@ &uart2 {
 	status = "okay";
 };
 
+/* Header UART */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usb3_0 {
 	status = "okay";
 };
@@ -261,6 +275,13 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
@@ -268,6 +289,13 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
 		>;
 	};
 
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX				0x40
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
-- 
2.47.3


