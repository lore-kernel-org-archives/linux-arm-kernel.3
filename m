Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAD9CD8C85
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 22:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0imlaBkFtDCtwP+7YjWmpGsUt8sdmbWOC27/NrIpxWA=; b=eHv4P9mxLe0CjtTkPnY9KRYxym
	zTAbhp4V5q0pR5799z4+sWogPy7PHRRJvHsL18FMHHuIeSgneJ+FplUPs0QwvmVu4NZbxyZo0uRsN
	ahHyFpKJMbnFEWm8bihoXrEHEJ2XmBE2a/dlADTmX0o/czXakHOB05cOy4/yBEnLNoGuiSHGgutVp
	cqRC67gRKGRMB10LxMOIhBWFN132X9BYeT4bliyj5UbsUiMMNCMElyjh5gnYeVTcZMsooII8kOMAR
	XZu8PCIQS1wWLjeXvAw2yRGqQtCP4YBJOME0m/N5eOJugUbX5+o+iGuzt0i8JvGp5pVOLPd53MwZy
	deeCmNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciR-00000001Ebu-1Oet;
	Fri, 05 Jun 2026 22:08:35 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciJ-00000001EHy-42SC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 22:08:29 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVchz-0000LW-W1; Sat, 06 Jun 2026 00:08:08 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:47 +0200
Subject: [PATCH 01/17] media: rockchip: rga: zero cmdbuf in shared code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-1-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
In-Reply-To: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_150828_041541_A0A74569 
X-CRM114-Status: GOOD (  13.55  )
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

Zero the command buffer (cmdbuf) in the shared code instead of the
individual RGA2/RGA3 implementations. Besides centralizing the memset
operation this also uses the cmdbuf_size member for the memset size,
which is also used as the size for the actual allocation.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c  | 2 --
 drivers/media/platform/rockchip/rga/rga.c     | 1 +
 drivers/media/platform/rockchip/rga/rga.h     | 3 +++
 drivers/media/platform/rockchip/rga/rga3-hw.c | 2 --
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index be1bc8ddbd03b..4d7b0a03820a1 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -443,8 +443,6 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 
 static void rga_hw_setup_cmdbuf(struct rga_ctx *ctx)
 {
-	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
-
 	rga_cmd_set_mode(ctx);
 	rga_cmd_set_trans_info(ctx);
 }
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index b3cb6bf8eb863..bd0afd33affe4 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -41,6 +41,7 @@ static void device_run(void *prv)
 	spin_lock_irqsave(&rga->ctrl_lock, flags);
 	if (ctx->cmdbuf_dirty) {
 		ctx->cmdbuf_dirty = false;
+		memset(ctx->cmdbuf_virt, 0, rga->hw->cmdbuf_size);
 		rga->hw->setup_cmdbuf(ctx);
 	}
 	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index bd431534d0d39..2b4f5694375a4 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -152,6 +152,9 @@ struct rga_hw {
 	u8 stride_alignment;
 	u8 features;
 
+	/*
+	 * Requires that the cmdbuf is already zeroed.
+	 */
 	void (*setup_cmdbuf)(struct rga_ctx *ctx);
 	void (*start)(struct rockchip_rga *rga,
 		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/media/platform/rockchip/rga/rga3-hw.c
index ca1c268303dd4..72741e1faccff 100644
--- a/drivers/media/platform/rockchip/rga/rga3-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
@@ -261,8 +261,6 @@ static void rga3_cmd_set_wr_format(struct rga_ctx *ctx)
 
 static void rga3_hw_setup_cmdbuf(struct rga_ctx *ctx)
 {
-	memset(ctx->cmdbuf_virt, 0, RGA3_CMDBUF_SIZE);
-
 	rga3_cmd_set_win0_format(ctx);
 	rga3_cmd_set_trans_info(ctx);
 	rga3_cmd_set_wr_format(ctx);

-- 
2.54.0


