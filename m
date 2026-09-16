Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9CAC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 03:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nb71HvzDE3B3FVkEVJ/TFE9xXljAPx+xdoqH1xLqTX8=; b=SRdwZ6FHJOJ9uxh7Fu/w/xDwv8
	REJNzBpvtK9/lDB1sLdr/iq6M9nvNL/zuSLz06AZehdQkVnWYd7SA4oZDmXNDlf1thFzPrCqdtYvQ
	XUII2M6pERjppdwRNJomsmfC/pBQw6vc9kW2bEGgoouNW3LzJpUYejfcFEIbwEAT4uOrV6wRnShuL
	ZA8K34L2IwrHlPhhUeg09j1uGaqPkBFuPZM5qyxZdJDSlCmdzTUIZZSRPl+bdZASezP0FhfMNZC0B
	f62s3g4ApXXjB6Ut1Pf1vhdMnHPLSWh5aerWDYbDbHNGte/ORC0kBvwv2w7e0zFUTPQTR6ueLuTzv
	b406Sauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gPR-00000008FVp-3TS3;
	Wed, 16 Sep 2026 03:34:09 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gPC-00000008FNE-0hhr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 03:33:56 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-398a147688bso406512a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 20:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529633; x=1790134433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nb71HvzDE3B3FVkEVJ/TFE9xXljAPx+xdoqH1xLqTX8=;
        b=N1V9BG7uwF1E8EcwlH6cY9WpYbo7z7C+oC/fSFydJlC7o8i1w1TFct357fTwsmEtDJ
         h5OC0d820eyhRfIPzGqQYGmCPWwcgFY8mQSH6mPasFcNfw83iTZfXFBYAyFRCaeu/nCa
         kaUYX8oi1ejyc378KGPIGOqAinWG7B4sRldnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529633; x=1790134433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nb71HvzDE3B3FVkEVJ/TFE9xXljAPx+xdoqH1xLqTX8=;
        b=tm0clU/jWgf08rf/PW6Uf8WWebKOYg79iISB/q4nEWb2JYqIKcJBeFHUr+IjMFfkrk
         LUIoCd3LHgYoqosWF9ZPhoMtvQRs4bduRFgYr1bdzbjeuiS/2KqokPvl+jJ89b+KBrId
         q21i5j9wNMlNvMTZ3YgMid6D/+P0fjCIwgpb5nonv5No6MFbiEcQpVgtXyLX5LR1SWjh
         zOr27Fc2M5BgIClVUH2FM/3nFdK/ABsLslem/N8qGedDSk0SotfYBiCYbeGSsULit/5t
         Djs1t5U5o27QC9Wq1jdwalh8AHDm+pxjuUOMX27+6oiYDTFCkLHAh95rCVwalbVwoaWJ
         HP6w==
X-Forwarded-Encrypted: i=1; AKwUvBxn4azQm65MI6at9sYQkhTinbr7uJCpE3ZOHVbYzCetKA1Xff5ITn+zCHWSFVCGJ4ZJhl4xAl6emmIb4wc6kYWi@lists.infradead.org
X-Gm-Message-State: AFuF++lW92r4rTtekcw0bY8waYz06hpsG2t3g3/1Vsx/TiFcxxxhcLit
	ujlW8oAfQDU/ZZEkVT8A3SfDCb5YOwEfHg9qFkrx9vuxhBctK9/c+dHy5G74cBdXRw==
X-Gm-Gg: AYBFou0Ry4BUo/JZrDq91aBaqeWFBUQjU9bSS/L8ypPp0BBM46l4NAAiPv/Yr4kktyM
	CBTt9+VrffcBH4XCbLNgjo50aScQhQAsTzLV3G6I39UcAruRQsvAMfE3cRrQAeyeKJqkdBKa9O8
	+xymacNaOSGDw7dqw6NesERAxmoqQMaZsKWjZheyq+Cbs7ROWswVqhhKjP0l9SNgrqSAaL92oH4
	EdCohiISqjMe1W1+70ZbgVxdYby/YGL3OAjbdctYtZlG3CjEZR8TxcFMTgO0YYD3Sgxf4ytVUGE
	e/5ftSOgajFOQzBfZqiIRiwUHP/YgYL1KG4JL9trclo7Pz9F6UNUC7hEN1nYyZD2GPoXUhnxPLc
	8tj5voYCus4qPQz3Vry9NzkfWRMqVIxIdoN7UziPsQ3/fPEHTSZsZYNGsU/ZpwLCGGC3Mjti+MH
	k00euN79sMbBTlSyNm+fL9vUd340lNrEMvGfXzBl7PHcpn3MRBEdPREuGH0wGFpOIWQuJ9OqGDy
	lMDnlo2Y1zOrDNAVl+Yfxt5nojigWQClTqC4YKy5QZJW5HywZqEzsUhNA==
X-Received: by 2002:a17:90b:582b:b0:39e:f1:b2de with SMTP id 98e67ed59e1d1-39e1e4c54fcmr2477670a91.20.1789529633211;
        Tue, 15 Sep 2026 20:33:53 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:52 -0700 (PDT)
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
Subject: [PATCH RFT v2 4/5] drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Wed, 16 Sep 2026 11:33:25 +0800
Message-ID: <20260916033327.3054126-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916033327.3054126-1-wenst@chromium.org>
References: <20260916033327.3054126-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_203355_302939_14EFA82C 
X-CRM114-Status: GOOD (  15.88  )
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
index 62dd0576fadc..35eb5039f5ac 100644
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
2.55.0.1032.g73a4cd73de-goog


