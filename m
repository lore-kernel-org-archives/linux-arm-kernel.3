Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E7CE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 21:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUwgk2QWNYfTNp+c+xOEwodp3qlLu80/3AXtVWc9kvc=; b=d6im9s5OoK1VOANlp071bdMSW2
	joKtjXyXI64yUGfGU64ZfuoTGzbX1uzpJqF17pFtWgj18uZA5l/SMqKurvC8f+fUykw1MBjWPFXOV
	jvh/J2CUgMqe5OSU06TNK7hMldKMUBosEW5q25ToRdMBAYBOAjpFdWhDyuMDHJh24so0/AXNSxTil
	YfkyVAW1ob05IzM+jd+MZnjQJTf3g6ngpc0nsgKb4vXo7aTDSpXEm+gdkWvP+rTdWj7mrDOAIsE5h
	EU+SeDH9/AOIDeMyISGrokcMhXhwyXrVY5xqaFyMl7RvyJJf3K/83OXCVzJIF4kWq5dvKpVUgMp9G
	Kk/qZjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOkLz-000000065YE-2Jzm;
	Fri, 20 Dec 2024 21:16:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOkFG-000000064PS-02gl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 21:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734728953; x=1766264953;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+pQbU9KrAaqj8DThvbCwesXrXr/EK9f9JQYXh+Yd3Hk=;
  b=AX+321o2cYbEU+CgNU3vmRmiL+fpNWFyJUszOFkVwSU7461eEklQR8Aq
   QSLZ2cC1ialqzcjnsJ661Z6hU8CA6HHqzrwhIMltjY2ix12qvBwzYisKl
   hD1AD4y2pFEp2vqVJkLnm6DXvy4lvGJuANMO5AKbpckuNURZXDehW7HPH
   2hDlYp5qz2Mr2eGO2dA7KM5XuJ165PotjUhDBV6WBn5CJ/NpkV04VB32T
   EX1OlmyDR89Dn+dLJiCQw0BmKlXuwu0krawbV5NyK2dl+FI5oy3ZQCYCQ
   smOuxl1kHq8/dolbBRWse57BLHHA00YKlJcmHgENbztAvzJ48BajckuxP
   w==;
X-CSE-ConnectionGUID: 6Xn2bQedQHqhtDmL7ky2MQ==
X-CSE-MsgGUID: I/MC5/adRJa8THr6LZiYTw==
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="203274644"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 14:09:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 20 Dec 2024 14:08:43 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 20 Dec 2024 14:08:43 -0700
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
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>
Subject: [PATCH v4 05/13] dt-bindings: pinctrl: at91-pio4: add microchip,sama7d65-pinctrl
Date: Fri, 20 Dec 2024 14:07:06 -0700
Message-ID: <6ec5d56d36c64b7a29e043cee0b5a6c035c0d85c.1734723585.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1734723585.git.Ryan.Wanner@microchip.com>
References: <cover.1734723585.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_130914_127979_C057F1BF 
X-CRM114-Status: UNSURE (   8.11  )
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

Add pinctrl bindings for microchip sama7d65 SoC.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
index 774c3c269c40..a7d7d2eaf10f 100644
--- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
@@ -6,6 +6,7 @@ configure it.
 Required properties:
 - compatible:
 	"atmel,sama5d2-pinctrl"
+	"microchip,sama7d65-pinctrl"
 	"microchip,sama7g5-pinctrl"
 - reg: base address and length of the PIO controller.
 - interrupts: interrupt outputs from the controller, one for each bank.
-- 
2.43.0


