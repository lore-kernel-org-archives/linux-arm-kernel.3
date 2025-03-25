Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40263C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 15:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOfzc3KPPivH3FlH8bgFxKhn09YoUfqLmILgWKntvvc=; b=RNtWoAVOS+AF4BjgYv4wuKNNQd
	DGp9tIqaspzH4R1HU2fOLVJgZG9Qd0JhHbhN8TcDl+qtbgNjb5oCz50gTY8tI8xJYaIEKgyiViBCT
	T5hmfPXnM8j6phXy1Yu+sTjotFGnXJ3goGuzoKBDlp3Wpwhj4a83eXrCGnWWanHULE2FKH2S+Yuxt
	zg6zD+aTXbu7WwgANSYtJEufiLhFGPNrqsDAAin5OUnBCyrvLmflaI7qWqxL8wMCUJpaqn9G2Si3k
	fw31gE3998DYPEAQZ9G8PaD4Dyrn8pTR0i/5CJJzSRd1z39gygZkBVCE5GhpAo0fjJLlzfgvVxcyx
	6B5153sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6gA-00000006PLW-0xyv;
	Tue, 25 Mar 2025 15:59:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6ci-00000006Ohq-2OBP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 15:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1742918128; x=1774454128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=njhp2XtVb4PhtB0KA2dZs1VqgKACFt3lVxVn3QeR+2o=;
  b=ArmZmscfnfGHsljmjJznQDX0/fAxequ9UTF1VFp0sUnc/xiqtffQjpdc
   tgcOJUUv9GDofN4heQFqWUpIoFtcaXmTIY9y+epCbBddCvRmpL6cnUEjv
   d6g2w75rGa7MTILdxSjyTOZ6Z8idTIttLA7nDnPpH5MAkaNTVPOjobG6i
   i/d7SCEKDSCH86i/jtZVmxapUq4Bdz6tA5xe/qDXqNQ6JZPo8/Q/BxXGc
   GrAZ02lYVUZgXWHveZZV6mOYXCa6yJHK8xPDei0+8IDYeLWaL0S3gF3Tg
   hm3Fs3aGZb/CbBBXXSpTENHZy8fmabsawraVRXR6Kdz1IxWPF8TFmDILj
   Q==;
X-CSE-ConnectionGUID: 5ZRRXf5LQVCIU2dRAgtdWw==
X-CSE-MsgGUID: do4csKX9TtyoN10bzub/Vw==
X-IronPort-AV: E=Sophos;i="6.14,275,1736838000"; 
   d="scan'208";a="40152229"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Mar 2025 08:55:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 08:54:53 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 08:54:53 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>
CC: <sboyd@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 1/4] clk: at91: sckc: Fix parent_data struct for slow osc
Date: Tue, 25 Mar 2025 08:55:07 -0700
Message-ID: <d470bb761530827889beaa2c2815e127fc8b412e.1742916867.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742916867.git.Ryan.Wanner@microchip.com>
References: <cover.1742916867.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_085528_676632_675D1E6E 
X-CRM114-Status: GOOD (  14.56  )
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


