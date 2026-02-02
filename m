Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0ADE73157
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pgUxwxBgsQi5DvcnLaMcyEKfUjTnb+XOxZHHgU/qFg=; b=jnmVaQBMDmy/vZPSH+lONYohQR
	6BJ0UdKlwCk1wHvxGMuFAE8qzzFQR9xQEG5xmeiO/jRHyuRah/YCSv6hynA1yvIw3o9jTWDgYFd04
	tF8tG6aXkILCpURmsyA/J9gRXIfq8miIDnBtNctq7wsGGOjsqRr69CpX+xIKfMyNtD4vsKTOTl5WY
	9xYtkffgzC0tV7E4MenvqZJf3QUSbsEGElkFusIxGfrrGNSsW9CK+RxOshgjyRTQdsknK5hNFQOm+
	sU3WTB3NupNTVMTw/b+3hsCCU4q47KabzwJJDSXFOqSNTN3+udtpJntQ0Z5g99cWLB1L5LVk1kYAq
	/kezzeKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrMt-00000004q6Z-3R32;
	Mon, 02 Feb 2026 10:41:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrMq-00000004q5K-2nMb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 10:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770028876; x=1801564876;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CQDItOjg4vFi2oY4AFpL1SrpyEnw1EaJxRuwwh3G9ls=;
  b=fbN3HKH4HaRy2tRhv9gehTK9dd0bOow2H5R2v+C1I0iHD649bMfOtZ5m
   Xnc7oHFw8S2XmoKbIVrniyUJmi/Zm+yaNHUgXERcKWWd72YOq/gcI1yX6
   VwJyhbBe8M6+Q62Hqy0VkQuaeMhmfbIghWvIsXfSgw4rlzYBNRcaxT5m+
   BTpJNFDwrEvpHjI5aOdCMzw8YzFsYs8Aau3BsWNTm6orY7wYSBrzSQZQJ
   XDpKqMbJZgBledNGcsh7+iZcw0Ac3sOURIcik8WWcOTiI23YhwDQn759g
   U9ho5M4G7PiHT2o39IIi12C4QJyYEgm+ew8qeFCrapZSVbwsBi5QFsT/+
   Q==;
X-CSE-ConnectionGUID: 4Ir6ehGOSMSwNcM0kpvUsg==
X-CSE-MsgGUID: PjNnYzkfTRWbnRr57rBzvw==
X-IronPort-AV: E=Sophos;i="6.21,268,1763449200"; 
   d="scan'208";a="59959599"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Feb 2026 03:41:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 2 Feb 2026 03:40:49 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Feb 2026 03:40:45 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 3/5] clk: at91: sam9x7: Add gmac generic clock entry with ID 24
Date: Mon, 2 Feb 2026 12:40:23 +0200
Message-ID: <20260202104025.3781-4-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202104025.3781-1-mihai.sain@microchip.com>
References: <20260202104025.3781-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_024116_709017_6D0B2F6F 
X-CRM114-Status: UNSURE (   9.57  )
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

According with datasheet table 12.1 the instance ID 24 is used
for gmac generic clock.
This change adds the gmac_gclk entry in SAM9X7 clock description
table.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 68e569bd70f5..8b52da194849 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -568,6 +568,15 @@ static const struct {
 		.pp_chg_id = INT_MIN,
 	},
 
+	{
+		.n = "gmac_gclk",
+		.id = 24,
+		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp_mux_table = { 6, 8, },
+		.pp_count = 2,
+		.pp_chg_id = INT_MIN,
+	},
+
 	{
 		.n = "lcd_gclk",
 		.id = 25,
-- 
2.52.0


