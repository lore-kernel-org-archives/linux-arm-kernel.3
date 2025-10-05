Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2744CCCA472
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Oct 2025 21:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CSMS0CXfRVEbW7/IAycMvjhwOpwfcl8AilW2Tzo8ENw=; b=T0bXvfEDkToZhhxXymxWrTj3Va
	rxR9xFiwKSGsvF2kI/eJxDg/zzs9aqTq80OE6eQZFwS00lScq1A3Z94/KMwitcTUW8yZAAr0X/+/B
	zf8JEaoLJ3Veu+3she/f4r6Zt/ZOPoQCMBVESYP7FRnnIpu89Tj18Gj6NRDynE2f7p/i9hTsaiYWw
	DolhlHruFRXE8zPnUwl8vePFqEDxm3ZtKdrDJhNGJ/hhiiTKxoQeEYQJsSJPjmA07o1kVvveBqmmG
	64b7v2wqZjzUZvqU7sZxarQjOPhTm1vzw9jArbEEcGcRNhJCAHSdk5DKmrjbmVinnW4WGhO30SpH0
	iu+gZn8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5WeK-0000000Gg9F-20At;
	Sun, 05 Oct 2025 21:52:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5WeH-0000000Gg8u-1l88
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Oct 2025 21:52:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5EBE34E40EEA;
	Sun,  5 Oct 2025 21:52:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1806E6065F;
	Sun,  5 Oct 2025 21:52:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D71EF102F1CFA;
	Sun,  5 Oct 2025 23:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759701125; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=CSMS0CXfRVEbW7/IAycMvjhwOpwfcl8AilW2Tzo8ENw=;
	b=xTjpe0gj2TcjVRSgjDHkX32NBe/s8UUmjSZqoM89yCanjaSMZp4DG3xMU2WmZhUtnwSR8f
	o142dWAQbz5ERd4KUleFMQB86xSjzPwxx5YXGt29yIL/86YRGhs5JNSUBaW5Bz+coIXj+F
	FP21CgZY1iBR+dwCPcE49cU6EPNKjaqBk3rV4L2grasbi5YtK/l8zbfTNxa+JyVBom4QoM
	8871x2WB77IXzl6XPdSjR2ooe4haD1C2zMk8+qHF54Khd9gOl3UEc+V9e6vv6wtvc4HzW3
	ydOPF6z1jxJ8bo8C2VBwn+/+8iag71I/XflX/mrkTc4sf+HqK10HEFyo6ooqKA==
From: alexandre.belloni@bootlin.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: imx6q-evi: fix rtc compatible
Date: Sun,  5 Oct 2025 23:51:45 +0200
Message-ID: <20251005215146.3804629-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_145209_751282_17DE8513 
X-CRM114-Status: UNSURE (   9.21  )
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

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The correct compatible is nxp,pcf2123

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-evi.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-evi.dts b/arch/arm/boot/dts/nxp/imx/imx6q-evi.dts
index 78d941fef5df..5da9631cb3ec 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-evi.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-evi.dts
@@ -134,7 +134,7 @@ eeprom: m95m02@1 {
 	};
 
 	pb_rtc: rtc@3 {
-		compatible = "nxp,rtc-pcf2123";
+		compatible = "nxp,pcf2123";
 		spi-max-frequency = <2450000>;
 		spi-cs-high;
 		reg = <3>;
-- 
2.51.0


