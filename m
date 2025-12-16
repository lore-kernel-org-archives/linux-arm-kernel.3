Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3660D5E15A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 13:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zho2kDWL8J6XWsKmcJQhJUsDkOCGRd6yWhy2/tVl1AA=; b=QHlCavQgO39/VrmS3kbu4PQx30
	bERGYLe+62RcSwGDwGjNiGDEd1jYFcPVMC1X45A7Vkk5tQ2Bmbxnh/iPlnMwJOx0s5zLVtAyK5UAy
	glUeVoRF5S1hkuJMBIHSJWP5g+V3iL2X3r3bLvt5QUAjRana8j5qjsAUBu5wzpgrogqYxWI+ShVUs
	b/V1A5MyaicCvThQ1H9mgPdrzWfg6o7au4hvkD0SDrKPDJ+UWqpJUumJtpqUlk3I01DZGxd0lujSS
	TgLcWHFlclTVIKLyg3vHB6id4EZBzPEVcGOwOvwjcolwL6eMDk2PSmn1vMjwILk3oAQr+51Lio+59
	DOLbFCfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVHs-00000005HcR-3Z7C;
	Tue, 16 Dec 2025 13:40:24 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVHn-00000005HbO-3kpr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 13:40:21 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Zho2kDWL8J6XWsKmcJQhJUsDkOCGRd6yWhy2/tVl1AA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765892407;
 b=Qv2BpBxqgAPi7JqMBN2GYC0ROfq2Vn00LpHPvqjCfFqUqeFzWgTX2MQNyqcpp0dmjNQnlDYP
 ZgkC6U7NQo9TCqL2reNpBmJA/T8Ojosp6f1Lyw6KPc9n/SYuo2YdX+Qt2yC8LmwCATvQ4otbeMi
 IrVdjpyV8Tl8vEh+j29pJi8sdsbLVmgyk0p9KcFY21Pnyv9i6WuSbhuCOQKd0vGbQO1adw8729d
 GTxwbZHfswXMBMzHk49cyEH1USHabbS2ZM2Pk7R/GsnjC4fk3gqJYJB34TqksZ8AUW8CM/SaHwd
 r5ZFT3VJK3b2iJqZKcoHTFl1Tw7adztwNXveMgHl2K6VQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765892407;
 b=jvpwG9IuejIPjdH1nknZslNPTrPZfXIuQ2W7ETmFjqg6X0SBza/rgKPWJF6DVb6dt65yG49I
 9zkPSYOnM4Quwy057mKDHglqGU8KtXkK9oMtI2+ePiY4ShC33Xpb5FzElTL/82xJjX/ls5LWtHy
 FRKa/6B9AnlJknJJqiDroonj4oJnU8AiZwmptGVBJUAuGbriWPT7ATZt8Yxxcd0gnF7OoSSSK8l
 JBJpQojiB1xrktC+9ycyL3sxdt7yGc6XmWgciJCTR+EkCyetJ8mQdXdbohKWWsKRi6jfw1+F+0X
 NH3S4lg0QTWBFPdBWodd2HPA5hIlwiidHB6oHrUAHclBg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 16 Dec 2025 14:40:07 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C47625A1600;
	Tue, 16 Dec 2025 14:39:43 +0100 (CET)
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
Subject: [PATCH 1/3] arm64: dts: imx8mn-tqma8mqnl: remove virtual 3.3V regulator
Date: Tue, 16 Dec 2025 14:39:23 +0100
Message-ID: <20251216133927.913039-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dVyj56Nzmz3yc8W
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: b6a3cc6271770ced19cc5cbfdde1669a
X-cloud-security: scantime:1.858
DKIM-Signature: a=rsa-sha256;
 bh=Zho2kDWL8J6XWsKmcJQhJUsDkOCGRd6yWhy2/tVl1AA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765892407; v=1;
 b=T5pRLvMl3daFgzInDcFEAxXmDu1MSdFU9s3npIAuTaLh4PfZOlN087yWG3MTB54nIEuADQhb
 2ueVQTEsa4AdbBqNz7yQt7+R1ENuT7fUUtkxK+2xFzSWJ9dC4KA++QZFqj7LHUvl1aTQV3XZBbF
 gX0N8DFlRij54BCCLCIxsGQwobqVp0GBaRpYDTSD+s7ZxmXs6pITisORlV7iKoGYWo9J+gqEwTE
 FCbpxtQnBhlxgZqEjyl70ts8+4R50TSzrju6UJP9kya8RLCtmGwLfP7QfwbTqmRDwglS4FhuXFd
 OnpslP/G2FzQaZZ2CasmGBWBUMLOjvN8nYiPM60eMkDEg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_054020_079338_2F90D379 
X-CRM114-Status: GOOD (  11.19  )
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
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
index 1d23814e11cd3..34d6415348f8c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
@@ -23,13 +23,6 @@ reg_vcc1v8: regulator-vcc1v8 {
 		regulator-max-microvolt = <1800000>;
 	};
 
-	reg_vcc3v3: regulator-vcc3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "TQMA8MXNL_VCC3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -217,14 +210,14 @@ eeprom1: eeprom@53 {
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
 
@@ -242,7 +235,7 @@ &usdhc3 {
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


