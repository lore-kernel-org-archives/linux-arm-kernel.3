Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7BEC56203
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENdcNjudCZOeI3PUHLeXLzIdft7hUCMR4wfbEPD2azw=; b=MeSZ+o+IWZGmPn69qY/sLQZZ4h
	2p7s7lq+mxNLN8Z3R3csyyaeHeqtq5WkJUDct8f5R9Tbtmz2O/fTt9LjpnoGQzuiO/NWhUDV5PsV7
	DsYkAOeM9VqPU/yQAL2vfxxoID+u53wV5a4kG6rIilrUYMAk64c/7oASa9FFAoU+pFc8vPV60jLlf
	bv3DUJX2WDzdXS9blwZFPUIUX0oct/ryn3wGbCB4E0JejsG714TkzSj8vZk7rst2NUCYRKedFwFZi
	plrCpZDMfLYUbv5DmxIE5QJTnqjxfySGjlLBaTWq4esXFzJvrDsffdhs4n2PTeXJBJkZafkIC4oiy
	CFp6l73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRX9-0000000EokM-41c0;
	Fri, 20 Feb 2026 14:31:07 +0000
Received: from mx-relay153-hz1.antispameurope.com ([94.100.133.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRX2-0000000Eoex-2aO4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:31:02 +0000
ARC-Authentication-Results: i=1; mx-gate153-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ENdcNjudCZOeI3PUHLeXLzIdft7hUCMR4wfbEPD2azw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597849;
 b=qM1GqVhvPB5yLBCHDP5pA9XOA3lLLAWKXv2vPOL2xbMmPWA/kSgr0iFc6EqXNIu6j8hxdqa/
 GoJZbVep7ZdZjiUh7BbA/PUk5T39SDnbMEuKW3G3fH/Xe+Pwowe7k01aKRSBNlInDETlsUd68yF
 6oiBc1O5FsNBDRpQ0X8UUzTNO83NrBLPwBCpU8BNZlvCGI9KbXmSXZDyXZz4DWYCmipmDg94EUl
 eAwYaluN6rBSqJzQ4L8JG1S+MRUnfzP8ByQFp6KxQu53ylMdwXB1+pWnxQL9g/dkKt34hCIZQWm
 SauaS84rzQio3kK6XyZy4bjg8h0/YS63KzV/seGCWuD+Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597849;
 b=ZUBnY3gEonxK60VIMy72NOABD4Ew9JHn8N7XILj/x4kvBgMv3r5d75FJlLfHIUmXy2ItYr1w
 lZMvs9F6ezAoBFr1N+C0OdGmZcqhM5AYKfjmLNQyj0jwyPf5mRY0nXly2wl0aUBQfhPkyuThiYB
 yQwWNTlPb78rwZFOkSU7xgxPhycZpekfwve5vh2sZKxtG/HkABGzByE83RyCwijroP5AQF2zj5B
 sARhoNZ4OgT62MoRQVXEJipoAvke+hX/+gvBActG4xIJT0c8WFjLehnVRVtrp44JqWnXXXpdEgx
 TzNAU56wlGZGdJ0dY8LK9o+Z+tRtgp2p13DcZLaE9YwGA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay153-hz1.antispameurope.com;
 Fri, 20 Feb 2026 15:30:49 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 8423FA413CB;
	Fri, 20 Feb 2026 15:30:30 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] ARM: dts: imx6qdl-mba6: add boot phase properties
Date: Fri, 20 Feb 2026 15:30:05 +0100
Message-ID: <20260220143008.186851-5-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
References: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay153-hz1.antispameurope.com with 4fHXj31q7dzqT3h
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: f301ef9e349f7c57d41eb56594cc14ea
X-cloud-security: scantime:2.427
DKIM-Signature: a=rsa-sha256;
 bh=ENdcNjudCZOeI3PUHLeXLzIdft7hUCMR4wfbEPD2azw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597848; v=1;
 b=cZmO6QqoRskH/MquQvm9QS24TTdfLz2ZkfJ1XFj9f5oQMVPk7VoXpSpwCY2CpeBClcDk1dkl
 xcLf3At1Kn/ELZiKGr1dg1VKIuTl7GITGL9g8rDUKHshDpB6BIGmiw0qXSIRYwBjo7YTDLG4I0S
 eknxURN5KoRj00RQ9N4ZpnG7OlnrpqQfweAgEbgYnEfdbxG9rHn1QbQ+sileX26YmewEJ2NOPTG
 FP0dx15rvowKPYypeBRqVsuCotaLCYRj9+3J6V9ek2e5rGVnyngNQpHc55/BM7W+oGJ+puiVMAo
 yOdbzgY/m1iUqmjQFEHl8t2Nptd2e2DxeYaC3ID4h4zOw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_063100_796375_F8FD4AFB 
X-CRM114-Status: GOOD (  12.32  )
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

dtschema/schemas/bootph.yaml describe various node usage during
boot phases with DT.

MBa6 need I2C, GPIO, SD-Card, UART and watchdog access during
boot process.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
index ee2c6bec92e8..74ccfe56828f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
@@ -206,6 +206,10 @@ ethphy: ethernet-phy@3 {
 	};
 };
 
+&gpio1 {
+	bootph-pre-ram;
+};
+
 &hdmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hdmi>;
@@ -214,6 +218,8 @@ &hdmi {
 };
 
 &i2c1 {
+	bootph-pre-ram;
+
 	tlv320aic32x4: audio-codec@18 {
 		compatible = "ti,tlv320aic32x4";
 		reg = <0x18>;
@@ -274,6 +280,7 @@ &ssi1 {
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -346,6 +353,7 @@ &usdhc2 {
 	no-sdio;
 	cd-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
 	wp-gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -354,6 +362,7 @@ &wdog1 {
 	pinctrl-0 = <&pinctrl_wdog1>;
 	/* does not work on unmodified starter kit */
 	/* fsl,ext-reset-output; */
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -544,6 +553,7 @@ pinctrl_uart2: uart2grp {
 			MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA 0x1b099
 			MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA 0x1b099
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_uart3: uart3grp {
@@ -587,6 +597,7 @@ MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x00017059
 			MX6QDL_PAD_GPIO_4__GPIO1_IO04  0x0001b099 /* usdhc2 CD */
 			MX6QDL_PAD_GPIO_2__GPIO1_IO02  0x0001b099 /* usdhc2 WP */
 		>;
+		bootph-all;
 	};
 
 	pinctrl_usbotg: usbotggrp {
@@ -602,5 +613,6 @@ pinctrl_wdog1: wdog1grp {
 			 /* Watchdog out */
 			MX6QDL_PAD_SD1_DAT2__WDOG1_B 0x0000b099
 		>;
+		bootph-pre-ram;
 	};
 };
-- 
2.43.0


