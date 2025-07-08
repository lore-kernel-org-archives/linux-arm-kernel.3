Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B414CC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 14:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q39+rmVt4A2B3V+dGS36sBW8bBHj4CY5V2BRog5QBms=; b=J//enWYL3w1s3Tub1CFEcu+jaI
	u8v2AcOqRBxVPaarF0vkC56OuPSNgm4nzyGn4JaIBveBDZ2Ab11FaqIB6rRStFCt3QyaBKyawOCy3
	ssNqoHQ63UQIkoGSzQFdHeEbzGXl76fXVwWCpXCqS/rz4MidjhWhSqcb09DPzKChd10x0V7o1MGLE
	X7kJugdlETbw9r/PBvAeWJcVKJuCL6CER19f4b8FWs+b0HR5dTC7ZDjZAE+TCsQyxmw4K2piyZwTP
	q/CBxwQMSutiIjczWkbkTjumXCVZz8uJMHy3/WIMwvRWjxNVuRa4IyPYOv9qrG1y5yPk4GuKQ+C5d
	L4J+inYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8sy-00000005WQ3-1KMK;
	Tue, 08 Jul 2025 14:01:28 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8mQ-00000005VOA-2Hdb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 13:54:43 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ad572ba1347so671240266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 06:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751982881; x=1752587681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q39+rmVt4A2B3V+dGS36sBW8bBHj4CY5V2BRog5QBms=;
        b=IlFCThe8HW5cGQqvANI88NAwFea6f3CVRLKP22Zt5UMWP+zSFegR6sbZvWg7b5lQed
         oulLLF/izOxf94w/1kqu1jD/svFXvEt8MD1hu9mCBq3axfeBgbHjSzyI4V0K8SPRSHNS
         b2vh9eXoGv1yaZse78lZsIE5ojd/jDraCF909cZ7GCcsCOJTb47TfdORWhTTe6Ipoehd
         NC7FXTNRSTJ1Rt0oNU2zusz1ugb3n7DIKnMFpYou3RjPXHViM9t40Usq/UtfLAPmy5by
         sPwYOJePNThvzjtcwqRcPNDIeeqXT5l5b3I1qM5GDSpo6UBvm8hVHHckLNfuuAY6bLs6
         +Hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751982881; x=1752587681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q39+rmVt4A2B3V+dGS36sBW8bBHj4CY5V2BRog5QBms=;
        b=TzrgwmtDMnOg76toei6MBNgZ/UUvv+UfzC1HlBpsz/GbNZC0EWgHqVddNnY+kIMtp+
         IdDhaV6YBBSSKfwj2ou4/42jktYuciZM8L0xoyfwS8XBOPEKjpo+cIrrIdz7xFRMjbtI
         L53g/aA7bOZYwpR3WWyfQjEoJ/sFEqEzUk7PsXaLt0slrMAhMP8KNlMVtXGNh9tkx1yD
         cstrNiXjgW+Hlk0JorrK2acCsNxPnWrZN371GB5zxhvWRQOI793XKSGHkn9GNIzbM3cO
         GRGQe8rQsfwhFzXMbdx6CPqVJXI0BRoulbT2s0cvdxDcyRrReU36crV5oTLJ9r071oYC
         lyZA==
X-Forwarded-Encrypted: i=1; AJvYcCW9fDEVSKwnQ3LlLFEnSxmL64wP/y48KUF3n8masB0aBcoM0UfAqgSQtIWoQQRtZJLX5cqWkZgZoBQc1YMoOtFK@lists.infradead.org
X-Gm-Message-State: AOJu0YywfZfUm4ialKNQSb/4A0PhhZyJAWJqqQsmuGVeX7yqwzgH9hJH
	ya+2UJ4hByL7xWv7jMkwHVNuIH7BfZCvBJt6agfjd7mHWwdG1x/5fcOg
X-Gm-Gg: ASbGncta6V173YOUWZX5buUzXlFVBRO+4xRJ5+NizDxydb9xoE1cwtxiaWDowB1QwHb
	3s/xF2orXTq1qKasHBtHLlsFgNYzpWYw0e6dlTFfWfGjBMni9i5yTSwLPmcRDtg6TIR64Pgh2Au
	q4DwutYbyHiKCuAlKJpX2l0rfACgDfZnv0lJHTQiMmp0LQpmxdGWd4vaZbmIE7NUXm7TNtpCEPn
	Enua4qrA5KuZhV5pSY0Fnqpb27Yw8J/+wKaQDkZq3FswPaH3M7bjFDpRgrSlJE2O2TQZ3OXVcEs
	v5d1IGVI5bet0/wYrEGD0scTblojQRHXJcwk7xqd6LGwgTE34wyoq1QujNU12MHVKlhcRYvrPwH
	wT8nX7v5GYyN2xUR+t5cPjn+Xch6kQYPVa8u/fu3YP0xURO9SIhQGgzgXDgSNQZn7
X-Google-Smtp-Source: AGHT+IEwKuGBUV6A52zfoY52+Yo41jVFUHAwMCF4D285FO0GiN1roY7nL5hI5r4cCSQtqUs421gD9g==
X-Received: by 2002:a17:906:f5a7:b0:ae3:f16e:4863 with SMTP id a640c23a62f3a-ae3fe64e8e6mr1665718566b.1.1751982880709;
        Tue, 08 Jul 2025 06:54:40 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac6641sm910431066b.99.2025.07.08.06.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 06:54:40 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx8mp-toradex-smarc: fix lvds dsi mux gpio
Date: Tue,  8 Jul 2025 15:51:41 +0200
Message-ID: <20250708135300.2855155-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250708135300.2855155-1-max.oss.09@gmail.com>
References: <20250708135300.2855155-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_065442_580981_72D0735E 
X-CRM114-Status: GOOD (  12.88  )
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

From: Max Krummenacher <max.krummenacher@toradex.com>

The MUX which either outputs DSI or 2nd channel LVDS signals is part of
the SoM. Move the pinmuxing of the GPIO used for controlling the MUX
to the SoM dtsi file.

Fixes: 97dc91c04558 ("arm64: dts: freescale: add Toradex SMARC iMX8MP")
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 5 -----
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi    | 2 ++
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index 55b8c5c14fb4..d5fa9a8d414e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -102,11 +102,6 @@ &gpio1 {
 		    <&pinctrl_gpio13>;
 };
 
-&gpio3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_lvds_dsi_sel>;
-};
-
 &gpio4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio4>, <&pinctrl_gpio6>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index 22f6daabdb90..11fd5360ab90 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -320,6 +320,8 @@ &gpio2 {
 };
 
 &gpio3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lvds_dsi_sel>;
 	gpio-line-names = "ETH_0_INT#", /* 0 */
 			  "SLEEP#",
 			  "",
-- 
2.42.0


