Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8034C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 19:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3VZARevejQGEzo8S7FwL/EA7Wt8xlH46kfyZGS1urY=; b=Lr2te7Z0+MHW8VOGnJCOjDem8Y
	ewfNkg3gPyIS4/kUqLb4vQyvJtOp20ZnFCjs492in3ZCuQpNJIkdVQU1RYTIUnsKpSMsQGOgJDdWd
	UqmC90nno4pgJUNY+B6h4ACqPwVTprdcTK00qkdrFxcs+ho3OUFoUEAYOQL3erpf+bU0vaMkHsnmH
	WGHQHF0oFv4I/INfMS6coAikqBDzx4/WDuSsX/wPMNM9jFVaxjdKVhbb/jvdaqa0yxP62YJaxzmag
	sAiR7TJfTejX/xplPZf4owb5Tm3/b9mUcap59gZO0UYzIZ7WSTxcV1eFrXV/MZMrt+3afhpjUeBnh
	aVneTihQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEZ4O-0000000AZ4e-3RuB;
	Mon, 12 May 2025 19:44:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYqM-0000000AXJd-3Dnx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 19:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747078182; x=1778614182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0sFBIF2ykXtcl0pQgru1CGwjmwrKN9g0PCzlEM3PZHg=;
  b=Axl9kD5f5LrPhPie9qoEjtQ4Wzjk54w4jXnqNqrPKYES1xyp8AKL0E6R
   PAxRxOeTWte5mM9LbcgIRNHRWPf083/16qN41TvjsEhGeTBJ52itRIvO2
   uffuexfrU418MEIu7idJHAYQhfVboow9AE0sJD/RXKE8kA2c+ojyydQk3
   cX3UTuoLwDYkxT3aXRChENhEMxxGQ+YzM60HMHDqBtj4qG+w0XLWRM/qm
   TC4tgWfyFSTe9XXqeUKlkyQhwMIMYA0fOMUhmAhhMz1FDSecJOL2YQVP+
   e6XRDMUiDQh0Ve9/XsS7XyXs5SBp+gNsKdghlMfcX02e4B0byNjEPcw3Z
   A==;
X-CSE-ConnectionGUID: hYKpzzHaRPOvLPNNOvU8gw==
X-CSE-MsgGUID: PNaWPgFuQ2mg//QaTO6urQ==
X-IronPort-AV: E=Sophos;i="6.15,283,1739862000"; 
   d="scan'208";a="209006613"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2025 12:29:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 12 May 2025 12:28:57 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 12 May 2025 12:28:57 -0700
From: <Ryan.Wanner@microchip.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<olivia@selenic.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH 7/9] ARM: dts: microchip: sama7d65: Add PWM support
Date: Mon, 12 May 2025 12:27:33 -0700
Message-ID: <fae166010f94a672e4f1906f5fd4394f4236da53.1747077616.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747077616.git.Ryan.Wanner@microchip.com>
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_122942_865351_42267271 
X-CRM114-Status: UNSURE (   8.78  )
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


