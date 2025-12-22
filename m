Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A13D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esuoUN/X0OUOWwx+QdeV/Q9GgUdfEO6lTOhgSGNn33g=; b=nBeivSP3xoj3hVu2mlMMZtgFFM
	zsn3IyAvsFFmc6T2FTABddDOR+W5tkGpXwIgtmZUkNSPXLA3Xbx9ioUf7n5oM2eWXC5tKjODN+0sR
	AMg4UBFpD6NH15zts5iQfvd22Am5X41qG6rKHNrxUFw9nFKDEYMWI+3HX21f8gvz4YGDR0jf5IMT1
	FKXwqEjsvrFH6aaEqpXW7PtUViTlxEX4zjxOGMX3Pd6bBSH6HaDvjVf1VQorSvitbpKRU9IvhgsNS
	neeA9HV14Zdd2Gs/IwW3m9Ni8+kepNw0WlsXC/IYdgXqVui4Pbh4KtWC3FY5tDWXzkmB6JGvAnbnE
	WGmCxcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbCT-0000000DPKe-2kir;
	Mon, 22 Dec 2025 08:23:29 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbCM-0000000DPHC-0Xqi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:23:28 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso5190974b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391801; x=1766996601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esuoUN/X0OUOWwx+QdeV/Q9GgUdfEO6lTOhgSGNn33g=;
        b=NAl1KNwniyGA7wN2BDXs82K+GuGhqWwdWVD0YkgkBg2C90Bawfkz5N61fxUOz5sMxX
         FKNxzGTV9a4ospQ3cXdKg+nxrb1MDCE1z+2RSZcv2n8BYf3rrQunphIUYIBbk1xfX7RB
         6u9hNatHpxhFyHjacEbQh/51u7tO2D6WN6LHsdrfW8SgNk6Ut9odd0Ns3fW4jtklCWzS
         F5Zu6riWpV2v48xRs7PPnGLy+OwKYsSZdFRQF9NXPhQu6T6AvPbbBnNC/NHRyewdZ7hK
         MwdQHE9+1Flyq+GdT6g1H2AoR3xhDGSQp1LiqfDoliLzaYWHU1T0+lhFukOpl7rVD/sU
         UFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391801; x=1766996601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=esuoUN/X0OUOWwx+QdeV/Q9GgUdfEO6lTOhgSGNn33g=;
        b=vC6hla/IrYVQo0y/YQx0zbZXf4qvj02PmJGec933hBqS/VFPvMyCeyVlA57bOp8wJf
         GxQqokTpN3jzjESLOtKG0xNwv6BtH2LVXgeFV4uOnQOAhiPX/0i877bDLtpyIo1qj7qW
         UEXAZf994CK1sLoR61c6C8e4IEP0WzYy2KoOVhH0dmzPAoh6fttGs2e5aC4TMPqLLXCS
         yhpWSRButzvdY2v36d+6a4QETfEIdUrWDfW+ONGrqZcyGBK36W5UmRK5htGqsg8TQnbF
         FtVlcZ1W4x1SmEOtI3k1I+nyKVxsAl5b2mYfa4ejhmfwR3PDtAFeWzoVhwWg8jSnzdmH
         0WWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnCPnMcQA65FHGHnmM9aGopjx4wXHylyl6tjBfSacMkDN9OEwJcbxzv/hjdEUF680tLhPmiTKlvwSFBfDdWSsG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8+3htEX+KwzdRwXS5X010a79SUtIAerrcrf1XhQVQNXAjmDuK
	L8B0+FEJkbFvmk+87VNdRAApFd9J8nEcSkiMJj31BvbeT69AbZVbv65M
X-Gm-Gg: AY/fxX4aqnQavRjIqEGNz9TQsNlrwToa8uSYGv4V/eK79rWeU3s0K53valUzAcXkYVF
	koLdeqw8Mhz637M3leC1hRb/3cdeod9dqOWCqKKw0KUh6gRy3eGJtulop5nfYKOHlLyse9+Twjd
	R6xTKEcQ1w64Ojnsst7NHG384SVMek/tZaMvxBTFrvLrSQA0qbgdC+ypqI8RxT2KNnrKNUsVgI5
	LAnxd2/02pFs4Zhql/smoB8GaecC8FcgQQpY9+IWx/n0Tu+8apkgOOGuy9rj09Hc6q78jUQjkHJ
	KCDeBq4wtsB1pNwb1evPRON+N3RoHFp0LFgXpl4TaDYPjtY37TCXaqx0pys2iHg98mqifU6Zp24
	GEAedyzngB+LAu7YXBGLPHBZ9OWuO6TGGqX7Tprj1vvU4Bfs1E2Zin71+9UP+BZrn0knSRu94UV
	sc7oowrHZ3
