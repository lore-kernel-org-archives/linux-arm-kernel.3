Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF22C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 03:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JETOMAWav2dfMHsWYPyuoNMSTDJN0FsRCfFHE94te6U=; b=LMj7lqMnbrW1MML2kdtq8V4f5E
	Mgmn/HGlBByMn026tJyNcAAar8cl3eDnIaP7LGEJao2eguH+lznTdyl6BcypNLbqMAJ1Nyep9gBFN
	ji9MFmVy5xFBV0abWt383lpAjErvQub6nrbxkh1ugy12O9RwTQLy1Xl0BTi8dJHpG2cz7074TcNjn
	AT9WHC5/DEJ+/c2RxlPHYSiBS5n5SEbJtRM1WZuHHJGDxHjGqh1GaOvgMRY3gRCcFDEQu5fo2mepi
	XT2TNTCUKItywHavm4rKfwBa8uQTPUxxxDgUqjT90pRmatc3VPVtGanwmEwMltuwjY6mgTBGC+L4X
	rPu+4o4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gP4-00000008FKj-0447;
	Wed, 16 Sep 2026 03:33:46 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gOz-00000008FJ9-45VX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 03:33:43 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc1cea48edcso345711a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 20:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529621; x=1790134421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JETOMAWav2dfMHsWYPyuoNMSTDJN0FsRCfFHE94te6U=;
        b=NEkTtEueJnjK56MYNctqDFBB7TiE/4KDZSn38+9pLgf9D0P98gLbBIv9ISZzRjw39O
         MSoYUii2VEtKS4IqQZpwWaNiAv/4jGS768Tn5WbzxcO2FP6M0LcIdECYi5VmUCPIHX/j
         bY4qKGN6f2wEBp9NhHW7FlRG7BiW1Hley2h70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529621; x=1790134421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JETOMAWav2dfMHsWYPyuoNMSTDJN0FsRCfFHE94te6U=;
        b=IqmBMNXM2qubacniwa79SP1Z2gnMI796coHIabraWKWcKk1rp0acz7/62njHJOOmD8
         LSA1XO+w/r4dDECxvttNQWkGO3gtKLbuXcEAlD9cxNjsB1BHfI2+oi+qTjbcLxeU44nE
         ecr85ttIdvXvGbPOCBVTApkKCv2E8nmj2EYWQ5BoS1tOG7rWGh9aVcOH85g1m0jL0qhP
         9/PiXfUR1bHZwZav0p7TYXxe7mTDNiQJrt1/e/m2R08SfX4SYWaAa/5Ijm5K7FUS2+cM
         G30kCEMY+o+f+gpOA3+GcXh6nxWjMnfzy97THdW1mj50V2ckcSZRYcBDpMuweqnYrli7
         +Klw==
X-Forwarded-Encrypted: i=1; AKwUvBzwIS1gvKkq/g/RzQZi8rmVFuAmyAv3sOFg3YS0KLXvceu9cUkT/y5DrkOyv0T7BKeZu1UYwx6Uf/YWt7mKI8GU@lists.infradead.org
X-Gm-Message-State: AFuF++nABfipSD+75TzBncSuD1mOwgTINGBdvUbq//Yg/WL1+ac1t15h
	4csbBpvVCHNyF9X0/jboVYhVgR4iZppWeJ84YXp7DCCZb1ZNlJPDmfmtfukzPwEnZA==
X-Gm-Gg: AYBFou2ZsE+e9IrSPm/atTU31O+99uzvMsRB4v2dG+GNwnPWTEa8GrXtNr/cxJ93qRR
	e7BmHbLj5yQ/OMyar1GxELpPZUkNBmoUH9qpfLwnuWHyzuo48l3CAR/jkZ3QMYctsHGBk/0QLXQ
	jFqpuYA/KHI7IlATip6/seaeMfBAKK/fpjad+vg+jpv+9hjR2vYtDKYC1wUynWJJ2pvz0dpKtDI
	jnUcoIF9frBzC/30QPxOmgSTz38TFpWSdnNDiXnSiyK92fwDsvtPGZ1HvUkVFa7/53jFN/UYET1
	QJXZY8/2xBBDBw1h0wi8Ot0L2nxPqg0n861ZTcTESTy7084fW744ptwosS9/DCPui2e7r9Fq2c8
	1A2HUzpJIIQp5sjyln9mUjeRNj3XjPHNS74mRJgi8oLWDCqwQlPY88UFefzwiauz9clVX+PP19l
	YE4NbqXum0szFTmQ/UDrJsIGj2375UXoni13BSKI0ReC5fwV0R0/jeLZk80FiNVIxpUntJgYGRi
	zkMathC/9p6nd8XjNIQLDzj6cntN/+QkZjTgAlYtsht5NYIMv8CnoOE4Q==
