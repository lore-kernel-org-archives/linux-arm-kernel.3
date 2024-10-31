Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E732FE68956
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 07:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xzyhNB3FNYF/35m8HgLGH6Bs/A4Qr6jlPUGmEtYd8Y=; b=rvCr/R1Rko2K+Ri/ddWZrTePhx
	2hZj9HO8UuK/3oaDVKVzgRhPeWur23L6AiJBa4kCbHQ3qtziwn+GQHFQxEPSsp5mxjNfg19/O0j4U
	IWIIgMIeiKlpMGX2cGqv1D6Ww5NzPAy5U5ZtDEptTineyZCub4ItrHuMnWAZZGdnxz9Y0F5wWVXAq
	97n07nGdILDaPRq+dIiPbvE16v4cRe976Dhz8L5kgEtF5kOtLJEVp5PKfi2Nvq7LE4WdSCUJHuvwX
	Ai2nSnb3wE/bne0Upkd5bt5P0NSDE0d5IVfphjh1IiM9hOQem4vDaoSDy7qJs8iAJ8v3fhvICGn2s
	aUVwj1Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PS6-00000002msM-3EiD;
	Thu, 31 Oct 2024 07:18:42 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PDO-00000002kVE-0YTe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 07:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730358205;
	bh=gPKWhriD3pnIH1Uk3cfPOThE675psdPThf952AsBt2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LEtUiATid8r890K9Gp/niU0S+v6+BsFNh4OPspSgwA+SLTtetM/CQDrRxQCvuAn/E
	 afPq/dWezuNge28FyOaepgHgGMmw4mZ/tjSwVhDokwiZvdZIl1ordBTKaAPyKnzlrg
	 pXm1ftRf6ecQsMWbsQsdeCKLGFjZrSG6wEKvg7DXBrccX/Rh4cVaDDjXut0Zq8VwaL
	 /ErJoJAqjkWRN2h37PsRIBGc128Ogk7lM5sgxc+nhZNVDMm9P1qPyJqpfTdyDJz7dB
	 VAaNtG+MZN8N+ZU2UR/OF/FONIqPf2GU8d988wM0D1OAxzsd3/0TnLaynIzsAGtb9f
	 8HhYnOcq1IsWQ==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/13] clk: sunxi-ng: a100: enable MMC clock reparenting
Date: Thu, 31 Oct 2024 04:02:21 -0300
Message-ID: <20241031070232.1793078-9-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_000330_313850_0937A409 
X-CRM114-Status: UNSURE (   9.87  )
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

During testing, it was noted that MMC would fail to initialize, with
"mmc: fatal err update clk timeout" being printed in the log. It was
found that CLK_SET_RATE_NO_REPARENT was set on the MMC controllers, and
that removing this allows MMC to initialize. Therefore, remove
CLK_SET_RATE_NO_REPARENT from mmc0/1/2.

Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
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


