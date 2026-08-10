Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F8FC5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkIvExABzzIA572IGBET5kLr9qvjxhndAMy4fFMeZZY=; b=mfBBtEO1xBnRRkWSyDC7iBW0Ov
	vlJZ4oVzTjaUwCAB8eUvAuPc/AFzh04GdUX4g4S3xgELlvXwDI8K60hdndu5My8saq/MFgdagApif
	ylgovF8FMeGQ4DAn16TE6uek/9WldZAcqpoGNKPqOIdFHkvvhI6DDAWeVLucF223X7fvuBvCpVVzu
	vvz5JIDXLwpOiuUJleYxSlm4sPSFZ6Z5w9JPK9Pc8gzO64dK1o7kS9xdniJmUdj2xF5YDSZKLeCYM
	rfClgZWfO0DGrMGT25JnAOe891AX3RSdiBgFOuIbfl7U13WAvvjR8B91aJp4UhgmUF/s3Lcw6r6jo
	mBi9L0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUT2-0000000CbG1-219w;
	Mon, 10 Aug 2026 18:11:20 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUT0-0000000CbEA-2ARd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:11:19 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2459985a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385478; x=1786990278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkIvExABzzIA572IGBET5kLr9qvjxhndAMy4fFMeZZY=;
        b=tDkCBFGugE0aLj5SsqZR+k/Z31zu6yZBlF7OAgpB9GDRhpkoXy/jAyyAajGDvt2BDf
         r4bbYBlNblPLcc2v7NcGHPJxtX11KpNPz1+oNe7ad7my8vZrRlW98WABePgnlo82G4Mx
         tFHvYv2YPTE5FJKoB6EYzeDAOTFXHPFpaBSlB5npMrSk+XYKHP+d4FQX5DQo/gn+3g0Z
         qV3XiT/klXFIkWIdopXx1ew04NUvWtzY1aeEBMDDJ7j1rjJ8bY+WuFwI4nEVagAl8e/2
         /hd2ttSkrSIlHdiTx6lMRXaBf8OjWuajJn7PxG2zhQWA9SqEjrGyIbC7gXxfk/q5B98n
         vYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385478; x=1786990278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkIvExABzzIA572IGBET5kLr9qvjxhndAMy4fFMeZZY=;
        b=CDkWgXjy+lwxgSIFrzKFwRXcPqSMdErbx2wP0leka5UcaBzIjzndjh+jxZ/TqHzYFC
         t69JU5N6bevhTWAFsDSiQT8QNRBki5/9ZrQnZ1vqVEXgusn7at5k7UStuxjAFSnqQdT+
         3WI0/NQq9+19vdTp3qPdZYE7Ht2SHJwuObbBKH1SShBH22HGbLhLBvlU4Y8Hr/rHpL6G
         4BCQ3LUOC8ky7C+GivnXZjWBEmznTPlH4rLb1lSVKVl7Jt1KlIADauywsU7D16bukso5
         jziEuky7duJNGTh7s1yGIBDR/RNDe2TRnFrACULPVl9L4efcy1CSZ5U6XhwhX5vkiwOz
         BWpw==
X-Forwarded-Encrypted: i=1; AHgh+RqsZL1A9UJP/WlPOoyg3TuWM6IDKNymFGiPEqSmuEyoNzQw9oDSoJfHQVsibaSWz2jxV6/4j0jXtADUYXAp3sx9@lists.infradead.org
X-Gm-Message-State: AOJu0YxVxa6Oyp69iEnyrnFkgDJIExLaYthDqdfjeyIeQF+riJszaZWI
	63j4v60cGRNJT68wNLiPtrmctU/MmFS6EoADJciHDpRIjIvO4A4wM+T5
