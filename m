Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E45C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UIGNu3f6Vyqk5hPI7JVYcMMOBwHkl3SRqCUKCqsPTxc=; b=G5b0KaU1i/xS4M
	GP30rYFAFOgZ5Z2tqEdCwo9Edu7Tlo2ixFsQ2gdVkNt/SMOkpMNwDhfaLvZ91x30212EWbRK9CeCG
	QfFLdb3lwM0R15QI0nnOU30BhHis9omjHaHYUxoZAiO74qE8uh6cYWeuCTzTm/RE1rqKjlDzABykZ
	+TOdEg1jVsd8j4KC3gZnzIn71rJzygXlDs4vYK7yCtZuK1hqN9jEI9EedOk/Pb/ggXtQWANCgDDPL
	M7Oc7OVm+xH8TVaXDkBJjJT0SIajhtP8IcNK9HSlYza7pRtb9DQGZdBbZEsEwIKWVjQvnVYoSXWwP
	ZyPz8sH3+CDGSke0sdmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thX4G-00000000c4A-3oy5;
	Mon, 10 Feb 2025 16:55:32 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWug-00000000ZQK-1FbV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:45:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D213148026A;
	Mon, 10 Feb 2025 17:45:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739205936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIGNu3f6Vyqk5hPI7JVYcMMOBwHkl3SRqCUKCqsPTxc=;
	b=jy8TyQcaMaIs3amJmcfBQvMtkXeLEkYb+iVEDCz891gac0gUP0LwaayyaAGFgmN0RmKCQE
	zqlD8enJnFxj5IZ8ZgOyQt9fcZ7DagtMziMGiTih3QzyX/k1Ef95jD/lGzoNudB82dSnag
	NETKvuD06HeeR0+C3RZDpgup/rcH1sRcAMThRgq7hAIJCQ/5GejIvDqeRjWFEbvcqbuGGU
	F4ztBAq9+b5o4O3Q2rkrA2akfl668wHirYaGgMjpZwkL4ah/2eMnXGlj6+9MQQu3uhHO5s
	SISq36BQTK2+t2bqhNolkAPfVtSwDX/Z20QRUvi3pEvjBPHts7mzruFb7JNWaQ==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v2 05/16] clk: at91: Allow enabling main_rc_osc through DT
Date: Mon, 10 Feb 2025 17:44:55 +0100
Message-Id: <20250210164506.495747-6-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210164506.495747-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_084538_495186_74D4C8D0 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ryan Wanner <Ryan.Wanner@microchip.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Varshini Rajendran <varshini.rajendran@microchip.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

SAM9X60 Datasheet (DS60001579G) Section "23.4 Product Dependencies"
says:

    "The OTPC is clocked through the Power Management Controller (PMC).
    The user must power on the main RC oscillator and enable the
    peripheral clock of the OTPC prior to reading or writing the OTP
    memory."

The code for enabling/disabling that clock is already present, it was
just not possible to hook into DT anymore, after at91 clk devicetree
binding rework back in 2018 for kernel v4.19.

Do it for all controllers with an OTPC controller, where the main rc
oscillator is required for proper operation.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - split out dt-bindings changes into separate patch
    - extend to drivers for other SoCs providing the OTPC

 drivers/clk/at91/sam9x60.c  | 1 +
 drivers/clk/at91/sam9x7.c   | 1 +
 drivers/clk/at91/sama7d65.c | 1 +
 drivers/clk/at91/sama7g5.c  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index 11fe2d05fa9bb..58a5b6c4473da 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -225,6 +225,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 					   50000000);
 	if (IS_ERR(hw))
 		goto err_free;
+	sam9x60_pmc->chws[SAM9X60_PMC_MAIN_RC] = hw;
 
 	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
 	if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index c3c12e0523c4b..8a2955d1f67c6 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -758,6 +758,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 					   50000000);
 	if (IS_ERR(hw))
 		goto err_free;
+	sam9x7_pmc->chws[SAM9X7_PMC_MAIN_RC] = hw;
 
 	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
 	if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 024c5abee25ff..eaddb154c4381 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1131,6 +1131,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 						   50000000);
 	if (IS_ERR(main_rc_hw))
 		goto err_free;
+	sama7d65_pmc->chws[SAMA7D65_PMC_MAIN_RC] = hw;
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 7dfeec8f2232b..e6d5739371a76 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -1012,6 +1012,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 						   50000000);
 	if (IS_ERR(main_rc_hw))
 		goto err_free;
+	sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] = hw;
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-- 
2.39.5


