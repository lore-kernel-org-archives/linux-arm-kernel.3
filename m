Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE100C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyoOqz+KNU5cHFw0iNonI9mdJpTRYeIGpSlVGT5QSqU=; b=FVf43+FgnorPn0vxXO/kq33wi9
	GAKXJ+6uGOyYr7gLtuAANeUno4d65ZM3s2hwvJXbLcbMMbNvm1G1iAHOgoJPwKGfffS3V+RodNRo6
	BAfwzT/gNwz0zOdTDAZdiOqyDmU24DGePP9ahU7EOhOlULEYhRw69Orh9DHe7GwKbE1BZPw4cOKSB
	AnytPtHBBbx0H13u+hfA3GBLCEI+gbfZ/BxNYbxg5otMy5HgLtBS4M5zmHB6WW+aFmGLNGCaQTVxn
	spmbyreWZE3K+BanscWEAkAzW8QQ4ZS+bFmBwMbJqshVHjm7xEBM1B/sfXaFR8SwvcfOWHfiVNDpT
	It0zxuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRWU-00000008PbT-3uU4;
	Sun, 03 Aug 2025 05:44:42 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsi-000000088bQ-18n7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:33 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3e3faafe30fso25241165ab.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193571; x=1754798371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyoOqz+KNU5cHFw0iNonI9mdJpTRYeIGpSlVGT5QSqU=;
        b=aC+gQoWLJqkp49hmokTd4UB9EFXR6ZfY7GSCoAA2B4cUjEe3Xu9eWTkqr/89FEKrJ8
         /8QTTZmR/JdI9797m0BEh6DPdOJDj/wIizm8T1iPP82DTtukFaeoUldsa8qg4iO1KYIj
         oKhNfpcL3KA7S0S4/iWutxWaoJ/hmtPSKH1RxGRp74ZFZeueOeAjNxSCt2yfNnbyZ0mZ
         3toXsNL849jUahy2i8+JmGZumHoGG5zP8Ok954VvESojUBQQRedckeLt08TPFaauVhWj
         HexUVa0NcEaEgf0ZfwUEmyyBFXV2oRDKWxheEL1dunO41aXvljgVGOCQnPg3jhBw63fz
         0v0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193571; x=1754798371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyoOqz+KNU5cHFw0iNonI9mdJpTRYeIGpSlVGT5QSqU=;
        b=ToRTgF7OiUs4tHvnATjKeXTuYDog/tNnoaqveF6nVjGyalUm3rfbMzIQ1utDMpfjUI
         6txqH0yh1IXcD9FKS0SCy1eISr/o2lc2mT7/tSLduYt2LhWBEOs6rk2cx3GOezp6kZph
         N3/Pk6RKBQ87V/2vDDFSQ00oXCP9syzKJZSaWjSeIvj6gbNAjwNC1cPezEtvvO0rEi1c
         hrTVdXlNBmt6MZVzE6bKyVmFd3UOc64BV1g9xhsunkj8htBD51mVjS6Ghjcxqyo4njZu
         qyCiWa7erCnHdx31rlrA6JmcvsCqru9UQbJZnL+z0UkIw6G9DvJkAcYzU3I5pusHGube
         90tA==
X-Forwarded-Encrypted: i=1; AJvYcCVluh4AMXVy/QBEWcd86yRxXdcn/Qlx5iZqOgc8+n4cdtc42I8iaKgp1s4MZK6UNJPhIP/GjMMRPFRgaT+E+iDo@lists.infradead.org
X-Gm-Message-State: AOJu0YzHu+jzZ2j/TdipstIUf5VsbxE+CFBm6DD34WrPgHO4M1yRjPbF
	/4dLvm8NGqCBa3yclQnLhH5VBX5gMtgvNipeUgwT/kHhe7zRNfAo76urPoKEE0EtMOI=
X-Gm-Gg: ASbGnctXKjoFqBm2qMNmpak2JJX1ocs3YZdXu+6tRv+dJc5gMQH6z5bs+0dM8hhCVMG
	B+85aSrxS5+zjzXvChwdGXMuKzaOABn8jJfiJokN0UbMTuTTkezoFZ2aFP1gAkk/b7rlZSqq4Tm
	F8l2QLCeVnVbCTRWN8Oy41WaXNJo8O9DEl7m6M5dnqWGw0xDUeiz0V9NvUrx6uwGezZAj2qz4lV
	3lEp6MzwNqCuBm3l5JJcXnhnHlviq+0bzt6GkYotDbCG7FXKZFvnlqOBkyE9oladYw9GtnalDNX
	lpCMkcuzdUFLTvGd0irU0Ny05YWwVQyq6A4Vim7Nx3KahuZ24C4DLDPzVBV7paLucakYrkSsPkd
	xthiVRWEI42DuD7vO2o1opIcP1NVyl0v3JGclh69sR1Ds2J1KEQoX0sFUyAie654ta4LJJ+n5Zb
	lEAQ==
X-Google-Smtp-Source: AGHT+IGah3M6q8sow7PmA2xw/j3+4wUg16/XNoOr3ocRA+wBN5F5xifQppQnjG3O+XbNYtlZUh4PWQ==
X-Received: by 2002:a05:6e02:2686:b0:3df:45bb:2900 with SMTP id e9e14a558f8ab-3e416109eacmr108511895ab.5.1754193571601;
        Sat, 02 Aug 2025 20:59:31 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:31 -0700 (PDT)
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
Subject: [PATCH v4 39/58] drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
Date: Sat,  2 Aug 2025 21:57:57 -0600
Message-ID: <20250803035816.603405-40-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205932_323976_388B359B 
X-CRM114-Status: GOOD (  10.30  )
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

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_crtc_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 39497493f74ca..8d169a6d7053d 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -50,17 +50,7 @@
 
 #include "drm_crtc_helper_internal.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 /**
  * DOC: overview
-- 
2.50.1


