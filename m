Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE36C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DMLk2rTO/k/ZvCq5mpXv9xnm8IkxOQH6hbAYPKMfY2Y=; b=o0wYdbDTU7WBIiRHhr0f7E8VKJ
	6qp9vT8f9tzJKs8/eFlvUnCCo0EYXpG929tPt3iavtgJEa6zt4MGWdgSSPU7lCbZuDnJ/AHiiI7mQ
	8U0zEdTUqRh9KxZE8W1N4S9McPvRc3FZOlTysJWSKycake1gZdRuKpKtRZVlkLQgQ6epHRXaAMaFU
	7exa1hQAbX0B8++OqVGKEFIvJa00hkRVrSS4RKJUBvsXQ2pWQarM+YRaSa19FXF+UnAm6oOV+4m1s
	U45w80eYm0R7gFzcSmttB1Q3VisRuEbYkvPy8Yj4synmoxH2fAzI6tUoDJKpy0cVNlHWFg962oic1
	h5Y1BE7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPuI-000000089CG-2452;
	Sun, 03 Aug 2025 04:01:10 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPrf-000000087rM-37lb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:58:29 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3e406ca2d22so10974465ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193506; x=1754798306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMLk2rTO/k/ZvCq5mpXv9xnm8IkxOQH6hbAYPKMfY2Y=;
        b=IbRfrTC/aJVIfSkgSRBQSJH7PlWlawILYMM7JCpS3STFcOG/VDr4n7SQzFc9hrFZtn
         9glc40fkqOzppjzqYlxTmh6D+GeciA1LGzIWwknSHVaWNA5eqU3SGPnjUUPiYyck/yeB
         r6ChI0bXGvTFFb4f4wA15Zi1v+OInKQlrYDyqEAxu3hU4b7MjenmtYFg+U9wekGDMRrZ
         Kl38B8dqm6u+j8uFGV1Wy543UzF0bsOwrL72v9fwVDTK3QwFbxB9oVo529Gk0Birrn7T
         4UYL2+7Rg9weIzQscQZQGfKOplfXqUltg05aQcd+MTa2K652v+9JzhlK6IweYCz9gmf0
         Y+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193506; x=1754798306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMLk2rTO/k/ZvCq5mpXv9xnm8IkxOQH6hbAYPKMfY2Y=;
        b=FgFOrieU1KjOxrEFSsT9+L52eAMwu37cvLsQHjZaJ8vPWn6NtFjIIhPhNHd+qSS+rH
         3Zckst4eMmVS2o5EwvcOOd/xcaxHWzqb5F7y0ZkaVYUH1OGgGiC0vVtW29IcSMk42fqG
         QCeZy32UU2SXV4MLrrtQlsYV5OvvfQuEP9cdpu85V/h32NCdlCdq4c2r2Iju0EQ6agOr
         tTBDe6kzhC+GxbXPYByrKx5Ez+dW4MhrNCYRN2WCxshRRH+r+tkGz5B3IFoa4YpRlRIt
         9/im2ODAS9QTVMULSHPvC8QSGJ/QXFNaMB9UrqONnxM5PiG5sufVLZtbPqC+GXVH5BIH
         xDrg==
X-Forwarded-Encrypted: i=1; AJvYcCUNUCHjmgNivlpa8N5bnI+IfDRVmGpFQ0SsNNsgAhaqTKNl54zB/YL6jKJHcQvan6PJPFc5tjwIL7XE4ykQztYZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+cdDITjZNmMQCw7+jG3yVFWbCugdQ63JBvH8drPIfid37K6EZ
	Ygndzi2cB0dwPWaoThe0fsmSG5tDHNKWVD3MW7Yx0bfOHnEA00H4xebT
X-Gm-Gg: ASbGnctcumGyK0UKFeDQcsY84DVUOtFRveLqaW9iSjzXoBlIm0NEeP9vhrpCOYhrqNy
	w7QLdm6ludGyo0MDTh06x72Sng58wkVpJGZmCZ+2NORdDvxMn9NfZtsSKNaI1p+sOrYBfJkusPo
	LnVFfq9/iqVMA6/Xn9TRT5KuKmY2KkLBxwzMDVRR/vipZ0XFY07PZkrCI9/B5zB7zVDuDq2XnsY
	WmtU/+K2vQrwgFcEvwlEh6l7VifjKbNSH/jEIaMTEKIeQtkeG+bX8BwglbCNUwd0lb9VJOnQcZC
	tBoKZfiRzARwnwCi+MEIq7KIDTj1b+zrGqx6aox/p3/7hKmLNVhTXLqu4EOlnUWCz31AgIWuabz
	reWY8EPxJ0w+ilo0WnamhUrCPGqyDQ9d4v+fyuh8zFEmTlTcZpjuMFqIebWIFbMUJ313gg5dOWU
	ieIpCMhfAbabTi
X-Google-Smtp-Source: AGHT+IFDXWcxeK0ansnvS8D6N8J4pmENlNHFL9Jokjsm9G5CrdL7bnhQGMlEMGxcgihYNzJFEiflTg==
X-Received: by 2002:a92:c26c:0:b0:3e3:e78e:4dfd with SMTP id e9e14a558f8ab-3e41610ba62mr93262065ab.4.1754193506340;
        Sat, 02 Aug 2025 20:58:26 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:25 -0700 (PDT)
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
Subject: [PATCH v4 00/58] fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
Date: Sat,  2 Aug 2025 21:57:18 -0600
Message-ID: <20250803035816.603405-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205827_792794_A52C7C75 
X-CRM114-Status: GOOD (  14.13  )
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


