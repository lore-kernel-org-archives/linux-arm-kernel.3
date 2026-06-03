Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1222ACD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKKJfzXLLkRH7XSkPhI5X70VU7gNsq42WXvtDW5Ht6c=; b=1DVBYcDQx9X/SPDDWFuvqU0Bd+
	W6pUL4fInmdxgJSbDvasGZQIssM3zlLZolx0GGQwCGf1GS3eU9Bt22w51Cxrar+ddRsejPofjw3Tm
	1big9TyL2EwSoP5bDWhh290tF7JBXBQiZpXH14j+paROBP2D7FtY5lbKCTbG2sNWmF9HhjQDNP3Yc
	FNxdDfkm0PrX7rXWd2tdNfIE3CWz5bf2uVYPfSdkGDlZTg5YTUVzcdBxUgjb87GmRzJmWWpCD79ED
	bg2EcU7M0HXRdPjbatAOd0/IcXeouoTj5PbfyUOq55UbLvyw50vQqvCQPDt97KJUIcTYpKdGKu7Kf
	2DMz+g8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlPF-0000000F8vF-0Dif;
	Wed, 03 Jun 2026 13:13:13 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlPA-0000000F8mJ-24ny
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:13:09 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-45ee6d32402so3666684f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492387; x=1781097187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKKJfzXLLkRH7XSkPhI5X70VU7gNsq42WXvtDW5Ht6c=;
        b=llYe+xPhwESDECCag7rA3x39DoWTcH/xJ8zfGc7yWC4TxwebnJmb3O6urVa7531jeH
         gvoQNvjelB+4x7NaF9aUPe+fu/SM11rmH3G1ZUCgKjWRsV36MSHPU1IGrI5RAqH0lW2p
         rUIz30wC83PWe6Bcpc7lPgH0Ny83TYSeG+CUgqZO5CY5dvo67sarQzJubTOfgRrjAztS
         tfxaPteZFvf2NmR5PA/sS9Z+tohOrZzUt4VZ8jcUE7nkdcZQ/0tFvCARjpqb3t73WvMr
         SepD3vdPUd5njC0XY3QAUqxrX2UeXFXEzW04n4yTxwNHVUistudyBuKHHWxQGW6aCIQE
         lm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492387; x=1781097187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CKKJfzXLLkRH7XSkPhI5X70VU7gNsq42WXvtDW5Ht6c=;
        b=RoXQfayfwEP6Rw8k0nJmC838JrAJrH6d8IrDrWu9VMpY30Qxj2Na46oqMRKEP42W54
         Cx/7iopvUfXJ13cWQUETPBkJmkLc3DwCSLbJWpTcuowBMpW6Zhk6Yr79XnOvpcddloDc
         aZ97DuwNKvx81N/hLq4XxTGTaVMgIDn4VvsJVmgdBUoEb6b2duS7dRM106kL28ThbMVg
         PTD40p2lVdieJJJZ+unGTwV+G5hk8Z9TUEMUJhzKSPZWFi3eNEszChoBNiXqIZxD6nrc
         hfbv+6arQdcvaGnB3TyRgoWqf7fgJxiYHzC4pt8Is669NPui8R2T06zujzsFEHauiUO/
         h5XQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Gxo1paFit2PFFpa3b9BncrDH88VQnbTtN1NAz3gEa1pwRYvFp0U/ab8qSoQuq7zQzj+97S6PSCsx7djMObF79@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2y150i6rCuzjBOOgii6Qzh7XaiIS5xjQbcQGLXt94ALSkfN+T
	CyvvkbgbIWNFlf7rZUvcBlB42y2kcx2diU3NWgpsS7WE+sb/yNiLm8R6
X-Gm-Gg: Acq92OEhBmqyos+0H5R8UxqMyojLL5zQt58FtuIcGmBlgO4nkkT1gmsv6eik2MgoN0L
	YQ+pJlyNyqF9IclE77rjZFogdt1u1/kpea4xvnemty4ccPpYcIn/Zh3ujmW+IMt9L9RPi/2ltq5
	/wcX6CKyrNzMP02QPfYqSmZzc6oTqZsR8F2PqLo/553WaH1Txh7Wr6hoH0V/0BwdTZ8QxrjkHla
	BFNSgGSdPNG1Jtn3bZU7/3ZEhsO8nsIdA+Kl3gr9CBTLBXEUVpOH1qzL0Yihql+6PIQTO+zKPeo
	tgTsrWgLj/2XBWyB11vMi3kNlohUWNTpgao+OPP1vshqG7DyXYAfnkXtl9d1vyEcCqzx+qWUxTc
	2nUTgjHJmFf/mOryamJXndJz5G3hejhA/ddIMOvMhuFV49kvFYIw+pnAn5WrDSCSNG97vvkbvoy
	kD2Jd3fiEPMp19o7XFsWKaRKZngvxJt67MxcSJCeoYZE+k8cdVZXjUh6shiY5wPWHEQPF6pfusG
	+bge35YRs9ofY2wKoamMSaE6ZgQfBcOydvXul4vJUaW2XXK
X-Received: by 2002:a5d:4384:0:b0:44d:1338:46b4 with SMTP id ffacd0b85a97d-460217924aamr3428115f8f.9.1780492386487;
        Wed, 03 Jun 2026 06:13:06 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:06 -0700 (PDT)
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
Subject: [PATCH v2 12/12] arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
Date: Wed,  3 Jun 2026 15:12:50 +0200
Message-ID: <54a90899d068a4281cf57d2b17bee4616a75f6a2.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_061308_556860_4EB97762 
X-CRM114-Status: GOOD (  12.11  )
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

Add the GPIO pinctrl state and GPIO descriptors required for I2C1 bus
recovery on the VAR-SOM-MX8M-PLUS.

This allows the I2C controller to recover the bus if SDA or SCL are held
low by a device.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 49467b48d0b0..61786eee0e82 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -180,8 +180,11 @@ led@1 {
 
 &i2c1 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio2 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
@@ -415,6 +418,13 @@ MX8MP_IOMUXC_SD1_DATA5__I2C1_SDA				0x400001c2
 		>;
 	};
 
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06				0x1c2
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07				0x1c2
+		>;
+	};
+
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
-- 
2.47.3


