Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC78EB28F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 09:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e6Q5jFK43ZJ1Twf/eEHkLZQeVBspSGKtpQIWC0nWZzI=; b=zLn3igqX03qif4nYzSLX6oJkpy
	CAiqqltu0qdoNrYJTgS+M1sFvR0XkwmumDgwR13X2ieR+vGnjEFy9URhdQHEDrrNV0CvnW1uyyiHc
	lLBhG11PLPsy4Gg0C/3/iw+QKGlsP9M2HL2TL+rx5A7NoEwLjCt71ddrK+72+5L37Jfu7XwjLIbhs
	x7ErMxH/Yjl0JwJNPYAozCfCjA3QfbNc0qkTDJgYsIMDE4HZV7eGHM7+TeNrKJwE89wk5NQjS7cut
	IihYawITSvtDjmntr3J4irrjTodhgjm66mjm+4lGcWI7oBLg5vQW+hn7yGmM7PBGmZihFip1bo0DP
	RLhVEVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHin-0000000B499-28Kx;
	Fri, 06 Feb 2026 09:01:49 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHil-0000000B48l-1S4t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 09:01:48 +0000
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 91C687A0021;
	Fri,  6 Feb 2026 04:01:41 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Fri, 06 Feb 2026 04:01:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=likewhatevs.io;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1770368501; x=1770454901; bh=e6Q5jFK43Z
	J1Twf/eEHkLZQeVBspSGKtpQIWC0nWZzI=; b=j/yR3RmcRCUQB3p3fOJmIVSMfN
	l+iXWCqX6UvNAyb5hQVBeGVVMwciZbgRFYQjcM7dgneTs6unJEsdVMvxVwUEIoGz
	Xyr59fxbOPg4HIgmA858d8ytVE0rSb2HlDdgYzvo2QNsogP5U7u2EgDEiDjvEO7n
	9gGOd0O3jd1yJp0v8/yVuhWO+L6MGcXElD33Ktbz5/x3LOyLLRj4MXKmqgtY7Dpn
	wWHtCOv287afDheS9TOyMmXPC8WYrL7+CXOfrx23Lm0gItc7J6K6pGoLVGSe0qeF
	YXDEWZhzLZO6sU+n23nU5PFpL8d7CJ9ym51Qu+Jgi8M8lknjCIkFKzam2kaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770368501; x=1770454901; bh=e6Q5jFK43ZJ1Twf/eEHkLZQeVBspSGKtpQI
	WC0nWZzI=; b=pjku9ZbLF9pgCVJ6NcW4j8i70bylRNpHUdSFQwiNkUOVzrvn9K0
	L1zfywn23i8jHdH37inaSX3nxMLpal7/jV8dj3eiO9T11cWk1C74K1z24dWiQENm
	dZfJcDNhbZv1GYTPkOcqy0cdaXyz368PshzBcLRg2ZUzYe+XByUu9iFRv7cDwMed
	emok0U6Vdcccmyn88WQHmwC/5gcZgIdoEFun0oPCLH/dP56bgM+0oVPaUIQbINGm
	xYWfe6ey5q9qFc2Bf4bu2phW5p09clR66mp8bkI/ENpwqF/Wp6t2yaqAOY2DJD8f
	ppNCH3057Xh80k0nkbkWOaG5g4BpnBg9I1A==
X-ME-Sender: <xms:9a2FaVp8IOx3GOl2FHnzwimgDZoVeQF4aVpIeO7SWcdtKNvqa0nlRw>
    <xme:9a2Faf3e9yqur2x4TbczquCjtx1LGTIfe-fzhh460zijE_Y6z7HILnfzylSdQOusa
    _LpN_toz0uBdVgVKCyeob37fmqCtUZOWq6svdJfaUgfvSyZUmfQtcQ>
X-ME-Received: <xmr:9a2FadwBmH5Dw7Y36mBRQn76cprdMKr1n70wyzx5GY7pwVEu7L7i-Zo0dPkZCZERMn3gA-U5OO1gIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeejjeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgrthcuufhomhgr
    rhhuuceophgrthhsoheslhhikhgvfihhrghtvghvshdrihhoqeenucggtffrrghtthgvrh
    hnpeefveeiveeijefgueettdejleelieefvddtkeekudduveetveeutdehffeiueehuden
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtsh
    hosehlihhkvgifhhgrthgvvhhsrdhiohdpnhgspghrtghpthhtohepuddtpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehtjheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsehjrghnnhgruhdrnhgv
    thdprhgtphhtthhopehvkhhouhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvg
    grlhesghhomhhprgdruggvvhdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhn
    uhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsth
    hsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepughmrggvnhhgihhnvgesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:9a2Fabj4rFlVceoykmXZ55DOWR_EXYQaBKOcAjsqhCH_khiu37X_2w>
    <xmx:9a2FaQp6CWeQ8J7QU6WwbaOLg1I12bP7CIeQypKc_qZ1MF4GwUjOaw>
    <xmx:9a2FaSjFyoYkl6vt8RKuIjEDRC5goa6Og3xPFASZKp1TAanN3Rbx7A>
    <xmx:9a2FaSP9ItJ-9B6L8-X36eynNjlYQo0ikQqXmvksV1Z6apEsPlO6UA>
    <xmx:9a2FaSK_1RCmuqsYENXBncnezyaQFNrmPH10evF_gX7DHebGJPyke9U->
