Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A22CF33A8E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 15:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+szisEROpiE8CyqkSfPxS9kUIvhnbJ3ekbW/jjQfguk=; b=qgjzBZaabd9us36hubT9impagH
	HOk8zUz+I5pI43JbM7qj+LcKzWvnQGJH/eSlE1sr4+V0mFJtvPS6HrXyQVjjGs2vXgONeJUdh2zmk
	s5kEsIhfdNaWoKB7TFQgdO1aYKTesVP5t/H4G3G0Gr2xOSM9BZGwr+DztWVoN5YqP6bLIdr2LKb2P
	MEQ+zygxX0q+WFIkTZPwAG9vXJXGU4Wtqx48+pmdXlCiBOXKHEZarc1bYaoFyDBR4o0OOtFc13/xZ
	8uDR0mSP9mdQjWwW010niqkVr6esPT+AMCrzfRpd5GWXDkGIqC5V7ZZpnVB9jK7cw3l4QFxG+am8p
	IiDJg1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAbH-0000000273X-1J4f;
	Thu, 05 Mar 2026 15:26:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAbF-0000000272i-0mtn;
	Thu, 05 Mar 2026 15:26:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF6C6435AF;
	Thu,  5 Mar 2026 15:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A04C19423;
	Thu,  5 Mar 2026 15:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772724411;
	bh=4Ph21YNHCyEvjo/bKXsJPUwpBDx3Z0UNvaVUS93jta4=;
	h=From:To:Cc:Subject:Date:From;
	b=Lk41FGwK+FS+12m6ve1kB+572nNh9e3n0pHZe3KCtpj8K13JaGUU1r10n3KoWImzB
	 GRbs/hhlO3fxTSSP7+FMqBXsv0Uz12FNZnIWBUtogJLKvSN34j981H4kjlVGDjC783
	 8D0A5rKf3nw/utRvuZ16dvWGAZ7cwA8Xy8lR3vIpin0/vk7v4x2IpZh+4VsA/pJfxK
	 QQWzEcGfa8SleV/azMcKC/jF3GUTBSY7BfIp/hNTpEUEw5ZCD3Pa+STYcv6B8RAYoz
	 fPC5oY1IwSi5wfiZsnaPWBVeJcGNlxcxES40ztC+5lUqMEtrD40Z9HoKgQqg+afifj
	 tURebJhKNOf8g==
From: Arnd Bergmann <arnd@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 1/2] [RESEND] media: rkvdec: reduce excessive stack usage in assemble_hw_pps()
Date: Thu,  5 Mar 2026 16:26:16 +0100
Message-Id: <20260305152644.791897-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_072653_267704_CAC385B7 
X-CRM114-Status: GOOD (  17.13  )
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

The rkvdec_pps had a large set of bitfields, all of which
as misaligned. This causes clang-21 and likely other versions to
produce absolutely awful object code and a warning about very
large stack usage, on targets without unaligned access:

drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c:966:12: error: stack frame size (1472) exceeds limit (1280) in 'rkvdec_vp9_start' [-Werror,-Wframe-larger-than]

Part of the problem here is how all the bitfield accesses are
inlined into a function that already has large structures on
the stack.

Mark set_field_order_cnt() as noinline_for_stack, and split out
the following accesses in assemble_hw_pps() into another noinline
function, both of which now using around 800 bytes of stack in the
same configuration.

There is clearly still something wrong with clang here, but
splitting it into multiple functions reduces the risk of stack
overflow.

Fixes: fde24907570d ("media: rkvdec: Add H264 support for the VDPU383 variant")
Link: https://godbolt.org/z/acP1eKeq9
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Resending this along with the other patch mainly to point out that
this one is still pending as well.
---
 .../rockchip/rkvdec/rkvdec-vdpu383-h264.c     | 50 ++++++++++---------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
index 97f1efde2e47..fb4f849d7366 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
@@ -130,7 +130,7 @@ struct rkvdec_h264_ctx {
 	struct vdpu383_regs_h26x regs;
 };
 
-static void set_field_order_cnt(struct rkvdec_pps *pps, const struct v4l2_h264_dpb_entry *dpb)
+static noinline_for_stack void set_field_order_cnt(struct rkvdec_pps *pps, const struct v4l2_h264_dpb_entry *dpb)
 {
 	pps->top_field_order_cnt0 = dpb[0].top_field_order_cnt;
 	pps->bot_field_order_cnt0 = dpb[0].bottom_field_order_cnt;
@@ -166,6 +166,31 @@ static void set_field_order_cnt(struct rkvdec_pps *pps, const struct v4l2_h264_d
 	pps->bot_field_order_cnt15 = dpb[15].bottom_field_order_cnt;
 }
 
+static noinline_for_stack void set_dec_params(struct rkvdec_pps *pps, const struct v4l2_ctrl_h264_decode_params *dec_params)
+{
+	const struct v4l2_h264_dpb_entry *dpb = dec_params->dpb;
+
+	for (int i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
+		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+			pps->is_longterm |= (1 << i);
+		pps->ref_field_flags |=
+		 (!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD)) << i;
+		pps->ref_colmv_use_flag |=
+		 (!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) << i;
+		pps->ref_topfield_used |=
+		 (!!(dpb[i].fields & V4L2_H264_TOP_FIELD_REF)) << i;
+		pps->ref_botfield_used |=
+			(!!(dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF)) << i;
+	}
+	pps->pic_field_flag =
+		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC);
+	pps->pic_associated_flag =
+		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD);
+
+	pps->cur_top_field = dec_params->top_field_order_cnt;
+	pps->cur_bot_field = dec_params->bottom_field_order_cnt;
+}
+
 static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 			    struct rkvdec_h264_run *run)
 {
@@ -177,7 +202,6 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	struct rkvdec_h264_priv_tbl *priv_tbl = h264_ctx->priv_tbl.cpu;
 	struct rkvdec_sps_pps *hw_ps;
 	u32 pic_width, pic_height;
-	u32 i;
 
 	/*
 	 * HW read the SPS/PPS information from PPS packet index by PPS id.
@@ -261,28 +285,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 		!!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT);
 
 	set_field_order_cnt(&hw_ps->pps, dpb);
+	set_dec_params(&hw_ps->pps, dec_params);
 
-	for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
-		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
-			hw_ps->pps.is_longterm |= (1 << i);
-
-		hw_ps->pps.ref_field_flags |=
-			(!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD)) << i;
-		hw_ps->pps.ref_colmv_use_flag |=
-			(!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) << i;
-		hw_ps->pps.ref_topfield_used |=
-			(!!(dpb[i].fields & V4L2_H264_TOP_FIELD_REF)) << i;
-		hw_ps->pps.ref_botfield_used |=
-			(!!(dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF)) << i;
-	}
-
-	hw_ps->pps.pic_field_flag =
-		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC);
-	hw_ps->pps.pic_associated_flag =
-		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD);
-
-	hw_ps->pps.cur_top_field = dec_params->top_field_order_cnt;
-	hw_ps->pps.cur_bot_field = dec_params->bottom_field_order_cnt;
 }
 
 static void rkvdec_write_regs(struct rkvdec_ctx *ctx)
-- 
2.39.5


