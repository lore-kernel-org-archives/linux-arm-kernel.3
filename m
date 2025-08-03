Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F897C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itVu6eA+K3SgodBwXFCxlGNsboCt8pB8fOl4g2pcNDo=; b=OsAmB6tJtG+wEJay/R48g/InL0
	Kc7neRa/xDrZ2U95Kg8S8k6n4wLAiI34hh5b3EKfj/7loMgMl6xpEniBUXGgBjCy5NOU341yfhIle
	2ZLpv+9QoKNDXslytMELs9wtL+6U50lR6dc5Vx+WrCrIhttxTAuehzmRgThy/vA25m3SlAojK/fDK
	+K1JNPoB8c6Bidtu1jhFQvkvfioucAcU1jz466cIgBvQO3WaNhVvVflupharWyj1LuvSZV4u4uLQ+
	XFPwhZQtjfV7bhaDuWMFxvukhffsyK8kwpte0WGeGxJKSCPowQSQ5uO+Ilyuj6uNOCTWHfz/jzFOI
	Zw04knWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQZL-00000008FDS-1fCm;
	Sun, 03 Aug 2025 04:43:35 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsA-000000088BG-0SGu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:58:59 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e3d0cba6a7so12045535ab.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193537; x=1754798337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itVu6eA+K3SgodBwXFCxlGNsboCt8pB8fOl4g2pcNDo=;
        b=G8bRZcGfHXIWzmDmEyK/C7U7PGrVWqqr20bIRYPRR7gV4vMwOZZ/6B+x8fOBAO2X67
         IIFCsJ2KNMRnbw/bj1QtgLpFKEFY327ZB7xS2XtoCegQzankfr0bA71pYqjqXKI9Nsod
         Wqtpz/53fvIw20CZD/g7UTVN3PIRXs2Qx51Tk++dKDGF5Ljw3U/vdOiBHys987x9aZzJ
         7tsV1XF2JmqrmEKLVDMTDUa6nItTcZWlMV8zok2+YUmFBsOT+L2K72g/UNp0BLR2Y0La
         3Mg/a2AoJJ/zVNQBFPNXfrNjaY65cHWQi7LxLQK6afBXZn0irdlwxOqugVa5PodKQsWH
         jd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193537; x=1754798337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itVu6eA+K3SgodBwXFCxlGNsboCt8pB8fOl4g2pcNDo=;
        b=RsdNinxFfv6qTfHx064LuTwzdLqffYj/KKjDZTEgrLule+cdzY64RE6aweKb0P2S4l
         UkzJYxtnjSMBu+mKS4UDFjS3VVFT8rEB3SXuwun56kZAzJQIBD0rKo+rrqAkTWATTqE8
         C7ROb/QUOMPn9U+k23dT4iqYWTXGisL+C/pbUv/xAowZbqzPhr6SOvqly7VwDW1/k78T
         LwGB5jMgFIkVvMxP9NYl1DCPx0ps5LRNqp6nT3kR8ne29f3X/GoI2rCxaKFIscWoHD1m
         r3RsBWhUY0Dtu/kKkYGE85o+MlTIhhsGmqyarHtldEC70v/XmaHm3sq94Y1I9+jLzUJu
         oV+w==
X-Forwarded-Encrypted: i=1; AJvYcCVV4roV84nqsffBS3kkQgYuu2qttqErmW4Hx0BcVSQuZiL+afjBWRGUBIkfwmt+H0Ec2V52Da3bsgwZSJXBmAD9@lists.infradead.org
X-Gm-Message-State: AOJu0YzOq9bZhg/RYRdf4BYh2QZ+JuQnQqRRir0U1E2U7BBRY5kYt8mO
	wVoaGYTb9gIMOcBKLKRZnaqV/vLhPXPfwy49kHcX1UA1MjFK7nRZDgfS
X-Gm-Gg: ASbGncuyF5DLg8CB8PoZmtXdLwT5nMrsX5aLlLmcrUDokwMv4V485M2DW5TUu282qT7
	VqRZYpHUNUt3VvLyYNI3SefMXoD+2BZSD5PKcUl1ggu5PCaueV3GL8816rdF9HJJwn+pQHRb2xF
	dIYK+D2OCPGpI0LAu8egO30gWpAgqUcSa+rxeHl83L30V4BVVSvqjesk3+gzTaGODcmrxgq8JnL
	8ZUvbDfQJ25gexLB/o8e+ZANPEpPmgi1AT6rQ9lLyCLcASNzi9XTMVyIvsQ/tKAmcEjuxEPNhq1
	pF89F8pQfJ+KAzOF4SzpzYvagJnawpaUQ00L4A1wlZx0YJS2IZJGGQ0q6s2Iql4WCY3voW7zGcF
	GUZRMZBvp2Khad+OLTADMst7GaHALgyTiC2yfqt+BZTx2KloSq3hA3MavBDh07dMYhFz/UX4AaE
	9jKw==
