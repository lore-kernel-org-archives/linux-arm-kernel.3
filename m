Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49C7CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JTKWejYowm2p4DJaJvyyuvQbEpNVbY+JknPKvn9wkJo=; b=ZMp2l1rgfcQ45orEvDnAi0uhCX
	tpqWmrm7SoyOnxhhofP4JQGPTyF318Pm8wlSVOFR3zD6NAsW4pskKm83UguZXLaNERv5czBck2hT4
	eCNU8V++E7X1l5ACn1p0NubcyFTgSmOQnBEP/mzrqbPv9uBDHjtnMCHHZA8/6ihfEWQ5Pekh/VXr2
	8oo23EEwT/fWYOwZs8atzQTsTdtY7/NaHi1Fd9+CbJH5KOmXGNicVwWvOwqmsuhGlAtPcWenbLxr2
	cbOsqPFm4/3K8IJsaAllkRyMOkLokN2JwTaEgf2BT+LkG4jzACQ+thx/z2TJzz67Dov8zfn//wQoj
	LtEzXN2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqpW-0000000HEQB-1wUS;
	Mon, 05 Oct 2026 22:06:43 +0000
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqpT-0000000HEPi-43Jh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:06:41 +0000
Received: by mail-pj2-x0c.google.com with SMTP id d9443c01a7336-2e58733c31fso5718965ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791237999; x=1791842799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTKWejYowm2p4DJaJvyyuvQbEpNVbY+JknPKvn9wkJo=;
        b=FtjNlGMzcbXb/0ltx9gTIg4fm52EhUWlqA+JsHnuSsnTOcEq7cFXycWdp2SGJfBLBj
         rW2pj/SCo2jeMD9QM1eW7XUJ3h84UfiXDmojuqzkXJL1696JuhOErob7fCSKNNgAREUD
         lp4nuEefE4QYbF3VfFZ9Qk+6zUVWc3bPJJG/Eqo2WrvINqDLWR0uITxGcqLHBn8MMA6V
         ooArA+g+8cbeLaYxd1sRs/JBTi0wcPY1ijo3vwha90qEpT+on2vRdR0Dp1dh2yctDke0
         Qmgc8YIdMroDWiycFGTroh/xDgSNG8qy18qXMjCH94gVDPdvHMcKtAPgF33rjEVL+deg
         yvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791237999; x=1791842799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTKWejYowm2p4DJaJvyyuvQbEpNVbY+JknPKvn9wkJo=;
        b=Wo2umHx5Q91z+0804Kdf6n8T7fqTRWEDVDNtdAYmZlz5XJciY2Pg0UXVrtiVuGDaXn
         WSBl2+YKxbrzhS7zg+SbQPjrf9JRHIeVVc2ZwiwLelEqusbQ0d9BzmL1/tIXFQJWnU59
         yASSc1QVG5L0FqfZBPrbXyLuL6sRbI42xEwNWfYQV0gGLEpiI6ybX+bCa3+JY96hrNQt
         dJKSIiJRxY/F733vjhUMUNvgSkio7/cjzFiH021ijQQ07n+Zs5AchJqFbe+yidiA1joa
         M3ceosNxwqzmUx4dxfd5imnIaqgeuZNemE8gSrXFzYSnb/2qD1yqL+tUtdcN69FVr0Ei
         LM3w==
X-Forwarded-Encrypted: i=1; AKwUvByEJDVyV5zrUGGk0v8qs1pFEtAdH+yYPwnhOO8xwYHLnesvtpMxmAjTCAfmk5yCe+f0Tzq9mGaOcgrAfZ2gRjig@lists.infradead.org
X-Gm-Message-State: AFq9FYLnAlUYXiwaFx8FJVDACq7yxw3AriPO646rpr3OLASdVCZT1+N1
	Lzh9nsGFZ8SQyJXyuh76DwTK2Y3vBbGC2a2Z1dLet4v3WWWCMtUT0CocjjwKan5R
