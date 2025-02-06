Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E360C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Jg/WBI1cc2At4P8GLijtS5wDaJhYzptJkqAgdZlW20=; b=Qx6sbFUPU6Wvj7BbsPga9688jn
	lN1732xbi0AmtkN5v+4YQh9pnX+dBS89f+wpqQvxRknoeU8wofp6gssERSzJ3yz8AO1CpEb35ptNF
	wgUk8/vpXFll4Xk24wW3p+9z2Mc22DFv3IR8UlzR4Samsow+5u4eoI3W9wHjEjyeJrs/per6UeJzL
	ivodwFyWlDC64rAR8th5e5AINsqbY/KxjbNZV7XrdHKhlJAmtDTOUFwcKVSbnjRGGbfLrTmgJU0qA
	xcMKTYinrFAveJVXjKBi/nrtbNp5bCheFCk50h8KRhqEEOiVR1cp7X4u50fL4AiI9twOUbRnCcu0q
	/IwAo3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg77v-00000007ICX-0cyz;
	Thu, 06 Feb 2025 19:01:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6Ps-000000078PS-3F6P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 18:15:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738865756; x=1770401756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jos/hi+/8kc69r3zVe5hi6bwnwOoBz55vx9UJaURjZI=;
  b=Mf6kb7lmnDC/D3pnkpf/JgZDTBfHmaHdxKHoRLjw/vx2WvWedT6vEsML
   d8D2iSmRcyFOC3EEqB5qPAs9mEboLLDU4o4rsPEROgEMUZmJ+fDX2UshU
   J34ph+nq7N35ZXgqD9hjM+yNEv+Z0BhgOUWsMMFJvIQGcI9HEAxgBqDHr
   qJ479GdEEw0Kzv5AsJqr4uxT4ZPBlqXwWVVFSeV7LFTabwMp96bUasY5a
   C8k6mi4iSXgngWjNFK9ZBdSumk/R7KCgINTyDS44jzGLfHDQDjPupEGYy
   zuvkXc3hOF+Uq37Mc84guE04wL3JK1neU2FNcq9B/3Gn8ZmB2JfaDXDYA
   w==;
X-CSE-ConnectionGUID: RUzZ0s40Rb2+hOFS2V1Qww==
X-CSE-MsgGUID: tdrkNp/4Rsed0wn4y4s5rQ==
X-IronPort-AV: E=Sophos;i="6.13,264,1732604400"; 
   d="scan'208";a="36973015"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Feb 2025 11:15:53 -0700
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
Subject: [PATCH 2/2] clk: at91: sama7d65: Add missing clk_hw to parent_data
Date: Thu, 6 Feb 2025 11:14:43 -0700
Message-ID: <a64f5fd10b1af61dbf01d2f2839af532e25547c4.1738864727.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738864727.git.Ryan.Wanner@microchip.com>
References: <cover.1738864727.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_101556_885282_DA15BEA0 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

The main_xtal clk_hw struct is not passed into parent_data.hw causing an
issue with main_osc parent. Passing the main_xtal struct into the
parent_data struct will ensure the correct parent structure.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sama7d65.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index a5d40df8b2f27..08306261c9c7e 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1138,6 +1138,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	parent_data.name = main_xtal_name;
 	parent_data.fw_name = main_xtal_name;
+	parent_data.hw = main_xtal_hw;
 	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
 						 &parent_data, bypass);
 	if (IS_ERR(main_osc_hw))
-- 
2.43.0