X-Google-Smtp-Source: AGHT+IGzQX0tN2JfceE4PO7awRUVxocYlOqPauoRRHBHZG89mr58gOjfvOVdijtg0YzN15AwLAVPpw==
X-Received: by 2002:a05:6a00:1d27:b0:7f7:1857:8456 with SMTP id d2e1a72fcca58-7ff6667cdb2mr8429960b3a.55.1766391801376;
        Mon, 22 Dec 2025 00:23:21 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:23:20 -0800 (PST)
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
Subject: [PATCH v7 11/31] dyndbg: refactor param_set_dyndbg_classes and below
Date: Mon, 22 Dec 2025 21:20:28 +1300
Message-ID: <20251222082049.1782440-12-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002322_684110_43CD399D 
X-CRM114-Status: GOOD (  17.03  )
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

Refactor callchain below param_set_dyndbg_classes(1) to allow mod-name
specific settings.  Split (1) into upper/lower fns, adding modname
param to lower, and passing NULL in from upper.  Below that, add the
same param to ddebug_apply_class_bitmap(), and pass it thru to
_ddebug_queries(), replacing NULL with the param.

This allows the callchain to update the classmap in just one module,
vs just all as currently done.  While the sysfs param is unlikely to
ever update just one module, the callchain will be used for modprobe
handling, which should update only that just-probed module.

In ddebug_apply_class_bitmap(), also check for actual changes to the
bits before announcing them, to declutter logs.

No functional change.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 65 ++++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 25 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 1db2f627237a..64d69f5cba1b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -604,9 +604,10 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/* apply a new bitmap to the sys-knob's current bit-state */
+/* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits)
+				     unsigned long *new_bits, unsigned long *old_bits,
+				     const char *query_modname)
 {
 #define QUERY_SIZE 128
 	char query[QUERY_SIZE];
@@ -614,7 +615,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply: 0x%lx to: 0x%lx\n", *new_bits, *old_bits);
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -623,12 +626,16 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
 			 test_bit(bi, new_bits) ? '+' : '-', dcp->flags);
 
-		ct = ddebug_exec_queries(query, NULL);
+		ct = ddebug_exec_queries(query, query_modname);
 		matches += ct;
 
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
+	if (*new_bits != *old_bits)
+		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
+
 	return matches;
 }
 
@@ -683,7 +690,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -693,7 +700,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -707,18 +714,9 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 	return 0;
 }
 
-/**
- * param_set_dyndbg_classes - class FOO >control
- * @instr: string echo>d to sysfs, input depends on map_type
- * @kp:    kp->arg has state: bits/lvl, map, map_type
- *
- * Enable/disable prdbgs by their class, as given in the arguments to
- * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
- * levels by bitpos.
- *
- * Returns: 0 or <0 if error.
- */
-int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+static int param_set_dyndbg_module_classes(const char *instr,
+					   const struct kernel_param *kp,
+					   const char *mod_name)
 {
 	const struct ddebug_class_param *dcp = kp->arg;
 	const struct ddebug_class_map *map = dcp->map;
@@ -755,8 +753,8 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
-		v2pr_info("bits:%lx > %s\n", inrep, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits);
+		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -769,7 +767,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
@@ -778,16 +776,33 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 	vpr_info("%s: total matches: %d\n", KP_NAME(kp), totct);
 	return 0;
 }
+
+/**
+ * param_set_dyndbg_classes - classmap kparam setter
+ * @instr: string echo>d to sysfs, input depends on map_type
+ * @kp:    kp->arg has state: bits/lvl, map, map_type
+ *
+ * enable/disable all class'd pr_debugs in the classmap. For LEVEL
+ * map-types, enforce * relative levels by bitpos.
+ *
+ * Returns: 0 or <0 if error.
+ */
+int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+{
+	return param_set_dyndbg_module_classes(instr, kp, NULL);
+}
 EXPORT_SYMBOL(param_set_dyndbg_classes);
 
 /**
- * param_get_dyndbg_classes - classes reader
+ * param_get_dyndbg_classes - classmap kparam getter
  * @buffer: string description of controlled bits -> classes
  * @kp:     kp->arg has state: bits, map
  *
- * Reads last written state, underlying prdbg state may have been
- * altered by direct >control.  Displays 0x for DISJOINT, 0-N for
- * LEVEL Returns: #chars written or <0 on error
+ * Reads last written state, underlying pr_debug states may have been
+ * altered by direct >control.  Displays 0x for DISJOINT classmap
+ * types, 0-N for LEVEL types.
+ *
+ * Returns: ct of chars written or <0 on error
  */
 int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 {
-- 
2.52.0


