Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF6EE7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 07:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RNaoyIxlpY2lE0hVw65vIx3L2KQZHXOg/YIxxeFvTz8=; b=PF5Jeu82DzPLUhsDMJKmhAEcSs
	D2HJTJLQn6XU+dve/FLYY1fq/3Hbdl8SPqaOAM/35GHh+xeGn7EUFRYvRKppkq6hJAwQACH/UXqjs
	Y5iOdoiexlvRhWzNv5EBb3oYHBV5SjOUo6PWw4Er11rjtsbQ+jlQgiZY0eJ5QUXPDcuym1UYzJYcI
	2F/n0euLKzF2/QfrUSNXEGDasqK/RO1G53i/qF32RbvqNbbgtePYujRQFkrzAi0W9p6iQWDCEazfV
	2l4NYwjo1M16pdvl1y4xcs09IXzaloFvSJzjemYlHcnr+cEeGkXbE1gOeCRHD3j1kr9O3axiJrgEn
	k0GhfyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEja-00000004ED9-08dx;
	Mon, 13 Jan 2025 07:19:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEiJ-00000004E2j-2eos
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 07:18:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736752699; x=1768288699;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=42oYf7k1pGRgtJYa8Ps3IOlsFdSUm4C/6z8/MyTKOKE=;
  b=uN3c9TG56U6fUvflVI89g6f9MhvwpvhpsCqpLzvWdibDtWvo5JasR2xS
   Qd5bI29Dc84P6i70zKG67Py3iIGqw0BiTV4KtI5EawAMWN6yDqqgqj603
   8rXhz4VPDHY+fDjziilPFo3zYuS9Rhbr4SjTXW3Jdp2ZVw3lzmijgFYuu
   DPTOvpu8Y44Sy3qvYcD4j5sLa6SMlH4R/DvCNuXEaKuDDZvS4awggIz+I
   fbYc8lcvZSAW730HQFpTFpQG5poNSU3myqNCb3uml7YlSM9FuoWfnTeEv
   8gBaNSRM+0PVxN43dtA5uD6Xl5hRnUQDQTy2q6ZNgvOdzXKR5B32S9wrD
   w==;
X-CSE-ConnectionGUID: n6lK1I+ESfyKbS9ug4OrHw==
X-CSE-MsgGUID: 93KtI5A/Q/iv4dsczwbKVQ==
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="36094120"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Jan 2025 00:18:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 Jan 2025 00:17:59 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 13 Jan 2025 00:17:57 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <nicolas.ferre@microchip.com>, <claudiu.beznea@tuxon.dev>,
	<alexandre.belloni@bootlin.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Andrei Simion <andrei.simion@microchip.com>
Subject: [PATCH] ARM: dts: microchip: at91-sam9x75_curiosity: Add PMIC suspend voltage configuration
Date: Mon, 13 Jan 2025 09:17:11 +0200
Message-ID: <20250113071710.40821-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_231819_855173_02E1EA14 
X-CRM114-Status: GOOD (  12.11  )
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

Add missing essential configuration for the PMIC rails, which is necessary
for proper low-power mode operation. This patch adds the required settings
to ensure that the regulators behave correctly during Suspend-to-RAM and
Standby states. Otherwise, after resuming, it receives: "No configuration"
message.

Our driver implements the set_suspend_voltage and set_suspend_mode
callbacks, which require the `regulator-suspend-microvolt` property to be
specified in the device tree for each regulator node. This property defines
the voltage level that the regulator should maintain during suspend mode.

Additionally, according to the datasheet, some regulators need to be turned
on or off during suspend mode. This patch addresses these requirements by
adding the `regulator-on-in-suspend` and `regulator-off-in-suspend`
properties where appropriate.

Fixes: 371a47c9a58a ("ARM: dts: microchip: sam9x75_curiosity: add sam9x75 curiosity board")
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
 .../dts/microchip/at91-sam9x75_curiosity.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
index 1a6a909a5043..5514ad10cda5 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
@@ -110,10 +110,12 @@ vdd_3v3: VDD_IO {
 
 				regulator-state-standby {
 					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
 					regulator-mode = <4>;
 				};
 
 				regulator-state-mem {
+					regulator-off-in-suspend;
 					regulator-mode = <4>;
 				};
 			};
@@ -128,11 +130,13 @@ vddioddr: VDD_DDR {
 
 				regulator-state-standby {
 					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1350000>;
 					regulator-mode = <4>;
 				};
 
 				regulator-state-mem {
 					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1350000>;
 					regulator-mode = <4>;
 				};
 			};
@@ -147,10 +151,12 @@ vddcore: VDD_CORE {
 
 				regulator-state-standby {
 					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1150000>;
 					regulator-mode = <4>;
 				};
 
 				regulator-state-mem {
+					regulator-off-in-suspend;
 					regulator-mode = <4>;
 				};
 			};
@@ -166,10 +172,12 @@ dcdc4: VDD_OTHER {
 
 				regulator-state-standby {
 					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1150000>;
 					regulator-mode = <4>;
 				};
 
 				regulator-state-mem {
+					regulator-off-in-suspend;
 					regulator-mode = <4>;
 				};
 			};
@@ -182,6 +190,11 @@ vldo1: LDO1 {
 
 				regulator-state-standby {
 					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
 				};
 			};
 
@@ -192,6 +205,11 @@ vldo2: LDO2 {
 
 				regulator-state-standby {
 					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
 				};
 			};
 		};

base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
-- 
2.34.1


