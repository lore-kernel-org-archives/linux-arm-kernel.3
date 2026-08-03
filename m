Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD532C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3+RPMRTD2bspWZ1EZegXMowVkzRDKKmin7c2HjnpVI=; b=vVGzA6VXhod9zrIczlhJC0I41I
	qqkVdz4XO2wZFSLoqBndOmmEG6UMVFes9GCXbbEg14DwFa0T4Qg7pk9mvAfREFOhp1Jtm5ohxw6V4
	zSmwKJr1CVBCwpjuGar1DvFyhrCN7vZwDpMe1eYLCIz3uLED1O6jhy4JCV/S/FoWmrPlAWG5hontH
	p6cKmA5a3e8LdEmLIwd4ppnZjMN3ZGkZTu00IWnmyHvcWN6GL9uGHwzZH7Pcr+oy1FESzPy3UCnuD
	w+cSrO2XafFXlhmPFVspOE7ryW8W6UGx5GlosHr60BfrnJjWJCwpxg75kj/BekSaIMCYtxLKDJrHZ
	hM/7ezoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGV-0000000027o-2c0B;
	Mon, 03 Aug 2026 16:11:47 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGT-00000000224-1Hl0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:11:46 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so696894f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773503; x=1786378303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3+RPMRTD2bspWZ1EZegXMowVkzRDKKmin7c2HjnpVI=;
        b=qzkkuOvpGxrDas7fldc3fEqm2lx/dfflr4wOxYbpkICyzHUaI0YHSQsAJ1zFjfJl/I
         Op0T9CKinph0zjDJDBTPFTmHDzFXXvC9PjehNSQjA6bocQ8VSsF63N/9X9YbNkHf/4of
         lrjQbgAShZGI6j1B+8+0bMolea3mYsVSZlUORwJ6QJdrssyNwUVJZTOhj1OAft6suh+Y
         n/YXnCNgFvBFpIIdzVpCLtDM8/rn2jYfDUardVHO05pchAAE2hT3mqOxwU32NaxK/XwW
         HHnuS6ghwjpbJ0XZ1hHP6oOCe87FRFd4C9mj/7j60JOvjvwEAuGR7QC/tpyFzqFN+XMM
         QlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773503; x=1786378303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3+RPMRTD2bspWZ1EZegXMowVkzRDKKmin7c2HjnpVI=;
        b=rVBoRA8p8VfjmmRsrvgpC/osq7oi5IFTu8yqQVV1TfyaRPpO5fQV1/H/zeUjAClJpD
         7nqcvA5PURgBZL78h6UhqiT7ujdsNzYCEHcG3uff/kBvIMWcQKa91kZxwZ/2bk9mu7IZ
         YkLf8smJMGV+5ysYBY0OSkW9yQUQmtOKQjjP10iYKFyIc/Ls/7bO5K6fjORaicQGgA6X
         cCE1unakffCNjYq//UzrRMtyRFKSdiyni4btqA3IhXTaD+U30XEnzTKfDesMDLb6wmus
         T4GI5eH4Vu/h9D9jseWO60/jKmkcHm1k7sU27QpTyqWmqFTVwa8E1dHc7ck+DilggmNs
         dFnw==
X-Forwarded-Encrypted: i=1; AHgh+RpreeyLm4+20/uVy5gxbTMKfHN3ZlYVCeziV1NR4YycEsKHvW64bIBZSUMCoRB5FYzqU6OcWslkvMit8kbn+yq2@lists.infradead.org
X-Gm-Message-State: AOJu0YyxkRDuV2f/JWsd3aE+wV2q7L6YRHNxAvQIbyaQXGK+4fEuwYlh
	UltzoDKYKSprAOHgXMsXHSP0AiGs0Q6Eh36pNXhibtVRBneUGg/W3qlb
