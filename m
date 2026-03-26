Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B94310A62F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 14:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jbxR9OjY5SiCxmkdnQnFn66JvcHpYqliCfFxb1VJog=; b=XWV9YnySeUhRp/MMw0GK9ycrgo
	gXpqpq6VuBDlhnPJloaJ2FM1R0AQGX/AJJtfK7Z5A+aX9JLOQnr0hz5+R7jlviT0UTRrtGyMJVV4L
	55ql8ZRU2JpHvy3VMJZt9Dl0pkwnp4TKUItMU1eb/BtknSIsedg1fahREGHqVTGVxX3pIkk/remvM
	6PBRrmZpAECAEHoM+TfDzVGzcPK85VD1kAKi8C/eIW4KQQZfAPDLsnpXUo+bses7g5O9AWdHx2H4N
	Pn19AL/AyhEdVc61n11RBONDx7so1KIzZxuMOExiAy4IynbjSYJfTYCvgZXQQ2+IjKEEI3qE3jUdr
	D8+GwPxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lqB-00000005fQt-42tH;
	Thu, 26 Mar 2026 14:37:43 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lq3-00000005fNo-3gwX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 14:37:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48704db565eso14952865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535854; x=1775140654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jbxR9OjY5SiCxmkdnQnFn66JvcHpYqliCfFxb1VJog=;
        b=YStOm+3d4G8WWe4yjjyVkJkUr8P/3WarN4LJGu6RR0DkhA4FTNxAhH4FRDvwMawtEp
         20fumCXvtTjPJ65/qQJNGq0L9zq3i4ll2TxSvldZfjKAWxKiepnI53dyqNB2neOCNjlL
         C9ybQSzJ7I3L1rSLyH/o5u+d6rh5p4hIXMGeSw0j2m0LkKWjyA3DBs/WLc/Gb4sEbqCK
         XWIhLbu7ypmopeDuSlniUOTva3Pj6Dqckgnj4sWLnRDSSCiv4krhJpQSPAXycCHlfQIa
         iyeged9y5gJaGrvNDosaBLx0+3/BuzhoO1xYMj7KrKesA6TOqXYFLG2ROtNSTm5xDnk1
         MiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535854; x=1775140654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/jbxR9OjY5SiCxmkdnQnFn66JvcHpYqliCfFxb1VJog=;
        b=qtr8+Qf4hacdXHrzAji7hnyMFcg6XNBaW01702MKPt5eMFpG3v0/xIh7xy6ytOovf0
         M6NI4vmKOi4DSJQ3AMGz32Ifw3PzxcnCvk1nzMb/Xno95s2mptyYbNMhZdUWvXZwgCHk
         L2yzZGUZZdgZjtfIFWjuN4KrNouREnRBakq4ED5XlyQaj8f7Ku+jmu0J9NtvkmJZHx8n
         O1kmmX00pBFUCMfJZ862aaiNqiB8huQu0b0SG0cP0wtvsvCdgO8QzNrquQuX1LQZ3voq
         K3lHiI/DzpXM99+3aANSSLHzwkr6wMeOMaEOzJnCJaUNc1LgTl6xCtEU0EJELqXQ7LZi
         7nJg==
X-Forwarded-Encrypted: i=1; AJvYcCUuOdxB7GIw0VVIVb18FNazCyZw6NMT2o8KF+O0NkwhfVX9Vq7GaGSV7itLVCLSGzhPDoJW7mTVWuskGSZBRBJm@lists.infradead.org
X-Gm-Message-State: AOJu0YzKek9LtZy9Rstvecqzrv4h8uzPHSCpp8ZXe+i3WeKKohVFVEuF
	SZMOjR+hNCqn2P21Agyz6tfooCQFayrUmxspXSny0A7hYONQ4UMgRfbC
