Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA50C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 21:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzQibpUyVNLbzBqY8o0LNbyBkNOQOPRfnqQWW8q2eVs=; b=qVR+r5Z8b4OKIMlfe71pM73rDo
	PSBuR80ao8jjV7/K6k5gtc+PtQgPMTBWQohgThuBfbTdb4/ur4XKT3RFF6lEdHO6Xa5odTAOWIn6S
	CXhFunXYMwqHnDa+CMi0/3iOUXzv628MKgoOaO4YB24MyMFOUATaWCWaU2TyyIDKmGeJUFSCk67Rj
	gvZa/WqxYzT2mKnc/gaNuVWqYxKsSiPnwmlhJBISCB8Jw/BA8Ilv8PHoiNkpU5nrbEWpTVYwtD70X
	77qMQfxfWipJN0SWtoRPrTn0EsPGuUjQw0yRIU7XzKklllfkSag4AUzaHXswivY9OYO4AA4KD32Pd
	K09SXA+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTS5-0000000BPx4-3yxk;
	Wed, 11 Jun 2025 21:57:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRR3-0000000Az5f-1Vnb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749671313; x=1781207313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dcOfXL9MltZ3nYKkbPpRui8wd9Bj1jDl3/DeSQhb8jU=;
  b=rfer2Gixs5HoeAC0vwXH+ZSpZsGAMa8VQqAMYdqjiNyoO2rJE97IGY1f
   xeFHltZJcvATcUt15TIotlPFG94y/8eRn2K8ACLfGzXWhyLoNQ9g+Uh+N
   ICajzehqluYG7WdSO6IwgEQR5Q1akPLF1prOu78Ovt6K1wKkb5BUW44Sa
   9uXNm8qpqprSovsttkW/4LKLmIn8dnAtJu26TmaCZS1zazD/c2ZN5FRUr
   gTanYiHKFZiBCygbB34kd56MTPvllKLFBz3zTDHc951VxUqDCiFopZQXG
   fy39QftHgzQjbhy6hPApYBzPih+7u2hbrYEVGJJA/5gesH2J8Pr5cALHD
   Q==;
X-CSE-ConnectionGUID: VqjTqfGTSymHXSpb+r0c0A==
X-CSE-MsgGUID: vvL/xi+4RCO3wjDjSuojTA==
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="42226223"
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
Subject: [PATCH v2 02/10] dt-bindings: crypto: add sama7d65 in Atmel SHA
Date: Wed, 11 Jun 2025 12:47:26 -0700
Message-ID: <a62591306df47ba006470a00e6c25d9df419a4fb.1749666053.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749666053.git.Ryan.Wanner@microchip.com>
References: <cover.1749666053.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_124833_458748_4D1DCD48 
X-CRM114-Status: UNSURE (   9.81  )
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

The SAMA7D65 similar to the SAM9x75 SoC supports SHA1/224/256/384/512
and supports HMAC for the same hashes. They both also support automatic
padding as well as double buffering.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
index d378c53314dd..39e076b275b3 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
@@ -15,7 +15,9 @@ properties:
     oneOf:
       - const: atmel,at91sam9g46-sha
       - items:
-          - const: microchip,sam9x7-sha
+          - enum:
+              - microchip,sam9x7-sha
+              - microchip,sama7d65-sha
           - const: atmel,at91sam9g46-sha
 
   reg:
-- 
2.43.0


