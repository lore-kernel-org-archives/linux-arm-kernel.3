Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66A9D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8P0CFiKDyHYpNA2hwruS1Ng/YcTesu5+S1IYSukvEWU=; b=QzpIq4Mox33u1w2EAFiNfI/pc1
	1dlXwGT5I/p/K83FhFNnmIoW80N1rEbf7OJWyRIhePVrndySHZ4NeP/Jm9LfNJNp/C8/hOkyBgKiQ
	wnha8Yjmi7Gjc6fLtkEa+dIpSRRuOOZcOhvLbH03+71QQE56hZrlSIckTc44f0otts03Y7xdRIuY7
	uuOrPE/tBvaMkiO7Hvpga6mLUvbRkesQMNJdHkNhHLwodYoYC2WYBU4Gor7ulfofUlmkZ9yV3A9pA
	Nr2aUurDdOm1NqAUST9bFAj77uUvUzPDU+iwbmQf7C2Nh9zPlbZxkbQ0cMsiCIRo+5oCwy9y2usIM
	w7SEPUbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbHA-0000000DRFP-41G3;
	Mon, 22 Dec 2025 08:28:20 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbH8-0000000DREK-1v4E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:28:19 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso3694585b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766392098; x=1766996898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8P0CFiKDyHYpNA2hwruS1Ng/YcTesu5+S1IYSukvEWU=;
        b=NwbUUYCcp9/jyRlJXQZuIyTwQwecL6OdwWwrRqzFB4HYNl+e4Dil64PiDlUZlc/Qk8
         hELGEIgey/IHSvFgwx/VfyTEVsPE4pD/3erZnZtRxdc8E1w6eGOR3PR8TDrxdzRVoByA
         vKdyH/4J9cMwQEguWW9Z6HXzjKP8IEqFfrOq2K2050YJRVRvVZ0xpWeJuUaUEF9tRnqp
         Wa1KhAotik6ODGZtpTDcz6he/PnilL32tkXkZVNtbFpNG1jPfeIj1NxFbTSFgmqyj9ee
         K9W0H3CKyv/QbUcZpd0ZGh8dinKyDJShhMhw+nR5MQb9qIcILJhQwmoqdBjrnXKJBSei
         YDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392098; x=1766996898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8P0CFiKDyHYpNA2hwruS1Ng/YcTesu5+S1IYSukvEWU=;
        b=dewveu6nm0MM8639KONbzADpGWYrf6w3lyOZUA+43/10LPBGMMozqj7TPzgKX+yWIK
         cr/xAgd2fRfo0IGh5pj4KqCSmq3FI4W/bls4+M7UVGLelH5nqvG8pkyJSwkzb5BqT7ie
         1Z8zqVvJINvq3spc9vFlAvT3YW8gsx8zG1osDJ+nDjGt/hEckGaBIFXv5NVAmMdYJQHA
         2p9+ryPKejEBvQGXUsJR+rJQBL1f7NGr2orR1plPVsu71+30QCOUpbIkQszqfmAJnvxZ
         JCf5v/8ugMsHE+qeoMFQqO2o/Zu5ksjZ2QLw10qxK0vc9CnaBWXbMeCi1rRYqm0/RFa5
         yRsw==
X-Forwarded-Encrypted: i=1; AJvYcCXScruISXOZ/d/QJygdcW83aF5XkeLUUsyymo/3bazoIyCRjzSiEL73waR7xa/bKIEZRtJY+lbOfCSr5RaK8c7Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi8UWpXeJiYbc7B2g08aQAuYSJuGUoHBP8uH1DH7FGLvm6Arx6
	UdYnwyDWapaA+iLC22NZNqiZeuGKyFOlJXa1rGQpmt0TT645qkmKKQgd
X-Gm-Gg: AY/fxX5Q2o2oubi7eWB+Am6VccC5Rg2yODqsGjfe4wqlPNr1TQcm100YiGk3BTpoRdw
	nm3YcoA+eO+giH7QKsH0Hnqxy1QZnJcqC77AY5WgV9HTwzDv69PTJ6B/RcGpuaHdDj+59D04/ZV
	MAgdoLSx+t+3gBbtYS7t+ICmzk8xZIcoFLko0FVLBow8KoHObXY3+LbRUNQlSgeTKY85wSaTXuj
	BwG0XRnnjY8bkUXNh2jW/dlOQA0QCfC2a7+BKBgrJrVbPZpNcIMAsTvSxWnXRqpi/0Nnbd4ieI0
	ZjdsbMQ2+ea55HBvUuZBVGV9zZFQeCoY75b2udVpSMrnyW5ju75EBp/G2XrgfzW6eO3NiTe1f2j
	3/c1LPcUIFAHPeVIvn9iSKoBIQC8RKvUc1KyqkB1ZdXFEKkE/BETup6Ze+1qLZ1bmIUBNzecA8m
	T+P6u5bptN
X-Google-Smtp-Source: AGHT+IEq8X6Bf+OWPyqj+l6muxtsExzlcI9be65S5oPokexgEe5xk3Q6PIlmP0iqLo1vmkdJvgYYyA==
X-Received: by 2002:a05:6a00:a386:b0:7aa:17f0:f63c with SMTP id d2e1a72fcca58-7ff64eca463mr9195347b3a.29.1766392097555;
        Mon, 22 Dec 2025 00:28:17 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:28:17 -0800 (PST)
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
Subject: [PATCH v7 30/31] dyndbg: add DYNAMIC_DEBUG_CLASSMAP_USE_(dd_class_name, offset)
Date: Mon, 22 Dec 2025 21:20:47 +1300
Message-ID: <20251222082049.1782440-31-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002818_521959_4F7B682D 
X-CRM114-Status: GOOD (  19.58  )
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