X-Gm-Gg: AYBFou2XSdIk2f1IiGH0BawGnTUtiLWd/OG1KA9lY7UOmr6l4b3dacsVcqichBXfKql
	UCDgdyKofwu8P16qu3qgZFdtJq2jn3ykCAvTM2BA4OWrgOCp7+rb4ojBszkBOBUrSB0TXybNfg+
	d5qPVsjgo77n6nSQ290q3V52QyOFLeslsyqtabtuSfJq6wg4yAH3vOXgE3KPNoMs5hkn12Z5XbH
	Sop9pM9Lng4UmhfrQljweUd6meRbjkmF09krZMgrpG13ifVfh9HjzsMQLARH3IDnrkZIfvc3fZp
	pupDWosU8gSxk4KiWBPUePNKSuqkrvIvm8HHA0Cnj1g9YVvMgAx9cDZYxUd9ZgAWk/35cO91GKk
	p4nB3FwS1uC7QP2YxA+T88qDSV1pG2KyLd0gEnvZG4w6FNUCUSUaJ4bPw03dzgjgB3MoiLz3nml
	q1o08itFam2eG5D+SlIzEX7sWlzdiz/9scAqx/PFG5n1QC0LpPePf6Y6dduzccRiAffFGMFmTku
	eu5CmcfedLNiToXWoFVx4P+8nvLB+iyGapSNSj/ygs5ihN4vqN49gVcZT5IVQze
X-Received: by 2002:a17:903:191:b0:2dd:c053:d741 with SMTP id d9443c01a7336-2e49b684cffmr118013695ad.40.1791237998457;
        Mon, 05 Oct 2026 15:06:38 -0700 (PDT)
Received: from LAPTOP-BEQ9FFIS.localdomain (60-250-51-133.hinet-ip.hinet.net. [60.250.51.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ecbdd3sm13723035ad.48.2026.10.05.15.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:06:31 -0700 (PDT)
From: Pin-Hao Chen <billy920225@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Mark Brown <broonie@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pin-Hao Chen <billy920225@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] spi: stm32: fix double free of SRAM buffer on MDMA fallback
Date: Tue,  6 Oct 2026 06:05:28 +0800
Message-ID: <20261005220528.7199-1-billy920225@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_150640_011013_BEE099B4 
X-CRM114-Status: GOOD (  12.46  )
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

When the "rxm2m" MDMA channel cannot be obtained, the driver frees the
SRAM buffer and falls back to DMA-only mode. However, sram_rx_buf is
left pointing to the freed buffer.

As a result, stm32_spi_unprepare_msg() may clear the released SRAM
area, while stm32_spi_remove() or a later probe error path may free the
buffer again, triggering BUG_ON() in gen_pool_free_owner().

The probe error path also checks sram_pool instead of sram_rx_buf. If
the SRAM allocation failed and a later probe step fails,
gen_pool_free() may therefore be called with an unallocated buffer.

Clear sram_rx_buf after freeing it on the MDMA fallback path and use
the buffer pointer to determine whether cleanup is needed.

Fixes: d17dd2f1d8a1 ("spi: stm32: use STM32 DMA with STM32 MDMA to enhance DDR use")
Cc: stable@vger.kernel.org
Signed-off-by: Pin-Hao Chen <billy920225@gmail.com>
---
Found by code inspection. Compile-tested only (ARM multi_v7_defconfig,
W=1 and sparse); no hardware was available for runtime testing.

 drivers/spi/spi-stm32.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index be88e62075af..605b847d8773 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -2511,6 +2511,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
 					gen_pool_free(spi->sram_pool,
 						      (unsigned long)spi->sram_rx_buf,
 						      spi->sram_rx_buf_size);
+					spi->sram_rx_buf = NULL;
 					dev_warn(&pdev->dev,
 						 "failed to request rx mdma channel, DMA only\n");
 				}
@@ -2548,7 +2549,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	if (spi->mdma_rx)
 		dma_release_channel(spi->mdma_rx);
 err_pool_free:
-	if (spi->sram_pool)
+	if (spi->sram_rx_buf)
 		gen_pool_free(spi->sram_pool, (unsigned long)spi->sram_rx_buf,
 			      spi->sram_rx_buf_size);
 	if (spi->dma_rx)

base-commit: fd99864b0ac936e870c7ae28354c5cd3dad5efd0
-- 
2.53.0


