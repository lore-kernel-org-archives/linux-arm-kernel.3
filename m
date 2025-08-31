Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85878CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 20:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/9/BUvxgzj5dRQfxnjFZTYhC24PVq25XRwmWcnk5S6s=; b=NXcA/ZUyLegY6dWdEj+wuBIJcD
	mMtwd7TIPFV51jNv/BFR1nMkxO2frvuoEOlkldYAZLjUNnZqpG3XO6MhQ5PojCcUU/tcZybnDW14v
	uidDDdcGOduWbcYeS3Of9GDYYmcTSD/DyVrMOwgd9mlZnIZzOCEaIrp1/SKoBFYpOl1CBqFB/cxHi
	EXoWmJ5dU0CyT+Jc3ANVBi3gkEtlMeZ1KGn567Oo5AmubgUSytE40NsIWtta7s6F6p6NC6Ybfotij
	vLFzdM/ks5DgCnPNU46wmA9vAkHiToCZZ5Y4VLUuGFvm0DeJcBzOH+NjpeY1nBkXc4O/9LCQryt9p
	SWRTVUlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usoMv-0000000AfFA-40xj;
	Sun, 31 Aug 2025 20:09:41 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usoKD-0000000Af29-0xLh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 20:06:54 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 7E21CB220079;
	Sun, 31 Aug 2025 22:06:44 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: E Shattow <e@freeshell.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v1] dts: arm64: freescale: move imx9*-clock.h imx9*-power.h into dt-bindings
Date: Sun, 31 Aug 2025 13:04:45 -0700
Message-ID: <20250831200516.522179-1-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_130653_408408_84F20A7A 
X-CRM114-Status: UNSURE (   8.24  )
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

Move imx9*-{clock,power}.h headers into
include/dt-bindings/{clock,power}/ and fix up the DTs

Reported-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi                      | 4 ++--
 arch/arm64/boot/dts/freescale/imx95.dtsi                      | 4 ++--
 .../dts/freescale => include/dt-bindings/clock}/imx94-clock.h | 0
 .../dts/freescale => include/dt-bindings/clock}/imx95-clock.h | 0
 .../dts/freescale => include/dt-bindings/power}/imx94-power.h | 0
 .../dts/freescale => include/dt-bindings/power}/imx95-power.h | 0
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename {arch/arm64/boot/dts/freescale => include/dt-bindings/clock}/imx94-clock.h (100%)
 rename {arch/arm64/boot/dts/freescale => include/dt-bindings/clock}/imx95-clock.h (100%)
 rename {arch/arm64/boot/dts/freescale => include/dt-bindings/power}/imx94-power.h (100%)
 rename {arch/arm64/boot/dts/freescale => include/dt-bindings/power}/imx95-power.h (100%)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 44dee2cbd42d..1fe6ef4518a8 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -8,9 +8,9 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-#include "imx94-clock.h"
+#include <dt-bindings/clock/imx94-clock.h>
 #include "imx94-pinfunc.h"
-#include "imx94-power.h"
+#include <dt-bindings/power/imx94-power.h>
 
 / {
 	#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 4ca6a7ea586e..787d3f829816 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -10,9 +10,9 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 
-#include "imx95-clock.h"
+#include <dt-bindings/clock/imx95-clock.h>
 #include "imx95-pinfunc.h"
-#include "imx95-power.h"
+#include <dt-bindings/power/imx95-power.h>
 
 / {
 	interrupt-parent = <&gic>;
diff --git a/arch/arm64/boot/dts/freescale/imx94-clock.h b/include/dt-bindings/clock/imx94-clock.h
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx94-clock.h
rename to include/dt-bindings/clock/imx94-clock.h
diff --git a/arch/arm64/boot/dts/freescale/imx95-clock.h b/include/dt-bindings/clock/imx95-clock.h
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx95-clock.h
rename to include/dt-bindings/clock/imx95-clock.h
diff --git a/arch/arm64/boot/dts/freescale/imx94-power.h b/include/dt-bindings/power/imx94-power.h
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx94-power.h
rename to include/dt-bindings/power/imx94-power.h
diff --git a/arch/arm64/boot/dts/freescale/imx95-power.h b/include/dt-bindings/power/imx95-power.h
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx95-power.h
rename to include/dt-bindings/power/imx95-power.h

base-commit: 5c3b3264e5858813632031ba58bcd6e1eeb3b214
-- 
2.50.0


