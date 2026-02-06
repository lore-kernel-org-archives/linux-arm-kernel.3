Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064A1EE6B69
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 22:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7gD00ofvgdE2X5UA+AH8QBhGtuM17gN4fure9pmx0xo=; b=AFKWMVIRhbLFnMtQsQVYJ8O4bp
	TWHA6LDPHokt4iHJw54MQk+FyMefBUTXGcOGaABt17VCNwadG6HOgr04TLkmM/L/TZgEAsObDvxSc
	yAhWvQGlIq3SC4xa4JaUoDsbgWFkhg2yX9eca3ROhliwiWAZ/nFdnvbegbVF1QeRteXeHFAFi1rV1
	aQvg9fkPqTPzAJyjCJD3wWRozf5iPyv3J79tJ+/yR0CgJaSN9LW1m8CT/hC12JmVpXI5YC1KUfO+O
	F/PHrHj5lCmvfQ3QBeppT8YY8TJRXN8pvbL0VLmGGWBQiiCeLWI+kWc74ZAO86fapXDHDiQJThywh
	mKkm4b+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voU3q-0000000BrtS-1P1z;
	Fri, 06 Feb 2026 22:12:22 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voU3n-0000000Brt7-0Zq1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 22:12:20 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 49FB71D00011;
	Fri,  6 Feb 2026 17:12:17 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 06 Feb 2026 17:12:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=likewhatevs.io;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1770415937; x=1770502337; bh=7gD00ofvgd
	E2X5UA+AH8QBhGtuM17gN4fure9pmx0xo=; b=XeSX3y5WNjP3YOv/mH/kzEMF8j
	KsSP5hRz5psK/lWHyHwwdGIzye0Q60sfPUn7oSG/alqgJ+tQOVqhOH4mEPx+zuru
	MiaCd11l9SoMyViTMD9r9L/UIclVWcvfvKzRFixUkHYrwsAqSchwYeBSj7TbVsUf
	uRSU2hkWNbvgjVtuF/TVnONcb+PCj5bO75Y5pPu1MJ4vrWPqjzj1/H9wKvb2di/g
	Lb0cYXtVSqCm6w7diCJ2GB14GMI+sOAHJEHn7uM7aiBP+c+DC3I0oUkuyA53mN4I
	yQGr6OyMfg5i7TtcE/A0bvrcTcKNwc0h23tTb8oAOi1Is9jAxNwhUwjgK3uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770415937; x=1770502337; bh=7gD00ofvgdE2X5UA+AH8QBhGtuM17gN4fur
	e9pmx0xo=; b=fm+4d4qhBAR0zgb4evNXydaGTby/BHkfsRsQnZvZ/KG8/WXEADc
	vT0MQvgdHOsspvf/MBh1DsiQw39MvSVHGcet+xX0UZShUah1kqBngnmC+9ZPNngD
	YkvVLPgLRbvs1EjpasFzjyN2FkP7uDtKh9R2y+iUe8i0eto8Xycop0NVtF+Nna7s
	Df6uMgaOR4O7tAmQUVkVfYPlJLlAcs0NiRw14hd1XuVsJ4kAAIEVlDTYoEIL+TeO
	E4tETnsoDxDss5gZjnGOFp+O2Za78xIBKrK3y1reIoYUfEW4omKkRrA+6m3MV3m0
	e1PtvR5mZhIZGIaYPkwJVcHv8jEb+Vj/yrg==
X-ME-Sender: <xms:QGeGaT3AKB2-9_5-U0KsBLA5wy4z2RusDVexFKt5WRvqTkbyWJQXJA>
    <xme:QGeGad4SfuIlx36RvVJw1Mq-WuZeDLFs01Y3kZJThAOvJDkyD4x7e4UtTKhqdZEBU
    S26Yi6bpJ1FxgOXJq0_-_MDVobDvOvJAY8aytvrj1_zEvnGiOtavF5Z>
X-ME-Received: <xmr:QGeGafS1mmUG_7sTYzDJ6h32j56YI3ksP1q4LTWgTVwZz3hjDdBzuOYOHSGthHN99NQDdGvWFIztmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeelfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgrthcuufhomhgr
    rhhuuceophgrthhsoheslhhikhgvfihhrghtvghvshdrihhoqeenucggtffrrghtthgvrh
    hnpeefveeiveeijefgueettdejleelieefvddtkeekudduveetveeutdehffeiueehuden
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtsh
    hosehlihhkvgifhhgrthgvvhhsrdhiohdpnhgspghrtghpthhtohepuddupdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehtjheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsehjrghnnhgruhdrnhgv
    thdprhgtphhtthhopehvkhhouhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvg
    grlhesghhomhhprgdruggvvhdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhn
    uhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsth
    hsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepughmrggvnhhgihhnvgesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:QGeGaSXu9skGpcL3m21MSqLgcIhyVOW5ttPMjCBkiaNvpfezD5aw1w>
    <xmx:QGeGaUE6v74vlcakoq93tPWKfFuKpxlfxH2SjqvIzy23lx_f_Hce9w>
    <xmx:QGeGaVcFrUI-ubSg4bjiAxMRuRLswXmyNLPBh5Eeof9V_aWb2ETRSg>
    <xmx:QGeGadp9RP7UPI6l7NmlWKiIawf4rqwy-9wNWsccQ8fdJTFFTVqSkw>
    <xmx:QWeGae3l4YhOJLx8Q6S6lkzGMFcgNDs6vLdVdk6HUahF-67o_3crtjm5>
Feedback-ID: i7f194913:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 17:12:16 -0500 (EST)
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
	Pat Somaru <patso@likewhatevs.io>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2] dma: apple-admac: Convert from tasklet to BH workqueue
Date: Fri,  6 Feb 2026 17:11:43 -0500
Message-ID: <20260206221143.1261191-1-patso@likewhatevs.io>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_141219_381004_58F076DD 
X-CRM114-Status: GOOD (  15.22  )
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

Convert apple-admac.c from tasklet to BH workqueue

Semantically, this is an equivalent conversion and there shouldn't be
any user-visible behavior changes. The BH workqueue implementation uses
the same softirq infrastructure, and performance-critical networking
conversions have shown no measurable performance impact.

Signed-off-by: Pat Somaru <patso@likewhatevs.io>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v2: Updated commit message

 The Apple ADMAC driver uses a per-channel tasklet to invoke DMA
 completion callbacks for cyclic transactions. This conversion maintains
 the same execution semantics while using the modern BH workqueue
 infrastructure.

 This patch was tested by:
    - Building with allmodconfig: no new warnings (compared to v6.18)
    - Building with allyesconfig: no new warnings (compared to v6.18)
    - Booting defconfig kernel via vng and running `uname -a`:
    Linux virtme-ng 6.18.0-virtme #1 SMP PREEMPT_DYNAMIC 0 x86_64 GNU/Linux

 Maintainers can apply this directly to the DMA subsystem tree or ack it
 for the workqueue tree to carry.

 Thanks for letting me know about talk to maintainer section, Frank!

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


