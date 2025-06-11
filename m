Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76ABEC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfPATHuCUjp+ZyoSynj7ITdhG1KrBpnIALcO11gNFHc=; b=3CZsvffkmpgsN7vBdPLoF9WgHF
	BwK4xIiDWHTJXBtQ5jxmG+cCnTCIUJ/zxqQAgm4Xf07VCs+TRngZNPnvXHV8ngfK51ms/wQ2bFzSh
	RBSc96Z4XGVBq8aVUB/RaFlZ6umOGecWb87CVhxB+Ap7Om6s6TDuBSo1+Pa+FaT7OMdi2JqvK3Hu9
	ngoI3sCTggeENa4vUlf75DTKlJVL89tcpPzSJjE16ZXc+U/3bLCFk9yubbpzWuWoP8ve+T+iexJ9a
	XIO6oOxjFGH0sE5SEzd54ElPXqo8F8OlapICz5NkBgECmgagUEy1D2IC1pdF8viRQLavR8QxgfXig
	e5fTqsXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTcb-0000000BR3t-2Tbt;
	Wed, 11 Jun 2025 22:08:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRRK-0000000AzA7-0wpG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749671330; x=1781207330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xLRwY8aONHUaKqsXAclFpBaTSGFNejQ7PpKVRUoZnnw=;
  b=pfDuf8XGN/WykWNNGsqRhw8+8Y+n2C0UV3jfm6W3MN1KJp1+Kb+8sTBV
   Qepbxu0j2d4t7VUSUzhv6+SlJbnfPjovCA1WPzhB3eN5ts5rU+VhrE5+F
   5GmcKK0sfCmEOGOP1SMdirK7+oSJh/prL0kX/F7sBEXPnxC/uVxKiB/o1
   fJGmWprNEtvoUGruiWkQwgfST1FERxFnvuWN9M4Tb0Vio2qyVMhOHkarZ
   KouiyVJRhbRJlk8v1yljSY9ytxq2Jceg00eiQCF5fWs5j97q+ppQ2a2Yy
   /Tsw5omeQjqjA87KNywMi1jhGQR8zrYJRRejUVSrhXO235wdxrPt0r7Sa
   g==;
X-CSE-ConnectionGUID: Mlj04rVUS3aXDCaAEgxBzw==
X-CSE-MsgGUID: UKxifKXEQ6CSQxuy3QPY1A==
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="210175095"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 12:48:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 11 Jun 2025 12:48:17 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 11 Jun 2025 12:48:17 -0700
From: <Ryan.Wanner@microchip.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<olivia@selenic.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 07/10] ARM: dts: microchip: sama7d65: Add PWM support
Date: Wed, 11 Jun 2025 12:47:31 -0700
Message-ID: <195c69a19be1ff14736db402e0f1ee64438b4b20.1749666053.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749666053.git.Ryan.Wanner@microchip.com>
References: <cover.1749666053.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_124850_324999_3AADF17C 
X-CRM114-Status: UNSURE (   8.93  )
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

Add support for PWMs to the SAMA7D65 SoC.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 90cbea576d91..796909fa2368 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -293,6 +293,15 @@ pit64b1: timer@e1804000 {
 			clock-names = "pclk", "gclk";
 		};
 
+		pwm: pwm@e1818000 {
+			compatible = "microchip,sama7d65-pwm", "atmel,sama5d2-pwm";
+			reg = <0xe1818000 0x500>;
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 72>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		flx0: flexcom@e1820000 {
 			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
 			reg = <0xe1820000 0x200>;
-- 
2.43.0


