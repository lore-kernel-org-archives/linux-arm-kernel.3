Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3401AC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRs/qFgKyV+R37c/aAGxPOjQkrF2BH9wI1v0rOsm3GQ=; b=BInlz44Sz3YXyV0NakRScCwJcM
	6Q018qqBmo3FZebj44ScteuvwJd0eTR8r4001WjgeGlozNJo97nzHZ6f5RSYhSZWJU5R1soppyV64
	RwPign+NKqfDcVzLcDNsDU0KDs/L6L5ft0i4jkQlNq99ClRCVPjhUr0KqYbmCIFhT4FdT+hFTPeET
	FpGCMhEYkIQSiqzPieVQhg18k0EG0kWpZed1TXXFG777Kc59ab0CtmcgkFmdfp+dwfRk9Q0T5NMul
	FJMEnpqZvy0bKIcYHSotAkKD6xURbhkOYrFhxXVM4ydczTNGxA8t6s30Udi8lm79e3XptaIorArHx
	sNsTmHEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAbc-00000005sek-3CJb;
	Tue, 08 Jul 2025 15:51:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZA76-00000005lha-3wbs;
	Tue, 08 Jul 2025 15:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751988007;
	bh=ZBR6TyvvAIxLQbGrdQjFdRd1cDVGsmsUKeXvIrF7mQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tg+zZpT8Gwrv8zcakaFyqpOH9bykOWM4LkU6f9mZoExepg6eLP8dLo/ICc+H7RHEZ
	 v1XS1+bAQovye+HkLTeVgnCVoyYHTzjxd0z0wJlFXJeSd9uM+23qOONl4o7/Z/dsQk
	 tawqp+CwZsO46T7xJh527Qf+7WafQf1QdNUi1y4EM88M/gtjZPLxZQlryayOJwEqhd
	 Ewly4qGzlZ/sHC1zpkNE2N9J7DRbuOl8JQw26w5LrZGVwqVWEFEg36go0nw9pSlaBH
	 Ew2Rmpjq2pX32HvxfM08gU/izrcJawMFhOHp2ToMfI9Y7qseSaRpgT9eXh+el3m2QQ
	 2IrMleRLtiZNQ==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ECE3417E0456;
	Tue,  8 Jul 2025 17:20:05 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 07/12] media: rkvdec: Support per-variant interrupt handler
Date: Tue,  8 Jul 2025 11:19:40 -0400
Message-ID: <20250708151946.374349-8-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708151946.374349-1-detlev.casanova@collabora.com>
References: <20250708151946.374349-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_082009_153583_E3F859F4 
X-CRM114-Status: GOOD (  12.25  )
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

Preparation commit for supporting different variants with different
interrupt management.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 15 ++++++++++++---
 drivers/media/platform/rockchip/rkvdec/rkvdec.h |  1 +
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 3285dd910c327..d5d69ee56cb62 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1102,10 +1102,9 @@ static void rkvdec_iommu_restore(struct rkvdec_dev *rkvdec)
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
 
@@ -1126,6 +1125,15 @@ static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
+{
+	struct rkvdec_dev *rkvdec = priv;
+	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
+	struct rkvdec_config *cfg = rkvdec->config;
+
+	return cfg->irq_handler(ctx);
+}
+
 static void rkvdec_watchdog_func(struct work_struct *work)
 {
 	struct rkvdec_dev *rkvdec;
@@ -1144,6 +1152,7 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 const struct rkvdec_config config_rkvdec = {
 	.coded_fmts = (struct rkvdec_coded_fmt_desc *)rkvdec_coded_fmts,
 	.coded_fmts_num = ARRAY_SIZE(rkvdec_coded_fmts),
+	.irq_handler = rk3399_irq_handler,
 };
 
 static const struct of_device_id of_rkvdec_match[] = {
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 3a073883d21eb..679de66df2479 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -107,6 +107,7 @@ struct rkvdec_config {
 	size_t coded_fmts_num;
 	struct rcb_size_info *rcb_size_info;
 	size_t rcb_num;
+	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
 };
 
 struct rkvdec_dev {
-- 
2.50.0


