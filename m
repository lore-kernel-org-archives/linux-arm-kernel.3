Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7ABE74902
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 05:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7v2WoIriGL4qkAhGkDMWz98EKkBScwTI/1qmi+IQJ8=; b=zkWSLChD34qVsqK4L3z4DHDfsJ
	R+OwGGG/X2Be/L8CzpqLt/xRJ2RCNj5lcTp6xd01Sfau878lrImLeTxPwBe1rQg3V/Nb3yWwqKNpp
	j50xY+SyXE4iMoi74qKv04Fdw1kwIueREzxmPB9vRpKUltbeV3CKShcnYZB8hBJxMnwM0kEq8F4DI
	mu045Cwk6Dx/+x0c6ZQNoPp/rBq16GbJZaVPdZT7Xs3QpaE/PYdNqCNAwynDCxQID1CZN9Ua40IfQ
	5+mkASB7BPmUs4RLL7MW3hGT34FKDA2WP3YTx4Z2Trb0BItoTsmoAchH30eXH+GCR8OUSMaQUUQZm
	Kk1fYs7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHZA-0000000GRgw-2U4j;
	Wed, 24 Dec 2025 05:37:44 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHZ4-0000000GRdc-3dlJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 05:37:40 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 24 Dec
 2025 13:37:23 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 24 Dec 2025 13:37:23 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 24 Dec 2025 13:37:22 +0800
Subject: [PATCH v16 1/3] clk: aspeed: Move the existing ASPEED clk drivers
 into aspeed subdirectory.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251224-upstream_clk-v16-1-8c1318f56c3c@aspeedtech.com>
References: <20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com>
In-Reply-To: <20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com>
To: Brian Masney <bmasney@redhat.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	"Ryan Chen" <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766554643; l=4334;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=QUP/lHHi7gANo6uybmooacUeZzMb6YNKU3yjZDuNONY=;
 b=Oypthn77pCaBxdB7oBz8nF+59BEIkD9RU0xSiXqn1z/S67L3PMXguaHnK5GF0rGS33JiRFCbY
 Vjo7wgImDiEDbC7/PrhoJF7OToXr5Z2KqHbGQIAotDoZV9jn80FwNKE
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_213738_912451_C90B851A 
X-CRM114-Status: GOOD (  12.97  )
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

Prepare for long-term maintenance and future additions by introducing a
dedicated drivers/clk/aspeed/ subdirectory for ASPEED clock drivers.

Move the existing ASPEED clock drivers into the new
drivers/clk/aspeed/ subdirectory.

No functional change, file move only.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/clk/Kconfig                    | 13 +------------
 drivers/clk/Makefile                   |  3 +--
 drivers/clk/aspeed/Kconfig             | 13 +++++++++++++
 drivers/clk/aspeed/Makefile            |  3 +++
 drivers/clk/{ => aspeed}/clk-aspeed.c  |  0
 drivers/clk/{ => aspeed}/clk-aspeed.h  |  0
 drivers/clk/{ => aspeed}/clk-ast2600.c |  0
 7 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3a1611008e48..c46920649c97 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -284,18 +284,6 @@ config COMMON_CLK_LAN966X
 	  LAN966X SoC. GCK generates and supplies clock to various peripherals
 	  within the SoC.
 
-config COMMON_CLK_ASPEED
-	bool "Clock driver for Aspeed BMC SoCs"
-	depends on ARCH_ASPEED || COMPILE_TEST
-	default ARCH_ASPEED
-	select MFD_SYSCON
-	select RESET_CONTROLLER
-	help
-	  This driver supports the SoC clocks on the Aspeed BMC platforms.
-
-	  The G4 and G5 series, including the ast2400 and ast2500, are supported
-	  by this driver.
-
 config COMMON_CLK_S2MPS11
 	tristate "Clock driver for S2MPS1X/S5M8767 MFD"
 	depends on MFD_SEC_CORE || COMPILE_TEST
@@ -513,6 +501,7 @@ config COMMON_CLK_RPMI
 
 source "drivers/clk/actions/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
+source "drivers/clk/aspeed/Kconfig"
 source "drivers/clk/baikal-t1/Kconfig"
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 61ec08404442..f7bce3951a30 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -62,8 +62,6 @@ obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+= clk-fixed-mmio.o
 obj-$(CONFIG_COMMON_CLK_FSL_FLEXSPI)	+= clk-fsl-flexspi.o
 obj-$(CONFIG_COMMON_CLK_FSL_SAI)	+= clk-fsl-sai.o
 obj-$(CONFIG_COMMON_CLK_GEMINI)		+= clk-gemini.o
-obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
-obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
 obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
 obj-$(CONFIG_CLK_HSDK)			+= clk-hsdk-pll.o
 obj-$(CONFIG_COMMON_CLK_K210)		+= clk-k210.o
@@ -114,6 +112,7 @@ obj-$(CONFIG_COMMON_CLK_XGENE)		+= clk-xgene.o
 # please keep this section sorted lexicographically by directory path name
 obj-y					+= actions/
 obj-y					+= analogbits/
+obj-y					+= aspeed/
 obj-$(CONFIG_COMMON_CLK_AT91)		+= at91/
 obj-$(CONFIG_ARCH_ARTPEC)		+= axis/
 obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
diff --git a/drivers/clk/aspeed/Kconfig b/drivers/clk/aspeed/Kconfig
new file mode 100644
index 000000000000..c59b0a1f581c
--- /dev/null
+++ b/drivers/clk/aspeed/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config COMMON_CLK_ASPEED
+        bool "Clock driver for Aspeed BMC SoCs"
+        depends on ARCH_ASPEED || COMPILE_TEST
+        default ARCH_ASPEED
+        select MFD_SYSCON
+        select RESET_CONTROLLER
+        help
+          This driver supports the SoC clocks on the Aspeed BMC platforms.
+
+          The G4 and G5 series, including the ast2400 and ast2500, are supported
+          by this driver.
diff --git a/drivers/clk/aspeed/Makefile b/drivers/clk/aspeed/Makefile
new file mode 100644
index 000000000000..7db136b89b1e
--- /dev/null
+++ b/drivers/clk/aspeed/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
+obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/aspeed/clk-aspeed.c
similarity index 100%
rename from drivers/clk/clk-aspeed.c
rename to drivers/clk/aspeed/clk-aspeed.c
diff --git a/drivers/clk/clk-aspeed.h b/drivers/clk/aspeed/clk-aspeed.h
similarity index 100%
rename from drivers/clk/clk-aspeed.h
rename to drivers/clk/aspeed/clk-aspeed.h
diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/aspeed/clk-ast2600.c
similarity index 100%
rename from drivers/clk/clk-ast2600.c
rename to drivers/clk/aspeed/clk-ast2600.c

-- 
2.34.1