Feedback-ID: i7f194913:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 04:01:40 -0500 (EST)
From: Pat Somaru <patso@likewhatevs.io>
To: Tejun Heo <tj@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Vinod Koul <vkoul@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pat Somaru <patso@likewhatevs.io>
Subject: [PATCH] dma: apple-admac: Convert from tasklet to BH workqueue
Date: Fri,  6 Feb 2026 04:01:37 -0500
Message-ID: <20260206090137.1127897-1-patso@likewhatevs.io>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_010147_501253_77A4E412 
X-CRM114-Status: GOOD (  15.37  )
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

The only generic interface to execute asynchronously in the BH context
is tasklet; however, it's marked deprecated and has some design flaws
such as the execution code accessing the tasklet item after the
execution is complete which can lead to subtle use-after-free in certain
usage scenarios and less-developed flush and cancel mechanisms.

To replace tasklets, BH workqueue support was recently added. A BH
workqueue behaves similarly to regular workqueues except that the queued
work items are executed in the BH context.

This patch converts drivers/dma/apple-admac.c from tasklet to BH
workqueue.

The Apple ADMAC driver uses a per-channel tasklet to invoke DMA
completion callbacks for cyclic transactions. This conversion maintains
the same execution semantics while using the modern BH workqueue
infrastructure.

This patch was tested by:
    - Building with allmodconfig: no new warnings (compared to v6.18)
    - Building with allyesconfig: no new warnings (compared to v6.18)
    - Booting defconfig kernel via vng and running `uname -a`:
    Linux virtme-ng 6.18.0-virtme #1 SMP PREEMPT_DYNAMIC 0 x86_64 GNU/Linux

Semantically, this is an equivalent conversion and there shouldn't be
any user-visible behavior changes. The BH workqueue implementation uses
the same softirq infrastructure, and performance-critical networking
conversions have shown no measurable performance impact.

Maintainers can apply this directly to the DMA subsystem tree or ack it
for the workqueue tree to carry.

Signed-off-by: Pat Somaru <patso@likewhatevs.io>
---
 drivers/dma/apple-admac.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index bd49f0374291..8a0e100d5aaf 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -16,6 +16,7 @@
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
+#include <linux/workqueue.h>
 
 #include "dmaengine.h"
 
@@ -89,7 +90,7 @@ struct admac_chan {
 	unsigned int no;
 	struct admac_data *host;
 	struct dma_chan chan;
-	struct tasklet_struct tasklet;
+	struct work_struct work;
 
 	u32 carveout;
 
@@ -522,8 +523,8 @@ static int admac_terminate_all(struct dma_chan *chan)
 		adchan->current_tx = NULL;
 	}
 	/*
-	 * Descriptors can only be freed after the tasklet
-	 * has been killed (in admac_synchronize).
+	 * Descriptors can only be freed after the work
+	 * has been cancelled (in admac_synchronize).
 	 */
 	list_splice_tail_init(&adchan->submitted, &adchan->to_free);
 	list_splice_tail_init(&adchan->issued, &adchan->to_free);
@@ -543,7 +544,7 @@ static void admac_synchronize(struct dma_chan *chan)
 	list_splice_tail_init(&adchan->to_free, &head);
 	spin_unlock_irqrestore(&adchan->lock, flags);
 
-	tasklet_kill(&adchan->tasklet);
+	cancel_work_sync(&adchan->work);
 
 	list_for_each_entry_safe(adtx, _adtx, &head, node) {
 		list_del(&adtx->node);
@@ -662,7 +663,7 @@ static void admac_handle_status_desc_done(struct admac_data *ad, int channo)
 		tx->reclaimed_pos %= 2 * tx->buf_len;
 
 		admac_cyclic_write_desc(ad, channo, tx);
-		tasklet_schedule(&adchan->tasklet);
+		queue_work(system_bh_wq, &adchan->work);
 	}
 	spin_unlock_irqrestore(&adchan->lock, flags);
 }
@@ -712,9 +713,9 @@ static irqreturn_t admac_interrupt(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
-static void admac_chan_tasklet(struct tasklet_struct *t)
+static void admac_chan_work(struct work_struct *work)
 {
-	struct admac_chan *adchan = from_tasklet(adchan, t, tasklet);
+	struct admac_chan *adchan = from_work(adchan, work, work);
 	struct admac_tx *adtx;
 	struct dmaengine_desc_callback cb;
 	struct dmaengine_result tx_result;
@@ -886,7 +887,7 @@ static int admac_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&adchan->issued);
 		INIT_LIST_HEAD(&adchan->to_free);
 		list_add_tail(&adchan->chan.device_node, &dma->channels);
-		tasklet_setup(&adchan->tasklet, admac_chan_tasklet);
+		INIT_WORK(&adchan->work, admac_chan_work);
 	}
 
 	err = reset_control_reset(ad->rstc);
-- 
2.52.0


