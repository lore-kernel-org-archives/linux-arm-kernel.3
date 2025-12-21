Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F3DE66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 06:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nBzZjTkuARumWcO6fJrmX0YUyVPRZp2Q6Z9rQf4njI8=; b=rWtlCm864oQ5T8cOvLsnMb7Uxc
	YH85gsZvjSpqJ8XwD9L9tcAeWVBKEZec0l9SMVnuR+2NdF0ECRIq2n2FbdpHebrp3hCOv0nRCDr5G
	txhdxmlVGz2SMgb2jzRWSzj1WMzOZK0dI/AnYAzQtDSHSiomukX/BRt1NvtN9U2E7YGdVNdbKqZ8e
	95qa4Nj+MFmtb2GlQlJa0hrAxfYzWJapiGyomVaxvin93AHU//fr4zWVoDyQTYV4Mp7ZLNPpcJc0t
	S+eOKzZqXB0nIgp3D4aTkbYY8FNDWAEvFbz72jY+nF5pNJIwMjJHmtZWFPDKDXl68TGBxLmebDGwi
	5nR0Mm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXDEa-0000000CBgG-0NqS;
	Sun, 21 Dec 2025 06:48:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXDEX-0000000CBfo-0hZH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 06:48:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DAD4F41AA0;
	Sun, 21 Dec 2025 06:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96864C4CEFB;
	Sun, 21 Dec 2025 06:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766299677;
	bh=dq4SjEE6XVIDRMreVqzrzH3io5MNY5o1sITwGmWprhc=;
	h=From:To:Cc:Subject:Date:From;
	b=pRbQfv5A3j0G+9CBPGmKz1bqN+Wno5MhiZZTVaj09+xLi1etHeMCLlT+3tD55aY51
	 rk5KCqlSXv1c1HqjuWPvs0F7FbYjpVsUT36kZ2KJ28XMoLxYMRwkidtWB/faxPMFdr
	 qpk38TA6PWjqy9k7Z5FLp+474yB+TOzh552CszlCUOWNA2o3Dlr0umqOu4s7Ksho4h
	 lOGrf+Y03PE8iz6SFeCveZv+m9d6xmlEer9p8DklSzpifOGU8BntDvUdqQGQzzo2hH
	 xxBzyW2WoLjtcRpnJj0CdBedLi6wn/iH+Q2Jj+FvuqAQMRXz3KzgpX1ASoYJ+wnVSw
	 T29KUQcq3IcOg==
Received: by wens.tw (Postfix, from userid 1000)
	id 4AD3F5FDFB; Sun, 21 Dec 2025 14:47:55 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH RESEND] dmaengine: sun6i: Add debug messages for cyclic DMA prepare
Date: Sun, 21 Dec 2025 14:47:52 +0800
Message-ID: <20251221064754.1783369-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_224801_248207_2C243CE0 
X-CRM114-Status: GOOD (  10.35  )
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

The driver already has debug messages for memcpy and linear transfers,
but is missing them for cyclic transfers.

Cyclic transfers are one of the main uses of the DMA controller, used
for audio data transfers. And since these are likely the first DMA
peripherals to be enabled, it helps to have these debug messages.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
Hi Vinod,

This patch seems to have fallen through the cracks.


 drivers/dma/sun6i-dma.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 2215ff877bf7..2e03c587bd2e 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -826,6 +826,11 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 			v_lli->cfg = lli_cfg;
 			sdev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, vchan->port);
 			sdev->cfg->set_mode(&v_lli->cfg, LINEAR_MODE, IO_MODE);
+			dev_dbg(chan2dev(chan),
+				"%s; chan: %d, dest: %pad, src: %pad, len: %zu. flags: 0x%08lx\n",
+				__func__, vchan->vc.chan.chan_id,
+				&sconfig->dst_addr, &buf_addr,
+				buf_len, flags);
 		} else {
 			sun6i_dma_set_addr(sdev, v_lli,
 					   sconfig->src_addr,
@@ -833,6 +838,11 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 			v_lli->cfg = lli_cfg;
 			sdev->cfg->set_drq(&v_lli->cfg, vchan->port, DRQ_SDRAM);
 			sdev->cfg->set_mode(&v_lli->cfg, IO_MODE, LINEAR_MODE);
+			dev_dbg(chan2dev(chan),
+				"%s; chan: %d, dest: %pad, src: %pad, len: %zu. flags: 0x%08lx\n",
+				__func__, vchan->vc.chan.chan_id,
+				&buf_addr, &sconfig->src_addr,
+				buf_len, flags);
 		}
 
 		prev = sun6i_dma_lli_add(prev, v_lli, p_lli, txd);
-- 
2.47.3


