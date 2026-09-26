Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB91C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 17:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F0/79LdVzvZe+TAFF8pS9QgkNB/YVyvKTl0/c5RoqxI=; b=ByBsvKrcb2ugJ5XaXqjBjgMqlL
	QUygfcV836S7tZDd5ocLYNctjgRsXiRirL35C+2ExKKhu+zN6KXl9dYKnGT0onpKXLZKZG3tp1PPw
	MQwmc0W2ln6vDLID/PfbYyWG+zniSZGF2trL9sse0ozk52aqTuSVfWTppMdfZvQlZUpoALus7Lti+
	tb3/tu90VpoIXym1puDKJRYOiiUrROg0ULKY5b1KXtZTL6HB6oZDBOSv0OCoSpABvVqJbzexJy6gD
	mx0QTs+YPMhcEkTTuBAZfu3M0AlBOerneM54uOPfa6QCsqUongYyVG26Bdf4b3eZb+NcWK141Gv2w
	rCqw+KQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAVvS-0000000FfZ9-3ZmU;
	Sat, 26 Sep 2026 17:11:02 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAVvO-0000000FfYm-049E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 17:11:01 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-39e0e245eadso689030a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 10:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790442657; x=1791047457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0/79LdVzvZe+TAFF8pS9QgkNB/YVyvKTl0/c5RoqxI=;
        b=tlTOTpvBxdO9ZALC20s5SKVRJoH4TLlNw9c9wG70l+ivRE5xfrQpkbInS0eEdPQS0+
         PYAZwSqRsCmnmU6zxFWkDxv4xTSGdx4H7sT8iBXu3MROB2dkj3Gp2PIHtaSEyBuwUmLC
         rUkiQicg40sLHn5tMuZMDsQ0XLM2s05AaV0FZ3Kod1R5r0eLDH7SaPaj439k5fbZ7kfJ
         m+0Oep1YA0pMAJRcHAkcmOWV8BhXI0xyvWNibTD9kfRFi+56YYx0Gkq6ZF7V+a38voE6
         O0g52qIZZc9EpYTSuS/RILDkLdwhilK5ZePWRWmcw6XSnu99Ijo3RQaRVw0bHn8bOAV1
         0zhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442657; x=1791047457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0/79LdVzvZe+TAFF8pS9QgkNB/YVyvKTl0/c5RoqxI=;
        b=hEAbeBRcs7SYukLmmoeHVR+DGVNirjFv8nmKIwxfSoznAnOuVYf7aPeZbWrRzho7iT
         WvNyr0YyYwKNG0t9lwqlutMBTUgV/9tttCdwDjLidNwAzREo93p7/369SdW7onS4Cj5n
         FOIvL9WbozLtPiYLq+Dx41p/aLbxk+OcJ/MEje2e3uidFRqrKB1xcYzxWlyuF0EN4c3a
         k1swfAiafTsBqRM1DeUmzTvg7b9uEQXSXmiVBOTvoJRy747AzNtHx3kncW0wD1I2FfJT
         TLuVEcTWCbNGkc4ATA/So/W0f7GnGxUeP/mWCkrfGGCgV1XgbiC/l2VRxroBuC6BUoys
         BTlg==
X-Forwarded-Encrypted: i=1; AKwUvBx9qzdlmV3s4xNEikwXekcgO5eeT4Iz6vAZ7Y321FQmmHH6pGfRBxco+/78sPMNwMR/ozpfQ5vKOS2k+qw3K7Wg@lists.infradead.org
X-Gm-Message-State: AFq9FYKxOZ3I2qqvavQ5fpfJiF7md5urHLS74fWQYvFZmj5q75I2LlCP
	vAuijmaG/Z+YUN5L9VPqgEFaUMtMSSz0QHvalAljOGK1A5k9jX3AOxIztVYmjgSH6foL
