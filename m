Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAADC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNi9guqKpCNGm6mVPVHRCWSS+K/Uzt4UvpYBGvoxqcU=; b=B5aKP1eAYX/0pRHTky4rkXJ3ZM
	Aq3dqefm/Icknv23GAag3MHeZU1uIoie7q+O3pUVAvjR3oa2iTCaLC26XgzrGlcLXg4ukDYoDV7Oc
	kZ0W3cmVAsnoL8KIyo9eyEufc2h0+eQfgAFLJlxIhZPdRS0WcDFSep1jt375wmDQ6sfdkLjdIKRzE
	zskRkCJ3NsT6RkWMUTwXu77zm3P/dzYl0zj6ZXw5htLYVDsj8e2h0mUyLysmL3vcc8bb63sqR7/2Y
	Zk9aQnrssSyQcCHJ6/akHs5F4H3HM6snNvMdylG9Mc4U9B3gR7qv056d96XFV/n2gs0jNwOeksdb6
	APCcWDVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg77u-00000007IB4-1Rc0;
	Thu, 06 Feb 2025 19:01:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6Ps-000000078OM-26oh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 18:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738865756; x=1770401756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yCFJftUv86WtkE4uyLlKLyOkOvHlcj4KPW0x3S20NJM=;
  b=jMBt1G64jA7mkQXoGDeXwoPhBOQL+b6K04m2mvskL2soGvtRva76c92q
   ZuNNmRyq6Cs/bUFosq1m8taSn+MKsRvZpscQXXRj+3jDvPAx3HAEyr3pi
   H7YghSmcEtTMydF9a8pdY+zadlbkHl7/+GM1KjOtx+M7C9cwTcW72MG7H
   w7QsoCpagUFIvEnnLhf0Re0LjMOCbFIZlrdinoDwHXoSt8hUwl/+CcTUc
   ajg8hGklUIl4a4J6V/z/J8tryR+4m7PKOM7CvJU61WTzgpr8GYorHKFi3
   /ZsBGofIH5DD1Jvqa0ssPKJrPfI3sHrwHj7w0gBdPwi0+HKdWitD87N/P
   Q==;
X-CSE-ConnectionGUID: RUzZ0s40Rb2+hOFS2V1Qww==
X-CSE-MsgGUID: DJEdfPs8T2CjM4g4xhJSWw==
X-IronPort-AV: E=Sophos;i="6.13,264,1732604400"; 
   d="scan'208";a="36973013"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Feb 2025 11:15:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 6 Feb 2025 11:15:32 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 6 Feb 2025 11:15:32 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <mripard@kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH 1/2] clk: at91: sckc: Fix parent_data struct for slow osc
Date: Thu, 6 Feb 2025 11:14:42 -0700
Message-ID: <309b2a3db855c2cfb89193d3e07ea6f692df29ea.1738864727.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738864727.git.Ryan.Wanner@microchip.com>
References: <cover.1738864727.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_101556_611725_1F9FE051 
X-CRM114-Status: GOOD (  13.55  )
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

The slow xtal is not described correctly as a parent, the driver looks for a
"slow_xtal" string which is incorrect and will not work with the new
formating of xtals.

To avoid this and keep this driver backwards compatible the
parent_data.fw_name is replaced with parent_data.name and the original
parent_data.name is replaced with parent_data.index. Using the index is
safe due to the driver requiring only 1 xtal.

Fixes: 8aa1db9ccee0e ("clk: at91: sckc: switch to parent_data/parent_hw")

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sckc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
index 021d1b412af4c..952a805b6f7e1 100644
--- a/drivers/clk/at91/sckc.c
+++ b/drivers/clk/at91/sckc.c
@@ -374,7 +374,7 @@ static void __init at91sam9x5_sckc_register(struct device_node *np,
 	const char *xtal_name;
 	struct clk_hw *slow_rc, *slow_osc, *slowck;
 	static struct clk_parent_data parent_data = {
-		.name = "slow_xtal",
+		.index = 0,
 	};
 	const struct clk_hw *parent_hws[2];
 	bool bypass;
@@ -407,7 +407,7 @@ static void __init at91sam9x5_sckc_register(struct device_node *np,
 	if (!xtal_name)
 		goto unregister_slow_rc;
 
-	parent_data.fw_name = xtal_name;
+	parent_data.name = xtal_name;
 
 	slow_osc = at91_clk_register_slow_osc(regbase, "slow_osc",
 					      &parent_data, 1200000, bypass, bits);
@@ -476,7 +476,7 @@ static void __init of_sam9x60_sckc_setup(struct device_node *np)
 	const char *xtal_name;
 	const struct clk_hw *parent_hws[2];
 	static struct clk_parent_data parent_data = {
-		.name = "slow_xtal",
+		.index = 0,
 	};
 	bool bypass;
 	int ret;
@@ -494,7 +494,7 @@ static void __init of_sam9x60_sckc_setup(struct device_node *np)
 	if (!xtal_name)
 		goto unregister_slow_rc;
 
-	parent_data.fw_name = xtal_name;
+	parent_data.name = xtal_name;
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 	slow_osc = at91_clk_register_slow_osc(regbase, "slow_osc",
 					      &parent_data, 5000000, bypass,
@@ -592,7 +592,7 @@ static void __init of_sama5d4_sckc_setup(struct device_node *np)
 	const char *xtal_name;
 	const struct clk_hw *parent_hws[2];
 	static struct clk_parent_data parent_data = {
-		.name = "slow_xtal",
+		.index = 0,
 	};
 	int ret;
 
@@ -609,7 +609,7 @@ static void __init of_sama5d4_sckc_setup(struct device_node *np)
 	xtal_name = of_clk_get_parent_name(np, 0);
 	if (!xtal_name)
 		goto unregister_slow_rc;
-	parent_data.fw_name = xtal_name;
+	parent_data.name = xtal_name;
 
 	osc = kzalloc(sizeof(*osc), GFP_KERNEL);
 	if (!osc)
-- 
2.43.0


