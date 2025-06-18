Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96F0C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 07:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N6HHsAcHH91WesaqxftqeEGzD1inildG7/10cPoKGig=; b=P11LDppiGTakG2PoaE9NUdmMmY
	PTqJqvXIWXj9apav75PaHwpIra69Ojy5MbPW531KTtjsIMfmjRXCXa3V/SkyvgWcEz8l9AaIoFIQw
	ZDZvRmRRkNcKMHkaV3+vvmBk4z5aUjlsTSx90E1R+fNZhMaVFoKVpFf4nzOV//EToRApGXmykVJVB
	hcvUwCTUVd1YibZ8puu0E6FirUxmlZ2/0Zd2eyxtk+gD2uiHoUNI+qT4xNhOfHeHblEKye6vJ+mF+
	SgpByMfGGZwrAN9jUZqWiNqxhSOfO9uz825BbyhgAu2bAMxSYF2yTPt0AauXjw3auzZjQNWEUutDD
	lwoNuRiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnUk-00000009Jxx-1v8U;
	Wed, 18 Jun 2025 07:46:06 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnSV-00000009JSc-3Iwr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 07:43:49 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750232625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N6HHsAcHH91WesaqxftqeEGzD1inildG7/10cPoKGig=;
	b=ByvjSmHrKk4dfqsi3VrV69fsQVRYKp3ff39Pj8B1VIEgaNGjDIomPutvBZn5V0gVRfGzqZ
	36jtwKb0c5dMcLMIAKxjgHACt/TzJDnOT7F8s+RZMzdgKAqMKcdqeklGPQM/ccF9GTzxac
	C9MLIeN4rqKfyJXNJ5/l8fAeU9zxUzJmtI568xFQKtRAKKEJZqxn7qKPXcGURYKN124C4s
	4UW0a2vlMZtvn/I/NU8sfilfN7lMoPsESQgQUlrXbV16jMk4vAHbb9Ynaev2YoXLonNDGD
	xnxBQ2Mnv5EJWUqleB5vLxUM1A/xIuly9SayUoltJT36Z6q5ntAuzMZf80E9LA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750232625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N6HHsAcHH91WesaqxftqeEGzD1inildG7/10cPoKGig=;
	b=hBn4E7OKpJFa3DMnsx2hN8c1xNBYCRz1A9VA0/7Ng6oj00HFbbloEGN6hd6JpWaXbgMcEc
	8L1SnLbyhHfEi+BA==
Date: Wed, 18 Jun 2025 09:43:34 +0200
Subject: [PATCH v2] dmaengine: stm32: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250618-restricted-pointers-dma-v2-1-bc39dafc201d@linutronix.de>
X-B4-Tracking: v=1; b=H4sIACVuUmgC/3WNQQ6CMBBFr2Jm7Zi2oIgr72FYFDrIJNqSaSUYw
 t2tJC5dvpf89xeIJEwRLrsFhCaOHHwGs99BN1h/J2SXGYwyR1WqEoViEu4SORwD+0QS0T0tmrr
 rz0VttVUt5PUo1PO8lW9N5oFjCvLejib9tb9m9bc5adTYnnTlnCJTF/b6YP9KEjzPB0fQrOv6A
 WwgUFXCAAAA
