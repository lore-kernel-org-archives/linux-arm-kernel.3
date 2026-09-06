Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57795C79F85
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 14:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ICN4i+YAw1SWFOpfAEPgSU1+cpG9eLVnsY3ytgN9CGc=; b=Fq2kSzsR0IQLHUMs8L4njujrMS
	9a9ALqM7+FfJZGlqRBhn9M5QP4Ct5ZDUvBDMcwuNXK/U43r40G2rpirBiMJNve7Q1OZSeHi0A125M
	8xeaPXVl8T8BVuujFI9u0+rA1/pwNcUjkTX5cL86OJ5Up4o64H7FsfGpyMdDt1ABSbY710gFP+bCh
	90A0d1ZPSvHBFd0bWmRu5pEAqvTEI3u5rcmKr4uBY8FNFfjPdViFRQ0YcpkymDaYp0iEAUPiE5o0g
	wFFhA0YhhXGoZ+DAQk8YroJqw26CSy20Fe2Cm1q52wHxIxHHjaGPad+P1NbkUYsEWISJE6+wSGPep
	NvvRFakA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3DRM-000000054M8-2AxJ;
	Sun, 06 Sep 2026 14:01:48 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3DRJ-000000054Ln-3U1f
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 14:01:47 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hdBhN5v56zKmwc;
	Sun, 06 Sep 2026 16:01:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788703300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ICN4i+YAw1SWFOpfAEPgSU1+cpG9eLVnsY3ytgN9CGc=;
	b=PqNw0frTdjTlZv8Ya7YmEpyzCsaGEP4rKWHy3UyEUWbtjRTGGm9+YeRHIKsSVVQP2921nm
	GZTapO1CeSbuvAc5wQuVgMDHwub8Nvtg5u/VktK8bidn74+whB6w+7VQuEGGMDKhBP88Qm
	18BlMmrmdgYM5dJNs8IsjAVmK9d0eZqSMjkGlK61uF7XuwhFEk3CQafLEuKxS+OP8Jx3t9
	iqBe5h30RnYO8RE+9GjdXv3qKDN63mwv/JxYDTxH9SSzFFKnvzY7gIlP5Jh9wiGVkNV3TY
	yLy4VjbUi7Tq57nr7Z5jZYLjAUw4sUqce6K+qO1KL9qkbHlEX1PNRg4I+7iZaQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qHh2Mw7p;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788703299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ICN4i+YAw1SWFOpfAEPgSU1+cpG9eLVnsY3ytgN9CGc=;
	b=qHh2Mw7pAZ0BzM9YMD+KGhCYjUBAOJCKcLqSILq3z7xLJFlBdXyEybKPJg5CuBKr9o1xsR
	GR6U9MWVqUV7vOpGtn8LxeHIjBFfMRjjIL9y6NIqvJT9XeeFCyUafsYUpt60wFSZc4bHNA
	3qPDWeaE00ZDR9jZuePHuda1kWJgsW+amJqaxuYilH+uLWHeRwWNHYgynHp/a+wCedM2XW
	JFAXkr1GyLFdedM7P3y7b0Xm1Orjgi6a0Sxj1/ZhietRj98jC6BfvGU90FVDC1M6LNe1FV
	2ogLOdYFLUq45XY7I+/UI0GX1w3nkq48WdxY9g5joHY9jrdShpExtK3NNKeMFw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a779h0: Add GICv3 ITS and update PCIe node
Date: Sun,  6 Sep 2026 16:00:48 +0200
Message-ID: <20260906140134.492084-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 65ac7hzpkta6m6ojpbwtnby1w5q7rjtk
X-MBO-RS-ID: 1f97d613af167f4373d
X-Rspamd-Queue-Id: 4hdBhN5v56zKmwc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_070146_036393_A4607F69 
X-CRM114-Status: GOOD (  11.45  )
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

This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
and add msi-map into PCIe controller node.

The GIC ITS does have master interface to issue transactions to RAM.
The interface does support cacheable transactions, however, it does
not support shareable attribute, because the AXI port signals are tied
to inactive in this implementation. Therefore, add "dma-noncoherent"
DT property into the GIC ITS subnode.

The GIC redistributor does not have cacheable/shareable, therefore
add "dma-noncoherent" DT property into the GIC node.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 24 ++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index c66fb22d72aa8..5f9223a0f4468 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -691,6 +691,8 @@ pciec0: pcie@e65d0000 {
 			resets = <&cpg 624>, <&cpg 1121>;
 			reset-names = "pwr", "core";
 			max-link-speed = <4>;
+			msi-parent = <&its 0>;
+			msi-map = <0x0 &its 0x0 0x10000>;
 			num-lanes = <2>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -701,10 +703,10 @@ pciec0: pcie@e65d0000 {
 			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0 0 0 1 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic 0 0 GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic 0 0 GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic 0 0 GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
 			snps,enable-cdm-check;
 			status = "disabled";
 		};
@@ -1852,11 +1854,23 @@ ipmmu_mm: iommu@eefc0000 {
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-			#address-cells = <0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
 			interrupt-controller;
 			reg = <0x0 0xf1000000 0 0x20000>,
 			      <0x0 0xf1060000 0 0x110000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			dma-noncoherent;
+
+			ranges = <0x0 0x0 0x0 0xf1000000 0x0 0x200000>;
+
+			its: msi-controller@40000 {
+				compatible = "arm,gic-v3-its";
+				reg = <0x0 0x40000 0x0 0x20000>;
+				dma-noncoherent;
+				msi-controller;
+				#msi-cells = <1>;
+			};
 		};
 
 		csi40: csi2@fe500000 {
-- 
2.53.0


