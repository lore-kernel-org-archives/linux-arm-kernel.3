Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074D5F483D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ed3P8O9QYypmWfRQckgpHgWLqQHsZPKvjKFf9kOO/l0=; b=oTX8CKRGcTI04Oha4eI3LxMXmJ
	vmFq8BvaT75m6yT1eVepJ26R9bNhdTXjVU2dJ8F1I+h52uC+bJEUyu/udeOnQv6WrJncel3uAw6/E
	9ktASTjYLDqB7cIfHxB01hRqepIdoahgjfkk1ybKqDmrkXf4Chj77XLofJ06/vMyaKdmS0wCGHRlJ
	lrbo6QOsnc1xhSSXiZNEMmg6KjZm5Dj+83GWVxEjJKqyMVEBsg9Tf4WSHdWicyr08fXN9c25v/mFh
	WIFAxDKSgZ2RJBpKhxGhNjzVMgcweGIIgLe2PnyzMSbR/2BUuusQqiZvnLE4LuCBhxqnZVoa52ewU
	rscAqeKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iwA-0000000HDMX-2w1b;
	Mon, 23 Mar 2026 17:19:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iw8-0000000HDM9-3VCI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 17:19:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05B8343D84;
	Mon, 23 Mar 2026 17:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B95C4CEF7;
	Mon, 23 Mar 2026 17:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774286371;
	bh=/iM84VPZCJwEWriacUA4NUmZx+hreQbQHgkrGVWtHdc=;
	h=From:To:Cc:Subject:Date:From;
	b=fhONbQEkPslS3qtm+EAtHY/CfcG2+pp+oN5Vm2hcMwJKdy6R65wRJpCWLHk94jN8Q
	 guJUpXg3mn534+8/AbzAKAGBiey3O6z7mBvbroUA22zg/lL/JfTntc/An/ZDboiMeo
	 HwD3jYT+DAmFqlfmEHLgZD5K/lD2DEAyMhq5KLPgUnslrXpROYsAcdDRkUSScv07ri
	 zOxNFN0huRjCBSOyxk58d+AptK9sIqM3cw485Qd0+DWmKzLv45RMEc/KRsrC+MNvu7
	 19em4OyG93NLEklgPn8MoCTlaKRQkvthFps6YfLXZVgZLdDiK8cZe2zE9bNobT1dsi
	 loxQec1NGKi/A==
Received: by wens.tw (Postfix, from userid 1000)
	id 9ED165FBE4; Tue, 24 Mar 2026 01:19:28 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: sun55i: Fix r-spi DMA
Date: Tue, 24 Mar 2026 01:19:26 +0800
Message-ID: <20260323171927.1256507-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_101932_888603_4D6FB962 
X-CRM114-Status: GOOD (  12.67  )
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

r-spi has DRQs for both the main and MCU DMA controllers on the A523 SoC
family, however it seems it that it is mainly routed to the MCU DMA
controller, with no obvious way to change it.

Change the DMA channels of r-spi to the MCU so that it works properly.

Fixes: 1bec3bd1f839 ("arm64: dts: allwinner: sun55i: Add SPI controllers")
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 56d4e5862ff4..34d7547a6004 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -1018,7 +1018,7 @@ r_spi0: spi@7092000 {
 			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&r_ccu CLK_BUS_R_SPI>, <&r_ccu CLK_R_SPI>;
 			clock-names = "ahb", "mod";
-			dmas = <&dma 53>, <&dma 53>;
+			dmas = <&mcu_dma 13>, <&mcu_dma 13>;
 			dma-names = "rx", "tx";
 			resets = <&r_ccu RST_BUS_R_SPI>;
 			status = "disabled";
-- 
2.47.3


