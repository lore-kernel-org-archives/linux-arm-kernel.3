Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E123C61DE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 22:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HSntGgCf4S9lwFDve4ZGR74yLsskLgsTZijttiRB7K4=; b=iQqaRJB0oh76fFHj+b5KUU8DOY
	bgKznVz7Edn9CCNiT07Zyb3FHot7y516QDUzfxeP5TWhGtBQ7Uc+rTIxqSOk187Z82nZyMkpRAnpX
	jxwFzM3nuo0UqJ5JJTw2vsSGwxivIq1NXUXpc2X3szArb2RYHtoRmwT1WdFfypeowQaDIJK+Pgg3x
	nUvKP0PjmUkLMamH0yiFErG0ynJLUw38igLDQR7x6uJU9BPJK7nScDf+WUl5GiHAbSoKiUlLd1KiK
	hErjNS1AgIE5V5JbJjSbl8j85ZKLQzyEAJ+cm5dOzOmNvgckxHqnHmDdJSjDCHJxgUmVEHMIEr2t5
	AS+dBtOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0nbr-000000089Tb-0CkH;
	Sun, 30 Aug 2026 22:02:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0nbq-000000089TV-10oe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 22:02:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A5FD600E2;
	Sun, 30 Aug 2026 22:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FBF01F000E9;
	Sun, 30 Aug 2026 22:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788127356;
	bh=HSntGgCf4S9lwFDve4ZGR74yLsskLgsTZijttiRB7K4=;
	h=From:To:Cc:Subject:Date;
	b=gzcYflh3zEE4+fEsGhBh+lUBVzfQZkR9R25it8EnXRSOr57i7sZA9YfI/nxCqORYn
	 mmcuNyYZCS2PlUcx/oFlGtaeorEvUZqzc4t2ncDiFIg4c/AzuuMRa4e5SlbG0wT/PL
	 mGo655aCWcydVUKvO6RNDprfelH66HjxE7C9nJq0npFD6aAG9/tROWZ2SrQk6jSMmP
	 I3tZivWpTxSZDsQJ7uUb0DmlkiYFLXAT6WdnCXe66F3ikwlALzvTo1VzbqEMPOJQf6
	 0oBtpbQklyGQANnbUegHdJRenRRUv0eM7/Az0PyUgFU8Py2NQTuiHdC5Ll9u7Q9Dpg
	 E7wNx0s7TsiOg==
From: Thorsten Blum <blum@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Guenter Roeck <linux@roeck-us.net>,
	Wensheng Wang <wenswang@yeah.net>,
	Frank Li <Frank.Li@nxp.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Colin Huang <u8813345@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Thorsten Blum <blum@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 1/2] dt-bindings: trivial-devices: add atmel,atecc608a
Date: Mon, 31 Aug 2026 00:01:51 +0200
Message-ID: <20260830220151.21469-3-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=883; i=blum@kernel.org; h=from:subject; bh=H9JL0oG1Fx6GEBDcIjF35MOjUYeFMqxl1kExqMvxKVc=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlTVvhnf7qgsdayo8d0poCZxtH2PW9qf2282cU7YVel7 NmC2vDNHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjAR0ZsM/5TEfNuiuc88WTxZ MqJt1vafu1b/kX+ywubF3F//5s7bzb6UkeFu9J91WRk3Z/fV88jwu5yuEzqqMut+8eOZPfcYD13 SMGYGAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
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

Add an entry for ATECC608A.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d..3b7876c5a45d 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -69,6 +69,8 @@ properties:
           - asteralabs,pt5161l
             # ATECC508A - i2c h/w elliptic curve crypto module
           - atmel,atecc508a
+            # ATECC608A - i2c h/w elliptic curve crypto module
+          - atmel,atecc608a
             # ATECC608B - i2c h/w elliptic curve crypto module
           - atmel,atecc608b
             # ATSHA204 - i2c h/w symmetric crypto module