X-Google-Smtp-Source: AGHT+IF7lhVbujEgWabmNj++lEZtk5CBRnmCuylney4Ytxb4NSL6xCQjPcdDT7J19WYnWE0O7WInvQ==
X-Received: by 2002:a05:6e02:350f:b0:3e2:9eac:dc01 with SMTP id e9e14a558f8ab-3e416183398mr118847275ab.18.1754193537164;
        Sat, 02 Aug 2025 20:58:57 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:56 -0700 (PDT)
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
Subject: [PATCH v4 16/58] dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
Date: Sat,  2 Aug 2025 21:57:34 -0600
Message-ID: <20250803035816.603405-17-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205858_148417_2C05284F 
X-CRM114-Status: GOOD (  20.77  )
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

Remove the DD_CLASS_TYPE_*_NAMES classmap types and code.

These 2 classmap types accept class names at the PARAM interface, for
example:

  echo +DRM_UT_CORE,-DRM_UT_KMS > /sys/module/drm/parameters/debug_names

The code works, but its only used by test-dynamic-debug, and wasn't
asked for by anyone else, so reduce LOC & test-surface; simplify things.

Also rename enum class_map_type to enum ddebug_class_map_type.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  23 ++------
 lib/dynamic_debug.c           | 102 +++-------------------------------
 lib/test_dynamic_debug.c      |  26 ---------
 3 files changed, 14 insertions(+), 137 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index f4d1d08cd5a7c..769f02456c8e0 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -58,27 +58,16 @@ struct _ddebug {
 #endif
 } __attribute__((aligned(8)));
 
-enum class_map_type {
+enum ddebug_class_map_type {
 	DD_CLASS_TYPE_DISJOINT_BITS,
 	/**
-	 * DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, one per bit.
-	 * expecting hex input. Built for drm.debug, basis for other types.
+	 * DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, mapped to bits[0..N].
+	 * Expects hex input. Built for drm.debug, basis for other types.
 	 */
 	DD_CLASS_TYPE_LEVEL_NUM,
 	/**
-	 * DD_CLASS_TYPE_LEVEL_NUM: input is numeric level, 0-N.
-	 * N turns on just bits N-1 .. 0, so N=0 turns all bits off.
-	 */
-	DD_CLASS_TYPE_DISJOINT_NAMES,
-	/**
-	 * DD_CLASS_TYPE_DISJOINT_NAMES: input is a CSV of [+-]CLASS_NAMES,
-	 * classes are independent, like _DISJOINT_BITS.
-	 */
-	DD_CLASS_TYPE_LEVEL_NAMES,
-	/**
-	 * DD_CLASS_TYPE_LEVEL_NAMES: input is a CSV of [+-]CLASS_NAMES,
-	 * intended for names like: INFO,DEBUG,TRACE, with a module prefix
-	 * avoid EMERG,ALERT,CRIT,ERR,WARNING: they're not debug
+	 * DD_CLASS_TYPE_LEVEL_NUM: input is numeric level, 0..N.
+	 * Input N turns on bits 0..N-1
 	 */
 };
 
@@ -88,7 +77,7 @@ struct _ddebug_class_map {
 	const char **class_names;
 	const int length;
 	const int base;		/* index of 1st .class_id, allows split/shared space */
-	enum class_map_type map_type;
+	enum ddebug_class_map_type map_type;
 };
 
 /**
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 09f19155d7f02..2cd28a64578dd 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -646,76 +646,6 @@ static int ddebug_apply_class_bitmap(const struct _ddebug_class_param *dcp,
 
 #define CLASSMAP_BITMASK(width) ((1UL << (width)) - 1)
 
-/* accept comma-separated-list of [+-] classnames */
-static int param_set_dyndbg_classnames(const char *instr, const struct kernel_param *kp)
-{
-	const struct _ddebug_class_param *dcp = kp->arg;
-	const struct _ddebug_class_map *map = dcp->map;
-	unsigned long curr_bits, old_bits;
-	char *cl_str, *p, *tmp;
-	int cls_id, totct = 0;
-	bool wanted;
-
-	cl_str = tmp = kstrdup_and_replace(instr, '\n', '\0', GFP_KERNEL);
-	if (!tmp)
-		return -ENOMEM;
-
-	/* start with previously set state-bits, then modify */
-	curr_bits = old_bits = *dcp->bits;
-	vpr_info("\"%s\" > %s:0x%lx\n", cl_str, KP_NAME(kp), curr_bits);
-
-	for (; cl_str; cl_str = p) {
-		p = strchr(cl_str, ',');
-		if (p)
-			*p++ = '\0';
-
-		if (*cl_str == '-') {
-			wanted = false;
-			cl_str++;
-		} else {
-			wanted = true;
-			if (*cl_str == '+')
-				cl_str++;
-		}
-		cls_id = match_string(map->class_names, map->length, cl_str);
-		if (cls_id < 0) {
-			pr_err("%s unknown to %s\n", cl_str, KP_NAME(kp));
-			continue;
-		}
-
-		/* have one or more valid class_ids of one *_NAMES type */
-		switch (map->map_type) {
-		case DD_CLASS_TYPE_DISJOINT_NAMES:
-			/* the +/- pertains to a single bit */
-			if (test_bit(cls_id, &curr_bits) == wanted) {
-				v3pr_info("no change on %s\n", cl_str);
-				continue;
-			}
-			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
-			*dcp->bits = curr_bits;
-			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
-				  map->class_names[cls_id]);
-			break;
-		case DD_CLASS_TYPE_LEVEL_NAMES:
-			/* cls_id = N in 0..max. wanted +/- determines N or N-1 */
-			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
-			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
-
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
-			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
-			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
-				  map->class_names[cls_id], old_bits, curr_bits);
-			break;
-		default:
-			pr_err("illegal map-type value %d\n", map->map_type);
-		}
-	}
-	kfree(tmp);
-	vpr_info("total matches: %d\n", totct);
-	return 0;
-}
-
 static int param_set_dyndbg_module_classes(const char *instr,
 					   const struct kernel_param *kp,
 					   const char *mod_name)
