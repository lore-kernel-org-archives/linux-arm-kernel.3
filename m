Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E966D3B7F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnHdfh91G6T+ycFdjp0k9hFV7z9eOwmLyOOxZ8pJsTE=; b=4LPd2OOn2iLNry2hubSzL4o3bR
	gdcXEuzj601/oSehx9773L2yc8WvIzAOD0072FY/DrQM7UOteYaINRCY3O9x5LLrd1hHBEfN7ajgh
	En5rabMt7w3sG+688Jw1khxBrRX/YDjpR7+Dg1BrCebw+/e1m+Qe5E7Ftf6WYl53QJaEIug0oN0GK
	stT7wU9h4kzErICj55GXCV8j829GfkKNfusVjX1XHdQe8LP9R9tPFcIT0FnjrA/Tz4jHLwz/3/wfN
	R8KD4fG94v55315+kKkVRYRjieGkbWDm3meX9Ah0wD3E/7k/E1jWAIfoYT5arwRzvjvN0gDlTkNX4
	diDoeGoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFURB-00000007NW3-0qjq;
	Mon, 25 Nov 2024 08:27:17 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUIt-00000007M5J-36b8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 08:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BnHdfh91G6T+ycFdjp0k9hFV7z9eOwmLyOOxZ8pJsTE=; b=nWipbfoQ6TkkG9eDB2uuc4V4Ba
	gLA0Tn8IXz+/u9861hheMd5Js47LEirSh/Fv3SF4nBl0JxIQLC+UnSXY2u3axCT+vgc+4VWUH70i5
	ER8RuSgm3zGSVOdHVy5AVteV/fv2CuxTf/UwNMG1jeS6JCP+A49rltdW8SqNqKpIsTSRl8ZBOsTMn
	+9dEr9FcRDI6ow+kaFd+aMuR7cQFRlF4VzfmbxVlmefIS6N2u+Lg65lOz3qGqwEWY/CUau6fRnpox
	BnaPErBGgbU7Qm2p4I8rHL8ROnBLm2Mt/ukj4AY+3vHbBVIHrNcltDn1+t8q8GD/WS6JsvID+kDN/
	RCWabBVw==;
Received: from [91.26.50.162] (port=58340 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tFUIs-00Eq70-2Y;
	Mon, 25 Nov 2024 09:18:42 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 09/15] arm64: dts: imx8mm: move bulk of rtc properties to carrierboards
Date: Mon, 25 Nov 2024 09:18:08 +0100
Message-Id: <20241125081814.397352-10-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125081814.397352-1-andrej.picej@norik.com>
References: <20241125081814.397352-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_001843_935764_51582373 
X-CRM114-Status: UNSURE (   7.10  )
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

From: Yannic Moog <y.moog@phytec.de>

Move properties from SoM's dtsi to carrierboard's dts as they are
actually defined by the carrier board design.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi       | 4 ----
 arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts    | 4 ++++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
index 7aaf705c7e47..f5f503c3c6b9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
@@ -221,6 +221,10 @@ &pcie_phy {
 
 /* RTC */
 &rv3028 {
+	interrupt-parent = <&gpio1>;
+	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+	pinctrl-0 = <&pinctrl_rtc>;
+	pinctrl-names = "default";
 	aux-voltage-chargeable = <1>;
 	trickle-resistor-ohms = <3000>;
 	wakeup-source;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
index cced82226c6d..fdfe28780d6f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
@@ -301,10 +301,6 @@ eeprom@51 {
 	/* RTC */
 	rv3028: rtc@52 {
 		compatible = "microcrystal,rv3028";
-		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-parent = <&gpio1>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_rtc>;
 		reg = <0x52>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
index c9bf4ac254bb..b7b18d5a4f68 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
@@ -215,6 +215,10 @@ &pwm4 {
 
 /* RTC */
 &rv3028 {
+	interrupt-parent = <&gpio1>;
+	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+	pinctrl-0 = <&pinctrl_rtc>;
+	pinctrl-names = "default";
 	aux-voltage-chargeable = <1>;
 	trickle-resistor-ohms = <3000>;
 	wakeup-source;
-- 
2.34.1


