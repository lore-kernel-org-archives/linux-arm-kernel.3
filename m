Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9267D4922B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 16:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7Wz6155pX9obzYYbqQ39DHUzBuzumsIW+j+4lZ5PhE=; b=0AMdHDu86psbJWov2DmSYwqrlW
	qITPOKQzAHlQ5LaAmHxYwpRxtAhcfuzMi+JCR4WnqaGuJ8/p8/yInR3LiE798t/EuHJGyHMC7EV3O
	XejfMv+VAzyLmKn6CNpCxbsLsg7fJh6JXqdzkHVelZWzo1nLVCBPLSWRRMRZDlKXblLT6xKvn/03r
	Vjja0Act+NZhL5kodnGCosJ0lCLzgQiZ5Vkwbq6b/CqNNldIE8zyqT52K9WxniEw/08LUEPHZz1GI
	SGHqzWaxTY4HZjNSvLFSQofoaFAw/rAugeWzfRf2b49Yf6KOAsrqfmnGVi9Ku8tYYanHeCc8uS+lX
	9n4rLfew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRN4-0000000D5Kj-0ZRR;
	Tue, 19 Nov 2024 16:46:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRHw-0000000D3d4-0SrO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732034476; x=1763570476;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SAuIplroIWD2PxE7sb322n1NfqayPgq+kic4JfJz/2U=;
  b=Bv3XEvRAcrF9g+wjDe7cW4rnYE8W/tw6LEUt5D4wXbLTspReA2CTmJRG
   ztO7yHyU7qXLoIYUn2pdNvsGDFUrM9JzuyatAojDtxahAHumB+3iJHGg/
   6dyN+bIHl7f9667bxjersCAl7JJa3IuXNCTedulYJ8+x/TqEseixi6N8/
   xf8CXKLPBbskC5ptXEAV5eEwdIvEn1Dut2jr13aryE2/ygH4+dAzyperj
   PcttGv91s0GQwFyWALMyxt7KUMWlf5EOc/FQFrKqkiid6kLfYyzWpz7DY
   dYVIDPbLeSR/4o5T4L1iVZtTEXInNGo2TGOF0rqAWj0xHs4qkc0mHgRc4
   Q==;
X-CSE-ConnectionGUID: jnnvkeRdTYaD0RwnHEXOug==
X-CSE-MsgGUID: dmEQsYWySM2TXQP4jl2lDA==
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="35018891"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2024 09:41:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Nov 2024 09:40:53 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Nov 2024 09:40:53 -0700
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
Subject: [PATCH 04/15] dt-bindings: mmc: atmel,sama5d2-sdhci: add microchip,sama7d65-sdhci
Date: Tue, 19 Nov 2024 09:40:10 -0700
Message-ID: <e9e9e4cf0753422706bdc44fe7d20ca3a686ce7a.1732030972.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1732030972.git.Ryan.Wanner@microchip.com>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_084116_226887_8ACA6FF0 
X-CRM114-Status: UNSURE (   8.00  )
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

Add mmc binding documentation for SAMA7D65.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml b/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
index 8c8ade88e8fe..ba75623b7778 100644
--- a/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
@@ -22,6 +22,7 @@ properties:
       - items:
           - enum:
               - microchip,sam9x7-sdhci
+              - microchip,sama7d65-sdhci
               - microchip,sama7g5-sdhci
           - const: microchip,sam9x60-sdhci
 
-- 
2.43.0


