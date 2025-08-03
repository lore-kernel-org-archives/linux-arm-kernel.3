Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD895C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyXTuG/pzO1S6KpBihte/IbjP5bnnmbeKtywtvutYYE=; b=z6FO4OdfKw82yjQflvORXI7SD7
	9oXxGGCyuM5cB7aGpcNMjDPdkjCt6udsfRMzPLgzRmuenpQnzv3c/GIbEvxcP50cKHkAv8OLH9HhQ
	ojUM0Ec0OaCywIOtTrqaxtDRy+OG95da5rF/fBu0Q1OnKQXO+t5jmX6VSSzy6dKjAGqZc7VF/ped7
	23RhzPs0F2y7CsFGkttWxR0VLpbgcbl+RNzF9y3JO1yqLO9Fp4Sf93mfUP/I4fx2QVpACiIPcaXex
	bu5/Le+BOHFDspNvTBsQJMFhRtn/lIK91+BM9hph1Eun4sSyn2zpWUaBo0nOOz3Liq8cAJE8+67Tp
	btCNMf5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRbb-00000008PpD-2ryW;
	Sun, 03 Aug 2025 05:49:59 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsl-000000088dw-0GTT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:36 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-86a052d7897so183883139f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193574; x=1754798374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyXTuG/pzO1S6KpBihte/IbjP5bnnmbeKtywtvutYYE=;
        b=jf6I1iO7k9f+H7CNjBy3PvvKyXTxeyoiETmrI8UV9/EoZIf1/KmnkEpQouKG2FUEuR
         YpZEIt21q3DF2b8JazPS643lPey0ttcR/wrgvhBPYcBhjEGslUKiY+dTEBxfBml+k4ua
         Hp5I0fk8uy+0zJbQ0i6mOL3Mc41tKPTebM9yzfQIwn/HGTvvxE3+Bvk3DpsFufcVHhkQ
         dmGt7bsah+VDGCStdvLGwTJmV0fXqeTrLzOGBwSGxah7wn8qgdNEdsbAPf78GUoNmytz
         BQTapTx1mxE3jufceX7ykpy++LsUM9jR3FPBN+jnR5EvVH2CBDC8+68n/GB5Oi7XfMrW
         V59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193574; x=1754798374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyXTuG/pzO1S6KpBihte/IbjP5bnnmbeKtywtvutYYE=;
        b=BlhjOK3eP/UjCiGGomy9Gb+JyczQvDot0q0FzfynTfa0gpKlOAJJ0gLAJIv/lnnidN
         J+6taKV/lufPktn4U2FnhkLgl0EAIuuRxABfS4cYAIIx2oZaQWOky7OWZTsxgVlppyKP
         iQqsvQfeKbu6jwVyXrqrn8ZxXJgoPLWIyqGEwd+pZPE+CkoyE19kP7syLYpSaQVgfTf3
         lUbMFpcnHWmXCoVaFdGGoHuWcYlbVvPv7t7qpd3+6ci/J+6WPpU61ZuNlSRfReAZTo/t
         +idsctACmzos3L7w/UEScJxIt7E1qByTz57xfeB9b4/Mh30v2wZ8R/KmKCbifBdYj8CM
         3osg==
X-Forwarded-Encrypted: i=1; AJvYcCV+Ixh6xVZLW63JTKGQuJPWgfcstfChXij5ConeG0pUiU2Su7kCDP1+clQcQ+zmjFy6fRK325xfTDA8SCn7eEUZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3S/qhH97SpLw/pdd1pAQIIeJA2+LX31/Ys93mEgHv/sabNqtS
	5gAIlyeTUlLGC2uGSj6O55+t2Afxd18dDXOEDoPHa7SsiKEdUMo0ZFkk
X-Gm-Gg: ASbGnctFREfn6c5/DH8aUyWJt9C44xjNHu7iapnkt8HvPK9LEeTXoSThv9m0w0boF2I
	OpsE2E4Epfu9oHYK2WVByMjvkIW8ziYIwH36/Snwo7viBsxBBXdpOCGpot88z4T0NMbajl7uaca
	AwWqcbGfvarsro1D06+puMsncBqVkeJXc6GQ1OO8qx7XzrBHJAr/bPRj+SfBdAZ63H6oOhXIxSZ
	hMzM7J4OKSs2Ses7FWW2l8q5uU+fQMAr4QB/g6wuNs17hMME8U/bxN6+HBZtg6iLQ0VN/oOywbZ
	Oq8myX6GsAq8r0JbFs7WMffN6u9xGABNjSaSIhc7PzkbNrFPL+vpPi2Bp6WdAhhI7jR+Nip4gL/
	Jf8gAkVQU2f10CTEBYaWED0M9LFGaylYoRtGvjRzlY0KGNkCzR2Pkwj2udCOFSrbf126mX++Xex
	tMyw==
X-Google-Smtp-Source: AGHT+IHHqpsxNwrIe1Yt8T+K5YT7f/N6jKSRjyJTXO375mjvAA+bcSXnn5xdTY/xrxu6S63FNdOpXA==
X-Received: by 2002:a05:6602:1545:b0:87c:41d0:9982 with SMTP id ca18e2360f4ac-881683515dfmr900119439f.6.1754193574199;
        Sat, 02 Aug 2025 20:59:34 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:33 -0700 (PDT)
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
Subject: [PATCH v4 41/58] drm-dyndbg: DRM_CLASSMAP_USE in nouveau
Date: Sat,  2 Aug 2025 21:57:59 -0600
Message-ID: <20250803035816.603405-42-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205935_102335_55053673 
X-CRM114-Status: GOOD (  10.67  )
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
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1527b801f013a..67caebf768483 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -74,17 +74,7 @@
 #include "nouveau_uvmm.h"
 #include "nouveau_sched.h"
 
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
 
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
-- 
2.50.1


