Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDEFC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJ7s0OZXSBQkDnzpVrUp569VipY5QppQ1cZnFPXTJMQ=; b=DWNNKnD+BuFvgkQBgL+iyBIzR3
	FJlj5374HQs4AV7ttF0GoMEFDHo6pJhnnE10to4HJPcSEk3hVofV4MfPLXuIA2/G1VfuadoiP3/x9
	9c58oJ1yV2VvccZrg3FB3SXPapyLBNHuS2ql4kEbpeLn6mSlO/c5LoyGnBP3e1EGcKAuviRCPsmWf
	T2ugwZwuenwKuqtE9GSQjBcX1SBcsRnE5hGJNJ6DICZTHP4zlAdaBGEWmst0SpwbJDUoxrn204E7+
	TJ0i8uynwz9xCFyH4SbtbIIuPzw7f8Hnn8qvsQXbm3E/CJLudtJ1PvE7ZuqISUymfSnJQdzweZJgC
	nR5wcoyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRzv-00000003qiR-3bQQ;
	Mon, 27 Jul 2026 20:32:29 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRzs-00000003qhj-3pdQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:32:26 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cad4170e8eso47756005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184344; x=1785789144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJ7s0OZXSBQkDnzpVrUp569VipY5QppQ1cZnFPXTJMQ=;
        b=YnrlIHusZkNLPPhOmJ1bL047Z+7wevYB/aUbJuG7wQC6j0rXUMwoL60aZ2Ddu64po/
         S8hHStliLqJY8B4vdsQwiXKdyJn8THPgBBoyplbznZ9grZgmeP9A6olJ7YS9h1UJyHxA
         lqOlf6f0xeVQ/WF5RL2F06y9xxaPcpK6FFEPiIYB5KhhRAO3WywrNbCYni4BzSGztztA
         A2NGpLr+ZfUn0K7c/e9NkBgPbStZt6ljIBn9ONt4SLlwP0LfIVDSaYfHrbtO1r4scn0l
         0odSt/SnElU0MxBKU/xI3iDosAV96fa+g9xwkmBw671CtkFbMHVnYNpEk+h58bQKH74O
         RlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184344; x=1785789144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dJ7s0OZXSBQkDnzpVrUp569VipY5QppQ1cZnFPXTJMQ=;
        b=GWKI4emN3YwxjWsUxbeLaZePT78D78GURnv2ZcDNtiOVLKUJN6tN8bb03ZZA/nMURb
         Fm6Fisq+/Zyx+IT75g4CBCxdqlgMOMuuY8hMIamf+ktXIAmQym8WnSVWBTghoT1p8x4V
         0VLMeVjWUCNjPnIMjWy52EyqVyCX5dMxYMxGn3CvqhAhNfwgDvlQCknugwFtP6H6gR/1
         zX9i5JqyF1/QR7OnAdAcL0E5ttuWgxD0ywKhbFToT+kopImJ4toNb2px0aaBe7H/JAVb
         TiyV5UYCvVgNHvKpKoku+0jVcTPRLy6PSm2Ivfv3e/se+7tQmW8ZSfX4+iLwYwIq/o4D
         MFsA==
X-Forwarded-Encrypted: i=1; AHgh+RoJaUuGuoSjjqtF3mV8TW/jD6RbJhpbq9oxit4zkuq0fMI87lnzUA8wW71YRTfSj8m2wM1DYTCwBry8sj35jq8z@lists.infradead.org
X-Gm-Message-State: AOJu0YxiAbf8J0X4am49xpK593XP1W/1MUE66wVcuhXrpgs0NMoNvqb7
	AmTtrGkVTwmHdIviw9x9MP1uvyaii+hqj3LVpBfE9tVcEmsyytrCwktH
X-Gm-Gg: AR+sD12lG9+sose4GZsGPXpY2ylCvwlBf98WEQpRZSSHbHLqPC10zaJbE9Lsmp3ydb3
	zl2Z0Hbmu0L2j8b8bCWzBxo8mPvKOwocIpWqPHhHPrjhfblTasiZ3M8oKJvKxGK4+R7k6syMd40
	tX0SSC7CbTFRTbZNEsGm/LY8Y/c+mmsdA2xdMWstCjM3z8/7FeOakxXsAoH1A6/fO0h/lrKSKVA
	xRwSPVsOslzxzaVqYb7ZBaDbNNiR5w/OuZ3wROVXglp2rgXNvm0QA56z7dD/aGFa63Wl/b3kcDi
	gQ1PTKSIDBZlrlogh627/d8WeMwSsrMaudwB4gyPKKD8YBxylyY9+a13SoBpMoKtgCCXca9XPmm
	OwRHlT/Fa1Lfu217Uq7xe5QBFdvj4IqGMIyWUuKL+k2phC4abrowj8CSv45/u1YN2J6sPoyLYA4
	LWnTWN
X-Received: by 2002:a17:902:e549:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2d00f24e8e7mr7931755ad.2.1785184343842;
        Mon, 27 Jul 2026 13:32:23 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:22 -0700 (PDT)
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
Subject: [PATCH v2 19/64] dmaengine: xilinx-dma: use dma_chan BH instead of tasklets
Date: Mon, 27 Jul 2026 13:28:47 -0700
Message-ID: <300282f7a29dc2125d22ac153075b0ac29591ce6.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_133224_965713_92BBDBE7 
X-CRM114-Status: GOOD (  15.01  )
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

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 404235c17353..bf9f22ed1265 100644
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
+	dma_chan_schedule_bh(&chan->common);
 	return IRQ_HANDLED;
 }
 
@@ -1955,7 +1954,7 @@ static irqreturn_t xilinx_dma_irq_handler(int irq, void *data)
 		spin_unlock(&chan->lock);
 	}
 
-	tasklet_schedule(&chan->tasklet);
+	dma_chan_schedule_bh(&chan->common);
 	return IRQ_HANDLED;
 }
 
@@ -2654,7 +2653,7 @@ static void xilinx_dma_synchronize(struct dma_chan *dchan)
 {
 	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
 
-	tasklet_kill(&chan->tasklet);
+	dma_chan_kill_bh(&chan->common);
 }
 
 /**
@@ -2745,7 +2744,7 @@ static void xilinx_dma_chan_remove(struct xilinx_dma_chan *chan)
 	if (chan->irq > 0)
 		free_irq(chan->irq, chan);
 
-	tasklet_kill(&chan->tasklet);
+	dma_chan_kill_bh(&chan->common);
 
 	list_del(&chan->common.device_node);
 }
@@ -3075,8 +3074,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
 			str_enabled_disabled(chan->has_sg));
 	}
 
-	/* Initialize the tasklet */
-	tasklet_setup(&chan->tasklet, xilinx_dma_do_tasklet);
+	dma_chan_init_bh(&chan->common, xilinx_dma_do_tasklet);
 
 	/*
 	 * Initialize the DMA channel and add it to the DMA engine channels
-- 
2.43.0


