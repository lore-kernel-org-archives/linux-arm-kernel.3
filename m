Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A169FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DnRnD6o/1ia1PHzcq9EMvsC0CVcUk86zsJn1qboUEEI=; b=whdziOdNOtR9huEtsZ7Jp1XFDL
	WsXzQs59Ceyqgsd4Cjf1uSDjQWIZY6KXjj+IQ8LGV7bF2axzC8HCuf2q2a+wTVAepVePebSx6C0BC
	SrJSyY4gBydxPEZ69UdKq+7COB09URfrkz/z/JuTDXpz+lX/8lZOKuT2ADeIL7+ROU2ixVDhucmCG
	lh1/93pBY/BmWT/PUbzbdNtjoyQ3bbjX4Zmphg2w5+HhPF16HlcHxAxxLrutnnkDoPw6pWz4z7dte
	hfX8cfRB2+7/ESCBx/qMhIjtHuPZLtkA10BgAUl9T0eY17rDyBJvliBtvW9or7Ugv9uEZayHPXnp8
	O4NmDqwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7IZj-00000008Cxi-1qUf;
	Tue, 22 Apr 2025 18:42:31 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I5i-000000085Nx-2wuC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 18:11:33 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d623:9713:5a54:d77])
	by andre.telenet-ops.be with cmsmtp
	id gJBM2E0013mAuGe01JBMuu; Tue, 22 Apr 2025 20:11:22 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u7I5Q-00000001R0H-3QYx;
	Tue, 22 Apr 2025 20:11:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u7I5Y-0000000BCVX-3Y6k;
	Tue, 22 Apr 2025 20:11:20 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vinod Koul <vkoul@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dmaengine: ARM_DMA350 should depend on ARM/ARM64
Date: Tue, 22 Apr 2025 20:11:19 +0200
Message-ID: <50dbaf4ce962fa7ed0208150ca987e3083da39ec.1745345400.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_111130_880745_4D1204FD 
X-CRM114-Status: UNSURE (   9.49  )
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

The Arm DMA-350 controller is only present on Arm-based SoCs.  Hence add
dependencies on ARM and ARM64, to prevent asking the user about this
driver when configuring a kernel for a non-Arm architecture.

Fixes: 5d099706449d54b4 ("dmaengine: Add Arm DMA-350 driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/dma/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 8109f73baf10fc3b..db87dd2a07f7606e 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -95,6 +95,7 @@ config APPLE_ADMAC
 
 config ARM_DMA350
 	tristate "Arm DMA-350 support"
+	depends on ARM || ARM64 || COMPILE_TEST
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	help
-- 
2.43.0


