Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015C3C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74xEo+CE1QfFvSvj5MoWqgDNpT3h+VRY/LZDapbI2A4=; b=A280cluYZtGogfVwX6HDvVMYPP
	P1/IWlzYmZsAAaqdhOh1LPX3+Gl6TfwlH+T72vpYODHQYI7Pxfpkj9u/QWDBo/6I2PWdwONIcEylX
	/Jbg8iHEc+fnYrqcDxBlXtAc/TQ0im6Gaj7ShNrdpHmTGmGDq3GzojNOAhGqdOyiJ9+NxidlGvDgu
	1ZDIcx3LpRuuPP3igRlDYch8eMfBV3RPkL6DjIVWCtX6yiSADd1IYPqR1vNCu0rK4zh8rVB2AbdlQ
	Q8ct5Y+DXPpgti4uuDX4flRmUTcx2WTHSpOCQyA+z9JX7suBi3nEJ0RQwAsvtb7GCi6MFPimesecK
	gP5hihAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRzl-00000003qen-38kW;
	Mon, 27 Jul 2026 20:32:17 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRzj-00000003qdW-11DE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:32:16 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cf50c6f235so38250425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184334; x=1785789134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74xEo+CE1QfFvSvj5MoWqgDNpT3h+VRY/LZDapbI2A4=;
        b=aSXmfSVjCmbZfPaePZ3yZtY55Zcv3np6vrTtEZGj81vmG9aOMfWF+6YgZwa4dxMB7V
         rPJdqHAFlt3U39Tu5aIrutef0Anp2f/neUcrLN4FXfGdC//0DLVki6z1hFqLB0uEobc/
         +/EpSvzKtYLfsPY8rpl1rxglwDXjRN3mfqSuoYjitdXRAeN70lt5GPRigULhmc4kp20e
         GwDzXmHRQRsPK5s7eHKLFgjtKiSk17EaK40xzO6+ZtvJNDs9W0F4swqVaFem0BFjdVD8
         cwFd7GhTCPwyVh90sivycP+WO7Z8MgCqY0cCSbnoQH+oLxFCgOS7iiXIzv5HtO4zf6cv
         5aZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184334; x=1785789134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74xEo+CE1QfFvSvj5MoWqgDNpT3h+VRY/LZDapbI2A4=;
        b=jyYL0FkLe+RHriDRs88GLvUAW9UeNFYKF9AmsQ7nZ1kpS+rUJsvElt/bsU6fambbqT
         91BlIgH0Kh/7ecSlLqVvshQ4gkLfcDXUG1kDftt+tU8gUaWrwwMJcUs9HpPQ2Tv2/MuE
         mn5oTAwUQf/OPfiRnp3esvaHmm6fta5J/gJfewtPM1nPz2Q1N2BIQOhfdA0ySLhoblW/
         bnrD/4+vS6zrg+phT+deHhPJhzKHdOvwISaJNssmeri2NEmIT4cq93fPBpj9mgAMq3/j
         rNJLqRkqvZ8duwOo+qsrWoX8XZ7y6vaDPpTxwhn3unIN4ewAM0/KVLiqyJsric3Ac0De
         j1cA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6kfvQ/X/+WLHrYFhK5FwY4BL0lvFIV12IKMhErTDepPeVT8qUTvNe5tfLqdCxUiZ5MUkqwGqlxykG1gK15GPo@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8OTP/o+hXy+104g1M+JWIpSo6lcgq7JTKBzyGqX+i07I8jsn/
	/Wy92wgjujDsx91PvEW6/E2oLpfvQloYaV83et/Ilo31DvxnFGOMbuas
