Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B368C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 21:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rytYy2Zg5aOwG2aZi56nVGVa1RD71lo1sR2An7SlTo=; b=gLpaarOs0r/j8LoNeXBjAXY1bX
	GBPRt9K5h0ne0uvuXUOlrrwCEPWdky/wM6BWU3QJ3gdUh3LHSwWyl52r4enfOCiBwrpF+Hp0Qln4L
	LHy22gsaChVuEjsPGdnN5CCCHn0+TNEgrV94urTf7UCSzPccV3EosuJmVNY2KKcphPnh3MCvNPldW
	GuI7NCCwsttbVbSLH6OGl+hfikEaJsywr4KLnCrWrp8urUAMckEFgzEAVDAjcKs/I4UfUuE02z/ly
	vv4Wxv+KH1ITlk2FTkM4GusPkPgnWI372W4jUbUgUKBMp7AcnPeIaK7121URVojJ7FfenTxbD81ew
	+8z0YPUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Rhn-00000003cUV-3Yzp;
	Mon, 14 Apr 2025 21:51:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4RZ2-00000003aew-0mSA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 21:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1744666919; x=1776202919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lRUUsu68yjl48Dfc+/ph2mpUFrsqqJQ0TwHXN3jGP6Y=;
  b=MA0yt5OO8aHOvXgwdSz9zmzrmHtrFnobyeIHCJ/MPWbeJ3KDAWZ7JlC8
   7JBb/7/4gu9dFa0U25ldU9ol0pMzMdI2phFISyWkT1KTTrzRX8RrIlyIw
   c3JtaFeDaJA+7UL9h8SfF/Tf8Ob7jV9otZblP/nJAAYaHJcKr/NCT+x2b
   sX3WQJ167N3fIEBhz+V9fTxWAqlxulxOssYca/aFdMhywY8ng8f/8qLtV
   vbfq4XVXK2QG48gHvtqMf5EcA9BlBlypmJ4LEvz9bZUzhsdvSphKPVpp6
   BteyhrURGztsJCY6rDsSMFAzwvDB9dQqDHpxydWJKtlrwSvxje8Qpu4DA
   A==;
X-CSE-ConnectionGUID: jf75aQsXSneWELgtntpGWQ==
X-CSE-MsgGUID: bnp5lq8FSTiv0aGez8zlHw==
X-IronPort-AV: E=Sophos;i="6.15,212,1739862000"; 
   d="scan'208";a="40006671"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Apr 2025 14:41:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 14 Apr 2025 14:41:05 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 14 Apr 2025 14:41:05 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>, <sre@kernel.org>,
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v5 04/11] dt-bindings: rtc: at91rm9200: add microchip,sama7d65-rtc
Date: Mon, 14 Apr 2025 14:41:21 -0700
Message-ID: <a274485331628be0bcf382b1ba489d4555fa49c8.1744666011.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744666011.git.Ryan.Wanner@microchip.com>
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_144200_290383_B53CB494 
X-CRM114-Status: UNSURE (   8.98  )
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

Add SAMA7D65 RTC compatible to DT bindings documentation.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
index c8bb2eef442d..7c5b13caa40b 100644
--- a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
@@ -23,7 +23,9 @@ properties:
           - microchip,sam9x60-rtc
           - microchip,sama7g5-rtc
       - items:
-          - const: microchip,sam9x7-rtc
+          - enum:
+              - microchip,sam9x7-rtc
+              - microchip,sama7d65-rtc
           - const: microchip,sam9x60-rtc
 
   reg:
-- 
2.43.0


