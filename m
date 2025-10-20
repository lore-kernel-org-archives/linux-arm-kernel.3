Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECFBCCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sq+NjgT7WPKoXULLDuNnNsnd4c4ZwkvNiYePWjTydu8=; b=Hlll5RrnRuigh77EWSVgArucJX
	9HPOzP7FsLn9oxX48E8yT6QZzJDTWWpZ8AhCExeU0QguesVQtPfrUD03+oWCjNjfrN/0cTm0WjTpW
	1jwI1Pp9b9/vaCiciCs/gwy5X/6JP+zDBKJpDF7aLg5MCElIUH3p/DOjtpd8X7SWU1yqUVpJPK3DE
	Z5igNSrbwQ2asbo4LUg5NXBjW0lbVi0nI82Kw9ZBU7awTAkQoGdgEwfmCC5hrZYZsBjpu28N4YBEY
	sNo9IvpKpivqSLg7VN+Wt0dTg7/XMFuP/h7PjpMomIp6FpNfNb61+lOtAVd0/ZBHYyZAhhT5tsC4N
	DybcXvbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtGt-0000000EP7a-3quS;
	Mon, 20 Oct 2025 17:02:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtGq-0000000EP6x-434H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:02:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 957B144C2C;
	Mon, 20 Oct 2025 17:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E96C113D0;
	Mon, 20 Oct 2025 17:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760979714;
	bh=70yn7mGVqzvbk0wNOdWe6Ex6JjVwgt08GC05AbsLvbE=;
	h=From:To:Cc:Subject:Date:From;
	b=fMSPhd9xOCtLOxZ69PwVB4aYYjeVU3UacJZITkzQYtPpjLh97/bDeOoPUL0YYxjo7
	 3CwUFQsThjTtW/55U1MVom3TiuwunCUtH2WX2ggtvpvP9eFyiklLq2iT9U2Fkt8jMh
	 v+7fr+6dwqSEkFZ+bvjZuRZsmGMDYaRVn25hf84eMfKJkS8ATOE3eBiAVqRNSqA4s8
	 +bczBe8MGOwwLstKdmY8+X2I54aUcFNBNrXGmWcsUWC1tohGGA0tfbHv0TYLfRJBjU
	 frOF7eWUnmtkdP2Wz/9gZN6+H68EMCNAM57MCjeMM7phH6/mLreW5zAinF27SV12dC
	 ZDU006Ku03gGA==
Received: by wens.tw (Postfix, from userid 1000)
	id B224A5FDC3; Tue, 21 Oct 2025 01:01:51 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org
Subject: [PATCH] dmaengine: sun6i: Add debug messages for cyclic DMA prepare
Date: Tue, 21 Oct 2025 01:01:45 +0800
Message-ID: <20251020170147.2783867-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_100209_019883_7EFBADC6 
X-CRM114-Status: GOOD (  10.07  )
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

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
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


