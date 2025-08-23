Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B804CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 16:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMUFCSqGtqVp4ZxxH9S3puHWsXnaaPYEwpHRxMFowsw=; b=JkJQDrmz6EsFqNPYr/Mj+lWXc5
	wKovIBEyCEH3nZnK7iJmgAj4rOs9HOqeHWR/yplEqh55rxlNaxVelEULgzu6vJr2OJcCKDaLDs7eW
	3CgYqa+xG0ly1/p2KeSdS7gqVv+JuYyPTG2zvk0rxyrKN+4mfWdRr4fYhf++2H+sMTwucpb6F0edh
	ccgKjWnTHBu2cn0cvVIQ+LUJjDg/cRdsY09gHnTYmNiKayr4/kVUrd3MaDcpjZqswyJ1S0br4xsgG
	r+H0/nInqHNH+qQnFVA0odhZZgeiyGgtABJgJGvCJGzRTTzEWUOm6gPPWUl3uXKgj54s5PqYaN/D2
	XrkAApAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uprAM-000000052Ay-1pVv;
	Sat, 23 Aug 2025 16:32:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqd5-00000004x1z-1vbJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 15:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3366440B57;
	Sat, 23 Aug 2025 15:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00324C4CEE7;
	Sat, 23 Aug 2025 15:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755964687;
	bh=HrsbhSkWMp6y8bCJ4SusuQXu2u6vriVvJmqCSwtzL1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NS8g/RI3qlFLDpSb5AXMXrIdsjq9mri2FbmcIuFzwj9eKnPtynIS6tcc2kxVGOAOW
	 MOAQXoNID1/JwFOxUPXQU655Fn3TL/gVXL2vnIWcjH2cGDhoaJEmQ0dNSI227UEE+U
	 41wFMfjtYsHQFB9SPejrMyCdX4lHO0NPD3iiE7mZROtcxL7fqgjT01w22Vb2f3De5E
	 qu8TSUwXuMw8GhiQFtOEE7ReWTZtvBM9QYAizc3NNczWsUeKMK5VjTCXaXpO3o3245
	 OKTzwEA69Zw3erkVkpzYCVAWowev1Ev7pMZLpOuMB2hqv/Kz0PZnXWQAUiKY1qsHVO
	 tGVpVcoD+d/Kw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/14] dmaengine: dma350: Support device_prep_dma_cyclic
Date: Sat, 23 Aug 2025 23:40:07 +0800
Message-ID: <20250823154009.25992-13-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250823154009.25992-1-jszhang@kernel.org>
References: <20250823154009.25992-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_085807_537246_507DBC56 
X-CRM114-Status: GOOD (  18.87  )
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

Add support for device_prep_dma_cyclic() callback function to benefit
DMA cyclic client, for example ALSA.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/dma/arm-dma350.c | 118 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 113 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index a285778264b9..5abb965c6687 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -212,8 +212,10 @@ struct d350_chan {
 	enum dma_status status;
 	dma_cookie_t cookie;
 	u32 residue;
+	u32 periods;
 	u8 tsz;
 	u8 ch;
+	bool cyclic;
 	bool has_trig;
 	bool has_wrap;
 	bool coherent;
@@ -475,6 +477,105 @@ d350_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	return NULL;
 }
 
