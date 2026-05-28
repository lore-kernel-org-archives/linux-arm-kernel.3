Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFA9CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 15:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bacy4e446xDUINsHvPqawvwpNkB6Ps47zY9T3vbwang=; b=rq0offT2zuJz4f4yOclAjIP27x
	SgbekgBNsidq4uxUb2sH7lMHnAXVQdLpmeKx3V0IdHGN89tbOr5wgACn1dtzwkbd2jqLy13k+vQ9p
	Sm/xCPfV2lIqhAHVIMlrYTGgxFLpF8kiN2qXZY8tbyEXDiJmYTPyCQHfK+VLv0UgIJ7nOYYafFqBJ
	ouHHzVAMfx2SIuMpdvoa4jdxYmt/vXF+csvV39Be+enfZhadjHCE1mY4QlxDTtTFJTgTL5Y9oryBF
	8ODloy571BhjxZu3pjVeodw9XMfpW3gnfGiOA/csktFAluw5LC/EWLrtR+/DHZxQXmjmIGHZbQvap
	iO8MbCkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSci6-00000005vWe-0OiB;
	Thu, 28 May 2026 15:31:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSci3-00000005vVr-0nup
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 15:31:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49041e84237so55207295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 08:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779982304; x=1780587104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bacy4e446xDUINsHvPqawvwpNkB6Ps47zY9T3vbwang=;
        b=WRldjjUns1UiLTMGk8wVgpyeSYQByvb73bjrYE/pjdsyCEWwOKdPgA4NX3HG6tuOxO
         PuC06+o60eO8Q/E1WMG5a9TGEJOnai5VfnzOThbR+wIIe3OopWzuB0gsB5HS1Hw951F3
         Dj3u7rNN6Lrpzv+rOOgZYpqbPsIgIoNmgt/IbDpkiz8ejeNnzKXPOCdSW7DNbQAoF5Ms
         cLZngiCDmu1JbiiFSiTz2nTEcIVCekckp2o1bQwWMxSSEFBHyLHjf5+PwCRjUIqEO47h
         DI8kfkdcxFD/gtc6cfYtstAvH4GIrTpMvlcKRnBkUw2gtGTNh4GaasFBDBKNn1HHediY
         ruUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779982304; x=1780587104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bacy4e446xDUINsHvPqawvwpNkB6Ps47zY9T3vbwang=;
        b=lQPrVurFOW/9kmwVyUmlSO1iGBAst6jSSTHlEEUMTSvexWSm0mNIqxyO+ErH3Qiy33
         or4UD53NocB/+7eGo8ee09LgaNCzd0bsoENIWZDqeTfaM3PBsDnxRvIGKXv20QMsR5gH
         zDsqzNoUizQfb/Px/rTU+ycsSPCGZzdjStScjT2GkRAoyrt7/MntGtPjDoxi9NY3Kgqg
         A2WF/Dtr/AUTgHoFQG6ANRIwnrAMbVyayRxOt0/37b16vJSjlwOTFptiRrWO+Ps1ZbDy
         tX5Js0rcXchEnREwCnqZMIsGx2vs8qxp2dStjRGf869DFEM8rUcLZ8/tQqTxRaVO3gz5
         7sIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8DRRNaNa/K4B7BB18KCP34Qvf7QZ6PLaU9+CXvxPlstOMqMRzKZ/ksEEBBVP85htB2MD/a+NTRLkfwUt1ro/h1@lists.infradead.org
X-Gm-Message-State: AOJu0YyJe488bKCSA1SRM1cLgVDBQLZnmw5XmY95+BmSBzi46bCpthGb
	jmu7OojSsXdPXrlNO+/64o0q481+9t7QluYiS9inG6O+CIojpPdnfiHy
X-Gm-Gg: Acq92OGJUFLEKhz8l7WiS9rPRyAolssgqY9q+2p9YjnLwvoHR99QcZ7jX5Vj3HBXbYA
	AwtsnRspZ40BwJ/36Eqv1x3Jpw9nuiq4n2EWCO+HLU7Sm8K/wMqSbzNwGe3GHmF8lw82mlx+H+o
	WTpnyUh6XfaUpS35iBq3tC4dfEjNgBAfmapRMZSCw0RN0ojuyeWytsVwulI6QHSYY/6Qf/QcOcC
	xw/HB8fiH98mdZs51ccOuU7L++USYSkfY/xGeJS4Kc3UKlhTzvZbAa8Ql3rW5+zJ3fqFdIIrCZF
	zYMIutwKGnFGTHUTTy+j5JONTsmrhLaXUa3O61mfKsWbhd80VL0otuQ31I+OzP4rqXWOYzuHPIS
	rWc7UjGnynmFDlJEcRSF0z01Cx4FGFJaTnhHAAJc+JCCzYTWah74t7RUv5ZKNRvew2K7lZucVoJ
	kfiShJXB6fzgVmDelI6c+waeWlbfqQ8zjRlmDbcsENOYk+pOA9bD9/WW8PWIYU44UwaKtq0eCXf
	38sfDgw+tDcBYvXlya33Qx4ax+N1H+x/2fW+HArQ/IdrZgQ
X-Received: by 2002:a05:600c:3484:b0:490:3d48:6cb9 with SMTP id 5b1f17b1804b1-49094785aeamr33289415e9.3.1779982304346;
        Thu, 28 May 2026 08:31:44 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a82ea2sm83282005e9.9.2026.05.28.08.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:31:43 -0700 (PDT)
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
Subject: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: add CAN controller
Date: Thu, 28 May 2026 17:29:48 +0200
Message-ID: <20260528152948.15209-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_083147_251778_7FB327AC 
X-CRM114-Status: GOOD (  12.49  )
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

Add the MCP251xFD CAN controller connected to LPSPI7 chip select 1 on
the Sonata carrier board.

Add the second SPI chip select GPIO and describe the CAN interrupt and
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx95-var-dart-sonata.dts   | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 0f3d2e488f4a..62133b40d64b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -280,7 +280,8 @@ st33ktpm2xi2c: tpm@2e {
 &lpspi7 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpspi7>;
-	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>,
+		   <&gpio1 7 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	/* Resistive touch controller */
@@ -306,6 +307,18 @@ ads7846: touchscreen@0 {
 		ti,settle-delay-usec = /bits/ 16 <150>;
 		ti,keep-vref-on;
 	};
+
+	/* CAN controller */
+	can0: can@1 {
+		compatible = "microchip,mcp251xfd";
+		reg = <1>;
+		clocks = <&clk_osc_can0>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		spi-max-frequency = <12000000>;
+	};
 };
 
 /* Console */
@@ -442,6 +455,13 @@ IMX95_PAD_GPIO_IO37__GPIO5_IO_BIT17				0x31e
 		>;
 	};
 
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO35__GPIO5_IO_BIT15				0x31e
+			IMX95_PAD_GPIO_IO22__GPIO2_IO_BIT22				0x31e
+		>;
+	};
+
 	pinctrl_captouch: captouchgrp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO33__GPIO5_IO_BIT13				0x31e
-- 
2.47.3


