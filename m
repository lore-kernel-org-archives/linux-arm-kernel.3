Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED90C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urIsZjdXVO7uWejYynPgvAPUzUcI4nkhYWrbtT1Wy3I=; b=ihu1Y7Knr+YlCTPkaFjr7To4yU
	5wez+Jn1gg9papaZUxRitzwKWJT5/LZpYVWXKlV5EC4AXbXBhHHbtYkim4Cvgg8SBGa7kZzRN8ZhG
	SvPgyuUnKqRUQJUVU5+CLawYxv2lO3EsdfpDn4Iv6vF5Qme+kezF1olJWTAluZtQ8Jgn/J0DX38d1
	qaJhPiUCpg27QKV4fbt4LXELCFRrXmEMJFGEC4de1hriMffgXJwCuNxO+S0tnnnALkKVqhW1T6pmD
	AVlODTVLo6OTWdhz5OPqr2E5+1BR3iqPMoIUX9H18nn1y5LN00M8hQRTUqZbeMxX+oaDQfsr5tW76
	S0yWRoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrf5-00000005e6D-2Biq;
	Mon, 20 Jan 2025 13:17:51 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrPh-00000005bBa-00RR;
	Mon, 20 Jan 2025 13:01:58 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 896D621190;
	Mon, 20 Jan 2025 13:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737378115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=urIsZjdXVO7uWejYynPgvAPUzUcI4nkhYWrbtT1Wy3I=;
	b=NkyNzYbRjua3aIsGZ8v54Ps0CjNrFu/ZVcpjZDBd5kjxKPSmeHJzpcBLDhEvLxZGJZOmkc
	vgetahppfFgGHJplrrGCZWAdpB4AC1ER5mu7bPCQ5Ln7sg3NwuEs4XwuNIbKh1BsUiEoxt
	ccHE9QRvbgFKbW8n+cqP8Y1TTlYdcZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737378115;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=urIsZjdXVO7uWejYynPgvAPUzUcI4nkhYWrbtT1Wy3I=;
	b=rQ/gggInL3d0KeCMJjEd+g7S8j6jgVlJeWAAKUhGUv6ONdWusOboR+V1oMC87ck5C/XbB1
	fMIUDBu2i5w1fbCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NkyNzYbR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="rQ/gggIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737378115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=urIsZjdXVO7uWejYynPgvAPUzUcI4nkhYWrbtT1Wy3I=;
	b=NkyNzYbRjua3aIsGZ8v54Ps0CjNrFu/ZVcpjZDBd5kjxKPSmeHJzpcBLDhEvLxZGJZOmkc
	vgetahppfFgGHJplrrGCZWAdpB4AC1ER5mu7bPCQ5Ln7sg3NwuEs4XwuNIbKh1BsUiEoxt
	ccHE9QRvbgFKbW8n+cqP8Y1TTlYdcZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737378115;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=urIsZjdXVO7uWejYynPgvAPUzUcI4nkhYWrbtT1Wy3I=;
	b=rQ/gggInL3d0KeCMJjEd+g7S8j6jgVlJeWAAKUhGUv6ONdWusOboR+V1oMC87ck5C/XbB1
	fMIUDBu2i5w1fbCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 85BC41393E;
	Mon, 20 Jan 2025 13:01:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SH1EHkJJjmc4XQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Mon, 20 Jan 2025 13:01:54 +0000
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
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH v5 -next 10/11] arm64: dts: broadcom: bcm2712: Add PCIe DT nodes
Date: Mon, 20 Jan 2025 15:01:18 +0200
Message-ID: <20250120130119.671119-11-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250120130119.671119-1-svarbanov@suse.de>
References: <20250120130119.671119-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 896D621190
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linutronix.de,kernel.org,broadcom.com,gmail.com,google.com,linux.com,pengutronix.de,suse.com,raspberrypi.com,suse.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TAGGED_RCPT(0.00)[dt];
	R_RATELIMIT(0.00)[to_ip_from(RLw7mkaud87zuqqztkur5718rm)];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_050157_195422_07257B4C 
