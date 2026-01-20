Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F6BD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 14:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDGqX/KkQRxzOI+l10MofO8gzSL8IjI07TilGIBbVzY=; b=Bcr16s5CqnW52aNRhjJdbwWAt4
	Jnw3HXOtU2562SWCPAs7d6LPgkprLTy0mXGTXt1koRqEK8FbmK53XKloNfxDQ3DqLXXkue3nIuiRY
	BH4zVe2mBVQmBuTh5qEgWYqTZ56uKmVIjvUZdFUe16MqATTLXEFT/X8WBWWi++UCeaGP7KQev9Q4d
	1IowsqGhe8+Rt7GK4yGNAs6rYWqluY+CPGIuhLyjY6lC7kXRiU1/wVCaFSwHsbu1XcOez62eC6iC9
	qCMIOXBBM+rE3CaPRAjDzXEE9oQjt9lpTE4OuvEiyXB/R4EweaNxl2bOMWubB1MWSbpMR7BJVMkMS
	xPcWrFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCsl-00000003zyK-1jHs;
	Tue, 20 Jan 2026 14:38:59 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCsU-00000003zrd-45qR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 14:38:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01336148AD47;
	Tue, 20 Jan 2026 15:38:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768919921; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=oDGqX/KkQRxzOI+l10MofO8gzSL8IjI07TilGIBbVzY=;
	b=HmgzkrB213NnhUir2q1t5Jo6axm6vljm2js6lBKfCQKklOUYXVIZzUZdwKbXW3gc7wIVm1
	lKAf/dV2mGuXkZvRX5Q7xOAgSmnnm3ikOkVZafxqYOR0ce+nse3Oh3fIwM200VawhhEHsO
	/feYg2arUbmo0KddN5iwVAKS/ZERVQQxfHFjSoDROMnDuqM1lYDlqLr3ABr2RQjwIaN7E4
	8THtvCQ220l0rbXr/eeWOmk+xdr7qPdD13vU2oGdmKpdX4m2mjLklGM0+P/bJ+lsOSaIUE
	HmeULds+keVYceZ9CQdEHew6SylB/CcW7FgphoIGOM8YzGkk5Qhw37HaSLmqXA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Cristian Birsan <cristian.birsan@microchip.com>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v3 06/19] clk: at91: Allow enabling main_rc_osc through DT
Date: Tue, 20 Jan 2026 15:37:27 +0100
Message-ID: <20260120143759.904013-7-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120143759.904013-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_063845_162424_6F0C8C88 
X-CRM114-Status: GOOD (  14.33  )
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
    v3:
    - no changes
    
    v2:
    - split out dt-bindings changes into separate patch
    - extend to drivers for other SoCs providing the OTPC

 drivers/clk/at91/sam9x60.c  | 1 +
 drivers/clk/at91/sam9x7.c   | 1 +
 drivers/clk/at91/sama7d65.c | 1 +
 drivers/clk/at91/sama7g5.c  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index dbcdb1d2161a9..a9f293a8e3b26 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -227,6 +227,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 					   50000000);
 	if (IS_ERR(hw))
 		goto err_free;
+	sam9x60_pmc->chws[SAM9X60_PMC_MAIN_RC] = hw;
 
 	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
 	if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 07eadb712a1e4..9a5afd258cb86 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -764,6 +764,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 					   50000000);
 	if (IS_ERR(hw))
 		goto err_free;
+	sam9x7_pmc->chws[SAM9X7_PMC_MAIN_RC] = hw;
 
 	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
 	if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 4ccffa8db43a5..5d8973aa50a53 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1135,6 +1135,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 						   50000000);
 	if (IS_ERR(main_rc_hw))
 		goto err_free;
+	sama7d65_pmc->chws[SAMA7D65_PMC_MAIN_RC] = hw;
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 99b4c1d9bdcca..9a6f0f30b2b7e 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -1014,6 +1014,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 						   50000000);
 	if (IS_ERR(main_rc_hw))
 		goto err_free;
+	sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] = hw;
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-- 
2.47.3


