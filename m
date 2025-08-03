Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC275C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+IM0NsWJ5A9C8Bm0HIX5NiHGnXi4xS02uXX3BN3rSA=; b=qHh52muaxtD6VSJStY+7Jf6Po7
	QaczG5eWvpNVPcdD+VoqMl3hcb8BvuUScMtlrdH37PxXVQz1gIgkFAPb672n0O0rcc0ScQX2/tGa/
	mJPTj5VSbns9chZY28Sd2+SUN1AVklJUDTj0n/JWQ7yb3okBVyygAU1cHrUZQXbs1ntA4mlHpnTDv
	CBak26WLn2qOXilEbTLDXfNwy1DuJaLhOjBtuPvWAc5Jqc+c3JpvxRdR8Wa2GRifDY8n0PNXgJvmi
	q5lyEKkhm/iJzJ9FyV0i0aD6wXfciQ9pAZ3w8ytN/7nw1cQuzzGSAwfqiq1bcSza4f2T8h32lOgSo
	aCAYlPcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQMW-00000008CvW-3lRm;
	Sun, 03 Aug 2025 04:30:20 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPs1-0000000885Q-3X1a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:58:51 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3e3d7b135c2so40558875ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193529; x=1754798329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+IM0NsWJ5A9C8Bm0HIX5NiHGnXi4xS02uXX3BN3rSA=;
        b=ChzYULcV8pBNLpZP06EmysUaCBLcbzW/LwKmfw8N1OV1pxAV8MSqjlNcZdkzA6wCko
         m+Tqqc8gGkIOaE2AzvmgowcL4maN0PuJbzw7hNqq+je/SDRkkM17GlNie7Luf3SXelpd
         One+y9vWW91nT53GmruQRzmGi/bSyg8e2dzDG7SF9e+waMUeyR622QdIc+gtdsbiYFQ1
         AM9rYJJpbAZbk1K/Q1J4OKOe2kmYGNeWjMq7GJST4kGZxHyy6uQg7B9CjdT7MFSujTPs
         NXCUTrvqGdbgtvkbQsa1h9aYETfhm0zVLgvhb+0+YQWK0wVlfXfyQia6AiWa+sfHW/SR
         FjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193529; x=1754798329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+IM0NsWJ5A9C8Bm0HIX5NiHGnXi4xS02uXX3BN3rSA=;
        b=oZgHYZTQHbavPTUCCLtmUEkpBv5CJciDDZzOhka5bhVN06rIwB/FVfPsC97+dpv6+r
         4lbBEu8tZp4n/XxR6+mH9aZP6FJpA0rSSn08SKANs7Opl7QTazUrh76T14mGsl5kSQPb
         riLgyOl+++fbdRNxN7lp3yPVBzf0fyvLisuOESEe2HaKxmnd+HTGc8FXWHMe01Ciy5uY
         BztDoov/+t0voO+MDijBhacSpJbgnsGjp0xqZpT1HglKo5VN1FgPusRks8jvBbEK92rb
         Sqqfs07qKOpBU7nbDHePJ7BX7aaxmaeJIAZeu7MLNMLG7+V71hK4BBNrlXPB5YggQkBE
         HkWw==
X-Forwarded-Encrypted: i=1; AJvYcCWKR1yeGq+RYlt413lrOlPv5f32jiMEHQf01X9O0058PC+pXFnxTal0AjbWFU8KSTAvAT1+8027CIBjsnzxJIuh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Y/cHLv486zF/77rX4OsVxGDXNJxD+FXVCJSH8QshIKbPk3xj
	bgOPrQFGV5Tvv2vuiT8ptrg/1EwjJcs9JfB70u9GOLscMtQKtHtMDg4g
X-Gm-Gg: ASbGnctKAbhCytlYJNcs7uwS9H/XxfBOWYlIQPENhMT/pRSgjZTwjeV+zWEff0SycyA
	RQHwQJKZyE4ki0IUaTwrPF7CgbJW+btvDeGLSMYCTKLw53xUa/K+MK/MwOHl4omzOHLoRoT3rYZ
	pzMJcr9RHfhfRmcDWUxZkfO/xxWvJY4t/MkqtYAsucDu73qZRHCuW08Nr7p5UEZ78ahpFdP3t4w
	Uuu9VW2u4f3f1mwnNknfVLM10QhE98gXTPGr+1CPDIhMWLaM5oRZQZJG+x/9RFbzd3QlD8OPLvv
	4xm/7TYXB5in2rrfESaREuUIhspbBZRD0v/Ds8lb6ETQwhs51yKOWn4kJVCIFFGFaI17f3H3N1M
	pXS17A+bU6uOJJp1xT8uqNsujgwnTYWypO7/iCNNQTFtfDahrH83r/O095F0+H+TuTRL9rKz3sg
	nsosijhX4GZBvZ
