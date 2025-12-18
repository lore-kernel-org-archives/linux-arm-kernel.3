Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB15D711CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 23:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snt5jGbknxzBaon7L9y1/uydCxuyHWJMm2YTNHmFlkc=; b=GT6sPRkpC0kVfqsszBgAK3RVq/
	OLx+4FxMPtALEFYM/Mh5cqOXThqdI+Pia2NAn7i2HpwBEv3bQ+SKyd5L6a/mA3TRF/eS63hkBI9mX
	KVUgYYW6wztOpblrHb47MZlzd1O6FG27zLkYKeqAO+IU0WugN8lZJfgLLiKn0l7dSRx6D5Qr19axr
	JLichx2Fn/1Cs/z0INmaWWHkT/n6w4JISBzHI+2N9ztj4I81nAaAqB4pNfQgjX7JYZT/u1lX7OCJr
	phqxfdSLOE2c4/AZBJ7XMd+QGIo4iMhqUFNQiVHkE4+PqzZYMvFXQdZ7sLao5nUVuHZPTF/4cyJDX
	uoUEa3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWNR5-00000009KWT-25kY;
	Thu, 18 Dec 2025 23:29:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWNQs-00000009K2s-1xI4;
	Thu, 18 Dec 2025 23:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766100543;
	bh=ZEGBz1FCVl0fR3pfegZGsHwXpHzV3xPQaH5hpaCSvk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PeDoACR9kbfy2ApM1GuJcbGKyz1ogn8hesnEovlHT+POFJW7JoEDB54SFtX0xGl7N
	 pc3OOyM52Go0sZMiCFTWf8KINVMJKHqx9d0FgnICs8AYAlfnnuHs7Te4qIJL+bvw/Q
	 gLI8Lc0wCKHlldbfx9LLCUfSKrmydMfsb7+fZ2Rw7quI4x/Ud2nO2ls2hHs5ovh5Jh
	 rJr3U9xg5mrVFbxAX1NJoND05b14o3ZORVcnLiS9gMHLg5rDN7j6GolwXXbQF8JcUo
	 JFgjsxX5OPFUexqfk1oRmmlSd7fjB2SWzc/cCWr8tg6FUNWhgIem30adfYztCV6ZBZ
	 93k2XWGmZ7knQ==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 11CA117E1520;
	Fri, 19 Dec 2025 00:29:00 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pavan Bobba <opensource206@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v7 11/17] media: rkvdec: Support per-variant interrupt handler
Date: Thu, 18 Dec 2025 18:28:21 -0500
Message-ID: <20251218232829.337811-12-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218232829.337811-1-detlev.casanova@collabora.com>
References: <20251218232829.337811-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_152918_736442_D3B6B149 
X-CRM114-Status: GOOD (  12.76  )
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

Prepare for supporting different variants with different interrupt
managers.

To support other variants specific function type later, introduce the
rkvdec_variant_ops struct.

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 21 ++++++++++++++++---
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  5 +++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index ff6a09e45462e..174536ebdcc7c 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1222,10 +1222,9 @@ static void rkvdec_iommu_restore(struct rkvdec_dev *rkvdec)
 	}
 }
 
-static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
+static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = priv;
-	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
+	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
 	u32 status;
 
@@ -1246,6 +1245,15 @@ static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
+{
+	struct rkvdec_dev *rkvdec = priv;
+	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
+	const struct rkvdec_variant *variant = rkvdec->variant;
+
+	return variant->ops->irq_handler(ctx);
+}
+
 static void rkvdec_watchdog_func(struct work_struct *work)
 {
 	struct rkvdec_dev *rkvdec;
@@ -1261,16 +1269,22 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	}
 }
 
+static const struct rkvdec_variant_ops rk3399_variant_ops = {
+	.irq_handler = rk3399_irq_handler,
+};
+
 static const struct rkvdec_variant rk3288_rkvdec_variant = {
 	.num_regs = 68,
 	.coded_fmts = rk3288_coded_fmts,
 	.num_coded_fmts = ARRAY_SIZE(rk3288_coded_fmts),
+	.ops = &rk3399_variant_ops,
 };
 
 static const struct rkvdec_variant rk3328_rkvdec_variant = {
 	.num_regs = 109,
 	.coded_fmts = rkvdec_coded_fmts,
 	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
+	.ops = &rk3399_variant_ops,
 	.quirks = RKVDEC_QUIRK_DISABLE_QOS,
 };
 
@@ -1278,6 +1292,7 @@ static const struct rkvdec_variant rk3399_rkvdec_variant = {
 	.num_regs = 78,
 	.coded_fmts = rkvdec_coded_fmts,
 	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
+	.ops = &rk3399_variant_ops,
 };
 
 static const struct of_device_id of_rkvdec_match[] = {
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 751f39afe7e2d..faabedd2b9d88 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -67,12 +67,17 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 			    base.vb.vb2_buf);
 }
 
+struct rkvdec_variant_ops {
+	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
+};
+
 struct rkvdec_variant {
 	unsigned int num_regs;
 	const struct rkvdec_coded_fmt_desc *coded_fmts;
 	size_t num_coded_fmts;
 	const struct rcb_size_info *rcb_sizes;
 	size_t num_rcb_sizes;
+	const struct rkvdec_variant_ops *ops;
 	unsigned int quirks;
 };
 
-- 
2.52.0


