Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD5BCFA441
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 21:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P24ZwueATmmFiOvrJQuAm0n726FzP3i5Dl+aNCxVFXI=; b=qHrvs/5npAOYtqq0SyaJr9xYmB
	eRkdcnVV3ZPuqRBdb+lskgr6MPkoUnFSQeBssSZC2RbmLMTcyRs2cTTwiInHBZ0BfwxlbKJvShJBG
	ejbTaAtomZy3HhNUIoP2X+Hm0rq+o+asb8Z/7aSCJELkUB+XYPA4dVrFhkbvWeBWeHDrP9/+nKMYL
	ePtB02ehxFsWrHKVBIH3tn/YLm3lXTaPBmi3eJCglV29+iH34FnJVkOU6ECQC0TO6SLXwMhfOo9xv
	3S2XH45Kd4OsA6GU3t3pKa/Et9PwWVF+0NIMOveL/YzfItKzvtTKCp4AYFjzAGiddgDWXqUAPEpLy
	kLBZaigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCM0-00000007THk-1UoZ;
	Thu, 20 Nov 2025 21:38:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCLx-00000007TGC-2ESf;
	Thu, 20 Nov 2025 21:38:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C1F041997;
	Thu, 20 Nov 2025 21:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC99AC4CEF1;
	Thu, 20 Nov 2025 21:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763674689;
	bh=AffBdJpBJNkMq6q+gab85JaLyJuW8lq6N0V1nRo4XCs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bj8mutabVPHyktTyLd9TY5vo/A8XPwZ6BREa1Usx2c8WN6k7j6Jkc0qfXaPWMUpiX
	 MAkKwwCXMgPpkNxJGCvEBOeSL3XaXD3HhpGnjhtIkppzOFik2EMCPB+BOGzrwSLAEg
	 aJsNaGxWn+5sznzZ856zKaYLJVveTVeQ6xH6IhNU/5ZGBKPDD/He5sFpZNEAIo47m8
	 8yM2tX5cMp6DTyakQtZ/eeM2Qo1v5Ga9ewWG+7lQcBcGBGZTxlrZekWO0FylPy9g+Y
	 frAzCbHSMPD4+J0DzoScvnlJPTRUnCnALHyOeKe/I/zDvRtMG3ngmWaKQZuhUJhiBr
	 /WQLkhWnatK+Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 20 Nov 2025 15:37:50 -0600
Subject: [PATCH v2 1/3] mtd: nand: atmel: Defer probe if SRAM is missing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-at91-probe-v2-1-8c8592f02e8e@kernel.org>
References: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
In-Reply-To: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_133809_593780_480B6A2C 
X-CRM114-Status: GOOD (  11.22  )
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

The Atmel NAND controller driver depends on an SRAM pool and has an
implicit assumption that the SRAM pool has already been created.
Changing the initcall ordering can break this. Unfortunately, fw_devlink
can't save us here as there's not a standard property to track the
dependency. So it's up to deferring probe to save us.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 83ba4ebd02d4..e60998eb754b 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -2306,7 +2306,7 @@ atmel_hsmc_nand_controller_init(struct atmel_hsmc_nand_controller *nc)
 					 "atmel,nfc-sram", 0);
 	if (!nc->sram.pool) {
 		dev_err(nc->base.dev, "Missing SRAM\n");
-		return -ENOMEM;
+		return -EPROBE_DEFER;
 	}
 
 	nc->sram.virt = (void __iomem *)gen_pool_dma_alloc(nc->sram.pool,

-- 
2.51.0


