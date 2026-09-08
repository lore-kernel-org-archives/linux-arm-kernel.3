Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7642C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 22:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aBIZOzE3i1JjRrtYfZeSQABj8yITCJ8amCyPP3PLllk=; b=AsaeMSRv0pAyEEZPBSHCxfCZtO
	fCnHsp1lH4q5vOd+LsCh7z6xVMWd9UnsiRSnehCT1KspMsBdRtdFaGRSzzYRiMhJqFgklbboYIEvk
	aeSti2SrFhUlmLaP85oYkwbZAngrrkTr0rdaWlT0Hh1mQWeUTtdrnfgZhvtmT+9DGBiQ/rmwerAdJ
	t1n7G/E4aMy48kf1BoLUekmmA8SzXFkLfvJ80+gQjLqQWvyIPc1tcsBsE+xZJO3PkhLoesTM/BjCT
	fC7g4QAhi8uJ321G4BD9/OR/aQB3i9TTZqX0zBhE8bN0ZLNQeIbIxBVxAWePMfF3a25KfYtiXuFM1
	XwhVIfjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x44Ks-0000000AOo6-2D7i;
	Tue, 08 Sep 2026 22:30:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x44Kr-0000000AOnc-3qrK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 22:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=aBIZOzE3i1JjRrtYfZeSQABj8yITCJ8amCyPP3PLllk=; b=Yz3+7kG6QZmKoNCCwvMTHKtv4y
	0SbDgw1sPSidhoQQbvOHsdWnr1lOqvaoLRTPZQlJO92YxQ5sYhLkLipMTGH6scluA8OlfahvcDwqF
	qnv+j6zYCCV+jueN0vl8+r2DtsRvWkhHD6aga8A2BfsLj8cBuP3B6dIgad9U1MPVzlLc3jvS3oCH6
	djkpKL01f9oxlxBk8N3NbMtUCaz1XHejqHUGTwQtoyqg05wLxWIREZBFrd5FHMS1d72dv5iJzAE6e
	+1zluM878UeTgMHyvOF+Kvnxg1jCzHwx89/mbgWU6ptIY4H4ki0609pzvEsKoRF3HEis6Aa3MoEsk
	Y1UZGa+A==;
Received: from mx.nabladev.com ([178.251.229.89])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x44Ko-00000000TXa-2Pf6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 22:30:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E14410196A;
	Wed, 09 Sep 2026 00:30:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788906621; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=aBIZOzE3i1JjRrtYfZeSQABj8yITCJ8amCyPP3PLllk=;
	b=jYXb0xZzzrz69AyOLg6dTibqq+Uzjau6AnH/hwucb2M2eoGND1Nx0pOB78iapxGXLgKDAF
	2NwLHWGUgIH8fdP+EupnLVqE5/1/9sMvAqUzxpFJ95/eaHWVvAMqa6mn9DQSvWIQDh/R7j
	GjOrUSXUrGszy10G985W0iozPhA3OYpvGObQuD1e64n8gmEQEAnZq9Zx3lRxGQ1HfBmomH
	ql3Y5z+XNs4+iqENCKo76Xa2siBv/fUbYIzrUIXw7aMMiarPUDZV0Cvc6IovPMkeFBvXrU
	t5NrETB7Th8cFMGJhmhXOgppJ69krcf2TOsZQoeShL6EmPM3liacPvHXH3xeyg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: imx8mm: imx8mp: Update EEPROM with nWP GPIO, label and layout
Date: Wed,  9 Sep 2026 00:29:42 +0200
Message-ID: <20260908223005.38536-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_233034_881252_56191A52 
X-CRM114-Status: UNSURE (   9.45  )
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

Describe ID EEPROM nWP GPIO, label and nvmem layout. The i.MX8MM eDM SBC
and i.MX8MP eDM SBC nvmem layout is almost identical, except for length
of product-name@32 field, which is 19 Bytes on the Mini and 24 Bytes on
the Plus.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: Fix wifi@1200 typo
---
 .../freescale/imx8mm-data-modul-edm-sbc.dts   |  56 ++++++++
 .../freescale/imx8mp-data-modul-edm-sbc.dts   | 128 ++++++++++++++++++
 2 files changed, 184 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