X-Gm-Gg: ATEYQzyxvMz7RPq+gKLpUWDYnVrjw2PRtPo+3Ftz5m8IglbrtB22bMnJFFpnOXZX71n
	SnInyZ8EV7t4LbMEOa7hz8YI8SnmoXokS7KibF9P/CQ1V6prJxAtPq2XbJvPdOYxQ7aT0UyXFhC
	oijb9zaDuBtRAIjZ9XqH40y8Tb9807DbCt7Ts7vw1+cyfoplRcCXTdFkZ8H6RZuVl6q902+/gEe
	tsKKjvm09yFVJ7OxIN6ny6d8aTWfqSri2dyDzg/FYBzrGpWaXOV3MMTKFjUTaXL6gHNrKl/ip0x
	+6cJR1K3YJCwETxVezmmcCE8IF4+gDEYREVxKSqcVorFjZzVaIhWcMHyvmyNLyTWF2bRbXzquiq
	5HqmBEc4uv99Kv0jJFtmhctAxAzuzNKYSiVYcq4YOk1U9iicUwES5scYxQ8lunlrNajQvzEu0AH
	s7Y0E1eOuGgT0DyWJcDE86U9j3olYRUT8KuclP8bhAlVtMXe9XxQeKnzvlM+BRYVH/vrdlq2tHJ
	i40Dooo5fQwGShk2H6DBn+gT3qD7bSOJ6RMjYb4YrZNJlQbG/ZPxjzDddd0eoyd93vrAi3hVhNX
	lNFrNhGNow6SOW6HZ7CO
X-Received: by 2002:a05:600c:1f8e:b0:485:4006:960c with SMTP id 5b1f17b1804b1-4871605aa53mr122496665e9.16.1774535853676;
        Thu, 26 Mar 2026 07:37:33 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722cb5845sm34024185e9.15.2026.03.26.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:37:33 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>
Subject: [PATCH v2 1/3] arm64: dts: freescale: imx95-toradex-smarc: Add SER2 interface
Date: Thu, 26 Mar 2026 15:37:04 +0100
Message-ID: <20260326143711.143462-2-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326143711.143462-1-fra.schnyder@gmail.com>
References: <20260326143711.143462-1-fra.schnyder@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_073735_942730_D8C565AF 
X-CRM114-Status: GOOD (  11.82  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

The Toradex SMARC iMX95 has four exposed serial interfaces, one of these
is SER2, which supports RTS/CTS.

Add UART support for SMARC SER2.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: no changes
---
 .../dts/freescale/imx95-toradex-smarc-dev.dts    |  5 +++++
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi  | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
index 5b05f256fd52..7437e523ff63 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
@@ -210,6 +210,11 @@ &lpuart3 {
 	status = "okay";
 };
 
+/* SMARC SER2 */
+&lpuart6 {
+	status = "okay";
+};
+
 /* SMARC MDIO, shared between all ethernet ports */
 &netc_emdio {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 7a73958f6eec..1d369983cf7d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -22,6 +22,7 @@ aliases {
 		rtc1 = &scmi_bbm;
 		serial0 = &lpuart2;
 		serial1 = &lpuart1;
+		serial2 = &lpuart6;
 		serial3 = &lpuart3;
 	};
 
@@ -615,6 +616,13 @@ &lpuart3 {
 	pinctrl-0 = <&pinctrl_uart3>;
 };
 
+/* SMARC SER2 */
+&lpuart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart6>;
+	uart-has-rtscts;
+};
+
 &mu7 {
 	status = "okay";
 };
@@ -1105,6 +1113,14 @@ pinctrl_uart3: uart3grp {
 			   <IMX95_PAD_GPIO_IO15__LPUART3_RX	0x31e>; /* SMARC P141 - SER3_RX */
 	};
 
+	/* SMARC SER2 */
+	pinctrl_uart6: uart6grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO34__LPUART6_CTS_B	0x31e>, /* SMARC P139 - SER2_CTS# */
+			   <IMX95_PAD_GPIO_IO07__LPUART6_RTS_B	0x31e>, /* SMARC P138 - SER2_RTS# */
+			   <IMX95_PAD_GPIO_IO05__LPUART6_RX	0x31e>, /* SMARC P137 - SER2_RX   */
+			   <IMX95_PAD_GPIO_IO04__LPUART6_TX	0x31e>; /* SMARC P136 - SER2_TX   */
+	};
+
 	/* On-module eMMC */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK	0x158e>, /* SD1_CLK    */
-- 
2.43.0


