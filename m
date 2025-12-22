Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF244E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UJ0Fy32CNz68gAtuvvvAIFbPIlI5INll01DQrP39TKA=; b=j2NAamCdfmeatS/SFeElGXPp9/
	1DPj1E4orc+i6bA7JCxMd+JKC3LHrrY6nsczrREn4X4Fg9yPrSpBaUj6dq3lMcxQcpBdrvXM7nEgH
	4/vl+gN+jQ9j9SoiHnKIwrQ/ddATcOLHnCGZWy/OwwlBB8CwElgxok9mnU8jEKeHJxJ/zXJDo1PSs
	K1a/YzrxeyDQbiL8XKg4axouD9ZHwp0LRhM39uewgn3FEILqXwdCHVtqlRJm8D5ySCBjrafdNQ3nu
	7ys7SFOphZieAfDcR0qN1zlXxOzFAQu3RzXc/9B3vAnOvbdM6VMcaPlMutbmHQCPrCwYkrBuIRhsa
	KD8Wpp9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbI6-0000000DRau-0kMO;
	Mon, 22 Dec 2025 08:29:18 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbI2-0000000DRZ8-2G7u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:29:15 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-7baf61be569so4011550b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766392154; x=1766996954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJ0Fy32CNz68gAtuvvvAIFbPIlI5INll01DQrP39TKA=;
        b=NAeBOTaKIeKi9Q+G3GERJtx1skzrP1rI/RmLJpb2DmmfBm+4HELncV9N9IrTqRFVev
         md9s+AFtvxAqT85KG8nLpJrpHmH2Tm6fUgnlsHrP6EfMOBtlmDgXwCmMSemT1ILe6xgV
         xTopQXa2LF5z4djwacIJY+eb60HD3kvXiGxh8zEWJ9t8jHXJkgB8Bk0B868MmQiN+QXw
         kOdVSVUYMed67iQNrPLpR8YhIfyuAuweoYhee7eTRcnC7/TpGC14UH49WtgMs3Oo0TNS
         F1TCMJDMq9DZjQD2lcub6U5jFCgS9++Of9B3Lo9k9Bfc3Py3DMrr7QCxfkKFBxivOW8b
         pYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392154; x=1766996954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJ0Fy32CNz68gAtuvvvAIFbPIlI5INll01DQrP39TKA=;
        b=DpbH3UA+KqYKxTEhjs2P68w+gmOReDaTRgBXd7e86cTUidafxwWkOxqJfdB1peiBr4
         rhAWn9ldH1KOaONQQqZcltEml+ioLbQ7Zi3G2iB641Vk0gJ6U4qXCHci1o9O9nRoiACg
         j2KMPYMgOGuflVGmbRiiJndxj2vas42B9RSE6P3QoM0jyrg3RHHGjN9qDu97dl8f1tBh
         PTtHyrC0qT+TuVIxEu1bT/54psSlR+qsApgELF1yKMNBlIZzSxSgilkc06KbR0UYJFHy
         sd+3tN5TMz/exr4bok1qku8r2r6N901YAzJ7VVx8HBAxLbHKlGjjLy0LaeFM6a3CoBZg
         JznQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwtVdbxuurpTYDElvY9y0UhvLCi6SG2G0Lwq2XAvcoRMQXAn5Ueh6cDThCLfAgx61FeBxruKQmamMfsRpSV1L2@lists.infradead.org
X-Gm-Message-State: AOJu0YwmObvHGcVWPvAl4d1kMb5kRxY3IxY0JA1sng18JEbMBZs3UaWs
	PHXxRON7VLZA5WC9Ph/SSeOMbHjswD5Lcejtwo5TK0+vO4VeDO6FVwuI
X-Gm-Gg: AY/fxX6OT+PxI1DJmAvDCnxbHA/lGd5g8fmvNfI1eB5Atbb/k7p7NMTPdq6q2fSTtnC
	PkxHcUW+LdTjXsVnwXC7XMv8H5EHBO71lKwDjZpCNCy1T/9MSzxboMyNxr2IykaYnTulvcLvuxt
	xofRRhgVRD8buRnFNWal5k4dWONTRfFAYNW1eXojINCN3dCfc5Fmm+aCyMamFIKADpiK4hwaMqs
	3zhXbOfTiUczLDVxqwmt3Z1RNdDJqCcyWd00jTHfsV2QBDzaMFH4ODgSx0pG3nXZbjNpMTIMiwo
	whgIL50yqDgMXTwlUJEhqq5VJ8xPo7rfHlSPJRVSvdjo/PpihboY9lNyhc/cMkoIplVYcxuV9II
	pKSZe8zHquovYnPjSRo8Ax40e7ysAAD98rvg+7/PwC3xRiIOOBw6fgLAgkqnjSH4IiyuvUU553r
	FCxhF6QzsK
X-Google-Smtp-Source: AGHT+IH91xYoqgoO/9cTyIkcwq8ylRSPWssYXk7Ak1UGNvKWMh8b4fE0tkVyhdkLY2d/CPzf+gHPIA==
X-Received: by 2002:a05:6a00:1f17:b0:7f1:fad7:2ce with SMTP id d2e1a72fcca58-7ff679669d1mr11073286b3a.48.1766392153873;
        Mon, 22 Dec 2025 00:29:13 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7af29dcfsm9640064b3a.17.2025.12.22.00.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:29:13 -0800 (PST)
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
Subject: [PATCH v7 00/31] drm/dyndbg: Fix dynamic debug classmap regression
Date: Mon, 22 Dec 2025 21:28:12 +1300
Message-ID: <20251222082843.1816701-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002914_595189_C4AD8D06 
X-CRM114-Status: GOOD (  14.07  )
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

