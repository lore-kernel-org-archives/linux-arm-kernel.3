Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAD7C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 10:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVW7auyh5B6go4h9YxV13iN9XAJ0QpxKAEq164KyyyE=; b=xZ9nq/zJsKUQDDTD+K3ti3ZhpD
	TGCTzQmibWmjpRmrZumbd0LoW5VycH1cs8zm1kUXSU6n3tsprgFSnzgxI2p8SMGTEwAjmUbxVVvwo
	fZXzbYE566YYjcI6a8nSgQsNUhCSRU0WduMK7+55ylVfyFop7fM1EpCgdxepl5Vx9oPewcd+qquxf
	gBxvA2uPQkssiKKzr2ERzL0j1D552lzZ/kqcU47weUS+Xkht9loRWfEwiJ4jOAXdD7jkIN21hfdb4
	6jDYYnaY5nSvGwMSa7wa89HHkAp7LFTxSlNZFiq2MJO6T2tP8UMuvgBLjKVo1aDfMV0hi9dR5innO
	GFQ5LcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisYq-0000000ACKf-33ZV;
	Mon, 04 Aug 2025 10:36:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uis34-0000000A92a-10Xe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754301846; x=1785837846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OO+4hFY4hrkvoHxCh16qXc+sfsnxcGj6fzpJBv4i9i0=;
  b=pb0810Szk4p+kBKT/q253mMMYRZGcJ0/qWjjVfvnvIdp0qQqqTl+mRq4
   rn72esMajLM2L3gaWzHk+YLTnJp044SSECQBJYBNUA6jJu43YD0d5Kvm+
   84pHEnE1kuoEss1akwkWZUO0pZUiALB3UTiSzkoejzN/eKTvRa6Qzqm4x
   MTmVOxBobWGpAhpKH9j5KwB8NQiBL+e3OYVYIHUP1A7AZzo2LkHTNA8P8
   kQvG6ZP137/KSh91mf1tYWP9O1KsZdrpoE5WiL+WlLw5QHTMW8wi3xHaA
   PLIADZ/iCR1W54U0jXCNV+T1N0uzkahSMqciws4lrb55XQSjZyF0anRzM
   Q==;
X-CSE-ConnectionGUID: +866aF0tQ+SVcfcIeqWRcg==
X-CSE-MsgGUID: WoN7XXpoTE6eoGfuANyu6A==
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="44245549"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Aug 2025 03:04:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 4 Aug 2025 03:03:45 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 4 Aug 2025 03:03:38 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <eugen.hristev@linaro.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH 12/15] ARM: dts: microchip: sama7d65: add otpc node
Date: Mon, 4 Aug 2025 15:32:16 +0530
Message-ID: <20250804100219.63325-13-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804100219.63325-1-varshini.rajendran@microchip.com>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_030406_339813_AEDCF2A4 
X-CRM114-Status: UNSURE (   9.60  )
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

Add OTPC node along with temperature calibration cell.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 1f249323d08a..1d3708c76202 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/mfd/at91-usart.h>
+#include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
 
 / {
 	model = "Microchip SAMA7D65 family SoC";
@@ -638,6 +639,17 @@ ddr3phy: ddr3phy@e3804000 {
 			reg = <0xe3804000 0x1000>;
 		};
 
+		otpc: efuse@e8c00000 {
+			compatible = "microchip,sama7d65-otpc", "microchip,sama7g5-otpc", "syscon";
+			reg = <0xe8c00000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			temperature_calib: calib@41435354 {
+				reg = <0x41435354 0x2c>;	/* Temp calib data packet TAG */
+			};
+		};
+
 		gic: interrupt-controller@e8c11000 {
 			compatible = "arm,cortex-a7-gic";
 			reg = <0xe8c11000 0x1000>,
-- 
2.34.1


