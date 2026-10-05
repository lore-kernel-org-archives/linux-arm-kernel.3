Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C29CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 17:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1ah6BRYlOqcajJUdl5DlnBTDzNHXdGvo5x5zaQWEpp8=; b=Z4TfDzFPnhlwxhaHQQv09J9M9t
	hmtC+T4d7+Wa0C8INQMPM2Rr11AjJdVCo0M0XssA7n2X8A5hxke+Z5ZBC/np106nUOyN7O+xknG4d
	eGB9I7MTpFO3OoEpwrIrWxKUQnL9u56MuoApcH1TyP4dr443wIU7+hPpXCj6r2ACZBqNM8zK2p57S
	iep7I+8m8qTV5Xh8j5+FxkD6W/RPZy/E+rsfUQu63/CbCtgpHojZn8Z11Z6UHkZ3xZb/BeZGZSGyp
	HQKKiNOr3xULGCWtDIXBNzywOZHb6loo9vRU/8J5ZC4VApBhexpyRcAuWYlBWd4MPNyhe/3K6mh/y
	tfsvbniA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmJc-0000000GuC9-0dtY;
	Mon, 05 Oct 2026 17:17:28 +0000
Received: from mail.scd31.com ([205.209.125.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmJY-0000000GuBZ-0CmG;
	Mon, 05 Oct 2026 17:17:26 +0000
From: Sophie D <patches@scd31.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scd31.com; s=mail;
	t=1791220639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1ah6BRYlOqcajJUdl5DlnBTDzNHXdGvo5x5zaQWEpp8=;
	b=NkIZVHIe/NEIztwGEg5rftAncOzAtTd97OTgds4MCRjaTV/u3umbjksfKTQ9FIca5njqWK
	nMg0AiLZCR5QQctw/NiPKpQoIP2TcGME8CvMv/oxmWWUj0e3t+ysmtH0Hoqqig9DzG7SV/
	DCfTWlZTeL9Lz47VpWivUgLmhuRTkPUExavQDbOmRiOMb8I9JvaxzphsY7U/jbN0I/8cdm
	TB9YZ/dTHE8dC1mprBE1sYQ71q7dG4euLmlK+5bozG8LqXkHfzCV/qb1oh0zQU76aKH4MJ
	JDw0USNlv8wLTnmUEVuTsch++5vFwgnc06pl333eMOUBVHLENZlQmZei4I6Rcg==
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sophie D <patches@scd31.com>
Subject: [PATCH] clk: mediatek: mt2701: Enable all subsystem clocks by default
Date: Mon,  5 Oct 2026 13:17:05 -0400
Message-ID: <20261005171706.2164743-1-patches@scd31.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_101724_195036_444282C2 
X-CRM114-Status: UNSURE (   8.14  )
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

Only the core MT2701 clock driver is enabled by default when building
for ARCH_MEDIATEK on ARM; none of the subsystem clock drivers are. As a
result, multi_v7_defconfig produces a kernel where Ethernet, PCIe, USB,
display, GPU and audio do not work on MT7623 boards such as the Banana
Pi BPI-R2, as their clocks live in ethsys, hifsys, mmsys, g3dsys and
audsys.

Default all of the MT2701 subsystem clock drivers to
COMMON_CLK_MT2701, in line with newer SoCs such as MT8173, MT8183 and
MT7986.

Signed-off-by: Sophie D <patches@scd31.com>
---
 drivers/clk/mediatek/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 0e8dd82aa84e..a449ec878abc 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -29,48 +29,56 @@ config COMMON_CLK_MT2701
 config COMMON_CLK_MT2701_MMSYS
 	bool "Clock driver for MediaTek MT2701 mmsys"
 	depends on COMMON_CLK_MT2701
+	default COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 mmsys clocks.
 
 config COMMON_CLK_MT2701_IMGSYS
 	bool "Clock driver for MediaTek MT2701 imgsys"
 	depends on COMMON_CLK_MT2701
+	default COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 imgsys clocks.
 
 config COMMON_CLK_MT2701_VDECSYS
 	bool "Clock driver for MediaTek MT2701 vdecsys"
 	depends on COMMON_CLK_MT2701
+	default COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 vdecsys clocks.
 
 config COMMON_CLK_MT2701_HIFSYS
 	bool "Clock driver for MediaTek MT2701 hifsys"
 	depends on COMMON_CLK_MT2701
+	default COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 hifsys clocks.
 
 config COMMON_CLK_MT2701_ETHSYS
 	bool "Clock driver for MediaTek MT2701 ethsys"
 	depends on COMMON_CLK_MT2701
+	default COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 ethsys clocks.
 
 config COMMON_CLK_MT2701_BDPSYS
 	bool "Clock driver for MediaTek MT2701 bdpsys"
 	depends on COMMON_CLK_MT2701
+	default COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 bdpsys clocks.
 
 config COMMON_CLK_MT2701_AUDSYS
 	bool "Clock driver for Mediatek MT2701 audsys"
 	depends on COMMON_CLK_MT2701
+	default COMMON_CLK_MT2701
 	help
 	  This driver supports Mediatek MT2701 audsys clocks.
 
 config COMMON_CLK_MT2701_G3DSYS
 	bool "Clock driver for MediaTek MT2701 g3dsys"
 	depends on COMMON_CLK_MT2701
+	default COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 g3dsys clocks.
 
-- 
2.55.0


