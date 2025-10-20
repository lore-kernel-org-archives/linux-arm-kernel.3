Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEC8CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6de2fyaarI9K2/ks3PeVYbyxQ7PM/e/830k4Zmpr7Bc=; b=tV1KxkIbxbfZcVavcHzbR6jfB/
	fG+YOfWfn2jWszR1Plnb8QX/O91+FanfKDok6Ocl3ZFgQma4JmkrObc3px57HSGRbI/jxtGzA4kgi
	gde8HgIAMyNzJzqcBy2/efTbs3A0c0xCbVsVcPIfHTIHqkuXxt/GewzFWp2Y6FugD6rCnLB/Bkkb3
	LvtxYm0jldJyWdMjK9TGMI2YBLrqjqCqwTL9UJvnJ0dB4bx3V0CtH9VEhzXIXHf3vxNO0vgOhcTbk
	GmyqxiqP8LkdG77Pw68pXTQeppcXvBH2pvfOPyYwx4yrwRZLuuPXHKMAWrAynC1KkBCrEDTQzQ5qi
	6b2w44ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQ7-0000000EQrg-0imN;
	Mon, 20 Oct 2025 17:11:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQ4-0000000EQog-26mv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:11:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F84648DF3;
	Mon, 20 Oct 2025 17:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC18C19421;
	Mon, 20 Oct 2025 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980282;
	bh=qJlYlCdLicsk3Qg+mKxU+NISEK1JvSSkuCl6A572eG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BCvy6s5fuw+OQYHnGwF2kNwuSXGkZ9hKH3PWBHPFC7S3XeMeVN0cRdly0W5bSUDhb
	 RO0kfd1ZCJJBB+L3kHSFqP4hi0W5zDMB+H1QkBHrQcufHuCv2H2Sx5IQm59Xs47c+v
	 3m92pOgPjxML37+9DRFI096dxL/esFy85urgSV1M1ON3kcgWPOB9jW1wL3x2QQd4Zn
	 r087FlRGBv+wMUvcr0GzUiDEEpZonvClaznrMU3KMtxAOj94zdvfKiIPm7FXSoLL4v
	 2Uzhkb70r7FJN7vW28nHLxcRiLjUB4NNMwIG/oZTJcscTDnfJga+Y4cE2ABC3L77QY
	 kxVBwDt1xsQpw==
Received: by wens.tw (Postfix, from userid 1000)
	id 4B4EC5FDC7; Tue, 21 Oct 2025 01:11:18 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] clk: sunxi-ng: sun55i-a523-r-ccu: Mark bus-r-dma as critical
Date: Tue, 21 Oct 2025 01:10:51 +0800
Message-ID: <20251020171059.2786070-6-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020171059.2786070-1-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_101140_776956_62EE7BB5 
X-CRM114-Status: GOOD (  14.80  )
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

The "bus-r-dma" clock in the A523's PRCM clock controller is also
referred to as "DMA_CLKEN_SW" or "DMA ADB400 gating". It is unclear how
this ties into the DMA controller MBUS clock gate; however if the clock
is not enabled, the DMA controller in the MCU block will fail to access
DRAM, even failing to retrieve the DMA descriptors.

Mark this clock as critical. This sort of mirrors what is done for the
main DMA controller's MBUS clock, which has a separate toggle that is
currently left out of the main clock controller driver.

Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
index 70ce0ca0cb7d..fdcdcccd0939 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
@@ -121,7 +121,7 @@ static SUNXI_CCU_GATE_HW(bus_r_ir_rx_clk, "bus-r-ir-rx",
 			 &r_apb0_clk.common.hw, 0x1cc, BIT(0), 0);
 
 static SUNXI_CCU_GATE_HW(bus_r_dma_clk, "bus-r-dma",
-			 &r_apb0_clk.common.hw, 0x1dc, BIT(0), 0);
+			 &r_apb0_clk.common.hw, 0x1dc, BIT(0), CLK_IS_CRITICAL);
 static SUNXI_CCU_GATE_HW(bus_r_rtc_clk, "bus-r-rtc",
 			 &r_apb0_clk.common.hw, 0x20c, BIT(0), 0);
 static SUNXI_CCU_GATE_HW(bus_r_cpucfg_clk, "bus-r-cpucfg",
-- 
2.47.3


