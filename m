Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271D7D0C609
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPYiM/+5rf2FfDXB9bFp6VTaU1OVtVUZPNeAcuiYuOQ=; b=Y5HKjDVpmPV5AOhgu2T/NuTC8f
	g0xHEERO0GU4//o0MozhPN9r04yR2+1m/gpryQCtvtu5Kvb+h2V/UYF0nHYmRSaPVj7rZOfqI1Shl
	FTFaJi1SDhzm0lP2D8Wg7/MhqXMt+R5DpJu6lHJe4XRQeAXt07DNY87s05Nw46YUbZOX4/6cGzO9f
	kGtHW79ITH8Ju/1U56XN5m+xVAyqOaYLh6Bcz0Udb75m93AkmRXaR1rXwPn4T9ZTGUhC7pbJzuu7T
	EGN9YdKkX8nD69lNzmkbRWsnEWcqFfoPHCE2c+ooTWdWUAlcMFysR7GJP0k3kmj/3oNl/oPbsoXO6
	ohgaaHfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K24-00000003lJ2-1qMH;
	Fri, 25 Oct 2024 13:07:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JhG-00000003hxQ-3x8K;
	Fri, 25 Oct 2024 12:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cPYiM/+5rf2FfDXB9bFp6VTaU1OVtVUZPNeAcuiYuOQ=; b=Ttv+BC4841ekt4+QKLZC+Xepd7
	f5oJ/pa8I9uK2dGCAya5dsWZjs1RuNBH7kpgQuncfpiUQul56kZwKY4uCdRJ+adfNnOra6CCbn1yF
	i/k1XUXNvxkYGXRno2Uaib+MqBUHClNW5DMvMk4VxKNgbwpu/8AU6dFQe6R3bSD+hzyn54m/LTD2y
	v9g0TMblTnuTByCzKp4H57faZKAAKvvFE9nvbNxJYmvLDbuxxtz+Z0j5iFQBItUoO2zJ2ol7wDlqd
	GsD5jqirx3FbIs95R+jS2nkJ3TsLxLVXRKq/BmmkwCGTEAjZD4v36sKKFujBMEvvzFY3B2V6hizl1
	CgY0c1VA==;
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JhD-00000008uQO-3GMc;
	Fri, 25 Oct 2024 12:45:41 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CA5401FE0E;
	Fri, 25 Oct 2024 12:45:37 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B117F136F5;
	Fri, 25 Oct 2024 12:45:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sJm1KPCSG2fzOAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 25 Oct 2024 12:45:36 +0000
From: Stanimir Varbanov <svarbanov@suse.de>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kw@linux.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH v4 09/10] arm64: dts: broadcom: bcm2712: Add PCIe DT nodes
Date: Fri, 25 Oct 2024 15:45:14 +0300
Message-ID: <20241025124515.14066-10-svarbanov@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025124515.14066-1-svarbanov@suse.de>
References: <20241025124515.14066-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Rspamd-Queue-Id: CA5401FE0E
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_134540_119070_BE7C87D0 
X-CRM114-Status: UNSURE (   9.24  )
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

