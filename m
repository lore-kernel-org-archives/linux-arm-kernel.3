Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012D2C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q5Plj4uGj3BvxxxoyuAGWT0KJk9RqOTiZJAPsoPxBFY=; b=XgGkEwgotNBccWSJd525RHDN6x
	9kiX7n3IEu7ej1gznEjHA0PMCid+91gpmK1gwlnC+lv/8206H+kivnUgDEbNXzwB5o1DLMoXTZirc
	zcpd1/8XDhiQG87nGmrMJIa499hmXDz8wODiMZn497pgyzpGUxZRZICMH54c3eRsjBDV9/Z/fXIat
	7gEji33FjPP21bPkIaM3YpThxmXUig4/TjBW5NgoLMm9/7JV5vwBJcrISXNydBa7D/yS6s4k4FGlw
	FtInh9ZGs/4jw/+Q0MqtRlXP2aGU2DYbzoFFmr82vfO8Bo4SQydTljyOe3d0Bl7gUTO+WPr+6lp9d
	/K1zKHJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3nyo-000000082s0-1ivy;
	Tue, 08 Sep 2026 05:02:46 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3nyl-000000082rd-2Csd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:02:44 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-39b35105ba4so3667560a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788843761; x=1789448561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5Plj4uGj3BvxxxoyuAGWT0KJk9RqOTiZJAPsoPxBFY=;
        b=BwnMgCbxfJnUznBe9lcA+gVpHtwFNCHysgIWjIGzezkLaPxzezxoCTAikfqmA8JakW
         5KiK/QZSj75Qm6e8W/9SQEgwRoZURSixN6N5PwIJc6Md75NnASz8U3bmtElY7eeAzutx
         NxfRulrKVldLd/wALW5DzJbPFKPXUNCnx5hEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788843761; x=1789448561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5Plj4uGj3BvxxxoyuAGWT0KJk9RqOTiZJAPsoPxBFY=;
        b=p50lOox0FUSLrUSMAv697sZ6gCqZKsseHbPv6NXX4+Ci5PRA9r6P643+zK3GGjGQur
         tphQ91a41IkBFZfVSRGMbphENPxGTep1A2q8IVlZt/o1d8FFUAcvTy6YDGsMFfQXYnv/
         d4ZkRr2NTNEfV47nPcMavWUlj3QijE4f4nwm9jVGGFTmrcawhkurS/X006Tp76qIz7v9
         /i465sqEOpZyBU8udo9TJexdt2cIw9SMzvjjcWUnh1Uw0ntvzy+zMioErFkh3SzU5uZb
         XnVR1YInHipPV7Nvl8qZWjs99cy6uPEZAm5zjBcfrj1AqkgR7WQDebzDONsvR7WEqVpt
         eCSA==
X-Forwarded-Encrypted: i=1; AKwUvBz6GlBe+kIjRVKNWgJfFLK3bRAqtXino72qc6fG+fCxdV0P7dArI92QkzHlFY1WQwOkm9/EnlKyecHdxBpm9vPJ@lists.infradead.org
X-Gm-Message-State: AFuF++mzW4U7J5DUv3Wa5Q0YYeAKJUmv3Ax8WSi5r+iwvvkqisi6P06x
	SpHe6kV/SH83I7wnXgOJ+IzUMoDx8L0OI3BKWgtdiyYtVxD6xWnYg4kccHV0kFmm3A==
X-Gm-Gg: AYBFou2GRd831awnVki/5GTk6IO6hLwxmbxnQwg13825u2I63/hcV3roHr75pysrKXg
	eJRilJCJ9Xa3X1NxkgA0dR71UpVCFfPlZdRQ/Y8UwaxUpjBQ00vA1AOtGcY6CSMe3QCFnkPKGs4
	tWafJk42E5ihT2OolR7JnFnDNBhvviNNwmDa/aspaT0LD1oTMEj7tnf/4/L/qLJZuZaDvtQlutG
	blcib8akWM6in2LvEDCepkRtBT0RtgKT//3ajDrZDzN1HiKx7q21zCFXmqdvlppaRxALSZnEgWc
	yVvBKcjebgQSB4406tOJahEi3UURRbs3zxvOvL5Cg7vMtrXbH5IgGEAkAp73zU1Y2TgpQMTNeLL
	S7yG6EJCC9+eg/z70s1zrfVX94DEgcRbmR9TH8i/bJSoyJVcbA7si8Qf7hnHqLOSoOYPWPLVbLy
	dJipYQtxcgTHKCoRw5HZ6GsshcOxk8WHOPHDVabE2//Dp4K05qWA9/iecWR32qlOHrI38JsiDkL
	N0reBOJXC7cIwAWEZfVLrLkQV895szLwpb4Opfn5qhgArRm08qgL0Whrw==
X-Received: by 2002:a17:90b:4fcb:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-39b26100e5dmr38830828a91.4.1788843761523;
        Mon, 07 Sep 2026 22:02:41 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b813fb4ddsm6342730a91.10.2026.09.07.22.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:02:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] drm/sun4i: Align VI buffer addresses for subsampled formats
Date: Tue,  8 Sep 2026 13:02:28 +0800
Message-ID: <20260908050229.754977-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_220243_606225_2E0A7F56 
X-CRM114-Status: GOOD (  18.44  )
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

Commit 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
get display memory") dropped the code to calculate the framebuffer's DMA
address in favor of drm_fb_dma_get_gem_addr().

This turned out to be wrong in a couple ways. The hardware can handle
pixel offsets within a sub-sampling block, but the buffer address must
start at the beginning of the subsampled block for all planes. The
hardware then does the interpolation internally. However the helper
gives the address exact pixel for luma, which messes up the result.

Instead of reverting the commit, calculate the intra-block offset and
adjust the buffer address so that it points to the start of the block.

Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display memory")
Cc: <stable@vger.kernel.org> # 7.1+
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is an alternative to Jernej's original revert:
https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com/
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 2e9cda45c04e..185e9e5211c1 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -207,6 +207,20 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 		/* Get the start of the displayed memory */
 		dma_addr = drm_fb_dma_get_gem_addr(fb, state, i);
 
+		/*
+		 * The mixer can handle odd offsets into sub-sampled YUV
+		 * planes, but needs the address of the first pixel in each
+		 * sub-sampled block. Adjust the luma buffer address backwards.
+		 */
+		if (i == 0) {
+			u32 x_diff, y_diff;
+
+			x_diff = (state->src.x1 >> 16) & (format->hsub - 1);
+			y_diff = (state->src.y1 >> 16) & (format->vsub - 1);
+			dma_addr -= y_diff * fb->pitches[i];
+			dma_addr -= x_diff * format->cpp[i];
+		}
+
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
 				 i + 1, fb->pitches[i]);
-- 
2.55.0.979.g7e5102b832-goog


