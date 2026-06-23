Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9CDCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OY3ToZFV8FTpO6y8C2HGHRhfbU4pE1nLTwwIJsJDf4=; b=AevSEnqztTOsjmdz6XIBAGVhjB
	QEQQwUdvO0sjqkq49DZRUuFKcxWgISHpLAyVgwvzHJK1XqeRwHRYnig3cskKBbgtTU96nWrPij0jy
	tCgkYd/EzPZ4pHCKh3x2h2Rg6/XOcvxs48bZfNV9ldEUyPwgFHYzmmFPqMPuOvgOCmCUhPcBqoYM2
	iuYof+NhpdbogDMzMZ+h4if/OpkryDcyQotT7TbdmFRbMEn1HZHqNnTyvx9VFIwY/xaZvsfzMC6Gd
	AX6Jk+LSRa0c0IN9gkN/fVfRqlZz1ReII4Wg1i3KgygkIh4MxzbzfQ8aupz5EjA4algkbObJfyVBQ
	kRmcE+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbysO-000000068OD-43AM;
	Tue, 23 Jun 2026 11:01:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbysM-000000068N9-47Nr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782212468; x=1813748468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kCkIkCkZ+wCnKYcp7lkrWemwFvAzwzkCoeW6zMFBkzc=;
  b=NMPMBRRzZ4/DZKfnKAzR8LbON2mwuQ440QMkJeB9phMNehXXLOU9ULhD
   yvFalHNax0eSK8+tsvTd5nFRzFrSK5/mCJl6TZz2WrvVDtRRcOReACKg0
   XGqUzX11WOe8l+xyjB9PUszPhzmxuxNbzQEozgcaIdqHRyFqNZ5SB2fUG
   dhU88HVFtuq/sszquEvCA8Mz1ahrUGG3HfdIEVlY1Wre6vRgzKHquuq3+
   ggtDYDU1nVCvyCwIDd8u63cw4ahQ4aaAiyE7fgWX8gOUBEkEV82ecn+bz
   1eVk3rTcpyzgodcEu0zMXfRVXv7r2GkjRr8+I/swwOy2hVNfFR7A8MUGX
   Q==;
X-CSE-ConnectionGUID: M1Dk4sdfSjKBfdLv3FILiQ==
X-CSE-MsgGUID: gLEfMQIZSlmkqlsd4r9xjw==
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="290925173"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jun 2026 04:01:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 23 Jun 2026 04:01:05 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 23 Jun 2026 04:00:59 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH v2 09/12] ARM: dts: microchip: sama7d65: add otpc node
Date: Tue, 23 Jun 2026 16:29:41 +0530
Message-ID: <20260623105944.128840-10-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260623105944.128840-1-varshini.rajendran@microchip.com>
References: <20260623105944.128840-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_040107_028025_97EF3E50 
X-CRM114-Status: UNSURE (   9.12  )
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
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index ba775459a816..5867fda378b1 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/mfd/at91-usart.h>
+#include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
 
 / {
 	model = "Microchip SAMA7D65 family SoC";
@@ -1112,6 +1113,21 @@ ddr3phy: ddr3phy@e3804000 {
 			reg = <0xe3804000 0x1000>;
 		};
 
+		otpc: efuse@e8c00000 {
+			compatible = "microchip,sama7d65-otpc", "microchip,sama7g5-otpc", "syscon";
+			reg = <0xe8c00000 0x100>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				temperature_calib: calib@41435354 {
+					reg = <0x41435354 0x2c>;	/* Temp calib data packet TAG */
+				};
+			};
+		};
+
 		gic: interrupt-controller@e8c11000 {
 			compatible = "arm,cortex-a7-gic";
 			reg = <0xe8c11000 0x1000>,
-- 
2.34.1


