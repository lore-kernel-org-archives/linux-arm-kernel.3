Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393A8C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhfEAW8BttSC81TlBFp6AqcN9U05iRvrtOjyjSXhehI=; b=RCi/6mohEfvZn9uskWDLrQjDrv
	VWZ5aEC4sfPa2SXRF53vvwyqpGGiNLUFRm9J9Hsulk1vHxsuhDK3nYZWiJwkaXOtvx0HV3JzkgSOM
	YNzgrB/lTLpj0pYEjKwOElf1D6fTjR8wfsKrJ0/KfpIYU/MurrnfRuT29ZKl18BM7/CzLdY7yJu0e
	L88ozSCUh+rIDo6tRDXd0kGz5Uz09Fav4mnPMHbjzeOkpVLDCwhbtuKlsWXWOdRPoDMOHbHOPlKDm
	0crvnEd36O33kh6MLHldMFAxMXBeKay7HcMUVZABaEs/chb+q9qaD6tc5Gzf05+UIf2bVX7jWzzoH
	2+GIyFdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUUP-0000000CbrA-0mH9;
	Mon, 10 Aug 2026 18:12:45 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUUM-0000000Cbpl-2tH3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:12:43 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38e347638adso2454912a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385562; x=1786990362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhfEAW8BttSC81TlBFp6AqcN9U05iRvrtOjyjSXhehI=;
        b=UCVX7ptCdLfL1a4G9ON9BtA4WZxXwUX99URJvL18cO727WSsfVVxpRoen/JSI5ScG4
         7MftHMvE427+SfoUEed3Ak5shgdV3O30LK9xcFvJ5+NzUkYfH7tZbme2NTTN6DPPfbNn
         i9z2p+flCTn1hnn28Cztc6Tifp/lKevyY82eHOn7lbJM0SlnHBBRhVAvJsJ2UQpQzUuu
         9qvuItLaOqrpyMUag0gfWox1ej9VD7pU+2ZVSdpj+GuaxJfg+LQfsy6FsdYGgHG2Zi/z
         +iqbUGR4kZOPbRlGiYux3mHO8TyzR7vbGDh9cYgsSwqqX2+X0KamKJdUicmBv6eF9/O1
         tR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385562; x=1786990362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XhfEAW8BttSC81TlBFp6AqcN9U05iRvrtOjyjSXhehI=;
        b=RBFD7TsH40V3ji6cujCklp6P8uqFWATnCH+OdT5l3SHoC3L/KDrIHBGWxxN7Di+RNj
         3nAys5rTY5uQra+GzIWy1Zy1bNmNguQOc5XP/7ubx/HZbp4w7zMSX3i7cILmXls6h3MF
         NF+owtsIRZBUMXykJW74Gg2IChXWpPEAyPlLnsvSCF6ucVS7aiYE5JoDlfJ8VbKm5Qpn
         LYv5DLFbtg7SvIMGDGGBwjTPvWOYpbf6j9FXsbZseuhCHGbVwLWmDBkUuG7fr6Ub3qTw
         zX1Aoe+wlp7Tqec52N7rVws/QQUtqqyy7l2GXI5CZGEJBC5IY9+5PCleBMlvF3BYCzdS
         Huaw==
X-Forwarded-Encrypted: i=1; AHgh+RpXqlTRGPJTxFRLEQtd6pyPFoAj2f6vvyfG2QvTQNuB5jIE06S/HUG/3o2DWXwFv5XuKH7I9bCIazM2pJsAQD13@lists.infradead.org
X-Gm-Message-State: AOJu0YzibVR3iEpc3gxAX2fnNHuNpAvfvHFVsyqyMz4vAz20grNKkKPp
	YVETtf/BQIpSnR6uKAeJTvwR9VhYNfOBLUZH4Ptm4Upmwws+4k4gVQPf
