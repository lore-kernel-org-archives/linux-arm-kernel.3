Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76972CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUFEbSrxjizvOlFmP7SeRCnWi8SYp3vMPq4IB/dpDJM=; b=J6a/iKTGTOYYDyICd+T/8VTNVh
	C5AI9X7YEJWjXN37d4o/CuZ41xuwcfRAn63/cT9NmdyDFcGuUd148WgBbHBSmPlFI8tJmss5wYL8/
	ZNJhOiwe20Hx1J5wPao6HZsFDLw+geMRce7CcbnlpfaSsW4lGlsr+5pfZa1icUoGI4SG8lRGsj9y8
	Ny/krtxI4dFgnZTne6iX/BhektZ65SgcH257xXR0juazna24lZqxwlWkfz0QP+n5xQF3S1ihO5TUN
	d2fVxlrbscUEfDaL1hLATsoQE3d+97vjnYB7tN2OgHVgcXYJ+K/7qWV5oQbMzCxrpsu3GOV0uB6ae
	chxM/7Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAR-00000003o7o-1gfD;
	Mon, 08 Jun 2026 14:41:31 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAM-00000003o45-35Xo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:41:28 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso2249165f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929685; x=1781534485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUFEbSrxjizvOlFmP7SeRCnWi8SYp3vMPq4IB/dpDJM=;
        b=oy5ekGeQ/at54Y6WIcfR2q7T8inZUDkN/so4DyrIR3AHak40Cj74DNGZBP33jp+mW8
         iHdrfubOnaMppRLjAqFcIQGDDrU2p3c4ojwzUWWwglT1sRrR5e9fD1BygP9FeNw4+aTq
         tfjcfvnw2C8NIDs5jQS+p1aCzZijEax5xv0w7eljEsbM+3MyrzI1xhBUEaL5WIF1QQZQ
         nVQUIL9vhBf7jKNYgEPSbzxTeF9HzEL9MttGf8qUgnbofyQsOzohO4NBRnbEGB9Rxe4B
         Acd65/AntFGrzGmf2jnExNIUbp5X4k5953gveJZT564fNxVZOXMbTdmFb1ubdyGoERJN
         UgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929685; x=1781534485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TUFEbSrxjizvOlFmP7SeRCnWi8SYp3vMPq4IB/dpDJM=;
        b=A8A3PXyBvyCqi/Pc7tpINvnyqtd4iDSKsnlnrJRb90XjMIIfqQ0N78MKVmPGL9/Hc8
         QYQFipnSc8bduduiKFlLsOxRa1LOHcw8jrAk45yrvWRveiG/7Baf0EL53ay6IZfwjVCp
         iWgojRGOp/4bl3/kgl2hQn13tDe+bBLQE/DgtifQ3j49j5uFmQG50vj0kD16lKqhNQ4I
         d2wsE5ZaYd7/lXa0FpedpM0eLtMBm4NA/IbvaFwkvgecAKm1A3+y4Dluz9acvRSVm/9W
         Wgt+/B10nUWy9egD2OziOTrgA0Hihq4+6fBUkZWBZi6TTdXERV/5/TmORH8Rts3cDdV5
         harw==
X-Forwarded-Encrypted: i=1; AFNElJ+9/dVcCSLJzBcVA62ELdowR9oCBIwmadxsUNuR2J8olLoblTU7rw8DT9HAFyZlhWQcBhgHKjtouI21RLktXLmX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz70XtTvd82ZUfD2Me8ny+awR+G6omnYk1/e7OU2OAk/+O5+vOQ
	V0mVzz/lz+n5kK7/GXgv0wXQUN7h5ZeBfUTKfFyV8eHXD5kc3NknKiOh
X-Gm-Gg: Acq92OE9SROs+ikf7rDFa3Mj36IBgDzw8ctFHVeeBb1VgWEsSR+sPwc/mcjjyyn1dOV
	a73utsaGWh4+w3eNIC5tgHyJFEzcvdeIGbCrTwUzaBo2PN+KjGIdrciXYsbuh/w+hKEPGX9Jrlb
	sSJT6VqHVFrFC+xLba7OwW2TJUT8dIY80grE8Jzf8d/2VxRKlQIyEg1oS+ompJZigIr9LJ8BTzV
	UqH4vb+z8CwAB1EgUklqhQrCDJ+uE2EL/Wz2jkELzcGyysIJADSguF1jLdF8lytYoYrzJCyng/N
	mxQwvv+q70AiDzUYNTs3KpS4hGN3NFJw+f3WtNpk7plvWi02GciPa7ksZlsqccXh34u34rJBfp3
	jNh1WPZ6oRQFJwvvRjaXmA7Uyn0n2I7C1eFuf63GCMT6s08T86LJwEaLJllz6bZywTkVyD7TVrv
	ky7SUE4cxI8T5U1P2n/T3TyMDJMCQAqXbm4OR7VxX9j35Cp/MTpRYgdk6i58+N2VIlLsJzw7tVr
	Cf7o8iVJI/MUYAOA999ntP+Ppk5XDZWHoUHNIMUmyJKAPPl
X-Received: by 2002:a05:6000:189:b0:45e:df46:ba30 with SMTP id ffacd0b85a97d-46030630642mr18072389f8f.34.1780929684703;
        Mon, 08 Jun 2026 07:41:24 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:24 -0700 (PDT)
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
Subject: [PATCH v5 01/14] arm64: dts: imx8mp-var-som-symphony: add input keys
Date: Mon,  8 Jun 2026 16:41:02 +0200
Message-ID: <2a02e17dd1cf516332e2f86e733620d58b9a73b9.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074126_797289_EEEA85C3 
X-CRM114-Status: GOOD (  10.97  )
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

Add the Back, Home and Menu keys connected through the GPIO expander on
the Symphony carrier board.

Also enable the SNVS power key.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 291f65e36865..25f707012f62 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -13,6 +13,31 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-menu {
+			label = "Menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 
@@ -72,6 +97,10 @@ usb3-sata-sel-hog {
 	};
 };
 
+&snvs_pwrkey {
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3


