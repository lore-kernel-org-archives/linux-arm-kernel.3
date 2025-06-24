Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEF3C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 18:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58JMKUAiVVEeOMDThWrK1Mrh73mV0rOPif/Q2r53i4Y=; b=vUE2p5DJf0D9rAy9ywaeBGQnO1
	yeAMPmVemjTbxLaSF+VzXlNbwmtsSKBoQuXKa4lEDT3jOKAQeM/acaGfZ3E2GwCBwaE9rv9h8HPYP
	CPatmqhAfGqvBSq8w0TbvXadkTIDARbNA5BU7bw5O2RqqcDuxelLTjt29OgIPQoPnphgCj83QOIQo
	hIZPCMYC3gyi0PeOxt0l7hSZIZAU+6Qiop0fh4Y/7UweRPQInoZjYqDm1lmmPiQ6MFMj7SjzRxuIJ
	TyPZtFLsikOt6igG/CrwN+8IsleftR8Rkn3LPJvdKPI2tNAZ5/u/9zQt3IItbjhMpFrYR1Mt8ovuX
	9BKrFOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7yh-00000006RxN-34EL;
	Tue, 24 Jun 2025 18:02:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5Gv-000000062ei-2Blx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:09:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777757; x=1782313757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lq3ejPHh/1kZivQehV7HtGomJvKoYkbHzTKnAbhG0IQ=;
  b=x1IwGCBS2w17Tst+5GcViTji2thcmFxPY7Nny85pjAtEE3puA+S3ImdI
   qMAPi1BnfumsvCfq70XN9jn7cKnSsdE4sPRa+GqTjRUkcp4NcE3Zrn0ar
   8htLIitWm1CO8Xi2PVKyJ1Dn7V2JTIkpjJHonMvHA+528iL7gP8ohDtp4
   9UI6tqAS48p8J0M+9wCJ+BPAsvDYV/jVMEXueXkyAlWjTg/QcDEn38zt4
   zFHhDQP4w5/MWr0knN1NpJjpAhHRV3ElRoTL9VuLiHvlmlfNFcmhCfcZy
   vAZc5Kk+Dws+dW1Dj0DqtSN2okFp8obenEK04hTtmw6GjgR0hb+s9PYmW
   g==;
X-CSE-ConnectionGUID: ticneE1VRpCt6c5L3blMOw==
X-CSE-MsgGUID: mCaPvkNXRU+OPC+zyXMjlg==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="210641584"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:09:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:38 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:38 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>
Subject: [PATCH v2 17/32] clk: at91: clk-smd: add support for clk_parent_data
Date: Tue, 24 Jun 2025 08:08:14 -0700
Message-ID: <eb2e47406ea37adeb119aa1e3702b1c175c472f5.1750182562.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750182562.git.Ryan.Wanner@microchip.com>
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_080917_623228_583F6316 
X-CRM114-Status: GOOD (  15.04  )
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

From: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Add support for parent_hw in smd clock drivers.
With this parent-child relation is described with pointers rather
than strings making registration a bit faster.

All the SoC based drivers that rely on clk-smd were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Remove SoC specific changes as they are
going to be coalesced into one SoC specific commit.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-smd.c   | 10 +++++++---
 drivers/clk/at91/dt-compat.c |  2 +-
 drivers/clk/at91/pmc.h       |  3 ++-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/at91/clk-smd.c b/drivers/clk/at91/clk-smd.c
index 09c649c8598e..d53dc32b36be 100644
--- a/drivers/clk/at91/clk-smd.c
+++ b/drivers/clk/at91/clk-smd.c
@@ -111,11 +111,12 @@ static const struct clk_ops at91sam9x5_smd_ops = {
 
 struct clk_hw * __init
 at91sam9x5_clk_register_smd(struct regmap *regmap, const char *name,
-			    const char **parent_names, u8 num_parents)
+			    const char **parent_names, struct clk_parent_data *parent_data,
+			    u8 num_parents)
 {
 	struct at91sam9x5_clk_smd *smd;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	smd = kzalloc(sizeof(*smd), GFP_KERNEL);
@@ -124,7 +125,10 @@ at91sam9x5_clk_register_smd(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &at91sam9x5_smd_ops;
-	init.parent_names = parent_names;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = parent_names;
 	init.num_parents = num_parents;
 	init.flags = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE;
 
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 2b1aa834f111..5afd7c9f53fd 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -859,7 +859,7 @@ static void __init of_at91sam9x5_clk_smd_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	hw = at91sam9x5_clk_register_smd(regmap, name, parent_names,
+	hw = at91sam9x5_clk_register_smd(regmap, name, parent_names, NULL,
 					 num_parents);
 	if (IS_ERR(hw))
 		return;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index a380054d580d..e5ab2fb3bc89 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -277,7 +277,8 @@ at91_clk_register_sam9260_slow(struct regmap *regmap,
 
 struct clk_hw * __init
 at91sam9x5_clk_register_smd(struct regmap *regmap, const char *name,
-			    const char **parent_names, u8 num_parents);
+			    const char **parent_names, struct clk_parent_data *parent_data,
+			    u8 num_parents);
 
 struct clk_hw * __init
 at91_clk_register_system(struct regmap *regmap, const char *name,
-- 
2.43.0


