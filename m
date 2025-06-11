Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8251FC71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 21:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXpbEsO5eb5xjNNymWPtJ0HALCMGPPW/YTk+Y1AzXl8=; b=q2o07p7gTFiO2JPW0JPjdhWXS9
	DOc4BjFN6I8IOMDfqAKcDwic7Uj7Z/Z/3wi+9aZ0j3UTMKtiY/NBOr1msPSbnt6s5B2c5h7bvqOEa
	bhBDMcpNm91v/60oX/5qQKgccye1nLnazvincjZJqv5WmPxO+r+TBt3PQvdH29jVAbVNg1MwKiQhZ
	pue+9FUbThUG8tmBnz/zUutPWf27+5py0BPd4L6gynwmWGsVTBOorlo2on3rHOsbEnbCktPeKDndv
	xv/wdVNzaE5MzWXLi+Pd+8OUz2r2X5rTlwGc8dLY77na9wcWSWy4OCqUsHCdoa30x3XxS5jJ9DAbV
	CJIO1AVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTQ0-0000000BPpy-12N5;
	Wed, 11 Jun 2025 21:55:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRR3-0000000Az51-0MaR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749671312; x=1781207312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0IogV/WYEoJgdGYIarAuHouch0dnxthSZymoHBE3dXo=;
  b=B0llwAF+z+ixYXQjuGTa5W2jC6tN5Cd1PXNCwZeXYTCCWRgu2LFnFnms
   mgo5ZPn5+UBHc3I9sPM62VEkJ+3CJ2lSQRInkUqAEAxckRDKScDAGQz/r
   Sxyey+fQ3g0zl5YWmV05OwRb+vwdaqXSOiKcSgbtwv5hOYahpSOsyOTkl
   UHAMYcZc7Egm3SAlupl09R8mW13eqv440V5axoTWUm/h8dJw1h8cX76B+
   46TQnV1JFlYdiLbOtHOGtqrTLzSBjJlrz04wFAgKAtHva1vaaC56FBgzu
   fznUQlZxEcOto1HvXFdAtMxPHzF3b87wD96QNLp5/0uigWz2HAu1mcoW4
   g==;
X-CSE-ConnectionGUID: VqjTqfGTSymHXSpb+r0c0A==
X-CSE-MsgGUID: AHBRzxCASWuSQB5jtvbCVg==
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="42226222"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 12:48:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
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
Subject: [PATCH v2 01/10] dt-bindings: crypto: add sama7d65 in Atmel AES
Date: Wed, 11 Jun 2025 12:47:25 -0700
Message-ID: <7aa1862f790ea19bf7bb55e07ec4b9295c5f7a44.1749666053.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749666053.git.Ryan.Wanner@microchip.com>
References: <cover.1749666053.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_124833_186738_081DC6E9 
X-CRM114-Status: UNSURE (   9.62  )
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

Add DT bindings for SAMA7D65 SoC in atmel AES.

The SAMA7D65 similar to the SAM9x75 SoC supports HMAC, dual buffer, and
GCM. And similar all 3 it supports CBC, CFB, CTR, ECB, and XTS.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
index 7dc0748444fd..19010f90198a 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
@@ -15,7 +15,9 @@ properties:
     oneOf:
       - const: atmel,at91sam9g46-aes
       - items:
-          - const: microchip,sam9x7-aes
+          - enum:
+              - microchip,sam9x7-aes
+              - microchip,sama7d65-aes
           - const: atmel,at91sam9g46-aes
 
   reg:
-- 
2.43.0


