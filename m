Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6C2D46605
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 17:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jJqqqqDzvQYfjmXmI2SSP0LJ2xmIAbyCRmg3AON9Ljg=; b=EehhuqS0Gq2ImnAuBt25+b/0ZE
	FITIDqhiwf3dSFVl+p3d2dlCgng6+KBDuw+mpY62REeO3brVABrhg5fxPfx3dNJqzTcLIu7X4+U5/
	ZOXlBLg0BKmw2dby+hPr21H8t9zpQHpMA/RaaGO5BAhuWJWyl9nmGvttJkEgB2ZID+brMjZEVZzYy
	leu7TA/t7SZL33Y4Whln4astCaxj7zLdnfOowumwtX6OLdjSJVUnIEc+ejDVgoogF1xtV7A7p9K9X
	sSRAbRZ9T4YEtt45WLXYTx0heSvfhgnGgyONl0DYRNfW7q+rCgFURK/QPoUdqmysksoSODR2toWm1
	qXRhzbiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRLq-0000000Crtl-2tP7;
	Thu, 15 Jan 2026 17:41:42 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRLn-0000000CrtB-45Yc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 17:41:41 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-hpq3.prod.antispam.mailspamprotection.com; s=arckey; t=1768498899;
	 b=ZFB/fuUZekq+fwKzWEy0PB/DhmJl1qgVzgGWAL/ilrTU5nOGqmRJQDZYzzR9l1uIYhS0xcJVKV
	  r3VppEAss6JqKqIAo5QkBoaaX8pMSxvGvoEqc3rUIhswQBndUTY8UNw3MBwC/Im5Bk7Vo2HPdq
	  /+nZ/17CzJxfEbtJol5kvkPwW+b2HnwDmFzlCMfmuaM4uMAJNMTlaSK3NMbiGHmBZxaBcKlzcX
	  J/wNJAs+ezvAvgbhBpG56JTkwiei1/OjbC1SnzLmhSKWEQHGNdJC2SRm+i6kvtqg1/mONCt1XX
	  E3rDkkaP7ClkGkQApsCuec36+tf/Meu50bd6f3GG3HWZhg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-hpq3.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-hpq3.prod.antispam.mailspamprotection.com; s=arckey; t=1768498899;
	bh=5/XD5yQ0m8hyHLQyOtvSUiqjwL8A3Rz39CJULnOQ52s=;
	h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	  Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=ammYboIHGZwjrmiyvj2mfjTwES72A319bK/PJTVpQPJ17LiIyb/rLR7zMZCsWTEYhx6A1DjP/5
	  rpfRHmZ3a4VWxI1Dn8FpLx7fgbQTEYmqbZKVCZ8n0oscH2X3qF0Tr9aZ4Y6qp5Lr8FZ3K4OBMo
	  aDG6NcnAkxGrZXgkS+XyJb6cjSqWnOWvpZTSNdlOoEJ3wVQhSpjP6cO+Ik5TtcJvtbLRmfu6W9
	  YArh0IQoJ9lQn+IxSSZjHCjs5cEdRl4amvc32Jau6j9Fvu8NT6U8DjWe+igYdAXICu6veyY+14
	  jkKHPKF9BUauRfAmRRWdGGfvQoWWOwvItx1FWMS/7gX8Tg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=jJqqqqDzvQYfjmXmI2SSP0LJ2xmIAbyCRmg3AON9Ljg=; b=QwgWZEjhRTPgfJRlA3w7qOU/fJ
	ZSsZRS3knM+41C86uEQlT2Avj76u8m8VJbwUi3axUTgU4vl/g46mjMG5d8qJv7ZYbnc9StGP/JBHM
	D6ikA9PbbHbUrHU6R/4F8ELUPOsAZlgN6dTmrWpiJeMp9nTEABhLAI5wFCb+ChCpSNHc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-hpq3.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vgRLi-00000002Qk3-2gxn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 17:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=jJqqqqDzvQYfjmXmI2SSP0LJ2xmIAbyCRmg3AON9Ljg=; b=TZ7Z9gYoE0x9KQFQfTCiumIhue
	cnE4MJ0WfjTdEz8W/NYBZ7Kz29i31LOBGil/USpbVC0JQzfAlYyUUr4TmXwgmnJJ5mnnLRSGL9Pnw
	STje4iDM59UVxJEbXTpSt6/KSMMKPJoKam0gWafoxaA5CAOPtiJwva2QUqUu/LPhMUM8=;
Received: from [95.248.141.113] (port=62797 helo=[192.168.178.65])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1vgRLb-0000000092k-3uy4;
	Thu, 15 Jan 2026 17:41:27 +0000
From: Francesco Valla <francesco@valla.it>
Date: Thu, 15 Jan 2026 18:41:10 +0100
Subject: [PATCH] arm64: dts: imx91-11x11-frdm: fix CAN transceiver gpio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-imx91_fix-v1-1-9351c3fac76a@valla.it>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0NT3czcCkvD+LTMCl1TA8sUEwNTi5QkMxMloPqColSgMNis6NjaWgB
 s/JISWwAAAA==
X-Change-ID: 20260115-imx91_fix-509d4058db64
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=francesco@valla.it;
 h=from:subject:message-id; bh=5/XD5yQ0m8hyHLQyOtvSUiqjwL8A3Rz39CJULnOQ52s=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJmZagddFkgdyxWrnVXyX2DBGbfZSdxm7dI8ZaqPJlfwd
 SvPKRPvKGVhEONikBVTZAlZd+Penrnm39I2MD6CmcPKBDKEgYtTACYiq8Hwh5evy/zzw1K+NcuZ
 piWs/Fv79eGWeQdija/Ok/RXzNb4kMHwv8iZ9yZ7rQ+Tv7VkZaQchwWHXiHD/gqHk0/S7eZxLWP
 kBQA=
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 8b2e10e6fc4b444d7f1facc8c031c0bd
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vgRLi-00000002Qk3-2gxn-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-hpq3.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_094140_074947_A5966912 
X-CRM114-Status: UNSURE (   8.03  )
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

According to the HW schematic, the CAN transceiver does not have an
enable pin but a silent one. Fix the GPIO property name and polarity.

Fixes: b4bf5e55899e ("arm64: dts: freescale: Add FRDM-IMX91 basic support")

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
index 0d1acf8a55a5b4ac649fc8eb7c7aa2c0724b267d..c25561574d3fc5a9823f187c9d62eb9032b7ef7d 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
@@ -39,7 +39,7 @@ flexcan_phy: can-phy {
 		compatible = "nxp,tja1051";
 		#phy-cells = <0>;
 		max-bitrate = <5000000>;
-		enable-gpios = <&pcal6524 23 GPIO_ACTIVE_LOW>;
+		silent-gpios = <&pcal6524 23 GPIO_ACTIVE_HIGH>;
 	};
 
 	gpio-keys {

---
base-commit: 9b7977f9e39b7768c70c2aa497f04e7569fd3e00
change-id: 20260115-imx91_fix-509d4058db64

Best regards,
-- 
Francesco Valla <francesco@valla.it>


