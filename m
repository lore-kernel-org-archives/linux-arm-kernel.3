Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7596DC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 15:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G/YDrfc3Xwk7gOrxAX9QzohKyWwy1OWumC+p49dj5dE=; b=3jM6TsJ7wvx5tHDdlge79Lswmc
	4YgVyCdxlfa3OsbJHNc5Q5OlTuJnL2kqtyVPDLsvmGgq/VZrkyZRMBd91EvWS3bfNHtgiy5pbDrLB
	NN/Jef+FFHE27a92pARfuDvyzizOYjL3Xlcwmmg9vkOgcIrhukEkSnWhwAVFrkWZQl0Mm3UX3C7hl
	sOwqQYXnX+s4SmG6GNIwkzE72GlohQpC7DwqZ09Q6GG51nysFwGnuyvDGc/ZbwzvFm+3/8KQOBPBd
	MlEuXOMF1gBoZrINRnBH7QZ4mlDug0iPV81MCY6pGiBAK43jGgd+OPQHrJfiEH+hU8IDZYMEAqo8u
	ZjKER23A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5PwD-00000000zrd-2UGS;
	Sat, 12 Sep 2026 15:46:45 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5PwB-00000000zrH-2cfs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 15:46:44 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccda24afso517922a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 08:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789228002; x=1789832802; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/YDrfc3Xwk7gOrxAX9QzohKyWwy1OWumC+p49dj5dE=;
        b=OUsWi3ltbxRO55G+GZzZ3XvOSBzt6a1V+vBtiQ8g3LRrN0Uc/LBTTNNB2rWQMsUv+y
         xTCJdC6Kytnov4cw4AHH2mjWjBcPfS+JLMjeN2qmCujnFTv1g6GUphpYp/M9LbTsVyQe
         VgVslLBefiFlfDbuhcQmxT8MBGFP6mLuSZcwNyREjtFlcKnnkikHt+YPEi/rZdACBFWt
         8lRTCsoaXNvpHyFUyi7/WnOyKgYowqovaSIAsn/O09ZP6WyQaxy8RqtXt/xhgG+lgLQi
         VIBHjGgfTSHTBLBCTS2sctzZ2PEjWuma3dI9cWN42zWdYJP74DpvHT7ifbL5f6RdxiXC
         jLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789228002; x=1789832802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/YDrfc3Xwk7gOrxAX9QzohKyWwy1OWumC+p49dj5dE=;
        b=DVEZB8qShTCEYY31S8aHmmpMrOv1JN9CzMe2gFGTVBBdLaJR59lMRwcp/pNtr7mI7K
         Q5AcmBcr7vPUtCa2epqRVBptb1ZnyTUtFLURiFMrV6nUPEuA2jEMdhdQThQwnkkvAg5a
         8jrW3PrudpbSmzvQIPorDDctcssw1ne01en+RwW5lRu3XH73LEaJ1UBy5o0egGlqVuBy
         u6scmOFpZSFSCqSwXO7ZWUA5E+8dCBiAqiv2gXo6/t0y7xQS2cYJnTH2IV/rRvr3jLFu
         J+fKOPJgigijK9UnqhVnwW3pCOtYwXa5QpkVB8Kb495+SBAp+Z+ixn3jQqL06PI1wOdt
         uxcw==
X-Forwarded-Encrypted: i=1; AKwUvByqmtNbZ9JkSoJR7ZYgz5TLGH0tvMWLscATYvTokloBWya1jWBPNPf7RKCwDXLgzRxxqZDjgHsDjZZcGI8wMJC4@lists.infradead.org
X-Gm-Message-State: AFuF++k9IOKHOluvY79wUiThvvUtUxcH16L6dLtMRGAKRJQ4+rPrMXa6
	4aEwaxK7wJw133B4rlc5JdBxfK8MndWSUR5FelRvPOSlaY2d41KVLeS4
