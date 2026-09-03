Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F332C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PNOmjiL8zGC/XcXuOVjFCBPvUZNDZ0am9nzcG73XPo=; b=O8PgM0CAhJJoMtsf65orXEsT5C
	EvA/AlaplQPu8VZpeDzAl+0GIZ3BuWIUnPaV/QUoWBQK0ecXsFGjm8bd6luHcFQ4nBK2UJ7Zjqt8D
	Y6YXxuioJCrf5QBmep+5o8QgvO9KSVVf+K6QwmgLVmd3KzyjhIu3Eb77gG31emPOZDDvID19CUAeO
	32RLPkR8b6dnFR/hUHoRIX+FlEiYtL1wmZekc28tGJKQcOpzkykyj86LXAVRJH6XeDjDqd74zJgjm
	uqxnaQVo8zn5kVw3ZzziRWuex6XAbnOO4XiphbqUSEodCjQVAcB1KTOag/E4837PKRflfCZ50Xcst
	7mNSO7Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AvK-00000000FUW-0hMs;
	Thu, 03 Sep 2026 17:08:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AvH-00000000FSl-2cMN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:08:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso1233705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 10:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788455302; x=1789060102; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+PNOmjiL8zGC/XcXuOVjFCBPvUZNDZ0am9nzcG73XPo=;
        b=pkHGiJmPSEb9jYoX6waHKrBSJwDn4UfGBmBTX1c1ilB549P41lt+ry2jEv+PEFI0T7
         fLSNNUSH0s7F3WvUfZE+nTwZ5aP/q+OCq5IwTb6ReuaiahcVHrizFZvULEA4LE6L0wsu
         hPsdH5zs/mc9ZloHbAnSkITcjYr6ecIKzLE3QoflSOUbbGBQGtKYehe/PpUEh0wBJJz5
         2ue67lfSy8yfsjwzgt4XHwaVn7jT8UKOPu799xxKvFyet0qW13/kfSpLHwctDFaIU9Bm
         i3bajnYtpk7hycv1BJaq5dJAU90/NKH/oX2B8USdFcRYOjDjPPI/xCaVJnbSiq9mVtsf
         lvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455302; x=1789060102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PNOmjiL8zGC/XcXuOVjFCBPvUZNDZ0am9nzcG73XPo=;
        b=bu07t7xLcF1liXqer8YE/Sxs6yNMjN/+Vd0IKwEcqDsmcuLyIsjBGOLr9Kkj/DMJek
         iv2Qi/2uNpjzzvFSZPXsoNX9gM944Y4GKaZcslCRv8xXRPEhz11w1FA3bx15cur2+pyf
         PSqgqN9Xm+P93/SzK8i2zI86NnO/VwQBaw3BTJQ1QnJu1xbZw5dq1tcE39XbymxtWeFL
         SfBKtEmiQdDGKo50rqgoI3/JKep6xg7O++UishGf771LH6VKNJv2c82veCASduPa8SSG
         gBaT6WufU+h2W3FrnenIznLFF9DxR5s9jKnosQYo4Co31u7pvAxphWS9JvOFa4QL+KIw
         MF9A==
X-Forwarded-Encrypted: i=1; AKwUvBwhRlMa7TtHzhjwWYA2/CKCaW0I6SRBPAKuxMwvueepXN382Ktm05xiHC9iy8gaamTC7vlOaYD7mbr6uMJD0896@lists.infradead.org
X-Gm-Message-State: AFuF++k+rjuzSrE3KNgzJxitxZ0gK55sm/DOkpk28d6nIwxKoRzjmPkQ
	W7XDJUFRbEPB7OnMyXdTkQQbo62zPbpyNtsJSoe0Pr4ng7K/g/ysyXZo
