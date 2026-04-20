Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422A9F588C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epN/pDy5G4Z8MoUOMI5ycq4Jdd+F3qbZguT+XwglrpA=; b=GhhqyPootptxDsfdnWnUcazrNE
	4k609KBUhe2hdARfVTYeAzgcgkrcki9YyDpcNTwA2ML1/vCKgT1oBxvqGvu6mAupHhOMmYm22PAUL
	kYfzsHRV+tMkHEx/JVXQA8uJAyXeTtKJHLCs5ZNnAdsxl4418jwQkOtVbQhxDZWVZLS0w1W1tMXaQ
	qDu1ibyCa6r25eRN+ib5kfTZi1azfyGh53IKD7FFnSETi7oXKRyymqyG6rlCoc2oxwa6xESGd1uDl
	anNMQCdNZgCbmYo6+psTTtm+wCYYzbQao/OrCoCaP3HswJ4l70RuwcTb+QTKXdF7CqMYYcMDLUTlS
	xX+QFQSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoiX-000000072Wp-00Wn;
	Mon, 20 Apr 2026 13:31:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoiT-000000072Vw-221c;
	Mon, 20 Apr 2026 13:31:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 68A2460582;
	Mon, 20 Apr 2026 13:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8A3C19425;
	Mon, 20 Apr 2026 13:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691868;
	bh=AihTpc5zkJtlqLbw58hois0YKMIhUHFtmGkHGFinRlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DXlSNuOkX1E6prdpOYzQjYgLYfzSipVs1hPKxKj1J7WZBU6ulLFt+8aqJQqBAylOr
	 WGtKChpLkxzq7MgWpccH08Tho5rKsEKwQu2J0WmxcvBorGinm41LGG1PvcQriwSMAS
	 shoTLfqy3EZaBkzydWKTJKml+4jE59hME/EYdR+Xg+MqxB56EaAh5x/a+UAyyM1fvL
	 v+Yb46P9ugG7hW3PyJq4izHqN7du9YZUwY9p9pLkQg0Ce3EP/CnG9rbwCRYZDUpR7j
	 9McXDbJ3cIjo8xfMK9nnP5f4G0WmpNE1dsMF3BUOSTJ6RFjcLuf24QGGf00xR+zmS9
	 9eopClbdSIvEg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	detlev.casanova@collabora.com,
	ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18] media: rkvdec: reduce stack usage in rkvdec_init_v4l2_vp9_count_tbl()
Date: Mon, 20 Apr 2026 09:20:35 -0400
Message-ID: <20260420132314.1023554-241-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.23
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit c03b7dec3c4ddc97872fa12bfca75bae9cb46510 ]

The deeply nested loop in rkvdec_init_v4l2_vp9_count_tbl() needs a lot
of registers, so when the clang register allocator runs out, it ends up
spilling countless temporaries to the stack:

drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c:966:12: error: stack frame size (1472) exceeds limit (1280) in 'rkvdec_vp9_start' [-Werror,-Wframe-larger-than]

Marking this function as noinline_for_stack keeps it out of
rkvdec_vp9_start(), giving the compiler more room for optimization.

The resulting code is good enough that both the total stack usage
and the loop get enough better to stay under the warning limit,
though it's still slow, and would need a larger rework if this
function ends up being called in a fast path.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Error: Failed to generate final synthesis

 drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index 0e7e16f20eeb0..bc74d2d824ef2 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -923,7 +923,8 @@ static void rkvdec_vp9_done(struct rkvdec_ctx *ctx,
 	update_ctx_last_info(vp9_ctx);
 }
 
-static void rkvdec_init_v4l2_vp9_count_tbl(struct rkvdec_ctx *ctx)
+static noinline_for_stack void
+rkvdec_init_v4l2_vp9_count_tbl(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_vp9_ctx *vp9_ctx = ctx->priv;
 	struct rkvdec_vp9_intra_frame_symbol_counts *intra_cnts = vp9_ctx->count_tbl.cpu;
-- 
2.53.0