X-Received: by 2002:a17:90b:2604:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-39e1df6c05dmr2364892a91.0.1789529621075;
        Tue, 15 Sep 2026 20:33:41 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liu Ying <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH RFT v2 1/5] drm: Split framebuffer pixel offset calculation from drm_fb_dma_get_gem_addr()
Date: Wed, 16 Sep 2026 11:33:22 +0800
Message-ID: <20260916033327.3054126-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916033327.3054126-1-wenst@chromium.org>
References: <20260916033327.3054126-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_203342_021374_33B5C010 
X-CRM114-Status: GOOD (  20.67  )
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

Currently drm_fb_dma_get_gem_addr() calculates the offset into the
framebuffer memory for the framebuffer's unclipped source coordinates,
adds that to the framebuffer's backing storage, and returns the result.

We are about to add a variant that uses the clipped source coordinates,
so there is already some reuse of code. However, calculating the data
offset for a given pixel is not specific to the DMA FB helpers. The
offset is only related to the framebuffer.

Split out the offset calculation into a new framebuffer helper so that
non-DMA users can also reuse the same code.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: <stable@vger.kernel.org> # dependency for next patch
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 28 ++----------------
 drivers/gpu/drm/drm_framebuffer.c   | 45 +++++++++++++++++++++++++++++
 include/drm/drm_framebuffer.h       |  3 ++
 3 files changed, 51 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index fd71969d2fb1..ab0f37d8a5ff 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -75,36 +75,14 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   unsigned int plane)
 {
 	struct drm_gem_dma_object *obj;
-	dma_addr_t dma_addr;
-	u8 h_div = 1, v_div = 1;
-	u32 block_w = drm_format_info_block_width(fb->format, plane);
-	u32 block_h = drm_format_info_block_height(fb->format, plane);
-	u32 block_size = fb->format->char_per_block[plane];
-	u32 sample_x;
-	u32 sample_y;
-	u32 block_start_y;
-	u32 num_hblocks;
 
 	obj = drm_fb_dma_get_gem_obj(fb, plane);
 	if (!obj)
 		return 0;
 
-	dma_addr = obj->dma_addr + fb->offsets[plane];
-
-	if (plane > 0) {
-		h_div = fb->format->hsub;
-		v_div = fb->format->vsub;
-	}
-
-	sample_x = (state->src_x >> 16) / h_div;
-	sample_y = (state->src_y >> 16) / v_div;
-	block_start_y = (sample_y / block_h) * block_h;
-	num_hblocks = sample_x / block_w;
-
-	dma_addr += fb->pitches[plane] * block_start_y;
-	dma_addr += block_size * num_hblocks;
-
-	return dma_addr;
+	return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane,
+								state->src_x >> 16,
+								state->src_y >> 16);
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index d32aceb6ca9b..9e1231162047 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1208,6 +1208,51 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 	}
 }
 
+/**
+ * drm_framebuffer_get_block_offset() - Get offset to start of pixel block for
+ * the given framebuffer and coordinates.
+ * @fb: The framebuffer
+ * @plane: Which plane
+ * @x: x coordinate for pixel
+ * @y: y coordinate for pixel
+ *
+ * This function will usually be called from the PLANE callback functions,
+ * or from one of the helpers that calculates the framebuffer's DMA address.
+ *
+ * Return: offset from start of framebuffer to start of pixel block
+ */
+u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsigned int plane,
+				     unsigned int x, unsigned int y)
+{
+	u8 h_div = 1, v_div = 1;
+	u32 block_w = drm_format_info_block_width(fb->format, plane);
+	u32 block_h = drm_format_info_block_height(fb->format, plane);
+	u32 block_size = fb->format->char_per_block[plane];
+	u32 sample_x;
+	u32 sample_y;
+	u32 block_start_y;
+	u32 num_hblocks;
+	u32 offset;
+
+	offset = fb->offsets[plane];
+
+	if (plane > 0) {
+		h_div = fb->format->hsub;
+		v_div = fb->format->vsub;
+	}
+
+	sample_x = x / h_div;
+	sample_y = y / v_div;
+	block_start_y = (sample_y / block_h) * block_h;
+	num_hblocks = sample_x / block_w;
+
+	offset += fb->pitches[plane] * block_start_y;
+	offset += block_size * num_hblocks;
+
+	return offset;
+}
+EXPORT_SYMBOL(drm_framebuffer_get_block_offset);
+
 #ifdef CONFIG_DEBUG_FS
 static int drm_framebuffer_info(struct seq_file *m, void *data)
 {
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index 38b24fc8978d..c07aea1cc59f 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -220,6 +220,9 @@ void drm_framebuffer_remove(struct drm_framebuffer *fb);
 void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
 void drm_framebuffer_unregister_private(struct drm_framebuffer *fb);
 
+u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsigned int plane,
+				     unsigned int x, unsigned int y);
+
 /**
  * drm_framebuffer_get - acquire a framebuffer reference
  * @fb: DRM framebuffer
-- 
2.55.0.1032.g73a4cd73de-goog