X-Gm-Gg: AR+sD10RvTGoong54wxP6nhBn7GkCrrNVnmZXzRtE6M89O5WzonrqLrkUgZbCbaZlPj
	E9KRdhbY0FPvND/eKXW776vLXTd3GVYxJKEx5PSoFie7Tualr5pjAnZKmE6Q96Tdx3L9jFRBQmX
	BT6Pa53Y4Jjk08VWe0fi50/AkWMU/84XpPwGso6hPJ2wBsSH35XUnuR198O5bIM0r5tO2vWAXoQ
	XAw1KORxSn8wp+OcN9sUk//O2Aai3ofBZ+52jWzh8nwJHO+ZVhmjyDWVt4fyVJCfv4IJ8RBLLc+
	ASmYW7sj58LbP694hEwt4I4STmo47VJmtGNN7eHY/8OliltViYb/kb4r7mfGjWStos4zjbRlGgP
	LWbUT4fqScqtcmBFrvllKRUJZVwZoJ15N7F+g18R8DZnpHG9/8J8JeDcuPnS78scke51o1ax/qo
	T/aMNbfNxH8QjszTEGPtLR4v/c1z1/0sbPGhrA8EUGN3xKdoV3iXCVKH/wgGuKjcVnZNDPZkQS9
	Q==
X-Received: by 2002:a17:90a:e706:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-392824a96eamr22423349a91.13.1786385561722;
        Mon, 10 Aug 2026 11:12:41 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:41 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Marek Vasut <marex@nabladev.com>,
	Folker Schwesinger <dev@folker-schwesinger.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 19/34] dmaengine: xilinx-dma: use dmaengine BH instead of tasklets
Date: Mon, 10 Aug 2026 11:09:20 -0700
Message-ID: <67afeabe4a9cc241704b36875e766d7d129465ec.1786384169.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_111242_734987_36C9FC85 
X-CRM114-Status: GOOD (  15.34  )
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
 drivers/dma/xilinx/xilinx_dma.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 404235c17353..b142c9c0583c 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -402,7 +402,6 @@ struct xilinx_dma_tx_descriptor {
  * @err: Channel has errors
  * @idle: Check for channel idle
  * @terminating: Check for channel being synchronized by user
- * @tasklet: Cleanup work after irq
  * @config: Device configuration info
  * @flush_on_fsync: Flush on Frame sync
  * @desc_pendingcount: Descriptor pending count
@@ -441,7 +440,6 @@ struct xilinx_dma_chan {
 	bool err;
 	bool idle;
 	bool terminating;
-	struct tasklet_struct tasklet;
 	struct xilinx_vdma_config config;
 	bool flush_on_fsync;
 	u32 desc_pendingcount;
@@ -1115,11 +1113,12 @@ static void xilinx_dma_chan_desc_cleanup(struct xilinx_dma_chan *chan)
 
 /**
  * xilinx_dma_do_tasklet - Schedule completion tasklet
- * @t: Pointer to the Xilinx DMA channel structure
+ * @c: Pointer to the Xilinx DMA channel structure
  */
-static void xilinx_dma_do_tasklet(struct tasklet_struct *t)
+static void xilinx_dma_do_tasklet(struct dma_chan *c)
 {
-	struct xilinx_dma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct xilinx_dma_chan *chan = container_of(c,
+			struct xilinx_dma_chan, common);
 
 	xilinx_dma_chan_desc_cleanup(chan);
 }
@@ -1898,7 +1897,7 @@ static irqreturn_t xilinx_mcdma_irq_handler(int irq, void *data)
 		spin_unlock(&chan->lock);
 	}
 
-	tasklet_hi_schedule(&chan->tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	return IRQ_HANDLED;
 }
 
@@ -1955,7 +1954,7 @@ static irqreturn_t xilinx_dma_irq_handler(int irq, void *data)
 		spin_unlock(&chan->lock);
 	}
 
-	tasklet_schedule(&chan->tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	return IRQ_HANDLED;
 }
 
@@ -2654,7 +2653,7 @@ static void xilinx_dma_synchronize(struct dma_chan *dchan)
 {
 	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
 
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 }
 
 /**
@@ -2745,7 +2744,7 @@ static void xilinx_dma_chan_remove(struct xilinx_dma_chan *chan)
 	if (chan->irq > 0)
 		free_irq(chan->irq, chan);
 
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 
 	list_del(&chan->common.device_node);
 }
@@ -3075,8 +3074,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
 			str_enabled_disabled(chan->has_sg));
 	}
 
-	/* Initialize the tasklet */
-	tasklet_setup(&chan->tasklet, xilinx_dma_do_tasklet);
+	dmaengine_init_bh(&chan->common, xilinx_dma_do_tasklet);
 
 	/*
 	 * Initialize the DMA channel and add it to the DMA engine channels
-- 
2.43.0


