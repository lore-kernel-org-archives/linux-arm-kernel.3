Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34651E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 20:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMeqXExHrIVkhGEAo7fE5QMubRCCVhjNTNCGdvDbwtE=; b=25Znh/bpm+VA/Cz+ppRcNXHVjD
	wGobz9GmmIJKsXXz9ev9NjwlvjXP8Bmin/AH6kDSAd141/6urN10wcyW8A/yX+2JMhFAKEvlX6u61
	mrA+l0xKQw7mOqqyBF2bbMkAK5P3003glR6Fy/q4ww9xxqT7UpHuyWvIOg5ipFMZsdSgU11GlFFjp
	ffti/s4lyAnYcjp9vbRgLPDWfxaHpKo5spHWO/jwpjI97vYA+wuz5O50RswtB2tQzp3ovfyja5l1O
	4zw4fDrnkBDxwgh/vYDH3krQml6lbO/mqCsMBUW3lZ6P9mXp0S6yKmMUr2DXyECHPbzc1U8VvVtI+
	P40gETSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeYr-00000002dRF-2RMu;
	Fri, 06 Dec 2024 20:04:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeVo-00000002cUp-38AD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 20:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733515276; x=1765051276;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VAdJol7PmMF7V4YKfhk/ENIziIKjhdmKECb1lLmge6A=;
  b=qistbgz52zkaZpjVRKxpfbVl3AdXyy9XsQcw47OWERBnwM/BDUwDt9f4
   Z465MvQVnOXLk/NpklRmrA8DL+pbz/W3uiwDSEl6tbYEKWrRsYJ9WDJXD
   KZD4BEpLt1kpU7VaQDre1UsLQlFzP/bgGVpsHC+dyQakF61qxbK3SFfIK
   jVOU3V414VriY1GcZGPwgLAACLDryHJ221/pqZtVjTOo9E9ByTkWoaL03
   qA0MEry8ozKGSa56TQSJQDQePSqqVLM7NBa0AKdKUQu/IiEOrcI8dp4Jo
   Q3bCTdX6d2EzthHw2U5aVyVmPy/3YnDEbuVlrRntDi0FHwXp7mnJwnI5O
   Q==;
X-CSE-ConnectionGUID: 9plLhrxgQXuYZUyQ8wJyMg==
X-CSE-MsgGUID: BQgkJaanTKeNcSzhvblKqw==
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="34926407"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Dec 2024 13:01:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 6 Dec 2024 13:01:10 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 6 Dec 2024 13:01:10 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<arnd@arndb.de>
CC: <dharma.b@microchip.com>, <mihai.sain@microchip.com>,
	<romain.sioen@microchip.com>, <varshini.rajendran@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 06/13] dt-bindings: clocks: atmel,at91sam9x5-sckc: add sama7d65
Date: Fri, 6 Dec 2024 12:59:51 -0700
Message-ID: <b7a8a22a571f6fc2be56a25f26757f37fa8d2bb3.1733505542.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1733505542.git.Ryan.Wanner@microchip.com>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_120116_879478_437A7833 
X-CRM114-Status: UNSURE (   6.85  )
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

From: Dharma Balasubiramani <dharma.b@microchip.com>

Add bindings for SAMA7D65's slow clock controller.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml
index c2283cd07f05..d4cf8ae2961e 100644
--- a/Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml
+++ b/Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml
@@ -20,6 +20,7 @@ properties:
       - items:
           - enum:
               - microchip,sam9x7-sckc
+              - microchip,sama7d65-sckc
               - microchip,sama7g5-sckc
           - const: microchip,sam9x60-sckc
 
-- 
2.43.0


