Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72475C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXquqH7KII4sF+LJ1AfrwTmzreYTzxHzyyy3sHAB95g=; b=xrBmJAF26lrXuQow+DLK5QRKjY
	pwmnU4NhQQAuDbqvJwBHjHhhQNzm7kixel4/RyYAC8z2w0U+YVgxbBP+MZngEwnSMayU4y13n0e+M
	vV78VdL8GT4EhMSqxJ7KL90mNylM+Krh1Qwu27onxEwMR9tAbLnvqxYzUFjVkMiGkBbguJnFMmLp2
	ya3k5kxVUwVW2hpSlSwDXUyz3mZe/J5DuhjDnwoq8WCcCBtb/ytEvUE6ugeTqHCboog46rqcwURiz
	0t/qqQYq6P2SSSKWvbJmqoKremOqz0I0rQMMplvtb+Zis5+nCux0pqfBUCRycYV2Tpe01GirFuhxQ
	Ef5xlSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiR4P-00000008M2Q-0pFE;
	Sun, 03 Aug 2025 05:15:41 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsS-000000088OV-32af
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:17 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-8811ab2b559so242683839f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193556; x=1754798356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXquqH7KII4sF+LJ1AfrwTmzreYTzxHzyyy3sHAB95g=;
        b=Uc8LZFl4nwsuqQUmdPLD1LLSTpcm0yeRgu0p3nxQ0Xhk9p9tgjxcGF4nbzAqvgPwAY
         19xhJQ9vsyGenoLj/U2HBLhygfRydO9Y9EcmdiFbPh1EKMIdiX1CTCt1Dc9EUB/y4rvn
         6Z+jVSNMuKXvUUfphrqCPD25NYYn1KS8Ok1uQcFAqkYnjlse1M8fVmGPw6hjTlNtR0Q2
         +T4IroQUIq0z2m5E4m3FLO5Zw6ZmCnoC+9/4Rm1tiWD0V+Y8yt2ftzSEB/jwn5HaquFi
         H+ZGHncBo4G2GlUUVRqzD7t3ixykeuAOBa6MOLKo7HwkBxw46SYwuraaIa3+5RKVqLE9
         QWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193556; x=1754798356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXquqH7KII4sF+LJ1AfrwTmzreYTzxHzyyy3sHAB95g=;
        b=QXxCeg7FwQvCmJQQZreU/ApoVaj2R8GAX1znyrBFvk7+hI626c1D7LhYrJabosHdh9
         fGxCYxe3qYZeXbfEg215GOrOJxw98DACSwziE11p+lImQWbAQF0Kpany6YHEECCtYlY4
         VvXuCDlmCqbx2Kb7Z5NCowWy9yt/2aDLo1wj8R+A5iN6J2RvAF5RttIWFqPVIK6EgbCN
         u24021VMv57NhhIpW38gCfIYfoBjc0gHxYQ0jTalrOb9WN/MrN3YuSs/o9N+TSRn23r0
         exvhi+gdrZzegUQHDcz8arm75UNWEFO3F2uUwSW+lonsHt+j5JZL09OCaN63e4lnW+Pp
         5Mxg==
X-Forwarded-Encrypted: i=1; AJvYcCWyqoNRSwXHjfoFm4r4HCoq59jB5GPXSVVEDhf38OEZp0BNpmpF31FJdscxZVgok581Ui2oerY9m3bydu8gabWQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4InFj08dJYlw2uCoTV9CpgJpPJ6opNtCb1JFrs+MAyJYzan1F
	VZQOfJ6uVWbLDIJyvbn2QtGTpSxv1CcLBYgCSlusxx8V5EtA5dGPOnDJ
X-Gm-Gg: ASbGncuLscKHfXpn6ORgCk9GvFlYrAVYXbEL1jFi8BlwbWyrP156TLY4HEfL6axvGQr
	2m+cU4JRHROX+Hw2pjbuzq1JAFI6VV0CCB4EUT/ZypEx+8o7Vt5f3/Vff8zfNle+3qPSZ+4wHFr
	okF+bpWaG9wgsJPeWyuaQ7lXMC1qH85egkEwkTYHxXxclVwpIDXqNr7r2MJT6x+9JPtnbQEFNIu
	1LBNNkOOgrmbIezmtBY6mHFDJ8NQ40LaFokUbDd2AhzJ7feF5ykuCqlNiD+DaNy1jxqOy6wbfmV
	Mhd8kfZsBbKQylqCKh9eg+wpAi1rZbyRLn5MjNSJ3Ebc/vy9ZcYcWIV03wbsJipk2T6EXzZu4yR
	vQzw7pGlFwYcziQyLuz4095xhzK+tEwK2EA/F72UdIohYpMIrFEl5UXR5R7e/g0/Yj1T7R3TwgD
	iWvg==
