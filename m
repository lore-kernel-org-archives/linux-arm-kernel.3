Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E46C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhvQ0nLd8X2lUGK/yPjcMAYgujrbK07Er9DeXa2ehmE=; b=ciXre1nbD5XgkYfZRU47p7LVpd
	x7mIEYdlrZbfNYMJeCI+5Iv8kbqGZzYGI+MQFxz7uMRPn6bqGQoGtLqUTYPOGwO4x5S3r8V3KTsDh
	o1S5JVXsWXe/GK34CZgF6Sv5Jfgxxd7SPxAogwm1PTYAF6/8gf8x2cVsdXP2AINyIzegv+K2xigUC
	GqmvHqscYhhgQN/ereuA5V+tW4uUijnQHiQROlb0QQt7swTMmsiC4HRPtO7dj0mfFOEm65srYwaRe
	hRcLdzVoJcHH/cHnwtJadCq0HKfKABGv/SobNjKVjdj62dfNKNteVpELMiOOKAzqspgyf+4DU2xok
	JS9o/btA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUTK-0000000CbPS-2tJL;
	Mon, 10 Aug 2026 18:11:38 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUTI-0000000CbO8-1ku2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:11:37 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38dcbade417so9861a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385496; x=1786990296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhvQ0nLd8X2lUGK/yPjcMAYgujrbK07Er9DeXa2ehmE=;
        b=ZaDrGckkE7XgYopibOTM94VUS+qHyRPqvNfcCFqBRBhAB7XRErFfl++MsWPFhyjkMN
         SmPPqcELkASqJu0tZH/qpF3j1tQHydBOWuhwaI2G+G4Pk+tiJWiolyzL9ZGthkGZWx6x
         5rBSY6a+jPgr0dNC2N7NJwvQN5MbC88zSm1aA5hehugKgznZD07/I4Pyz4OZU84x2nTl
         BQWBDTI6UfRPYYyCJsqr1O/KT94C+r1Yw4h16e2GdF3GZU6baJRMPe2QQo2URqihfwgj
         wzbqOzNmvOfRFsBsgLqzVRDbcdQ6L+Gn6wu6+oO9nYPIRCbgp+w1BzwT+7Ohm4Uqdhri
         QSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385496; x=1786990296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZhvQ0nLd8X2lUGK/yPjcMAYgujrbK07Er9DeXa2ehmE=;
        b=n8gQjV8raNzBjhJqa0+GhOf4TluxDTpsTTU0KC6kYW9jCdJY2Z+iTyyhI4FVRJ6sgR
         QeEimcz8dmnV3ztCFj4Y2QUDP2o/UWT+NAJ6+lSwFqHP5clbTzSOgpXY7uh3g5iRArge
         6RiOHc9VQ+vH5Ba/Xk2W6+3Wx4ScpixVSzTsdfxOgPr2pBinPT1n/qhQQ6aarVP+H5NU
         7jyhu4/1Yqk3vTICfGLaInlNLzufOMPI13TKbE76TKepQ17ELMKCq6SK0q/qSMdROzo2
         Gq2pTnk/zi8sKYqLtdV+bwx6WfXRefsLHOfmz7IxUDB//E3h9+kX0Rdz/jRRHWiQfSBs
         JK5w==
X-Forwarded-Encrypted: i=1; AHgh+RrNJegpAuh/zxsK5SvWd1sRT3+6CkMzREsafqke98bLJqta+IwY08MhvhgoFEftgTseCiPV9pTJ/5pdOYDJt6Ns@lists.infradead.org
X-Gm-Message-State: AOJu0YzKJNsmEZuWw9vdbYpns/A/X18SJ62NXiw7tyABCWWyIR53OldV
	0IXE9nF7WMniy+A5sJp88MqLb4Ia3pkESuTR/OdNyC9t4vjv6VBPbgjZ
X-Gm-Gg: AR+sD11s+IW46w1QlQIIX+Rmk8OR6S35FN7+pRBhsWdpgHpk1/hNsevEKbMZkPMSOBZ
	ZHuzLMA5Il2GRTtUEtjXHj+x8jn2EhmmqL+FvPz1Ltv0nFuHpHgh0pgCiyeSAcNA1GdDeVfMhf7
	7k1vQqcZSzcTYtKKNwqk+U1quhg1DhnwEFsNAqYHo1htM9ougE/2Rt6DG+m1+k1/liu3n9np8QH
	/ElgCyUsoXk/hT/NY7Sop4h3IlBO84Q4rKfB3WAMOFPo3MXyRAazi1JOhoz8nH1zShVixn/FO/V
	smGQG+HZdMc9Jsa6paAzo5y60kYKWFhyUHyChmPv5lDNnjswOH76PlNdUsFbYjhMBt4+w0tkAsE
	sNY0WM0htb3mhvKj4XFagLMd4Grb2KswRGYPex4cU06oPm9fi0GaRAjVx+pEkH3RdgyOaff0IFO
	Ct4KRL1nsz+j9jQ2QGefXBoTKBPu9UYNaIV/4lfapz63bsVTxpqDgUmVtBe88i0JSnq+byRQ9p5
	A==
