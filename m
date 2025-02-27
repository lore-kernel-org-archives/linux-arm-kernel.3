Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D1BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Wz/42wIaeBaSl7TdoWHH30clfooNjF6JzJUD5Ih9LI=; b=Rlr3xf5BC40FgYuiBWNIpaXKb4
	N9Dyh84lbLoCxDF7CNW6g3AjRIBWDnru1hGabUHhncrNLQHh2G44BYGf+OM7pskEfa2jgiUoYtNZD
	sRbbBU2rddcjJz4tFeMfgcmbNX72GhZyM+Y8BeWsfsl8F6T4Otwc2FJsrU/+vehg/Nl+5RSeOgWrT
	PvjOCBczuRrJp1X0U294RIPSYRdjRrW/Vycy4iW0eOKRRvVSA/ekpPDE98XEFv/+8ITNW/biexcSI
	mQ3xHp1v0MjlTxTisqCqZKj2A3Uu2gjAjyO/oEeWqlshygOYEOdb/1wnZApeojUFja4yrwQ8xCVsN
	3NKzR9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjit-00000008X4T-1non;
	Thu, 27 Feb 2025 19:39:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngC9-00000007xuB-0Eob
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740671585; x=1772207585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YTKmnoBoJKJalyZ9+wnMP6cOqS4GPx8T77stiH9ewgc=;
  b=u2lfqUpWGsEhvXD3yQ+8824WaCSNz1lv5KZmbr27e2mipzJ2+oD9otv3
   +cTFc5q12yMN6470qjeFkZ09NQ8EJA140a52CkztXyo4iGQrgHKDqp1K1
   4vNuwWon/nJBvWM+lkjJEa7ZbRAxCf903niR12z24Vi/DAxEnsTbAFTWI
   z3ttDitR8E5SuTEOJWaO8w+00goJoyX5B/BNkz0oJKDgzp8rjIBW9+aZN
   Q6lrBIKTbVwDf/hhInibxa/JTuPcWFyfjsPuZmfcGIfw1UXpO9jVcBqaa
   hnzL916rDHzC5wRhWgyqjnzIYfEnXbia+qz3uNFWA+kpWWtHp/gHtMuTq
   w==;
X-CSE-ConnectionGUID: xBkIAngZQVSwQhIMCQbtUA==
X-CSE-MsgGUID: L6MQVkjMRV+EIvF8OWYFtQ==
X-IronPort-AV: E=Sophos;i="6.13,320,1732604400"; 
   d="scan'208";a="38638184"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2025 08:52:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Feb 2025 08:52:47 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 27 Feb 2025 08:52:47 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 19/21] ARM: dts: microchip: sama7d65: Add SFRBU support to sama7d65
Date: Thu, 27 Feb 2025 08:52:06 -0700
Message-ID: <dbc51f95f301c106c031fb93f84d0d847e818d91.1740671156.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740671156.git.Ryan.Wanner@microchip.com>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_075305_174031_D9A18190 
X-CRM114-Status: UNSURE (   9.82  )
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

Add SFRBU support to the SAMA7D65 SoC. This is required to change the power
source for backup mode for the SoC.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index e623f9d22f36..45037fc95adf 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -78,6 +78,11 @@ secumod: secumod@e0004000 {
 			#gpio-cells = <2>;
 		};
 
+		sfrbu: sfr@e0008000 {
+			compatible ="microchip,sama7d65-sfrbu", "atmel,sama5d2-sfrbu", "syscon";
+			reg = <0xe0008000 0x20>;
+		};
+
 		pioa: pinctrl@e0014000 {
 			compatible = "microchip,sama7d65-pinctrl", "microchip,sama7g5-pinctrl";
 			reg = <0xe0014000 0x800>;
-- 
2.43.0


