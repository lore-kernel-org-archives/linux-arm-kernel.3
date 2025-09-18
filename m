Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0DDCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSdvizKLFpbOWjxPKR2IN4Vyrh4fc1TTjz5xN4bdHvE=; b=sbqA1jU263EcxKMsppDWXuZlKt
	G3QDjZfslqIv7SZHZoWrhT4QesJXlr/Srcy7CGHLHZWwk1CQoUREHtYl2cWW+42CmATuE0YsdE4bP
	ckLemx9uOl73Kk7olBNJeXBrF7cfu1r6/PdomR0ydBn5yKrTjIyswUljX4i0+/aq//F896P3rw4eN
	6JxTf78UwH3qc1QFpq2iWlGVg6eJl2EhMW+TdhQkqepTyjlaOpW4czrOlXlCsC4CLloLxoWn4Rs2N
	4b1s0eqgnjgboqAqs6R0/hRPQrkUrfmA8I36Lj6LLemm/25Hbif4O4bXnYcT2ZYZojJQh6P1MLGHZ
	aiXacYQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzM00-00000001Cs4-1TdK;
	Thu, 18 Sep 2025 21:17:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzS-00000001CHz-2pKp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758230190; x=1789766190;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eiAbsnGms6AR3/Kbu9EsaYVOqnu8+/1DgwnZm9I3Xpk=;
  b=lWdABdimCQuipHUQufCodqRor2+fZ/lkP5djqtfI91bCK4BGsgv7B1fu
   WLnd7NJdySitsE8jUdMdGdujCB9xTpkVOMw0TzJdl57bgBHNbjzDVVjNe
   4wk9vWMDx+WFMEPQzXmQB8KTFRefwwPZo3sCT8y1OkITLTeMeRUHxGIGX
   3TJUGSEIGJSoalPfaDQnGW74hBMUx5jzvmfQzkDYCDWXt2PLy1OKMclxk
   N17mDuzEYIxKoBCQsyUa06BFHUBEuxt17ZHhDQ5zCBhLzdVhMXbGTQuaK
   fBt2o0aU290qb+QR7yrs9XpMFFVqgPfBvIU/gdcykp1yWN9pX46NlAD8z
   Q==;
X-CSE-ConnectionGUID: 1s1RKV33Q2arVnZUGnGVZA==
X-CSE-MsgGUID: ME2EnWGiRN6AnUXUU3fLVg==
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="214079911"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 14:16:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 14:15:50 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 14:15:50 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<nicolas.ferre@microchip.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <varshini.rajendran@microchip.com>
Subject: [PATCH v4 01/31] clk: at91: pmc: add macros for clk_parent_data
Date: Thu, 18 Sep 2025 14:15:43 -0700
Message-ID: <0221c90ab3025c8e72fcdcf54c685da058c0fe4d.1758226719.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758226719.git.Ryan.Wanner@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_141630_810211_0B683A1F 
X-CRM114-Status: GOOD (  10.01  )
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

Add helpers to set parent_data objects in platform specific drivers.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: enclose complex macro with parentheses.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/pmc.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 5daa32c4cf25..4a416d227c50 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -15,6 +15,14 @@
 
 #include <dt-bindings/clock/at91.h>
 
+#define AT91_CLK_PD_NAME(n) ((struct clk_parent_data){ \
+	.hw = NULL, .name = (n), .fw_name = NULL, .index = -1, \
+})
+
+#define AT91_CLK_PD_HW(h) ((struct clk_parent_data){\
+	.hw = (h), .name = NULL, .fw_name = NULL, .index = -1, \
+})
+
 extern spinlock_t pmc_pcr_lock;
 
 struct pmc_data {
-- 
2.43.0