Allow a module to use 2 classmaps together that would otherwise have a
class_id range conflict.

Suppose drm-driver does:

  DYNAMIC_DEBUG_CLASSMAP_USE(drm_debug_classes);
  DYNAMIC_DEBUG_CLASSMAP_USE(drm_accel_xfer_debug);

And (for some reason) drm-accel will not define their constants to
avoid DRM's 0..10 reservations (seems a long stretch).

So I dont think this potential conflict would become an issue until we
have at least a 3-X-3 of classmap-defns X classmap-users

So drop this if its too speculative, knowing theres at least a
notional solution should the situation arise.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 30 +++++++++++++++++++++++-------
 lib/dynamic_debug.c           | 19 ++++++++++++-------
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b22da40e2583..5307be8da5c1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -87,7 +87,7 @@ struct _ddebug_class_map {
 struct _ddebug_class_user {
 	char *mod_name;
 	struct _ddebug_class_map *map;
-	const int base;		/* user offset to re-number the used map */
+	const int offset;	/* offset from map->base */
 };
 
 /*
@@ -235,21 +235,37 @@ struct _ddebug_class_param {
 /**
  * DYNAMIC_DEBUG_CLASSMAP_USE - refer to a classmap, DEFINEd elsewhere.
  * @_var: name of the exported classmap var
- * @_not_yet: _base-like, but applies only to this USEr. (if needed)
  *
  * This tells dyndbg that the module has prdbgs with classids defined
  * in the named classmap.  This qualifies "class NAME" >controls on
- * the user module, and ignores unknown names.
+ * the user module, and ignores unknown names. This is a wrapper for
+ * DYNAMIC_DEBUG_CLASSMAP_USE_() with a base offset of 0.
  */
-#define DYNAMIC_DEBUG_CLASSMAP_USE(_var)				\
-	DYNAMIC_DEBUG_CLASSMAP_USE_(_var, 0, __UNIQUE_ID(_ddebug_class_user))
-#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _base, _uname)		\
+#define DYNAMIC_DEBUG_CLASSMAP_USE(_var) \
+	DYNAMIC_DEBUG_CLASSMAP_USE_(_var, 0)
+
+/**
+ * DYNAMIC_DEBUG_CLASSMAP_USE_ - refer to a classmap with a manual offset.
+ * @_var:   name of the exported classmap var to use.
+ * @_offset:  an integer offset to add to the class IDs of the used map.
+ *
+ * This is an extended version of DYNAMIC_DEBUG_CLASSMAP_USE(). It should
+ * only be used to resolve class ID conflicts when a module uses multiple
+ * classmaps that have overlapping ID ranges.
+ *
+ * The final class IDs for the used map will be calculated as:
+ * original_map_base + class_index + @_base.
+ */
+#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _offset)			\
+	__DYNAMIC_DEBUG_CLASSMAP_USE(_var, _offset, __UNIQUE_ID(_ddebug_class_user))
+
+#define __DYNAMIC_DEBUG_CLASSMAP_USE(_var, _offset, _uname)		\
 	extern struct _ddebug_class_map _var;				\
 	static struct _ddebug_class_user __aligned(8) __used		\
 	__section("__dyndbg_class_users") _uname = {			\
 		.mod_name = KBUILD_MODNAME,				\
 		.map = &(_var),						\
-		.base = _base						\
+		.offset = _offset						\
 	}
 
 /**
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index f60a723a441b..b0da3dd4ac44 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -198,7 +198,7 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 		if (idx >= 0) {
 			vpr_di_info(di, "class-ref: %s -> %s.%s ",
 				    cli->mod_name, cli->map->mod_name, query_class);
-			*class_id = idx + cli->map->base;
+			*class_id = idx + cli->map->base - cli->offset;
 			return cli->map;
 		}
 	}
@@ -206,12 +206,17 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 	return NULL;
 }
 
-static bool ddebug_class_in_range(const int class_id, const struct _ddebug_class_map *map)
+static bool ddebug_class_map_in_range(const int class_id, const struct _ddebug_class_map *map)
 {
 	return (class_id >= map->base &&
 		class_id < map->base + map->length);
 }
 
+static bool ddebug_class_user_in_range(const int class_id, const struct _ddebug_class_user *user)
+{
+	return ddebug_class_map_in_range(class_id - user->offset, user->map);
+}
+
 static struct _ddebug_class_map *
 ddebug_find_map_by_class_id(struct _ddebug_info *di, int class_id)
 {
@@ -220,11 +225,11 @@ ddebug_find_map_by_class_id(struct _ddebug_info *di, int class_id)
 	int i;
 
 	for_subvec(i, map, di, maps)
-		if (ddebug_class_in_range(class_id, map))
+		if (ddebug_class_map_in_range(class_id, map))
 			return map;
 
 	for_subvec(i, cli, di, users)
-		if (ddebug_class_in_range(class_id, cli->map))
+		if (ddebug_class_user_in_range(class_id, cli))
 			return cli->map;
 
 	return NULL;
@@ -1177,12 +1182,12 @@ static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp
 	int i;
 
 	for_subvec(i, map, di, maps)
-		if (ddebug_class_in_range(dp->class_id, map))
+		if (ddebug_class_map_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
 	for_subvec(i, cli, di, users)
-		if (ddebug_class_in_range(dp->class_id, cli->map))
-			return cli->map->class_names[dp->class_id - cli->map->base];
+		if (ddebug_class_user_in_range(dp->class_id, cli))
+			return cli->map->class_names[dp->class_id - cli->map->base - cli->offset];
 
 	return NULL;
 }
-- 
2.52.0