X-Gm-Gg: AR+sD12KcxJcJmGNP9xVIHUz7yw1HOUP23Hn/DrlciscrmDMZtjVqrUgFKrSdfTarDA
	iSGEDN9OaB5TQk1mXW72u/XTAQh6Kh8/4MeM/uO8adyn9PshANQcuu0uX4PmEurTMPO0OuiCr7c
	jLoAGzSCTcAT+KqpXbB5wu28ItYmLOScfoeuuudaSZBX/MTm5USqRnqidx9JtfyIf7dIIgP5CoB
	zq5IstIrL4mVxS6+YEDihdDV5v7s2nsL4vP6uyDAUVOrwvhm322f0yNsjQZfU7GCLGrbp3BooNX
	dbp2RT7Nmlp8HB6bCUkKAO2MInadK2sYqavHdKI/IzSP6GFYXG/YgzY5foq68bFjWCTVzjCXlMN
	QmV+EuRONPbqty6TOeVUEXef1GUdV5AkcvJrSAjnfV1bdsOG8sbKt6d5OKea/+/TYxSkD/VtzYA
	cR0lA7
X-Received: by 2002:a17:902:c401:b0:2cf:bf3e:4812 with SMTP id d9443c01a7336-2d00f3d7f32mr6986165ad.2.1785184334272;
        Mon, 27 Jul 2026 13:32:14 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:12 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 17/64] dmaengine: ste_dma40: convert per-channel tasklet to dma_chan BH
Date: Mon, 27 Jul 2026 13:28:45 -0700
Message-ID: <119d257968c0a337b7e439fe71b59636e7fb37c3.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_133215_284302_79BC5FC6 
X-CRM114-Status: GOOD (  13.95  )
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
 drivers/dma/ste_dma40.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0d9ffa3e2663..f279a093a81f 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -461,8 +461,6 @@ struct d40_base;
  * @phy_chan: Pointer to physical channel which this instance runs on. If this
  * point is NULL, then the channel is not allocated.
  * @chan: DMA engine handle.
- * @tasklet: Tasklet that gets scheduled from interrupt context to complete a
- * transfer and call client callback.
  * @client: Cliented owned descriptor list.
  * @pending_queue: Submitted jobs, to be issued by issue_pending()
  * @active: Active descriptor.
@@ -489,7 +487,6 @@ struct d40_chan {
 	bool				 busy;
 	struct d40_phy_res		*phy_chan;
 	struct dma_chan			 chan;
-	struct tasklet_struct		 tasklet;
 	struct list_head		 client;
 	struct list_head		 pending_queue;
 	struct list_head		 active;
@@ -1587,13 +1584,13 @@ static void dma_tc_handle(struct d40_chan *d40c)
 	}
 
 	d40c->pending_tx++;
-	tasklet_schedule(&d40c->tasklet);
+	dma_chan_schedule_bh(&d40c->chan);
 
 }
 
-static void dma_tasklet(struct tasklet_struct *t)
+static void dma_tasklet(struct dma_chan *chan)
 {
-	struct d40_chan *d40c = from_tasklet(d40c, t, tasklet);
+	struct d40_chan *d40c = container_of(chan, struct d40_chan, chan);
 	struct d40_desc *d40d;
 	unsigned long flags;
 	bool callback_active;
@@ -1641,7 +1638,7 @@ static void dma_tasklet(struct tasklet_struct *t)
 	d40c->pending_tx--;
 
 	if (d40c->pending_tx)
-		tasklet_schedule(&d40c->tasklet);
+		dma_chan_schedule_bh(&d40c->chan);
 
 	spin_unlock_irqrestore(&d40c->lock, flags);
 
@@ -2815,7 +2812,7 @@ static void __init d40_chan_init(struct d40_base *base, struct dma_device *dma,
 		INIT_LIST_HEAD(&d40c->client);
 		INIT_LIST_HEAD(&d40c->prepare_queue);
 
-		tasklet_setup(&d40c->tasklet, dma_tasklet);
+		dma_chan_init_bh(&d40c->chan, dma_tasklet);
 
 		list_add_tail(&d40c->chan.device_node,
 			      &dma->channels);
-- 
2.43.0