X-Gm-Gg: AYBFou0yJjp5eto05DubJKVWCGhgvCxO1gikVJBYPpOcOl2EqWdjL+Hb2QlQL1Qv/AR
	mHC9JlikuBcPaT4myb33lxPbrW/Bg2QiyTdT3NE+4FXL4kqvJpenq8lQkpFBBWW8O/dkmcMkko3
	FvDhE187uJX51JE6HkdeVwMM5B+37oMOlTQBWNLc2jNd8FBEJMBuIGy2E/qg2ujZoy47P06Gzo1
	F6zP6Kpaz+6UIdr7IsE10T5v8noe/d5lA0yvjgs/KBdP4aiqHr0OhjxIf0cw64HUSmkXQmUznZK
	QsHr2lqYYwWY0lf/5GHbhJ8vcPfbQY5iI/3+D6CGSwgeW9U4CvTHehFXqroWRuOAGoD+sqTaqW9
	fRS9Z4eVg4GNGaYXGDyMgL3GRk39hjB+jvA9PBnc4gfS4HhZkHnITSLECZhVwahxO0U6IWc6aq7
	9EANBpQgPKB1kheTupeoZ3dvOggm1BLgHJFTYeqns8EtbWeEGgq6/SbEWAaYSpKeCLQQ==
X-Received: by 2002:a17:90b:4c42:b0:39e:4c80:f680 with SMTP id 98e67ed59e1d1-3a098bb66d1mr8321977a91.31.1790442656808;
        Sat, 26 Sep 2026 10:10:56 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c7435sm17467136a91.11.2026.09.26.10.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:10:55 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chengfeng Ye <dg573847474@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog,
	stable@vger.kernel.org
Subject: [PATCH v3] dmaengine: sun6i: Fix potential deadlock on &sdev->lock
Date: Sun, 27 Sep 2026 00:10:49 +0700
Message-Id: <20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_101058_072244_B3C3D0E3 
X-CRM114-Status: GOOD (  13.61  )
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

From: Chengfeng Ye <dg573847474@gmail.com>

As &sdev->lock is taken by the tasklet sun6i_dma_tasklet() in softirq
context, other users of the lock in process context should disable
interrupts, otherwise the tasklet can preempt a holder of the lock on
the same CPU and deadlock. sun6i_dma_terminate_all() and
sun6i_dma_pause() take it without disabling interrupts.

This was found by an experimental static analysis tool for irq-related
deadlocks. Lockdep reports it too on an Allwinner T113, where the lock
is also taken inside the HARDIRQ-safe vc->lock:

  [  299.389380] WARNING: possible irq lock inversion dependency detected
  [  299.411196] c7109568 (&sdc->lock){+.-.}-{3:3}, at: sun6i_dma_terminate_all+0x40/0x2c4
  [  299.419137] but this lock was taken by another, HARDIRQ-safe lock in the past:
  [  299.426398]  (&vc->lock){-.-.}-{3:3}

Use spin_lock_irqsave() in both places, as
sun6i_dma_free_chan_resources() already does.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
[tien: rebased, added the lockdep report from a T113, Fixes and Cc stable]
Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
I ran into this on a MangoPi MQ-Dual (Allwinner T113-S3): with lockdep
on, stopping dmatest set off the report above in
sun6i_dma_terminate_all(), and a small test module set it off in
sun6i_dma_pause(). While looking for a fix I found Chengfeng's v2 from
2023. It never got a review and no longer applies, so I rebased it on
dmaengine next and added the lockdep report, a Fixes tag and Cc stable.
Chengfeng, I hope you don't mind me picking it up.

With it, lockdep stays quiet on both paths on 7.3-rc4, and dmatest on
four channels passes while another channel is paused, resumed and
terminated in a loop.

v2: https://lore.kernel.org/20230726051727.64088-1-dg573847474@gmail.com

 drivers/dma/sun6i-dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 5ad9d01cf..aee32363c 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -887,6 +887,7 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct sun6i_pchan *pchan = vchan->phy;
+	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
@@ -894,9 +895,9 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else {
-		spin_lock(&sdev->lock);
+		spin_lock_irqsave(&sdev->lock, flags);
 		list_del_init(&vchan->node);
-		spin_unlock(&sdev->lock);
+		spin_unlock_irqrestore(&sdev->lock, flags);
 	}
 
 	return 0;
@@ -935,9 +936,9 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	unsigned long flags;
 	LIST_HEAD(head);
 
-	spin_lock(&sdev->lock);
+	spin_lock_irqsave(&sdev->lock, flags);
 	list_del_init(&vchan->node);
-	spin_unlock(&sdev->lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	spin_lock_irqsave(&vchan->vc.lock, flags);
 

base-commit: 0a8dda0a15d3926422d286567f945a05328a4ac6
-- 
2.34.1


