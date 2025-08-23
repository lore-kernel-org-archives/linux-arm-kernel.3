Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5612DCA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdaWPI1cu75bm+vy4q+AG8ToHjhIBdBDvqctNSZ0c9E=; b=Qci/mhkxURsZoHlGp8KMDmIE9Q
	qIFEZ84JK+Yz8uLKmfxZwaxGI5HnjPtUSWq/5i88kYg4B2IAeL0I+3NMTl/Uy/o/T87eGQ7KWtsKz
	3LgNNzhQ0RpGDYTbJ8u29SefDb+paK+cB/VqRwvnZAXY4719jsTHSN+z762LJXO6OclRl9bXbRxzy
	G54Ba4VLggfLCR8G44CLqJ6F4ZCNUMXeeibNlVi2qxxCtG7XEiN7ZI0EY/oPg2lz4hMDh+lMEecz7
	D6KR0b+36OwgBIR5vo7VNvlS8VLXTdV2Pd9EWtJnQa6rjVi+29Hc0RYoLtB4aKtyBN5aaVecF9LfV
	sJAFaMGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplBO-00000004bAb-1D4W;
	Sat, 23 Aug 2025 10:09:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upksw-00000004ZqI-2miU
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 23 Aug 2025 09:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FdaWPI1cu75bm+vy4q+AG8ToHjhIBdBDvqctNSZ0c9E=; b=pgoo6aNauz7oy2gYZeGlTRfQXn
	/g5BiWbUQAmskvjQuxLCrYWJcYhqkwLxxe8Bjm+WFCTGIW1Nd8SXjKyFnEgWQxC01T4ALhNoooO0Y
	YSQUpMtrs1g+ve3XBqb2Smq+7KJjwlyYosWDrwJWDd0o1ujBSMbShZ/CEG8gO8Fl1/aB0P85vsOwr
	apkX0iQtjV17lopjPH5Pe8eGntbVUce//UBO1L6SSs0M3GYabDiNDgTixrK2ELRwl6fvyLsfwz4oF
	m3MvDzDmuo4k/WnZTLxHUC42/lLG68++ytqsCg0zZ/DebRouh2a/y4FLKJnjySVvuqG2MrTBM8N8g
	jhkkJNSA==;
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkst-00000001PU0-26Ai
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 09:50:05 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 242951D00094;
	Sat, 23 Aug 2025 05:50:02 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 23 Aug 2025 05:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755942601;
	 x=1756029001; bh=FdaWPI1cu75bm+vy4q+AG8ToHjhIBdBDvqctNSZ0c9E=; b=
	uRzPndwZrsEJTyO7qkfN+2MV4g9idftti+42350iNiAVXL4iq9eGLCW1sbithB57
	GCGnrMzxj2uoWHYYNn+T+jgfX/qgQBk4WRJTo8n70dxHY1HiDAGxb9ba4dD+MBvi
	uhu2AI79jjEpjc7wRPI8vo5KVJrGxjn4LC5G/Y6XwaAW6fnnPxkE+6dqLpuaBg8a
	nf6/egFp3vGUGxCrDPjInX0NLXiSpuR0iizCG+qusFKXvBHp1O+nnze2hNwMHu8I
	1riQIqL+l4TCF5IWxuPOMuM39wBZRuBhmynCfRcojutE5MbVcBVdrx3ssPMcw33Z
	vMZl3RBMI2TdXLE9mtPAnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755942601; x=
	1756029001; bh=FdaWPI1cu75bm+vy4q+AG8ToHjhIBdBDvqctNSZ0c9E=; b=J
	79o/LNyUfLaAFYXCsEoBUuSRU4Zgozl8uNHzC/0Jc+jZYuTaSsvdr+NBPZRUCJXP
	Igvl34vLb0A9ym417+2pe0mys1WB1qOfGwCINEJRIr86G9NIyGziGR0YlGLUPTGZ
	qH5u4dYRIMZLyqkVpJiPz69/IzWKZRH1P3OJt5oGzl/xU07tho4Z7ttBx8tqp8e3
	WYP/Q4S92vLu3bTT8e18Ro9tGabdA8jiUKewjs1LyJcyN4wyYcLXWxfnjbJTKXBD
	XT3FB59nOo3LmfPIvXr9c9iHUFvl69rsmwf4m6OK/b2b+MUT4/SjrJaw7LKaMwJv
	Z5BCsusZZdQONgic4xAdw==
X-ME-Sender: <xms:yY6paP47CIyZD0EGbuzHabdg2YmKye3rQZ6LDXgSeQlvf0mlf-AKhQ>
    <xme:yY6paMIMB19py-WOgfzN2RQR5m-vX2CXEwateuhumiw1EKqvnpoaKFkAYFP0qRaz0
    ZHSBuNiMaeRku7rheQ>
