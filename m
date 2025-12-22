Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E5BE6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ABMBtHazCQPbXZPvqunvxRiAtO4J7KVdTol8wYfw0Q=; b=ZHOA13IObWR3slTO9Z5UTE1g4w
	4/UGt8R0SQKK+Zp0u8GSzJHKp2cEZpRhEymzO8TlJq6sQUpbUF1+gXUE+Gg7exWv/p1sJt+l6jcfI
	kKJ2Jiheddpws90Np8DMnR6R6vq+iv30OKeNxPRnw3wkHkelsILczOaz1bqIrkP6rIpicfd2yXdnh
	V7huzyf9ofzwGEsr4STO7gKQARt2QxCiYjT/tKUu9TE7skRpfNvnBUhpedKaPaCTJykWuk9Gec4Qw
	69d3E+wfPLcyBLysRJ7VjtloBQ1e1T6kV2VebTjSkA7xpoom+Eay7fW5So70A2MLGxv9KWRpeDW9n
	itl6SFZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbHT-0000000DRKN-1Rq3;
	Mon, 22 Dec 2025 08:28:39 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbHQ-0000000DRJ8-0Wlz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:28:38 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-7f1243792f2so2538293b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766392115; x=1766996915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ABMBtHazCQPbXZPvqunvxRiAtO4J7KVdTol8wYfw0Q=;
        b=lxpJxE2tnlbvDb8gXPJuvvhJsBI4cT77XnUvud5U+Qfsm2juMtbzIV7fmQZIMkfZ5U
         l3KyPV3PE5amS+HmA+e8O/10c3z0DwvWa6syNwEau4dKfsO2BvX7TXT79IHpkDVTV3Wa
         sL7on7Mvi3MDTPzqgsai0VvPvq4TfS5P0cY9krgt3vyTslnqOMFMmZoDIyZk+rZ4xkVE
         yjba128E3gpJ+Vq2XWuhfTlJ8pcoQ2ztQ1r7g1Iihih/OozSR00h7S+vJDSRZocwWtJ3
         Frstw+o4NSBEvMD0sEgZ/4xYQRclmFaGl6J+/L/pMGyGP5jt30O69s8MsNwoXgOlLImn
         Slmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392115; x=1766996915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ABMBtHazCQPbXZPvqunvxRiAtO4J7KVdTol8wYfw0Q=;
        b=sm+0dXeA9xyUNXjtl9UrhcpDWaDiW5s0iy/GwpBCWpFmiiwAamNsyEjAfut9jAjCY3
         huip+qjXrXmz90x0jfl5ZWQhrlptuRAck0CNwMS7zxZMNREcpuu7JEz7zJ1xom8K6oyY
         pCgAgCBKYOhYKXCZLYx2RTmmo0jAj5LbQVnQDYqG3iPrg57qK+JqLPgvygvhhyl1dXYw
         uQs4PyYc7LXE/XKtvaDzEPbHOLm9Rfvcj0OXmgABldXcNeAIbt9Prw3spyIyeDXD1QeV
         LbYdK/M4w5FVpN/yCpU3m7TuSS8HElZUQ6r5GNwtCCkt/5+VEI0gcpZSn9QnNXUmFSDx
         nKWA==
X-Forwarded-Encrypted: i=1; AJvYcCXbAqTGMpu6K3LSu0hLOfQML1Bjr10VTlN0FKLW5UM5T8zNvv1tahzXpM569PUL35UjE/uGbf9V748rVGrn2dQ5@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr5x0vk0yS5t3IITRrCrqDAKiPCmmSDHZ6/rEgd+H2Is4BdzAA
	pn82Y3rcax74hbURiLoPEcaapSUnuARX/gz11fs8Z8lHNUoT2/eMSrT4tkTLsCJJoWgaDA==
