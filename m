Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC10606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=obuebg6/;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=C9F9sNuC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SJbq/0wOnbvPIMJtKcmtse3uM3IzsSK29zH+AGSwz+s=; b=obuebg6/BAHuMypOIWlMfatiA7
	uB8HQ7SPPac5obshvr7XXHToFHJKOKbvXUolA0w4TQTH1pcyOjYJ4dj+YZXshBNoWJtbxHDvEkwVA
	sm6FE8SB/aa7xkruGibrGgaToI95r6B4VAGBBZCHsYIArIs8OljrjycDPiAqr8vg+K9b2ELSTU1EB
	hevwJaRbuGy9O+emiJRkMoIxeSmn4GWxXsrZy7YVC6fdPy/wWtgamtX0FUdMgvZvnTA+BV1T4VLud
	tE82ib9aIwGpyuHzPazGVOLyfln8OXJuHzXbuj1DG8yaw5oJE5cNhHHXORmP+cVQeZ+B9NJTxcMZc
	UZv8aJeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJs7J-0000000E5Ce-0rTZ;
	Thu, 22 Oct 2026 12:41:57 +0000
Received: from [2a00:f820:417:0:178:251:229:89] (helo=mx.nabladev.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJs7G-0000000E5BB-1xDp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:41:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFF671063F2;
	Thu, 22 Oct 2026 14:41:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792672903; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=SJbq/0wOnbvPIMJtKcmtse3uM3IzsSK29zH+AGSwz+s=;
	b=C9F9sNuCPPI19GLbN7IIa7VhIXPfYcTzqKUpOCajwBULhDJoKjQCTPfkzFOfPH/bEaTzis
	+Pz6PCWAIjCUpSzQa/JabukUESupasHMhFkW6hEJmNeWF/DGSvfiga86ck7dL1J1mn+0hA
	Q+JqUurkH820nmS9fbwtCXf6bbSwT/nGAn4dC9FaM5j3EkAiDf9St6gNtfXwDP8hsA0nR2
	Rv1T5INdwMkJr5VynUdit9lAC/OmWKWuPuKZgTTwZ0jKUqROMbiVZDNj53QzgSu/PrRQxe
	lOT+N/BImuxfceka91T+wV1YS63gpW0jlPtwQtwO4IhFry/mboi45MyA9/WLDQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] ARM: dts: stm32: Convert GPIO hog to USB connector Vbus supply on STM32MP15xx DHCOM PicoITX
Date: Thu, 22 Oct 2026 14:40:55 +0200
Message-ID: <20261022124138.185850-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_054154_712784_DFC75DB6 
X-CRM114-Status: GOOD (  12.16  )
X-Spam-Score: -1.3 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace current GPIO hog with USB-A connector vbus-supply.
This moves the Vbus GPIO into port control, where it can
be enabled and disabled by the controller as needed.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 .../dts/st/stm32mp15xx-dhcom-picoitx.dtsi     | 27 +++++++++----------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi
index 01c693cc03446..7f444bd4c58d3 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi
@@ -16,6 +16,14 @@ led-0 {
 			default-state = "off";
 		};
 	};
+
+	usb_vbus: vbus-regulator {
+		compatible = "regulator-fixed";
+		gpio = <&gpioa 13 GPIO_ACTIVE_LOW>;
+		regulator-name = "Vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
 };
 
 &adc {
@@ -30,21 +38,6 @@ &fmc {
 	status = "disabled";
 };
 
-&gpioa {
-	/*
-	 * NOTE: The USB Port on the PicoITX needs a PWR_EN signal to enable
-	 * port power. This signal should be handled by USB power sequencing
-	 * in order to turn on port power when USB bus is powered up, but so
-	 * far there is no such functionality.
-	 */
-	usb-port-power-hog {
-		gpio-hog;
-		gpios = <13 0>;
-		output-low;
-		line-name = "usb-port-power";
-	};
-};
-
 &gpioc {
 	gpio-line-names = "", "", "", "",
 			  "", "", "PicoITX-In1", "",
@@ -132,6 +125,10 @@ &usbphyc {
 
 &usbphyc_port0 {
 	phy-supply = <&vdd_usb>;
+	connector {
+		compatible = "usb-a-connector";
+		vbus-supply = <&usb_vbus>;
+	};
 };
 
 &usbphyc_port1 {
-- 
2.53.0


