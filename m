Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99774C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 17:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NP2tg5M5BstwrE4rb5+QBH+28CpybiGjlFefOr7WAdI=; b=3B2tMCcR+mg3VcK0oOYpd9B6sz
	7JXnvknv5UFgGC4/s018r8dPpD9InIGIsKJ4XFsJlStFZnAPiQRib+PDW9xYDLGWeJikvfLgNyY4u
	Pv0gPmr50IuFGjoo3cHvtx06ohUzU6cA7v3KkO/yNSI3Y56ylmfOIOwxYTBzuU54Jaj9Lnbi0relV
	lW5HgEmz9dj31wQL3RRHTLEbGvkudez0n7PRFOtLplEgSqSVQVQfzZq8HCdlqxj1J6SCC7n8BIaqs
	p9DGCW0oyJR/Pors+Ppzo0ellPCni8nd7v/GtGmtJ25wLmBOXxDmfvA7VSwPzO7UzWSwcVEDDvOd1
	4r9/4LCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEs7-0000000BfCW-3aR4;
	Thu, 06 Mar 2025 17:19:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDhI-0000000BPf6-0Wg6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 16:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1741277024; x=1772813024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T+l6OVVT45tzMYV8TY6DeZg93MwIQ0gaakx3sxA0rT0=;
  b=jg8n4sXvixhrRjg8gIKNxq8ZUHABYB0PZPaqJgQq/KmFQHCCqJLopTW9
   jBEt6e0oh07cg6ruWz6uuHbyN2coUYQze8Xvgh5wQXhBwVCRn/L5R5o68
   xLk/vxaSnjcmH4er7DgH4ySRGwUqfJcnnbHjiAu6M2kxCh8WQ/ZyPoKej
   vOkXQRZA8xGIUJdjKKdk03e231k9UGaBDfo5dBZz5wtQKNx87zKovY/IG
   Tt28+ahWXay2g/vZvJhqyOVFE4vB1YFM0CcrbCWsKwC7fvehUpBVvl/Z+
   nzdIDn4JYeEB8eAvqLJZnXoUMhUVSxSetRiw2Km8PJcHXvcvMv5Z7iLXY
   Q==;
X-CSE-ConnectionGUID: Mtzc/U5nQtqKRw1uIzvygw==
X-CSE-MsgGUID: q+68X2whTyi3QABO9oC+Fw==
X-IronPort-AV: E=Sophos;i="6.14,226,1736838000"; 
   d="scan'208";a="269901969"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Mar 2025 09:03:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 6 Mar 2025 09:02:57 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 6 Mar 2025 09:02:57 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>
CC: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linus.walleij@linaro.org>, <ryan.wanner@microchip.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>
Subject: [RESEND PATCH v6 1/3] dt-bindings: serial: atmel,at91-usart: add microchip,sama7d65-usart
Date: Thu, 6 Mar 2025 09:03:18 -0700
Message-ID: <07aa3489013b4d4105edb50d99fbee6a70ffca1e.1736522006.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736522006.git.Ryan.Wanner@microchip.com>
References: <cover.1736522006.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_080344_168624_96237B57 
X-CRM114-Status: UNSURE (   7.31  )
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
Message-ID: <20250306160318.vhPzJLjl19Vq9am9RRbuv5ddmQ6GCEND-YNvPKKtAtU@z>

From: Dharma Balasubiramani <dharma.b@microchip.com>

Add SAMA7D65 USART compatible to DT bindings documentation.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
index f466c38518c4..087a8926f8b4 100644
--- a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
+++ b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
@@ -26,6 +26,7 @@ properties:
           - enum:
               - microchip,sam9x60-usart
               - microchip,sam9x7-usart
+              - microchip,sama7d65-usart
           - const: atmel,at91sam9260-usart
       - items:
           - const: microchip,sam9x60-dbgu
-- 
2.43.0


