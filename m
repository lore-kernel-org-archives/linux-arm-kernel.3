Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CD4C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PloKXYxQeao5LyBqd6CNUwy0u74eRsiezTlXOqTheC8=; b=QUAzBqDJhW8dPO385Iql5UniA+
	OlhH9TUc/l13DykpTwcf/8YVl5H/TMWSAhEw6TLELoOY2fqiO2GIJ8dAH5XbTQ509AdMU2FcISdOy
	0pXnTlkGF7nHiDjO3N77pYS+Lsrj9d1vQOdjRRVuh9DdJe36IEwot1fkbw0pmVlxZ/wjUXMya6h8v
	u+jg6oVyjPYpVZtU43WLBkKnnlv2l9NSQqjV7ZTF+8p1hPr6ZsnzxcmWRj73llvOlvgg+05fnZZ1H
	gIvT49MovQDRqbFw1a8eYZu+Wc8FgG+TkJSOnD4fnV4KVlmLe4hiRNYPTb4eafI6DafGnBE/8s+ft
	4jXRqSlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3T7s-000000063Fu-2Ttj;
	Mon, 07 Sep 2026 06:46:44 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3T7p-000000063F7-17Hz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:46:43 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3478424a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 23:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763600; x=1789368400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PloKXYxQeao5LyBqd6CNUwy0u74eRsiezTlXOqTheC8=;
        b=dUZYFRpe88rx2D5+hjd2f9ptBjA4j6E/TgPAh3pm02O4QRQ+bJnGLEKViB6biNUXdS
         W+GDmGDatzaNwWuYxdXDhcTGcX42PszQX+lZ9RFT/gh0aR9Dju6HcVri8xU+Cqrnjp2t
         kMzXzvYzkvUbtiiPuBnt3+W1/YkFzDnPWUzKQn1R/1U1AiqyjTa7NB4rZmvihsHvzPxE
         fBV+vv102eViAJH1OMoeEg631gk+bsD5kt8yjYKZmM8VEud21REmTp35UCzlupEFwnG7
         r79GAJh4F9iDY8VX7/KYcWS+cBx7UDE4frs8uBg3LpUuqHpUQQtYxHGQMMn9LldF6HwZ
         LEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763600; x=1789368400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PloKXYxQeao5LyBqd6CNUwy0u74eRsiezTlXOqTheC8=;
        b=kvv6teEZb0kTkUm4bBmwhXjsrBp5If0i/WQDwoKOelMF/MfbSKyJLXYoxZSh10MCJp
         Lio4MLWfJWu701jfPwOoD6w6zRDOUVg/qcRN0vXLQY0mpZzrXw+NtROJRH+DKRbznqdx
         ytSwr9VgkR6DlAUIUk9QR+Si3pKmchFQvXAvZOSKrYn1pDsOqqG0V1D+jKa1z04mMfnq
         Ka9NvzJQMWuCXLtBc1tDblvFhUbiCahiLQZDIj3yJ++Z2v1xctFhgYYLXOFhk07GTKqa
         IWUmUt9q/G0Lkco/dy6zVhVIBSGhKC3udfhpEtKGQrCRKuV9kXTwKno1zS5dEGh95QIq
         KONA==
X-Forwarded-Encrypted: i=1; AKwUvBz7043g6Vr39LZ2iCYMd+PUlAwwkEx77Nh7ORu78ZzNca3QZ2kowAAoFIv/yLUuE+cIj7gllz8DpEHkygea4GM6@lists.infradead.org
X-Gm-Message-State: AFuF++lIdh3vbsa59WOMV9hxD/B6MBsDeakuHouHi7ucscrLn4jDVqwE
	OPjSNqyH2GUiLMYKECfEmxhXtEsX7EhwiSnmwsmtWyuJSNhXCCcheuba
