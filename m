Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA305C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rz3GBARcPIVMTkD1hR9n6eHrInJIxuTthFX75vhVxk4=; b=hU7jUMDgzASiSCGCr0QFSnMGVu
	gnCwujCOvPuhgD1tN8Qixbkwl97KnveRBjKYqlFe05nXDUk1YV7eN/FemiWpHf6yGpkeLHh+lWiuL
	u0xxcDCNWqRgAa0BkNEwWMWqQfmqv1l6qMpEWuMrdgXyP4MSG7cjXD1eTDsFANsb/96hgMKK9XXA3
	yWTJluvXRwaVXet2Q57DAH6ErDZRiseHmJwhRswQAOQSoAqWCYfoPBsnIKiCEMDSJBpmXjDKRqbdi
	Cg+iIKmIcRHTTXN3ez5G2wv/YM7UHfKOwCp31+jdPioELbXwkZtH0aadv3G+ToAjDjAG5qAEdfvVN
	nlkrc3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0mp-0000000FwSU-1UJF;
	Fri, 14 Feb 2025 18:51:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07S-0000000Fp4T-1l7E
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 18:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rz3GBARcPIVMTkD1hR9n6eHrInJIxuTthFX75vhVxk4=; b=mvDAlNPFRaNOSkfILt0LRZmsMl
	JnQtNejAGMu/VcIzeoSOCr5kiwpSgRwGYn9EnrVIzoYAA7oT3MpuUWzsrFuM2W1j9vRX6HLWODXUC
	kXvaGmJLD6TWTuC06hjuJyJpyoFt7pTzKb/lhKpHGNBSLY77/gUc/2StE11DSD54mq4ZkNszp8vEF
	ZcStby+IFMEiFQxusEfTn4wPGSMWC39cqvS4cmZV5Sbe2LVBEedGq5s1c4XmXa+71C6+M7D3Xp9IK
	ZN5s87UHuaBor+TK9UoTNiGkeRxjttQ4vquRfEt/wgjbCXYWf9j7+Un1Z3aNtQL0ucDOachNLO/MW
	j622eqIA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07P-00000001J2v-0rcK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739556532; x=1771092532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K6+jsMBEPeG5a4vof3OQyYuJjApw91RkV7RMLdW/B2Q=;
  b=jfOe4TVJyssXudKgYD6D9LV9drmUxe3Mjc1o6d0qs7p3eQPeE1cpyi1f
   JZGAM7p4YJe66n3oU4zw/OuAJCW2VpWqjjWhyJek1V4UTR+r+PzYXQRZX
   yig33xc3Pzq4I7Fq9IKl5t+c9++RXfT7QRLyFJqqFIlvdaGPnX+Q5XsqY
   VILP2eyekYvk8a7oK5KSTozjBDFxkkKw7Y53CYAecDkFcebdpz+MEcbHk
   QNUrsIbR3DiYOosUTBNKW70v3p6HT94JqBQh/WYaZaaIYPndFN6EqMT6u
   XCMAuyjy1Zl85tNFQ/d8XjWxuSld3eX71dxvm7meh9zWjldsiT6FklI3K
   Q==;
X-CSE-ConnectionGUID: afEECSQvQkGMMmDvtHvTFg==
X-CSE-MsgGUID: Vy7NjoOqR+iWKMmSPvhT5w==
X-IronPort-AV: E=Sophos;i="6.13,286,1732604400"; 
   d="scan'208";a="37700931"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Feb 2025 11:08:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 14 Feb 2025 11:08:26 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 14 Feb 2025 11:08:26 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <vkoul@kernel.org>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 6/8] ARM: dts: microchip: sama7d65: Add watchdog for sama7d65
Date: Fri, 14 Feb 2025 11:08:19 -0700
Message-ID: <05431cf86beb742a9a53336c4ec792be8bde14e2.1739555984.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739555984.git.Ryan.Wanner@microchip.com>
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_180851_733066_37F3E2DE 
X-CRM114-Status: UNSURE (   8.11  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add watchdog timer support for SAMA7D65 SoC.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index b1b236e1f6e38..d06a51972d363 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -83,6 +83,13 @@ clk32k: clock-controller@e001d500 {
 			#clock-cells = <1>;
 		};
 
+		ps_wdt: watchdog@e001d180 {
+			compatible = "microchip,sama7d65-wdt", "microchip,sama7g5-wdt";
+			reg = <0xe001d000 0x30>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk32k 0>;
+		};
+
 		chipid@e0020000 {
 			compatible = "microchip,sama7d65-chipid";
 			reg = <0xe0020000 0x8>;
-- 
2.43.0