X-Received: by 2002:a17:90b:1811:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-3903bb0ab77mr40673994a91.0.1786385495692;
        Mon, 10 Aug 2026 11:11:35 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:11:35 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 08/34] dmaengine: imx-dma: flip per-chan tasklet to dmaengine BH
Date: Mon, 10 Aug 2026 11:09:09 -0700
Message-ID: <787938bdaef4c3530b4bf0296386a33928b877f0.1786384168.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_111136_470681_AF3835DB 
X-CRM114-Status: GOOD (  15.38  )
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
 drivers/dma/imx-dma.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 81c6276436f8..308fe407fe16 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -145,7 +145,6 @@ struct imxdma_channel {
 	struct imxdma_engine		*imxdma;
 	unsigned int			channel;
 
-	struct tasklet_struct		dma_tasklet;
 	struct list_head		ld_free;
 	struct list_head		ld_queue;
 	struct list_head		ld_active;
@@ -344,8 +343,8 @@ static void imxdma_watchdog(struct timer_list *t)
 
 	imx_dmav1_writel(imxdma, 0, DMA_CCR(channel));
 
-	/* Tasklet watchdog error handler */
-	tasklet_schedule(&imxdmac->dma_tasklet);
+	/* BH watchdog error handler */
+	dmaengine_schedule_bh(&imxdmac->chan);
 	dev_dbg(imxdma->dev, "channel %d: watchdog timeout!\n",
 		imxdmac->channel);
 }
@@ -390,8 +389,8 @@ static irqreturn_t imxdma_err_handler(int irq, void *dev_id)
 			imx_dmav1_writel(imxdma, 1 << i, DMA_DBOSR);
 			errcode |= IMX_DMA_ERR_BUFFER;
 		}
-		/* Tasklet error handler */
-		tasklet_schedule(&imxdma->channel[i].dma_tasklet);
+		/* BH error handler */
+		dmaengine_schedule_bh(&imxdma->channel[i].chan);
 
 		dev_warn(imxdma->dev,
 			 "DMA timeout on channel %d -%s%s%s%s\n", i,
@@ -448,8 +447,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 			imx_dmav1_writel(imxdma, tmp, DMA_CCR(chno));
 
 			if (imxdma_chan_is_doing_cyclic(imxdmac))
-				/* Tasklet progression */
-				tasklet_schedule(&imxdmac->dma_tasklet);
+				/* BH progression */
+				dmaengine_schedule_bh(&imxdmac->chan);
 
 			return;
 		}
@@ -462,8 +461,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 
 out:
 	imx_dmav1_writel(imxdma, 0, DMA_CCR(chno));
-	/* Tasklet irq */
-	tasklet_schedule(&imxdmac->dma_tasklet);
+	/* Schedule the IRQ BH */
+	dmaengine_schedule_bh(&imxdmac->chan);
 }
 
 static irqreturn_t dma_irq_handler(int irq, void *dev_id)
@@ -592,9 +591,10 @@ static int imxdma_xfer_desc(struct imxdma_desc *d)
 	return 0;
 }
 
-static void imxdma_tasklet(struct tasklet_struct *t)
+static void imxdma_tasklet(struct dma_chan *chan)
 {
-	struct imxdma_channel *imxdmac = from_tasklet(imxdmac, t, dma_tasklet);
+	struct imxdma_channel *imxdmac = container_of(chan, struct imxdma_channel,
+						      chan);
 	struct imxdma_engine *imxdma = imxdmac->imxdma;
 	struct imxdma_desc *desc, *next_desc;
 	unsigned long flags;
@@ -1142,7 +1142,7 @@ static int __init imxdma_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&imxdmac->ld_free);
 		INIT_LIST_HEAD(&imxdmac->ld_active);
 
-		tasklet_setup(&imxdmac->dma_tasklet, imxdma_tasklet);
+		dmaengine_init_bh(&imxdmac->chan, imxdma_tasklet);
 		imxdmac->chan.device = &imxdma->dma_device;
 		dma_cookie_init(&imxdmac->chan);
 		imxdmac->channel = i;
@@ -1211,7 +1211,7 @@ static void imxdma_free_irq(struct platform_device *pdev, struct imxdma_engine *
 		if (!is_imx1_dma(imxdma))
 			disable_irq(imxdmac->irq);
 
-		tasklet_kill(&imxdmac->dma_tasklet);
+		dmaengine_kill_bh(&imxdmac->chan);
 	}
 }
 
-- 
2.43.0


