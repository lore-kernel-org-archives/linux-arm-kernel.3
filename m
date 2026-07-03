Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DECC44502
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cW7Fd/zXKSLTJkK4T39T7hjSqOADybqJhMd7UKtGv7M=; b=we81naNLdkHWPtalP4XsLIceu7
	+3BjneMcFCeXRrtk/V8sRI5rzt10NveYmjU0/3KrspKbTLPMxhD9UGMf7KpL4y/8UZSTQPmjQKrba
	qwcjJlMjxx1J9uBlgQYGwtcVRulQBEzS4cdNz+oLz4dD1RRERa6rIuxTW4KPv/gBMzhFRmRWXN9KW
	DJhNETsIQHzUkl9EDASk0xGZxbFuc4F4cGVS5SNoACRAKmgCf2snR6u//E2BceahG6bur/NZMgE0P
	2oqOjTG6aXaZhHLLKsrdSk0V97d1B85xHB+Fs4FKYKpZqbb1cO3Vag95YlqFDd7J4hyGLWgg6OEHc
	AiAvd3pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wff1Q-00000007Hn0-1OoA;
	Fri, 03 Jul 2026 14:37:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wff1M-00000007HjE-3kwz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:37:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 730ED1A0E1E;
	Fri,  3 Jul 2026 14:37:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4782B60300;
	Fri,  3 Jul 2026 14:37:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E53A0104C9567;
	Fri,  3 Jul 2026 16:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783089454; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=cW7Fd/zXKSLTJkK4T39T7hjSqOADybqJhMd7UKtGv7M=;
	b=y/UyREk/u0SoVDr2S2H5auEfhqVxI7WGB8eVHMN7SQoAsAf2eKsVHzM5aKiB8j3r7yBrf5
	zqeVF+iIt0PhIo8fFIwo8IHjQmyA608bfuLMYAcEccWj5IEKlG27UdfexZzLUDo+JFAuJm
	jDvnwHWpNDvhWeTn7EVzVcrTQFeE8ZgsFMNOELNUI50nUnrYFBcjWAdNYuab5Q4Vl3CLZl
	wgKxB5FVSoOMRflFAACgMKVUOS/xj4rQeOxNWpBnn2Y4TNCpquBO4a/F0UYbu7+MctqENr
	NlcbZguVhJAcdyNDH0SLLo3Cy1qKtwcef0z4skFgjhO78eKOyRPLNsx7g+GUxw==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] arm64: dts: ti: k3-j784s4-ti-ipc-firmware: Reserve memory for LPM metadata
Date: Fri,  3 Jul 2026 16:37:15 +0200
Message-ID: <20260703143717.177362-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703143717.177362-1-richard.genoud@bootlin.com>
References: <20260703143717.177362-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_073737_091394_7EA76D57 
X-CRM114-Status: GOOD (  11.07  )
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

Declare a carveout memory region to store LPM metadata on J784S4.

For Jacinto devices, this memory region is needed for saving ATF context
and the certificate information of ATF and OPTEE and DM image. This LPM
metadata area is firewalled to be accessed only by TIFS.

U-Boot R5 SPL/TIFS will use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image (which has been copied in memory at boot time by U-Boot
  R5-SPL)

At resume, U-Boot R5 SPL is executed and detects that the board is
resuming (with a flag set in the PMIC), then it:
- brings out of retention the DDR
- retrieves the LPM memory region from DTS
- authenticates certificates from LPM memory region and applies firewalls
- asks TIFS to restore TFA and its own minimal context
- starts TFA on remote proc
- loads back DM image from memory and jumps to DM

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

As this is used by U-Boot SPL, bootph-pre-ram is added and the device is
enabled.

NB: This memory region is not part of DM memory (which is not retained
at suspend)

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 .../boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
index 81b508b9b05e..1c0c1533f0a3 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
@@ -17,6 +17,12 @@ c71_3_memory_region: memory@ab100000 {
 		reg = <0x00 0xab100000 0x00 0xf00000>;
 		no-map;
 	};
+
+	lpm_memory_region: memory@ac000000 {
+		reg = <0x00 0xac000000 0x00 0x00300000>;
+		no-map;
+		bootph-pre-ram;
+	};
 };
 
 &mailbox0_cluster5 {
@@ -27,6 +33,15 @@ mbox_c71_3: mbox-c71-3 {
 	};
 };
 
+&mcu_r5fss0_core0 {
+	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
+			<&mcu_r5fss0_core0_memory_region>,
+			<&lpm_memory_region>;
+	memory-region-names = "dma", "firmware", "lpm-metadata";
+	bootph-pre-ram;
+	status = "okay";
+};
+
 &c71_3 {
 	mboxes = <&mailbox0_cluster5 &mbox_c71_3>;
 	memory-region = <&c71_3_dma_memory_region>,
-- 
2.47.3


