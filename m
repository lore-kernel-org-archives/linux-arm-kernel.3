Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE276EA3C59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:References:
	In-Reply-To:Cc:To:Message-ID:Date:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXjgEwttTd0N38aqrnwUkmanoI3dGHfmNU6Kub47IKg=; b=wpOxTpV7WNyrsFK9oa3UoH9LG1
	qIq5vYXT3IL50VvFf55ssup5f5HZIVsFigoUf3RPGTmgyYDEx2nYn8TJGm7AtAKWn37XjOhH1t/Y8
	M+ANwQPJHuJ7mNchyMqAoS8UwiuwngKGNDnk/WCOgSzR8imQZ3B5fYOHNwNtFl9HwE9oPNXrKWS//
	jJ8pcdCEqNSv8DfjuJJ5lSDbY+wxnjDaQIuUrwMJ68LrDMFQcX5oYo7HnMTuJ70osjXXAUt6m7/5J
	cKEY9tJ4bxycV2pn4goM2SIlMvQDXI2j+b8lpXIOmTplZk2Jku9RJ7Eo1aj1U1Ix+s556v9tJ6sI8
	YSf997NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApr9-0000000Ac1o-2Kvd;
	Thu, 09 Apr 2026 13:55:39 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApr3-0000000Absv-2dra
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 13:55:37 +0000
Received: from 0001-cedrus-h264-active-v2.eml (unknown [111.196.245.116])
	by APP-01 (Coremail) with SMTP id qwCowADHM2_Er9dpNYa+DA--.16410S2;
	Thu, 09 Apr 2026 21:55:17 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Thu, 9 Apr 2026 21:30:00 +0800
Message-ID: <20260409223001.1-cedrus-h264-active-v2-pengpeng@iscas.ac.cn>
To: Maxime Ripard <mripard@kernel.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
Subject: [PATCH v2] media: cedrus: reject invalid active H.264 ref indices
X-CM-TRANSID: qwCowADHM2_Er9dpNYa+DA--.16410S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JF1DAr1ftF13Gr4rKr15Jwb_yoW7tr1kpF
	45Cr1DJF4UJr15GFW8JFW8Z3WakFyrXry7JryrKw1jvFy7try7tF1ak34Yvr45Z3yDCrsa
	yF4ay3y8Cr48ArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x0JUZYFZUUUUU=
X-Originating-IP: [111.196.245.116]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_065534_110431_0E8FFDFC 
X-CRM114-Status: GOOD (  15.24  )
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

Cedrus consumes the active ref_pic_list0/ref_pic_list1 entries and uses
their indices to look up decode->dpb[] in _cedrus_write_ref_list().

Those active portions are the first
num_ref_idx_l0_active_minus1 + 1 / num_ref_idx_l1_active_minus1 + 1
entries in the two reference lists.

An out-of-range index in that active portion can therefore read past the
fixed V4L2_H264_NUM_DPB_ENTRIES array.

Checking this in cedrus_try_ctrl() is awkward because the request-local
DPB state may not have been applied yet. Instead, validate the active
entries at the actual Cedrus use site and fail setup with -EINVAL if one
points past decode->dpb[].

Entries beyond the active reference counts remain ignored as before, so
this does not change how Cedrus treats unused tail data in the
reference-list controls.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1:
- reject invalid indices in the active reference list entries instead of
  silently skipping them
- keep the validation at the Cedrus use site, but propagate -EINVAL back
  through setup

 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 32 ++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 3e2843ef6cce..58c411c580f3 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -186,10 +186,10 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 
 #define CEDRUS_MAX_REF_IDX	32
 
-static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
-				   struct cedrus_run *run,
-				   const struct v4l2_h264_reference *ref_list,
-				   u8 num_ref, enum cedrus_h264_sram_off sram)
+static int _cedrus_write_ref_list(struct cedrus_ctx *ctx,
+				  struct cedrus_run *run,
+				  const struct v4l2_h264_reference *ref_list,
+				  u8 num_ref, enum cedrus_h264_sram_off sram)
 {
 	const struct v4l2_ctrl_h264_decode_params *decode = run->h264.decode_params;
 	struct vb2_queue *cap_q;
@@ -210,6 +210,9 @@ static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
 		u8 dpb_idx;
 
 		dpb_idx = ref_list[i].index;
+		if (dpb_idx >= V4L2_H264_NUM_DPB_ENTRIES)
+			return -EINVAL;
+
 		dpb = &decode->dpb[dpb_idx];
 
 		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
@@ -229,28 +232,30 @@ static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
 
 	size = min_t(size_t, ALIGN(num_ref, 4), sizeof(sram_array));
 	cedrus_h264_write_sram(dev, sram, &sram_array, size);
+
+	return 0;
 }
 
