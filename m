Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7BCE6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJ6LQIhz3opDVp8qv4sJ5LmxJU4UfSK37U6o6GR2gQA=; b=XYXGfzijk6wtfyAELq518e5UyH
	hwcnQ4543H7AcEZaq/8dyw+6vmbiDpRFydG0EfDN8P4N04N++TKnMcu3NIffaZH67vhYJsooTzqZQ
	0C3fnST0OGz4ICl6RVca91dviCF4jQypaJEQml+5nYkziI2LFs9wdNwKd5U7kRz8iFOZxAfp75iAp
	O/3fpLtflto9wV1Qu+MQ2bCSfnt+7nYOZxSZvR5hlTA0g/cXKxtXLdpufy64OFcob98Y65XKSTlzC
	ZZX5MSjjj+Iz9SYvMqyIlhvowFvQZ7qay2kNkWrCH4OxIl4zv0WPolQeGXIYzYBDooYbVKfMGaMIT
	u2nBF3eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbEX-0000000DQTa-4BfM;
	Mon, 22 Dec 2025 08:25:39 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbEP-0000000DQQV-3WzQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:25:31 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-7baf61be569so4008105b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391929; x=1766996729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJ6LQIhz3opDVp8qv4sJ5LmxJU4UfSK37U6o6GR2gQA=;
        b=dN/qXCy+zuNDXJ0zxFYRGoWxDlBy8VPYMPEqPOKaQGwT6Pi7TcI5zHRAlbfuQECKqG
         K95YwxbszO4IcCt9ZE+8Emua3pEAVcYqU2MTobSaSvkfwqq1PkurfOoprZIZgtCRy9B1
         K/Zv32OGS8cPxvkcQSlm5pp8HpMEN4CUxqlCXCW0Pujk+cmty3z4DkUyyFFm9VbEzkyY
         YkCeET4kcxaALp2br59+fezQxUoQJZapL4e4KJY0BYKXRMCoNWktzp91SNGG/LpKMnMb
         9rKfQ/hR905d2Fj1mLSstvgidEBiC+B3Cou3s4UK3Fz/F/WgRfZuIIU33RUz9Q1fdsI8
         kGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391929; x=1766996729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wJ6LQIhz3opDVp8qv4sJ5LmxJU4UfSK37U6o6GR2gQA=;
        b=MvxAv9tx/5LJE5V73P0VK8cZd+LJZhP7HKzIGhltbYkqdEl7IcXz313MiTWSFveXFC
         KUQGR950zKFIXwPYxBv1b4IZF2+mwFBq/wZtl/NJ3Q2KarCUCFpwBQ4g7CBkf0Afyw3/
         py9GpfVFNlrY1/M6QWzhnGtVRtWnpLQFDMF5YFSNnXjeJVaDH7pcxGes+sSDBVTNFfes
         1vwiNT352/2YPStyl+zhKKoznpwVJiX1bTUMtREmO5CkVMzja9rAbs9lB2IqqGNbI7q3
         ahSF2khJJVGixa3dS64Aj+EhhZT5IWsu0TmdrsHBTtfWS1D8bOOJHGvVHpFLsDXzfCQi
         TQhA==
X-Forwarded-Encrypted: i=1; AJvYcCUBnqd/WnwvlG8ficZE9hwjEq1285Uuf6W+010LBzrDqQOHIozAhemh5lx2KqKccEw/htU5cfGDnXTaxVW0IHd3@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv+9UKonPaeTIK5vhczKC3nECfkVBasGLNmcasKMerHP8ZvC7Z
	0tp8V18vST1bHe/ErZa7jf6vcWmPYyYQXQh081+5KiWpY7doYdj+kWzO
