Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5BEC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ej3XHRjDRdlfuDGOYkRGtCsnz/ttL2wA/8xtGcKwaR4=; b=UFNuDGhGUzZSbMXwHRyTDltrtP
	N2rkGUXT9Tstz/ivnpFbL5XeI5UZaz7W/w5DNMCF8B9DOqf46j6e5Sphrkp9ehb0SBn71ZoPiXH4S
	lboHPyqSyJrHx2lwY1c1RcANZJTuEC07kSts71o0Nm9QKO3gHC1rMhQ6Zys+CTY3ZAAlr2mPFh7fT
	F0FZJ1z345ep0YnS8S8RI02dMKfrtMOW+EYSjnhvwobpillv57GltJL7fLQcQUoNPxxlAqnQgYga/
	Iyb4O9buy6JMVbSgisXhLHRw1l/sGXahVf0xRiIze8OsaUGBpeTw1uFYxcffulcP0TfLCwWUn5yMc
	+1vpsG+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUaa-0000000DuYg-3Qno;
	Wed, 07 May 2025 02:32:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOXq-0000000DJZ8-0ss4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1746561938; x=1778097938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l4uopfDlFyYIJ4HY7uFezuxz3KQK1Nqe2RPTYmE3TCA=;
  b=AsfrEA3q01E74dYY20cW35d5Edn//f25n+qTnPyO7/gAkF1yBHOGX3Ev
   e1jV0qJ1+YJARxkQ4QiEYyxI3wqWOWVJwbTtd20QQsvIf7+tggmHyXrs3
   UlC0x/BHGRK89HG0Nvnh5yMekIf42JtDR6y7nb90Gly0YtyjvndSr/05t
   WcfkG4Txzu8y+kWn/3UBd2BJYXsSB1bUy6b2feJhrU1GWNZ/hc0fMq7OC
   Ok7gJWPviUa8O5rpfVGlP/GNyfBz6jZapXZAeujUT0fRrwq0VPZO5GUCS
   JTCo5ivZN5+HODXDm/QygRwyR80EsJgsAsWDJ69VTlx276ohJgn5Y5EjR
   Q==;
X-CSE-ConnectionGUID: dUBqohHAQlqcpEGq8j09lg==
X-CSE-MsgGUID: 9bbqWeX+Sq60Xhm0RAG6sQ==
X-IronPort-AV: E=Sophos;i="6.15,267,1739862000"; 
   d="scan'208";a="208799762"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 May 2025 13:05:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 6 May 2025 13:05:12 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 6 May 2025 13:05:12 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH v3 2/4] clk: at91: sama7d65: Add missing clk_hw to parent_data
Date: Tue, 6 May 2025 13:04:57 -0700
Message-ID: <41611e4b1eb2abd867523f707791292c6cdbc8b5.1746561722.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746561722.git.Ryan.Wanner@microchip.com>
References: <cover.1746561722.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_130538_313437_B25A1BFD 
X-CRM114-Status: GOOD (  11.20  )
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

The main_xtal clk_hw struct is not passed into parent_data.hw causing
the main_osc to not have a parent causing a corrupted clock tree.
Passing the main_xtal struct into the parent_data struct will
ensure the correct parent structure for main_osc and a correct clock
tree.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sama7d65.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index a5d40df8b2f2..1e9d3c393883 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1100,7 +1100,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	struct regmap *regmap;
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
 	struct clk_hw *td_slck_hw, *md_slck_hw;
-	static struct clk_parent_data parent_data;
+	static struct clk_parent_data parent_data = {0};
 	struct clk_hw *parent_hws[10];
 	bool bypass;
 	int i, j;
@@ -1138,6 +1138,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	parent_data.name = main_xtal_name;
 	parent_data.fw_name = main_xtal_name;
+	parent_data.hw = main_xtal_hw;
 	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
 						 &parent_data, bypass);
 	if (IS_ERR(main_osc_hw))
-- 
2.43.0


