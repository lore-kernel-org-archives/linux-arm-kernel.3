Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89112C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IsBPvKUje3f+2ExPKKzn4AsC/tBgf5IioHXNc8hORXo=; b=y44a6ApDoVVwKYM9Uaza1PSqCG
	9YZLBgl8ZbT0oRuekLLOZYAL+K9r/FqUwWRSwL/0+tiZplaVlOBZkvuK/8ymgWbj/khZzU3mdghJG
	0WMx2gxULNnDtyTJRCH6YS6AUEsj4rYV0UZpGrAxAL1UbHIEHvfVno+mt4h/egwDoG3IP7eD84vzZ
	S0+Ujq5a7g84gZLQekvOBw8pJJhlD34rMNeU3by7iSsZjPuPe8c77lG30YRCDT41iZlKZp6U2awBi
	2ZD87q6arXA3+3Q6tCYi3mayCuMyCQGJl0yAphjlMqBbvdkLlFYS/IIEhylqjZ7dsAG+vFbRPyHDv
	TyRQ8dPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rGx-00000009VxZ-2E5l;
	Wed, 16 Sep 2026 15:10:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rGj-00000009Vq8-3I1s;
	Wed, 16 Sep 2026 15:09:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IsBPvKUje3f+2ExPKKzn4AsC/tBgf5IioHXNc8hORXo=; b=f5Hjv13Mx+vjOj5JeB3EquoUVv
	YrDZsJZ8JVhQZENkFRRi8bqI/7aWbXqsyQGdWY9b4nh1Pb3giM7s1S5gEiZIU4OXCK0lUhudpZwKc
	D+auCLj7Fl6L2GKab1i6+Jenzh9jN9MfYRs4StoEOHrNTtHyBD20jbmqQ07pCeCnR7GSj403HyIZ4
	AKmYC4aG8whYdJohHwVS6WAT3mhKtp0d7CQnSRfVqgzVvrXfMu6FT8S8h7T29dcs3NEkW2N1j5ECp
	BmLGHwfLznVUSx5uYlkXmkTE9+XOQqiZ2jZ1VUSQO0PTdSya1C9TroyNnfagufGZ1XtIDQKDGbvO9
	ZmgSm3UQ==;
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6rGg-000000081Ig-3Bhs;
	Wed, 16 Sep 2026 15:09:52 +0000
X-PTX-Original-Recipient: ezequiel@vanguardiasur.com.ar
X-PTX-Original-Recipient: jacob-chen@iotwrt.com
X-PTX-Original-Recipient: mchehab@kernel.org
X-PTX-Original-Recipient: detlev.casanova@collabora.com
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: lgs201920130244@gmail.com
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: s.pueschel@pengutronix.de
X-PTX-Original-Recipient: m.tretter@pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 174532020F4;
	Wed, 16 Sep 2026 17:09:47 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGc-001Fsx-37;
	Wed, 16 Sep 2026 17:09:47 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:42 +0200
Subject: [PATCH v2 01/17] media: rockchip: rga: zero cmdbuf in shared code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-1-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
In-Reply-To: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Guangshuo Li <lgs201920130244@gmail.com>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_160950_990015_EF0CE3B3 
X-CRM114-Status: GOOD (  13.54  )
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
index c4a71306278ba..46ba6d270f232 100644
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
2.55.0


