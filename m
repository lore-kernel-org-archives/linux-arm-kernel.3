Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E895C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 10:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFFX1vGDF+B307v2ULpRo/T+yugzgXw/qkTFoNDd/pc=; b=rJBX5Ny5L0zgyCD6ZUOf3PZkyU
	vMHEBruCj75xOfMuHu/eeeDK53kQEhEy6kN2s1cBliHyVjR9+mmBEQjZghvT5YXX3JAKcljfBKvVf
	vyAb01tH3pUmLD5kupABNaXz0hbifP1lKhstPuIi1au7i4Qm9FSYCA9HOXcgmnx2axRVjQ13IaTmF
	5ich0g5cBUznYNxaCM7SX6RLoUnfeptsU8c/YuxNAtUuGVWy6m9LoMIAPGThcAVNbj8oKxWxNSqhf
	l9woK+fMNibEafTfTEtvyTM4mb/8p3PPqtzzoBbjYVBqqvZvTeC1me27NjoZwCdej4IkRZ2dla6rf
	FaC9DqHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titMu-0000000EZnN-1Y5O;
	Fri, 14 Feb 2025 10:56:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tisDD-0000000EMv6-0fqK
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 09:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IFFX1vGDF+B307v2ULpRo/T+yugzgXw/qkTFoNDd/pc=; b=ojZucgLHBYjOqNiezm5Ypn7L7w
	dMGMnaTGAXXtsn00y54iqbWG61IZKKKEPH3puqwv1B4LVeHrjDAtXJSwfWb14cGqMyj1n7KAbyI93
	a9XTuvdFcslA+UXbA58mLs8I7+s+JUJkOGZOfaKtI5z/IMS3Ofl7qp5JPMCNV3BnCKFa7ZIbuTjNj
	UmuPPWYVRKhoXl208vG9cJ3k4bX6x7M1zlP9bZieQv0j++XjtJPur5lQINxPCML5JQcmFov+OUe20
	u0Y9HupldmFiAmoJx5WPa74qPvtcRnM/TzMuuPaFcRaM3Ad9kYTIZjXoboO/IXig9JtUSLmdJwd9O
	J98L3JWw==;
Received: from weierstrass.telenet-ops.be ([2a02:1800:110:4::f00:11])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tisDA-00000001DWQ-072E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 09:42:17 +0000
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4YvRsb55NRz4x2Mr
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 10:42:11 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:6395:73cc:7fc4:4cab])
	by albert.telenet-ops.be with cmsmtp
	id DMi72E0091MuxXz06Mi7Ja; Fri, 14 Feb 2025 10:42:08 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tisCj-00000006Xjm-3TOO;
	Fri, 14 Feb 2025 10:42:07 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tisD1-00000000ggb-0ErY;
	Fri, 14 Feb 2025 10:42:07 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: dts: renesas: r9a06g032: Drop snps,dw-apb-uart compatibility
Date: Fri, 14 Feb 2025 10:42:04 +0100
Message-ID: <e290dd28ecb68b4e164172a905da18a5a2d438a1.1739525488.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739525488.git.geert+renesas@glider.be>
References: <cover.1739525488.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_094216_251064_2A4C9BF7 
X-CRM114-Status: GOOD (  13.71  )
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

make dtbs_check:

    arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: serial@40060000: compatible: 'oneOf' conditional failed, one must be fixed:
	    ['renesas,r9a06g032-uart', 'renesas,rzn1-uart', 'snps,dw-apb-uart'] is too long
    ...

As per commit 72b0505f0830df95 ("dt: serial: Add Renesas RZ/N1 binding
documentation"), the RZ/N1 UART is a modified Synopsys DesignWare UART.
The modifications only relate to DMA, so you could actually use the
controller with the Synopsys compatible string if you are not using DMA,
but you should not do so.  Hence the first three UARTs (which don't
support DMA) were added with a "snps,dw-apb-uart" fallback, to use the
existing Synopsys DesignWare UART support.

Since support for the RZ/N1-specific compatible value was added to the
driver a long time ago (commit 2ff5fa7f742ab0c6 ("serial: 8250_dw: Add
compatible string for Renesas RZ/N1 UART") in v4.19), the extra
compatible value can be dropped safely.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Alternatively, the bindings[1] could be augmented with an extra section:

    - items:
        - enum:
            - renesas,r9a06g032-uart
            - renesas,r9a06g033-uart
        - const: renesas,rzn1-uart
        - const: snps,dw-apb-uart     # RZ/N1 without DMA

and perhaps extra logic to prohibit the dmas property when both
renesas,rzn1-uart and snps,dw-apb-uart are present.

Given the complexity of the latter, I went for the simple solution.

[1] Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 87e03446fb4de705..fc523106c2a4c6a0 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -171,7 +171,7 @@ usb@2,0 {
 		};
 
 		uart0: serial@40060000 {
-			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
+			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
 			reg = <0x40060000 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -182,7 +182,7 @@ uart0: serial@40060000 {
 		};
 
 		uart1: serial@40061000 {
-			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
+			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
 			reg = <0x40061000 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -193,7 +193,7 @@ uart1: serial@40061000 {
 		};
 
 		uart2: serial@40062000 {
-			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
+			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
 			reg = <0x40062000 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
-- 
2.43.0