X-Google-Smtp-Source: AGHT+IGM7OSUipX6+Z/C4hvdpT/EoYheE+z0u0a3sHNA7VxTBFGUiEplXS+T9MpT5CIry67A8qS+LA==
X-Received: by 2002:a05:6e02:3191:b0:3dd:e7d6:18bb with SMTP id e9e14a558f8ab-3e4161cca21mr84220835ab.17.1754193529107;
        Sat, 02 Aug 2025 20:58:49 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:48 -0700 (PDT)
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
Subject: [PATCH v4 11/58] dyndbg: replace classmap list with a vector
Date: Sat,  2 Aug 2025 21:57:29 -0600
Message-ID: <20250803035816.603405-12-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205849_894904_0835EAEA 
X-CRM114-Status: GOOD (  23.28  )
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

Classmaps are stored in an elf section/array, but currently are
individually list-linked onto dyndbg's per-module ddebug_table for
operation. This is unnecessary.

Just like dyndbg's descriptors, classes are packed in compile order;
so even with many builtin modules employing multiple classmaps, each
modules' maps are packed contiguously, and can be treated as a
array-start-address & array-length.

So this drops the whole list building operation done in
ddebug_attach_module_classes(), and removes the list-head members.
The "select-by-modname" condition is reused to find the start,end of
the subrange.

NOTE: This "filter-by-modname" on classmaps should really be done in
ddebug_add_module(1); ie at least one step closer to ddebug_init(2),
which already splits up pr-debug descriptors into subranges by
modname, then calls (1) on each.  (2) knows nothing of classmaps
currently, and doesn't need to.  For now, just add comment.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3- drop __outvar as promising magic it doesnt have
---
 include/linux/dynamic_debug.h |  1 -
 lib/dynamic_debug.c           | 62 ++++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ac199293d2032..e458d4b838ac3 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -83,7 +83,6 @@ enum class_map_type {
 };
 
 struct ddebug_class_map {
-	struct list_head link;
 	struct module *mod;
 	const char *mod_name;	/* needed for builtins */
 	const char **class_names;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 08d095dd19ef4..283926530a43b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -45,10 +45,11 @@ extern struct ddebug_class_map __start___dyndbg_classes[];
 extern struct ddebug_class_map __stop___dyndbg_classes[];
 
 struct ddebug_table {
-	struct list_head link, maps;
+	struct list_head link;
 	const char *mod_name;
-	unsigned int num_ddebugs;
 	struct _ddebug *ddebugs;
+	struct ddebug_class_map *classes;
+	unsigned int num_ddebugs, num_classes;
 };
 
 struct ddebug_query {
@@ -148,12 +149,13 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 }
 
 static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							  const char *class_string, int *class_id)
+							const char *class_string,
+							int *class_id)
 {
 	struct ddebug_class_map *map;
-	int idx;
+	int i, idx;
 
-	list_for_each_entry(map, &dt->maps, link) {
+	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -164,7 +166,6 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	return NULL;
 }
 
-#define __outvar /* filled by callee */
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -180,7 +181,7 @@ static int ddebug_change(const struct ddebug_query *query,
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
 	struct ddebug_class_map *map = NULL;
-	int __outvar valid_class;
+	int valid_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -1122,9 +1123,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 
 static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map;
+	struct ddebug_class_map *map = iter->table->classes;
+	int i, nc = iter->table->num_classes;
 
-	list_for_each_entry(map, &iter->table->maps, link)
+	for (i = 0; i < nc; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1208,30 +1210,31 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
-static void ddebug_attach_module_classes(struct ddebug_table *dt,
-					 struct ddebug_class_map *classes,
-					 int num_classes)
+static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
 	struct ddebug_class_map *cm;
-	int i, j, ct = 0;
+	int i, nc = 0;
 
-	for (cm = classes, i = 0; i < num_classes; i++, cm++) {
+	/*
+	 * Find this module's classmaps in a subrange/wholerange of
+	 * the builtin/modular classmap vector/section.  Save the start
+	 * and length of the subrange at its edges.
+	 */
+	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
 
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
-
-			v2pr_info("class[%d]: module:%s base:%d len:%d ty:%d\n", i,
-				  cm->mod_name, cm->base, cm->length, cm->map_type);
-
-			for (j = 0; j < cm->length; j++)
-				v3pr_info(" %d: %d %s\n", j + cm->base, j,
-					  cm->class_names[j]);
-
-			list_add(&cm->link, &dt->maps);
-			ct++;
+			if (!nc) {
+				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
+					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
+				dt->classes = cm;
+			}
+			nc++;
 		}
 	}
-	if (ct)
-		vpr_info("module:%s attached %d classes\n", dt->mod_name, ct);
+	if (nc) {
+		dt->num_classes = nc;
+		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
+	}
 }
 
 /*
@@ -1263,10 +1266,9 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dt->num_ddebugs = di->num_descs;
 
 	INIT_LIST_HEAD(&dt->link);
-	INIT_LIST_HEAD(&dt->maps);
 
 	if (di->classes && di->num_classes)
-		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
+		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
@@ -1379,8 +1381,8 @@ static void ddebug_remove_all_tables(void)
 	mutex_lock(&ddebug_lock);
 	while (!list_empty(&ddebug_tables)) {
 		struct ddebug_table *dt = list_entry(ddebug_tables.next,
-						      struct ddebug_table,
-						      link);
+						     struct ddebug_table,
+						     link);
 		ddebug_table_free(dt);
 	}
 	mutex_unlock(&ddebug_lock);
-- 
2.50.1


