Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D3FCD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Pm0RvpU3HH/cr1nURW51vxgVUsJsWvr1G1CVEkJHJc=; b=AbPbv0BoEH5xXhvTYEfMQsL5WX
	1gX42mi48zX2kr8myTM0VT4zDvn6MpjOi/tH+Tax9jPC0RNLl8VcDz9BI3Pg1TzzPcgKqRa4k7ju1
	hSkZ/2bXfImXlTu5npXAWUUjlTSSwVzYY0sHm6sz0F/aU19g9rb6o7nMwL9ylz3RBXs+hntTDQPsL
	9w1Y64hDgkNDAVIAmIwx3dx4hWCerMDvVKV/Ut5IXvatmKuUkPnkjfSP1uuA12UuHQe+Jyu0FmTff
	2GZ+c+cQYjAEqxpCO5bR2FJ2NFSxvCbnqZTWUndgCZRucNbfmM47gp5O+gt2UMoWMOt49KGrJ7E49
	jPbnNS2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGd-0000000F0TO-0lvr;
	Wed, 03 Jun 2026 12:00:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGY-0000000F0Lv-2Tae
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:00:11 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-45eeea039ebso2936020f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488009; x=1781092809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Pm0RvpU3HH/cr1nURW51vxgVUsJsWvr1G1CVEkJHJc=;
        b=NiNZzTZJKkG+h91OXqGY7gDIybLMbcwlV0uwO1X3kxMfBgYQA0pMF7tY3lW5VBzPYg
         nvA0cdKraT7h63/A9Bmc7QXWfUC/7zQYtAaV7kHwt9vNSj3kwrJ6xxlTvjmHmRl03B8c
         uXkZVxt/EXjAfFEQfsApRSYlmqtyif4cO1fRgaWOIeYhRPzuY+X0AaY2FE3xcYR9vlsN
         qVxSHQxDfHawMp0M53wMUwBQYl7UELqLQPgbgcHkfk9/U0ja6bnBrk7KDqzzW/adCK28
         YfhXWsJpFxQw+hdnAtAIshHIl9pgL2WzAdrDPfAPPyqJd+OWGlrYIIgE7iKL+jIFvaiy
         9AQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488009; x=1781092809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Pm0RvpU3HH/cr1nURW51vxgVUsJsWvr1G1CVEkJHJc=;
        b=eBY43ozQxiXdXEwVkhGdMcekg4PQT7xjBIJrahphOQEl7wDURrf27rP0Hltnsavx9Q
         KXVRSWMCV4qCiJ2kx348RrfU2TYlVY9OX7zo3owvBa31M/a9HNnIrjkJkKmDjrYblClj
         geGbO+xErhBs+G88Abjy4g1wjuJBx3L36c/ejwkX+7xdydChdgWV2RYU0K7istIyb9Wx
         SB0tPKlJ1VaiklmsCZp1qk33n9Ix+tE586yqmWbcGjwHCtWcyvab466rZFdVrfG70f71
         TM6YCkE8aggKSDVYzrUhk3JRhcrlYReW8PlEg4qS0NnbiWxtEA2LJR6S5dZMftMYvy5q
         MLkA==
X-Forwarded-Encrypted: i=1; AFNElJ/fkJZkZt6g3B/PPfK1uI9sAlNOXhjWVNlP0kZyhp34Kl1drmtQgzWBEX8hwMRKus0/yYjWjDuRM/QUNfQB3rAn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5wbMEPaNHEQackLvO60AA+dDRNJ1pEtfYtsJPux4+6Szep0lq
	d4sAF8Z3u19nD775/0PX2CVr/Q8D26KeRl2srPWFatha0S2ePOnyXP8S
X-Gm-Gg: Acq92OFiEQjJJbdGTgSSGCjmXqHW/78ncVQE41m5QqrUIGzaKZmU/TOLuSnaO5HxahF
	i9+Fa+vMAv7VcNa/V/HidFs3uWgSJZa3GW4E7XLBF173aJNDRHcnXTREirsu3omulRplC8J6Otf
	ydy+NHaHZfsP14lkZCcE1CTmOnP3ZjCGmP+lCoFpv9ZwSQlnzFxqFGsBR9txHXzk3yXCMphJHRW
	34+9N+N7o5ikgP3uGowM2iorehhVbCLnHMBfg8bE8s9ox24Rp8g9t53fLR3cPCMNUTsqZQ4UCmc
	Oe1IYi14iSyXAeD2BY9k4blofmzUZ+VIgEmTZxlORzzCf5JA9AegQeqsdab/U7zqzLB7nQbnJ56
	g3SzvdyfkpMNqli7ouJzsB++6vubmLeIL/octkzAn9eJVj03L742Gv+h7FOyRH6EjFZs3edn/ee
	5czDNsVHygYq2ErDny69abTdCs6Se2us5uahRix2lhtLGya10nz2bAt0StPThKAvh4GIgr7hJf7
	Hb5Q6pAjrqklU2/ElNyP8oaxVHqtOZv6XoRmNneyoRnByOk
X-Received: by 2002:adf:f50b:0:b0:45e:f073:d2fc with SMTP id ffacd0b85a97d-460217a92afmr3856857f8f.11.1780488008559;
        Wed, 03 Jun 2026 05:00:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:08 -0700 (PDT)
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
Subject: [PATCH v1 08/12] arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
Date: Wed,  3 Jun 2026 13:55:46 +0200
Message-ID: <db8411dc811bd9fcc76ca72cfbfdade2b1eef99b.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_050010_853086_5B5E6DC3 
X-CRM114-Status: GOOD (  10.98  )
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

Add the FT5206 capacitive touchscreen controller on the Symphony carrier
board.
Describe the interrupt pin and touchscreen geometry.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 6878b89c4db8..9622f77f8f13 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -193,6 +193,21 @@ st33ktpm2xi2c: tpm@2e {
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
 
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
 	rtc@68 {
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
@@ -300,6 +315,12 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-- 
2.47.3