X-Gm-Gg: AY/fxX5oMv+SFh/SA/s7IjZuuRMeERrIVaiBxIM24wT8GYnd8Vvb91suasaVcnic+cj
	/Y/C43ZL93zz12RdlDZCbihP8tkogEeRpIYnJTyAt2Hnvfy1AQbm/fPxgcsVcn73ZGLI/8ZXvEy
	+RE/uw9R/0zZbGVS1N50knTkigu1Vs/a0vG3A+qJVKmrWnseXiddwXASa77pqUhLaxJ/ZxL4fRO
	yggGmce+CefvyaH4nH7ru8PMoN3KgMmIf2vmQhRXej7Yr8K623CiaghkZENIQmnTmqRBSiV9/n8
	vBE9isNh0qPafPZ6U9pfc6TKwBtlJsm1pd/e3jl/vibIO+I5mkVsqUMXOiMz3C6BDZt780JMjaF
	PCgWwRTQN+7DboqmwQxtfovRN5RR/v1UPqv4ufOARbZfcSxADdJ3NVcdiFy3uF4fjjnzSeLQWuc
	Q+AymTh/yt
X-Google-Smtp-Source: AGHT+IEdf8lOhDtPYqKizeM1Dh4nWRJWzDSgY4CwDeK+ppE6vvK3k4DXx/lWFGZRYtXZSu5qWUHggg==
X-Received: by 2002:a05:6a00:1d98:b0:7aa:8397:7754 with SMTP id d2e1a72fcca58-7ff64ed1413mr8654654b3a.2.1766392115098;
        Mon, 22 Dec 2025 00:28:35 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:28:34 -0800 (PST)
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
	linux-doc@vger.kernel.org
Subject: [PATCH v7 31/31] docs/dyndbg: add classmap info to howto
Date: Mon, 22 Dec 2025 21:20:48 +1300
Message-ID: <20251222082049.1782440-32-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002836_179273_C05C27C9 
X-CRM114-Status: GOOD (  22.00  )
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

Describe the 3 API macros providing dynamic_debug's classmaps

DYNAMIC_DEBUG_CLASSMAP_DEFINE - create & export a classmap
DYNAMIC_DEBUG_CLASSMAP_USE    - refer to exported map
DYNAMIC_DEBUG_CLASSMAP_PARAM  - bind control param to the classmap
DYNAMIC_DEBUG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug

NB: The _DEFINE & _USE model makes the user dependent on the definer,
just like EXPORT_SYMBOL(__drm_debug) already does.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       | 135 ++++++++++++++++--
 1 file changed, 123 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 89ee15d7ae58..c85266ee8eed 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -146,6 +146,9 @@ keywords are::
   "1-30" is valid range but "1 - 30" is not.
 
 
+Keywords
+--------
+
 The meanings of each keyword are:
 
 func
@@ -194,16 +197,6 @@ format
 	format "nfsd: SETATTR"  // a neater way to match a format with whitespace
 	format 'nfsd: SETATTR'  // yet another way to match a format with whitespace
 
-class
-    The given class_name is validated against each module, which may
-    have declared a list of known class_names.  If the class_name is
-    found for a module, callsite & class matching and adjustment
-    proceeds.  Examples::
-
-	class DRM_UT_KMS	# a DRM.debug category
-	class JUNK		# silent non-match
-	// class TLD_*		# NOTICE: no wildcard in class names
-
 line
     The given line number or range of line numbers is compared
     against the line number of each ``pr_debug()`` callsite.  A single
@@ -218,6 +211,25 @@ line
 	line -1605          // the 1605 lines from line 1 to line 1605
 	line 1600-          // all lines from line 1600 to the end of the file
 
+class
+
+    The given class_name is validated against each module, which may
+    have declared a list of class_names it accepts.  If the class_name
+    accepted by a module, callsite & class matching and adjustment
+    proceeds.  Examples::
+
+	class DRM_UT_KMS	# a drm.debug category
+	class JUNK		# silent non-match
+	// class TLD_*		# NOTICE: no wildcard in class names
+
+.. note::
+
+    Unlike other keywords, classes are "name-to-change", not
+    "omitting-constraint-allows-change".  See Dynamic Debug Classmaps
+
+Flags
+-----
+
 The flags specification comprises a change operation followed
 by one or more flag characters.  The change operation is one
 of the characters::
@@ -238,11 +250,15 @@ The flags are::
   s    Include the source file name
   l    Include line number
 
+.. note::
+
+   * To query without changing	``+_`` or ``-_``.
+   * To clear all flags		``=_`` or ``-fslmpt``.
+
 For ``print_hex_dump_debug()`` and ``print_hex_dump_bytes()``, only
 the ``p`` flag has meaning, other flags are ignored.
 
