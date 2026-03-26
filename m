Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576CB106F315
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCaasFgG3bKwmDmNR0xzReU3+wYjKSaL6CIO2mNwHyw=; b=GOXWu/hqWBaY4gBEajSfeBzunX
	3vrnZeYcGHnVbzAUrIY+Sr+ACWU30jRUcTKpNTXhwFmV+ESHx1cO8cdRN3WUqvbLMwSIDn/788P79
	fTQVYjdffJIUw8bsNsxrQqSVg8xHpH8Xnz5DwaF6MhYs8J6uSw3a+eloTCcz7fKrLuYafiJ3VCRvt
	TTboPClRhMJaEU1t1/qBhp1v0s5ml5KNrhMkBX4Q4zU5Y6JT54aGKlhNpvG55xT05mbOxEKgqMpcB
	UGL8m4wZCoiFm9eT9ez+3V6EjR/fVvMcPNbFJ9b4c2CDwuCpua7VmWc8abL/k3t/f8sC2ZbyrZoPa
	73ucEaEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hFi-00000005AjZ-3SVY;
	Thu, 26 Mar 2026 09:43:46 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hFR-00000005AdW-1N3L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:43:30 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35a02f3b8feso386783a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774518208; x=1775123008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCaasFgG3bKwmDmNR0xzReU3+wYjKSaL6CIO2mNwHyw=;
        b=Hpbo88wbWLlOLXW8085PtcqAkl+aOhLsO02ryQmOzm9H97kQi3K8Y5i/6t/IGhgy1K
         S2wG1Cj283FaBbQ+T9VtVSWgoZeUzEY8LZNgYR/LFgHRRviH8EsC220In2OIBxMB6W8n
         u69D90iCKTdk+FvAm6HPktVmNa9JSIJHJz5tY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518208; x=1775123008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nCaasFgG3bKwmDmNR0xzReU3+wYjKSaL6CIO2mNwHyw=;
        b=VQjhAkjz/GRNneQ8Sj3nMbyADfXQ3bE1tb+EjjChQ8rFwkE+YHuk24u62IOBsbwUpu
         teRH9AlJcAuIu6Dhrduj2TLLVB6DDGKjb85ciJwyTyEdANBJYs41XoW5e9KuezIKgjsR
         KIS8xBVKZ5xHT56pfHaTSXcbR9x9maOwTKpyHzsUv7llHsvQIbLDA6G0LMBaRCQX57IO
         912EgUZQ6DkBqsWEQPAFQllb89VPI6uc57Jo6CYhNtpkeIR1JSqNPEDIhdTQn4OXet1e
         8ufj91RbnkKpbR8Cs2UjyJVI3Bm8fkAstfrA8SBBZ8pP73s/np8vn5cO6xINcb8vsbad
         iJOA==
X-Forwarded-Encrypted: i=1; AJvYcCWLWaLAiAdZhlbw14biSN9ec09bwUX34bIal+K0T7DhrDAPaYF8uex9PpFi52N+EUhsfkK2SrwKTZ2saMaG0cfE@lists.infradead.org
X-Gm-Message-State: AOJu0YwT4A0xCuCuHcQFoYhO4+tFCgZuxo4zWTjz7N/ARP7wVwJg8T2j
	W+vS07F0AQlIpKOtgTRihuCxJEgoGFn6eraDhhpn7Zim2kF1XJnwHPe30kwANuXn9g==
X-Gm-Gg: ATEYQzy+cdDHeMu1HkJAwLaV42gNnvnhdt/QPO5eSayVTpCDnwLB/gRwADLHdsGaOHW
	7TzUbG2u8UIbjz/mh/iMOlKvfW/35buGR9ORcZtxLVzHmVcEUsOuIu2+a2LDNLV+/frqRIBKzI6
	Ut33i+SS7aUUFL/16DqVyjI1BMSpIEXtJKN5yCFx19Uj5SRzaEkQsgCNVdQ2R4r2cECAL9Snzs3
	4IEqWVvHmdgSUEiyygW2HaFLZqBFg8EnhJOw7JK92NGZ7o2oUvTuBEX2+ZXhq4jKZ+srVB22X78
	JkMwAJIgygjV5F5sWjZ+M1ElvVa9PMsuFnv0RU2LvqDslNGxqzTV3RWjGtoLppfCpXbgn24801/
	2P+OWm5BokkU0iNK5h0PJPT+bYzT2goYNOtoB1mFniWb6+INGggVQri6rV71HqKiAZzAh23S010
	nSKUgceALvpF7I92S5ufgNAQBunwQK20snmMBAld+kMjH+wJpExgZ8rnH+1M3Bp8iyOExQ6b/r9
	Z97A+tP
X-Received: by 2002:a17:90b:4fc4:b0:355:35b0:8b78 with SMTP id 98e67ed59e1d1-35c0ddd9d68mr5978607a91.27.1774518208424;
        Thu, 26 Mar 2026 02:43:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76737f28fasm1673312a12.7.2026.03.26.02.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:43:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/exynos: Drop MAX_FB_BUFFER in favor of DRM_FORMAT_MAX_PLANES
Date: Thu, 26 Mar 2026 17:43:06 +0800
Message-ID: <20260326094308.1161335-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260326094308.1161335-1-wenst@chromium.org>
References: <20260326094308.1161335-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_024329_366024_D91A4A80 
X-CRM114-Status: GOOD (  15.64  )
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

MAX_FB_BUFFER refers to the maximum number of buffer planes for a
framebuffer. This is the same as DRM_FORMAT_MAX_PLANES, which denotes
the maximum number of planes.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 1 -
 drivers/gpu/drm/exynos/exynos_drm_fb.c  | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_ipp.h | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 1ab7195d09ae..b126cd129944 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -19,7 +19,6 @@
 
 #define MAX_CRTC	3
 #define MAX_PLANE	5
-#define MAX_FB_BUFFER	4
 
 #define DEFAULT_WIN	0
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 125b87adfdc4..93f387b12126 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -99,7 +99,7 @@ exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		      const struct drm_format_info *info,
 		      const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	struct exynos_drm_gem *exynos_gem[MAX_FB_BUFFER];
+	struct exynos_drm_gem *exynos_gem[DRM_FORMAT_MAX_PLANES];
 	struct drm_framebuffer *fb;
 	int i;
 	int ret;
@@ -145,7 +145,7 @@ dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index)
 {
 	struct exynos_drm_gem *exynos_gem;
 
-	if (WARN_ON_ONCE(index >= MAX_FB_BUFFER))
+	if (WARN_ON_ONCE(index >= DRM_FORMAT_MAX_PLANES))
 		return 0;
 
 	exynos_gem = to_exynos_gem(fb->obj[index]);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.h b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
index 67a0805ee009..2842c8af0b7c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
@@ -70,9 +70,9 @@ struct exynos_drm_ipp_buffer {
 	struct drm_exynos_ipp_task_buffer buf;
 	struct drm_exynos_ipp_task_rect rect;
 
-	struct exynos_drm_gem *exynos_gem[MAX_FB_BUFFER];
+	struct exynos_drm_gem *exynos_gem[DRM_FORMAT_MAX_PLANES];
 	const struct drm_format_info *format;
-	dma_addr_t dma_addr[MAX_FB_BUFFER];
+	dma_addr_t dma_addr[DRM_FORMAT_MAX_PLANES];
 };
 
 /**
-- 
2.53.0.1018.g2bb0e51243-goog


