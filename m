Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EB1FCC075
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UwJ2eq1zLJMsCb7zWFBE8c4gt2oUB4SlgMSSSoBm2w=; b=KA6v9ekPMaD7UVs5rwhGeDs+vI
	gzchT8bLh7R7AI4I01GhNhLOGC0w4K1hWoktTSzefmAJQ1/5g43H+luAP5AtviJqGDF5CjoT2BSrM
	8aPClGXOHnuPHqIxkiuj3bZDuwZewIJ8XHkdaQ+Hovs9RaCSRerHN9agnALRVPmdulB4SRgtTmh/g
	Hxi3dbWkYiis+a462gtNvxlQMZLtAvROORSdgmwa3K+L50zjBydXPMTYROaNeL5/mk+juZA+HlCAv
	Aqa5ae2vHhDr0RzcpiBQQDS5jWz7gvrv07Pe70gldJyBzJ0hEuhlI1oJKVSiOZ5Ug0BniXa6XPyyI
	mi6dV9GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyu09-00000005KFZ-2OQ6;
	Sat, 07 Mar 2026 15:55:37 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzw-00000005K30-0Hxs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 15:55:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so6918765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 07:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898922; x=1773503722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UwJ2eq1zLJMsCb7zWFBE8c4gt2oUB4SlgMSSSoBm2w=;
        b=SGt1C8VJdqdCg8fvHkku6QlPlftvfiI0z3ePcbX3uPQ4JWezICpBkeLpQPoIsS/VkP
         N9KIPNO4MXqxwJmY+W3xmhk/78gFUYDbehI89/OTAEjqBFlaY5OyNFVJSN2cZ0m6mmmC
         BIv/yW/hWJi0fGQF9uDeOTVNvHkr0eL7NKq6F+oHl4aJ6vITDCzpla8J5hdImw7mvKxP
         i0vHMAyksUyHLHd+Q7N2CFOWaYakTmR8fmgrz1bOLSIX0L0tFOP3qlj91w6XtRcz2/Bw
         TGpZsY74yKeQfTkYIFGGvwNibREjGkZ+Xc8yd7Zj2xohvgTlcfP34EsrWfzOS/ddsBlR
         /PHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898922; x=1773503722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7UwJ2eq1zLJMsCb7zWFBE8c4gt2oUB4SlgMSSSoBm2w=;
        b=SoMiHJlmVvEh3etIB3SvZ00K6Q4QVuVsd4pGQ9t4jMyj0uga3mHKSW/GB1mYGFLII3
         rRWK2YOW472bctkQoihWhGk+mufHiQnMk7Qeuw7Yn+IeotAgd/Poa7FUDODUPZ4J1AvL
         RkOGlwUcfDMx0toW6UnWG+vfDwuSMsNy0gAiuFgVK9sABHMPfc5L6H32Um2RHIrx+7mA
         nOkpvnAtO7yJDBNfjHdJQBL+NJpfVaG07bYD93eeM0DHNxIP38s+evRbQ/KaMko/En03
         hRuFdZxvItyCNH37Q6R1VHYatwCHgkJpLnyN1abFjn687hohEVdZaibwUpSM9YNJnvVr
         +ujw==
X-Forwarded-Encrypted: i=1; AJvYcCWUvNjdpZslPqrkhkOWOk+MIeOpI1B/uVuwxqVh226wsrs7LFe/lo3C2NBSP/JCMI5JySohS6teLQD7BvSwWnA8@lists.infradead.org
X-Gm-Message-State: AOJu0YwD8AZd0GJSpSuCeQxDJqEcHE4yzylk4ROHnNYj3PnO+7MaogjZ
	jNndb+VpSS/ph0cqAnz/dUAYqQO/ce/u95mSDqmbNhpf8qeucdRVi3bT
X-Gm-Gg: ATEYQzyqr1M/BzI8gT3BHmEXanSOBGcoSKTQy/nj3gibQf6n/T0HR97G7ShusrD5a1N
	PHAIweI9RWCRg3Tg/OezNcKBPRdBUgopNsYkw1kxkABd289fbrViqhNKW/DBkOC5vjXICEWGCbm
	uhnDklbX8Dsot1WE10wV2RiCZD/X76sd+07lPCs4VbSfC+p+e+N+G9alIRQI6iaF3782QnUTvpb
	aoOhVdItEVa9aiu8siH6/X1lntZnUvPYMsxz1OyHyh47Ncv5oNqeWHowu4/MssEjQFWgWN7zAPo
	pyfZvzBhV/DXOJniF4Jd5TT7/6u3MMkr11LK1u1q4YEac9xT9jiuaeu+xP/NGgZhEGVFPw9VZsJ
	oRTaXHIaShFXbSDbXHEXhVyFW31kKGBuCw6yB+8NYWT2njJxQ1rPOY4NehoTY3dEo3M7tjtrE5k
	AEHicQz+tPCR5HVC2cf7mJNozc0qNUiRJJsRQIY9urTEezTYAAEMx08I34+ITubrLRbMN0dhCRY
	mD/RPeQ5q0Jc5jWhr6jSYMouQ==
X-Received: by 2002:a05:600c:3e08:b0:483:7eea:b172 with SMTP id 5b1f17b1804b1-485269675a7mr104390265e9.23.1772898922163;
        Sat, 07 Mar 2026 07:55:22 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:21 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
Subject: [PATCH v3 10/11] arm64: dts: imx8mm-var-som-symphony: Enable I2C4
Date: Sat,  7 Mar 2026 16:54:46 +0100
Message-ID: <02dcc47d59674a9945ade8a6f2c42f4c0908942d.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_075524_133789_67BB4642 
X-CRM114-Status: GOOD (  10.59  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable I2C4 on the Symphony carrier and add pinctrl configuration,
including GPIO-based bus recovery support.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index a77085b264e5..9a29c81b06eb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -195,6 +195,16 @@ rtc@68 {
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
@@ -288,6 +298,20 @@ MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
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