X-Change-ID: 20250404-restricted-pointers-dma-29cf839a1a0b
To: =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750232624; l=6716;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+tSB1MfVCA6a4XIVYMAt8jv2Wa57wse7PxlEPUqmfsA=;
 b=NPDQ8uznn3EHmpX3pZM6dfETaJzaZ9d7n8ZEZ9bpmZkiXdMKi+1oomrRNLsXOfBv6QMAdcA8W
 Yvk8zhChFSjD5FAVSWc5hfgQ0L+fQXZOSrBqibhvpzqSBpkoqgGJG3F
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_004347_967690_A3928F32 
X-CRM114-Status: GOOD (  10.26  )
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

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
Changes in v2:
- Rebase onto 6.16-rc
- Pick up review from Amelie
- Fix typo in commit message
- Drop inapplicable mention of seq_file from commit message
- Link to v1: https://lore.kernel.org/r/20250407-restricted-pointers-dma-v1-1-b617dd0e293a@linutronix.de
---
 drivers/dma/stm32/stm32-dma.c  | 10 +++++-----
 drivers/dma/stm32/stm32-dma3.c | 10 +++++-----
 drivers/dma/stm32/stm32-mdma.c |  8 ++++----
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/stm32/stm32-dma.c b/drivers/dma/stm32/stm32-dma.c
index 917f8e9223739af853e492d97cecac0e95e0aea3..ee9246c6888ffde2d416270f25890c04c72daff7 100644
--- a/drivers/dma/stm32/stm32-dma.c
+++ b/drivers/dma/stm32/stm32-dma.c
@@ -613,7 +613,7 @@ static void stm32_dma_start_transfer(struct stm32_dma_chan *chan)
 	reg->dma_scr |= STM32_DMA_SCR_EN;
 	stm32_dma_write(dmadev, STM32_DMA_SCR(chan->id), reg->dma_scr);
 
-	dev_dbg(chan2dev(chan), "vchan %pK: started\n", &chan->vchan);
+	dev_dbg(chan2dev(chan), "vchan %p: started\n", &chan->vchan);
 }
 
 static void stm32_dma_configure_next_sg(struct stm32_dma_chan *chan)
@@ -676,7 +676,7 @@ static void stm32_dma_handle_chan_paused(struct stm32_dma_chan *chan)
 
 	chan->status = DMA_PAUSED;
 
-	dev_dbg(chan2dev(chan), "vchan %pK: paused\n", &chan->vchan);
+	dev_dbg(chan2dev(chan), "vchan %p: paused\n", &chan->vchan);
 }
 
 static void stm32_dma_post_resume_reconfigure(struct stm32_dma_chan *chan)
@@ -728,7 +728,7 @@ static void stm32_dma_post_resume_reconfigure(struct stm32_dma_chan *chan)
 	dma_scr |= STM32_DMA_SCR_EN;
 	stm32_dma_write(dmadev, STM32_DMA_SCR(chan->id), dma_scr);
 
-	dev_dbg(chan2dev(chan), "vchan %pK: reconfigured after pause/resume\n", &chan->vchan);
+	dev_dbg(chan2dev(chan), "vchan %p: reconfigured after pause/resume\n", &chan->vchan);
 }
 
 static void stm32_dma_handle_chan_done(struct stm32_dma_chan *chan, u32 scr)
@@ -820,7 +820,7 @@ static void stm32_dma_issue_pending(struct dma_chan *c)
 
 	spin_lock_irqsave(&chan->vchan.lock, flags);
 	if (vchan_issue_pending(&chan->vchan) && !chan->desc && !chan->busy) {
-		dev_dbg(chan2dev(chan), "vchan %pK: issued\n", &chan->vchan);
+		dev_dbg(chan2dev(chan), "vchan %p: issued\n", &chan->vchan);
 		stm32_dma_start_transfer(chan);
 
 	}
@@ -922,7 +922,7 @@ static int stm32_dma_resume(struct dma_chan *c)
 
 	spin_unlock_irqrestore(&chan->vchan.lock, flags);
 
-	dev_dbg(chan2dev(chan), "vchan %pK: resumed\n", &chan->vchan);
+	dev_dbg(chan2dev(chan), "vchan %p: resumed\n", &chan->vchan);
 
 	return 0;
 }
diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
index 0c6c4258b19561c94f1c68f26ade16b82660ebe6..50e7106c5cb73394c1de52ad5f571f6db63750e6 100644
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -801,7 +801,7 @@ static void stm32_dma3_chan_start(struct stm32_dma3_chan *chan)
 
 	chan->dma_status = DMA_IN_PROGRESS;
 
-	dev_dbg(chan2dev(chan), "vchan %pK: started\n", &chan->vchan);
+	dev_dbg(chan2dev(chan), "vchan %p: started\n", &chan->vchan);
 }
 
 static int stm32_dma3_chan_suspend(struct stm32_dma3_chan *chan, bool susp)
