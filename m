Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE7DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 19:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6PXJJ9vtPIERPxNYIXmGd5qCd9BtI/N6PZk3L2H47U=; b=x7Ge3mqmJaqnM7C90DtLV8cORV
	ptvko4YWSIjuwliVwlfDMIuPrT1PMCjX1tvhh3npd+gsNOcoWlhvbSbJo4A9jzP0evbnxXu+3IanI
	Ksiy3gJUmTKWYaBGjILmBnQ2BE8i+OoIBCaf4jHffp/oDD2lY//X4nPs/PxvHhcjdeopFWkDbVc99
	4m0JnlDAeQu6MbEY9lz1xBnx4PZ9ugsF4/tP2SJifDGSk+RSGBIpTs7lNtMr/CR1K+xb8teFA3eIw
	Vh2ok4Gna6+hN0mSqjgAv2NI57ME/mq8LUUzRdie2fIiqDvhEfEdajM1p8JHyVOx8qd+MEwVz57Oi
	GvCxBOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYuN-0000000AY2L-0QrI;
	Mon, 12 May 2025 19:33:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYqJ-0000000AXJ4-2Kld
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 19:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747078179; x=1778614179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/61U+nFwbRYm9NmcMk+7wewKlEE4ETc8NUwzLZDc/gA=;
  b=L0H2ncODmg491+qU8drooKhjHx/zD99LFulDFsiqCUEB0nuxZ22WLYw8
   aeqNEldqQQ/CzA584174tqq2E0ps1f016q44/jwvCeESAV8bNGCkci1TB
   v/Jd9Wm2BEkhKoCmwPCJhInAPpiiyaQw3ZrOTCyj+4BCyjtUoBaEBIsGA
   fMD7QBsMJ0arb+Rtu2MI9lNzcbZ5G+SiLqOse8D5bQCTmh1uM3V+io0lq
   mowCQJUw4cVeXEBMvddTKZf7C9HOCUtUONa9jbk0qP3xsIPQ3OjWeLqkV
   TjuA+ZbeatCJAbU+B4FGXQbJvvUxad54PT5byYGXcK3vkc+XePpt9G7T2
   A==;
X-CSE-ConnectionGUID: hYKpzzHaRPOvLPNNOvU8gw==
X-CSE-MsgGUID: NLlxROieQM+TrxnEaF/p7w==
X-IronPort-AV: E=Sophos;i="6.15,283,1739862000"; 
   d="scan'208";a="209006608"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2025 12:29:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 12 May 2025 12:28:56 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 12 May 2025 12:28:56 -0700
From: <Ryan.Wanner@microchip.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<olivia@selenic.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH 2/9] dt-bindings: crypto: add sama7d65 in Atmel SHA
Date: Mon, 12 May 2025 12:27:28 -0700
Message-ID: <5c87dd0c60e3ab295bf084cabb59199d5cb4d93b.1747077616.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747077616.git.Ryan.Wanner@microchip.com>
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_122939_754284_85BA3543 
X-CRM114-Status: UNSURE (   9.05  )
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

Add DT bindings for SAMA7D65 SoC Atmel SHA.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
index d378c53314dd..375464222942 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
@@ -15,7 +15,9 @@ properties:
     oneOf:
       - const: atmel,at91sam9g46-sha
       - items:
-          - const: microchip,sam9x7-sha
+          - enum:
+            - microchip,sam9x7-sha
+            - microchip,sama7d65-sha
           - const: atmel,at91sam9g46-sha
 
   reg:
-- 
2.43.0