X-Gm-Gg: AR+sD12K02Q/QFWfhw/1q1B/srvmWoCfFB2JowRIbygMt1V5pPtaQ19X/qaitfJTMD8
	0j9w6M9iIHqHjcluYkrrF6qAT16VKY5n7R48CtM+Pj/5r7ktq4cg3jVX+Pvc4jp44VDFVebYpEZ
	KRkURt8R9Sf7l9CB8lLQY1iLJthFIc1X7xiB8zGqIQXIv+F9yvErT81Obk2EgIUQHnsqKuWYJ4x
	jScglW4NmnXOZyjNqJcmNZwl6qzo50hmgN5c0TG9xV9XUZeUMdMbOK86FVMjLyllfkcJN8vx8cL
	qu9keIsGTo9SJUhMdy93hAVQgXdQcd9PW29pLVFewuu6BtTDIlMDeHi5+XLgNvW56K0OCEBVC5j
	z5agSB9ErNI7CiS92yiY1essPgj3ib+ICSDTMxrdRY/QYKx1Cs0T4L9MI54R2aYe3h5h0+Zb7pY
	6/yfrOU4Hp9uwNezOkobEARVkvF+bYSPm36zK3qqhUCYThjkkQtpYC4vBKMnSP346aR38VG+vLp
	gJKKmN+6gBx+Q1GXS7wXKEeL4OefuPw5V1DAtS8kkQjlr5yK8qbmnp/p5gDdGJeQfihTQIwz/7B
	mIQmaLDhzCnJdTz/e19YN582RX0qwqtDlzXHmaudCzffPJireu/zphxKEeSMY4jyLEaJSOTe63O
	u6fha7OjIyog9m9AQPptCBSNIyZdkj6qAdDLV+2SK2XOl9j50oE8opqhzbFEW9nLIyvM6Eqgi/A
	IHvQ==
X-Received: by 2002:a05:600c:c4ac:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-4980dda1993mr193930475e9.10.1785773503133;
        Mon, 03 Aug 2026 09:11:43 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:42 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 13/13] drm/sun4i: Align VI buffer addresses for subsampled formats
Date: Mon,  3 Aug 2026 18:10:51 +0200
Message-ID: <3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_091145_370633_350AA9C3 
X-CRM114-Status: GOOD (  16.73  )
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

This is a partial revert of commit 79ac1c945ab8 ("drm/sun4i: layers:
Use drm_fb_dma_get_gem_addr() to get display memory").

Chroma must start at the beginning of a subsampling block, for example
chroma start address for NV12 must be aligned to 2 pixels.
drm_fb_dma_get_gem_addr() offsets luma by the exact source coordinates
and chroma by the coordinates divided by the subsampling factor, so for
odd offsets both planes no longer describe the same pixel, which the
Display Engine scaler can't handle.

Align source coordinates down for all planes instead. Remaining shift
of one pixel is already compensated with scaler phase shift in
sun8i_vi_layer_update_coord().

Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display memory")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 09f668c8af24..ad036cb9d88e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -197,15 +197,31 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
+	struct drm_gem_dma_object *gem;
+	u32 dx, dy, src_x, src_y;
 	dma_addr_t dma_addr;
 	u32 ch_base;
 	int i;
 
 	ch_base = sun8i_channel_base(layer);
 
+	/* Adjust x and y to be divisible by subsampling factor */
+	src_x = (state->src.x1 >> 16) & ~(format->hsub - 1);
+	src_y = (state->src.y1 >> 16) & ~(format->vsub - 1);
+
 	for (i = 0; i < format->num_planes; i++) {
-		/* Get the start of the displayed memory */
-		dma_addr = drm_fb_dma_get_gem_addr(fb, state, i);
+		gem = drm_fb_dma_get_gem_obj(fb, i);
+		dma_addr = gem->dma_addr + fb->offsets[i];
+
+		dx = src_x;
+		dy = src_y;
+		if (i > 0) {
+			dx /= format->hsub;
+			dy /= format->vsub;
+		}
+
+		dma_addr += dx * format->cpp[i];
+		dma_addr += dy * fb->pitches[i];
 
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
-- 
2.43.0