hello all,

commit aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")

added dyndbg's "classmaps" feature, which brought dyndbg's 0-off-cost
debug to DRM.  Dyndbg wired to /sys/module/drm/parameters/debug,
mapped its bits to classes named "DRM_UT_*", and effected the callsite
enablements only on updates to the sys-node (and underlying >control).

Sadly, it hit a CI failure, resulting in:
commit bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")

The regression was that drivers, when modprobed, did not get the
drm.debug=0xff turn-on action, because that had already been done for
drm.ko itself.

The core design bug is in the DECLARE_DYNDBG_CLASSMAP macro.  Its use
in both drm.ko (ie core) and all drivers.ko meant that they couldn't
fundamentally distinguish their respective roles.  They each
"re-defined" the classmap separately, breaking K&R-101.

My ad-hoc test scripting helped to hide the error from me, by 1st
testing various combos of boot-time module.dyndbg=... and
drm.debug=... configurations, and then inadvertently relying upon
those initializations.

This series addresses both failings:

It replaces DECLARE_DYNDBG_CLASSMAP with

- `DYNAMIC_DEBUG_CLASSMAP_DEFINE`: Used by core modules (e.g.,
  `drm.ko`) to define their classmaps.  Based upon DECLARE, it exports
  the classmap so USE can use it.

- `DYNAMIC_DEBUG_CLASSMAP_USE`: this lets other "subsystem" users
  create a linkage to the classmap defined elsewhere (ie drm.ko).
  These users can then find their "parent" and apply its settings.

It adds a selftest script, and a 2nd "sub-module" to recapitulate
DRM's multi-module "subsystem" use-case, including the specific
failure scenario.

It also adds minor parsing enhancements, allowing easier construction
of multi-part debug configurations.  These enhancements are used to
test classmaps in particular, but are not otherwize required.

v7 adds:
. WARN_ONCE when classmap isnt found for a class'd callsite, JBaron
. reorder macro args to match kdoc, JBaron
. Doc formatting fixes, by Bagas

Thank you for your review.

P.S. Id also like to "tease" some other work:

1. patchset to send pr_debugs to tracefs on +T flag

   allows 63 "private" tracebufs, 1 "common" one (at 0)
   "drm.debug_2trace=0x1ff" is possible
   from Lukas Bartoski

2. patchset to save 40% of DATA_DATA footprint

   move (modname,filename,function) to struct _ddebug_site
   save their descriptor intervals to 3 maple-trees
   3 accessors fetch on descriptor, from trees
   move __dyndbg_sites __section to INIT_DATA

3. patchset to cache dynamic-prefixes
   should hide 2.s cost increase.


Jim Cromie (31):

fixes, cleanups, simple stuff::

Jim Cromie (31):
  dyndbg: factor ddebug_match_desc out from ddebug_change
  dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
  docs/dyndbg: update examples \012 to \n
  docs/dyndbg: explain flags parse 1st
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: tweak pr_fmt to avoid expansion conflicts
  dyndbg: reduce verbose/debug clutter

callchain grooming, re-structs, code simplify/dedup by macros::

  dyndbg: refactor param_set_dyndbg_classes and below
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: replace classmap list with a vector
  dyndbg: macrofy a 2-index for-loop pattern
  dyndbg,module: make proper substructs in _ddebug_info
  dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
  dyndbg: move mod_name down from struct ddebug_table to _ddebug_info
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  selftests-dyndbg: add a dynamic_debug run_tests target
  dyndbg: change __dynamic_func_call_cls* macros into expressions

core fix, detect api misuse errors, etc::

  dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
  dyndbg: detect class_id reservation conflicts
  dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
  dyndbg-test: change do_prints testpoint to accept a loopct
  dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
  dyndbg: treat comma as a token separator
  dyndbg: split multi-query strings with %
  selftests-dyndbg: add test_mod_submod
  dyndbg: resolve "protection" of class'd pr_debug
  dyndbg: add DYNAMIC_DEBUG_CLASSMAP_USE_(dd_class_name, offset)
  docs/dyndbg: add classmap info to howto

 .../admin-guide/dynamic-debug-howto.rst       | 187 ++++-
 MAINTAINERS                                   |   3 +-
 include/asm-generic/vmlinux.lds.h             |   5 +-
 include/linux/dynamic_debug.h                 | 302 +++++--
 kernel/module/main.c                          |  15 +-
 lib/Kconfig.debug                             |  24 +-
 lib/Makefile                                  |   5 +
 lib/dynamic_debug.c                           | 776 +++++++++++-------
 lib/test_dynamic_debug.c                      | 198 +++--
 lib/test_dynamic_debug_submod.c               |  21 +
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   7 +
 .../dynamic_debug/dyndbg_selftest.sh          | 373 +++++++++
 14 files changed, 1465 insertions(+), 461 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.52.0


