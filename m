Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3059C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 06:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ayWtPygJ2HBDiY24yxyRlwrUyqnG3sxcO8anqfHfeE=; b=D10TrG28UNqFakHNhmLDu19oQ6
	4uO0czHpvpgWtuaEP1/faFfemwBCGpg1osWdOLv3h8ABMiTKCa4VPsr//kmF5m6YLUU0TFHRtP256
	A0yOkKVoWV2ixoLlVOijSFXdCkkXwMlEGru3w2JJxTJ9dAvQQbS1C1CIQ5r3igUbhsuayjHK49ZZA
	oVUqO8LP1jOHimikenSVeQ9YI+TUUpReVIUjQTvHIzq/vYvPs3JB7k8w04CaZaTyohyx0agVZoF59
	x8G6Mi6V/wzdjCJD9SQ1K4RlcJdU8+3yqQmGKh6jgfmxDF588ICyWsX2fwX6yqyS+iBJw1YhZqlUi
	kYNGuqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiSGH-00000008S8r-3rJS;
	Sun, 03 Aug 2025 06:32:01 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPt6-000000088ww-2Esf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:57 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3da73df6b6bso9004355ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193596; x=1754798396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ayWtPygJ2HBDiY24yxyRlwrUyqnG3sxcO8anqfHfeE=;
        b=JHMPJm7w4zcwACp8mAzVvD0F07lEEv0geAHlsCksIiAOH7JDZHLnLtBG173yCXW/y2
         qsrTdjfPLsYAAS6qbFyLm7mmnXVgPC/VNoOV6y4k8tBBwClxBTxcUwa42fpzMN8naqii
         zPsSd7DK2uQxdEa54NNCvJppNOOF7yfYCesq/TUw/hcA20p/Uqa84JY0mn6e9Zhlb8Hz
         ZlmQFfmQX6LGRnkjxBCS7CVRau1Lshb2dpjK8XxIZXWBflRFiWtlqdEhd+t4lufSBWoB
         /dzs04QUkK41+nWSmux/Q9H7S9oswKGGVw5xY8dv1SI1nQ3QtooXGVTTjz1fObaRcKeW
         b1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193596; x=1754798396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ayWtPygJ2HBDiY24yxyRlwrUyqnG3sxcO8anqfHfeE=;
        b=hmc7b0RBCgjJcsHEdidjZ6xZr07nIKWD8tevnL5i5w0p4bnNivDGzBrPPtttyHkVzM
         wNcKIOqaZgGvPrWNLGkFLj3h5r/8GMZtxruE/U9KTioFLljVCYqvYitknzJvfZHT0kTf
         HU2FtsFzWvTdKRg3f/kbW3B6Xe/Gf1Fy27hDTAK+WC8p2iLuUw/EbcemrVr0nK9H77pt
         +fxIA9OZ7KOOeJtFDJmwicuoUGO2fmpiC2nt5FB2lAh7Yp6/XD0lxwyHDgSoZQzSc0mj
         lqaeE/+FkzPcgU+2bYCj3zDCmiEWJFkKAx69F/vAgU0J2HzfjFq4HQX1T4xRkNE+vpem
         GO6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXemXWN65IImuyDF7TahKY++zOdhVpWuM1R6eJgS3OsKyFjWKFmLlOy4AIomuCi95M8NyGEebJRRlJL3Sx9qBOl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/blJ0/q6DnUYMR/wlVCS37HvAfQmqEmR+zGP3J6CaoQSwSO58
	Xkrv4wahemUqGWxKiwtcvPbHxxmEtodAPR4TolM021Wqn2/O87nsDHM0
X-Gm-Gg: ASbGnctwRQZABGO4Zc8+rL5e32/a7/xXR0Mo1F+BOlWvfpnWqxKLfKIfPGK5ZOTF6UN
	/i/GfqRwmeSAvk6ruMajY+P90bmQ1TAQ7F0Hd1aB8mUGzTvKYRCPhSnDkK+dZ6lrA6nNigKd7qJ
	9I9FXlajQzSMcG3w7GyL+nl+J5CLG+HpSowDyGaCQt8mcd9eKYF9OKBSyUi5+ZHuSd1/vgaRM+7
	Rebk1U6JveDDM6AfveATRaHFDv7NLFR7hE6T+QIj0fBVXkJd0iGNpMIZwBdb5h+525aL75DUSNY
	9bIKujDWN4wnhpqgOfmLXTMjejiH22GmjPVCsvM0eWVJT41apYOPKi3tLZwu4fbsIAfGOPMn4yx
	1IoXX1InGil9sAyF3tPlbxbYUaLB8sZ2lQlq6S3Nd3bYkcP1zpwkeDDTl5pMF482Qt/MIys1Y0h
	QOGmc6lsfvNtic
