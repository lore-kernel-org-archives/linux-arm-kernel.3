Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEDEC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDSOrW7V8GKgVPXa+kHZIe9bhAx7N/mgPiFw5uj/5bQ=; b=g2BFu4XQYlQXn8rqW/8mOE8mwH
	j8Q42vmsutuf48kRH7RR7jBvwqyWUxRY0sMDGM14lz5RIEIM16RkZd1yRWdm56d3aLOT5gQQzX7vE
	2BYCXhgj/GBewEyIVyl1TJeiPiTL2UW7Q7dNAFAWdgKmyHN0513JbnJTM2nTWnvnmYHXjEkHQhXxu
	0Ex+QYGvsjid1rEdks8rZfODxxuRRO+FpG6AExEBauK+VIZbNzKrJ/OkQ38arQdi3uCM4IIRom3wY
	hayrbwHulC5I0OfJ3jfPBdtxnczwdNzT4aizpy/OVqeKvpKOzyZNvTZJrw/+Mk1CbHsa09fSeS9Tr
	A7c1HquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUaa-0000000DuXs-0zm4;
	Wed, 07 May 2025 02:32:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOXn-0000000DJZ8-0key
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1746561935; x=1778097935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v1/WaetPPLIbLAn+oTP+5ur1UuwyBHGcg4dgKfrOu4U=;
  b=uQe3oM5q1jGr2q5f5aHsyW6PDKZcFAmy/LeUMbXgblcZd4QiDZ9NLy8/
   0sA2loFeDuduzxbfHXOnKomdyslGF+IkHo7+XjhgBMFhT2o79uoZEJLca
   60KceOrWbyPaJ9FlXcO4GlCbQ0Gm0l319ydBDpAT7HU0BEBzXRe1MrMq4
   M9wVi88tLOwjOH/QSQf7K30TS4Eg1sO9WlR5sH1v1ZsAXQBVdoYexaNLX
   Ll/TmGGvuaoXTGQvqlxrCLsNxyA8EX+/a/sRp+Ue6Z370R+YGJiE30PZY
   pziOd1Fmkl3PRjTxVIsB2eJ0Uz4nHRHQpmOozELzaYITXMk7LXXcBlkMX
   g==;
X-CSE-ConnectionGUID: dUBqohHAQlqcpEGq8j09lg==
X-CSE-MsgGUID: YIJGv1ATSQ2Tmu2fBmv5Ig==
X-IronPort-AV: E=Sophos;i="6.15,267,1739862000"; 
   d="scan'208";a="208799759"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 May 2025 13:05:32 -0700
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
Subject: [PATCH v3 1/4] clk: at91: sckc: Fix parent_data struct for slow osc
Date: Tue, 6 May 2025 13:04:56 -0700
Message-ID: <b17dc7f0d4ed0a507ac8d0d8e7e27430a73b97a1.1746561722.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746561722.git.Ryan.Wanner@microchip.com>
References: <cover.1746561722.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_130535_307341_F13B8760 
X-CRM114-Status: GOOD (  14.29  )
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
index 021d1b412af4..952a805b6f7e 100644
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


