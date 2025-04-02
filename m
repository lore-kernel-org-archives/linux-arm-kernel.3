Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194B5C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 21:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IRwWJoTb/zci8npexEk/JQXCmlXQAAICaqugGRSZGLQ=; b=I6Ybb98O/Ybz5qZH6haiIfpDxj
	9X10JrgZl3BCn5+Aw+rOZpf28fhB/aAhrHfe/nsgufJ5jjRvUMTzT3+aCB09+q9Zai2fPCbkkCWOL
	yC5Ei6CGb39zPTtT9QfdVMX2EzMJGfacnpHf9Ejidnt0mH+OnbpQksA6rIgNenrB9K6fF7ySaTs6u
	dAZhDl3LSWqLJwrz962XMcgZVIaIIPJM7wCqdTsapq59HvBxFrAx/MQ3Dse+/4BGK+bxiFVRFJY9A
	9TXzpI7wRte2NM4qmGGgxS70mQ2Ew7ElnafLaChrvrRhlNjT8sS8WxRsLOfK3lBLXxWJYj6uPbQ7Q
	PxGHtEGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u05IS-00000007D3b-1ah3;
	Wed, 02 Apr 2025 21:06:52 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u05Gg-00000007CbZ-2vO4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 21:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=IRwWJoTb/zci8n
	pexEk/JQXCmlXQAAICaqugGRSZGLQ=; b=PSBULvXla3ymlhxKKqzh79nh06VdmF
	TfcJffZliMTlmAGW91bDGyE5sskFhf9tQ6z86UCDsC4GEvlI4h7xMMTtPKots9lw
	1p1Mqx7jzOJXC4tRjawrwAdb9L9MYCEvHRcW2OYu8CK81llvV/EdL9MNoBZJJhQ2
	NhFpZ6XvXKlgF/seGH54i6ROtT/qRN4HtQaATKEhiykk9SR71HKZh/MXowlLVs0y
	sE/L0YDwwy8k5/FBxm/bKMQ8o3bw7i/M8oxTXujr0ykDTflqKm0SE+cVd3gm665b
	bKPnPvHUc7UZ6PTBwnvuVs2wd8+ngNwl/4ueH+2iR8aIfc+ycIEHvwCQ==
Received: (qmail 2136986 invoked from network); 2 Apr 2025 23:05:00 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Apr 2025 23:05:00 +0200
X-UD-Smtp-Session: l3s3148p1@MJagAdIxSpgujnsv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Boris Brezillon <bbrezillon@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: at91: at91sam9263: fix NAND chip selects
Date: Wed,  2 Apr 2025 23:04:46 +0200
Message-ID: <20250402210446.5972-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_140503_011511_440A6B48 
X-CRM114-Status: GOOD (  10.77  )
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

NAND did not work on my USB-A9263. I discovered that the offending
commit converted the PIO bank for chip selects wrongly, so all A9263
boards need to be fixed.

Fixes: 1004a2977bdc ("ARM: dts: at91: Switch to the new NAND bindings")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/microchip/at91sam9263ek.dts | 2 +-
 arch/arm/boot/dts/microchip/tny_a9263.dts     | 2 +-
 arch/arm/boot/dts/microchip/usb_a9263.dts     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91sam9263ek.dts b/arch/arm/boot/dts/microchip/at91sam9263ek.dts
index 471ea25296aa..93c5268a0845 100644
--- a/arch/arm/boot/dts/microchip/at91sam9263ek.dts
+++ b/arch/arm/boot/dts/microchip/at91sam9263ek.dts
@@ -152,7 +152,7 @@ nand_controller: nand-controller {
 				nand@3 {
 					reg = <0x3 0x0 0x800000>;
 					rb-gpios = <&pioA 22 GPIO_ACTIVE_HIGH>;
-					cs-gpios = <&pioA 15 GPIO_ACTIVE_HIGH>;
+					cs-gpios = <&pioD 15 GPIO_ACTIVE_HIGH>;
 					nand-bus-width = <8>;
 					nand-ecc-mode = "soft";
 					nand-on-flash-bbt;
diff --git a/arch/arm/boot/dts/microchip/tny_a9263.dts b/arch/arm/boot/dts/microchip/tny_a9263.dts
index 3dd48b3e06da..fd8244b56e05 100644
--- a/arch/arm/boot/dts/microchip/tny_a9263.dts
+++ b/arch/arm/boot/dts/microchip/tny_a9263.dts
@@ -64,7 +64,7 @@ nand_controller: nand-controller {
 				nand@3 {
 					reg = <0x3 0x0 0x800000>;
 					rb-gpios = <&pioA 22 GPIO_ACTIVE_HIGH>;
-					cs-gpios = <&pioA 15 GPIO_ACTIVE_HIGH>;
+					cs-gpios = <&pioD 15 GPIO_ACTIVE_HIGH>;
 					nand-bus-width = <8>;
 					nand-ecc-mode = "soft";
 					nand-on-flash-bbt;
diff --git a/arch/arm/boot/dts/microchip/usb_a9263.dts b/arch/arm/boot/dts/microchip/usb_a9263.dts
index 60d7936dc562..ebaf198e1bc4 100644
--- a/arch/arm/boot/dts/microchip/usb_a9263.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9263.dts
@@ -84,7 +84,7 @@ nand_controller: nand-controller {
 				nand@3 {
 					reg = <0x3 0x0 0x800000>;
 					rb-gpios = <&pioA 22 GPIO_ACTIVE_HIGH>;
-					cs-gpios = <&pioA 15 GPIO_ACTIVE_HIGH>;
+					cs-gpios = <&pioD 15 GPIO_ACTIVE_HIGH>;
 					nand-bus-width = <8>;
 					nand-ecc-mode = "soft";
 					nand-on-flash-bbt;
-- 
2.47.2


