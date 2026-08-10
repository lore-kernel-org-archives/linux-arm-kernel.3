Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB18C5B570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/hzIcpl9qBctB2FH/fNV25Rj2bPRPI8liL1AiGfxT4=; b=3LDQQt5kwfP0eLVsch/qlFDfQa
	gk2wkGDLA3x+SLQVTMkNnng1e98grLs6Juc/MeNbJc9bUWfbzF/FQijIc/WgYvyk6aoTVfrC/47X3
	5iwbj6doJIFB1k0kwovqKwb5H26kd/xZNeR4KdP2DR9IFBpvJlEkNmUGWYMzhRKRd55SDwR6/zfaj
	tUFsa1+m0UNhjkAmY8RgZgh+1kt4YXnAGPmtIKBbfLb1IE8Zrq25vNgRNV28kqnpCnufbZukRYnmQ
	KEWdfeGPGKRo7tyEO1OyunXAsepQ080Z2egrLIo9dVdBT+ZAWAnnNkI6/Sulpo6n3Fv0U3mInIAqu
	+Hm4jJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRph-0000000CDRu-2cgH;
	Mon, 10 Aug 2026 15:22:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRpc-0000000CDJo-0Xid;
	Mon, 10 Aug 2026 15:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786375344;
	bh=HzMa2TTTRJC/kAywH5NeQSXaEXmOU6CGDcW/QAwpxFc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M5e99HWylpG40RkL06JrSwYDxRNs/1/5J0ycDw3+7Qp4D2IvfiPhsxcsBU3ZTaz6m
	 Yn94hdayDeeVmVRSE7P1QJmuZJlazLBEKTgGAJXTEBTRlnQ0vVFSCxuMn4PTTNZ6LI
	 wn9nAwSXROAOCMac/vK8cnIJtNE5BmonT5f1+gPh6g8uX+ppDptf4MbCP81Jn/9Ogp
	 e9tY0YHVXc6lEF2ytpkNTsUbdCRnaZyecP73esfsLp5QQ/Zz3C3DiEkmSVQ8bF6sVx
	 rOSjzUT3K8HjdTf+CSXD7aq0GmEkuMkfHNDBAz33yOJs1ZJnuQ+qarcyOAqJtQWDLA
	 iH54CYCoOkFtg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D72317E0899;
	Mon, 10 Aug 2026 17:22:23 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 10 Aug 2026 11:22:12 -0400
Subject: [PATCH v2 2/5] media: rkvdec: Remove unused need_reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-rkvdec-multicore-v2-2-986f89d22cdc@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
In-Reply-To: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_082228_327190_EA23C1EA 
X-CRM114-Status: GOOD (  10.82  )
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
2.55.0


