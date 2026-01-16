Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20726C98303
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbW5uM+17bDtT6E9hdUCGjQ7Bm+bJKGKOIQlvr6JgfA=; b=K42dgQpmZsM9kbYRsV8lrtwDMP
	vNJhy6kWsMbLh7yt/gQNnJr5Qaf3zf8/BK0LNYLsiEMWxbBevZX421cVgCnqI02ddxWGbK4TvecqV
	0ZduzGNVKmR/3CmvRaw0lsHY36CYuVpymwQ8ZkFTIjs+xzPo9XQjg41SXw/UgEbDKqQDY9v88k7Io
	SfbAysr/iksv84ynG5zkeEcNfeUIfXi0WnsKL7ENZrYLBRygklXDQuLb9KIR5wgya73LU/y29tzOJ
	ZCwssaKGZN9eRmT9YfOpRu4g1YW3Hjvlm7gFDtfHQcUV0oU5qBEGrDRJ9m9IoZLycMiSWrbEIbeBI
	1aUPu4ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6V-0000000Ek3m-3VV5;
	Fri, 16 Jan 2026 20:07:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6J-0000000EjtY-1vOs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:07:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594040; x=1800130040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=neIWWmyypnNHqZZGX8lfunmzpOCJxCwV8FKTDxUQwLE=;
  b=Q7H9N/7CZzlz+bmqiXmSwTIIpgFUvfLA0tM7vAsr6+sbatEQK0Bsi0Nv
   UtfdIM+pcz9/xzcrgKCtRXQqGMwAUwWD34oFaZZYba7o0xwDvgKAAselc
   EjzOuJPRFoRjvWs9Ky8wnpJfN7XSRhFmSWDGbCn+NDBqiEhz01UnycCbO
   FhLRV8z9KEtnWEeCFiTpFPUlnBYHTF9AK2pJNlm+01JrY/qZ8P8hO7HKg
   rX9FxzyVy7/K/CYISz7YXVapxpONxPfVheOnOGMLe4OnyMRPDE3tTGOyp
   6dcafAqhi0CfPP7Juh8Rdv5g33FqGtDoFGgB9gBnWgWlPhAPnrJSeZM4F
   g==;
X-CSE-ConnectionGUID: +9RSiAtvRY+RhxWEUm06Wg==
X-CSE-MsgGUID: PhczZzwKQji/3pi6D4ywRQ==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="283397053"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:07:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 16 Jan 2026 13:07:05 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Jan 2026 13:07:05 -0700
From: <ryan.wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <bmasney@redhat.com>,
	<alexander.sverdlin@gmail.com>, <varshini.rajendran@microchip.com>
CC: <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v5 13/31] clk: at91: sama7d65: switch system clocks to parent_hw and parent_data
Date: Fri, 16 Jan 2026 13:07:06 -0700
Message-ID: <96e09d47cbff0fb4593d642a1151791e20c15c48.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768512290.git.ryan.wanner@microchip.com>
References: <cover.1768512290.git.ryan.wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_120719_507954_0244A2D9 
X-CRM114-Status: GOOD (  14.68  )
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
 drivers/clk/at91/sama7d65.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 8aea926094d8..0c9d43fa01c1 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -537,23 +537,23 @@ static struct {
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
@@ -1298,9 +1298,19 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 		sama7d65_pmc->pchws[i] = hw;
 	}
 
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


