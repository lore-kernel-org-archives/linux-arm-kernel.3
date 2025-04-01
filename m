Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A346BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jm1ajejMhUPj1rheEQ01hipRA0MuxDJKI5Sd1kbVanU=; b=K92hypyzpj1xq7HSaRaemG5H6e
	PJd/zKMWJ4Y4eAQlOaxLaQNa2F++QNePxPZQzwlIqbUZckyu524bw9d/x8cr/egWqHILUGRXRam7Q
	0SqQV9+aQmy3igbmSxlqTBlABd2peyyfFFH8enc2NN4W8X2sKV+WMcGL28OzR6brRVNeMGsrJNsWy
	yYreCNSygnNJh6q/9njdsHx1w7yaxXugX7SV0bi20tq1Er3JlCRytaa30KU8CToh5nEnlNalLz0Ih
	WBcF3/6owaFl5hQEIbMzTVAU94gYaOnmZz2UXgM0uRBdUhTSAeJ+WMb0nHkW0sCiAgz97c7g0t8Vz
	SCwf1kkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzePX-00000003rjg-3zik;
	Tue, 01 Apr 2025 16:24:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeEy-00000003pSa-1Zo8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 16:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1743524008; x=1775060008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pTaeXJ5bInDg+SC4wghPI6lAHGRDUz3yhZDRfxhw948=;
  b=ROfRraUgzArXgnRab5ZWCayRe5TLrqQ24Sr6afEW5AnQVKJirXKhwZ/0
   N2Y0HEaCjp1swksSmKf3xYgDJaUkuu7/6bk/3lpFEL3WgWk+1iZI2oYqY
   xYkSacFd/k0z/2CLhcVo02x+ARzQMOoKtVtqqLHOjJUqzz5PCu36GuNt7
   osvXC+6vN+bTarBhPXOPYANhCdTePVg0+1kthn1z7+/txQMnOqzcJdqOj
   xx9VluHYTPZinWNiqdIwzNR1YAj7MoDeB1o+z6OnqyVjdNiOFWu6k6aX9
   JY63/I0Yl5qsCl2xaR1EVLYiKOiuMZsf72xHM16pU/2dDoqw44Xd5flXz
   w==;
X-CSE-ConnectionGUID: ggLzNIpETriZ0zPViMY9HA==
X-CSE-MsgGUID: wPZVl3ZNSCaFv+rOE6Hgjg==
X-IronPort-AV: E=Sophos;i="6.14,293,1736838000"; 
   d="scan'208";a="39512781"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Apr 2025 09:13:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 09:13:01 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 1 Apr 2025 09:13:01 -0700
From: <Ryan.Wanner@microchip.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <onor+dt@kernel.org>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <nicolas.ferre@microchip.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH 5/6] ARM: dts: microchip: sama7d65: Add MCP16502 to sama7d65 curiosity
Date: Tue, 1 Apr 2025 09:13:21 -0700
Message-ID: <60f6b7764227bb42c74404e8ca1388477183b7b5.1743523114.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743523114.git.Ryan.Wanner@microchip.com>
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_091328_493547_9A26D837 
X-CRM114-Status: UNSURE (   9.17  )
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

Add MCP16502 to the sama7d65_curiosity board to control voltages in the
MPU. The device is connected to twi 10 interface

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../dts/microchip/at91-sama7d65_curiosity.dts | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index 441370dbb4c2..81abc387112d 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -30,6 +30,15 @@ memory@60000000 {
 		device_type = "memory";
 		reg = <0x60000000 0x40000000>;
 	};
+
+	reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "5V_MAIN";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
 };
 
 &dma0 {
@@ -99,6 +108,132 @@ channel@4 {
 			label = "VDDCPU";
 		};
 	};
+
+	pmic@5b {
+		compatible = "microchip,mcp16502";
+		reg = <0x5b>;
+		lvin-supply = <&reg_5v>;
+		pvin1-supply = <&reg_5v>;
+		pvin2-supply = <&reg_5v>;
+		pvin3-supply = <&reg_5v>;
+		pvin4-supply = <&reg_5v>;
+		status = "okay";
+
+		regulators {
+			vdd_3v3: VDD_IO {
+				regulator-name = "VDD_IO";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-initial-mode = <2>;
+				regulator-allowed-modes = <2>, <4>;
+				regulator-always-on;
+
+				regulator-state-standby {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+					regulator-mode = <4>;
+				};
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-mode = <4>;
+				};
+			};
+
+			vddioddr: VDD_DDR {
+				regulator-name = "VDD_DDR";
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-initial-mode = <2>;
+				regulator-allowed-modes = <2>, <4>;
+				regulator-always-on;
+
+				regulator-state-standby {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1350000>;
+					regulator-mode = <4>;
+				};
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1350000>;
+					regulator-mode = <4>;
+				};
+			};
+
+			vddcore: VDD_CORE {
+				regulator-name = "VDD_CORE";
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-initial-mode = <2>;
+				regulator-allowed-modes = <2>, <4>;
+				regulator-always-on;
+
+				regulator-state-standby {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1050000>;
+					regulator-mode = <4>;
+				};
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-mode = <4>;
+				};
+			};
+
+			vddcpu: VDD_OTHER {
+				regulator-name = "VDD_OTHER";
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1250000>;
+				regulator-initial-mode = <2>;
+				regulator-allowed-modes = <2>, <4>;
+				regulator-ramp-delay = <3125>;
+				regulator-always-on;
+
+				regulator-state-standby {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1050000>;
+					regulator-mode = <4>;
+				};
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-mode = <4>;
+				};
+			};
+
+			vldo1: LDO1 {
+				regulator-name = "LDO1";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+
+				regulator-state-standby {
+					regulator-suspend-microvolt = <1800000>;
+					regulator-on-in-suspend;
+				};
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vldo2: LDO2 {
+				regulator-name = "LDO2";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3700000>;
+
+				regulator-state-standby {
+					regulator-suspend-microvolt = <1800000>;
+					regulator-on-in-suspend;
+				};
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
 };
 
 &main_xtal {
-- 
2.43.0


