Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33792EA4E07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 14:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTNZh4pLSlUShaRuE/hQso3278vbA5BSN0ZOowzrEzQ=; b=rIZLifL6Z+NQ5upkhfxFQdcyOw
	y+cJQaXBhsmmLx1gr6wnzYdg3Vps+sgH47a0H93ZvV/JXEVFbUDof3p2k6ZlmGZZc+6OyUv99iPcF
	Axz7WNkrUAu4pjm+XeSgcgyWbvyl1wWTyhCdp86iUvZz2g4UZDeQwwiycqanjZLIZI/FfeQgRS3bO
	4cBWS1SoQxo9SakLpy7d5IY9Ss+dBLmCg4mZO8zYUUwwELe8fe/9PYskVXP/qfwu14Gli85FW0kt+
	PtR4/4niVm7s8aPfh9RQ93wCQhPGlgst8IqIeGpcpZgeRs2fh9txaE2s14MljUrIg6+kcKw/0zi8B
	n7dvrTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx48r-0000000DDg3-0Ej6;
	Mon, 02 Mar 2026 14:21:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx48o-0000000DDes-2zia
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 14:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772461258; x=1803997258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PUMHJIQe9paGHdzwol89drFjlfxsC2i93u8l7eBbM/Y=;
  b=NVLD/dhHAydkDp73jXdKQF5+q6RmO/EHgSi7xQ1aqLuYDfGXm3Xrgu9B
   CtsZzy6JHO4FnijzUUC9gGcWha8yQOvK3or/hGRMlOcZHySG4w/NoNwPg
   0NW/QULGftJI9bXA+AdhNMfwo8K3+1WLqHSO9pFS9IVPqzy9PjwmxoLrW
   M+JvmpJ/9mysquHSUC10MVI0FvSk5gmJx4z/ZMRQk9h9ykeUc9N+NGYkE
   H1DCBUvJODUNHbvs0Ll9iqf8i44IqKvdXcSR/IvyGjXE+ZQ4EqM4J6YoV
   JrsJPjnP0RWZXZLfYwlJAKf3HfsGg81GYPR8JGVWkjk0bIIjPLHR1dut9
   A==;
X-CSE-ConnectionGUID: QKICduWAQ5ynFNkWd4cNxQ==
X-CSE-MsgGUID: BrJgKe7ETDSZMJOlv2niyQ==
X-IronPort-AV: E=Sophos;i="6.21,320,1763449200"; 
   d="scan'208";a="221349851"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 07:20:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 2 Mar 2026 07:20:21 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Mar 2026 07:20:17 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v3 1/4] clk: at91: sam9x7: Remove gmac peripheral clock with ID 67
Date: Mon, 2 Mar 2026 16:20:05 +0200
Message-ID: <20260302142008.3253-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302142008.3253-1-mihai.sain@microchip.com>
References: <20260302142008.3253-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_062058_830978_8C2A9FD7 
X-CRM114-Status: GOOD (  10.63  )
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

According with datasheet [1] table 12.1 the instance ID 67 is reserved.
This change drops the gmactsu_clk entry from
the SAM9X7 clock description table.

[1]: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 89868a0aeaba..66aadebc51a4 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -420,7 +420,6 @@ static const struct {
 	{ .n = "lvdsc_clk",	.id = 56, },
 	{ .n = "pit64b1_clk",	.id = 58, },
 	{ .n = "puf_clk",	.id = 59, },
-	{ .n = "gmactsu_clk",	.id = 67, },
 };
 
 /*
-- 
2.53.0


