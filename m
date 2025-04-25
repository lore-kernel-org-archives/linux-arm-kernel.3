Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEDBC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 00:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jYVr5pgRgBzRP/yol8HnaMDCGGqfdN8UNSV5u8EJF3A=; b=HC+K+ap41V+FKnr6RIfdI+CbXA
	sF94WjFFie3FLlbZ8QBtq3msxwsddeZ5Ce5uNEtAbCGqVfvolQw61EFO8BdPcSkvzYfAHFi+X0c8o
	uMMdrMxvyzlnycDzubaBuT2kTReJiAjCstkUrfc/jNd58ThMx0zvGxVO7MHS3VtgHc7pUy2xiqKhg
	vHnTzJnxntHkfOsUQiaVDgGuZqPRs6ePFZ54yxUFPT+eD/d4XK1PpeqiaKt2SHiFdbpgYEOKfxOyp
	F1sS6PPHZWUoDsCjWPthb1SGjg1kWMuF51j3nijyv+spaK2idvhAJQg0fQndO8u2VSg8/WFz8ewH+
	C4PQjnUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u874F-0000000FdQ3-3jyA;
	Fri, 25 Apr 2025 00:37:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u872O-0000000FdLU-3lXC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 00:35:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83D8B1007;
	Thu, 24 Apr 2025 17:35:22 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 484183F5A1;
	Thu, 24 Apr 2025 17:35:26 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] arm64: dts: allwinner: a523: fix SD card detect pull resistor
Date: Fri, 25 Apr 2025 01:34:22 +0100
Message-ID: <20250425003422.3465-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_173528_983450_D3B017B1 
X-CRM114-Status: GOOD (  14.40  )
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

Trying to use the SD card on the Radxa board revealed that the card
detect wouldn't work as expected (insert not detected). Looking at the
schematic shows that the pull-up resistor is actually not populated
("NC"), and the transistor just pulls the GPIO pin to GND, but it's
floating otherwise.
So using the pull-down flag is definitely wrong, we need the internal
pull up to get a reliable signal. The same is true for the Avaota board
(there is no transistor there, but it's floating in the same way). There
is no schematic for the X96QPro+ board, but experiments show it's the
same behaviour.

So change the GPIO flag for the card detect GPIO property to activate
the pull-up resistor for that pin.

Fixes: 80e0fb4e491b ("arm64: dts: allwinner: a523: add Radxa A5E support")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

please let me know if I should split this up into 3 patches, with proper
Fixes: tags, or if you can maybe squash this into the original commits
still?

Cheers,
Andre

 arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts | 2 +-
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts  | 2 +-
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
index 03c9a9ef5adc2..2d2f3af91d05e 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
@@ -56,7 +56,7 @@ &ehci1 {
 
 &mmc0 {
 	vmmc-supply = <&reg_cldo3>;
-	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* PF6 */
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
 	bus-width = <4>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index c0bce3f4fa925..59db103546f65 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -56,7 +56,7 @@ &ehci1 {
 
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
-	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* PF6 */
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
 	bus-width = <4>;
 	disable-wp;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 85a546aecdbe1..dea2acc1849bb 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -66,7 +66,7 @@ &ehci1 {
 
 &mmc0 {
 	vmmc-supply = <&reg_cldo3>;
-	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* PF6 */
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
 	bus-width = <4>;
 	status = "okay";
 };

base-commit: 1e5a69d67d1b3c55c9b0cd3933af1436b5d52aa1
-- 
2.46.3