index df857de0375cf..cb76471440433 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
@@ -431,7 +431,63 @@ usb-hub@2c {
 	eeprom: eeprom@50 {
 		compatible = "atmel,24c32";
 		reg = <0x50>;
+		label = "dmo-board-info";
 		pagesize = <32>;
+		wp-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			company-name@24 {
+				reg = <0x24 0xd>;
+			};
+
+			product-name@32 {
+				reg = <0x32 0x13>;
+			};
+
+			board-revision@4b {
+				reg = <0x4b 0x3>;
+			};
+
+			serial-number@4f {
+				reg = <0x4f 0x8>;
+			};
+
+			manufacturing-date@70 {
+				reg = <0x70 0xa>;
+			};
+
+			test-date@7b {
+				reg = <0x7b 0xa>;
+			};
+
+			product-number@86 {
+				reg = <0x86 0x8>;
+			};
+
+			board-variant@9a {
+				reg = <0x9a 0x9>;
+			};
+
+			company-acronym@a4 {
+				reg = <0xa4 0x3>;
+			};
+
+			mac-address@b0 {
+				reg = <0xb0 0x6>;
+			};
+
+			board-id@100 {
+				reg = <0x100 0x4>;
+			};
+
+			wifi-id@120 {
+				reg = <0x120 0x4>;
+			};
+		};
 	};
 
 	rtc: rtc@68 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
index c284edfa1f4c8..4614a0de07906 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
@@ -421,14 +421,142 @@ tpm: tpm@2e {
 	eeprom900: eeprom@50 {	/* board rev.900 */
 		compatible = "atmel,24c32";
 		reg = <0x50>;
+		label = "dmo-board-info";
 		pagesize = <32>;
+		wp-gpios = <&gpio3 14 GPIO_ACTIVE_LOW>;
 		status = "disabled";
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			company-name@24 {
+				reg = <0x24 0xd>;
+			};
+
+			product-name@32 {
+				reg = <0x32 0x18>;
+			};
+
+			board-revision@4b {
+				reg = <0x4b 0x3>;
+			};
+
+			serial-number@4f {
+				reg = <0x4f 0x8>;
+			};
+
+			manufacturing-date@70 {
+				reg = <0x70 0xa>;
+			};
+
+			test-date@7b {
+				reg = <0x7b 0xa>;
+			};
+
+			product-number@86 {
+				reg = <0x86 0x8>;
+			};
+
+			board-variant@9a {
+				reg = <0x9a 0x9>;
+			};
+
+			company-acronym@a4 {
+				reg = <0xa4 0x3>;
+			};
+
+			eeprom900mac: mac-address@b0 {
+				reg = <0xb0 0x6>;
+			};
+
+			board-id@100 {
+				reg = <0x100 0x4>;
+			};
+
+			wifi-id@120 {
+				reg = <0x120 0x4>;
+			};
+
+			board-lvds-id@140 {
+				reg = <0x140 0x4>;
+			};
+
+			camera-id@160 {
+				reg = <0x160 0x4>;
+			};
+		};
 	};
 
 	eeprom902: eeprom@51 {	/* board rev.902 */
 		compatible = "atmel,24c32";
 		reg = <0x51>;
+		label = "dmo-board-info";
 		pagesize = <32>;
+		wp-gpios = <&gpio3 14 GPIO_ACTIVE_LOW>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			company-name@24 {
+				reg = <0x24 0xd>;
+			};
+
+			product-name@32 {
+				reg = <0x32 0x18>;
+			};
+
+			board-revision@4b {
+				reg = <0x4b 0x3>;
+			};
+
+			serial-number@4f {
+				reg = <0x4f 0x8>;
+			};
+
+			manufacturing-date@70 {
+				reg = <0x70 0xa>;
+			};
+
+			test-date@7b {
+				reg = <0x7b 0xa>;
+			};
+
+			product-number@86 {
+				reg = <0x86 0x8>;
+			};
+
+			board-variant@9a {
+				reg = <0x9a 0x9>;
+			};
+
+			company-acronym@a4 {
+				reg = <0xa4 0x3>;
+			};
+
+			eeprom902mac: mac-address@b0 {
+				reg = <0xb0 0x6>;
+			};
+
+			board-id@100 {
+				reg = <0x100 0x4>;
+			};
+
+			wifi-id@120 {
+				reg = <0x120 0x4>;
+			};
+
+			board-lvds-id@140 {
+				reg = <0x140 0x4>;
+			};
+
+			camera-id@160 {
+				reg = <0x160 0x4>;
+			};
+		};
 	};
 
 	rtc: rtc@68 {
-- 
2.53.0


