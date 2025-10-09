Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C6DCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9kNNIboTBu/rgfEeqjlIf4OLiFoNCoyw80MDr+LA5Y0=; b=E2wngq1yd3AVxkrKrRvWJJQHcJ
	7hqvsQG+mCgBqaox6spFvhLldnMRyU1WaNNcKbA4UjnnzjdIo8PCPDQ0zWY0AFP2qAI/SEchEjANk
	Pq1TRCpfDTPLcmPL2IgruFWNui8bvqhSB15NilKNJ+8b8jxzKIp5GHztT+PJt38KU63abN3mFbVgc
	lff+sWIWD93cWGKJrlbMUKWKOWce+a6xAkQR4R6GdU/pnQTVJgF+zqr9Op+dc19WOl8MY6U+ag2I6
	ErNohomueuFz30hj8v6B6+BBLFnMOupxfLWC3D1Q8Ft4otw8WU0o5g+y303NkW3tG+ceH9MmJcv7G
	HJdYa5xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sDv-00000006Qqy-1oSY;
	Thu, 09 Oct 2025 15:06:31 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sDt-00000006Qpi-3p2z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:06:31 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3ee888281c3so1252507f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760022388; x=1760627188; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9kNNIboTBu/rgfEeqjlIf4OLiFoNCoyw80MDr+LA5Y0=;
        b=hT/UqdvBN0s7P1pAnbYk7HJkDNUQNuXn1TbQdYDwojfuWa13pDq6RZR+5vUhUAQl2d
         isBwlyFVo+Jn2DfqktwbgqdGrPrbOotCc18gaJOfw5njArzddB4jcGKMI7H3IxSiR9De
         4L3WhTqC9weot1yWDu7VD4X9cXOuVG7ttsw7Tk7meRmvm1R9lORnUUbiq0lxRENDcKC4
         KJ/snmPUupPRXciA1X34WTDgZXotNiB+IuTOyy8YY9zGd3la8ymtXO/4zWWeTbHHTsWK
         sKEGPLGA6b2LRZQb4tyVdf+Dpg2qtf22KI2U6Lj9piwewskPbu0jat1ly/48IHf1/Ej3
         nq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760022388; x=1760627188;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kNNIboTBu/rgfEeqjlIf4OLiFoNCoyw80MDr+LA5Y0=;
        b=nk0dZ1l2SEqCZz4ZTcNP9bm5MdzmFX6+gAANcppmWVZ7yUCXXqqvXQUfgE7iLH3PTY
         Acv4BfR6O/17Xw7uejv4Y0B5VKZPf3/hl0DMHQp/V2fowoEJZ2Zmyk81EaZB8ZROLTF3
         a4nkGZxP7h+6plVWsZamV3Ie6nJuQmZQkJWXbZh2hBALA2UN8nCKRFI6nXIRyVZ9Dumc
         roryBBq2J8s4bz1NDJ9t+rGjogVSMYtP905DvHxsqppHLQvoyxuCykWiM3m8PMMw1zb2
         RphPLkPUu6aIvEJ2VsuVdK/7ZNNiFIqYJtoDmsAEjTvw3K0lytAfDb2/h0eruaE7AogH
         8LZg==
X-Gm-Message-State: AOJu0Ywfixs7gHXQu9CJf9y3C1H7uEwG8Ysj7JeEnl6qJyrNZApClbVw
	Oh4Dd5giicvEtxzQ18meCdyc5QSKz0c/+Rjkmm9OyJVHVGdVqiKHGJeQ2kZsDqxtRgQJpck2xA=
	=
X-Google-Smtp-Source: AGHT+IF28pI3nDsq06k40pR3d1KWdnq7Bmqmwn+5p1/UbYexmHQrk0yWcmBoTkVBvwdXntL/+LqRUcL0
X-Received: from wmhf15.prod.google.com ([2002:a7b:cc0f:0:b0:46f:b153:bfb7])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:41c6:b0:426:cd4b:4b36
 with SMTP id ffacd0b85a97d-426cd4b4b50mr143095f8f.58.1760022387953; Thu, 09
 Oct 2025 08:06:27 -0700 (PDT)
Date: Thu,  9 Oct 2025 17:06:21 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2191; i=ardb@kernel.org;
 h=from:subject; bh=BfB8Vi7bZ1cD+rxey05bluTEmM0Q6lYE5jThs99t4Pg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP5+TxG4RyBuTtFVdNaFojs743b5qHJd6D1WPaRB32LZ
 r1fLOPRUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACay8jUjw61dyq5Z+TtXinnZ
 7X1o/vriK/GTMUvCpv3Si3roP2+Rujkjw9YKwd/iohuiu2Y1beXKSlprMTmh7G2Qv6+mq8GfWMs z3AA=
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251009150621.3886079-2-ardb+git@google.com>
Subject: [PATCH] drm/amd: Permit DC_FP_START/END only in non-FP compilation units
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_080629_984895_1F270BAE 
X-CRM114-Status: GOOD (  11.91  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Test the existing CPP macro _LINUX_FPU_COMPILATION_UNIT, which is set
when building source files that are permitted to use floating point,
in the implementation of DC_FP_START/END so that those are only usable
in non-FP code. This is a requirement of the generic kernel mode FPU
API, as some architectures (i.e., arm64) cannot safely enable FP codegen
in arbitrary code.

Cc: Austin Zheng <austin.zheng@amd.com>
Cc: Jun Lei <jun.lei@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h | 8 ++++++++
 drivers/gpu/drm/amd/display/dc/os_types.h      | 2 --
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/d=
rm/amd/display/amdgpu_dm/dc_fpu.h
index b8275b397920..4e921632bc4e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
@@ -31,4 +31,12 @@ void dc_assert_fp_enabled(void);
 void dc_fpu_begin(const char *function_name, const int line);
 void dc_fpu_end(const char *function_name, const int line);
=20
+#ifndef _LINUX_FPU_COMPILATION_UNIT
+#define DC_FP_START()	dc_fpu_begin(__func__, __LINE__)
+#define DC_FP_END()	dc_fpu_end(__func__, __LINE__)
+#else
+#define DC_FP_START()	BUILD_BUG()
+#define DC_FP_END()	BUILD_BUG()
+#endif
+
 #endif /* __DC_FPU_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/am=
d/display/dc/os_types.h
index 782316348941..6af831710489 100644
--- a/drivers/gpu/drm/amd/display/dc/os_types.h
+++ b/drivers/gpu/drm/amd/display/dc/os_types.h
@@ -55,8 +55,6 @@
=20
 #if defined(CONFIG_DRM_AMD_DC_FP)
 #include "amdgpu_dm/dc_fpu.h"
-#define DC_FP_START() dc_fpu_begin(__func__, __LINE__)
-#define DC_FP_END() dc_fpu_end(__func__, __LINE__)
 #endif /* CONFIG_DRM_AMD_DC_FP */
=20
 /*
--=20
2.51.0.710.ga91ca5db03-goog


