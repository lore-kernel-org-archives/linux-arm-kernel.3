Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C3DD5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzG2aK1GVW0ex3YNys5CXQHwFKyU6+m+2ltQfsJR9+M=; b=jnhHkS/AiG6en1+to+iOYt5tS/
	HnIq1GavYRcNiPCSaeBq8TGPhpqLPiiwvnGhMvwci5ZS6x36M0v9lAHvn3/v36wgFvixdVPnhLK/4
	EsNvM2yhf2oE2OCOYaAFc2bksp9tQDrG8k+6MWX3PlhbwHo1CwIiATBNX/HeqPycR829SkrC+VR5u
	y2VXTt/krOnG4VcYgAqOKAU9skja934H0xXu5kOhY3w/t+3UjcBXBIFW+4YSC6+23ZhAQ0rZZaosr
	ilYpCq8oTPDUuHtlVcj/QQbdYMmG164fp8+Kya77EFbrwUfDiMN+dMZtr5+rRq31a5mXswjwzEHpo
	SRNKnHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PYw-0000000AmmF-18OH;
	Fri, 08 Nov 2024 14:02:10 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PMu-0000000AkTX-03W2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1731073784; x=1762609784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YzG2aK1GVW0ex3YNys5CXQHwFKyU6+m+2ltQfsJR9+M=;
  b=Nw9pPA8bJzuGOW5n2CLCy/pwgggo0freCNU/R6LhQ6/wac0Kv5X99f1n
   D/Ko+LxmGJhHMJVL2gbBpTem+GULoRH/2pbk+I/gzbki/1NQfjZjKvJ+T
   ZAUyAk8nIGZ/xWYQ7rIrIlI8mo1TpUKGo2gRLz8YNKlx22N68ZtGvWoyl
   kobSpVYH/bNj4yjerRKmPu5GK1LLSQIT6yY6c3ijG+itClmmnJwr8HWi6
   IL9A1w6wHwlJpij2XdwX0bmA9jL2I+iUZvLet4WWfvf3981ah6LJxW8HU
   y8U+PlghVxLwkv9lICcoh5XIF79/jrRF0U8Vo6SEoytQecC4LmDou+oCu
   Q==;
X-CSE-ConnectionGUID: rVST2ef8T7yfeoUOPqNzCw==
X-CSE-MsgGUID: pW64X/1jQyaOKrV5a1hMIw==
X-IronPort-AV: E=Sophos;i="6.12,138,1728943200"; 
   d="scan'208";a="39936926"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Nov 2024 14:49:42 +0100
X-CheckPoint: {672E16F6-0-D31EDE1A-D52D6119}
X-MAIL-CPID: E0BE50821D55E48D00E2880561651115_5
X-Control-Analysis: str=0001.0A682F2A.672E16F6.005C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A8BD164DD5;
	Fri,  8 Nov 2024 14:49:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1731073777; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YzG2aK1GVW0ex3YNys5CXQHwFKyU6+m+2ltQfsJR9+M=;
	b=l5zFpuZq4NY3O0EOniQ0bkFwlI4FSQz0Z0VfKSojNc6BWmhg1DmGgdGVJSw92PsdzAi5Xh
	Wr+KJnynmUsec70uYMnMJe9XEpp/XrXoEvDS/1vZNHCAakdoyF1iQ59lkDunHq8NSb6xGm
	CTfxlvVABIdPeT1/E7hMtzAYHGCmBm55IiH3jizBzQLBz9n+L+aAONQHaPia4x04LyOzQl
	J3W1Hzsf5WW6HkJDROkRu07zdecvE9GQYcCUrCgI/aw79u3cEpTDdvIwHHwMEWHJATw1fH
	EsKy6d6yVSJ77+4Q9TJWKZGD3YGnXyIv7f8VK/+rHGuhKkirr6YY6Fyh5YOpPQ==
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
Subject: [PATCH 1/8] ARM: dts: imx7-mba7: remove LVDS transmitter regulator
Date: Fri,  8 Nov 2024 14:49:19 +0100
Message-Id: <20241108134926.1324626-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
References: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_054944_441033_E25E512C 
X-CRM114-Status: UNSURE (   9.07  )
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

This regulator essentially controls the SHTDN# pin of the LVDS encoder.
Remove it for proper usage with 'lvds-encoder' driver.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
index e1c401f468e16..cc3760fa7d981 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -162,15 +162,6 @@ reg_mba_12v0: regulator-mba-12v0 {
 		enable-active-high;
 	};
 
-	reg_lvds_transmitter: regulator-lvds-transmitter {
-		compatible = "regulator-fixed";
-		regulator-name = "#SHTDN_LVDS";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&pca9555 1 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	reg_vref_1v8: regulator-vref-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC1V8_REF";
-- 
2.34.1


