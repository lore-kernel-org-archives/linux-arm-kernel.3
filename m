Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BD7C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 19:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaYs0XZprY+p0Eg1gdkiJ2Kj2pyo2njZSrT968obIVA=; b=pM4iggHqxkJlqQ/ZAFhUR4r3EJ
	9ncEsulwt/HDhZWsY3pMWv/JQiP6wv7ZQv5nQuYID37mAd8fIVkkUsKwi6hw04YI1oPzOp1nRj4Yg
	o2ujg0vuxRzdBfpWT1zb7cYPwjuIseppcA8KpLNCo7pRl652C2OqIVrOKheyuPV9fv0vXWHhVvFni
	GY2md6Nb9LCT7Z87Vhs2MZ11W+nI+SuoVHpSbXXlHq1uQJhgmJVEl1hbGNHh4nKB+0StWrKDqDy0/
	PCSZomHKpME9ouAcHTgEfs2SKP+rcehEeubDMGPb1XkjYmZiQwyBuIAIS6o+Qd2BVFTBcW3lz/tma
	RkRFDkOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYyO-0000000AYP5-2Wh7;
	Mon, 12 May 2025 19:38:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYqL-0000000AXJd-29jC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 19:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747078181; x=1778614181;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DSd7HCJtABKxLA0P+qbEhaLgR9tQYl+AuyBtzzok9Dg=;
  b=na2n9KcLq4C4G2EkofYS1zZqGum3WOyr7pmp9jH/OJDXt552bXbeH0LP
   ysuy+ibJCiz9vJOrNsKvQWlVYUoBCezNu54xiYxEEXVfD6skZQduW1Pj3
   L7EMH719kfJwvhR2s4a8tnF6NLuXqKlznReNJzklMpfo1QaVEdmTgj7nw
   fPyUUe4MwhOWsFUDhNtbe0WR11mN9iBXhpfZ2qevxoHAQZS7mBxZEbM5x
   UoKRemcAmYybS3TAyqaC/FvzFY/7fq1rD3QcljZ+7JAF1tZQMVXTKHrFw
   6PuCbO84Z6MDhqtkGS4mHcVSu5H4x+ZGnEoUi6URNSewQaJ+ZzOelk0SU
   w==;
X-CSE-ConnectionGUID: hYKpzzHaRPOvLPNNOvU8gw==
X-CSE-MsgGUID: xTN55bTJSl6rW4XcLv8AWw==
X-IronPort-AV: E=Sophos;i="6.15,283,1739862000"; 
   d="scan'208";a="209006610"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2025 12:29:37 -0700
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
Subject: [PATCH 4/9] dt-bindings: rng: atmel,at91-trng: add sama7d65 TRNG
Date: Mon, 12 May 2025 12:27:30 -0700
Message-ID: <68e45a56e70e0b0b001870905917e8f7ddac61a3.1747077616.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747077616.git.Ryan.Wanner@microchip.com>
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_122941_612549_96C4C775 
X-CRM114-Status: UNSURE (   7.80  )
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

Add compatible for Microchip SAMA7D65 SoC TRNG.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
index b38f8252342e..f78614100ea8 100644
--- a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
+++ b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
@@ -24,6 +24,7 @@ properties:
       - items:
           - enum:
               - microchip,sam9x7-trng
+              - microchip,sama7d65-trng
           - const: microchip,sam9x60-trng
 
   clocks:
-- 
2.43.0


