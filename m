Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6D2CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i8fz5rrixxcXBSE5i7ASUW+eSqUQor3TCtORJAa6UrU=; b=SImgRUOB51BhLK5o6h8wRJedPc
	gFYbddFC+dcjx1N4Rzm9q0tP+0jNpzv/19mpt5xhRqjFqaNHeQDlW55I/lMhlkPM/2RNSFctJGE1a
	ZJFoebDvk+MYqCghkwLlW4QnWgLSFh0gUhrlnRUWIPcV1VQRsmg6gVJkBq9R5u9Qhq6adbXrJkCst
	XX2Zrr12CBiO+sgJSOVIHvLA7KZ0U6FVXZA095z312qN+dh64d1ReafEvqShB3GlXaVIX8q9YxVHP
	qpo8t4/wEFj623ZOvclnoSUYJH8XSklyVJ4+Y6eKp2pIw37TxIIEu+Aevf3JgDopp/f9Fd5ZtjpkQ
	1nCrKViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvM-00000003HX8-3i7x;
	Mon, 08 Jun 2026 10:09:40 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvJ-00000003HVn-3oBF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490d1e54b3bso2914985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913376; x=1781518176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8fz5rrixxcXBSE5i7ASUW+eSqUQor3TCtORJAa6UrU=;
        b=Cb3LlQJvehYUzuGvvBVmnFIrgZo6+SPpOKuvRoupJ/Zz4W/7ksmwFZPtayIzwITcQq
         6f28Ya0xpG04/s/NPpsCfy7rMhs9SaMliB6B3HO8BjoJyuarxHUDcww6xdYraaMb9AO3
         t1tPE/OqBXllMEyUjZdWBVt+sZHBptQ/AYbPFBbZbNMQcEEXmzEsOhA0q4vkKjif8Orj
         vHyqBmLRo6tlVrq18Y6CwcmE/bFOoyTquWya0CZD7Zzb0zEgQ7z0fDd0Z0I7MMPARu6l
         4G9gwYAa+lBlLt4h0nNS1aOij0A1kLAOAsWL/9g9CeXBSN5qUmRzBEXleLv3ZktLmKgJ
         6meA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913376; x=1781518176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8fz5rrixxcXBSE5i7ASUW+eSqUQor3TCtORJAa6UrU=;
        b=c7XtfDL50WNkbBRgvINKVaWh6HAcoOmSIf+/3N7/7chIMNCXZn6HlsGFQJ+6cDOSNn
         WF46hMXfTwyfppSqtqiRpzEAEe8D/oouwp0bxlNYAYGWbZZRpcKVPmHOD+efdnx8TaLd
         O2RdX4siJZOUa5ccB6m09pbnAyVBicK2u9QeT5+/jf7+xYuYexvlQtxvU6POxgslWiQU
         oqlZ/lvozDV4bPUhPK2Mlv1Fr/O+mIEFqq/snV5qbhCGfxLjwmKg7P/7v8L8PQNMCh8o
         UxTiKDUBcvn1NRLoPTYCYDoc/yP6eeDCiVvbAXGisKB4Q10V8ZwX3wgQDJv6tSeTncZT
         Q1ww==
X-Forwarded-Encrypted: i=1; AFNElJ+1qNSX/Oo4kIFnFywmd2VFAVHiZA/aEFAPn4UlMDw1++kzR5GO734Le/xvFwmv+r1DDmuKmRSQDGbiFzR804X0@lists.infradead.org
X-Gm-Message-State: AOJu0Yyasg3LztYvHXqOogE4FpWHJMV4ZePNbSvB6wurSzaaTNaRv0wA
	35rBVqYkysZgE8+DSiqOhWmtZPDGQNdJ37NNDTaMZLvx6Eno6LPnPPZG
X-Gm-Gg: Acq92OH6oL4VMmmWxG/6Skdg+4d6NVpASV49AvdomfNfipEDiCfefZGl5TzKw3gYpUn
	KdGUAk9+a094QcMx1aTATaQi4ilwgd65DJKXre7K/HoJkVl/lLE92rR1eTaWQLHlWWwImcuQoh3
	yUGQv2XYzjCakpXp8GUmsNOoA66YgzsrityipCHqlPZTV7ULtAkaFse75GeDsWmX24dlSkhLh0p
	VvNtoVJ/X+l9PMScSF6jGRAQFZVRQAB+3qltbWdo+h1DiBQr0xN7vqB1De0vmYdaw5/PWx/Eunh
	eQWEsy0NC24FRsfgZmNwf+xQOZP2lgdYj5Dnn8zDINVxxgAhDruTI5nM9belOaHx0fP23utJjQO
	9llmZOG3yBlriYZ73psEokI5CARTbeawOKo3nhf1b9G+wIqoYzugB8WPdtEHKfvXx8QJcGjZGuH
	EZrYeo+1KmO1V5HZbiBpkK8ricHS0J4gPdCuDj4Rb37HqWRAAPz6GUvpjED5Bv4omP2vYPP2zRt
	MEL167gqHWTBdJtXfDWS25R4nmGp056dcRoVRBn187EMIpp
X-Received: by 2002:a05:600c:8183:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-490c25c6625mr215034015e9.25.1780913375963;
        Mon, 08 Jun 2026 03:09:35 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:35 -0700 (PDT)
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
Subject: [PATCH v4 00/14] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Mon,  8 Jun 2026 12:09:18 +0200
Message-ID: <cover.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030937_992796_555CCD46 
X-CRM114-Status: GOOD (  10.58  )
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

This series updates the i.MX8MP VAR-SOM and Symphony device trees to
better align them with the current hardware configuration.

It adds the missing board peripherals and completes the related pinctrl,
GPIO and bus configuration.

v3->v4:
 - Fixed USB irq edge type
 - Add HDMI HPD support
 - Add pcie reset-gpios instead of deprecated one
 - Fixed eth regulator

v2->v3:
 - Add FlexCAN2 controller support
 - Add FEC controller and MaxLinear MXL86110 PHY support
 - Describe PCIe PERST# reset GPIO

v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline
 - Adjust PCIe controller configuration
 - Update PTN5150 interrupt trigger type

Stefano Radaelli (14):
  arm64: dts: imx8mp-var-som-symphony: add input keys
  arm64: dts: imx8mp-var-som-symphony: enable USB support
  arm64: dts: imx8mp-var-som-symphony: add TPM support
  arm64: dts: imx8mp-var-som-symphony: add external RTC
  arm64: dts: imx8mp-var-som-symphony: enable header UARTs
  arm64: dts: imx8mp-var-som-symphony: enable PCIe
  arm64: dts: imx8mp-var-som-symphony: add HDMI support
  arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
  arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
  arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx8mp-var-som-symphony: enable PWM1
  arm64: dts: imx8mp-var-som-symphony: enable CAN
  arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
  arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs

 .../dts/freescale/imx8mp-var-som-symphony.dts | 397 +++++++++++++++++-
 .../boot/dts/freescale/imx8mp-var-som.dtsi    |  12 +-
 2 files changed, 407 insertions(+), 2 deletions(-)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3


