Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8F5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 21:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MPBEbjOso1C0JA2fQOLYkIy09vBaD1zBkoUoFmxwKk=; b=4apFhJ3YsAbPkFd3V7KS/2o+qU
	n4YP4VoSCfFp6La/eUfr/eM+iKawzjEY+Y7lmxTytmWGZ1QdZsvAU3/3KwYZieIqKMVzQqUUehHJj
	hEvWcLOECpidM5ZV41HW7a9Z8KdkgwZriIj8riXT4HsjoQQINGPDyMjqld4ccDpP66+EC05iIhXtA
	PQM1K2F8XDVt4gIlzu1NHQCB/vbAq1ZRNPgraviqckr3q/bhV4r0YqMqAqRig/cKCTTLqeSU00V8p
	vdG/1gC1dx19XggLn9laFmDQP/l1bug8n+AOEWSJONC7R78Pbhj75Rm4vgP9Tlje6hRAB8JUpQWEm
	hiRpbcKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOkGO-000000064dV-1UOz;
	Fri, 20 Dec 2024 21:10:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOkFD-000000064PS-0hXR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 21:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734728950; x=1766264950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VUT45XGlDSMQNHusgz0mY/5e3jHIdDXBnlb8O2girPc=;
  b=GsQnsba3ParjbUybc5Y+YBIUxumWgsh7nvfoGTqzes0UncjX4Qbcu1aS
   2/ZNoIS+sFm8GvLhTETt/cTi/bUSfS4S5GWXyc6GzR9CPwh4v7N6wStaN
   PLc/QBQ6wM9lazYsrKGfoI8r1tnF7pgmPh9ljdOo6f9+NyStyiyPyzplg
   KhUybcVILtxa1Y5/mdjV/eSBU4xt9OIzq4hywSkscv3vIR3yUmgPC/YbU
   dU7COj112HMU2ny3NZe6rujsHeOnoHRjE5a8SKdxcvNzMFGzO1r/7oKeB
   xoADg2sv3B5UuF4/cIjvV8B4LXxb9rNy88jimuB5M9Hgn7wDI2A6o6tur
   g==;
X-CSE-ConnectionGUID: 6Xn2bQedQHqhtDmL7ky2MQ==
X-CSE-MsgGUID: 3ZhaM57qSmG0+JvYfvcRiA==
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="203274639"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 14:09:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 20 Dec 2024 14:08:42 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 20 Dec 2024 14:08:42 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<arnd@arndb.de>
CC: <dharma.b@microchip.com>, <mihai.sain@microchip.com>,
	<romain.sioen@microchip.com>, <varshini.rajendran@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v4 01/13] dt-bindings: ARM: at91: Document Microchip SAMA7D65 Curiosity
Date: Fri, 20 Dec 2024 14:07:02 -0700
Message-ID: <70d429086fd8e858d79ca2824ad8cc4a09e3fe5d.1734723585.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1734723585.git.Ryan.Wanner@microchip.com>
References: <cover.1734723585.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_130911_338059_DE6CBAE7 
X-CRM114-Status: UNSURE (   6.91  )
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

From: Romain Sioen <romain.sioen@microchip.com>

Document device tree binding of the Microchip SAMA7D65 Curiosity board.

Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 7160ec80ac1b..0ec29366e6c2 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -180,6 +180,13 @@ properties:
           - const: atmel,sama5d4
           - const: atmel,sama5
 
+      - description: Microchip SAMA7D65 Curiosity Board
+        items:
+          - const: microchip,sama7d65-curiosity
+          - const: microchip,sama7d65
+          - const: microchip,sama7d6
+          - const: microchip,sama7
+
       - items:
           - const: microchip,sama7g5ek # SAMA7G5 Evaluation Kit
           - const: microchip,sama7g5
-- 
2.43.0