X-Gm-Gg: AYBFou12bOafjafA2MMGsT3iknqbuhLrd6AwWZfFzFOKZHtoafBuIl58tEk8DpfdA62
	Ik8FC8GvF5vv5T2Lj/sYhmSeyiX2f7iAyHaOzrJa+rpmIz9kxxHm/5Ij9DjJyfTcgsMS6e9P04D
	qHPWQXWjFEI5ynAyrbqlNko9KUXfGX0zpTBTWvTqoJN8tIkUlBbo+KjjnfGqqMhx35SLispzOGk
	kA1TICuLyGAbOKQFaUnHAVPXyepPpiBbJ2q58xr24Re9EfqhV8VhfFY90otlzDVoGZbGP1GZQ7k
	lrAqEyywvZThp91kUkt/yNfMgAuEHSqOXxG/+jTGAACzf1fFpI/ObJE9bggEWaNsBId0A1z7CCl
	OEvw+0bNoHiIlv6ELhUHh42cjL0JQNPbSoB8h+VDRofnO5WZtIsDkgylO1UYQKu4ErbWuL7+m1D
	PWNfSaYepvWXHwf+ZAsZh8mcyg8DC4Oz8VvUr8rE/CQGtwxuYdPEU7slGVsNDNzwfn4GdvEdxmc
	zxuG+IUzBR6x3ugt0E2vuHHcvXDvJgfjnrXsUz0S9tRX05dy3Vz94oH+piQ+54bipHzV7+lxs1W
	pmLrIJmALNlEIBEzLvJ2YP7KaIIzIfi9srmLsw==
X-Received: by 2002:a05:600c:c168:b0:49c:cb6a:1687 with SMTP id 5b1f17b1804b1-49cf5bc7608mr35422415e9.4.1788455301357;
        Thu, 03 Sep 2026 10:08:21 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm107799565e9.3.2026.09.03.10.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:08:20 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 03 Sep 2026 19:08:02 +0200
Subject: [PATCH 2/2] arm64: dts: freescale: imx95-aquila: Add ENETC port 2
 in SGMII mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-add-enetc-port2-v1-2-2a21139d7a7c@toradex.com>
References: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
In-Reply-To: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_100823_693741_F21A0C8B 
X-CRM114-Status: GOOD (  10.80  )
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

The Aquila ETH_2 uses the ENETC port 2 as a SGMII Ethernet interface
on the Development and Clover carrier board.
Enable the required support.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts    | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi       |  7 +++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
index fd93043314466..365bce73eddd3 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -67,6 +67,15 @@ &enetc_port0 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+
+	status = "okay";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	status = "okay";
@@ -227,6 +236,15 @@ &lpuart7 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII_MDIO, shared between all ethernet ports */
+&netc_emdio {
+	ethphy2: ethernet-phy@4 {
+		reg = <4>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 /* Aquila PCIE_1 */
 &pcie0 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
index 3df17700b632f..2ff7bb8d6ac43 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
@@ -99,11 +99,29 @@ &dsi2dp_out {
 	remote-endpoint = <&dp_1_connector_in>;
 };
 
+/* Aquila ETH_2_XGMII_MDIO, shared between all ethernet ports */
+&netc_emdio {
+	ethphy2: ethernet-phy@4 {
+		reg = <4>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 /* Aquila ETH_1 */
 &enetc_port0 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+
+	status = "okay";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index 69dc962a24a1d..f930965cb341f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -16,6 +16,7 @@ aliases {
 		can3 = &flexcan4;
 		eeprom0 = &som_eeprom;
 		ethernet0 = &enetc_port0;
+		ethernet1 = &enetc_port2;
 		i2c0 = &lpi2c3;
 		i2c1 = &lpi2c2;
 		i2c2 = &i3c2;
@@ -209,6 +210,12 @@ &enetc_port0 {
 	phy-mode = "rgmii-id";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	clocks = <&clk_serdes_eth_ref>;
+	clock-names = "ref";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	pinctrl-names = "default";

-- 
2.43.0


