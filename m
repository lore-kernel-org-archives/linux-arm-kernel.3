Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738E4C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 10:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ygx445Wd9sTCGBV4j0Dqor5pW5/2LjizvnGLp+BN9IQ=; b=vN1fVw30QN0U+s4Nbu0Q1knlby
	h0yzL5XDqygWH86Sw0hBKFCnxOwDk8klvkHKZphwt/ZhZ8bZKe5xlWylLNZK6VWwoY/oEW8aLuLDU
	oxo18tLS+YXgJSZufJSeLUXFdw122TqDQJGqAiIdCe7KzNwbx7N1ZstSBzX5k9Gb0cApDJqK9H32z
	TQaX/CJsk7BVnHPjlykj657XBLOu+fe9wYnT1jgO5hYZWWFecQWy21fE4yryh0qXYH1PBs0vcHcml
	/rsGN7aboVxJm8cqgM0Ju25GxrNUUc+leDNMJ2+AJlpcUKxMqaXk9xGW1Ihf2RIwECYcFyUjM6G3n
	0uUED2sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMx8-00000008Ety-3Pfk;
	Wed, 25 Jun 2025 10:02:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUM8D-000000084sF-0TIq
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 09:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=Ygx445Wd9sTCGBV4j0Dqor5pW5/2LjizvnGLp+BN9IQ=; b=e9AaiLEz54RQZRcYlq+K0gOqNB
	ee0kv431AiWHW5og8ppMXsEp6qhcWMP2ATlkcoldkBkg9JhTcoATQ1bdBBzBqDZTY0u+usTHucCLa
	T5qGZBARmXQIXVTKQAANpsiLTvWv/sM1P7FLBRZWf4KjLXOb6KzTsDINaubcsdf1Md6Hw1RjSRANv
	euVgcEC1859uFzj3Ydp/4xpSeqA3xoAFYRUA0P1UKy9gU3jUJEdtbpmatimfpALcSJMzDXL9yzYJX
	xthfPWfl6kIVC/G2TGpFsLTmBUfw+CMiKUp5hFw2/IYXfGH6Z3wJET9i29tOlSnAi8mridwYcrKMd
	J0cLYkZg==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUM8A-00000005ieP-0xM8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750842562; x=1782378562;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=atWXI272KosC+H1LcVLe8DaxkOffIpJ+2UQelLC0JuI=;
  b=WMMDJLjjR98+rf6RvBKabHqcfrqSKJ1Q0Ai9AAhrs4lFrJ2y/sOsA2AE
   hEAsWeW7rQeGNUuYFSDV/13JR5Ghe/ouoSG8T1uVeLbs/FhC4w/48Ez20
   A/zpY7FmlxNhJ5Z+2Q27niXTrOaUUUtzwfxszi+QP/xBZImTz7IGceNAD
   ul31f93FeQaH82ocvJVOG6wuAEqHIEmO6FQF8Jsb5EQvWbQeZgK13yo1t
   /QDccSOSFg2WYd+rn/AAUciYZu9lAapIleSipQQMKuj0gKiZNqWmsGyM9
   1WuK2hsV2TK0jnCN/D6VcI4yitlChuv8PJ5auLCJv8rVvvPnL56pc/D2s
   w==;
X-CSE-ConnectionGUID: sxBLGQKwQuaA8VjKmi+wng==
X-CSE-MsgGUID: BMrW+8k5QGqrjaSZ5e4Xvg==
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="43794891"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jun 2025 02:09:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 25 Jun 2025 02:08:53 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 25 Jun 2025 02:08:49 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 25 Jun 2025 14:38:45 +0530
Subject: [PATCH] ARM: dts: microchip: sam9x7: Add LVDS controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-b4-sam9x7-dts-v1-1-92aaee14ed16@microchip.com>
X-B4-Tracking: v=1; b=H4sIAJy8W2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNT3SQT3eLEXMsKc92UkmJdU5PEJCNDY2NLkyRDJaCegqLUtMwKsHn
 RsbW1AFX2L6VfAAAA
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842526; l=1095;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=atWXI272KosC+H1LcVLe8DaxkOffIpJ+2UQelLC0JuI=;
 b=DM1uwXN9vq1EFJdLT42C8y5Vx4i/g8XY8kgFhPfIPjKVE0Nj1ox5fdWU+bOjosWjWnI6UU6ol
 uoT6GUrbLVBCDyvYGbtMzgHX42f1bo6qTVOj1AyFVhQu6Q3E0eHdmbM
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_100922_672751_95123739 
X-CRM114-Status: UNSURE (   9.11  )
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

Add support for LVDS controller.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index 2063507d0c50..66c07e642c3e 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -1115,6 +1115,15 @@ AT91_XDMAC_DT_PER_IF(1) |
 			};
 		};
 
+		lvds_controller: lvds-controller@f8060000 {
+			compatible = "microchip,sam9x75-lvds";
+			reg = <0xf8060000 0x100>;
+			interrupts = <56 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 56>;
+			clock-names = "pclk";
+			status = "disabled";
+		};
+
 		matrix: matrix@ffffde00 {
 			compatible = "microchip,sam9x7-matrix", "atmel,at91sam9x5-matrix", "syscon";
 			reg = <0xffffde00 0x200>;

---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250625-b4-sam9x7-dts-54ab213394b1

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>


