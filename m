Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDD5CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OC1wDCeyooboIhfSEf5L6MjWXV2UqSS71W6WzHJhc0=; b=TWSBA8pSebDDfFBySet2HZB/4c
	cMI6uwnGleBaO8DUd2chUL1VXH/LD9813UqEKglxS9Rx9QFSYLTjCly2DchlSFZ/KXTCzuQT/jMZf
	93ic839wCfMeF5P6J5emvczPOlY7/Zw8CG1uH89VCx9qBurhcFm7CWx+88DAsnEcZtz8gI/q5lO8s
	BrcgVA+dbJRjpHp7a8FRFGErNt4vNr4O3x68SShgsSa3dWN5Hz+LyXfRCXcgQMEqiIZOGgeoD8iM6
	BPTp4ZFyWEotfIVdl8dvfgxMuhD1MgC5yhSa1FRbMxZ3Gli2sw9QqSybldOXJ0gXHyWSGmCjcnPfh
	17Jdzw4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGh-0000000F0Zf-0dNH;
	Wed, 03 Jun 2026 12:00:19 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGe-0000000F0U8-2gSj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:00:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490b64c8311so10155355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488015; x=1781092815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OC1wDCeyooboIhfSEf5L6MjWXV2UqSS71W6WzHJhc0=;
        b=hLPl2xC4/QumBxQZqLhriuqXCGPo6scwk/2R+fO5YYP8f+VPj8Vtv1bG3d/8bmqj0O
         Q7dLN6RRFtSvLxnR7ClzDVngdVCB9V8rXpvd7JaEf8iXkDfDwOtZW+v8s8cLJttG7F9M
         YZCfEoYXlSkhBQPIP5BohWGPPXTvRr/4PW5XTbiNJUrhuApypjiiH3y2k0Y02ze/2ciX
         2VB1G2PR5gxgi2+5b6funTZPeFb5gF0ud5wxh1KrU2l55rla6BFvw5G2tmqZedwARxxx
         6j+0P09YIBlgy9zZXIycq0Q8uz6TbiM8xLcGqfEzF6Qn1aj4Rv+aSuS1tiLNS9ir1jYg
         xxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488015; x=1781092815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2OC1wDCeyooboIhfSEf5L6MjWXV2UqSS71W6WzHJhc0=;
        b=rpH7bqwFpH3DgSKhKj6kWoVKZ1PgeQKkGF5eVLt/BontoM6upxFJCpSeMGQCb78qQD
         AcKWb67OwdRn44N2C7Rf6vFCInszzh23UyXjqx71sRWY2saRhIGG4XTOE+qHzSnYZpxq
         0T2JTTgclnqdxCC6IpdmEz603n5dbRF6Y9RUY0i2+E9nem6RRZOcLVjnwvA85i3wI4bB
         DY/8aZOEAxVUA56kmjeRhA0dxUvVweg4SKNFnwsB3+MjHUfTDSAaYQ3B2ojpm2vPNG1L
         nYJIo8GLfagnzIMNk/3QLAgIp2S0Np8QZmkW5uSq8ZJGIWxUeFKoy/iSm1OF40rE2893
         EVvw==
X-Forwarded-Encrypted: i=1; AFNElJ9piYpaKNIkiYB48YYuAeKt7Gr9xlPGpjHMQy9ivAVC6PsDUXJ6dysqJa+/TIQ097y0BK53wZmrQhH4tStUlKAi@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9D6+UbtZxAQsI4nGqNcW0kfNUgiVpViyM1C6NzPMP4fjeYLkL
	J/cZUs49dTD5zQsLiDjsV00UrPFPDI0KK1sGFrbA0lFUpSLJWLDG4BeU
X-Gm-Gg: Acq92OFBHzv0xweq2Ylk+hSSxgEQzcMxij8Sm0+XHLgl3+SqHhPUr/iSUNb3Ml1M5V6
	im/SSWWlvV+XZ5RC66RbWB5EWM3cxdJFt/2vuCAFr87fSeC1ymtPULIHFTs8nDhi0w+wunZNEwY
	G+NFjKnJIdhh+TLv47MCx+lGfn6Z9HOtYjsj9OLC6ug4P7nQ1Xeo3jOafHoFJ9Ry486kEs0/AfO
	/G9zkmhBCY2e85e9xXbbpS9Js5XIoolClYo1IQ/0Dp9L3HOGg3i6fhX7i+y69GpSFncGv36Wn9L
	wdVcFX6HfoIaYhhiTsNmLadRXgYuuSfPBWFrV0oR9RKi7TZpd7u3aWYIA3XkVoz/CpuB26ss2Vl
	zgA+0K/RhSOdxkPjMfDMZR1ampYzYDaYQwj9stDL+sj7jAhILAAdmMY3Qul+Sl5GjF7g6pxWBgw
	8OsyUt+ZMdmhvbLTCQUl0I7QckX/K9AMjny4dejQe/NTaHXPdRALk5lv/rhgTv/hp35jGVHRT93
	KPuoF/Hin42cUchlrFP4WOLG0TtvHu3Pvmr/P26Y5J+433Y
X-Received: by 2002:a05:600c:64c5:b0:490:52c0:744c with SMTP id 5b1f17b1804b1-490b5ed43cbmr49272055e9.20.1780488012933;
        Wed, 03 Jun 2026 05:00:12 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:12 -0700 (PDT)
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
Subject: [PATCH v1 12/12] arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
Date: Wed,  3 Jun 2026 13:55:50 +0200
Message-ID: <9924a29ac63d025cee7a91b92e11486be46ab9b5.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_050016_698342_98CD6F19 
X-CRM114-Status: GOOD (  11.83  )
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


