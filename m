Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D05AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZFs42jR9tmDZ5NckEhodPb2QY/FBR1G1eDNUBF7U+0=; b=zpflu3abuiEwKG2JVTNwNo87Cv
	5FGb4v5sTTgfKp1UZYUcTR3XsuunWrIbmq4uXPcrVjLP2YooF+vrdLiW7VeMplBn1XeL5L86RJaWn
	PBH/tezYXX9JZiHPmCIksGOvphgQyWGtUs/iMgMM7g/BpyfRy+CH3RGdEYq99pOgkKYPSxsMV/Dng
	4qRfs2DZErsiMw8mcm+VLa0gfArWGoUXNMnfB0LP55xp/bmKEY1eSU68jl2uJZG1b4A3cMuQQ9CSZ
	qgbcwCaOGzT/101U/UlSQShXnIjte2d6UBu5w1xNSufM+Nid/qnce8Ij0UgkUSooIxEVsOEUYyDzv
	1aK2mkEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzNw-0000000D7ZZ-1MWB;
	Thu, 10 Jul 2025 22:04:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYe-0000000CsxW-1N32
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752178073; x=1783714073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lA2OIDdTOCkwdk+6eUUqk+oLgsWQashBUKnhjCCsbEc=;
  b=R5ckarJRvd6EBkA1w3TKwv09Zyv1D3mOIS62nM4+2DyG36qU3pMqi6vc
   mx497gZ7sMMBWZAS5gSoydvSU2bWcTGJNo1o5jg7Jui12qVVCjwUtB/I9
   FLpgSdRvakSYVT6co7uEyAOR5y4FkmoLhpDDu9vLscKAq1t/TLktaMYpC
   SywWw1Fsncok/nxgPBH1q3yD5DeJvz08r7h9poscz1BFnUb0zStPGMerI
   y6j4G1zqB9HTGxWMjc3ulR1PkDs75Ija7TLy2vo7oxhcQR5uVeyUkQNCf
   kcXTlIVRI6cfEOCj+96T5SNgGtpAdZl8DwTbdGFl9L8IQ86Nw74PmkbVC
   Q==;
X-CSE-ConnectionGUID: qOQSLemoQZOGUxBCHa7nXg==
X-CSE-MsgGUID: 1J0KURvdTXiUsa0PWS/rbQ==
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="275215690"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2025 13:07:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Jul 2025 13:07:35 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 10 Jul 2025 13:07:35 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <varshini.rajendran@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 32/32] clk: at91: sam9x7: Clean up formatting
Date: Thu, 10 Jul 2025 13:07:25 -0700
Message-ID: <6e904e4dbb0f591e0fd8200e948c3c0d8debec6f.1752176711.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_130752_377451_5F6737F4 
X-CRM114-Status: GOOD (  11.87  )
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

Clean up variable formatting as well as add an extra space to improve
readability.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 56243f6f7e65..ce6ad2a0be98 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -739,16 +739,16 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 {
 	u8 td_slck_index = 0, md_slck_index = 1, main_xtal_index = 2;
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *usbck_hw;
-	struct clk_range range = CLK_RANGE(0, 0);
 	const char *const main_xtal_name = "main_xtal";
 	const char *const td_slck_name = "td_slck";
 	const char *const md_slck_name = "md_slck";
+	struct clk_range range = CLK_RANGE(0, 0);
+	struct clk_parent_data parent_data[9];
 	struct pmc_data *sam9x7_pmc;
 	void **clk_mux_buffer = NULL;
 	int clk_mux_buffer_size = 0;
 	struct clk *main_xtal;
 	struct regmap *regmap;
-	struct clk_parent_data parent_data[9];
 	int i, j;
 
 	main_xtal = of_clk_get(np, main_xtal_index);
@@ -943,6 +943,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 		PMC_INIT_TABLE(mux_table, 4);
 		PMC_FILL_TABLE(&mux_table[4], sam9x7_gck[i].pp_mux_table,
 			       sam9x7_gck[i].pp_count);
+
 		for (j = 0; j < sam9x7_gck[i].pp_count; j++) {
 			u8 pll_id = sam9x7_gck[i].pp[j].pll_id;
 			u8 pll_compid = sam9x7_gck[i].pp[j].pll_compid;
-- 
2.43.0