X-Gm-Gg: AR+sD13+18KEjxbCr1dkl77elv3M1YMM2NzA/4ZZEZS9PqJ6m7KUh2/e2piwnfN11ov
	/pHcsRcNajDAYwP10D0vnIbxEtoSwm5TbxXjoLdUBiQx9oDedzitTrQwQetM2fAzBp+dzUNf0w2
	KTziU7N+KF5b8sPeb6XBybKZUhSvoSvzvgoGkTDGozR6lPbZHy7jRgxgLTkzmkzAXtmJhw2vxxJ
	9ES8+GMaWDYwyP+yBhZDDMlyTc389k46Pl1Or6PvJwI/IsOBIrTFOpFrJ5jvpB27gcGK/7VJse3
	qVx6uNxPgM1VAok/iqThyLnUSZ/GhpXxrH9W0YLXjaT/RQEfcMhxoFPTEmbLn+/zAoPGbRegMcW
	tzLyf1tnaAdDvtlvfBjaVOKsYc5RdSicyQyPmRxIyoo/4Sp3xeCbgBEicmxPHsisq38/98U4K6W
	rd5JkEe8rsJoq+6IyIMr2KGXq41lMTE7TmHYx6tscT4aSNzEvwbG11ADeJ193yX1w=
X-Received: by 2002:a17:90a:c2c4:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-392cca3507dmr3372142a91.15.1786385477700;
        Mon, 10 Aug 2026 11:11:17 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:11:17 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 03/34] dmaengine: apple-admac: use dmaengine BH callback
Date: Mon, 10 Aug 2026 11:09:04 -0700
Message-ID: <cc5172b8779e4cd15f2c1c7fa93174aaf09dbffd.1786384168.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_111118_559259_779321D8 
X-CRM114-Status: GOOD (  15.06  )
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/apple-admac.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 14a5ee14a481..c5d4fb96d3c4 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -89,7 +89,6 @@ struct admac_chan {
 	unsigned int no;
 	struct admac_data *host;
 	struct dma_chan chan;
-	struct tasklet_struct tasklet;
 
 	u32 carveout;
 
@@ -521,10 +520,7 @@ static int admac_terminate_all(struct dma_chan *chan)
 		list_add_tail(&adchan->current_tx->node, &adchan->to_free);
 		adchan->current_tx = NULL;
 	}
-	/*
-	 * Descriptors can only be freed after the tasklet
-	 * has been killed (in admac_synchronize).
-	 */
+	/* Descriptors are released once the BH is flushed in admac_synchronize */
 	list_splice_tail_init(&adchan->submitted, &adchan->to_free);
 	list_splice_tail_init(&adchan->issued, &adchan->to_free);
 	spin_unlock_irqrestore(&adchan->lock, flags);
@@ -543,7 +539,7 @@ static void admac_synchronize(struct dma_chan *chan)
 	list_splice_tail_init(&adchan->to_free, &head);
 	spin_unlock_irqrestore(&adchan->lock, flags);
 
-	tasklet_kill(&adchan->tasklet);
+	dmaengine_kill_bh(&adchan->chan);
 
 	list_for_each_entry_safe(adtx, _adtx, &head, node) {
 		list_del(&adtx->node);
@@ -662,7 +658,7 @@ static void admac_handle_status_desc_done(struct admac_data *ad, int channo)
 		tx->reclaimed_pos %= 2 * tx->buf_len;
 
 		admac_cyclic_write_desc(ad, channo, tx);
-		tasklet_schedule(&adchan->tasklet);
+		dmaengine_schedule_bh(&adchan->chan);
 	}
 	spin_unlock_irqrestore(&adchan->lock, flags);
 }
@@ -712,9 +708,9 @@ static irqreturn_t admac_interrupt(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
-static void admac_chan_tasklet(struct tasklet_struct *t)
+static void admac_chan_bh(struct dma_chan *chan)
 {
-	struct admac_chan *adchan = from_tasklet(adchan, t, tasklet);
+	struct admac_chan *adchan = to_admac_chan(chan);
 	struct admac_tx *adtx;
 	struct dmaengine_desc_callback cb;
 	struct dmaengine_result tx_result;
@@ -886,7 +882,7 @@ static int admac_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&adchan->issued);
 		INIT_LIST_HEAD(&adchan->to_free);
 		list_add_tail(&adchan->chan.device_node, &dma->channels);
-		tasklet_setup(&adchan->tasklet, admac_chan_tasklet);
+		dmaengine_init_bh(&adchan->chan, admac_chan_bh);
 	}
 
 	err = reset_control_reset(ad->rstc);
-- 
2.43.0


