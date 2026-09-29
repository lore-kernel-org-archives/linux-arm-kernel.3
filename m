Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3858CC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 14:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8g9y2zph+FxBR9T/OKFffD+rZh4FWbOIyfhWABZSmPo=; b=Z7CRZuPfJpDUOcT68PfgByBQ5z
	eER/oMK11LTneYvhpu0WIvMoPyC7d6cHW9LfJqr3WJ80S7ezWJSocgHptJxN8kK0pH8rZ97Tk5oPG
	McA6lJ8umfXNnoCzgAzuPMCYw3hPIWP4h24GH32BHQSgD0qe2w3SP/1b58Mcikq+A002MH3nFcdcc
	vJIrSwhKi3KOKVCGhltbfrbsUO1Fkrcc1HBNk/EUfj3zOvatmsNRDffsRK1XYr+JJy7XaqP9qUuNi
	hHBWRSugf1hqi9/6amI1og4MyTzFLw21OezO3CbTuQDVPsbiFTKqiX3ALWjqQ9PvV8On6SCdacG7J
	BeOyyawQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZ5d-00000003pAR-29hf;
	Tue, 29 Sep 2026 14:45:53 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZ5Z-00000003p7D-0RU3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 14:45:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9B6C44E410B8;
	Tue, 29 Sep 2026 14:45:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68CED601BD;
	Tue, 29 Sep 2026 14:45:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7866103297CB;
	Tue, 29 Sep 2026 16:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790693145; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8g9y2zph+FxBR9T/OKFffD+rZh4FWbOIyfhWABZSmPo=;
	b=l+TcVmDspjZ2xV4hQiXNMiJsHCMGAzykuGVAE88K7oNrCEgYvnQpZuhl0U/FGn7iMXA7lm
	+5vMyxjoYLD+dNVSJXg9JN7vFt0pvfy9n6TIn519meHA3F6lfO7iz6j1qt4N9BlNeh1M4a
	ROsoyoKjIFImiw7TCX9SY7CwLkq1VX3IxTl8eyNlAP/OHK2Ukaye3GOPyqaB8Bh7YE2gqu
	9tWQvtxw6M3SJ1iDRzpcB1qZLei7pVf7vXysXTmr1geE2VZHDszQ+q0BJuw71oCKLP+nn9
	I8DqNLgYXtqCe/MrJULxVYwRZ6MYrHfoQwbMsraidLo/7eLfFbJnfBFGBYiM5A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 29 Sep 2026 16:44:48 +0200
Subject: [PATCH v5 5/9] clk: nuvoton: ma35d1: Add missing WDT/WWDT parent
 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-perso-ma35d1-upstream-clk-v5-5-68533e935ee4@bootlin.com>
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
In-Reply-To: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chi-Fang Li <cfli0@nuvoton.com>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Jacky Huang <ychuang570808@gmail.com>, stable@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_074549_292377_42F69DAE 
X-CRM114-Status: GOOD (  11.39  )
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

The WDT and WWDT muxes list PCLK3/4096 and PCLK4/4096 among their
possible parents, but the driver never registers the corresponding
clocks, so these parents could never be used.

Add pclk3_div4096 and pclk4_div4096 as fixed factor children of pclk3
and pclk4 and expose them through the clock provider.

Reported-by: Jacky Huang <ychuang570808@gmail.com>
Closes: https://lore.kernel.org/linux-clk/b8a8a65b-e302-4747-bc90-4920fc48795a@gmail.com/
Suggested-by: Jacky Huang <ychuang570808@gmail.com>
Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/linux-clk/b8a8a65b-e302-4747-bc90-4920fc48795a@gmail.com/
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 6aa42a3e1be3..c914079cee2d 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -17,7 +17,7 @@
 static DEFINE_SPINLOCK(ma35d1_lock);
 
 #define PLL_MAX_NUM		5
-#define	MA35D1_CLK_COUNT	236
+#define	MA35D1_CLK_COUNT	238
 
 /* Clock Control Registers Offset */
 #define REG_CLK_PWRCTL		0x00
@@ -544,6 +544,8 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[HCLK3] = ma35d1_clk_fixed_factor(dev, "hclk3", "sysclk1_mux", 1, 2);
 	hws[PCLK3] = ma35d1_clk_fixed_factor(dev, "pclk3", "sysclk1_mux", 1, 2);
 	hws[PCLK4] = ma35d1_clk_fixed_factor(dev, "pclk4", "sysclk1_mux", 1, 2);
+	hws[PCLK3_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk3_div4096", "pclk3", 1, 4096);
+	hws[PCLK4_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk4_div4096", "pclk4", 1, 4096);
 
 	hws[USBPHY0] = ma35d1_clk_fixed("usbphy0", 480000000);
 	hws[USBPHY1] = ma35d1_clk_fixed("usbphy1", 480000000);

-- 
2.55.0


