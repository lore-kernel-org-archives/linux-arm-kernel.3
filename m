Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D031BC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdfnQpmR/s+XiF3nbzSYbbxPpv3OwypOk8JP+sO5tzg=; b=PQsJRlJgmTiUrq/Vb1Dnnap0sZ
	Kh3hBE87v2SEZRW4W3z/elXCCmcyTyAH5tU12l3xOv2z1ES9Bpk34WJGAvt8RYCDTtpg3t5c+sLJa
	RJ4BZ9zxKSKphAYIUwXahMP4HfIe1UIehRD7sSIlU6THLZziATQVDl/HjzZE6QMampIH8EXBhHvun
	k/Ka5lknu+dJye5237Vbzgvn0+2pgGaoIbJBKBQeSgxW4jM9Jy+HrBopjVIGeQWBWIEaL4CpgQx2F
	WdMPqKV52SWaV1LtniGoPIT1KrMb5m+Gxei9Z1OsQBrI6v7tzFpYRe7HwrO+aklW01eqKt9uiXozV
	/smpZKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYlS-00000009L7n-2uXc;
	Thu, 30 Jan 2025 17:55:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYSn-00000009IQI-0jY4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738258584; x=1769794584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=py/yqNx13hsIQ9lYRrDtu9qmIYc+M8dbM6qysRjVXU0=;
  b=Z8wpqAe0NlI15qppetzGm1Qhun3sryJVMOS9mDf4h5ZKQlC5puIXz/2n
   zR4DT8wgkENK1U2ntYoAQiF9GMOXdl4NjR491boLJgh2FrqcoVQMMoIgi
   6885PiES51sBhw7ERBWjNgMJWNJ6jhunwaPgxjQvRHim79wfrRk1CJRoJ
   AQ+YnTBc2SPLfYLTh17MxVU1jUoBWXU3gfrX1ufe4IUQAv5bihTmJC07W
   M6da2/yFkhKqMC8pRotgrXhhDzo3lGu3AdnOxmD/7olIrmfLRSB5MIXOz
   dqadt3GTzzixapC2HlW7xOMQtZnxS20bPklzZP6lSvDMlaTHTtK8WLtUk
   w==;
X-CSE-ConnectionGUID: Qux6TnwtQkq+U6Cg6JCAlA==
X-CSE-MsgGUID: 9Uc2kZpQTSKP4t4SzjONhA==
X-IronPort-AV: E=Sophos;i="6.13,246,1732604400"; 
   d="scan'208";a="204623016"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jan 2025 10:36:22 -0700
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
Subject: [PATCH 08/16] dt-bindings: at91rm9260-rtt: add microchip,sama7d65-rtt
Date: Thu, 30 Jan 2025 10:33:48 -0700
Message-ID: <f5642fad5d7a97772ae22c76840c5c51ee79ec0f.1738257860.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738257860.git.Ryan.Wanner@microchip.com>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_093625_276576_224F82DB 
X-CRM114-Status: UNSURE (   8.50  )
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

Add SAMA7D65 RTT compatible to DT bindings documentation.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
index a7f6c1d1a08ab..078b753f453b4 100644
--- a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
+++ b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
@@ -23,6 +23,11 @@ properties:
               - microchip,sam9x60-rtt
               - microchip,sam9x7-rtt
           - const: atmel,at91sam9260-rtt
+      - items:
+          - enum:
+              - microchip,sama7d65-rtt
+          - const: microchip,sama7g5-rtt
+          - const: atmel,at91sam9260-rtt
       - items:
           - const: microchip,sama7g5-rtt
           - const: microchip,sam9x60-rtt
-- 
2.43.0


