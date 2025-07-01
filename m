Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADF9C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gq5R+w5XrB6J6Y4bhU8dYOmERqkhQgDDpoSeyTTrFX8=; b=dOt0S78l/vttkoNm7HOC7DU8Ij
	ZG35sMCcfymL2VQq04Cre2vdsnq5c8h7pSfTIHWaH4etvaABhBOD6W+BneX13DasdV7YiJi948ujR
	sYmBcij8x7ZStCPfbJYPrOm1wPrulqWnecZsgIWb/w35+HkAZ5TS271FEPpyXnuy7sivJ9G4WSsfF
	hdayNQTSf2NEX9IUW8jysislCVjdcEvSKNuT3f7r4KXfBcKX6LPTilIoDJcU4FbxqmNY0NJ67wmEn
	QHCC7AG8mSeGfBtbTmLJQbMvuHf9y1KdBnZXwSB1Ym8ZmrcjU+Zp+jL6UUlUOc1EZ82SQ5AETPXXF
	e+jkWadg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWV3P-00000004E5i-0TiH;
	Tue, 01 Jul 2025 07:05:19 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUR0-000000048f8-2wiV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351138; x=1782887138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gq5R+w5XrB6J6Y4bhU8dYOmERqkhQgDDpoSeyTTrFX8=;
  b=VYqOh8evcbUcU7SOhldNMi5EgguIRTF6KZk6aakOj/FOJscnE3lW6bAg
   il0qw11Dp93uywrC/oix9PEZQHM7h6Cj1LiBKp10eX5xnn4ke/abknwEb
   5KggqsxQsppcVHv/BwtTqDRFol7bR+el43YJXsEQAB4d2i6s8RxlXYIVH
   giVQVRecr2zfJ2yLWCCcHj7/4TDpvc8rTmEQQDKp5cTzPJC213aBU0RCq
   72uH6Vgak2nVHY9GFu7vsei/z9SpuXrnln6PKErXnFbuBaV+GAPyZXsSE
   tsgp2nCvxUMIDnsY8jLImLdM0huSX2uYA5fjYlYPnY19qm2G04tabx0VD
   A==;
X-CSE-ConnectionGUID: 5FLJjaQlStiVJLpgCH0mAA==
X-CSE-MsgGUID: fljwx/5ESuqKjj5SqyJQTw==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943382"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:37 +0200
X-CheckPoint: {68637F61-2C-ABFC28F4-D6731B76}
X-MAIL-CPID: 73E9D8067A412AC0F8CE377BA54C8275_5
X-Control-Analysis: str=0001.0A006377.68637F6E.005A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4CBE716A583;
	Tue,  1 Jul 2025 08:25:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gq5R+w5XrB6J6Y4bhU8dYOmERqkhQgDDpoSeyTTrFX8=;
	b=SYgu8FkEGPzAHexTMvzd/lmiBcoWTheFuCMMS7chHsWUr9YYPzSpNTCBicYe2hTYoIYQRI
	QU4MOoT7xCvyO3NTAfmYfQO7yU4bhl2vRNIrRCGU1p71YNM24uK7eDjGw4nsKSnuC/qzBK
	2bKrI0py84RvPSqTuIpXny9VdFdkeyzFj3iIv4oXMmmDyTeaMSFEXcH1AU4H0qdz3eSegG
	CnwoPgk2LXTT7cHKa8ceNy9HUNh3gmSzIBHNRPVtaC5wZs00X1dHfDz1O2/2QLl9dbuJ+Y
	RWOpejlDkHbgoZA7HBnHh93k9iCNy4hWVedLpknpn3O+HhShFuiAI+L6/CKUmA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 5/8] arm64: dts: tqmls1043a: Enable SFP interface
Date: Tue,  1 Jul 2025 08:24:53 +0200
Message-ID: <20250701062500.515735-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
References: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_232539_152701_B2B2850F 
X-CRM114-Status: UNSURE (   8.75  )
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

There is an SFP interface usable on TQMLS1043A. Enable all the
corresponding nodes. U-Boot will configure the connection if the RCW
is configured accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts
index 03748a7f657b3..e04483fdb9089 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts
@@ -41,9 +41,21 @@ &esdhc {
 	wp-gpios = <&gpio3 3 GPIO_ACTIVE_HIGH>;
 };
 
+&sfp1 {
+	status = "okay";
+};
+
+&sfp1_i2c {
+	status = "okay";
+};
+
 &usb2 {
 	status = "okay";
 };
 
 #include "fsl-ls1043-post.dtsi"
 #include "tqmls104xa-mbls10xxa-fman.dtsi"
+
+&enet6 {
+	status = "okay";
+};
-- 
2.43.0