+static struct dma_async_tx_descriptor *
+d350_prep_cyclic(struct dma_chan *chan, dma_addr_t buf_addr,
+		 size_t buf_len, size_t period_len, enum dma_transfer_direction dir,
+		 unsigned long flags)
+{
+	struct d350_chan *dch = to_d350_chan(chan);
+	u32 periods, trig, *cmd, tsz;
+	dma_addr_t src, dst, phys;
+	struct d350_desc *desc;
+	struct d350_sg *dsg;
+	int i, j;
+
+	if (unlikely(!is_slave_direction(dir) || !buf_len || !period_len))
+		return NULL;
+
+	periods = buf_len / period_len;
+
+	desc = kzalloc(struct_size(desc, sg, periods), GFP_NOWAIT);
+	if (!desc)
+		return NULL;
+
+	dch->cyclic = true;
+	desc->sglen = periods;
+
+	if (dir == DMA_MEM_TO_DEV)
+		tsz = __ffs(dch->config.dst_addr_width | (1 << dch->tsz));
+	else
+		tsz = __ffs(dch->config.src_addr_width | (1 << dch->tsz));
+
+	for (i = 0; i < periods; i++) {
+		desc->sg[i].command = dma_pool_zalloc(dch->cmd_pool, GFP_NOWAIT, &phys);
+		if (unlikely(!desc->sg[i].command))
+			goto err_cmd_alloc;
+
+		desc->sg[i].phys = phys;
+		dsg = &desc->sg[i];
+
+		if (dir == DMA_MEM_TO_DEV) {
+			src = buf_addr + i * period_len;
+			dst = dch->config.dst_addr;
+			trig = CH_CTRL_USEDESTRIGIN;
+		} else {
+			src = dch->config.src_addr;
+			dst = buf_addr + i * period_len;
+			trig = CH_CTRL_USESRCTRIGIN;
+		}
+		dsg->tsz = tsz;
+		dsg->xsize = lower_16_bits(period_len >> dsg->tsz);
+		dsg->xsizehi = upper_16_bits(period_len >> dsg->tsz);
+
+		cmd = dsg->command;
+		cmd[0] = LINK_CTRL | LINK_SRCADDR | LINK_SRCADDRHI | LINK_DESADDR |
+			 LINK_DESADDRHI | LINK_XSIZE | LINK_XSIZEHI | LINK_SRCTRANSCFG |
+			 LINK_DESTRANSCFG | LINK_XADDRINC | LINK_LINKADDR;
+
+		cmd[1] = FIELD_PREP(CH_CTRL_TRANSIZE, dsg->tsz) |
+			 FIELD_PREP(CH_CTRL_XTYPE, CH_CTRL_XTYPE_CONTINUE) |
+			 FIELD_PREP(CH_CTRL_DONETYPE, CH_CTRL_DONETYPE_CMD) | trig;
+
+		cmd[2] = lower_32_bits(src);
+		cmd[3] = upper_32_bits(src);
+		cmd[4] = lower_32_bits(dst);
+		cmd[5] = upper_32_bits(dst);
+		cmd[6] = FIELD_PREP(CH_XY_SRC, dsg->xsize) | FIELD_PREP(CH_XY_DES, dsg->xsize);
+		cmd[7] = FIELD_PREP(CH_XY_SRC, dsg->xsizehi) | FIELD_PREP(CH_XY_DES, dsg->xsizehi);
+		if (dir == DMA_MEM_TO_DEV) {
+			cmd[0] |= LINK_DESTRIGINCFG;
+			cmd[8] = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
+			cmd[9] = TRANSCFG_DEVICE;
+			cmd[10] = FIELD_PREP(CH_XY_SRC, 1);
+			cmd[11] = FIELD_PREP(CH_DESTRIGINMODE, CH_DESTRIG_DMA_FC) |
+				  FIELD_PREP(CH_DESTRIGINTYPE, CH_DESTRIG_HW_REQ);
+		} else {
+			cmd[0] |= LINK_SRCTRIGINCFG;
+			cmd[8] = TRANSCFG_DEVICE;
+			cmd[9] = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
+			cmd[10] = FIELD_PREP(CH_XY_DES, 1);
+			cmd[11] = FIELD_PREP(CH_SRCTRIGINMODE, CH_SRCTRIG_DMA_FC) |
+				  FIELD_PREP(CH_SRCTRIGINTYPE, CH_SRCTRIG_HW_REQ);
+		}
+
+		if (i)
+			desc->sg[i - 1].command[12] = phys | CH_LINKADDR_EN;
+	}
+
+	/* cyclic list */
+	desc->sg[periods - 1].command[12] = desc->sg[0].phys | CH_LINKADDR_EN;
+
+	mb();
+
+	return vchan_tx_prep(&dch->vc, &desc->vd, flags);
+
+err_cmd_alloc:
+	for (j = 0; j < i; j++)
+		dma_pool_free(dch->cmd_pool, desc->sg[j].command, desc->sg[j].phys);
+	kfree(desc);
+	return NULL;
+}
+
 static int d350_slave_config(struct dma_chan *chan, struct dma_slave_config *config)
 {
 	struct d350_chan *dch = to_d350_chan(chan);
@@ -565,6 +666,7 @@ static int d350_terminate_all(struct dma_chan *chan)
 	}
 	vchan_get_all_descriptors(&dch->vc, &list);
 	list_splice_tail(&list, &dch->vc.desc_terminated);
+	dch->cyclic = false;
 	spin_unlock_irqrestore(&dch->vc.lock, flags);
 
 	return 0;
@@ -716,11 +818,15 @@ static irqreturn_t d350_irq(int irq, void *data)
 
 	spin_lock(&dch->vc.lock);
 	if (ch_status & CH_STAT_INTR_DONE) {
-		vchan_cookie_complete(vd);
-		dch->desc = NULL;
-		dch->status = DMA_COMPLETE;
-		dch->residue = 0;
-		d350_start_next(dch);
+		if (dch->cyclic) {
+			vchan_cyclic_callback(vd);
+		} else {
+			vchan_cookie_complete(vd);
+			dch->desc = NULL;
+			dch->status = DMA_COMPLETE;
+			dch->residue = 0;
+			d350_start_next(dch);
+		}
 	} else {
 		dch->status = DMA_ERROR;
 		dch->residue = vd->tx_result.residue;
@@ -886,8 +992,10 @@ static int d350_probe(struct platform_device *pdev)
 	if (trig_bits) {
 		dmac->dma.directions |= (BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV));
 		dma_cap_set(DMA_SLAVE, dmac->dma.cap_mask);
+		dma_cap_set(DMA_CYCLIC, dmac->dma.cap_mask);
 		dmac->dma.device_config = d350_slave_config;
 		dmac->dma.device_prep_slave_sg = d350_prep_slave_sg;
+		dmac->dma.device_prep_dma_cyclic = d350_prep_cyclic;
 	}
 
 	if (memset) {
-- 
2.50.0


