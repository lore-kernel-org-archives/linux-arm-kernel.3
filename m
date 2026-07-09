Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060D1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OCRzdCSERGvBB+/Kvw1HbjN2Fem8/eJA4BHgbdJMUDk=; b=QBCOK8K0yWNRboWL8RoicFr3/N
	o6WRwewyvdfCf1vLaUvdPLQgYHAzy01nCoLr1NG9W/rGcKqjFA6+i9J5VPXxNxfcsfg4mG3T9o+yN
	BGeBGZIF7KxQ0ogQyxsM834s3rneWKFsGY1DX+psUCBmey8FTdh7ks+NzLAFnIOAxe7WRVGDleypR
	0fxer/YzXsEkq7GqCKIDSEcaveUA6f/redfH1c8iPtACBQVsxwUghs8SsNHYDjnbVMS/TKol485vQ
	9kiSQQqlQptP8Vo6LSHpJxIrtcQwbo8nImNvQv3QR4ZBEMYAIfB64bO+AHUzn02OzzoCyX/wYgr2k
	AGr4dVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmIN-000000020nd-40IZ;
	Thu, 09 Jul 2026 10:47:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmIL-000000020nH-3y4I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:47:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 53A4643745;
	Thu,  9 Jul 2026 10:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862141F000E9;
	Thu,  9 Jul 2026 10:47:51 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Huy Bui <huy.bui.wm@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marek Vasut <marek.vasut@mailbox.org>
Subject: [PATCH] soc: renesas: r8a78000: Drop duplicate "default ARCH_RENESAS"
Date: Thu,  9 Jul 2026 12:47:44 +0200
Message-ID: <64de6e95719a6dec7412cf7e917a42749e738b99.1783593775.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Kconfig entry for ARCH_R8A78000 contains both "default y if
ARCH_RENESAS" and "default ARCH_RENESAS", which are sort-of duplicates.

Drop the latter, to restore consistency with the other ARM64 entries.

Fixes: 5284d0b09d1bdc69 ("soc: renesas: Identify R-Car X5H")
Reported-by: Marek Vasut <marek.vasut@mailbox.org>
Closes: https://lore.kernel.org/a069d50d-030d-4189-ae9d-37f989829da4@mailbox.org
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v7.3.

 drivers/soc/renesas/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 8a625bc17091773f..e0ce51a9912beabe 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -356,7 +356,6 @@ config ARCH_R8A779H0
 config ARCH_R8A78000
 	bool "ARM64 Platform support for R8A78000 (R-Car X5H)"
 	default y if ARCH_RENESAS
-	default ARCH_RENESAS
 	select ARCH_RCAR_GEN5
 	help
 	  This enables support for the Renesas R-Car X5H SoC.
-- 
2.43.0


