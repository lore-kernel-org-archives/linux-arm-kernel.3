Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2327FC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 20:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaBVHMBJEdSJvTAgrA44sJjxmQK8L4c+Jox3WlUyVyI=; b=Cyj6mB3MdU7VjVMGjeLEMC6T2L
	nbKS14X9TKO7LlZoGTIuHHlYXsuhceIxbSfVFQRVwXMhYhrnjYbPxP8wmgixCIZaKNxEknl39+FY4
	spmZzB0FBFXUBY6rPd1xjXtjp6j38r6SqKyGOpm3fsH8sgq6GLjX9j+9R2BvNWMpQlH2P5bDnCeb1
	J9y9o1IijWVqLDGMIKAf+RQBUMalKM4tEXmY5KqvdQZ6acmknzzrRR3jkIggUkYQqAsG6xHelk5Nr
	LkEtzlOf8r/eO8cCRWH0RKJq42m8lnver2V81jqeg3N8TPVj6jd4q1B5tRI0mbZ/AZnWyDZDqXAZc
	l85JPVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukTdi-00000003cnf-2DSs;
	Fri, 08 Aug 2025 20:24:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukTJm-00000003a8q-42qN;
	Fri, 08 Aug 2025 20:04:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754683437;
	bh=cbLO7Ma+EdkDC2QdAiRI6lSh1FAiq/Nz4F7fvMKPYho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WEb1nipYM+UwqlmseEJla8tXRFuua05YVCYDZGOC1k9lihyuALgTkn47kwCEfMpto
	 23aXy/ev0zNixZL7JbVReNkKVWwPCFNWV+qIszgEI84wK6DQwmxJEEcrxed51qPI/n
	 Ne6IY8u0O3Z38v+o+xruyOIkOLeUPOszu60l990UVdgnrzNHyhoQ7RIrPK2oQzfJR6
	 aZIV8C4zM6juBor2OB48Dx4tSpFAkea4+fEGHjov/4Raixb19IyeFihzBNMkw6K/bv
	 FD05THxM/oO80JtOZi5HNFS/dHPJwBHih+hKKIo2k9sH5Xe+b5eeKm6T5puf08I5DB
	 EshYA/f8K5FBA==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 95EC417E132A;
	Fri,  8 Aug 2025 22:03:56 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 07/12] media: rkvdec: Support per-variant interrupt handler
Date: Fri,  8 Aug 2025 16:03:29 -0400
Message-ID: <20250808200340.156393-8-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808200340.156393-1-detlev.casanova@collabora.com>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_130359_144016_749142C2 
X-CRM114-Status: GOOD (  12.23  )
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
index 2602676a047a1..5f3057e8136b5 100644
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
2.50.1


