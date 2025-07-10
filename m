Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DD3C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NpMtFKyiobBsJdvh+SkN2GF2qSy/IsOTGQWhAtI5RE=; b=xt1/07R4YVEvuo3S9nRF0dxCBs
	HHVpifsSGuwaoYBMxh7aGjwgymJAReOPHLndQAoAd9bfFrbzrREmcVwuXiCcN5h5AZBWb2FLFozWL
	IrqPL+i35ZGGo+vppyM8RNXYObSQrTL5l3pbPZOs7ezrvPfmbsQE+PIKSgIkRGc/5hR8806N+5+t/
	otsktC04O/F+sC1GraIYyTr6w9RyJP1CzlBUjGrRZucdN1WUgjjpy5UOuD24Ni1uUz7zp7NubjPyz
	8lO9GvtnvfKii8VW1T+insa57jH9Im9gW+JabS5NvyabKlQVh9P1KgSdC3pd794buDRmj8nEJTS0E
	gIEzndjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzzv-0000000DBbI-17Rj;
	Thu, 10 Jul 2025 22:44:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYZ-0000000Ct04-1Enq
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 20:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0NpMtFKyiobBsJdvh+SkN2GF2qSy/IsOTGQWhAtI5RE=; b=TWz6rSD6IL93L571J7CCulyhXd
	cvaOqHBGnWtHmtm9t6TT1o9Q6jyy8IxpJbZpSbiZDIilcE29W1SqWBhmdNLlEC6P/GfuIHJ7EbJ42
	6bMC1lhcu2kvBwe9bMCi+kox1iWm2hzPYIt2iJTu7fYcXnVLpp0Ih2K90nd0A5ZSqf/1on1F+37je
	FvvTukeu3ucKFsH8SpjHde4QH7b+RPx0uwkDX1z0ifdxxPr1K3c/nuI/+4lIyn4nx8P3CpfBxAU9a
	hxETgtHXSaPpBxvYCl59CBX4hMcrgDwaliavCGPpyGS8bnjWoq7bnw6lTBjahifC8W9hIuz2VSvR/
	B1W9PBYw==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYV-000000098mU-2gZI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752178064; x=1783714064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oKAR3NS0HjQgRq/Kuii8R5KT6JT9p0LPD92K1751Fik=;
  b=pE/IN4fmP4H4XwJM27494ZF6dcyEy7cYOyI/AsVlkO3fQ2BjX9yJZ4cA
   L7R3o6S2V9o81YckfeVriOryL0S47y/ocvaXk3SemM8LJKgMWm4G1GOUx
   x3Mgwdd4idY6DkZBrgESruaovtVCrMjtQxUOXJrYMSP1O1ai1aE3mlWU5
   pFSzRzrWItw+ID2F+LyaBno+WHq8Q9luweVtx2NS+h6Kn5dbpr5YvvNK4
   4Qc7qO2MbOmyXFDdSgNrfOneg8hPiDHKLgTqGn3gb/GONI+Nyhe3Tc1J6
   HVXOS8G1cfqc1Agu1GRvXsj/AMYRqzfpDiIMPKnMToGGJnMeCExkMELa7
   A==;
X-CSE-ConnectionGUID: qOQSLemoQZOGUxBCHa7nXg==
X-CSE-MsgGUID: vxnueUJPRy2Fdmu5gqCu9Q==
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="275215671"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2025 13:07:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Jul 2025 13:07:32 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 10 Jul 2025 13:07:32 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <varshini.rajendran@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 13/32] clk: at91: sama7d65: switch to parent_hw and parent_data
Date: Thu, 10 Jul 2025 13:07:06 -0700
Message-ID: <676e618850df0db8dd880c36cd9b6dcef7b17b8b.1752176711.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210744_379543_8606522C 
X-CRM114-Status: GOOD (  14.82  )
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

Switch the system clocks to use parent_hw and parent_data. Having this
allows the driver to conform to the new clk-system API.

The parent registration is after the USBCK registration due to one of
the system clocks being dependent on USBCK.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sama7d65.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index f10faabc7ffe..1553dc3152a4 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -533,23 +533,23 @@ static struct {
 /*
  * System clock description
  * @n:	clock name
- * @p:	clock parent name
+ * @p:	clock parent hw
  * @id: clock id
  */
-static const struct {
+static struct {
 	const char *n;
-	const char *p;
+	struct clk_hw *parent_hw;
 	u8 id;
 } sama7d65_systemck[] = {
-	{ .n = "uhpck",		.p = "usbck", .id = 6 },
-	{ .n = "pck0",		.p = "prog0", .id = 8, },
-	{ .n = "pck1",		.p = "prog1", .id = 9, },
-	{ .n = "pck2",		.p = "prog2", .id = 10, },
-	{ .n = "pck3",		.p = "prog3", .id = 11, },
-	{ .n = "pck4",		.p = "prog4", .id = 12, },
-	{ .n = "pck5",		.p = "prog5", .id = 13, },
-	{ .n = "pck6",		.p = "prog6", .id = 14, },
-	{ .n = "pck7",		.p = "prog7", .id = 15, },
+	{ .n = "uhpck",		.id = 6 },
+	{ .n = "pck0",		.id = 8, },
+	{ .n = "pck1",		.id = 9, },
+	{ .n = "pck2",		.id = 10, },
+	{ .n = "pck3",		.id = 11, },
+	{ .n = "pck4",		.id = 12, },
+	{ .n = "pck5",		.id = 13, },
+	{ .n = "pck6",		.id = 14, },
+	{ .n = "pck7",		.id = 15, },
 };
 
 /* Mux table for programmable clocks. */
@@ -1283,10 +1283,19 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 		sama7d65_pmc->pchws[i] = hw;
 	}
-
+	/* Set systemck parent hws. */
+	sama7d65_systemck[0].parent_hw = usbck_hw;
+	sama7d65_systemck[1].parent_hw = sama7d65_pmc->pchws[0];
+	sama7d65_systemck[2].parent_hw = sama7d65_pmc->pchws[1];
+	sama7d65_systemck[3].parent_hw = sama7d65_pmc->pchws[2];
+	sama7d65_systemck[4].parent_hw = sama7d65_pmc->pchws[3];
+	sama7d65_systemck[5].parent_hw = sama7d65_pmc->pchws[4];
+	sama7d65_systemck[6].parent_hw = sama7d65_pmc->pchws[5];
+	sama7d65_systemck[7].parent_hw = sama7d65_pmc->pchws[6];
+	sama7d65_systemck[8].parent_hw = sama7d65_pmc->pchws[7];
 	for (i = 0; i < ARRAY_SIZE(sama7d65_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sama7d65_systemck[i].n,
-					      sama7d65_systemck[i].p, NULL,
+					      NULL, &AT91_CLK_PD_HW(sama7d65_systemck[i].parent_hw),
 					      sama7d65_systemck[i].id, 0);
 		if (IS_ERR(hw))
 			goto err_free;
-- 
2.43.0


