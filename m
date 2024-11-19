Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C267BD44145
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xmp1FFvRCaQ6lIrao3zFiwPafu81BsYjz/h0h8SThJg=; b=tbNKQhxyfhHW8TNEtE/JzDlW82
	Scnce+rsIomKB17rMxxRqXY4AQkWPTFcMC8h6ChhoI3NrgduonX+8JYzVIwfuaHhx9nVidQ3t6IVQ
	R+SmWEc4JAbHAvJDKPwxMxhTU6XrCuRKgdckZokAKxIUT37sr2bgv2Zr0kjZdXFgQKhHJ3pgM2xGy
	9sgtDUsR4vMOM5a8f/UuexW48fs2CdwJVi34UR7uXOnleQtoFZz+anIyq9D5+y58MsUaczWz9Oi6F
	CtWOkcVfVT/nUVLMh6WxUSxm+sDFeG/CZIWJAl8CRynb/YPNiRmAtAR/7oqRzZPT7v1y7mCYnldwY
	cDIvBX8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMWj-0000000CEWO-0wWX;
	Tue, 19 Nov 2024 11:36:13 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMVn-0000000CEH4-080f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 11:35:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tDMVj-0004eP-V2
	for linux-arm-kernel@lists.infradead.org; Tue, 19 Nov 2024 12:35:11 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tDMVj-001Ydj-2I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 12:35:11 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 61095377052
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 11:35:11 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id B201E377033;
	Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 4f931d1b;
	Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 19 Nov 2024 12:34:58 +0100
Subject: [PATCH 1/6] ARM: dts: stm32: lxa-tac: disable the real time clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241119-lxa-tac-gen3-v1-1-e0ab0a369372@pengutronix.de>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
In-Reply-To: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=po5CXcX3jorgEXwSQF/93cCwkgDI9gDb0IppJ1bPcSQ=;
 b=owGbwMvMwMWoYbHIrkp3Tz7jabUkhnSb8ifKwh2t2t95JF/NOiVsmDzJJaurfZq0psCp1pUiK
 fX9bzs6GY1ZGBi5GGTFFFkCHHa1PdjGcldzj108zCBWJpApDFycAjARQ3H2/0496Sxz/1U363W8
 6/p/9lbhvDXSPgKHPNuDG/fLpp2rX6Z/smzbNu3H32ztYoo5tp0/dbbVR/jt7QoGD1ZtuX+uscs
 t416ciDmj9//coivNxvNqRJ8V+/TJZix+GxNhrr3scfY/yWlHchpkovy/Kaz7yLJOQ+WhzPr1f+
 KzOf1zpkjsO7Lzk0dbyf38oKgVJXoehfuOxr5g+OmySOGcpN3nifNbN/c+uBItzNmSOnHdnY2vX
 j1cKZrHKVoc3Tylavd9wTPR1vmPtswQOOXEKtJpZG/LyJBqcKfBas/5Yi6rf3O4pXqr5FVXfGXK
 uyrbYLZjX4cwB/ufv/u2iXdZLhPun1kZXyChXfjrx8lTAA==
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_033515_071212_82D9C256 
X-CRM114-Status: GOOD (  13.64  )
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

From: Leonard Göhrs <l.goehrs@pengutronix.de>

The RTC was enabled under the false assumption that the SoM already
contains a suitable 32.768 kHz crystal.

It does however not contain such a crystal and since none is fitted
externally to the SoM the RTC can not be used on the hardware.

Reflect that in the devicetree.

Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
index c87fd96cbd91897bb724a235689e425f7dbf39f6..abe4c7fe7678f2801683e0995dadbfecce434e81 100644
--- a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
@@ -379,10 +379,6 @@ regulators {
 	};
 };
 
-&rtc {
-	status = "okay";
-};
-
 &sdmmc2 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_b>;

-- 
2.45.2



