Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DD6EC01C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 11:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Skhq+8bwNzjiqYQ3YWn8po9yFP9RcJcRyx8QXtgixyI=; b=ISUX1wkM6rhXYISeC6Iyvzdp/y
	S2YRWPtDUsOdK1hVP/H29fVo5cjuP+2uqsUkhb/wqb1nDMX0hAfLG9W01d1u6HTHTn9oS/dhZpO4w
	hTWuRhiO9kMg1cjc9lvLCvncNHdQBwSBJfh5kQILKxj/FMi2sFPWrkF2ijy9UfkPyFhGom8Wazlwb
	lAqIIfffoRMNi3EPCmZAeA1r9YovOITM3PhaCXOQsmDq2IG6uwqnyvJ0DnfOvQnJYkvmps0eGDNAT
	vh2xVSb2jXUE9K/LVWuHt2cEqJEYVT/hYaeAgVhHeqtrWS7nupXywwWs2MW6/FbkMySYvb/mAiQW8
	rIlG2Zow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4d2x-0000000GYfb-0Mr7;
	Mon, 23 Mar 2026 11:02:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4d2s-0000000GYdJ-2Dr7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 11:02:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67EE31688;
	Mon, 23 Mar 2026 04:01:59 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C69DD3F73B;
	Mon, 23 Mar 2026 04:02:02 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] pinctrl: sunxi: Remove unneeded IRQ remuxing for some SoCs
Date: Mon, 23 Mar 2026 12:01:48 +0100
Message-ID: <20260323110151.2352832-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323110151.2352832-1-andre.przywara@arm.com>
References: <20260323110151.2352832-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_040206_651618_699EDA22 
X-CRM114-Status: GOOD (  16.63  )
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

The Allwinner A10 and H3 SoCs cannot read the state of a GPIO line when
that line is muxed for IRQ triggering (muxval 6), but only if it's
explicitly muxed for GPIO input (muxval 0). Other SoCs do not show this
behaviour, so we added a optional workaround, triggered by a quirk bit,
which triggers remuxing the pin when it's configured for IRQ, while we
need to read its value.

For some reasons this quirk flag was copied over to newer SoCs, even
though they don't show this behaviour, and the GPIO data register
reflects the true GPIO state even with a pin configured to muxval 6
(IRQ). The workaround is just more costly, but doesn't break otherwise,
so this was probably never noticed by anyone.
Experiments confirm that the H5, H6, H616 and A523 do not need this
workaround, they show the GPIO line value with both muxval 0 and 6.

Remove the unneeded quirk from those SoC's pinctrl driver description.
This should have no obvious effect on the H5, H6, H616 (other than
being more efficient), but the workaround is broken for the A523, so
it fixes (one part of the) interrupt operation there.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Fixes: b8a51e95b376 ("pinctrl: sunxi: Add support for the secondary A523 GPIO ports")
---
 drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c     | 2 --
 drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c     | 1 -
 drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c   | 1 -
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 1 -
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 1 -
 5 files changed, 6 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c
index 669793c6578e..56ce0f78d4ba 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c
@@ -533,7 +533,6 @@ static const struct sunxi_pinctrl_desc sun50i_h5_pinctrl_data_broken = {
 	.pins = sun50i_h5_pins,
 	.npins = ARRAY_SIZE(sun50i_h5_pins),
 	.irq_banks = 2,
-	.irq_read_needs_mux = true,
 	.disable_strict_mode = true,
 };
 
@@ -541,7 +540,6 @@ static const struct sunxi_pinctrl_desc sun50i_h5_pinctrl_data = {
 	.pins = sun50i_h5_pins,
 	.npins = ARRAY_SIZE(sun50i_h5_pins),
 	.irq_banks = 3,
-	.irq_read_needs_mux = true,
 	.disable_strict_mode = true,
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c
index 517118341316..22f3d3875316 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c
@@ -589,7 +589,6 @@ static const struct sunxi_pinctrl_desc h6_pinctrl_data = {
 	.npins = ARRAY_SIZE(h6_pins),
 	.irq_banks = 4,
 	.irq_bank_map = h6_irq_bank_map,
-	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
index ecf6d2438e21..48cf114505e0 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
@@ -875,7 +875,6 @@ static const struct sunxi_pinctrl_desc h616_pinctrl_data = {
 	.npins = ARRAY_SIZE(h616_pins),
 	.irq_banks = ARRAY_SIZE(h616_irq_bank_map),
 	.irq_bank_map = h616_irq_bank_map,
-	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_CTL,
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index 69cd2b4ebd7d..462aa1c4a5fa 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -26,7 +26,6 @@ static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
 	.irq_bank_map = a523_r_irq_bank_map,
-	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 	.pin_base = PL_BASE,
 };
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index 7d2308c37d29..b6f78f1f30ac 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -26,7 +26,6 @@ static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a523_pinctrl_data = {
 	.irq_banks = ARRAY_SIZE(a523_irq_bank_map),
 	.irq_bank_map = a523_irq_bank_map,
-	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
 
-- 
2.43.0