@@ -1452,7 +1452,7 @@ static int stm32_dma3_pause(struct dma_chan *c)
 
 	chan->dma_status = DMA_PAUSED;
 
-	dev_dbg(chan2dev(chan), "vchan %pK: paused\n", &chan->vchan);
+	dev_dbg(chan2dev(chan), "vchan %p: paused\n", &chan->vchan);
 
 	return 0;
 }
@@ -1465,7 +1465,7 @@ static int stm32_dma3_resume(struct dma_chan *c)
 
 	chan->dma_status = DMA_IN_PROGRESS;
 
-	dev_dbg(chan2dev(chan), "vchan %pK: resumed\n", &chan->vchan);
+	dev_dbg(chan2dev(chan), "vchan %p: resumed\n", &chan->vchan);
 
 	return 0;
 }
@@ -1490,7 +1490,7 @@ static int stm32_dma3_terminate_all(struct dma_chan *c)
 	spin_unlock_irqrestore(&chan->vchan.lock, flags);
 	vchan_dma_desc_free_list(&chan->vchan, &head);
 
-	dev_dbg(chan2dev(chan), "vchan %pK: terminated\n", &chan->vchan);
+	dev_dbg(chan2dev(chan), "vchan %p: terminated\n", &chan->vchan);
 
 	return 0;
 }
@@ -1543,7 +1543,7 @@ static void stm32_dma3_issue_pending(struct dma_chan *c)
 	spin_lock_irqsave(&chan->vchan.lock, flags);
 
 	if (vchan_issue_pending(&chan->vchan) && !chan->swdesc) {
-		dev_dbg(chan2dev(chan), "vchan %pK: issued\n", &chan->vchan);
+		dev_dbg(chan2dev(chan), "vchan %p: issued\n", &chan->vchan);
 		stm32_dma3_chan_start(chan);
 	}
 
diff --git a/drivers/dma/stm32/stm32-mdma.c b/drivers/dma/stm32/stm32-mdma.c
index e6d525901de7ecf822d218b87b95aba6bbf0a3ef..080c1c725216cb627675c372591b4c0c227c3cea 100644
--- a/drivers/dma/stm32/stm32-mdma.c
+++ b/drivers/dma/stm32/stm32-mdma.c
@@ -1187,7 +1187,7 @@ static void stm32_mdma_start_transfer(struct stm32_mdma_chan *chan)
 
 	chan->busy = true;
 
-	dev_dbg(chan2dev(chan), "vchan %pK: started\n", &chan->vchan);
+	dev_dbg(chan2dev(chan), "vchan %p: started\n", &chan->vchan);
 }
 
 static void stm32_mdma_issue_pending(struct dma_chan *c)
@@ -1200,7 +1200,7 @@ static void stm32_mdma_issue_pending(struct dma_chan *c)
 	if (!vchan_issue_pending(&chan->vchan))
 		goto end;
 
-	dev_dbg(chan2dev(chan), "vchan %pK: issued\n", &chan->vchan);
+	dev_dbg(chan2dev(chan), "vchan %p: issued\n", &chan->vchan);
 
 	if (!chan->desc && !chan->busy)
 		stm32_mdma_start_transfer(chan);
@@ -1220,7 +1220,7 @@ static int stm32_mdma_pause(struct dma_chan *c)
 	spin_unlock_irqrestore(&chan->vchan.lock, flags);
 
 	if (!ret)
-		dev_dbg(chan2dev(chan), "vchan %pK: pause\n", &chan->vchan);
+		dev_dbg(chan2dev(chan), "vchan %p: pause\n", &chan->vchan);
 
 	return ret;
 }
@@ -1261,7 +1261,7 @@ static int stm32_mdma_resume(struct dma_chan *c)
 
 	spin_unlock_irqrestore(&chan->vchan.lock, flags);
 
-	dev_dbg(chan2dev(chan), "vchan %pK: resume\n", &chan->vchan);
+	dev_dbg(chan2dev(chan), "vchan %p: resume\n", &chan->vchan);
 
 	return 0;
 }

---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250404-restricted-pointers-dma-29cf839a1a0b

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