X-Gm-Gg: AY/fxX64LG0Q/NnB3NQ+mzvn7zOiRQFfhBv6GBKYSGjUQNYvqYOpP7eD2WujAvPYNgO
	bQFeaygwFdxYKTe6edJ19E4izV1Os5XQVjurRwu4T7COmJSoZ/+Y1x3jRBf+JBOReUlnM/HjphQ
	ryeeaE5MIbBrPwdlSNH4g+1TqMWrvy07skZag07XmYns+6WenCUnDQSY8S28ejZr5IDNgs5O2H/
	Rdr/5jn/hp0di4KYk9MrFx2CQyXkjiinA3F/aNwK7mv8G0ODtaW7EkR15+SlKkVfdULAWKlK+eq
	m9CuVB8KfcRhbnqz+lSUpQiEbMWQBcPiznj6zE03gzGeBlJBJM2OYfdfLEL+PuW/OFJXgkpVWMA
	/FlBunys/6Gv8Lqxy6zXegh1pQiU8flPB1Etkhqtw3ERkqsm2peHNtABpIaVN8ilgAll6Ci/nY5
	sfNlI3b7ZX
X-Google-Smtp-Source: AGHT+IE+QxCurRN0AzDICu9k2MWk1SPp1amxCYIl0Rf045fB7y1IHjsIYvGaV+1OKSxAVQgufeDctw==
X-Received: by 2002:a05:6a00:4190:b0:7e8:4471:ae5d with SMTP id d2e1a72fcca58-7ff67456c6emr7951795b3a.41.1766391929081;
        Mon, 22 Dec 2025 00:25:29 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:25:28 -0800 (PST)
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
Subject: [PATCH v7 23/31] dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
Date: Mon, 22 Dec 2025 21:20:40 +1300
Message-ID: <20251222082049.1782440-24-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002530_126954_CDAAD406 
X-CRM114-Status: GOOD (  15.03  )
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

Add __DYNAMIC_DEBUG_CLASSMAP_CHECK to implement the following
arg-checks at compile-time:

	0 <= _base < 63
	class_names is not empty
	class_names[0] is a string
	(class_names.length + _base) < 63

These compile-time checks will prevent several simple misuses, and
will issue obvious errors if violated.

4 such examples are added to test_dynamic_debug_submod.ko, and will
fail compilation if -DDD_MACRO_ARGCHECK is added to cflags.  This
wouldn't be a useful CONFIG_ item, since it breaks the build.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  9 +++++++++
 lib/test_dynamic_debug.c      | 13 ++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 905db0b49104..b19c9b1d53b6 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -180,6 +180,14 @@ struct _ddebug_class_param {
  * __pr_debug_cls(22, "no such class"); compiles but is not reachable
  */
 
+#define __DYNAMIC_DEBUG_CLASSMAP_CHECK(_clnames, _base)			\
+	static_assert(((_base) >= 0 && (_base) < _DPRINTK_CLASS_DFLT),	\
+		      "_base must be in 0..62");			\
+	static_assert(ARRAY_SIZE(_clnames) > 0,				\
+		      "classnames array size must be > 0");		\
+	static_assert((ARRAY_SIZE(_clnames) + (_base)) < _DPRINTK_CLASS_DFLT, \
+		      "_base + classnames.length exceeds range")
+
 /**
  * DYNAMIC_DEBUG_CLASSMAP_DEFINE - define debug classes used by a module.
  * @_var:   name of the classmap, exported for other modules coordinated use.
@@ -193,6 +201,7 @@ struct _ddebug_class_param {
  */
 #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	__DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));	\
 	extern struct _ddebug_class_map _var;				\
 	struct _ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_class_maps") _var = {		\
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 1ba4be9a403a..b2bdfdfb6ba1 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -133,7 +133,7 @@ DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
  * Enable with -Dflag on compile to test overlapping class-id range
  * detection.  This should warn on modprobes.
  */
-DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 #endif
 
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
@@ -146,8 +146,19 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
 DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
 
+#if defined(DD_MACRO_ARGCHECK)
+/*
+ * Exersize compile-time arg-checks in DYNAMIC_DEBUG_CLASSMAP_DEFINE.
+ * These will break compilation.
+ */
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_neg, 0, -1, "NEGATIVE_BASE_ARG");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_emptyclass, 0, 0 /* ,empty */);
 #endif
 
+#endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
+
 /* stand-in for all pr_debug etc */
 #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
 
-- 
2.52.0


