Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3E3CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=46brcYxsRnKl4qMYopSHhhvI4N1LtmB8ElkDCOnVXYA=; b=zMyOgAOE2lsk3Moy7v48aesX4n
	7FTRB93dCOPNu1VQSsSJvlT4AdQaz/buVntu+DnQJkak9su0Rilmh98qbb1I7PkOaSFCw43AB6Kyb
	oYuTWcpPBhirSwLLFL4RRDc+aAmING6ACOBqSyW0cOQYYg56Blqy7a/cwtX/n5DpBOZNC1NS4bCSe
	VIbo7HkZ6e79FSw6j63Rgca3UBawwxe217Bfr+LQXzvo+h7xNuuS53mnCfdwTwUclmRVzy6055w9R
	e8EXmhLCCMGhJi12y/qkzyWJMeE99r4NmjsGNj5c+GgNk8F+KxAzSU761YtfS8iJzJ+JOUB+E4vIo
	k4i0hsfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyADR-00000004hgH-1Vn1;
	Mon, 15 Sep 2025 14:30:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyADO-00000004heO-1Opr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757946598; x=1789482598;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Vag2gnBb/vURH7J+sFwDP2yfkuPnkkqrFPGa8fWRmRg=;
  b=ifqR8izRTSQGNHjQTp/b7rJL4CWJxOBMqa632nyocamdQGcI7RXBtn6n
   iFxPXReT41OWp3j2K3WM5y6RIxRS+NhVIc1Nwqe50tVe5XuOBgmst6SAH
   KT7OqzoVhling4xUL5XRRF/8SjpIaeSO3vrpIdRjTq+g6Ka8D4ooJxZSa
   0ApUCO1RjEofAbWaEQrpEn/10VYFMQX8YyNOzKyxxyfDil+dxm9H6/zUx
   KkPmvAyWARFZ+qOfYMrAdRr7xFhBSJxUQHcuVoBtn4Q3/wXb8gnjuKIPi
   c46o/e5h2FD4Ts+8CY1KPTQNSr8FFcj/Yb4EywWo78x/hMFfjHXZ1byZh
   w==;
X-CSE-ConnectionGUID: LXjrnypeSNyBrbf8fuQoPA==
X-CSE-MsgGUID: 5jpjx4GUTgyDK4/MLlSw3g==
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="47065475"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Sep 2025 07:29:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 07:29:32 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Sep 2025 07:29:30 -0700
From: <nicolas.ferre@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Cristian Birsan <cristian.birsan@microchip.com>, Ryan Wanner
	<ryan.wanner@microchip.com>, Varshini Rajendran
	<varshini.rajendran@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 1/2] clk: at91: add ACR in all PLL settings
Date: Mon, 15 Sep 2025 16:29:07 +0200
Message-ID: <20250915142908.18737-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_072958_655668_1F08C070 
X-CRM114-Status: GOOD (  11.58  )
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

From: Cristian Birsan <cristian.birsan@microchip.com>

Add the ACR register to all PLL settings and provide the correct
ACR value for each PLL used in different SoCs.

Suggested-by: Mihai Sain <mihai.sain@microchip.com>
Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
[nicolas.ferre@microchip.com: add sama7d65 and review commit message]
Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 drivers/clk/at91/pmc.h      | 1 +
 drivers/clk/at91/sam9x60.c  | 2 ++
 drivers/clk/at91/sam9x7.c   | 5 +++++
 drivers/clk/at91/sama7d65.c | 4 ++++
 drivers/clk/at91/sama7g5.c  | 2 ++
 5 files changed, 14 insertions(+)

diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 4fb29ca111f7..5daa32c4cf25 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -80,6 +80,7 @@ struct clk_pll_characteristics {
 	u16 *icpll;
 	u8 *out;
 	u8 upll : 1;
+	u32 acr;
 };
 
 struct clk_programmable_layout {
diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index db6db9e2073e..18baf4a256f4 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -36,6 +36,7 @@ static const struct clk_pll_characteristics plla_characteristics = {
 	.num_output = ARRAY_SIZE(plla_outputs),
 	.output = plla_outputs,
 	.core_output = core_outputs,
+	.acr = UL(0x00020010),
 };
 
 static const struct clk_range upll_outputs[] = {
@@ -48,6 +49,7 @@ static const struct clk_pll_characteristics upll_characteristics = {
 	.output = upll_outputs,
 	.core_output = core_outputs,
 	.upll = true,
+	.acr = UL(0x12023010), /* fIN = [18 MHz, 32 MHz]*/
 };
 
 static const struct clk_pll_layout pll_frac_layout = {
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 740f52906f6b..89868a0aeaba 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -107,6 +107,7 @@ static const struct clk_pll_characteristics plla_characteristics = {
 	.num_output = ARRAY_SIZE(plla_outputs),
 	.output = plla_outputs,
 	.core_output = plla_core_outputs,
+	.acr = UL(0x00020010), /* Old ACR_DEFAULT_PLLA value */
 };
 
 static const struct clk_pll_characteristics upll_characteristics = {
@@ -115,6 +116,7 @@ static const struct clk_pll_characteristics upll_characteristics = {
 	.output = upll_outputs,
 	.core_output = upll_core_outputs,
 	.upll = true,
+	.acr = UL(0x12023010), /* fIN=[20 MHz, 32 MHz] */
 };
 
 static const struct clk_pll_characteristics lvdspll_characteristics = {
@@ -122,6 +124,7 @@ static const struct clk_pll_characteristics lvdspll_characteristics = {
 	.num_output = ARRAY_SIZE(lvdspll_outputs),
 	.output = lvdspll_outputs,
 	.core_output = lvdspll_core_outputs,
+	.acr = UL(0x12023010), /* fIN=[20 MHz, 32 MHz] */
 };
 
 static const struct clk_pll_characteristics audiopll_characteristics = {
@@ -129,6 +132,7 @@ static const struct clk_pll_characteristics audiopll_characteristics = {
 	.num_output = ARRAY_SIZE(audiopll_outputs),
 	.output = audiopll_outputs,
 	.core_output = audiopll_core_outputs,
+	.acr = UL(0x12023010), /* fIN=[20 MHz, 32 MHz] */
 };
 
 static const struct clk_pll_characteristics plladiv2_characteristics = {
@@ -136,6 +140,7 @@ static const struct clk_pll_characteristics plladiv2_characteristics = {
 	.num_output = ARRAY_SIZE(plladiv2_outputs),
 	.output = plladiv2_outputs,
 	.core_output = plladiv2_core_outputs,
+	.acr = UL(0x00020010),  /* Old ACR_DEFAULT_PLLA value */
 };
 
 /* Layout for fractional PLL ID PLLA. */
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index a5d40df8b2f2..7dee2b160ffb 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -138,6 +138,7 @@ static const struct clk_pll_characteristics cpu_pll_characteristics = {
 	.num_output = ARRAY_SIZE(cpu_pll_outputs),
 	.output = cpu_pll_outputs,
 	.core_output = core_outputs,
+	.acr = UL(0x00070010),
 };
 
 /* PLL characteristics. */
@@ -146,6 +147,7 @@ static const struct clk_pll_characteristics pll_characteristics = {
 	.num_output = ARRAY_SIZE(pll_outputs),
 	.output = pll_outputs,
 	.core_output = core_outputs,
+	.acr = UL(0x00070010),
 };
 
 static const struct clk_pll_characteristics lvdspll_characteristics = {
@@ -153,6 +155,7 @@ static const struct clk_pll_characteristics lvdspll_characteristics = {
 	.num_output = ARRAY_SIZE(lvdspll_outputs),
 	.output = lvdspll_outputs,
 	.core_output = lvdspll_core_outputs,
+	.acr = UL(0x00070010),
 };
 
 static const struct clk_pll_characteristics upll_characteristics = {
@@ -160,6 +163,7 @@ static const struct clk_pll_characteristics upll_characteristics = {
 	.num_output = ARRAY_SIZE(upll_outputs),
 	.output = upll_outputs,
 	.core_output = upll_core_outputs,
+	.acr = UL(0x12020010),
 	.upll = true,
 };
 
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 8385badc1c70..1340c2b00619 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -113,6 +113,7 @@ static const struct clk_pll_characteristics cpu_pll_characteristics = {
 	.num_output = ARRAY_SIZE(cpu_pll_outputs),
 	.output = cpu_pll_outputs,
 	.core_output = core_outputs,
+	.acr = UL(0x00070010),
 };
 
 /* PLL characteristics. */
@@ -121,6 +122,7 @@ static const struct clk_pll_characteristics pll_characteristics = {
 	.num_output = ARRAY_SIZE(pll_outputs),
 	.output = pll_outputs,
 	.core_output = core_outputs,
+	.acr = UL(0x00070010),
 };
 
 /*
-- 
2.43.0


