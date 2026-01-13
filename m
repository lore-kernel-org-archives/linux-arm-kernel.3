Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5049CD2F32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 19:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r/peNOTgTzGUFYVPiT7tpBUbzIfn4ZdTgKaGtsMJe5Q=; b=ijYWMXdRhipzYOqVUwY/up9OKG
	kqBHYlwmlabusy0C0Z8jUGS/JD4RxIJXkhoz583ghR7wq9U8ZFaurRNl1I0lXTrmMqZLANimBCXd9
	snpwlRx+MK8QGhk2IxUChW9LcHWAHASU4kF98PMx/zsW7VTXSTZjzmS8rgaKlr3mDl/u3fOnQyLTz
	i8eFh7kEm8EPWwpU1QBqeA8TDhjNsYxm64cL+zsF/Ro01KjBX3VPDA7jyfm+hkawhb0PmZQPQJ2c+
	UvI3MoKR+MeAynhV7Lh8gyMZ/yLUflRF22WLPnJf7EvF+qqrL1bP/tJ3qUw/ooPPz5lz44ZZSJG5F
	W7mSxwWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfk6A-00000007dSN-3InX;
	Tue, 13 Jan 2026 19:30:38 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfk67-00000007dRr-0KWE;
	Tue, 13 Jan 2026 19:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=r/peNOTgTzGUFYVPiT7tpBUbzIfn4ZdTgKaGtsMJe5Q=; b=e9dUKdor4XnLs4+cbsWzD3cpi+
	31ZxfYMZWguc7zxDrnmFVDEG2blVr/YUXm2JSnSXmq4qDPxp7XBYqwbQkaVYgvZXvFm64yzzuGZEE
	DTpLT6MgaLDORrRfJzdMXRUH5XFUILq1Qqvwu+d/wWCD/HaKGMF5waRgUuBX1QIZ9X6G5OuZHC06H
	mVhd9aLoeCVdNhhjz05FanWhLTj0zrxX90vC+3J7rcG6PeHygdhpg75r7rtrSqzBXnQmhK/LavivX
	IXglOlpYJflfWEXpt8guB0PbECTc9sxnt3vlwPClbzhHbOG/UD9Ei8BJZ9lnfDaj+nDPbX3aW11Ea
	0FHQy67g==;
Received: from [187.36.210.68] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__CHACHA20_POLY1305:256) (Exim)
	id 1vfk5q-004ymG-8d; Tue, 13 Jan 2026 20:30:18 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] arm64: dts: broadcom: bcm2712: Add V3D device node
Date: Tue, 13 Jan 2026 16:28:21 -0300
Message-ID: <20260113192902.48046-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_113036_252851_D25AA15C 
X-CRM114-Status: UNSURE (   9.96  )
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

Commits 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D 7.x")
and 6fd9487147c4 ("drm/v3d: add brcm,2712-v3d as a compatible V3D device")
added driver support for V3D on BCM2712, but the corresponding device
tree node is still missing.

Add the V3D device tree node to the BCM2712 DTS.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 .../boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  |  4 ++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 7d4742ebe247..97522c6803c5 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -247,3 +247,7 @@ &pcie1 {
 &pcie2 {
 	status = "okay";
 };
+
+&v3d {
+	clocks = <&firmware_clocks 5>;
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 330a121ebfcb..4c9c63fcf037 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/bcm2835-pm.h>
 
 / {
 	compatible = "brcm,bcm2712";
@@ -642,6 +643,19 @@ mip1: msi-controller@1000131000 {
 			msi-ranges = <&gicv2 GIC_SPI 247 IRQ_TYPE_EDGE_RISING 8>;
 			brcm,msi-offset = <8>;
 		};
+
+		v3d: gpu@2000000 {
+			compatible = "brcm,2712-v3d";
+			reg = <0x10 0x02000000 0x0 0x4000>,
+			      <0x10 0x02008000 0x0 0x6000>,
+			      <0x10 0x02030800 0x0 0x0700>;
+			reg-names = "hub", "core0", "sms";
+
+			power-domains = <&pm BCM2835_POWER_DOMAIN_GRAFX_V3D>;
+			resets = <&pm BCM2835_RESET_V3D>;
+			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 
 	vc4: gpu {
-- 
2.52.0


