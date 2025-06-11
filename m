Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69516C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 09:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6dwJpCkCdf77AMnT8Q7iadnEy85FdbFH1dp0j5L7kIQ=; b=MI9CdMiB6hHr8eNM257n3nLL4e
	ly7cztyFdIwV1p2OTzbl9HdVs+XHQOfLOdchjKtx4NWm1asmdx2Ey27cYHUuF4Fk9IEz/a1EhVEaw
	pNz8Jlzb2WdGYGNUVl/zU5D07o+4xDih/pOsIAsv7YnCF4ZGFwsQFTd0kwCTRa4UC48fCCDcRdKME
	AaaQSavqzYZ+Ne5NrAkxcH9LAOmZErvXfASCR/cpAjfeQT9DW6eE9ybZUo3KF73TmN+a4q/z+NhFr
	hgDFE7b6sr1VJ4v9uoyBxtb+jd00el/zQsJqO+mf4/ziHEsDv2RXV3GcVG4XSyEHcrFEQjJxd00zN
	fdpU3cdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHfh-00000009SEG-0j1p;
	Wed, 11 Jun 2025 09:23:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHbN-00000009Rqz-0pQh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 09:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749633512; x=1781169512;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=zuFDS2qosc9+A7o4k2d3GK8Kqp19epuzkmMM1ayLgZA=;
  b=rLUTq5uvGlG+24OkCzJF/AXqNykdp1GWepXNqWQgMnYsBqQ4fwd1bmNg
   HgqFJ4KbGiEeE1BDAB704JIq5VBjm9CHrFrfZM/+b5MDKzG4MNI1Rilpq
   3b0SaoHWdQlyygsrZ073O5Gdj2chqm6hUMyIf4nbjJZ+kMQgSN9dG0qGK
   UI7jWwwncSuBnQFw9zy+7Mx0jMlHjU+DKNAyARl4ZVqAUKb75V/8Y/m5T
   joSDVh2VLrLT0Kjl3Wd++wP15gv3t4aFBNEAegaWXcP8D0be1o9MGg7Sm
   NEGyIfY23igWZXJYkOLW6A9xGFE8BU/PApsn9+HWP3APZw56F76oBT0yR
   Q==;
X-CSE-ConnectionGUID: jk5dQVZ/Qu6+T4XW2CUDVQ==
X-CSE-MsgGUID: YqaT/sAxRnyFlEkltMC/hg==
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="47643071"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 02:18:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 11 Jun 2025 02:18:03 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 11 Jun 2025 02:17:59 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 11 Jun 2025 14:47:59 +0530
Subject: [PATCH] ARM: dts: microchip: sam9x7: Add HLCD controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250611-sam9x7-dts-v1-1-7f52fcb488ad@microchip.com>
X-B4-Tracking: v=1; b=H4sIAMZJSWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0ND3eLEXMsKc92UkmJdsySTFAMzk8REE2MLJaCGgqLUtMwKsGHRsbW
 1AMNWB/ZcAAAA
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749633480; l=1485;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=zuFDS2qosc9+A7o4k2d3GK8Kqp19epuzkmMM1ayLgZA=;
 b=uKEcjxIheBSQni50Lhuk3q3FLrjHNUkiZFFh1uxs1zX7Myw26b2DJW4fpcVHYENS6HKenUsre
 2TKrvjoHKV6Bfx/h3zEG2MT1CjAOZP2z1XOm+7T2swbycJ1r4eQvr+u
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_021833_364054_BCDF4E07 
X-CRM114-Status: UNSURE (   8.97  )
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

Add support for HLCD controller.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index b217a908f525..d7b4b1310f31 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -983,6 +983,32 @@ pwm0: pwm@f8034000 {
 			status = "disabled";
 		};
 
+		hlcdc: hlcdc@f8038000 {
+			compatible = "microchip,sam9x75-xlcdc";
+			reg = <0xf8038000 0x4000>;
+			interrupts = <25 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 25>, <&pmc PMC_TYPE_GCK 25>, <&clk32k 1>;
+			clock-names = "periph_clk", "sys_clk", "slow_clk";
+			status = "disabled";
+
+			display-controller {
+				compatible = "atmel,hlcdc-display-controller";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+			};
+
+			pwm {
+				compatible = "atmel,hlcdc-pwm";
+				#pwm-cells = <3>;
+			};
+		};
+
 		flx9: flexcom@f8040000 {
 			compatible = "microchip,sam9x7-flexcom", "atmel,sama5d2-flexcom";
 			reg = <0xf8040000 0x200>;

---
base-commit: 19a60293b9925080d97f22f122aca3fc46dadaf9
change-id: 20250611-sam9x7-dts-6b4d064aa438

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>


