Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5306C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGrRCz3GXNXyl0k0QZq6NLs8z9N/8wqt8pMf3VDeCQI=; b=tAO3nSzDNmXoy/grNJfpv/cxN2
	gH85P8liFsY8Do4uTJeaEYSvc45rfbhOc0Ro8VCGCU2bchXf5V1YhE4lvvAJ5qhOgPbClcV6Rrnxt
	Hvjk+71enpRr4k+KzXt5J/FZnjK7rp/ua8aFS8xdn98h53xyVVcStqm2SRl5bqs/u4hThoAoDcBjv
	cHkQRbOoO3C63bG2MLwSk5sb+iK5dKHBGgYea7iXDDE9nw9qu1poVrpO5akt7ZJYr+jVAohW74Gxy
	p+2JsYPgFqb4WIMHTjZzsmqfUCKyVem65oyi+KhoTyaBsXwQaKf/HJ7uHPDSPRKN75BlezpVgxTsk
	Mn5ksZuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTUB-0000000BQ6F-2s1h;
	Wed, 11 Jun 2025 21:59:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRRI-0000000Az8O-0pBP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749671328; x=1781207328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QqgIym6p0/qWG6bPfyPWCvi9fxJfP7GcleXqFk/F74k=;
  b=GULWudgTuKE1cXplMHNBecQudbMKXHYzl+8YyLtTL65OaADoQ8tmEpuO
   MZLLFiUan2sEI4WFaa8hiMN1CpaeIiu0wXzZGAcsXZZzu3I/wy/HUh8CK
   rMXmNFvN2xL4OxIA5r8jwsDSBxjiKgOR/mCRuhkOpdVd2NN6NI3vuGC5O
   Bdx09iMVJY6pvtLrvWIS2Dq3Vga5nA1VkbpiG2EJ+kenkieiTVvLBN33d
   s5SDKUtAyyTVP5pBhMHgNAHg+h/Vly4noRIuHIQ0h9g28NEC2oN8aBQ21
   yohd4ipS2xsL73V84DF0//bjLsQGSLsgZUDfpaUnV6bdeiByVk1OZtmjm
   w==;
X-CSE-ConnectionGUID: Mlj04rVUS3aXDCaAEgxBzw==
X-CSE-MsgGUID: tdR9S1agR1iDCe8VcV5Rsg==
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="210175081"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 12:48:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 11 Jun 2025 12:48:16 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 11 Jun 2025 12:48:16 -0700
From: <Ryan.Wanner@microchip.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<olivia@selenic.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 03/10] dt-bindings: crypto: add sama7d65 in Atmel TDES
Date: Wed, 11 Jun 2025 12:47:27 -0700
Message-ID: <1fa63c0ff667c61c924f1571d9c2f03cd1fcf7b2.1749666053.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749666053.git.Ryan.Wanner@microchip.com>
References: <cover.1749666053.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_124848_304139_925D7440 
X-CRM114-Status: UNSURE (   9.60  )
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

Add DT bindings for SAMA7D65 SoC Atmel TDES.

The SAMA7D65 SoC has the same capability as the SAM9x75 SoC.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
index 6a441f79efea..6f16008c4251 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
@@ -15,7 +15,9 @@ properties:
     oneOf:
       - const: atmel,at91sam9g46-tdes
       - items:
-          - const: microchip,sam9x7-tdes
+          - enum:
+              - microchip,sam9x7-tdes
+              - microchip,sama7d65-tdes
           - const: atmel,at91sam9g46-tdes
 
   reg:
-- 
2.43.0


