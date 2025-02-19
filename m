Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5066C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWJSQqgv/BGAC3SGvS9AWPMU0gfUh9CUB1ZZemk53vs=; b=VVYTxww1Z89Ru2o2enO8Ml4xzq
	GFp+dV17R1q9p/FfcZszNbJgbloD/sf6cN1hD/fe8hpiJIT3F4suOWDRPzH1zE9sZry8ucs9ORUJg
	WB2g6D+gg+wc4i/dlMU9Q7FqIv9J3fTacEdpiawu8NL4nUCjq0HkX8irq9j66SgkRKeyaEUgIlcs1
	OmobiaFf58akZuGnecCgmnziAc61RKTsvnMJz3qQJrfmfklk8ETTPfOZPlh/4Q+GKAM8ymvnnJxvD
	H3F+6XjoNgeAcdqgXpfMCYGfDaugn1Y93NJ3Tdop6zK0KOwP3cMiDmChpDH8MS7D0VpTRuIxuFX9N
	fuj6aQqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfeK-0000000BbNI-1eH1;
	Wed, 19 Feb 2025 08:41:44 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfHx-0000000BSvS-1ngp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739953117; x=1771489117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XWJSQqgv/BGAC3SGvS9AWPMU0gfUh9CUB1ZZemk53vs=;
  b=X9bM2el4cvv8xrBgCSVwAM9J41+CY1flSfEJYOaq0OG3W/4H+xti5tEv
   N1nU7CKSvrdzRSFBr+TwAQOttCwEZUj8edntCpbEEpdEki54f1tvfgNuv
   A1FvN5b4g4+GhINYCuO/qRYvLkELqn9KgGZZd2Nquxpy/5ejcPJy/B8qd
   0nhUkjHs4J97ZV11+zM05sPQtOgDuDzavGpkwJ4GLyJ44cKm9LX2AWulM
   xg16U3kyOYPBqvXh7mSmBjt97e0BBz6hUz9Qtghf5sj1fYLo77yRYxOiH
   j62yTE6YnTfdY5PpZR60vwJi1yf/aEf/zi/DeTQdgLFmkenhHN6bnjz6O
   w==;
X-CSE-ConnectionGUID: VTYo9hwBThqxhEcVqZeMkA==
X-CSE-MsgGUID: SgnDI1rARWGeU6KlAJvA+Q==
X-IronPort-AV: E=Sophos;i="6.13,298,1732575600"; 
   d="scan'208";a="41945164"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Feb 2025 09:18:35 +0100
X-CheckPoint: {67B593DB-38-B8541F8F-E50F9B0E}
X-MAIL-CPID: F34EA9B9402CADC0B0AD7EE8166E3D9D_2
X-Control-Analysis: str=0001.0A002119.67B593DB.00B8,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96C6D16D476;
	Wed, 19 Feb 2025 09:18:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739953111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWJSQqgv/BGAC3SGvS9AWPMU0gfUh9CUB1ZZemk53vs=;
	b=jsa6/6hHFrprwlcOf7gLmRiCrWeRSmzcx0FTcKH7bLLb3nzGiamIBcPjbyojXm6dtYa1ga
	O5ugPZelYw0e0a5lBNMhPzC2Riegrm1eCP22ZqvcIxDLEV6KJfMs6l85N1YTOVDIoRO25w
	vsCuqfcjtXY8MMvwuGvxGWqoaq84uvMZcgTl0Z+8vyjVegSd2q8vltPa47DkJi+FDb4f/p
	yPKiiArohfsmnywPC3t/KZyK1IV/Am0Wk7A8blobZS0UgGdK+GztQmKUml6bnwJGGMkoxy
	WpCRUNWq/gOr4/8zRj0GIb40iXmbHKl5BjQNh2qDYZlJJWgB0aNcjYOFlhGK6w==
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
Subject: [PATCH 7/9] ARM: dts: tqma6ul: Add partitions subnode to spi-nor
Date: Wed, 19 Feb 2025 09:17:42 +0100
Message-ID: <20250219081748.1181507-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
References: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_001837_787597_2A414FA8 
X-CRM114-Status: GOOD (  11.44  )
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

The bootloader adds MTD partitions in this subnode if present, or in the
spi-nor node itself otherwise.
Setting #size-cells in MTD nodes itself is deprecated by mtd.yaml.
Fix all this by adding an empty partitions node which the bootloader will
fill with configured MTD partitions. Remove the deprecated properties
as well.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
index 1e4022cba3cc5..2dd635a615cb8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
@@ -164,12 +164,16 @@ &qspi {
 	flash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 		spi-max-frequency = <33000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <1>;
 		vcc-supply = <&reg_vldo4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 };
 
-- 
2.43.0


