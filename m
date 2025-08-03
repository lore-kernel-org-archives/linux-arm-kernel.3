Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04040C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPCuAnoyt2yaK7PHqEP4KAuT17bxG8DAm/V2Pw+3mVE=; b=U6XsAd3xmq04AVGTTjjrtf8i/c
	OyNYp3OZxTZwWrriKI/k5FMnZIYShNXll4G9BzR9ySxjBYX/oxJI9ohSeP4poV+QI1/LrXk9UeAdf
	S7W97H6FLv+ZiF8RxXOxiAiUTjrPeIZbP5esft9ifjCvMrl8NGXfKmvyZ3lMc83B6jq4FafEy9X/L
	LdyYYFsfJXIlwtTczkI5RIzBhcZB+8q2K1wY0jLgaC0bgLQqQPWGyvrlg+WYc+x0mKMVfimSpD4KR
	m9JFX0oxzp7tE3k7JS4X46M6r9R+Ku7dtQz+MEF8bhWcnzOkhfezooFrjmSAZZfECzr1Z5goAmzjd
	nAdb5fKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRMM-00000008P91-11v1;
	Sun, 03 Aug 2025 05:34:14 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsc-000000088XE-32kI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:28 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3e40d006105so14219725ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193566; x=1754798366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPCuAnoyt2yaK7PHqEP4KAuT17bxG8DAm/V2Pw+3mVE=;
        b=eehhcQmsbT9nFeKvEP69bYoNLzTvV0R9+RTo/r/l/6mzVUuDnTREi4XCDLqy1hQTpS
         xoAXnzj6JeAxtBTbJ+NitxiNfMy+x49lbgfwYv6gPAFR+3/JDFaOjGyjmoBMbna0KCON
         LDYPwzUu8qKClcdiqPVhnPaWUXzpqum/H9fL4/mPwjE/lxx0fjIQOwYT/OlJOuzseAX+
         sZtXCuoxlO9ikHt1z0ycrcGd98QV3iwV/dBiKC66OY0ud+e1+JoicmIvyeT0gzQdnFU6
         6puQJhXWr6bTrLpKFvKpF7GbbAaECuJmRJFuJaFPe/CeGOT9JxA9beG+7f9z+ny2ZTA/
         8ZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193566; x=1754798366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPCuAnoyt2yaK7PHqEP4KAuT17bxG8DAm/V2Pw+3mVE=;
        b=EyyZCDEVXMY9Hy2X7zL5O2RfN5j7JE6KjBE2cBN95pZuF6/7L7ZuBJfw0NDRCcTMrv
         Xwp0Ei+L56sszwXHsZ16ncp4Asf+xJEVehMmewJ3Pm29Rg4xWQr/gvRlUSatvYRlA/+l
         3YA9tHrp02LOSdb0/oOWs7VJEGz6pbogflp9Bv6mRRkkhBaeKP8GzwgK+WXHHed4Iciz
         SZmh/wJF/kWqGfMwXaDj6lTF6/7gNCz9ScD+6ZAWwTKdgWTQaWjMC8oVZqbRbBJ7ztmQ
         VtzHjicmASj4jakJUFBZurBRyx87frguKo37FphrV02ccsBY/VkTzfo1XqwnU9Fy3LPF
         x7dA==
X-Forwarded-Encrypted: i=1; AJvYcCV+m0D6bCXgrXrL/begH0xn/vKeHeeGah3DjCo51eJxrZ0ZjMeNY2e5ecZ//Fl98Tudl0/As4dyFmwWLfOOgEje@lists.infradead.org
X-Gm-Message-State: AOJu0YxXPr0ms38hfAD6dFU8eDjz8/4PqJSBqNt0wcCe2dagTrNpluFt
	f4QrgY6QM7sg99FkYMvalyPMwxlBAV11GNuFSx0OkJJ2iIpoq5LOmIoe
X-Gm-Gg: ASbGncuYE3NTPI00HiCyw+x5Y0bQFOJqIUEC+5JLvyj3awSgf2RVX/s42a0cC9uhjyb
	6ZhMH+sNEt6lrDgbWgCvK5997POEzW1wsqUFS06A70LbR8Iu1myvdod0DFHkcSv+5GC+Vh0E+ST
	W1MTHh+RUH+D/2CJFpWY91CXTl3CeCOvVXZJvDLQ6x4ZX8LjwziO2uJw00bebF3Gdx/kfFExl4U
	ap20h4V957nGTvGf9pSvtlXs8H3y2sIF4GA8J6Ydqx8Bd7VWrhAHE18I/8Vd03EzpQCUmNKBt0V
	sxF5s45i0In0HvYe7USzxpSL2HY0bWDYfMODhNeTWxtRfHGNsUeU9X5+9qSqx5rEE06wNGXWeOC
	VvgFxJ78JBtqnaSPKoOgyFtDFKMe8DPl5bV45lgiAEtacM14oZjGoolkoFJjovZTudb/pcrSUm/
	UEPgawdFfqGxcw
X-Google-Smtp-Source: AGHT+IGoLnVRK0ZsQUveSL4ZB3Aom5SaUMztjFiNEQTdBWyQuqxM4dmylhRHkY6dHcuDvZjPdgtOKg==
X-Received: by 2002:a05:6e02:308a:b0:3e3:fc9e:b2d4 with SMTP id e9e14a558f8ab-3e416176df0mr85880415ab.10.1754193566087;
        Sat, 02 Aug 2025 20:59:26 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:25 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v4 35/58] drm-dyndbg: adapt DRM to invoke DYNAMIC_DEBUG_CLASSMAP_PARAM
Date: Sat,  2 Aug 2025 21:57:53 -0600
Message-ID: <20250803035816.603405-36-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205926_819500_66E77EAC 
X-CRM114-Status: GOOD (  10.90  )
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

Invoke DYNAMIC_DEBUG_CLASSMAP_PARAM to hook drm.debug (__drm_debug) to the
DRM_UT_* classmap, replacing the ad-hoc wiring previously doing it.

Add DRM_CLASSMAP_* adapter macros to selectively use
DYNAMIC_DEBUG_CLASSMAP_* when DRM_USE_DYNAMIC_DEBUG=y is configured.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_print.c | 8 ++------
 include/drm/drm_print.h     | 4 ++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index a3b70d104afaa..46d53fe302047 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -69,12 +69,8 @@ DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
 		    "DRM_UT_DP",
 		    "DRM_UT_DRMRES");
 
-static struct ddebug_class_param drm_debug_bitmap = {
-	.bits = &__drm_debug,
-	.flags = "p",
-	.map = &drm_debug_classes,
-};
-module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
+DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
+
 #endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 03b0a2bbf91b3..769036b2942b8 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -144,9 +144,13 @@ enum drm_debug_category {
 #ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
 #define DRM_CLASSMAP_DEFINE(...)    DYNAMIC_DEBUG_CLASSMAP_DEFINE(__VA_ARGS__)
 #define DRM_CLASSMAP_USE(name)      DYNAMIC_DEBUG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...) DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(__VA_ARGS__)
+#define DRM_CLASSMAP_PARAM(...)     DYNAMIC_DEBUG_CLASSMAP_PARAM(__VA_ARGS__)
 #else
 #define DRM_CLASSMAP_DEFINE(...)
 #define DRM_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...)
+#define DRM_CLASSMAP_PARAM(...)
 #endif
 
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
-- 
2.50.1


