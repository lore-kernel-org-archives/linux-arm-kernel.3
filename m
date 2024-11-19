Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D98AD591A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 16:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAbL/HGu+ZaZiFTEcZguzilkQQMIhTB25+mgI8ndpQA=; b=dJLFMSKLr75CV6K9Bk2jGuXC+/
	Z0Y6z6zkMsOgVU5lQLQfef09c8OAT5mHqWJpZUrr2sNNpESljG3JwSo9NPLXqk9gJIl1IhKMtLgOy
	1SeeG+kBCOV+XJY899hut0koFzzo4E1sraxSLlWEjIMMzjY6xeNgAq7hhvdSZQ5SkzxvFb+ifuTpM
	xDihg59rn1hPUwQx2NWh2fMbZiJhenUNFHD3PCbtjejg64KRFQTfxqqn29M9I4EkjA6kT8L6DXJZb
	XSNEsBDXrovTc7Ipgx4dj43vX+3Zp6eA9pMFjCWC9N3WiP9DrZcqNSIeeRmZataTGDCBNjBI6mz+W
	GMY9hgYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRW8-0000000D7Uq-1fmy;
	Tue, 19 Nov 2024 16:55:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRI4-0000000D3hz-2rUH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732034484; x=1763570484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SOPsnkhwPhbTqIhL+AfAja6IVOaQyvZoZM6IJCh1A80=;
  b=lOwx3slrvXJFiU8eSOTSIDZ9x66Yns7tl3GmtKbBADE8qzBFaUQmzgdo
   NGTYodlpSj3c6pnzYsSDCwwJ2+gV5G0ZciFFtVqb8Ch3ED86zk1Zamli9
   fK5a5CZXi4Tn+4/DUEXap8D9OTbkes8SLVPMUpy2pO0XIKujcHO8fYktQ
   nBAnJ//t75u7MD8dzZcwYNdqKmCjUqYH8bNpPK/JBc/YMUuE7Mo7UASdm
   hV4FfKJk7zQjddaw/InrkA0iNrzEykQ9FM47ZfDbU4Yq5xUU8o/ZdM3Xn
   4NwAPabTZltfk+vGKoriMjhvsZVwDfOCFnwWzCp/P13BJitE1PSGRKnvH
   Q==;
X-CSE-ConnectionGUID: RxwVwqVBQ5Gt75b5OWvVzw==
X-CSE-MsgGUID: //v/aCFsThORs0nIaJCQZA==
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="34239910"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2024 09:41:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Nov 2024 09:40:55 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Nov 2024 09:40:55 -0700
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
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH 14/15] clk: at91: clk-sam9x60-pll: increase maximum amount of plls
Date: Tue, 19 Nov 2024 09:40:20 -0700
Message-ID: <ea419d3789c0ef60aa7b24877d905f2e2e6f2078.1732030972.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1732030972.git.Ryan.Wanner@microchip.com>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_084124_801793_2DAB1BD3 
X-CRM114-Status: GOOD (  10.44  )
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

Increase maximum amount of PLLs to 9 to support SAMA7D65 SoC PLL
requirements.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-sam9x60-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
index fda041102224..cefd9948e103 100644
--- a/drivers/clk/at91/clk-sam9x60-pll.c
+++ b/drivers/clk/at91/clk-sam9x60-pll.c
@@ -23,7 +23,7 @@
 #define UPLL_DIV		2
 #define PLL_MUL_MAX		(FIELD_GET(PMC_PLL_CTRL1_MUL_MSK, UINT_MAX) + 1)
 
-#define PLL_MAX_ID		7
+#define PLL_MAX_ID		9
 
 struct sam9x60_pll_core {
 	struct regmap *regmap;
-- 
2.43.0


