Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11166C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nh8RUfBChPGGNFGqwzwHxszo3PrDDcS9YA2zqvmJcZA=; b=S/dX4jQ0LMKN1QOnobnY1nYEoK
	z+maBZXbjAaNlcCfIM4l+nsruhKnRxKHvNV7fDqAMtTknRHwQ9Hfym3s/RFJkKmLPdLnyRqUWaVB9
	Vs+NINvOZzSFmJ1cI54O1TxfBdVnIbX6zV890R5i9tyRjUT9HrZW7qb1odwIJRn9wrOxA2NlbDCQe
	A2Uz6/vyQEwI80Q1WQDqENaVDcmaRtiUpMIpGnsKjYWOlHRf17ea+PCpLniGV6WYD68RaSuFGwhfy
	4Xu0F3+LepMqkPzGowLmbGAqLrPUNSGGUAMYAgFw6zOTXzh/gIDkq6HH89R4A+Ot0PREw9YivQB9J
	LyRsB92A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYdm-00000009KMZ-3IQw;
	Thu, 30 Jan 2025 17:47:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYSk-00000009IQI-0Rq7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738258581; x=1769794581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1frEjnWos7xcTbH7EyH3SMbUoW/LsoRaxAhO9WzR9c8=;
  b=hrWCMsBsFt67sJdk7N9vO64s03s8g8mK4J8/ZHFaWFBJZ4TDJZxK+udu
   CYm9gUGz5kjPEwivUhcHlyXn9Q4i4GNRxqBb7EBozBKjUEWNqJGvqDEXz
   /qy9nC4M4BEgH6lvAB3Ymu9nLdikj2u0nUwvPf3hY8b9GNtA1GJOY2OWO
   h8TXgPH7dCsa+TqhcaqLBMukX6y2iICAH2odURNwvaq19bMZrXq/4UbC0
   DSc32BmMR0SFH+SWL9E/AovjvymhmJ8jOwXMLhkL13GCoP8DyU7zT4seK
   nfEXEwGBUmcL0dPVvrYPlIi3wOGSihj71PuYqCkXzl6+u9w4fraBV9MQS
   Q==;
X-CSE-ConnectionGUID: Qux6TnwtQkq+U6Cg6JCAlA==
X-CSE-MsgGUID: UDCpp6ScRyK54LsAtu0LDg==
X-IronPort-AV: E=Sophos;i="6.13,246,1732604400"; 
   d="scan'208";a="204623008"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jan 2025 10:36:20 -0700
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
Subject: [PATCH 02/16] dt-bindings: mfd: syscon: add microchip,sama7d65-sfrbu
Date: Thu, 30 Jan 2025 10:33:42 -0700
Message-ID: <c3f6fdf6a5b9e443e9ebbfbadd42f6d03a1190ec.1738257860.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738257860.git.Ryan.Wanner@microchip.com>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_093622_233292_13C97D1F 
X-CRM114-Status: UNSURE (   8.26  )
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

Add SAMA7D65 SFRBU compatible string to DT bindings documentation

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 54a6d5957e13a..25c4ed6cbf5d1 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -90,6 +90,7 @@ select:
           - microchip,lan966x-cpu-syscon
           - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
+          - microchip,sama7d65-sfrbu
           - microchip,sama7g5-ddr3phy
           - mscc,ocelot-cpu-syscon
           - mstar,msc313-pmsleep
@@ -188,6 +189,7 @@ properties:
           - microchip,lan966x-cpu-syscon
           - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
+          - microchip,sama7d65-sfrbu
           - microchip,sama7d65-ddr3phy
           - microchip,sama7g5-ddr3phy
           - mscc,ocelot-cpu-syscon
-- 
2.43.0