X-Google-Smtp-Source: AGHT+IE//iz8Ix/2Qpq304M23ozJJJm9YUKRCP4zX/GxkzB5VUsrG11JTXPFJK78GVVmx4p1MZOr2A==
X-Received: by 2002:a05:6e02:3093:b0:3e4:6d6:b436 with SMTP id e9e14a558f8ab-3e41618be54mr108220825ab.12.1754193595853;
        Sat, 02 Aug 2025 20:59:55 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:55 -0700 (PDT)
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
	jim.cromie@gmail.com,
	kernel test robot <lkp@intel.com>,
	Min Ma <min.ma@amd.com>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v4 57/58] amdxdna: add -DDYNAMIC_DEBUG_MODULE to cflags - RFC
Date: Sat,  2 Aug 2025 21:58:15 -0600
Message-ID: <20250803035816.603405-58-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205956_577974_41E2774A 
X-CRM114-Status: GOOD (  13.17  )
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

with DRM_USE_DYNAMIC_DEBUG=y now un-BROKEN

for configs like:

  CONFIG_DRM_USE_DYNAMIC_DEBUG=y
  # CONFIG_DYNAMIC_DEBUG is not set
  CONFIG_DYNAMIC_DEBUG_CORE=y

this module gets macro breakage:

                 from ../drivers/accel/amdxdna/aie2_ctx.c:8:
../drivers/accel/amdxdna/aie2_ctx.c: In function ‘aie2_hwctx_restart’:
../include/drm/drm_print.h:578:9: error: implicit declaration of function ‘_dynamic_func_call_cls’ [-Wimplicit-function-declaration]
  578 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
      |         ^~~~~~~~~~~~~~~~~~~~~~
../include/drm/drm_print.h:663:9: note: in expansion of macro ‘drm_dev_dbg’
  663 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~
../include/drm/drm_print.h:681:33: note: in expansion of macro ‘drm_dbg_driver’
  681 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
      |                                 ^~~~~~~~~~~~~~
../drivers/accel/amdxdna/amdxdna_pci_drv.h:15:41: note: in expansion of macro ‘drm_dbg’
   15 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
      |                                         ^~~~~~~
../drivers/accel/amdxdna/aie2_ctx.c:76:17: note: in expansion of macro ‘XDNA_DBG’
   76 |                 XDNA_DBG(xdna, "hwctx is not ready, status %d", hwctx->status);
      |                 ^~~~~~~~

These sources include drm_print.h, which includes dynamic_debug.h and
then checks DRM_USE_DYNAMIC_DEBUG, to decide if drm_dbg() rides on
dynamic-debug underneath.

DRM_USE_DYNAMIC_DEBUG is possible with DYNAMIC_DEBUG_CORE alone, but
dynamic_debug.h also requires DYNAMIC_DEBUG_MODULE before defining
those macros above.

drm/Makefile adds this to cflags on behalf of all drivers, do so for
this driver.  TBC: do subdir-cflags in drivers/accel/Makefile instead,
for all accel/* modules.

RFC: Maybe decouple from DRM, at least the DRM_USE_DYNAMIC_DEBUG
itself (ie just CONFIG_DYNAMIC_DEBUG_CORE).  Its not obvious that
XDNA_DBG should be categorized with DRM_UT_DRIVER by default.

Do we need a new DRM_UT_ACCEL category ?

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508012015.2l89ZOLg-lkp@intel.com/
CC: Jason Baron <jbaron@akamai.com>
CC: Min Ma <min.ma@amd.com>
CC: Lizhi Hou <lizhi.hou@amd.com>
CC: Oded Gabbay <ogabbay@kernel.org>
CC: dri-devel@lists.freedesktop.org
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: David Airlie <airlied@gmail.com>
CC: Simona Vetter <simona@ffwll.ch>

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/accel/amdxdna/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
index 0e9adf6890a01..800f81f5a7023 100644
--- a/drivers/accel/amdxdna/Makefile
+++ b/drivers/accel/amdxdna/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+ccflags-$(CONFIG_DYNAMIC_DEBUG_CORE) += -DDYNAMIC_DEBUG_MODULE
+
 amdxdna-y := \
 	aie2_ctx.o \
 	aie2_error.o \
-- 
2.50.1


