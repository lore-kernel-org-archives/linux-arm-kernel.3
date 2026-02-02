Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12F5E7314A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 09:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9d+07VQ9aR+mZG5e89dL5SGfQBLbhMuNE+dcDvZHhhk=; b=FIDTbuy8uDfK7QZPamaGIpLwdQ
	YPfeW7BTwzplSSTHzqWDMiQnt6XqlGCpIOBYpmwNf2y//QyaE+VgXOJQ3gjb834hjR42JIuY02Bth
	KWLJwoG1k19fUP+kf3091fa5scCncn+xuOxb0wb25nG1vdQw0F1qMdsmDsMBa+x4pUiZCfrsnwe03
	oCUSIVtwOsmDB7EeIWA7MCyZxrDbIVqjC3v7a7x1R2cPC0oDXKFTUJjX5+xDQv/RTT3O4Hz3isnuY
	TPBfataSDdKLwFX/X0gY14mnoVZqTiVRlCX8b3uXce/9ZV7wHS6sGZdJ7J69GeGpSAcSc837dNERk
	6JalUYtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqXf-00000004joy-0KUb;
	Mon, 02 Feb 2026 09:48:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqXe-00000004joQ-0Iho;
	Mon, 02 Feb 2026 09:48:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC3D560128;
	Mon,  2 Feb 2026 09:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9CBC116D0;
	Mon,  2 Feb 2026 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770025700;
	bh=Bm7qdPpSoR5RRd8RoFj0NDJeq7mpHyYT/MEjRskwOdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YwOBVfGtz4+jEDqeo9pQ5HBte1t/4o1Bebg2wlqQVp+8zfvUwoZx2qcUw0XJ5XPxD
	 9BxEnOWVyvYE2GN1hj0ZZ/AFb9hvN8N/6snz3XZx4cziJ0mHkfuKNK6UFegAMT/7Wi
	 +jkgf/wDOo06SjM9msgv2Ihg08bFz+OQyeDBJUflNwSsPYNE33UBA8osjSfu9hpepb
	 KS2QMaYynMFhQ7xBQzjT/MtJ8ROb9Ka7D9pHpcwyKhi/FhgXOxYkxOHSgU+4p1JDeO
	 K1NUWVli90AZOgK6G6Kwq3k+7IX7qtU+MxBlJEtB5kRrgH5tgceLSbPlMyLhgUP7mt
	 19U9Zh9m8ufLA==
From: Arnd Bergmann <arnd@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Jonas Karlman <jonas@kwiboo.se>,
	Alex Bee <knaerzche@gmail.com>
Subject: [PATCH 2/2] media: rkvdec: reduce stack usage in rkvdec_init_v4l2_vp9_count_tbl()
Date: Mon,  2 Feb 2026 10:47:51 +0100
Message-Id: <20260202094804.1231706-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260202094804.1231706-1-arnd@kernel.org>
References: <20260202094804.1231706-1-arnd@kernel.org>
MIME-Version: 1.0
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
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index ba51a7c2fe55..1c875d5a2bac 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -893,7 +893,8 @@ static void rkvdec_vp9_done(struct rkvdec_ctx *ctx,
 	update_ctx_last_info(vp9_ctx);
 }
 
-static void rkvdec_init_v4l2_vp9_count_tbl(struct rkvdec_ctx *ctx)
+static noinline_for_stack void
+rkvdec_init_v4l2_vp9_count_tbl(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_vp9_ctx *vp9_ctx = ctx->priv;
 	struct rkvdec_vp9_intra_frame_symbol_counts *intra_cnts = vp9_ctx->count_tbl.cpu;
-- 
2.39.5