-Note the regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
-To clear all flags at once, use ``=_`` or ``-fslmpt``.
+The regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
 
 
 Debug messages during Boot Process
@@ -394,3 +410,98 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
 For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
 its ``prefix_str`` argument, if it is constant string; or ``hexdump``
 in case ``prefix_str`` is built dynamically.
+
+.. _dyndbg-classmaps:
+
+Dynamic Debug Classmaps
+=======================
+
+The "class" keyword selects prdbgs based on author supplied,
+domain-oriented names.  This complements the nested-scope keywords:
+module, file, function, line.
+
+The main difference from the others: classes must be named to be
+changed.  This protects them from unintended overwrite::
+
+  # IOW this cannot undo any drm.debug settings
+  :#> ddcmd -p
+
+This protection is needed; /sys/module/drm/parameters/debug is ABI.
+drm.debug is authoritative when dyndbg is not used, dyndbg-under-DRM
+is an implementation detail, and must not behave erratically, just
+because another admin fed >control something unrelated.
+
+So each class must be enabled individually (no wildcards)::
+
+  :#> ddcmd class DRM_UT_CORE +p
+  :#> ddcmd class DRM_UT_KMS +p
+  # or more selectively
+  :#> ddcmd class DRM_UT_CORE module drm +p
+
+That makes direct >control wordy and annoying, but it is a secondary
+interface; it is not intended to replace the ABI, just slide in
+underneath and reimplement the guaranteed behavior.  So DRM would keep
+using the convenient way, and be able to trust it::
+
+  :#> echo 0x1ff > /sys/module/drm/parameters/debug
+
+That said, since the sysfs/kparam is the ABI, if the author omits the
+CLASSMAP_PARAM, theres no ABI to guard, and he probably wants a less
+pedantic >control interface.  In this case, protection is dropped.
+
+Dynamic Debug Classmap API
+==========================
+
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(clname,type,_base,classnames) - this maps
+classnames (a list of strings) onto class-ids consecutively, starting
+at _base.
+
+DYNAMIC_DEBUG_CLASSMAP_USE(clname) & _USE_(clname,_base) - modules
+call this to refer to the var _DEFINEd elsewhere (and exported).
+
+DYNAMIC_DEBUG_CLASSMAP_PARAM(clname) - creates the sysfs/kparam,
+maps/exposes bits 0..N as class-names.
+
+Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
+dyndbg to update those named classes.  "class FOO" queries are
+validated against the classes defined or used by the module, this
+finds the classid to alter; classes are not directly selectable by
+their classid.
+
+Classnames are global in scope, so subsystems (module-groups) should
+prepend a subsystem name; unqualified names like "CORE" are discouraged.
+
+NB: It is an inherent API limitation (due to class_id's int type) that
+the following are possible:
+
+  // these errors should be caught in review
+  __pr_debug_cls(0, "fake DRM_UT_CORE msg");  // this works
+  __pr_debug_cls(62, "un-known classid msg"); // this compiles, does nothing
+
+There are 2 types of classmaps:
+
+* DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like drm.debug
+* DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+
+DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it
+refers to a DEFINEd classmap, and associates it to the param's
+data-store.  This state is then applied to DEFINEr and USEr modules
+when they're modprobed.
+
+The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
+amongst the contained classnames; all classes are independent in the
+control parser itself.  There is no implied meaning in names like "V4"
+or "PL_ERROR" vs "PL_WARNING".
+
+Modules or subsystems (drm & drivers) can define multiple classmaps,
+as long as they (all the classmaps) share the limited 0..62
+per-module-group _class_id range, without overlap.
+
+If a module encounters a conflict between 2 classmaps it is _USEing or
+_DEFINEing, it can invoke the extended _USE_(name,_base) macro to
+de-conflict the respective ranges.
+
+``#define DEBUG`` will enable all pr_debugs in scope, including any
+class'd ones.  This won't be reflected in the PARAM readback value,
+but the class'd pr_debug callsites can be forced off by toggling the
+classmap-kparam all-on then all-off.
-- 
2.52.0