X-Google-Smtp-Source: AGHT+IHEnyztiCzMLSKzxMv0/iqEKnGgfqHvaJUwVU2gtBDtmGy6WUb/KQqWprxWVGQiSsEBcFCLfQ==
X-Received: by 2002:a05:6602:6b81:b0:87c:34e3:1790 with SMTP id ca18e2360f4ac-88168313db5mr806307439f.1.1754193555783;
        Sat, 02 Aug 2025 20:59:15 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:15 -0700 (PDT)
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
Subject: [PATCH v4 28/58] dyndbg: restore classmap protection when theres a controlling_param
Date: Sat,  2 Aug 2025 21:57:46 -0600
Message-ID: <20250803035816.603405-29-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205916_770780_AEFD56C2 
X-CRM114-Status: GOOD (  24.22  )
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

DRM has always had /sys/module/drm/parameters/debug (ie drm.debug).
Without dyndbg, this is their only control point.  One could presume
they like it - in any case its a system/user interface, ie ABI.

With dyndbg enabled, drm calls DYNAMIC_DEBUG_CLASSMAP_PARAM() to
create the drm.debug kparam, wired to our param-handler, which writes
a "class FOO" query for each bit in the classmap.  Since no new
interface was ever contemplated, this is using >control.

Since drm.debug is ABI, we should not allow class-less queries to
alter our implementation of its settings.

This patch provides that protection, *only* when theres a PARAM.  This
is the user, expressing their wish for easy control of their entire
classmap.  They also wish to trust its settings.

Classes without a PARAM are unprotected, allowing admins their
shortcuts.  No such use-cases exist yet.

Anyway, this patch does:

1. adds struct _ddebug_class_map.controlling_param

2. set it in ddebug_match_apply_kparam(), during modprobe/init,
   when options like drm.debug are handled.

3. ddebug_class_has_param() checks .controlling_param

4. ddebug_class_wants_protection() macro renames 3.

5. ddebug_change() calls 4 when needed.
   IE when applying a class-less query to a class'd pr_debug / drm_dbg_<T>

Historical Summary:

-v0 - before classmaps.  no special case keywords
-v1 - "class DEFAULT" is assumed if not mentioned.
      this protects classes from class-less queries

-v2.pre-this-patch - protection macro'd to false
-v2.with-this-patch - sysfs knob decides
-v2.speculative - module decides wrt classmap protection
		  seems unneeded now, TBD