X-Gm-Gg: AYBFou3drAVu94j3pUh6jgs35+6FmycRJPI3sryLyw3dPjGHBHVgUNDxXYCPV9FHrdh
	QGNBOWUOWeDg+CLDU2RBJf+kbH+BvWlXBjrl43lYNY+jdQbrF4kvy25Gon9rHOk/Ws11HrqPjna
	YPG9+Uswje5BWVqpk9UxyJ8sjRw/BT4Mj9DErjjGFCQ0qIIOfTuUFajiYO2IXK87IWT8feJnHkG
	MA8A4z52kT/PhlZB83bEQ5FF2UqrLFT4fMd1s+cACWma2f3hjPjVgHkpToA7r61ELw70ROCdB3f
	20Mmtyrhd3WRUN4YCMJ/QY/i8rs7A2edg5jAWRmFilxP5BCGQzB6BT9TBiRHYdO0VxT3+Ztc0Vi
	6UM9Uf3Lh4Vz8iUXAzQAc84dN3AVhdfns8w3+To82MhZSNyWfT2buqzrsK2uYNUJ95MFXqVhncK
	5SkQZOriwR7uaFU/Lcn+cnMO8NtnAxQhhcWxzD8qfNxi27PbH67cY2m9o+jqyZ+CNsWNPw9zAKP
	c25Oscz0+keeA==
X-Received: by 2002:a17:90b:57cd:b0:398:c150:e7b3 with SMTP id 98e67ed59e1d1-39b2609f356mr34710524a91.4.1788763600149;
        Sun, 06 Sep 2026 23:46:40 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm25401130eec.19.2026.09.06.23.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:46:39 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] mmc: fix typos in comments
