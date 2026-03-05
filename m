Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2586AF33A8E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 15:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naiI77TdT1fRu5q7awYSTJoZgIwC86MdwT3OXDVKEZU=; b=ypKp4FiXSEmG0aX6BFI1aiaYe8
	HudyPerhOIfKT8nVPdDH/NHJUat2yHlRHFLdwz93UlF+lob5BbKw8ZS06rv3GCwbLAsf56Mwpor6Z
	aBNTNPniL7l5dXi7pVUvDhtDv158213ASMl7BrHey2rY8d0SuiZ2H96qE+Huss0tS5o2Yhyv5D1qH
	VCLLuQJvXq0+mgROkoLgMalV5kcJu9UoOERxgCFiboKT9fXzUT0T28UPWMxqH8qv9mBnpstQMjlv/
	gosfJ7tdYgi8ljyDKiCt63SuS+QnqnFp/2G8q64FN4OpK91uOi1iml7FqG9t5BE93+hjF4lb7YNrG
	IjoxNlWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAbP-00000002762-1zWy;
	Thu, 05 Mar 2026 15:27:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAbO-0000000275a-25UJ;
	Thu, 05 Mar 2026 15:27:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EEF8600C4;
	Thu,  5 Mar 2026 15:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86731C19423;
	Thu,  5 Mar 2026 15:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772724421;
	bh=9che9S/rfD6SJcfVDz2SXnU+7MBs/hKF8MhWtpvGqig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IWiqRWLbDF94tCasvan1T3MoT25tOqEQkcz2TfW2kmEyKjFyzSCCCJ1pf4Fg+oiGc
	 Kvn6Oc7nCZ5oxJpvT3tYbKQHSNu27DF8jvm7mglAxodFk7mVbnTDOk+tfr6TpoOktl
	 nEr0kndNA06XG2HZahfe32ZqmvLHBiqUB/sWfSnGVaTwgf4OD6XzGmSjf5PMjJyhA1
	 sS0DgbPR/h7cH41OJYAu1Isx0Hv/8z1BkChrPxUHgqpGHfALXptkLCm0e/NbGQELI7
	 pPcidjKrhH4P4g4gbevtk+rLC4rkFY1Eb5uZqvmk64mRAFLQawZzkgWzfHj+YRVESP
	 LgSEUjZOpch9g==
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
	Alex Bee <knaerzche@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 2/2] [v2] media: rkvdec: reduce stack usage in rkvdec_init_v4l2_vp9_count_tbl()
Date: Thu,  5 Mar 2026 16:26:17 +0100
Message-Id: <20260305152644.791897-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260305152644.791897-1-arnd@kernel.org>
References: <20260305152644.791897-1-arnd@kernel.org>
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

Split out the innermost loop into a separate function that is marked
noinline_for_stack. I tried out all combinations of having some of
the inner loops inside of the separate function, but this was the only
veriant that creates reasonable code with clang-22 on arm64.

Link: https://lore.kernel.org/linux-media/20260202094804.1231706-1-arnd@kernel.org/T/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
--
v2: rework after sering more of the same warning with v1 applied.

My earlier version was much simpler but still exceeded 1280 bytes of
stack space in some configurations for unnecessary variable spills.
---
 .../platform/rockchip/rkvdec/rkvdec-vp9.c     | 48 ++++++++++---------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index e4cdd2122873..ecb2819bd566 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -893,12 +893,36 @@ static void rkvdec_vp9_done(struct rkvdec_ctx *ctx,
 	update_ctx_last_info(vp9_ctx);
 }
 
