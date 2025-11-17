Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C955CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 21:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CEu8IuKnTJ2tRIcpCnAPUz4LRmoQdVE9Rlovx0MZtI4=; b=cvqjMstwrhz7FHb/Xjw2WHf9DT
	ivOoWZwb32y+yQC+DVgNns57e/Yl6p/Qe4D6tGix8Cs5pq+XpLahP/isDu2Rb0yg0wrR1mBkFox+x
	agpvnYC0+Y2pYH13/gcFI5N0sxJcMxOHARG+V4M402qR8ZmSdGVTEiOV1PTbHUKGy09+GXw6uQZQX
	RIyVSDe/TxAtQ1c5UE5jYOW5SS4YwqcxtJOuDE8UzWmsW5pSy5OQlyUAcUEPuPo1kzg6K5N1rqcZy
	g0da6ejHKuDKRTjo0s5Kq55eQLSB0wBc9ia6rUZDHun5a4C1/++BHIrOeC9xSXoKSreWWSKjRd4Pv
	0jsZfhXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL6a5-0000000GsIF-1Wit;
	Mon, 17 Nov 2025 21:16:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL6a4-0000000GsI1-3sRO;
	Mon, 17 Nov 2025 21:16:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1520F6025B;
	Mon, 17 Nov 2025 21:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D717C2BCAF;
	Mon, 17 Nov 2025 21:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763414171;
	bh=Rny+jZeDLyUoMgfhLA3ZQW7WfCvb0CV4WmGd6tU/eWc=;
	h=From:To:Cc:Subject:Date:From;
	b=vIyEQWSwl0kz9lDIVLfMERzm2Wj3SjqPrxVg9KzGw//lkhCq1sZfv8E+vz1Ophr0E
	 0M9xuuVCaTzBOQbe3oyUzcP8kVqwvcWuQMUleuOlwk4g1ySQLbh646j4PI0hQn3dDA
	 l/oa8ezD12vjrVCKjI/5zkjeKEOU4Vv6tqpBs7AOg9XibEs4eCF8xS9HVDP0stZwVv
	 7FXEejjl8hH7TSxIJ1lkrtl9b4eyGy1iQBUUtlTAoTpMYFoV05S6zGeziv8d10vsdP
	 4Xks8WvLIF03Ht1tGic10617YiwquTbu7TKlPRhlBT/pMRaZqy9W+COROHtRVqyN8N
	 ovM5+//+3NIwg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH] arm64: broadcom: bcm2712: Rework rp1 overlay handling
Date: Mon, 17 Nov 2025 15:15:02 -0600
Message-ID: <20251117211503.728354-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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

It's a requirement that DT overlays be applied at build time in order to
validate them as overlays are not validated on their own.

Simply adding a build time target is possible, but it's also not desirable
to have targets which include the overlay contents and apply the same
overlay.

Rework the targets such that there are 2 overlays: the existing RP1 overlay
and the board specific configuration of the RP1 (bcm2712-rpi-5-b.dtso).

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
The missing applying of rp1.dtbo will soon be a warning[1].

The comment in bcm2712-rpi-5-b.dts(o) needs updating or removing. The RP1
driver or userspace handling of the overlay probably needs updating to
handle the 2 overlays. IIRC, I think we can apply overlays to overlays
which may be useful here. If not, adding that to the tools should be
possible.

[1] https://lore.kernel.org/all/20251114222759.4181152-1-robh@kernel.org/
---
 arch/arm64/boot/dts/broadcom/Makefile                 | 10 ++++++++--
 ...m2712-d-rpi-5-b.dts => bcm2712-d-rpi-5-b-base.dts} |  2 +-
 .../{bcm2712-rpi-5-b.dts => bcm2712-rpi-5-b.dtso}     | 11 +++++------
 3 files changed, 14 insertions(+), 9 deletions(-)
 rename arch/arm64/boot/dts/broadcom/{bcm2712-d-rpi-5-b.dts => bcm2712-d-rpi-5-b-base.dts} (95%)
 rename arch/arm64/boot/dts/broadcom/{bcm2712-rpi-5-b.dts => bcm2712-rpi-5-b.dtso} (92%)

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 83d45afc6588..4957edec9d9f 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -6,9 +6,9 @@ DTC_FLAGS := -@
 dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2711-rpi-4-b.dtb \
 			      bcm2711-rpi-cm4-io.dtb \
-			      bcm2712-rpi-5-b.dtb \
+			      bcm2712-rpi-5-b.dtbo \
 			      bcm2712-rpi-5-b-ovl-rp1.dtb \
-			      bcm2712-d-rpi-5-b.dtb \
+			      bcm2712-d-rpi-5-b-base.dtb \
 			      bcm2837-rpi-2-b.dtb \
 			      bcm2837-rpi-3-a-plus.dtb \
 			      bcm2837-rpi-3-b.dtb \
@@ -17,6 +17,12 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2837-rpi-zero-2-w.dtb \
 			      rp1.dtbo
 
+bcm2712-rpi-5-b-dtbs := bcm2712-rpi-5-b-ovl-rp1.dtb rp1.dtbo bcm2712-rpi-5-b.dtbo
+dtb-$(CONFIG_ARCH_BCM2835) += bcm2712-rpi-5-b.dtb
+
+bcm2712-d-rpi-5-b-dtbs := bcm2712-d-rpi-5-b-base.dtb rp1.dtbo bcm2712-rpi-5-b.dtbo
+dtb-$(CONFIG_ARCH_BCM2835) += bcm2712-d-rpi-5-b.dtb
+
 subdir-y	+= bcmbca
 subdir-y	+= northstar2
 subdir-y	+= stingray
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b-base.dts
similarity index 95%
rename from arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
rename to arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b-base.dts
index 7de24d60bcd1..48a0ae118839 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b-base.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /dts-v1/;
 
-#include "bcm2712-rpi-5-b.dts"
+#include "bcm2712-rpi-5-b-ovl-rp1.dts"
 
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtso
similarity index 92%
rename from arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
rename to arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtso
index b8f256545022..89d099c00035 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtso
@@ -15,19 +15,18 @@
  */
 
 /dts-v1/;
+/plugin/;
 
-#include "bcm2712-rpi-5-b-ovl-rp1.dts"
-
-&pcie2 {
-	#include "rp1-nexus.dtsi"
-};
+#include <dt-bindings/gpio/gpio.h>
 
 &rp1_eth {
 	status = "okay";
 	phy-mode = "rgmii-id";
 	phy-handle = <&phy1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-	mdio {
+	mdio@1 {
 		reg = <0x1>;
 		reset-gpios = <&rp1_gpio 32 GPIO_ACTIVE_LOW>;
 		reset-delay-us = <5000>;
-- 
2.51.0