X-CRM114-Status: GOOD (  10.23  )
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
v4 -> v5:
 - Reorder reset-names.
 - Dropped bus-range property.
 - Added MIP0(pcie2) and MIP1(pcie1) dma-ranges properties to access MIP MSI-X
   interrupt controllers.

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 147 ++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 39305e0869ec..a7019327dd12 100644
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
@@ -431,6 +443,141 @@ axi: axi {
 		vc4: gpu {
 			compatible = "brcm,bcm2712-vc6";
 		};
+
+		pcie0: pcie@1000100000 {
+			compatible = "brcm,bcm2712-pcie";
+			reg = <0x10 0x00100000 0x00 0x9310>;
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			max-link-speed = <2>;
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
+			resets = <&pcie_rescal>, <&bcm_reset 42>;
+			reset-names = "rescal", "bridge";
+			msi-controller;
+			msi-parent = <&pcie0>;
+
+			ranges =
+				/* ~4GiB, 32-bit, non-prefetchable at PCIe 00_0000_0000 */
+				<0x02000000 0x00 0x00000000 0x17 0x00000000 0x00 0xfffffffc>,
+				/* 12GiB, 64-bit, prefetchable at PCIe 04_0000_0000 */
+				<0x43000000 0x04 0x00000000 0x14 0x00000000 0x03 0x00000000>;
+
+			dma-ranges =
+				/* 64GiB, 64-bit, prefetchable at PCIe 10_0000_0000 */
+				<0x43000000 0x10 0x00000000 0x00 0x00000000 0x10 0x00000000>;
+
+			status = "disabled";
+		};
+
+		pcie1: pcie@1000110000 {
+			compatible = "brcm,bcm2712-pcie";
+			reg = <0x10 0x00110000 0x00 0x9310>;
+			device_type = "pci";
+			linux,pci-domain = <1>;
+			max-link-speed = <2>;
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
+			resets = <&pcie_rescal>, <&bcm_reset 43>;
+			reset-names = "rescal", "bridge";
+			msi-controller;
+			msi-parent = <&mip1>;
+
+			ranges =
+				/* ~4GiB, 32-bit, non-prefetchable at PCIe 00_0000_0000 */
+				<0x02000000 0x00 0x00000000 0x1b 0x00000000 0x00 0xfffffffc>,
+				/* 12GiB, 64-bit, prefetchable at PCIe 04_0000_0000 */
+				<0x43000000 0x04 0x00000000 0x18 0x00000000 0x03 0x00000000>;
+
+			dma-ranges =
+				/* 64GiB, 64-bit, non-prefetchable at PCIe 10_0000_0000 */
+				<0x03000000 0x10 0x00000000 0x00 0x00000000 0x10 0x00000000>,
+				/* 4KiB, 64-bit, non-prefetchable at PCIe ff_ffff_f000 MIP1 */
+				<0x03000000 0xff 0xfffff000 0x10 0x00131000 0x00 0x00001000>;
+
+			status = "disabled";
+		};
+
+		pcie2: pcie@1000120000 {
+			compatible = "brcm,bcm2712-pcie";
+			reg = <0x10 0x00120000 0x00 0x9310>;
+			device_type = "pci";
+			linux,pci-domain = <2>;
+			max-link-speed = <2>;
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
+			resets = <&pcie_rescal>, <&bcm_reset 44>;
+			reset-names = "rescal", "bridge";
+			msi-controller;
+			msi-parent = <&mip0>;
+
+			ranges =
+				/* ~4GiB, 32-bit, non-prefetchable at PCIe 00_0000_0000 */
+				<0x02000000 0x00 0x00000000 0x1f 0x00000000 0x00 0xfffffffc>,
+				/* 12GiB, 64-bit, prefetchable at PCIe 04_0000_0000 */
+				<0x43000000 0x04 0x00000000 0x1c 0x00000000 0x03 0x00000000>;
+
+			dma-ranges =
+				/* 4MiB, 32-bit, non-prefetchable at PCIe 00_0000_0000 */
+				<0x02000000 0x00 0x00000000 0x1f 0x00000000 0x00 0x00400000>,
+				/* 64GiB, 64-bit, prefetchable at PCIe 10_0000_0000 */
+				<0x43000000 0x10 0x00000000 0x00 0x00000000 0x10 0x00000000>,
+				/* 4KiB, 64-bit, non-prefetchable at PCIe ff_ffff_f000 MIP0 */
+				<0x03000000 0xff 0xfffff000 0x10 0x00130000 0x00 0x00001000>;
+
+			status = "disabled";
+		};
+
+		mip0: msi-controller@1000130000 {
+			compatible = "brcm,bcm2712-mip";
+			reg = <0x10 0x00130000 0x00 0xc0>,
+			      <0xff 0xfffff000 0x00 0x1000>;
+			msi-controller;
+			msi-ranges = <&gicv2 GIC_SPI 128 IRQ_TYPE_EDGE_RISING 64>;
+			brcm,msi-offset = <0>;
+		};
+
+		mip1: msi-controller@1000131000 {
+			compatible = "brcm,bcm2712-mip";
+			reg = <0x10 0x00131000 0x00 0xc0>,
+			      <0xff 0xfffff000 0x00 0x1000>;
+			msi-controller;
+			msi-ranges = <&gicv2 GIC_SPI 247 IRQ_TYPE_EDGE_RISING 8>;
+			brcm,msi-offset = <8>;
+		};
 	};
 
 	timer {
-- 
2.47.0


