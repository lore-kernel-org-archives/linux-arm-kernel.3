Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C58E9A031
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXn4tBUxeH2P58q8ihGRGzP4M+/r8Zrw47NlkaisI0I=; b=Djj7l9HEiKNZg0rzDZDzAOOk8K
	LuEl/nkowdKguhE/IxkDx5mmrBuGEpyFyuPybYx7Kdh4Op4/6XxHqFlhjpeZEzAabe1ZKB/0Fiwmw
	68/BQCCFolVcWwuyOUxoGdqSDtZo1megdOKlIMWnpyHoPdbRHefwXCTxE1Ypm2PSxgc2KFh79gs47
	OVt+uwUZrmWrXCW0HpLPcjk8cn9sMp6O++sNqgc4yG420XUxkmszywSqHZ4lM8WM8y2nwrsYRPop2
	w7TrMpElXWMpkvnum1iupiOfxYwb62P7kxKRJC5przpe08IIVrbO7Q0lJyYjybX3aTohTlOmOyVo5
	vwol7r5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ33-00000008kUi-0eOj;
	Tue, 17 Feb 2026 18:43:49 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ2t-00000008kL5-0oGX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:43:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so50848875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353817; x=1771958617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXn4tBUxeH2P58q8ihGRGzP4M+/r8Zrw47NlkaisI0I=;
        b=ktkt9UdJawxXZEv0i/YRxAA3k5skK3K0ta1UncXllX3VXfB9+cLw9cjR2gghSiRaTc
         mhwh356mHWmqbSSbgpcIYKeNzqhSCxrlaSW/ayPomj5y8myPSU4fCZpfvdfbzIGj7Nd/
         LmYcO4sMuR3AIfAC9AEaa/wapDl6zuJnLZk6icRBetN5uz3zoIj5FfzzSLSKGg4y528L
         JIy4SJkcHXT10weUSxqe1ZvVnmx0yy9qlN7lV/T7KrFpyl7hBYX00vNizUpVXy6muWQC
         b1XLx29jl03AjT1Vc0wyZrCHE8LEiSvyrNV7386+//tJrh376Ooayz6z088jK4elPxcS
         T9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353817; x=1771958617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aXn4tBUxeH2P58q8ihGRGzP4M+/r8Zrw47NlkaisI0I=;
        b=HmKMnAjcRJudOmQhXDiLDrJ71fiXOV4ziK5S5o9QCBTWI2PSNyAGH+Sg7vAdCsq/EE
         FLnWsCz2Cu78BoR1VR8EZJs5pCI8Zzria4066iODwjgljumQU6jgi/3cefc5ActxPzU5
         2wIuHzeS+toHzLWX9oBQnLIiHraVn+tKJdoytq6Dx4Z3TDnzams1WheiywjvGqBJo+xp
         zxACOOnJq6JwYLjrW2DGb2xKn35j/JSb9g9OA6pWbM/RSrO4WrggFvIDTxNxdPJ8tRV0
         0mEkjA2a8lPgfpdzZfwnQMRFtV4BQcAFtDZWM6+ussSn1UJbDMlgq9Ot8LtQvwhQqaGn
         Lz7w==
X-Forwarded-Encrypted: i=1; AJvYcCWfknxKleUFfx+0Aiqu90J/SuW2ZJ0Tk/wGLDTdnCjCoZxGL1l/ePtlCAAmI2wNEL2Z5Ko3dsN3YP0FdF/dlwDY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkz7UdNajDUs0w4vcmlKoHNk+1ocxEIJKO7tIT7FUDh53H2ERG
	h//wvneYzoGVZtrSO35IkPYR/tqo9q9S8SpxwFozVoLvbT4vSfAXt7nt
X-Gm-Gg: AZuq6aKZlJKS3318LBPhA07IVQmQPc/673uQHRldruvLxYFkcz9mEyIWnyLmVvVU4ju
	P2TCBRdVa+xoie+loG3O1P8dcsy2zNcFIwO6ktFS6pnVuUDWTNOHtvHbP21FXawrSuE5AhIWqol
	7hbaX5LErB++nQ3Rk49r+MObOeb+x/A1/iOqfY1sFesRX43Sk8DFRXa7JhxhjGmbyIs2/sZYEIy
	PzGmPeXxkUz5UKfAJVn/mW7I0xhTI7N3nZdKFmAOC2Wt7HGjs2/068xZivhCpfQ8MhWhRIkMzOO
	iVaVYjnbdFdnXHJfDxWeFsbFF21sRgl2q5zToie53+5hgM7pZSI+19z2ZzK1sHCoj1seHlrw+2P
	3f2vkuevLgp2KwI2MvCG9dX4Bv3F1SHhAjKgT8zmzRLmqgbhCdicsGPmt6tI0/l3XKYwiqzJMVA
	omRvZSmgAWc/N6fjo0hA311CdEscCZ6zMVY2gIome5bk/DKKYK+F45G1g++gLilyqMcSN+yLR7O
	5MjqlgypS2O3USoxTxsr1tFaZIaAk0NPT+AuoQ8
X-Received: by 2002:a05:600c:4f0e:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-48373a1029emr277764195e9.15.1771353816944;
        Tue, 17 Feb 2026 10:43:36 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:36 -0800 (PST)
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
Subject: [PATCH v1 10/11] arm64: dts: freescale: imx8mm-var-som-symphony: Enable I2C4
Date: Tue, 17 Feb 2026 19:42:44 +0100
Message-ID: <c560f9a4d2de222deae6fe14d75478457fb46b58.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_104341_126743_4E004D9A 
X-CRM114-Status: GOOD (  11.17  )
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

Enable I2C4 on the Symphony carrier and add pinctrl configuration,
including GPIO-based bus recovery support.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mm-var-som-symphony.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index b4dba1961eee..3d9658edd58c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -172,6 +172,16 @@ rtc@68 {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
@@ -265,6 +275,20 @@ MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
 		>;
 	};
 
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C4_SCL_I2C4_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C4_SCL_GPIO5_IO20	0x1c3
+			MX8MM_IOMUXC_I2C4_SDA_GPIO5_IO21	0x1c3
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x16
-- 
2.47.3


