Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F0DC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZHoy8f3OpVjs16q22My2K8o0ZC/itaQqMauUbs1Www=; b=3levtVSkJSGgHvtG17OA+s82pD
	wvD6b8ZNiO1OHvVfz8asxwBlyKQ+0uo1FMXDBJBMgSttBrnnkngBEi+Xx7qRPgOdJ5USXjhcoc769
	ZGph7IU9WcV7pkBvNJjYGA7CWAHwJXwjZcFCsB4uJ8UlXXVOJZk3nTerqcjHEJo4nDF6BUYx7zfbA
	K4lpEBt16w5mcpZAYA8f63OIghZ/r6ekfMgDNLk4Qcw9OMxNmkbnIp3JkQ64OW1nXQTZeFeYrDItA
	5BuZ9miSXXV4huNGE1fHOkqH/9eSL9plWdr3ssvDtWITiaDGp8bZ30iycMEyPOAw8e7JoKLbKLAtm
	+b74VRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3roO-00000008W5n-1YX0;
	Tue, 08 Sep 2026 09:08:16 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3roH-00000008W2b-0sG2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:08:12 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso3537007a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788858488; x=1789463288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZHoy8f3OpVjs16q22My2K8o0ZC/itaQqMauUbs1Www=;
        b=dvJOZ8E/0qE+QhTOnMRqcZVMZocZEUccTLjgEsCXbvUp6sjyx6H8m4apeMzo0VCiky
         GDn20tX5lPG4tXMC1s2IAjryfhZVZb5WsyEyKxheIxkU5pU4yyWOUm3/dP46dPESKPSE
         91zSGUEXSSqAs9tg0C2lxFy3Kyi/z5IDpCZ8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858488; x=1789463288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZHoy8f3OpVjs16q22My2K8o0ZC/itaQqMauUbs1Www=;
        b=oiRf6t9WA0UrGBp5+wx77hAxpziLNT96HkOGwV+ObgP/CNpj140Z8WIZvsMfzFDbw4
         0qlDFTz0S/Z53mYh781xU9fR6Gm3rcn3UHKeU52x44Wj0CUWXtX9iuXkSfqEQTrBfIAW
         wiVkEP/o+SZ38QVBnb+CWG7BfiUbpgoMWivFsS32w+okj5BwG+VCicnT485VysndqlJe
         a53nz/nHE8E+dx0H/ecOYWoCv+vzRaUQqfm4Y0nrJSqb71xYgYGNvOyDKhFK3sF0UQT4
         0M5NTZD7c4elT5DI4vsKL4q89h6sTHmPiempYl62CFsp1JEk6ebg8Ij2xiVdSEoe3QzT
         521Q==
X-Forwarded-Encrypted: i=1; AKwUvBzoxkY/UcFuHYJxXKw6K6ofRn93sjcV3rHdfX1F9v053wCGN11JUjYQni+1JIG9eFtO3u+FS3UpIlsn0uhkKsjG@lists.infradead.org
X-Gm-Message-State: AFuF++mMHq16W5uToWWyhBvgCkRQk9qO7Ns14bDDZXXXhmlS3Ral5BVS
	o75Rzxro4XeH1DH/f52QqJ2FTEjqABJttux8myIAi08fN2oSDHN3mjst1pe71OBImQ==
X-Gm-Gg: AYBFou2fm5WkmWIAQSIDVIf6nxBK/1kbPlMgDiWZAfYxddR5ykqbU7GHBoycZIHvIOj
	94cMdsVxoEstHJuGWNdmXKdX3dD/OPTYQvOLhP1CqYYQJVsKg6qHJMbKQeXrOAEyTYgxoHDSdor
	SZSTC43s0zwXcZbgrgnyLjn83/RmQHCBYJvNsfwYHZAf6H3YKVBEDwyMnEzoPaaQzgGB3ydPs9a
	HUW3cfYNOSSnbbyD0G2CtSJmnjA8v1Y9DdxaIySCMkegO+a1puoZNU3tx/wHytg4yf8bL2hv+19
	zRPWMg0EKJi0DZvpwPB92x0r4LWZQZBlsd8Zg4q5jFH5cQmkepGS+nMiRawd5jW2VGxzEhWL4M3
	bUCr6rdmuEBm3rrviNSgwCueEvGxlRUNaIXZav38ey/c/c3jU5Ju0P7HDghmysvWlezQcn2JA9F
	2GpCpFLGTivmx/7KM9mKkSHn/2k+t208eT99LsyCRUmQYh8MFlNqcV4eacbM01VBvCYtWOfl9tv
	6WXCloc7bNsD6qdaGoAZBRZ58XXkPhyGXp+2T/YgCvAESFaBaLdx/pAyA==
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39b26273a40mr43384810a91.21.1788858488251;
        Tue, 08 Sep 2026 02:08:08 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm19718804a91.5.2026.09.08.02.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:08:06 -0700 (PDT)
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
Subject: [PATCH 3/4] drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Tue,  8 Sep 2026 17:07:42 +0800
Message-ID: <20260908090745.1089143-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908090745.1089143-1-wenst@chromium.org>
References: <20260908090745.1089143-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_020809_248738_2A5D8EB9 
X-CRM114-Status: GOOD (  16.31  )
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

The hardware is programmed with clipped source and destination dimensions,
but the framebuffer address is calculated using drm_fb_dma_get_gem_addr(),
which uses the full source dimensions. This will not match the source
offset if the top and/or left sides are clipped.

Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
buffer address starting at the clipped boundary.

Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
Cc: <stable@vger.kernel.org> # Needs drm_fb_dma_get_gem_clipped_addr()
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imx/dc/dc-plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index dea7404fe659..7bab75d5dedd 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -65,7 +65,7 @@ static int dc_plane_check_max_source_resolution(struct drm_plane_state *state)
 static int dc_plane_check_fb(struct drm_plane_state *state)
 {
 	struct drm_framebuffer *fb = state->fb;
-	dma_addr_t baseaddr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	dma_addr_t baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
 
 	/* base address alignment */
 	if (baseaddr & 0x3) {
@@ -146,7 +146,7 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_commit *state)
 	src_w = drm_rect_width(&new_state->src) >> 16;
 	src_h = drm_rect_height(&new_state->src) >> 16;
 
-	baseaddr = drm_fb_dma_get_gem_addr(fb, new_state, 0);
+	baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, new_state, 0);
 
 	fu_ops = dc_fu_get_ops(dplane->fu);
 
-- 
2.55.0.979.g7e5102b832-goog