Date: Mon,  7 Sep 2026 12:16:32 +0530
Message-ID: <20260907064632.8926-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_234641_315524_E1438C69 
X-CRM114-Status: GOOD (  27.58  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/memstick/core/ms_block.c  | 2 +-
 drivers/memstick/host/r592.c      | 2 +-
 drivers/mmc/core/block.c          | 2 +-
 drivers/mmc/core/core.c           | 2 +-
 drivers/mmc/core/mmc.c            | 2 +-
 drivers/mmc/host/bcm2835.c        | 2 +-
 drivers/mmc/host/dw_mmc.h         | 2 +-
 drivers/mmc/host/mvsdio.c         | 2 +-
 drivers/mmc/host/sdhci-msm.c      | 2 +-
 drivers/mmc/host/sdhci-of-esdhc.c | 2 +-
 drivers/mmc/host/sdhci-omap.c     | 2 +-
 drivers/mmc/host/sdhci.h          | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index ce33907bfc24..e2bf563ccbe1 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -720,7 +720,7 @@ static int h_msb_parallel_switch(struct memstick_dev *card,
 
 static int msb_switch_to_parallel(struct msb_data *msb);
 
-/* Reset the card, to guard against hw errors beeing treated as bad blocks */
+/* Reset the card, to guard against hw errors being treated as bad blocks */
 static int msb_reset(struct msb_data *msb, bool full)
 {
 
diff --git a/drivers/memstick/host/r592.c b/drivers/memstick/host/r592.c
index 605b2265536f..dc3de63901be 100644
--- a/drivers/memstick/host/r592.c
+++ b/drivers/memstick/host/r592.c
@@ -289,7 +289,7 @@ static int r592_transfer_fifo_dma(struct r592_device *dev)
 	dev->dma_error = 0;
 	reinit_completion(&dev->dma_done);
 
-	/* TODO: hidden assumption about nenth beeing always 1 */
+	/* TODO: hidden assumption about nenth being always 1 */
 	sg_count = dma_map_sg(&dev->pci_dev->dev, &dev->req->sg, 1, is_write ?
 			      DMA_TO_DEVICE : DMA_FROM_DEVICE);
 
diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index e760d13ee325..a02bb2fee874 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -86,7 +86,7 @@ MODULE_ALIAS("mmc:block");
 static DEFINE_MUTEX(block_mutex);
 
 /*
- * The defaults come from config options but can be overriden by module
+ * The defaults come from config options but can be overridden by module
  * or bootarg options.
  */
 static int perdev_minors = CONFIG_MMC_BLOCK_MINORS;
diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 29e80e5f928e..08d41f0996de 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -2004,7 +2004,7 @@ unsigned int mmc_calc_max_discard(struct mmc_card *card)
 
 	/*
 	 * Without erase_group_def set, MMC erase timeout depends on clock
-	 * frequence which can change.  In that case, the best choice is
+	 * frequency which can change.  In that case, the best choice is
 	 * just the preferred erase size.
 	 */
 	if (mmc_card_mmc(card) && !(card->ext_csd.erase_group_def & 1))
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 05444ecf3909..a02b04938e1a 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -1015,7 +1015,7 @@ static void mmc_set_bus_speed(struct mmc_card *card)
 }
 
 /*
- * Select the bus width amoung 4-bit and 8-bit(SDR).
+ * Select the bus width among 4-bit and 8-bit(SDR).
  * If the bus width is changed successfully, return the selected width value.
  * Zero is returned instead of error value if the wide width is not supported.
  */
diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index c949a3eaae79..efd1903c3ccd 100644
--- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -1095,7 +1095,7 @@ static void bcm2835_set_clock(struct bcm2835_host *host, unsigned int clock)
 	int div;
 
 	/* The SDCDIV register has 11 bits, and holds (div - 2).  But
-	 * in data mode the max is 50MHz wihout a minimum, and only
+	 * in data mode the max is 50MHz without a minimum, and only
 	 * the bottom 3 bits are used. Since the switch over is
 	 * automatic (unless we have marked the card as slow...),
 	 * chosen values have to make sense in both modes.  Ident mode
diff --git a/drivers/mmc/host/dw_mmc.h b/drivers/mmc/host/dw_mmc.h
index 38610c89d54a..d500a419e2cf 100644
--- a/drivers/mmc/host/dw_mmc.h
+++ b/drivers/mmc/host/dw_mmc.h
@@ -69,7 +69,7 @@ struct dw_mci_dma_slave {
  * @cmd: The command currently being sent to the card, or NULL.
  * @data: The data currently being transferred, or NULL if no data
  *	transfer is in progress.
- * @stop_abort: The command currently prepared for stoping transfer.
+ * @stop_abort: The command currently prepared for stopping transfer.
  * @prev_blksz: The former transfer blksz record.
  * @timing: Record of current ios timing.
  * @use_dma: Which DMA channel is in use for the current transfer, zero
diff --git a/drivers/mmc/host/mvsdio.c b/drivers/mmc/host/mvsdio.c
index cf705b265e21..7d86426c6001 100644
--- a/drivers/mmc/host/mvsdio.c
+++ b/drivers/mmc/host/mvsdio.c
@@ -717,7 +717,7 @@ static int mvsd_probe(struct platform_device *pdev)
 	/*
 	 * Some non-DT platforms do not pass a clock, and the clock
 	 * frequency is passed through platform_data. On DT platforms,
-	 * a clock must always be passed, even if there is no gatable
+	 * a clock must always be passed, even if there is no gateable
 	 * clock associated to the SDIO interface (it can simply be a
 	 * fixed rate clock).
 	 */
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4aff965f0e2e..b229545d9db5 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1770,7 +1770,7 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
 
 	/*
 	 * The driver has to acknowledge the interrupt, switch voltages and
-	 * report back if it succeded or not to this register. The voltage
+	 * report back if it succeeded or not to this register. The voltage
 	 * switches are handled by the sdhci core, so just report success.
 	 */
 	msm_host_writel(msm_host, irq_ack, host,
diff --git a/drivers/mmc/host/sdhci-of-esdhc.c b/drivers/mmc/host/sdhci-of-esdhc.c
index 8345e2c5a034..1ca3562d8f73 100644
--- a/drivers/mmc/host/sdhci-of-esdhc.c
+++ b/drivers/mmc/host/sdhci-of-esdhc.c
@@ -1381,7 +1381,7 @@ static void esdhc_init(struct platform_device *pdev, struct sdhci_host *host)
 	if (!IS_ERR(clk)) {
 		/*
 		 * esdhc->peripheral_clock would be assigned with a value
-		 * which is eSDHC base clock when use periperal clock.
+		 * which is eSDHC base clock when use peripheral clock.
 		 * For some platforms, the clock value got by common clk
 		 * API is peripheral clock while the eSDHC base clock is
 		 * 1/2 peripheral clock.
diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
index b5d7c1a80a92..7a198fb26628 100644
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -332,7 +332,7 @@ static int sdhci_omap_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	u32 reg;
 	int i;
 
-	/* clock tuning is not needed for upto 52MHz */
+	/* clock tuning is not needed for up to 52MHz */
 	if (ios->clock <= 52000000)
 		return 0;
 
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index f0fd81409a86..98c1fe20bfcd 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -409,7 +409,7 @@ struct sdhci_adma2_64_desc {
 #define SDHCI_MAX_MRQS		2
 
 /*
- * 48bit command and 136 bit response in 100KHz clock could take upto 2.48ms.
+ * 48bit command and 136 bit response in 100KHz clock could take up to 2.48ms.
  * However since the start time of the command, the time between
  * command and response, and the time between response and start of data is
  * not known, set the command transfer time to 10ms.
-- 
2.48.1