X-Gm-Gg: AYBFou0HbTrQUaH69rl5p1UGaK/rEtVuED3xqbk6gBodrQucFfC/gfkloXbb1mzdQLt
	22m9LSGscHutGSO28ZjJ1WwD0dNxD7WX3gASefcrl/u2Tn7j2dac3eUfXjsj5I0Y3dqLg7H64d6
	wek7RYmdZldtokabgiaUh7rrNyJ36A8pWWDPmQG7SxWf9+DoqT5gdahCyd5SrGKf87f3iHqntOR
	vASECPnVUVSzdVOPA9bUnxPHYFnUPL1utjWqTwldTSHmgcdhwXFdGGhRNaUz8FtPBpzmJPFemvX
	YAZsXsMLkF8y3a7+O4+tgsO8+o7G8/GR/abnvcs7fhUU9DIixBFv+jgOVMyiouCD2b1Qro8zNj2
	YnMQAKtYwo0Dm5q9RzpOxYcSWj7uq/EabRypIcoj3ZvxT2g/WZSZys/YOlwE8t98JhBSOwqRYIz
	0ZNIZTmkm43U/phPOxlwFn6jLQStsvMZPDUZp23zaHexl1bAPZTolMPDPiWMTsm6h9
X-Received: by 2002:a17:90b:586f:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39d9c386bacmr17219294a91.24.1789228002294;
        Sat, 12 Sep 2026 08:46:42 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602e7sm12214069a91.5.2026.09.12.08.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:46:41 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Ludovic Barre <ludovic.barre@st.com>,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: st_fdma: fix potential use-after-free in vchan tasklets
Date: Sat, 12 Sep 2026 23:46:29 +0800
Message-ID: <20260912154629.1021632-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_084643_675004_737BB15A 
X-CRM114-Status: GOOD (  14.69  )
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

st_fdma_probe() allocates the channel array with devm_kcalloc() and
initializes an embedded virt-dma tasklet for each st_fdma_chan through
vchan_init().

The interrupt handler calls vchan_cookie_complete() or
vchan_cyclic_callback(), which may schedule the tasklet. However,
st_fdma_remove() only frees the IRQ and does not kill already scheduled
tasklets.

devm_free_irq() prevents new interrupt handlers from running and waits
for an in-flight handler to finish, but it does not flush a tasklet
that was scheduled by a previous interrupt. Since fdev->chans is
devm-managed, the channel array is released after the remove callback
returns.

This leaves the following possible race:

  CPU0 (driver removal)                 CPU1 (IRQ / softirq)
  ---------------------                 --------------------
                                        st_fdma_irq_handler()
                                          vchan_cookie_complete()
                                            tasklet_schedule()
                                        return
                                        <tasklet pending>

  st_fdma_remove()
    devm_free_irq()
    ...
    return

  devres cleanup
    ...
    kfree(fdev->chans)                  // FREE
                                        vchan_complete()
                                          vc = from_tasklet(...)
                                          spin_lock_irq(&vc->lock)
                                                       // USE -> UAF

The pending tasklet is embedded in the devm-allocated st_fdma_chan.
Once fdev->chans is released, the tasklet and the virt_dma_chan
containing it point into freed memory. A later vchan_complete() can
therefore dereference the freed channel and cause a potential
use-after-free.

Kill all vchan tasklets after freeing the IRQ. This prevents new
interrupt handlers from scheduling them and waits for any tasklet that
is already pending or running before the channel storage can be
released.

This issue was found by manual code inspection.

Fixes: 6b4cd727eaf15 ("dmaengine: st_fdma: Add STMicroelectronics FDMA engine driver support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/st_fdma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
index d9547017f3bd..23071cbf1866 100644
--- a/drivers/dma/st_fdma.c
+++ b/drivers/dma/st_fdma.c
@@ -846,8 +846,13 @@ static int st_fdma_probe(struct platform_device *pdev)
 static void st_fdma_remove(struct platform_device *pdev)
 {
 	struct st_fdma_dev *fdev = platform_get_drvdata(pdev);
+	int i;
 
 	devm_free_irq(&pdev->dev, fdev->irq, fdev);
+
+	for (i = 0; i < fdev->nr_channels; i++)
+		tasklet_kill(&fdev->chans[i].vchan.task);
+
 	st_slim_rproc_put(fdev->slim_rproc);
 	of_dma_controller_free(pdev->dev.of_node);
 }
-- 
2.43.0


