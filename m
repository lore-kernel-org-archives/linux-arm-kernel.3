Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4F6EA3C5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UOjaI3iVPYi1dT+UAukN7BHSO+ocNBqoMnpe2lDsdA=; b=AAyEMNhk+y7ATaIvFMJiJve/AI
	HU6xcA3Rn4wRgblgOyypQu88dBPGijDIINcqYvf1XxKw2ekkxnRjrlYs8E6uHaHLp6L5pQFzJG6lK
	T+FhiVEP/qQCB5gps1ue9clJXeMpreNteztR3UjL7/PAR9dXXMPJ0rlZGgJnSBDTCuBEShNSKGTBX
	JJnnniyU9Dhdg8cI4TD2rLWnn5/EIHosE8MsHijavCg0DC1OUdmopnm8xV3HxUVVtDYVEbkaghBn5
	HYOqbEuJIRaEDEIFs9fqy3fOwHU2cJ1m4cw5AdazkyKwn8MKriYDlKfQKNKQkPhBCqKrQySIcSh+f
	MwfeCpww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApnl-0000000AaHy-2BFF;
	Thu, 09 Apr 2026 13:52:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApnH-0000000AZyb-0TP5;
	Thu, 09 Apr 2026 13:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775742696;
	bh=KyzQwUnfDm1fztBC6M2uhc6YYJnSNz50uKom2fCwuZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l4XS61sDtun10RvRrmAQdt2YKZsc3mBoeRg457cBWGGTuDs9yhOa93DjK/eKkcis/
	 I2jBM8k7jCXzYrakt2XSG/SUk+l3jYS0EN9pPNVJb45KOl9scpyPpxGFWTIw7QC0gQ
	 jOjaQDiSsKbnF1N7LAFSnfWJZ3zee3/v9sIi+a4DHcQ+Vmm1dq8Q82wEr7pUTLkUj6
	 LykLGfPf9suuSmY/syNld4fwOqDt+pJ6tlgud/jlwlMDKpO/Bj1hzOY7/BOvP58UIW
	 +3bNDUZyohkpOSW3EJvvvn70SBDrd6CIwaJga2/V6QSTkv3EST0WAPHSTi6mCuUwOg
	 Pu3/rB7H6f5DQ==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AAE7917E1340;
	Thu,  9 Apr 2026 15:51:34 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 09 Apr 2026 09:50:39 -0400
Subject: [PATCH 4/7] media: rkvdec: Remove unused need_reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rkvdec-multicore-v1-4-62b316abf0f7@collabora.com>
References: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
In-Reply-To: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_065139_324661_32FCBA92 
X-CRM114-Status: GOOD (  10.52  )
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

A left-over from the iommu restore mecanism was forgotten.
As need_reset is never set to true, the if has no use.

The actual restore function is called above it vase the IRQ isn't in a
success status.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 31ddfcc58894..db2731af06cf 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1462,7 +1462,6 @@ static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
-	bool need_reset = 0;
 	u32 status;
 
 	status = readl(rkvdec->regs + VDPU381_REG_STA_INT);
@@ -1478,9 +1477,6 @@ static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
 			rkvdec_iommu_restore(rkvdec);
 	}
 
-	if (need_reset)
-		rkvdec_iommu_restore(rkvdec);
-
 	if (cancel_delayed_work(&rkvdec->watchdog_work))
 		rkvdec_job_finish(ctx, state);
 
@@ -1491,7 +1487,6 @@ static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
-	bool need_reset = 0;
 	u32 status;
 
 	status = readl(rkvdec->link + VDPU383_LINK_STA_INT);
@@ -1507,9 +1502,6 @@ static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
 		rkvdec_iommu_restore(rkvdec);
 	}
 
-	if (need_reset)
-		rkvdec_iommu_restore(rkvdec);
-
 	if (cancel_delayed_work(&rkvdec->watchdog_work))
 		rkvdec_job_finish(ctx, state);
 

-- 
2.53.0