X-ME-Received: <xmr:yY6paBUCz_pMEuyOrxPTh_b_-dSDnNbqc7TGEUQxb4p7o5-oPZznz-CLoENkumRBA2TO5LcgcEdinXlnpe0JrQs88140Zy0TqUND2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieeifedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepkhgvthhtvghnihhssehophgvnhgsshgurdhorhhgpdhrtghpthhtoheprhhosghh
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprh
    gtphhtthhopehmrghrtggrnhesmhgrrhgtrghnrdhsth
X-ME-Proxy: <xmx:yY6paAFJyQZs0DlnYEsPAYHP_WnNgLs6CCIM3WM6roUJoczq-UUYbg>
    <xmx:yY6paI46VYSp5EKTMXbSxTouKPuKlL9sfA8K0u6l5ZCBUdl9akrGqQ>
    <xmx:yY6paOcVSewDnj6k0hblfMsEG6WKYvEoSxIJDE4qq8dv05Es68pFug>
    <xmx:yY6paEldoAjEa0aPKj22HkF8cop-xRMQnLnEptXyZtyTiOe11kCODQ>
    <xmx:yY6paLlrUHPVmX2PdOsRV6nhYRfUkEJywn9LO12VLjBLbMw7GAPel5so>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Aug 2025 05:50:01 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Sat, 23 Aug 2025 11:49:48 +0200
Subject: [PATCH v2 5/5] arm64: dts: apple: Add devicetreee for t8112-j415
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-apple-dt-sync-6-17-v2-5-6dc0daeb4786@jannau.net>
References: <20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net>
In-Reply-To: <20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3317; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=xEVrh3+WA2vAWDrkpWrh52y7/8LmQkfrJtSTPdvSQfY=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhoyVfTv1j3vGXq/dolp/KZBv9qXNx28fPJ23o1jno1rhF
 QZF/l1yHaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACbyIZyR4VrqSxXXqOAJIYrS
 e8pNt6jVLZCM2G1QvKKtNqRXp0F8GsNfEae98//M477DklzJ8eFui/jRo3mBx36qVXGZa/o0/GH
 hBgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_105003_873666_5E377B6B 
X-CRM114-Status: GOOD (  12.31  )
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

The 15-inch M2 MacBook Air was released a year after the 13-inch one
thus missed in initial submission of devicetrees for M2 based devices.
It is currently a copy of t8112-j413 with edited identifiers but will
eventually differ in a meaningful way. It has for example a different
speaker configuration than the 13-inch model.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/Makefile       |  1 +
 arch/arm64/boot/dts/apple/t8112-j415.dts | 80 ++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index 4f337bff36cdf51837ac7d50122692895026ce14..df4ba8ef6213c9f7e4ef02a50d7250008977cc71 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -80,5 +80,6 @@ dtb-$(CONFIG_ARCH_APPLE) += t6001-j316c.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t6001-j375c.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t6002-j375d.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8112-j413.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8112-j415.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8112-j473.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8112-j493.dtb
diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
new file mode 100644
index 0000000000000000000000000000000000000000..b54e218e5384ca89155e4350d6680a28a531f408
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple MacBook Air (15-inch, M2, 2023)
+ *
+ * target-type: J415
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/dts-v1/;
+
+#include "t8112.dtsi"
+#include "t8112-jxxx.dtsi"
+#include <dt-bindings/leds/common.h>
+
+/ {
+	compatible = "apple,j415", "apple,t8112", "apple,arm-platform";
+	model = "Apple MacBook Air (15-inch, M2, 2023)";
+
+	aliases {
+		bluetooth0 = &bluetooth0;
+		wifi0 = &wifi0;
+	};
+
+	led-controller {
+		compatible = "pwm-leds";
+		led-0 {
+			pwms = <&fpwm1 0 40000>;
+			label = "kbd_backlight";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			color = <LED_COLOR_ID_WHITE>;
+			max-brightness = <255>;
+			default-state = "keep";
+		};
+	};
+};
+
+/*
+ * Force the bus number assignments so that we can declare some of the
+ * on-board devices and properties that are populated by the bootloader
+ * (such as MAC addresses).
+ */
+&port00 {
+	bus-range = <1 1>;
+	wifi0: wifi@0,0 {
+		compatible = "pci14e4,4433";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		/* To be filled by the loader */
+		local-mac-address = [00 10 18 00 00 10];
+		apple,antenna-sku = "XX";
+		brcm,board-type = "apple,snake";
+	};
+
+	bluetooth0: bluetooth@0,1 {
+		compatible = "pci14e4,5f71";
+		reg = <0x10100 0x0 0x0 0x0 0x0>;
+		/* To be filled by the loader */
+		local-bd-address = [00 00 00 00 00 00];
+		brcm,board-type = "apple,snake";
+	};
+};
+
+&i2c0 {
+	/* MagSafe port */
+	hpm5: usb-pd@3a {
+		compatible = "apple,cd321x";
+		reg = <0x3a>;
+		interrupt-parent = <&pinctrl_ap>;
+		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "irq";
+	};
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&fpwm1 {
+	status = "okay";
+};

-- 
2.50.1


