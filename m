Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769BCC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11eji1z4W2xZle7rFqNDZq5Blpq5fpa17v9TKg7x1fU=; b=h4LBd9eS5CNHoWCEzCc9ZA0PWC
	n1qXRxjppTDwFVfqpvUky0LErnN3e3EQt5AgAy9Et/irok1NFvQWW6WTQQwOq/mlL071xO0zJfuOU
	ATaVkYexIJ5+lnkJ0zZ3i6qBWpNIeNLBlDdD+EtWnHZjAfgMhYcWroJgDbEPSKhaSpSyJMp4gHyKJ
	iESq7cmAOxjv7ILaY932ihU+XsUvGkJG+s6XAfCNmK0xzTe1oMigIpuYOwCyybrZEduqbGT/vKTKy
	9Ev4M45k2D+XE0BYy6ZH8pC5q2tbh2RPrL20xK+sEvWLfdktCVmjOdFdKiata9tl3+XyyGH8c79uv
	Xo+G1rDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xm7-000000016Rz-3yL4;
	Mon, 21 Sep 2026 06:45:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xm6-000000016RI-3lkT
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 06:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=11eji1z4W2xZle7rFqNDZq5Blpq5fpa17v9TKg7x1fU=; b=M/rTcI9jT37vU+tPBw4QmOL6W4
	YRCibM+2aZE4LEUzfR2zbe66IzV9U1eojy1KsQZBBZ3pNAL91LNULfqZ+gcsDW+V8Joeu3yLNsf+p
	ntvpCTygxrscY/BU+gdhA08z2M0JBC3I+RHuTz3d/npzWaA0Gq71n0FLu8Qfop4yglgCK4y17+Vgf
	623rUFZdbCMg7ttJMpKEdNYq7aDN37V0rN9bAmK+78aMldKN/pK7UkC0TC0maJdT+ltUtYbyuQ11V
	a1Q+I4arqYdukr+Bfe4EOiH7yQh6ByeEro7RFu1V07HUzqcEyU0OkuvrFkKFZbugKAuk1YmHVzg7S
	Pi4QixrA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8Xls-0000000BtTi-0ilC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:45:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 859F41A0DF3;
	Mon, 21 Sep 2026 06:44:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5936360339;
	Mon, 21 Sep 2026 06:44:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33A2C10328FEC;
	Mon, 21 Sep 2026 08:44:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973097; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=11eji1z4W2xZle7rFqNDZq5Blpq5fpa17v9TKg7x1fU=;
	b=aT+ZgjtJF+A5lbHYsaxdqz43ncPTAC9QWzht3flxCtDEXhY1g6JDvWwSF8dl/vBWH1NUFB
	lxXmZtrw2mTYu0A5RCVV6dIneM0SP2kxgQ3LR0V2HM9mvW1BegG/f+pE/DG/4/fSpXO8+o
	dOW5wb+Qf6p4D1C5ZvRWk5FUm7+/iMOjvUvT/ajoIdypS5nvBYJvpGhHxKlxjRINTaRAHP
	Hb+BnYifgruXOYwtHo4UvbLs2RhXDGWP06Xitk8QPnsIyy/f3sTuBXRp4fgqAJti2MktDY
	SDMxYuFjGg4cRrW5KOlrThid1/yZdFXOz49VT0/DPnXmdU3aifQFCaetwCEbEQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 21 Sep 2026 08:44:45 +0200
Subject: [PATCH v2 1/3] clk: nuvoton: ma35d1: Add missing WDT/WWDT parent
 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-perso-ma35d1-upstream-clk-v2-1-209fd32a8b00@bootlin.com>
References: <20260921-perso-ma35d1-upstream-clk-v2-0-209fd32a8b00@bootlin.com>
In-Reply-To: <20260921-perso-ma35d1-upstream-clk-v2-0-209fd32a8b00@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Jacky Huang <ychuang570808@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_074501_170672_12DE9963 
X-CRM114-Status: GOOD (  12.00  )
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
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c               | 2 ++
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 9f65d0623517..9d57de6a1e56 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -543,6 +543,8 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[HCLK3] = ma35d1_clk_fixed_factor(dev, "hclk3", "sysclk1_mux", 1, 2);
 	hws[PCLK3] = ma35d1_clk_fixed_factor(dev, "pclk3", "sysclk1_mux", 1, 2);
 	hws[PCLK4] = ma35d1_clk_fixed_factor(dev, "pclk4", "sysclk1_mux", 1, 2);
+	hws[PCLK3_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk3_div4096", "pclk3", 1, 4096);
+	hws[PCLK4_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk4_div4096", "pclk4", 1, 4096);
 
 	hws[USBPHY0] = ma35d1_clk_fixed("usbphy0", 480000000);
 	hws[USBPHY1] = ma35d1_clk_fixed("usbphy1", 480000000);
diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
index ba2d70f776a6..d3fd8251c806 100644
--- a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
@@ -248,6 +248,8 @@
 #define ADC_GATE	233
 #define EADC_DIV	234
 #define EADC_GATE	235
-#define	CLK_MAX_IDX	236
+#define PCLK3_DIV4096	236
+#define PCLK4_DIV4096	237
+#define	CLK_MAX_IDX	238
 
 #endif /* __DT_BINDINGS_CLOCK_NUVOTON_MA35D1_CLK_H */

-- 
2.55.0