NOTE: protection is only against class-less queries, explicit "class
FOO" adjustments are allowed (that is the mechanism).

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3 - new patch
---
 include/linux/dynamic_debug.h | 16 ++++++----
 lib/dynamic_debug.c           | 55 ++++++++++++++++++++++++++---------
 2 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 2d959f1f8cd30..bc26bc9128c1c 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -100,8 +100,9 @@ enum ddebug_class_map_type {
  * __pr_debug_cls(0, "fake CORE msg") in any part of DRM would "work"
  * __pr_debug_cls(22, "no such class") would compile, but not "work"
  */
-
+struct _ddebug_class_param;
 struct _ddebug_class_map {
+	struct _ddebug_class_param *controlling_param;
 	const struct module *mod;		/* NULL for builtins */
 	const char *mod_name;
 	const char **class_names;
@@ -231,7 +232,12 @@ struct _ddebug_class_param {
  *
  * Creates a sysfs-param to control the classes defined by the
  * exported classmap, with bits 0..N-1 mapped to the classes named.
- * This version keeps class-state in a private long int.
+ *
+ * Since sysfs-params are ABI, this also protects the classmap'd
+ * pr_debugs from un-class'd `echo -p > /proc/dynamic_debug/control`
+ * changes.
+ *
+ * This keeps class-state in a private long int.
  */
 #define DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _var, _flags)		\
 	static unsigned long _name##_bvec;				\
@@ -244,10 +250,8 @@ struct _ddebug_class_param {
  * @_var:   name of the (exported) classmap var defining the classes/bits
  * @_flags: flags to be toggled, typically just 'p'
  *
- * Creates a sysfs-param to control the classes defined by the
- * exported clasmap, with bits 0..N-1 mapped to the classes named.
- * This version keeps class-state in user @_bits.  This lets drm check
- * __drm_debug elsewhere too.
+ * Like DYNAMIC_DEBUG_CLASSMAP_PARAM, but maintains param-state in
+ * extern @_bits.  This lets DRM check __drm_debug elsewhere too.
  */
 #define DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(_name, _bits, _var, _flags)	\
 	__DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _bits, _var, _flags)
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 548a82a178d49..c3e27637d9357 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -198,16 +198,26 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 }
 
 /*
- * classmaps-v1 protected classes from changes by legacy commands
- * (those selecting _DPRINTK_CLASS_DFLT by omission), v2 undoes that
- * special treatment.  State so explicitly.  Later we could give
- * modules the choice to protect their classes or to keep v2 behavior.
+ * classmaps-V1 protected classes from changes by legacy commands
+ * (those selecting _DPRINTK_CLASS_DFLT by omission).  This had the
+ * downside that saying "class FOO" for every change can get tedious.
+ *
+ * V2 is smarter, it protects class-maps if the defining module also
+ * calls DYNAMIC_DEBUG_CLASSMAP_PARAM to create a sysfs parameter.
+ * Since they want the knob, we should assume they intend to use it
+ * (in preference to "class FOO +p" >control), and want to trust its
+ * settings.
+ * This gives protection when its useful, and not when its just tedious.
  */
-static inline bool ddebug_client_module_protects_classes(const struct ddebug_table *dt)
+static inline bool ddebug_class_has_param(const struct _ddebug_class_map *map)
 {
-	return false;
+	return !!(map->controlling_param);
 }
 
+/* re-framed as a policy choice */
+#define ddebug_class_wants_protection(map) \
+	ddebug_class_has_param(map)
+
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -250,7 +260,7 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 					/* site.class != given class */
 					continue;
 				/* legacy query, class'd site */
-				else if (ddebug_client_module_protects_classes(dt))
+				else if (ddebug_class_wants_protection(map))
 					continue;
 				/* allow change on class'd pr_debug */
 			}
@@ -650,6 +660,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 }
 
 /* apply a new class-param setting */
+
 static int ddebug_apply_class_bitmap(const struct _ddebug_class_param *dcp,
 				     const unsigned long *new_bits,
 				     const unsigned long old_bits,
@@ -1228,25 +1239,36 @@ static void ddebug_sync_classbits(const struct kernel_param *kp, const char *mod
 	}
 }
 
-static void ddebug_match_apply_kparam(const struct kernel_param *kp,
-				      const struct _ddebug_class_map *map,
-				      const char *mod_name)
+static struct _ddebug_class_param *
+ddebug_get_classmap_kparam(const struct kernel_param *kp,
+			   const struct _ddebug_class_map *map)
 {
 	struct _ddebug_class_param *dcp;
 
 	if (kp->ops != &param_ops_dyndbg_classes)
-		return;
+		return false;
 
 	dcp = (struct _ddebug_class_param *)kp->arg;
 
-	if (map == dcp->map) {
+	return (map == dcp->map)
+		? dcp : (struct _ddebug_class_param *)NULL;
+}
+
+static void ddebug_match_apply_kparam(const struct kernel_param *kp,
+				      struct _ddebug_class_map *map,
+				      const char *mod_name)
+{
+	struct _ddebug_class_param *dcp = ddebug_get_classmap_kparam(kp, map);
+
+	if (dcp) {
+		map->controlling_param = dcp;
 		v2pr_info(" kp:%s.%s =0x%lx", mod_name, kp->name, *dcp->bits);
 		vpr_cm_info(map, " %s mapped to: ", mod_name);
 		ddebug_sync_classbits(kp, mod_name);
 	}
 }
 
-static void ddebug_apply_params(const struct _ddebug_class_map *cm, const char *mod_name)
+static void ddebug_apply_params(struct _ddebug_class_map *cm, const char *mod_name)
 {
 	const struct kernel_param *kp;
 #if IS_ENABLED(CONFIG_MODULES)
@@ -1266,6 +1288,13 @@ static void ddebug_apply_params(const struct _ddebug_class_map *cm, const char *
 	}
 }
 
+/*
+ * called from add_module, ie early. it can find controlling kparams,
+ * which can/does? enable protection of this classmap from class-less
+ * queries, on the grounds that the user created the kparam, means to
+ * use it, and expects it to reflect reality.  We should oblige him,
+ * and protect those classmaps from classless "-p" changes.
+ */
 static void ddebug_apply_class_maps(const struct _ddebug_info *di)
 {
 	struct _ddebug_class_map *cm;
-- 
2.50.1


