Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D603C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 12:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZxhTgCLygSpRzZ9PzHb6ECFgejGwUE72Etj5ELI2Wgw=; b=y3L1h0+2zG5VRNjUar+xNRIIOE
	2lv9Nqc9lQiYILIWt+qHO45A0jSTDBkPbMEIUxrkHlJ87BTdjcvq63No82b9gqHNWsqOoijKvBCnu
	C72HHzFjnk6ASKR8hsCl31VVo+FdK2WyST90FxYzYxcxIVV1McdMlerLhzhhmWPMzy/Ukug7lJXKO
	Fdek6m9Wy32yEv5CGeKvIJuPyLPCi4uFIgC+hzAHnrFm1sys2tanVBD8ol91/wwUhKGEvQ0aVVCFO
	Vx3WdFcY6w/109vuGSUTlWBbomoVgZU3TEVnTqS04yroXLk9NipBxiCjfy0s7e0W23V0OE7FSllFx
	gzabs0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM4gO-00000007Ou9-2jyO;
	Mon, 02 Jun 2025 12:54:28 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM4eD-00000007Omt-0eMT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 12:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZxhTgCLygSpRzZ9PzHb6ECFgejGwUE72Etj5ELI2Wgw=; b=cWqOLWptPRZS2apnyR7vYHWdOR
	2s8bFDL8T/eRFZt8GpEJ7XYzh7n9b0DZfcBvXJ1oeFnwupUw1lE2wh11Lrs/lGvvdklnQ4+sGT/2b
	skDo4BHK4n7cF129X0xlvBDh881I07pno4lsiefN7kUyinnV/hjBqZ+WEoHIkClcElMOzXgdVhq7L
	QjwcRGB6NO/g+NZltYJJmfqUHpeWl/F2Myi1/J4N+3BiGYxorKLMfSGyGebeIB5E+YACumUNjp9mw
	YJSbXAbxqA0jiYMmtw5bbdkMKKYdrruQxe8GEEl+5GVIE3WImlFkf6dW9cW+RUF1XbSOEYoK/gXBT
	EshVYq/g==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:56998 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uM4e8-007eqG-2L;
	Mon, 02 Jun 2025 14:52:08 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH] arm64: dts: freescale: imx93-phyboard-nash: Move ADC vref to SoM
Date: Mon,  2 Jun 2025 14:52:07 +0200
Message-Id: <20250602125207.2265222-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_055213_667318_0615251E 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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

Move configuration for ADC voltage reference from board DTS to a SoM
include file. The SoC ADC reference voltage is connected to a "VDDA_1V8"
voltage node and supplied by the PMIC's BUCK5 regulator. The reference
voltage is thus defined by the SoM and cannot be changed by the carrier
board design and as such belongs into the SoM include file.

Moreover, with this in place, customers designing own carrier boards can
simply include imx93-phycore-som.dtsi and enable adc1 in their own DTS
without the need to define dummy ADC vref regulator themselves anymore.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../boot/dts/freescale/imx93-phyboard-nash.dts      |  8 --------
 .../arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 13 +++++++++++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
index e1c9aa77c000..475913cf0cb9 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
@@ -53,18 +53,10 @@ reg_vcc_1v8: regulator-vcc-1v8 {
 		regulator-max-microvolt = <1800000>;
 		regulator-min-microvolt = <1800000>;
 	};
-
-	reg_vref_1v8: regulator-adc-vref {
-		compatible = "regulator-fixed";
-		regulator-name = "VREF_1V8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
 };
 
 /* ADC */
 &adc1 {
-	vref-supply = <&reg_vref_1v8>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 0ea61841e591..26bd801a49bb 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -46,6 +46,19 @@ led-0 {
 			linux,default-trigger = "heartbeat";
 		};
 	};
+
+	reg_vdda_1v8: regulator-vdda-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDA_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&buck5>;
+	};
+};
+
+/* ADC */
+&adc1 {
+	vref-supply = <&reg_vdda_1v8>;
 };
 
 /* Ethernet */
-- 
2.34.1


