Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789CBC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 17:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVoLKCKGUvcQCGzonPZYxdyoc3VQjcmqRi5iUcJtRLQ=; b=hU7DOdYdgbmrgpuJ8QXRbCySH5
	o37UvVp6JTsQd6NWbGBR9KN/8hZV2XX6ZgwxY1AAmmSA83UCLDGOZIkpIciF7VtON2sjnso0bKnQ1
	lINVfDNBm9pVcowdjPE84aH8MPmFoUwdl34ZZUzndAQEyWDCnvKNchKq2EQoAjxzbNA3tcZjecvLb
	5ny+blddr/H/RbDOZnrDy7UCH9H5G0uFx9EFEGfGvbGChFsOyqpP6fBSgiK7HeE+aj3fShYZNrcUd
	21OyN7EV1y3/656KZzxTZ7ZxBslpGyE1cY+OA5dcJijX4VFH6qhKFeVbVanH+w4Uc8B5rtxPrOMB0
	ULIT3+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7TB-00000006Nvm-1UNc;
	Tue, 24 Jun 2025 17:30:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5GP-000000062V2-3zeF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777725; x=1782313725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9aK4jdZmF1ToqNiZetoB/6dP7GUhww2O/JrrrKTukA8=;
  b=jY069oltQqnJuyJ1BcZkmaVCxnZYZDjmbiyRbH8pGh2tsMCGRBRWBk7x
   xFqYtT8hu2mbNYUBXnWpwefGS1SxwvrrCsfgbiOfSCxcUAvPPeqFnHpZC
   ca2imwPA8Rqjb5jEntYAvZYLms0gAectvCZffKUZiKGrIH3A7kvEd8liu
   9gQeT7bm4IgzbruRlRnk/yu52P6IzoKviIjXmPtz0E+MrPDIEKeeCGWs7
   6d8ZLTKHXyX4zcuXE6oPYBiU3MumyMyzKCj45POqebdV+jbaPKKv2tNXS
   Z6UTXyQOYMz7pWDrDShViOR2NIkC5SaRokG08aRuWtCD6UJ6I9oO15nRR
   A==;
X-CSE-ConnectionGUID: 4+RzxTN1Qsa6vG3Bpty4nA==
X-CSE-MsgGUID: IpZZg6yqQlO1SSuE50+wlA==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="42688171"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:08:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:36 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:36 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 02/32] clk: at91: pmc: Move macro to header file
Date: Tue, 24 Jun 2025 08:07:59 -0700
Message-ID: <6776f06473d3be71882ef938a4314947f565e26f.1750182562.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750182562.git.Ryan.Wanner@microchip.com>
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_080846_066906_9B280BBE 
X-CRM114-Status: GOOD (  11.54  )
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

Move this macro to the header file as it is used by more than one driver
file.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/pmc.h      | 3 +++
 drivers/clk/at91/sama7d65.c | 3 ---
 drivers/clk/at91/sama7g5.c  | 3 ---
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 0b721a65b77f..63d4c425bed5 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -21,6 +21,9 @@
 
 #define AT91_CLK_PD_HW(h) ((struct clk_parent_data){ .hw = (h) })
 
+/* Used to create an array entry identifying a PLL by its components. */
+#define PLL_IDS_TO_ARR_ENTRY(_id, _comp) { PLL_ID_##_id, PLL_COMPID_##_comp}
+
 extern spinlock_t pmc_pcr_lock;
 
 struct pmc_data {
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index a5d40df8b2f2..b74813a288a8 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -428,9 +428,6 @@ static struct sama7d65_pll {
 	},
 };
 
-/* Used to create an array entry identifying a PLL by its components. */
-#define PLL_IDS_TO_ARR_ENTRY(_id, _comp) { PLL_ID_##_id, PLL_COMPID_##_comp}
-
 /*
  * Master clock (MCK[0..9]) description
  * @n:			clock name
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 8385badc1c70..bf6092fea217 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -341,9 +341,6 @@ static struct sama7g5_pll {
 	},
 };
 
-/* Used to create an array entry identifying a PLL by its components. */
-#define PLL_IDS_TO_ARR_ENTRY(_id, _comp) { PLL_ID_##_id, PLL_COMPID_##_comp}
-
 /*
  * Master clock (MCK[1..4]) description
  * @n:			clock name
-- 
2.43.0


