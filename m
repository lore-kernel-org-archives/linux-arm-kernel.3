Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AA260700A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zq8NptH7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nN4tCDxNLeRU5R4W+fMv3UuvdUzisOZ7ub+YA8VErpM=; b=Zq8NptH7mTOMD9MjLhxetVopW7
	QdcdAyYwdBDfO2p1wOEA/CFy4xbufuCPCIafA0qlMkqIIsk+PKhOQqQG9bD0TQeBR+Ro25ATpGmFt
	l2dNw97cuNTN+quWCjUXBsQf2w21r++TuE+mfr/sondCaWiaxZBqdGusxnocwQsrbz3oNqQm+Ke4r
	lw+QFfiFhDpBHwz5AbZ4nY4NzvOW5mxHp8p1tUK5vVRR5U95uKbcmKe+Y58bF+MH5y2XOiJyAG1pn
	2QnqCzRLLC1ykpXK2XrZhACToevDxYmBM5xMttqizSlKa996HAJ8cWixZMRlmFn0tv0b+Dszf2oVc
	WUZJFFjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC1H-000000023x2-2KjU;
	Tue, 03 Nov 2026 10:45:36 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC1E-000000023vs-39nS;
	Tue, 03 Nov 2026 10:45:34 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xOC18-0000000031h-0D0e;
	Tue, 03 Nov 2026 10:45:26 +0000
Date: Tue, 3 Nov 2026 10:45:23 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] media: rockchip: rkcif: mask MIPI interrupts when powered
Message-ID: <24332831989fde000959b3d3037333f511b95ece.1793702189.git.daniel@makrotopia.org>
References: <cover.1793702189.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793702189.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_024532_791185_B8F79C11 
X-CRM114-Status: GOOD (  15.74  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MIPI interrupt enable register comes out of every reset with all
27 sources enabled. Of those only the frame end bits are handled, so
the line stays asserted at about a thousand interrupts per second
while the block is powered. The kernel then reports the interrupt as
unhandled and disables it, after which frame completion only happens
from the spurious interrupt poll. The poll can also call the handler
while the block is clock gated.

Clear the enable register and the status bits after the block has been
reset and clocked, and after the reset in runtime suspend. Treat any
status bit that the handler has read and cleared as handled.

Assisted-by: LLM
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../rockchip/rkcif/rkcif-capture-mipi.c       | 19 +++++++++++++++++++
 .../rockchip/rkcif/rkcif-capture-mipi.h       |  2 ++
 .../media/platform/rockchip/rkcif/rkcif-dev.c |  3 +++
 3 files changed, 24 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index bc9518f8db507..686b995525b9b 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -810,6 +810,23 @@ static void rkcif_mipi_set_crop(struct rkcif_stream *stream, u16 left, u16 top)
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, val);
 }
 
+void rkcif_mipi_irq_mask(struct rkcif_device *rkcif)
+{
+	if (!rkcif->match_data->mipi)
+		return;
+
+	for (unsigned int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
+		struct rkcif_interface *interface =
+			&rkcif->interfaces[RKCIF_MIPI_BASE + i];
+
+		if (!interface->rkcif)
+			continue;
+
+		rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, 0);
+		rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, ~0);
+	}
+}
+
 irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
 {
 	struct device *dev = ctx;
@@ -823,6 +840,8 @@ irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
 
 		intstat = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
 		rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, intstat);
+		if (intstat)
+			ret = IRQ_HANDLED;
 
 		for (unsigned int j = 0; j < interface->streams_num; j++) {
 			struct rkcif_stream *stream = &interface->streams[j];
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
index 7edaca44f653c..167b43756929b 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
@@ -21,4 +21,6 @@ void rkcif_mipi_unregister(struct rkcif_device *rkcif);
 
 irqreturn_t rkcif_mipi_isr(int irq, void *ctx);
 
+void rkcif_mipi_irq_mask(struct rkcif_device *rkcif);
+
 #endif
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
index be3a174b9aab0..fbc8ed78d99ea 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
@@ -281,6 +281,7 @@ static int rkcif_runtime_suspend(struct device *dev)
 	reset_control_assert(rkcif->reset);
 	udelay(5);
 	reset_control_deassert(rkcif->reset);
+	rkcif_mipi_irq_mask(rkcif);
 
 	clk_bulk_disable_unprepare(rkcif->clks_num, rkcif->clks);
 
@@ -298,6 +299,8 @@ static int rkcif_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	rkcif_mipi_irq_mask(rkcif);
+
 	return 0;
 }
 
-- 
2.56.0

