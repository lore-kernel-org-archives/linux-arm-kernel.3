Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE4BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqxoGMNKs0zT3PFEOQHIVmiXhAzu6aMNCZrDaU5Xy48=; b=208QT4Y3e4TbaWAwnfEOrzlo/5
	Gh8fTnnL7sgeoZQG4/JQPhxnJBpT8pfHiIYWKDdWvLEa7vdCpNS6q57T4ie3WZCnFQ7DeY9eCcKWE
	234Mr077J+2QwSA/IGLYSOdRQ5j3Zerb+qq7O0wREC817PZTlIhe9ejiMJtFgbbN2ZE1kbp7PH66N
	DI59uLOaDr/1MkgpAAC3LsHNW3xxpfxUJtmqj1iTZ8fd0V3NOKwljeIaj36YPf/EM/0I07CEB6KIU
	CVWOceo26kelt4NAIllIVYm6ItpPVM3v0uJUkKPkVjJOASlge7DPSEErm5S/vyWSVR+LOY7m6wuQU
	LCCGeO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRTy-00000008PUH-0m5K;
	Sun, 03 Aug 2025 05:42:06 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsg-000000088ao-45E7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:32 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3e3d2ad9180so12216865ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193570; x=1754798370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqxoGMNKs0zT3PFEOQHIVmiXhAzu6aMNCZrDaU5Xy48=;
        b=JtzwiG4ODruc/hyr0iYliEvvFz7VLZ0pYMQ0O+bET8UZxHY9QbSpOgFTHaB38FqJMs
         1ROZMd7NiIOu/0sZZzZDHgt5N54mV4+PtGLhhj+XptQ86C3vUqSwEwBcsfwbk06cumZP
         wuwouIZbssnWUw1uhGKcBOTJb0vEU+NrgbeYfJWRsytfmYB/+k8kuAWCqKowMrCNSmBD
         wI8n5SQ53V5J6lvUIwJn6nOifzu3Xez/taqua49SucUC97hGCGexBVmglz4n6XkecGBQ
         uUSe9Hn9SZ9MBA/aqFhRCAPqr09wmJ1a+CKN3qla5KLgJEkqgdStMNM50Ri4uh2zb3Dl
         BkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193570; x=1754798370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqxoGMNKs0zT3PFEOQHIVmiXhAzu6aMNCZrDaU5Xy48=;
        b=W2jPDCcLQrPbDJZ5jyqQ6GyEtzVp8+ZkpC1C5dqwYHhkrqa8bQMs/wZa4Fsdp1npfQ
         YA9NnQgpkFsdDYNYjM3NDPCj3eSh7oleg6kHLwT7GLH74z1H+B8FE7NlaAoV76btdabv
         THHCwConp0I6UghAVqNLI8p6YSRl61VDGP7ZVw/l0UjjRct1ludmi0goLWKkrvK4fHlw
         6BV9Q3eKpRSB9QuUXdhVTwnbzX4oOjGN+pPzw+1voCAFNTdGisNoTQZlkrGiEtCawWd/
         CuhiC0yNXdDkJP5/HthKjcSTSCYql+EicuPHyZFrG06hz9QddYDSNY5fE4F1nlLkVRBc
         7Z1w==
X-Forwarded-Encrypted: i=1; AJvYcCXP1AbeT3nf+EMxoaLFWfdh3VijWhrhWvWyvZkllOE10/9qj6LheW/C2CGGVR/Wh+Puuien+EpNK9JGaZ0aaHxj@lists.infradead.org
X-Gm-Message-State: AOJu0YyoFmoka2YoBCyjVCiRcBLj6CxOJSpETQhfMNXRCt0fB7xowPox
	Vhe6Mxv8FpN4xH8qydmb2GVJUgxBMlIqCpFOjZ+DWptzBNmY0QbTEBI2
X-Gm-Gg: ASbGncuAgzY387qLlt0RgOCZsfx7wvZ+bOPWEq4qLMZOvtfQY5PgIDdViF2b3ByzEEa
	PnxbH6teQr1oPSSZPe22qE8OD1EL8jOoS9Zxd2l/iAXkYVkmQb2UAZHgf8aVu647vOBsgRBIf7R
	S1fLltTqisMeDcmo7DZ1OfCWYqP4dck2ISHuQGaxaknK2x9RMnnOn8xI2293vXZJTQ0uIcU8AcO
	Olk6+hcVHvUSlw+2lfwsokixHeNydGs9+F7GXy0IHFwcXBwZPRxba6s8ImlDRxEcmysO1yOEV/3
	WVp44l1wFHiZ8ZyrYxnhfdKU4y0PxA5Tt3Dmw5SkW8hob8QyvuOmWqk/kM7zJDaJJNbvOJBDZpl
	24wnoJ6CUGg6ucue1WSP4IIc43va0GletcFNPu+dABO0VJQa/qQdTJoixxO7yP8+82dycB3N13l
	KzIA==
X-Google-Smtp-Source: AGHT+IHsfQJoD6SRNz26VMT+qJigHz89jvyvI66oHmBULdJ7IaJZxTqFyxCoP7GQo4VUZTT9hDwD9w==
X-Received: by 2002:a05:6e02:370d:b0:3e2:8e44:8240 with SMTP id e9e14a558f8ab-3e416345ab5mr91990955ab.11.1754193570153;
        Sat, 02 Aug 2025 20:59:30 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:29 -0700 (PDT)
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
Subject: [PATCH v4 38/58] drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
Date: Sat,  2 Aug 2025 21:57:56 -0600
Message-ID: <20250803035816.603405-39-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205931_020885_5F18F381 
X-CRM114-Status: GOOD (  10.80  )
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
 drivers/gpu/drm/i915/i915_params.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 37746dd619fd8..2dc0e2c06e09f 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -29,17 +29,7 @@
 #include "i915_params.h"
 #include "i915_drv.h"
 
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
 
 #define i915_param_named(name, T, perm, desc) \
 	module_param_named(name, i915_modparams.name, T, perm); \
-- 
2.50.1