+/* noinline to ensure clang's register allocator doesn't run out of registers */
+static noinline void
+rkvdec_init_v4l2_vp9_count_tbl_loop(struct rkvdec_vp9_ctx *vp9_ctx, int i, int j, int k, int l)
+{
+	struct rkvdec_vp9_intra_frame_symbol_counts *intra_cnts = vp9_ctx->count_tbl.cpu;
+	struct rkvdec_vp9_inter_frame_symbol_counts *inter_cnts = vp9_ctx->count_tbl.cpu;
+
+	for (int m = 0; m < ARRAY_SIZE(vp9_ctx->inter_cnts.coeff[0][0][0][0]); ++m) {
+		vp9_ctx->inter_cnts.coeff[i][j][k][l][m] =
+			&inter_cnts->ref_cnt[k][i][j][l][m].coeff;
+		vp9_ctx->inter_cnts.eob[i][j][k][l][m][0] =
+			&inter_cnts->ref_cnt[k][i][j][l][m].eob[0];
+		vp9_ctx->inter_cnts.eob[i][j][k][l][m][1] =
+			&inter_cnts->ref_cnt[k][i][j][l][m].eob[1];
+										\
+		vp9_ctx->intra_cnts.coeff[i][j][k][l][m] =
+			&intra_cnts->ref_cnt[k][i][j][l][m].coeff;
+		vp9_ctx->intra_cnts.eob[i][j][k][l][m][0] =
+			&intra_cnts->ref_cnt[k][i][j][l][m].eob[0];
+		vp9_ctx->intra_cnts.eob[i][j][k][l][m][1] =
+			&intra_cnts->ref_cnt[k][i][j][l][m].eob[1];
+	}
+}
+
 static void rkvdec_init_v4l2_vp9_count_tbl(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_vp9_ctx *vp9_ctx = ctx->priv;
 	struct rkvdec_vp9_intra_frame_symbol_counts *intra_cnts = vp9_ctx->count_tbl.cpu;
 	struct rkvdec_vp9_inter_frame_symbol_counts *inter_cnts = vp9_ctx->count_tbl.cpu;
-	int i, j, k, l, m;
+	int i, j, k, l;
 
 	vp9_ctx->inter_cnts.partition = &inter_cnts->partition;
 	vp9_ctx->inter_cnts.skip = &inter_cnts->skip;
@@ -936,31 +960,11 @@ static void rkvdec_init_v4l2_vp9_count_tbl(struct rkvdec_ctx *ctx)
 	vp9_ctx->inter_cnts.class0_hp = &inter_cnts->class0_hp;
 	vp9_ctx->inter_cnts.hp = &inter_cnts->hp;
 
-#define INNERMOST_LOOP \
-	do {										\
-		for (m = 0; m < ARRAY_SIZE(vp9_ctx->inter_cnts.coeff[0][0][0][0]); ++m) {\
-			vp9_ctx->inter_cnts.coeff[i][j][k][l][m] =			\
-				&inter_cnts->ref_cnt[k][i][j][l][m].coeff;		\
-			vp9_ctx->inter_cnts.eob[i][j][k][l][m][0] =			\
-				&inter_cnts->ref_cnt[k][i][j][l][m].eob[0];		\
-			vp9_ctx->inter_cnts.eob[i][j][k][l][m][1] =			\
-				&inter_cnts->ref_cnt[k][i][j][l][m].eob[1];		\
-											\
-			vp9_ctx->intra_cnts.coeff[i][j][k][l][m] =			\
-				&intra_cnts->ref_cnt[k][i][j][l][m].coeff;		\
-			vp9_ctx->intra_cnts.eob[i][j][k][l][m][0] =			\
-				&intra_cnts->ref_cnt[k][i][j][l][m].eob[0];		\
-			vp9_ctx->intra_cnts.eob[i][j][k][l][m][1] =			\
-				&intra_cnts->ref_cnt[k][i][j][l][m].eob[1];		\
-		}									\
-	} while (0)
-
 	for (i = 0; i < ARRAY_SIZE(vp9_ctx->inter_cnts.coeff); ++i)
 		for (j = 0; j < ARRAY_SIZE(vp9_ctx->inter_cnts.coeff[0]); ++j)
 			for (k = 0; k < ARRAY_SIZE(vp9_ctx->inter_cnts.coeff[0][0]); ++k)
 				for (l = 0; l < ARRAY_SIZE(vp9_ctx->inter_cnts.coeff[0][0][0]); ++l)
-					INNERMOST_LOOP;
-#undef INNERMOST_LOOP
+					rkvdec_init_v4l2_vp9_count_tbl_loop(vp9_ctx, i, j, k, l);
 }
 
 static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
-- 
2.39.5