-static void cedrus_write_ref_list0(struct cedrus_ctx *ctx,
-				   struct cedrus_run *run)
+static int cedrus_write_ref_list0(struct cedrus_ctx *ctx,
+				  struct cedrus_run *run)
 {
 	const struct v4l2_ctrl_h264_slice_params *slice = run->h264.slice_params;
 
-	_cedrus_write_ref_list(ctx, run,
-			       slice->ref_pic_list0,
-			       slice->num_ref_idx_l0_active_minus1 + 1,
-			       CEDRUS_SRAM_H264_REF_LIST_0);
+	return _cedrus_write_ref_list(ctx, run,
+				      slice->ref_pic_list0,
+				      slice->num_ref_idx_l0_active_minus1 + 1,
+				      CEDRUS_SRAM_H264_REF_LIST_0);
 }
 
-static void cedrus_write_ref_list1(struct cedrus_ctx *ctx,
-				   struct cedrus_run *run)
+static int cedrus_write_ref_list1(struct cedrus_ctx *ctx,
+				  struct cedrus_run *run)
 {
 	const struct v4l2_ctrl_h264_slice_params *slice = run->h264.slice_params;
 
-	_cedrus_write_ref_list(ctx, run,
-			       slice->ref_pic_list1,
-			       slice->num_ref_idx_l1_active_minus1 + 1,
-			       CEDRUS_SRAM_H264_REF_LIST_1);
+	return _cedrus_write_ref_list(ctx, run,
+				      slice->ref_pic_list1,
+				      slice->num_ref_idx_l1_active_minus1 + 1,
+				      CEDRUS_SRAM_H264_REF_LIST_1);
 }
 
 static void cedrus_write_scaling_lists(struct cedrus_ctx *ctx,
@@ -338,8 +343,8 @@ static void cedrus_skip_bits(struct cedrus_dev *dev, int num)
 	}
 }
 
-static void cedrus_set_params(struct cedrus_ctx *ctx,
-			      struct cedrus_run *run)
+static int cedrus_set_params(struct cedrus_ctx *ctx,
+			     struct cedrus_run *run)
 {
 	const struct v4l2_ctrl_h264_decode_params *decode = run->h264.decode_params;
 	const struct v4l2_ctrl_h264_slice_params *slice = run->h264.slice_params;
@@ -351,6 +356,7 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
 	size_t slice_bytes = vb2_get_plane_payload(src_buf, 0);
 	unsigned int pic_width_in_mbs;
 	bool mbaff_pic;
+	int ret;
 	u32 reg;
 
 	cedrus_write(dev, VE_H264_VLD_LEN, slice_bytes * 8);
@@ -393,11 +399,17 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
 
 	if ((slice->slice_type == V4L2_H264_SLICE_TYPE_P) ||
 	    (slice->slice_type == V4L2_H264_SLICE_TYPE_SP) ||
-	    (slice->slice_type == V4L2_H264_SLICE_TYPE_B))
-		cedrus_write_ref_list0(ctx, run);
+	    (slice->slice_type == V4L2_H264_SLICE_TYPE_B)) {
+		ret = cedrus_write_ref_list0(ctx, run);
+		if (ret)
+			return ret;
+	}
 
-	if (slice->slice_type == V4L2_H264_SLICE_TYPE_B)
-		cedrus_write_ref_list1(ctx, run);
+	if (slice->slice_type == V4L2_H264_SLICE_TYPE_B) {
+		ret = cedrus_write_ref_list1(ctx, run);
+		if (ret)
+			return ret;
+	}
 
 	// picture parameters
 	reg = 0;
@@ -478,6 +490,8 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
 		     VE_H264_CTRL_SLICE_DECODE_INT |
 		     VE_H264_CTRL_DECODE_ERR_INT |
 		     VE_H264_CTRL_VLD_DATA_REQ_INT);
+
+	return 0;
 }
 
 static enum cedrus_irq_status
@@ -531,9 +545,7 @@ static int cedrus_h264_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	if (ret)
 		return ret;
 
-	cedrus_set_params(ctx, run);
-
-	return 0;
+	return cedrus_set_params(ctx, run);
 }
 
 static int cedrus_h264_start(struct cedrus_ctx *ctx)
-- 
2.50.1


