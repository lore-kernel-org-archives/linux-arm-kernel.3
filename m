Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3627CD64099
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 00:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rSoLFnmIo0HWAhxNPuckM8AezJO+kvweshXylxtp41E=; b=XEwLRQqyIa8kzltVSI1QshTYTH
	YgnczzJiiRxdIdxctOH8WIQARF8smuzznyuhhKWONdPKM2SMKhaXerbfK+nZpSspOwT0RLlssmRpn
	2wXN6EIsEL1F9AIzsR8dwmXm3tF7sWZnHcTISSkGcsXJ3AQ9pgbGHeuAwt3YMxeu3hdS3xeopB59o
	ekEfJFXjgeub6V7PppQKXpv43o0u6q6HyMXeynCFDXkrgp5KTj2L8Ue8ceJYZsOSCyJNZQPbKDMI9
	rO/fXRFihQNzgPBWd5hmhkLjFahed+L+BNqS8btWJ1LOXRpwhWjF7FHBWfhQfeNQsghSQ0qXvGnzw
	gSItyBEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ZYX-0000000CNJr-2ooH;
	Sat, 09 Nov 2024 00:42:25 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ZUi-0000000CMfA-2z0H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 00:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1731112704;
	bh=+tH5r8cLpo1I9/b6hjipeQzb5fcbOBVbjlOj13fMT2g=;
	h=From:To:Cc:Subject:Date:From;
	b=PAY0hWXQfER7OCQRqiwOo0vfS/sROfzIpwW4hL9HKldH1/EfbsY580Q6zeFYojFyA
	 zOJ/iQOdWpuHur2yGZbN4ShDvPkMecYq92G9w6R/W0Fztwej6zT5sOji4jX/1zXjEF
	 N9pKWypZqcUN51miEXH64Di7jY6TX3J3EaTGBVPQZxt4KRaLa1qairAAUmkjQwze6Y
	 6lk6n59mwXWQsmRTXSKSRNbO2jg3C6SnSm77sUd6eJBzhTUUfWX8usM4jAZlO/YXmB
	 zX512cwTfABjJooNT1MCYX5aCIkOba151xrr+Blio/SkgXb4qx1/qYoaRIOp528x2z
	 eHAvtL5Fa8EAQ==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <frank@allwinnertech.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>,
	stable@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: a100: enable MMC clock reparenting
Date: Fri,  8 Nov 2024 20:37:37 -0400
Message-ID: <20241109003739.3440904-1-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_163828_843460_4C34F835 
X-CRM114-Status: GOOD (  11.74  )
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

While testing the MMC nodes proposed in [1], it was noted that mmc0/1
would fail to initialize, with "mmc: fatal err update clk timeout" in
the kernel logs. A closer look at the clock definitions showed that the MMC
MPs had the "CLK_SET_RATE_NO_REPARENT" flag set. No reason was given for
adding this flag in the first place, and its original purpose is unknown,
but it doesn't seem to make sense and results in severe limitations to MMC
speeds. Thus, remove this flag from the 3 MMC MPs.

[1] https://msgid.link/20241024170540.2721307-10-masterr3c0rd@epochal.quest

Fixes: fb038ce4db55 ("clk: sunxi-ng: add support for the Allwinner A100 CCU")
Cc: stable@vger.kernel.org
Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a100.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a100.c b/drivers/clk/sunxi-ng/ccu-sun50i-a100.c
index bbaa82978716..a59e420b195d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a100.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a100.c
@@ -436,7 +436,7 @@ static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc0_clk, "mmc0", mmc_parents, 0x830,
 					  24, 2,	/* mux */
 					  BIT(31),	/* gate */
 					  2,		/* post-div */
-					  CLK_SET_RATE_NO_REPARENT);
+					  0);
 
 static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc1_clk, "mmc1", mmc_parents, 0x834,
 					  0, 4,		/* M */
@@ -444,7 +444,7 @@ static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc1_clk, "mmc1", mmc_parents, 0x834,
 					  24, 2,	/* mux */
 					  BIT(31),	/* gate */
 					  2,		/* post-div */
-					  CLK_SET_RATE_NO_REPARENT);
+					  0);
 
 static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc2_clk, "mmc2", mmc_parents, 0x838,
 					  0, 4,		/* M */
@@ -452,7 +452,7 @@ static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc2_clk, "mmc2", mmc_parents, 0x838,
 					  24, 2,	/* mux */
 					  BIT(31),	/* gate */
 					  2,		/* post-div */
-					  CLK_SET_RATE_NO_REPARENT);
+					  0);
 
 static SUNXI_CCU_GATE(bus_mmc0_clk, "bus-mmc0", "ahb3", 0x84c, BIT(0), 0);
 static SUNXI_CCU_GATE(bus_mmc1_clk, "bus-mmc1", "ahb3", 0x84c, BIT(1), 0);
-- 
2.47.0


