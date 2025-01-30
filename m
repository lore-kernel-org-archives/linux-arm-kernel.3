Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989EFC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHbXfzz2zwzPtXd5Pzch6fIhxiib+E5eo23BfRxXJnE=; b=v6ahv+wf+Ynxu0xhCwR+vGpk/t
	10e9HPZVzO/BrP5qvBz5V0zKgrMetMalZp3e91Tp/TM65LOQNIt9jqTcXzghdHQp39tVDAU/zeOqd
	wiAHJMSQS5AnokYdSjjEWikN06g+2wlXcVyUvs2uWweaPQfyhpPC1cSS/QcBFFNr1g76Oh0B/o8H0
	dg8KemKUtxtfESaudxz9Bexc7txqmhg2093krFHRHE7S2lQuRokxNuEe7j7B9QAGhKjji9+9Em8hw
	2i4vH8hynSTC26LL4pm6O62xATH7aJfZeKUPDY2+CqNECftnZBQUxQi6QIClj2dQlinX9Mne9kWXq
	Gz2oalRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYiu-00000009KtR-1wu4;
	Thu, 30 Jan 2025 17:53:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYSm-00000009IRQ-1HB6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738258584; x=1769794584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zrbbMTlcUWrm93EkCQYP4a8+4Ji/9a+FhVO9sECvsBQ=;
  b=MqUKuyI0JSiifVcQEsRBkYRJ98fAgaKSIRwXkmKs4l4AS1/kQjFVJzpu
   eQZPgdfG0ZZNufE2bcizlKMx9bTk0uTX92ljj/XKxGGFhN1j+0dEl0hKz
   Uh/18M67/FqCPbPgxdoSnJDSdB4ZD0RGHwgSh7pR9bJYq0O7HtKNAuVGT
   qmGdevmULCE7wVjNYYZSPnVQg7nNt83FZ0m9jcCpggM01uf+Mmepb2fJ1
   6jIRhZe+XDkW/8T9GYvBA+cJ6HuE/NWOuI13g0aWLCGA9KCPM8l67qGv5
   tIH27No/B3L8URb/ZVfxRtAoxZlZbh9fa0sk3+x25JDYPKyxPHhKyDceC
   A==;
X-CSE-ConnectionGUID: Qux6TnwtQkq+U6Cg6JCAlA==
X-CSE-MsgGUID: 8djFspQTSKygg97mneOtTg==
X-IronPort-AV: E=Sophos;i="6.13,246,1732604400"; 
   d="scan'208";a="204623013"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jan 2025 10:36:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Jan 2025 10:35:40 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 30 Jan 2025 10:35:40 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>, <linux@armlinux.org.uk>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 06/16] dt-bindings: rtc: at91rm9200: Reorganize compatible items
Date: Thu, 30 Jan 2025 10:33:46 -0700
Message-ID: <2846391c5ffab332ad7a4b65aa60aac9c49a3496.1738257860.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738257860.git.Ryan.Wanner@microchip.com>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_093624_410968_7BF04BF0 
X-CRM114-Status: GOOD (  10.03  )
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

Reorganize compatible to allow more devices to be added to this enum.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
index c8bb2eef442dd..30d87b74c51dc 100644
--- a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
@@ -21,9 +21,10 @@ properties:
           - atmel,sama5d4-rtc
           - atmel,sama5d2-rtc
           - microchip,sam9x60-rtc
-          - microchip,sama7g5-rtc
       - items:
-          - const: microchip,sam9x7-rtc
+          - enum:
+              - microchip,sama7g5-rtc
+              - microchip,sam9x7-rtc
           - const: microchip,sam9x60-rtc
 
   reg:
-- 
2.43.0