This series fixes dynamic-debug's support for DRM debug-categories.
Classmaps-v1 evaded full review, and got committed in 2 chunks:

  b7b4eebdba7b..6ea3bf466ac6    # core dyndbg changes
  0406faf25fb1..ee7d633f2dfb    # drm adoption

Then DRM-CI found a regression when booting with drm.debug=<initval>;
the callsites' static-keys under the drm-dbgs in drm.ko got enabled,
but those in drivers & helpers did not, since they weren't yet
modprobed, and didn't yet exist.

The fix is to retire DECLARE_DYNAMIC_DEBUG_CLASSMAP, and distinguish
DYNAMIC_DEBUG_CLASSMAP_USEs from _DEFINEs, then adjust the drivers to
_USE the CLASSMAP _DEFINEd by core drm.ko.  The _DEFINE exports the
classmap, the _USE refs it, adding a linkage dependency, just like
__drm_debug already does.

rev3 is here:
https://lore.kernel.org/lkml/20250402174156.1246171-1-jim.cromie@gmail.com/

changes since are minor:
 .rework several cleanup patches forward
 .code/doc/commit-msg tweaks for Louis Chauvet feedback.
 .refactor dyndbg dynamic-prefix to split TID from cacheable prefix
 .cflags for drivers/accel borrowing DRM.debug

Jim Cromie (58):
  docs/dyndbg: update examples \012 to \n
  docs/dyndbg: explain flags parse 1st
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: tweak pr_fmt to avoid expansion conflicts
  dyndbg: reduce verbose/debug clutter
  dyndbg: refactor param_set_dyndbg_classes and below
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: replace classmap list with a vector
  dyndbg: macrofy a 2-index for-loop pattern
  dyndbg,module: make proper substructs in _ddebug_info
  dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
  dyndbg: ddebug_table.mod_name down to _ddebug_info
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  selftests-dyndbg: add a dynamic_debug run_tests target
  dyndbg: change __dynamic_func_call_cls* macros into expressions
  dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
  dyndbg: detect class_id reservation conflicts
  dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
  dyndbg-test: change do_prints testpoint to accept a loopct
  dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
  dyndbg: treat comma as a token separator
  dyndbg: split multi-query strings with %
  selftests-dyndbg: add test_mod_submod
  dyndbg: drop "protection" of class'd pr_debugs from legacy queries
  dyndbg: restore classmap protection when theres a controlling_param
  docs/dyndbg: add classmap info to howto
  dyndbg: reserve flag-bit _DPRINTK_FLAGS_PREFIX_CACHED
  dyndbg: add _DPRINTK_FLAGS_INCL_LOOKUP for +mfsl flags
  dyndbg: refactor *dynamic_emit_prefix to split lookups
  drm: use correct ccflags-y spelling
  drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
  drm-dyndbg: adapt DRM to invoke DYNAMIC_DEBUG_CLASSMAP_PARAM
  drm-print: fix config-dependent unused variable
  drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
  drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
  drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
  drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
  drm-dyndbg: DRM_CLASSMAP_USE in nouveau
  drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
  drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
  drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
  drm-dyndbg: add DRM_CLASSMAP_USE to bochs
  drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
  drm-dyndbg: add DRM_CLASSMAP_USE to gma500 driver
  drm-dyndbg: add DRM_CLASSMAP_USE to radeon
  drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
  drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
  drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
  drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
  drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
  drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
  drm-dyndbg: add DRM_CLASSMAP_USE to the drm_gem_shmem_helper driver
  drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
  amdxdna: add -DDYNAMIC_DEBUG_MODULE to cflags - RFC
  accel: add -DDYNAMIC_DEBUG_MODULE to subdir-cflags - RFC

 .../admin-guide/dynamic-debug-howto.rst       | 187 ++++-
 MAINTAINERS                                   |   3 +-
 drivers/accel/Makefile                        |   2 +
 drivers/accel/amdxdna/Makefile                |   2 +
 drivers/gpu/drm/Kconfig.debug                 |   1 -
 drivers/gpu/drm/Makefile                      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +-
 drivers/gpu/drm/display/drm_dp_helper.c       |  12 +-
 drivers/gpu/drm/drm_crtc_helper.c             |  12 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   1 +
 drivers/gpu/drm/drm_print.c                   |  38 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |   2 +
 drivers/gpu/drm/gma500/psb_drv.c              |   2 +
 drivers/gpu/drm/gud/gud_drv.c                 |   2 +
 drivers/gpu/drm/i915/i915_params.c            |  12 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         |   2 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  12 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   2 +
 drivers/gpu/drm/radeon/radeon_drv.c           |   2 +
 drivers/gpu/drm/sysfb/simpledrm.c             |   2 +
 drivers/gpu/drm/tiny/bochs.c                  |   2 +
 drivers/gpu/drm/udl/udl_main.c                |   2 +
 drivers/gpu/drm/virtio/virtgpu_drv.c          |   2 +
 drivers/gpu/drm/vkms/vkms_drv.c               |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   2 +
 drivers/gpu/drm/xe/xe_drm_client.c            |   2 +
 include/asm-generic/vmlinux.lds.h             |   5 +-
 include/drm/drm_print.h                       |  12 +
 include/linux/dynamic_debug.h                 | 254 +++++--
 kernel/module/main.c                          |  15 +-
 lib/Kconfig.debug                             |  24 +-
 lib/Makefile                                  |   5 +
 lib/dynamic_debug.c                           | 679 +++++++++++-------
 lib/test_dynamic_debug.c                      | 203 ++++--
 lib/test_dynamic_debug_submod.c               |  21 +
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   7 +
 .../dynamic_debug/dyndbg_selftest.sh          | 373 ++++++++++
 39 files changed, 1423 insertions(+), 508 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.50.1


