Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881BDC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhmpIhkytK6+xTrURLCxLIGuAspjIcXpTwbw0+o1Ok4=; b=yvP0pFrxylt93zfXtToMsPIhCx
	Vg4A/NDOjnCcCVLXmZwfZvqAjp/9UDUzb3JShxSX8X/TrECKDd80NJBUUKPyi+Njj8EjJQwUscxhn
	dsgdK1vITS02sykuud3yq9We9Acu2oIlQAMby9/qqVgkzg769lMkzy58tC3C6CnXmCzQ82ZtSvF7e
	LB8k3Qq7bnnwe8vJLVWSGIRuzZp/Vfe975kaqvIhEHtJJM6oBA8eb8ipfiup23/ZvZLhyzHFND2I/
	l4K3hqGIReT4BFz2TjBq/WS8m9Bamo8czaxFMsESY7V9yFu5VQfh5xcX9hdT6ZnNb9GSPqzEOGQ8K
	TQADHPdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYkB-00000009L1z-0L9T;
	Thu, 30 Jan 2025 17:54:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYSm-00000009IQp-2475
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738258584; x=1769794584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3DIUaseaLPdLuHuizOpT4HlTIidRdrZDDni3saHEVio=;
  b=EuVGkgMNADkfXLhLQqTgG1MOCAHMb59Fv5GflKUc8/yhXbTPtH4Wuyym
   RLb/V9U7+QfbXh6figKi3GeHWHxUkEjg/t89046BKw99JCyjQTQsKvPT2
   yzHrfOqE25atr05GJjmHZzVUUPgmGJ9Pk2NqkG+HY6mogmiM1iR/Qm9hE
   jEpINE6nnAEOfzLdupMsfKEPa/4qRUbgwlSjiOIuKASHKSegQfpb6VqMQ
   CjqgMuvSARpc9R/E9GACMYxb3POCA7FSNXjQ/OtQbH4AREQg4HPGTz/L/
   9s+haH31JZnF43hWgAN3sctWoQ8PGMdldt6jkqqtyaHT5QlB6e0WVXiP7
   Q==;
X-CSE-ConnectionGUID: Qux6TnwtQkq+U6Cg6JCAlA==
X-CSE-MsgGUID: EcLVourmTqyK7csd0aL7tA==
X-IronPort-AV: E=Sophos;i="6.13,246,1732604400"; 
   d="scan'208";a="204623014"
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
Subject: [PATCH 07/16] dt-bindings: rtc: at91rm9200: add microchip,sama7d65-rtc
Date: Thu, 30 Jan 2025 10:33:47 -0700
Message-ID: <18618f9afd74be84d446608257c37d7bc8271ff8.1738257860.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738257860.git.Ryan.Wanner@microchip.com>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_093624_601048_95206D22 
X-CRM114-Status: UNSURE (   8.44  )
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
---
 Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
index 30d87b74c51dc..d248cd49dbe23 100644
--- a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
@@ -23,6 +23,7 @@ properties:
           - microchip,sam9x60-rtc
       - items:
           - enum:
+              - microchip,sama7d65-rtc
               - microchip,sama7g5-rtc
               - microchip,sam9x7-rtc
           - const: microchip,sam9x60-rtc
-- 
2.43.0


