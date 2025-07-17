Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A841C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 16:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qiwCF1Q0/dfbmH/h12rPJd3E/SUaGv51sALD25KqqZk=; b=SblcZez5Gxf8cOI923XH64km2b
	UgWUWQ/KXjYH07YD8/HSzMUCJEmHIIKv45w/FBaoZDP6x0l1GabcnzmqKYoIMsKItfBSFYrBsKkj1
	DzsCHL/Z91Zs6Y0K4H4JR6y5j5yb3yi+uaVbiUBEry1cnTSrw2eV9iuQza85YMNf1r1ukbWXpQeBp
	JjpyVO0useHpw/Z4GBbwqxa0ktbMwSVSKyUu1qbaaeuRyNNpnizhowctJxAA5PDmrtH8mJ02ERPkS
	zdMWrshyf1xS4Y4O5wiLspUsW6UXHXJqFPIjwt3YfvRLeSZNbRpkLhbCK7iZlMQkb9iaM/mqPULuz
	q4E3W9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRAQ-0000000AakJ-0gJH;
	Thu, 17 Jul 2025 16:09:06 +0000
Received: from mta-64-225.siemens.flowmailer.net ([185.136.64.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQWl-0000000AVOX-1M6K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 15:28:09 +0000
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250717152802b1b7aa2eb5c8246fe4
        for <linux-arm-kernel@lists.infradead.org>;
        Thu, 17 Jul 2025 17:28:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qiwCF1Q0/dfbmH/h12rPJd3E/SUaGv51sALD25KqqZk=;
 b=NbBSvXAIUK+yejZE4f901rnzUou0mq+g7t2Qh6rawOr5d+iUhl/Nl3NTUb9yvGzWM3EQzY
 vox1EBk7tVrEZm0Dj6Ios/JxrLPDDIPRUjIjNj4MdfLZ8huMDvFLI3YaH7+pU6ljTR1RsiJK
 T/FX0w+BWBxgQdeaHajv2YC65VJfPkPrI8AQa4ebpwTRMVtxZ4i41ys5ePMdl/2CeqT4fqG4
 +A8A2CjWa8pzbp/abeUJJYs9s+N7yI+DH6bwFtYxov6WdKOR+xXwFDq+fcYM2/dfhO2Fagbf
 g1vNrPNfHSCr9LrzQ91Uz08rbbFKLJ94QFFUdmKtcsKUlWoi47Jc3BuQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-omap@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Matthias Michel <matthias.michel@siemens.com>,
	stable@vger.kernel.org
Subject: [PATCH] ARM: AM33xx: Implement TI advisory 1.0.36 (EMU0/EMU1 pins state on reset)
Date: Thu, 17 Jul 2025 17:27:03 +0200
Message-ID: <20250717152708.487891-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_082807_881999_C0C3B371 
X-CRM114-Status: GOOD (  16.53  )
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

There is an issue possible where TI AM33xx SoCs do not boot properly after
a reset if EMU0/EMU1 pins were used as GPIO and have been driving low level
actively prior to reset [1].

"Advisory 1.0.36 EMU0 and EMU1: Terminals Must be Pulled High Before
ICEPick Samples

The state of the EMU[1:0] terminals are latched during reset to determine
ICEPick boot mode. For normal device operation, these terminals must be
pulled up to a valid high logic level ( > VIH min) before ICEPick samples
the state of these terminals, which occurs
[five CLK_M_OSC clock cycles - 10 ns] after the falling edge of WARMRSTn.

Many applications may not require the secondary GPIO function of the
EMU[1:0] terminals. In this case, they would only be connected to pull-up
resistors, which ensures they are always high when ICEPick samples.
However, some applications may need to use these terminals as GPIO where
they could be driven low before reset is asserted. This usage of the
EMU[1:0] terminals may require special attention to ensure the terminals
are allowed to return to a valid high-logic level before ICEPick samples
the state of these terminals.

When any device reset is asserted, the pin mux mode of EMU[1:0] terminals
configured to operate as GPIO (mode 7) will change back to EMU input
(mode 0) on the falling edge of WARMRSTn. This only provides a short period
of time for the terminals to return high if driven low before reset is
asserted...

If the EMU[1:0] terminals are configured to operate as GPIO, the product
should be designed such these terminals can be pulled to a valid high-logic
level within 190 ns after the falling edge of WARMRSTn."

We've noticed this problem with custom am335x hardware in combination with
recently implemented cold reset method
(commit 6521f6a195c70 ("ARM: AM33xx: PRM: Implement REBOOT_COLD")).
It looks like the problem can affect other HW, for instance AM335x
Chiliboard, because the latter has LEDs on GPIO3_7/GPIO3_8 as well.

One option would be to check if the pins are in GPIO mode and either switch
to output active high, or switch to input and poll until the external
pull-ups have brought the pins to the desired high state. But fighting
with GPIO driver for these pins is probably not the most straight forward
approch in a reboot handler.

Fortunately we can easily control pinmuxing here and rely on the external
pull-ups. TI recommends 4k7 external pull up resistors [2] and even with
quite conservative estimation for pin capacity (1 uF should never happen)
the required delay shall not exceed 5ms.

[1] Link: https://www.ti.com/lit/pdf/sprz360
[2] Link: https://e2e.ti.com/support/processors-group/processors/f/processors-forum/866346/am3352-emu-1-0-questions
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 arch/arm/mach-omap2/am33xx-restart.c | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/mach-omap2/am33xx-restart.c b/arch/arm/mach-omap2/am33xx-restart.c
index fcf3d557aa786..3cdf223addcc2 100644
--- a/arch/arm/mach-omap2/am33xx-restart.c
+++ b/arch/arm/mach-omap2/am33xx-restart.c
@@ -2,12 +2,46 @@
 /*
  * am33xx-restart.c - Code common to all AM33xx machines.
  */
+#include <dt-bindings/pinctrl/am33xx.h>
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/reboot.h>
 
 #include "common.h"
+#include "control.h"
 #include "prm.h"
 
+/*
+ * Advisory 1.0.36 EMU0 and EMU1: Terminals Must be Pulled High Before
+ * ICEPick Samples
+ *
+ * If EMU0/EMU1 pins have been used as GPIO outputs and actively driving low
+ * level, the device might not reboot in normal mode. We are in a bad position
+ * to override GPIO state here, so just switch the pins into EMU input mode
+ * (that's what reset will do anyway) and wait a bit, because the state will be
+ * latched 190 ns after reset.
+ */
+static void am33xx_advisory_1_0_36(void)
+{
+	u32 emu0 = omap_ctrl_readl(AM335X_PIN_EMU0);
+	u32 emu1 = omap_ctrl_readl(AM335X_PIN_EMU1);
+
+	/* If both pins are in EMU mode, nothing to do */
+	if (!(emu0 & 7) && !(emu1 & 7))
+		return;
+
+	/* Switch GPIO3_7/GPIO3_8 into EMU0/EMU1 modes respectively */
+	omap_ctrl_writel(emu0 & ~7, AM335X_PIN_EMU0);
+	omap_ctrl_writel(emu1 & ~7, AM335X_PIN_EMU1);
+
+	/*
+	 * Give pull-ups time to load the pin/PCB trace capacity.
+	 * 5 ms shall be enough to load 1 uF (would be huge capacity for these
+	 * pins) with TI-recommended 4k7 external pull-ups.
+	 */
+	mdelay(5);
+}
+
 /**
  * am33xx_restart - trigger a software restart of the SoC
  * @mode: the "reboot mode", see arch/arm/kernel/{setup,process}.c
@@ -18,6 +52,8 @@
  */
 void am33xx_restart(enum reboot_mode mode, const char *cmd)
 {
+	am33xx_advisory_1_0_36();
+
 	/* TODO: Handle cmd if necessary */
 	prm_reboot_mode = mode;
 
-- 
2.50.1