@@ -724,29 +654,17 @@ static int param_set_dyndbg_module_classes(const char *instr,
 	const struct _ddebug_class_map *map = dcp->map;
 	unsigned long inrep, new_bits, old_bits;
 	int rc, totct = 0;
-
-	switch (map->map_type) {
-
-	case DD_CLASS_TYPE_DISJOINT_NAMES:
-	case DD_CLASS_TYPE_LEVEL_NAMES:
-		/* handle [+-]classnames list separately, we are done here */
-		return param_set_dyndbg_classnames(instr, kp);
-
-	case DD_CLASS_TYPE_DISJOINT_BITS:
-	case DD_CLASS_TYPE_LEVEL_NUM:
-		/* numeric input, accept and fall-thru */
-		rc = kstrtoul(instr, 0, &inrep);
-		if (rc) {
-			pr_err("expecting numeric input: %s > %s\n", instr, KP_NAME(kp));
-			return -EINVAL;
-		}
-		break;
-	default:
-		pr_err("%s: bad map type: %d\n", KP_NAME(kp), map->map_type);
+	char *nl;
+
+	rc = kstrtoul(instr, 0, &inrep);
+	if (rc) {
+		nl = strchr(instr, '\n');
+		if (nl)
+			*nl = '\0';
+		pr_err("expecting numeric input, not: %s > %s\n", instr, KP_NAME(kp));
 		return -EINVAL;
 	}
 
-	/* only _BITS,_NUM (numeric) map-types get here */
 	switch (map->map_type) {
 	case DD_CLASS_TYPE_DISJOINT_BITS:
 		/* expect bits. mask and warn if too many */
@@ -812,12 +730,8 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 	const struct _ddebug_class_map *map = dcp->map;
 
 	switch (map->map_type) {
-
-	case DD_CLASS_TYPE_DISJOINT_NAMES:
 	case DD_CLASS_TYPE_DISJOINT_BITS:
 		return scnprintf(buffer, PAGE_SIZE, "0x%lx\n", *dcp->bits);
-
-	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
 		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 8434f70b51bb3..9c3e53cd26bd8 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -74,13 +74,6 @@ DECLARE_DYNDBG_CLASSMAP(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
-/* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 10, MID, HI };
-DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
-			"LOW", "MID", "HI");
-DD_SYS_WRAP(disjoint_names, p);
-DD_SYS_WRAP(disjoint_names, T);
-
 /* numeric verbosity, V2 > V1 related */
 enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
 DECLARE_DYNDBG_CLASSMAP(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
@@ -88,13 +81,6 @@ DECLARE_DYNDBG_CLASSMAP(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
 DD_SYS_WRAP(level_num, p);
 DD_SYS_WRAP(level_num, T);
 
-/* symbolic verbosity */
-enum cat_level_names { L0 = 22, L1, L2, L3, L4, L5, L6, L7 };
-DECLARE_DYNDBG_CLASSMAP(map_level_names, DD_CLASS_TYPE_LEVEL_NAMES, 22,
-			"L0", "L1", "L2", "L3", "L4", "L5", "L6", "L7");
-DD_SYS_WRAP(level_names, p);
-DD_SYS_WRAP(level_names, T);
-
 /* stand-in for all pr_debug etc */
 #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
 
@@ -102,10 +88,6 @@ static void do_cats(void)
 {
 	pr_debug("doing categories\n");
 
-	prdbg(LOW);
-	prdbg(MID);
-	prdbg(HI);
-
 	prdbg(D2_CORE);
 	prdbg(D2_DRIVER);
 	prdbg(D2_KMS);
@@ -129,14 +111,6 @@ static void do_levels(void)
 	prdbg(V5);
 	prdbg(V6);
 	prdbg(V7);
-
-	prdbg(L1);
-	prdbg(L2);
-	prdbg(L3);
-	prdbg(L4);
-	prdbg(L5);
-	prdbg(L6);
-	prdbg(L7);
 }
 
 static void do_prints(void)
-- 
2.50.1


