Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55759CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYVFOIUbAwPwHllf12BTU/bGWAyTr8BgHp6vL9D955c=; b=x3V0w2TKdPyAxVJpvy5Fi5k+R9
	HVraHnqD9pX3cNjF6V7cyOgvNUc0XPCDvN7+RCtT7yBebkbCm5ia8aWh8WFVxVxNmNhLqoPy5gUJ9
	HdNPL/mLrngJOECauiMqoHjMH+l/+IWeYQKG50J2akZJRflITFhztsoTfcpiXwwVu9IZ6PDxBCT/0
	MDTVGetKPJtPo2jVNj3MkOJN5UK8k2fdZN4876F+vD1kliZ96Y6wMKtdhj2dwDQCgVYfNcIU9tFhX
	Zhk3SPBOP63fmkoJCA5x6UKBt3NVMs6PFs+Vrzz2j+y2aQ+xvIktgkt/ryIJ6UD62hfcCtIOHyAO/
	jGnw1+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v638O-00000001Z11-2H44;
	Tue, 07 Oct 2025 08:33:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v637z-00000001YSD-1PjR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 08:33:02 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v637x-0002Hb-Mm; Tue, 07 Oct 2025 10:32:57 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 07 Oct 2025 10:32:05 +0200
Subject: [PATCH 12/16] media: rockchip: rga: handle error interrupt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-spu-rga3-v1-12-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
In-Reply-To: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_013259_591658_F1E64938 
X-CRM114-Status: GOOD (  15.79  )
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

Handle the error interrupt status in preparation of the RGA3 addition.
This allows the buffer to be marked as done, as it would otherwise
be stuck in the queue.

The RGA3 needs a soft reset to properly work after an error occurred,
as it would otherwise cease to deliver new interrupts. Also the soft
reset avoids additional error interrupts to be triggered, which are
currently not supported by the rga_isr function.
As it is unknown how the RGA2 behaves in the error case, no
error interrupt was enabled and handled.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c |  6 ++++--
 drivers/media/platform/rockchip/rga/rga.c    | 32 +++++++++++++++++-----------
 drivers/media/platform/rockchip/rga/rga.h    |  8 ++++++-
 3 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index d54183d224b3e9c42d5503acf172257f2e736f7b..93822b5b8b15e76862bd022759eaa5cb9552dd76 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -459,7 +459,7 @@ static void rga_hw_start(struct rockchip_rga *rga,
 	rga_write(rga, RGA_CMD_CTRL, 0x1);
 }
 
-static bool rga_handle_irq(struct rockchip_rga *rga)
+static enum rga_irq_result rga_handle_irq(struct rockchip_rga *rga)
 {
 	int intr;
 
@@ -467,7 +467,9 @@ static bool rga_handle_irq(struct rockchip_rga *rga)
 
 	rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
 
-	return intr & 0x04;
+	if (intr & 0x04)
+		return RGA_IRQ_DONE;
+	return RGA_IRQ_IGNORE;
 }
 
 static void rga_get_version(struct rockchip_rga *rga)
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 0a725841b0cfa41bbc5b861b8f5ceac2452fc2b5..3b5d2eb8e109f44af76dd2240a239b1fa8a78cee 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -56,30 +56,38 @@ static void device_run(void *prv)
 static irqreturn_t rga_isr(int irq, void *prv)
 {
 	struct rockchip_rga *rga = prv;
+	struct vb2_v4l2_buffer *src, *dst;
+	struct rga_ctx *ctx = rga->curr;
+	enum rga_irq_result result;
 
-	if (rga->hw->handle_irq(rga)) {
-		struct vb2_v4l2_buffer *src, *dst;
-		struct rga_ctx *ctx = rga->curr;
+	result = rga->hw->handle_irq(rga);
+	if (result == RGA_IRQ_IGNORE)
+		return IRQ_HANDLED;
 
-		WARN_ON(!ctx);
+	WARN_ON(!ctx);
 
-		rga->curr = NULL;
+	rga->curr = NULL;
 
-		src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-		dst = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	dst = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
-		WARN_ON(!src);
-		WARN_ON(!dst);
+	WARN_ON(!src);
+	WARN_ON(!dst);
 
-		v4l2_m2m_buf_copy_metadata(src, dst, true);
+	v4l2_m2m_buf_copy_metadata(src, dst, true);
 
-		dst->sequence = ctx->csequence++;
+	dst->sequence = ctx->csequence++;
 
+	if (result == RGA_IRQ_DONE) {
 		v4l2_m2m_buf_done(src, VB2_BUF_STATE_DONE);
 		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
-		v4l2_m2m_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx);
+	} else {
+		v4l2_m2m_buf_done(src, VB2_BUF_STATE_ERROR);
+		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_ERROR);
 	}
 
+	v4l2_m2m_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx);
+
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index e19c4c82aca5ae2056f52d525138093fbbb81af8..dc4bb85707d12f5378c4891098cd7ea4a4d75e2d 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -143,6 +143,12 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
 	rga_write(rga, reg, temp);
 };
 
+enum rga_irq_result {
+	RGA_IRQ_IGNORE,
+	RGA_IRQ_DONE,
+	RGA_IRQ_ERROR,
+};
+
 struct rga_hw {
 	const char *card_type;
 	bool has_internal_iommu;
@@ -152,7 +158,7 @@ struct rga_hw {
 
 	void (*start)(struct rockchip_rga *rga,
 		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
-	bool (*handle_irq)(struct rockchip_rga *rga);
+	enum rga_irq_result (*handle_irq)(struct rockchip_rga *rga);
 	void (*get_version)(struct rockchip_rga *rga);
 	void *(*try_format)(u32 *fourcc, bool is_output);
 	int (*enum_format)(struct v4l2_fmtdesc *f);

-- 
2.51.0