Add PCIe devicetree nodes, plus needed reset and mip MSI-X
controllers.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
---
v3 -> v4:
 - Added msi-controller property required by brcm,stb-pcie.yaml schema

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 162 ++++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 6e5a984c1d4e..8fcdf27c1221 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -192,6 +192,12 @@ soc: soc@107c000000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 
+		pcie_rescal: reset-controller@119500 {
+			compatible = "brcm,bcm7216-pcie-sata-rescal";
+			reg = <0x00119500 0x10>;
+			#reset-cells = <0>;
+		};
+
 		sdio1: mmc@fff000 {
 			compatible = "brcm,bcm2712-sdhci",
 				     "brcm,sdhci-brcmstb";
@@ -204,6 +210,12 @@ sdio1: mmc@fff000 {
 			mmc-ddr-3_3v;
 		};
 
+		bcm_reset: reset-controller@1504318 {
+			compatible = "brcm,brcmstb-reset";
+			reg = <0x01504318 0x30>;
+			#reset-cells = <1>;
+		};
+
 		system_timer: timer@7c003000 {
 			compatible = "brcm,bcm2835-system-timer";
 			reg = <0x7c003000 0x1000>;
@@ -267,6 +279,156 @@ gicv2: interrupt-controller@7fff9000 {
 		};
 	};
 
+	axi@1000000000 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0x00 0x00000000 0x10 0x00000000 0x01 0x00000000>,
+			 <0x14 0x00000000 0x14 0x00000000 0x04 0x00000000>,
+			 <0x18 0x00000000 0x18 0x00000000 0x04 0x00000000>,
+			 <0x1c 0x00000000 0x1c 0x00000000 0x04 0x00000000>;
+
+		dma-ranges = <0x00 0x00000000 0x00 0x00000000 0x10 0x00000000>,
+			     <0x14 0x00000000 0x14 0x00000000 0x04 0x00000000>,
+			     <0x18 0x00000000 0x18 0x00000000 0x04 0x00000000>,
+			     <0x1c 0x00000000 0x1c 0x00000000 0x04 0x00000000>;
+
+		pcie0: pcie@100000 {
+			compatible = "brcm,bcm2712-pcie";
+			reg = <0x00 0x00100000 0x00 0x9310>;
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			max-link-speed = <2>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#interrupt-cells = <1>;
+			#size-cells = <2>;
+			interrupt-parent = <&gicv2>;
+			interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pcie", "msi";
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0 0 0 1 &gicv2 GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gicv2 GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gicv2 GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gicv2 GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&bcm_reset 42>, <&pcie_rescal>;
+			reset-names = "bridge", "rescal";
+			msi-controller;
+			msi-parent = <&pcie0>;
+
+			ranges =
+				/* ~4GB, 32-bit, non-prefetchable at PCIe 00_0000_0000 */
+				<0x02000000 0x00 0x00000000 0x17 0x00000000 0x00 0xfffffffc>,
+				/* 12GB, 64-bit, prefetchable at PCIe 04_0000_0000 */
+				<0x43000000 0x04 0x00000000 0x14 0x00000000 0x03 0x00000000>;
+
+			dma-ranges =
+				/* 64GB, 64-bit, prefetchable at PCIe 10_0000_0000 */
+				<0x43000000 0x10 0x00000000 0x00 0x00000000 0x10 0x00000000>;
+
+			status = "disabled";
+		};
+
+		pcie1: pcie@110000 {
+			compatible = "brcm,bcm2712-pcie";
+			reg = <0x00 0x00110000 0x00 0x9310>;
+			device_type = "pci";
+			linux,pci-domain = <1>;
+			max-link-speed = <2>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#interrupt-cells = <1>;
+			#size-cells = <2>;
+			interrupt-parent = <&gicv2>;
+			interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pcie", "msi";
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0 0 0 1 &gicv2 GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gicv2 GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gicv2 GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gicv2 GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&bcm_reset 43>, <&pcie_rescal>;
+			reset-names = "bridge", "rescal";
+			msi-controller;
+			msi-parent = <&mip1>;
+
+			ranges =
+				/* ~4GB, 32-bit, non-prefetchable at PCIe 00_0000_0000 */
+				<0x02000000 0x00 0x00000000 0x1b 0x00000000 0x00 0xfffffffc>,
+				/* 12GB, 64-bit, prefetchable at PCIe 04_0000_0000 */
+				<0x43000000 0x04 0x00000000 0x18 0x00000000 0x03 0x00000000>;
+
+			dma-ranges =
+				/* 64GB, 64-bit, non-prefetchable at PCIe 10_0000_0000 */
+				<0x03000000 0x10 0x00000000 0x00 0x00000000 0x10 0x00000000>;
+
+			status = "disabled";
+		};
+
+		pcie2: pcie@120000 {
+			compatible = "brcm,bcm2712-pcie";
+			reg = <0x00 0x00120000 0x00 0x9310>;
+			device_type = "pci";
+			linux,pci-domain = <2>;
+			max-link-speed = <2>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <4>;
+			#address-cells = <3>;
+			#interrupt-cells = <1>;
+			#size-cells = <2>;
+			interrupt-parent = <&gicv2>;
+			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pcie", "msi";
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0 0 0 1 &gicv2 GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gicv2 GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gicv2 GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gicv2 GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&bcm_reset 44>, <&pcie_rescal>;
+			reset-names = "bridge", "rescal";
+			msi-controller;
+			msi-parent = <&mip0>;
+
+			ranges =
+				/* ~4GB, 32-bit, non-prefetchable at PCIe 00_0000_0000 */
+				<0x02000000 0x00 0x00000000 0x1f 0x00000000 0x00 0xfffffffc>,
+				/* 12GB, 64-bit, prefetchable at PCIe 04_0000_0000 */
+				<0x43000000 0x04 0x00000000 0x1c 0x00000000 0x03 0x00000000>;
+
+			dma-ranges =
+				/* 4MB, 32-bit, non-prefetchable at PCIe 00_0000_0000 */
+				<0x02000000 0x00 0x00000000 0x1f 0x00000000 0x00 0x00400000>,
+				/* 64GB, 64-bit, prefetchable at PCIe 10_0000_0000 */
+				<0x43000000 0x10 0x00000000 0x00 0x00000000 0x10 0x00000000>;
+
+			status = "disabled";
+		};
+
+		mip0: msi-controller@130000 {
+			compatible = "brcm,bcm2712-mip";
+			reg = <0x00 0x00130000 0x00 0xc0>,
+			      <0xff 0xfffff000 0x00 0x1000>;
+			msi-controller;
+			msi-ranges = <&gicv2 GIC_SPI 128 IRQ_TYPE_EDGE_RISING 64>;
+			brcm,msi-offset = <0>;
+		};
+
+		mip1: msi-controller@131000 {
+			compatible = "brcm,bcm2712-mip";
+			reg = <0x00 0x00131000 0x00 0xc0>,
+			      <0xff 0xfffff000 0x00 0x1000>;
+			msi-controller;
+			msi-ranges = <&gicv2 GIC_SPI 247 IRQ_TYPE_EDGE_RISING 8>;
+			brcm,msi-offset = <8>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
-- 
2.43.0


