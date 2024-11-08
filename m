Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29646D5C0CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VEdBueLI1ZjfkzMCSa/X/pKgPcRao7Q2giqmCeJUg0=; b=tT2Eb1mvzp2n4fKuWccw3PA+tP
	i2bOzHf0oE9OhXbzkolUFQREAFmmWIuwRMHsuippp5y1hp6vaB3Q6BgjBWs/qtk65J4Qt21mbNp40
	vQT+z45BHZSVwIoAwSZuuWYHGfS9qb7WmNVfmBq0Rv5pQKtI24OSsA22tI+nOKzw50i46V44y5FTY
	kQ2Ix6165GQSULLWN8h+qK/TL9LJ1Czvt2uMleJDn7itU7DB1U8dh461GFhFyn7uBsaeOOycp9wzi
	Zxe/Rr/0a6jBr+uWnCUe9ggDZYob0H46fFjsZSW6Kn4PTiHAllVWjFW0G79c8ohRgixpjilAZBiqm
	pGGwJZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pfv-0000000AnrH-2FOz;
	Fri, 08 Nov 2024 14:09:23 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PND-0000000AkVW-3mto
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1731073803; x=1762609803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6VEdBueLI1ZjfkzMCSa/X/pKgPcRao7Q2giqmCeJUg0=;
  b=TCnJRJJD7MDBWO7HNT0aftS04C8HNnPnV3HxXVOgnI++EmD1VjxVM9Hr
   kBnpFq+q6579YN0rK4jyNPEHoR2fY0fSaV09Z5c+OJaZPJb5e1H2Hxkd8
   77fnQzfovrihveI6P1dRPrfZjiBmM+RIO0jxYQVVAeQEa8jflLm/4vkr5
   xGrgUsSJWQEyibORO+GzbEutBl/yCFl6ZjCtV/7p6AoGKxa+olPeBub+9
   L9zKCUEI7EqKWKXM8vBTaw51hj2iZ1VOdxikESp77RkLZh98kFefrrTv3
   4DtjOA+ZuxRaAjRYfMDTDtJd6A9CqtUS2xvcSLitLy+Qak5v0jBqRjWgT
   A==;
X-CSE-ConnectionGUID: aoI2RKBZT2ibGUF/b80EQA==
X-CSE-MsgGUID: r4S1ie5dR1KMX8z8cbsF8A==
X-IronPort-AV: E=Sophos;i="6.12,138,1728943200"; 
   d="scan'208";a="39936931"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Nov 2024 14:50:03 +0100
X-CheckPoint: {672E170B-6-1E10F2A5-CC0651E5}
X-MAIL-CPID: 120CD5C5C687A142EBA8A2F52FDF6C04_4
X-Control-Analysis: str=0001.0A682F16.672E170B.006B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D01F163B29;
	Fri,  8 Nov 2024 14:49:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1731073798; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6VEdBueLI1ZjfkzMCSa/X/pKgPcRao7Q2giqmCeJUg0=;
	b=qN7EopXFZllRLFdKTRqqAw/9lu/6zxCkLqnHEOZwd1CfRbVqr1sGVEa6ps2DmDMGt+BPgq
	H7MowwxAOh8aQMFlpvkVyg5eZZEwe4heHOTBtJzlamwxZZoBaBmO0car6OUWcN7Yz6PS97
	Sa28QKLbe5VnL32e5ErQ06Q2WV6sPJyeV5ibiCL/356II0xVgVUw0q4731dX6/90iVptJZ
	j0I0sR9vwj3QE7ippPxeyjncxYTcS980SWbwmxgAlKuQrgbBiJ4B4Qgtaa5A3PGo0q4el0
	0ebPCCEUZ5iDMe5GcShF9KeLkrdXlU3wivsLTF7T+FGg4FyCg9x6t5FmCZIBqQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Jo=C3=A3o=20Rodrigues?= <jrodrigues@ubimet.com>,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] ARM: dts: imx7-mba7: Fix SD card vmmc-supply
Date: Fri,  8 Nov 2024 14:49:23 +0100
Message-Id: <20241108134926.1324626-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
References: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_055004_275942_67639516 
X-CRM114-Status: GOOD (  10.36  )
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

The SD card is directly supplied by VCC3V3. Remove superfluous regulator.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
index a23d7b0a195f1..077700a5f4c3d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -87,14 +87,6 @@ iio-hwmon {
 			      <&adc2 0>, <&adc2 1>, <&adc2 2>, <&adc2 3>;
 	};
 
-	reg_sd1_vmmc: regulator-sd1-vmmc {
-		compatible = "regulator-fixed";
-		regulator-name = "VCC3V3_SD1";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-
 	reg_fec1_pwdn: regulator-fec1-pwdn {
 		compatible = "regulator-fixed";
 		regulator-name = "PWDN_FEC1";
@@ -676,7 +668,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
 	cd-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
 	wp-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
-	vmmc-supply = <&reg_sd1_vmmc>;
+	vmmc-supply = <&reg_mba_3v3>;
 	bus-width = <4>;
 	no-1-8-v;
 	no-sdio;
-- 
2.34.1


