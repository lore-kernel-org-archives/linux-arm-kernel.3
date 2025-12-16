Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D67D5E151
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 13:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yh5ZsOcuDpa4wWwoqzqt35sd6N66Msu9e9l9XpN6lLM=; b=IIgIht1QwF+hs3CGjrwjPs5p7E
	7ZvcTlO9D4roCb82xPHTWCZ44KeotUGdIhTbOdWzPAvAYWhC1+MtqXjajoZdqCx09AZYoT7KMxv0c
	k7Rhx/h7LE02FXzX+G4PuQ+NbYFhi/BWI2PE3Zhz1R/QYfd3OImfP0C65f7MslgkYir+Hc6AQOAF1
	PqRJkxh9H5R8f27KPbVjiTsgKuXrBQnNCeuysfM88pZ5K7JLIQz2rGc8kxeV95QjIVhQlhd8aSTtz
	t+bRIDncolxpgr6VCYbJ9bCwKnNSheITaex/HYWqerM4qzA97Ep7sP43I2ZjPeU2J7dk9Sz3pi3pX
	2IEMKjBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVV9R-00000005G9X-00cF;
	Tue, 16 Dec 2025 13:31:41 +0000
Received: from mx-relay95-hz2.antispameurope.com ([94.100.136.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVV9M-00000005G8w-2IPx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 13:31:39 +0000
ARC-Authentication-Results: i=1; mx-gate95-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=yh5ZsOcuDpa4wWwoqzqt35sd6N66Msu9e9l9XpN6lLM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765891884;
 b=sUvnY3azZ1kL+0MQAYj/TGYMOuodqNrqju4zpNHVi9UCfLIe/yXZ33L8Cze1r4rUMQNEsV5i
 bfwknOgEERvIgDDcfWaAg81aSQ03oNhKuHkC4csUrA2Z4PbJNhIwSGGs65F03m3kOAbX4kaELBu
 z3RNogTqfTyWsNLvY2gKO0ZcINKtvd9sH3CAs8euU1nWsGkimGW5ZyKaYXllI0MTOaCEerrCVqw
 kZ+O3134/jmB4cNac48m2IADTlTiF+NrYIiPpIJXW8ULdD0mORpbyA/lpT8Gk6mvJ3Y2ke5EHcs
 8GEuUM1fA6sMVnXXkTyTKdP81AcZlDqJPLD0qqprrdGJQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765891884;
 b=LKpwhpGrMnOdElZyZl6IxmbamLk4jWagPFjTgV1MVUPIX75dCY1BUqAISww53dMq8lVnkL6k
 6uyx0t54+DuMTYHBgXS+ngFsnBJ8k6TSFzvgxCJcEzFhyUBHXftswjLP2c3rp3IMWBtL28OnygS
 p5vYxKScTn1r2Q6N7oh8TfRX2s6HES7fq/8Xlh9yHnZFwIsGDt1ExZP+NuDCQZMMrgj70ewlymf
 mQ85OrdKQDTyg2p1cel62y+RgQo0PoMtuZJTEXdi5kck7ei/vjsjrqxvEWCbkhfTpkDC7u3NZZc
 XkyoBma6jf1UbdfXp/RFYOIMp969I9Ca8TjRYwFE23yhg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay95-hz2.antispameurope.com;
 Tue, 16 Dec 2025 14:31:24 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 2E46A5A089D;
	Tue, 16 Dec 2025 14:31:12 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/4] arm64: dts: imx8mm-tqma8mqml: remove virtual 3.3V regulator
Date: Tue, 16 Dec 2025 14:31:04 +0100
Message-ID: <20251216133110.905950-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay95-hz2.antispameurope.com with 4dVyW50clrz2F9KH
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 504100b48af9d3fc233a2e6c6ae8df85
X-cloud-security: scantime:1.536
DKIM-Signature: a=rsa-sha256;
 bh=yh5ZsOcuDpa4wWwoqzqt35sd6N66Msu9e9l9XpN6lLM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765891883; v=1;
 b=beBJeCKSQL41n2wsukzEidJIw1EpTvnTujlj23hD7SvADM4xQvkMFsBePNJE26aiZhjyTJc6
 XTUgSeMhkVXS1HiDrYi2XAtIwqmjlW1k93hiLUciov8N1ZOzQ58vqwYim23VGMyXKFp6s3uWS4F
 WaGci2GObFN3pmGx6olK0DBKxbfUUfaB/XlXt22GEnYCSMr25Hh6pPXWr3W47qSA7IPhuoWwJN1
 0mt2fAk3c+dCf5C7g6dFUNycu8qbq6lCYwaOEzoVohbgEuRf/PW9HpjRrYGSKyDkkl36Mj4pOSu
 TjJtjjyFdIypfYjpv/zZwzmg3WfRMWy8pewvRMEYAG7nQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_053136_809867_68389158 
X-CRM114-Status: GOOD (  11.79  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

BUCK4 rail supplies the 3.3V rail. Use the actual regulator
instead of a virtual fixed regulator.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
index b82e9790ea205..16ed8ce5b5c49 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
@@ -24,14 +24,6 @@ reg_vcc1v8: regulator-vcc1v8 {
 		regulator-max-microvolt = <1800000>;
 	};
 
-	/* identical to buck4_reg, but should never change */
-	reg_vcc3v3: regulator-vcc3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "TQMA8MXML_VCC3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -223,14 +215,14 @@ eeprom1: eeprom@53 {
 		read-only;
 		reg = <0x53>;
 		pagesize = <16>;
-		vcc-supply = <&reg_vcc3v3>;
+		vcc-supply = <&buck4_reg>;
 	};
 
 	eeprom0: eeprom@57 {
 		compatible = "atmel,24c64";
 		reg = <0x57>;
 		pagesize = <32>;
-		vcc-supply = <&reg_vcc3v3>;
+		vcc-supply = <&buck4_reg>;
 	};
 };
 
@@ -253,7 +245,7 @@ &usdhc3 {
 	non-removable;
 	no-sd;
 	no-sdio;
-	vmmc-supply = <&reg_vcc3v3>;
+	vmmc-supply = <&buck4_reg>;
 	vqmmc-supply = <&reg_vcc1v8>;
 	status = "okay";
 };
-- 
2.43.0


