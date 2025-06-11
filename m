Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644A6C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIbw8nhl6hj9dHiQ3b5rFaGYQ9SqOhXtFWjNPx8AXvY=; b=q1Z7P+zH8fzju5pvU2O/BYoYbA
	35ZMvRLxpuGl71HgagYodFgFZMZCJ7vXhdM6+A5KGd+jODWW61HzgUXAxEpdIIjivy161JAdSRWUO
	spSpRtoETTNhpWlCA1MgR/HmxBVP2nbdyJoNpZE/AV+pW2lwPdGy3NR70MuRl1PE9iyxJkcojQ6i9
	ebRNV7Uf/Fw2bNx/4xh/bQ8rs6uyrdqzGteDv/i6wviHFk46i1e/58L4r0ebZ8DCFQ5tkrLepUwph
	O8CTL7tuQ/iZsAcVXzWSq8Rs5zMvPOsGQsdbo6x+g+DFSwlgjZR+wp7RvZU+A+EeH5+I2r2BZf2ot
	ZOt7GwKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTWH-0000000BQDn-1jcO;
	Wed, 11 Jun 2025 22:02:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRRI-0000000Az8v-3mtZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749671328; x=1781207328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e2CR4qFcyAvu1VwvbaZBR1DNF3T1rdks6W3neIG4I04=;
  b=sd/D0s+gwOO94hJ3+ZPa88jgmGqdTM+ACPK7C4fYIpLBwE9R3pT9o6mq
   JUj+m8KOdqRz5nkBJeFOz0Q7nOpmtms438A/5lKEVd0VWA/UQEpgfpiVG
   jL2P0P+HSCQRVDTqxteJOP44162i3u3PVwxFE8iEKbkCM+0wyAcQJrm5Z
   7PcdPkQzHC34TEqy/e4bWJ+q/nHaQaRbJlIOQzajQfpmgEqnsH67sfeqB
   IDxEgUsUycAm/0eVY/xpurG1AwF69CEhWYQNdK03wmE94VJ3+OPPSaAya
   2nobDG+AZsb2A2oTCpnRkz/P1WituUDe9sgHss2Vimkk7Zr00sstac5Kv
   w==;
X-CSE-ConnectionGUID: Mlj04rVUS3aXDCaAEgxBzw==
X-CSE-MsgGUID: jMm4TowrQFuTZc653joPyw==
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="210175090"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 12:48:47 -0700
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
Subject: [PATCH v2 04/10] dt-bindings: rng: atmel,at91-trng: add sama7d65 TRNG
Date: Wed, 11 Jun 2025 12:47:28 -0700
Message-ID: <80878d76cfa34ebbc262f245facb98d4a1bf9569.1749666053.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749666053.git.Ryan.Wanner@microchip.com>
References: <cover.1749666053.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_124849_007473_EF7FA863 
X-CRM114-Status: UNSURE (   8.14  )
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
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


