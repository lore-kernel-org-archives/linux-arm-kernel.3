Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434DDE6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivVObFpEMeRPBcsYoBwesJyCBQlJUgWhfwCq+iuBLo8=; b=f2EFvY03gPyjbxw+DLDEOsmST2
	XO2ykya6cLGQUmn1QQ3pMKKcGmWRZ4P9Ev+2zvaqDC/FXx5PsiZMoRj7yEL75DWnUjAAYvffM1ug3
	nV90wNtpGXTkoxnNtlt7QOy7umSoC7QgY+O5+b+3aO4oe6P7M0Q6B7yLaYGdazqvkGjA9sQyFXurK
	ho+uVUZwyqxgO8bsXRyh+7mH6HYklhVf8kkQTcm0s/HMgzFt6VCsCgwWK82vopW5PLiDEx5nFipdM
	MzwvuJJx9/Ri3KSbQKI2rTEobYp9E/rdJ0pj22Lq7sGH1o3X+EWBwxs3jy6Vs0g+AaksdvRT2P4Sm
	qHtvjKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbCo-0000000DPXL-44bQ;
	Mon, 22 Dec 2025 08:23:53 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbCj-0000000DPTw-2ThR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:23:49 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so2864104b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391825; x=1766996625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivVObFpEMeRPBcsYoBwesJyCBQlJUgWhfwCq+iuBLo8=;
        b=dMb510DZ9qYGW0psaa31fep51d3KfOxoYcKBZWyaBHG61htgCOAIuVXEPXC65qsY9m
         n46k3+0nLFYddY528dyFlMV28g/ya1bMIGB7PPWd5Ox6GKDJ5MvYDnWIAjDpv9rmgrqO
         81FyqilV/szp1D+/R1Tg8kqVXDaCkq/Gnb8iIVWJe9mmtBAgThdjfAZTW2YsIFBc1cko
         rfpXQhtEI3uHH3kKdS2/t51ySSbKKFr932O16zOsLznRxTqnc3E3MnObf3+UNwMpH7zB
         EZ7V5CexqHIHJn+Rn4E8Pwb0GL667yUO3kmHAwIGOmtuziCFMLiwooltc8RBNO2EC1xt
         oc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391825; x=1766996625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ivVObFpEMeRPBcsYoBwesJyCBQlJUgWhfwCq+iuBLo8=;
        b=lz2OI5DZZhowCs4MzMzVTbjTy6in22T8CGFr+gh6AcqxfqWR7YtotmLGclnB9cuU3q
         MemSC8Kdkakk1wf1Nq3AuI1xOsbvLpkzdU/MIMlzdFm2jqAM361uPU5nUDwKee9jPoJ9
         eNnQYW6U2Sl17ddg5JSjAlkPMlf/raBBEpsTB40G000p4XSGkGWUKr2w3t/xF5ixsGmW
         ctbMA4skQ/ExyY3bRZhAsIDJMvyGEPI+M2Q2M1XzIitKCeJwipF9EHpe8239V6Pnvhoy
         xrydheLr9+O/NV/vMsYL8lSpWq3+RTmKuJQiMZQcEMXKo/jURcWEmZqzXUOoNbAOwvNh
         oYMg==
X-Forwarded-Encrypted: i=1; AJvYcCVM0keWl/R7QFvPiqpbhudgxBzFS62KozK6QNCnME70BOx1cKv7BvdaomJdzpP/gIV5JUve63oT174gDL6vXK44@lists.infradead.org
X-Gm-Message-State: AOJu0YzOJYPjcfaJugx/DUYHYW78MJ2HIuy+YriDphvmTrOg6jdnYd8u
	nP95VudULZLcanzaDf5I9rVOKL5uIuIUQNeB+u2AteqK6+B++3g1MnJ9
X-Gm-Gg: AY/fxX64KD7XF+NzFAaTBb0l9J3zKUwpuROJrBXgqfZN2XYUR+O9XYbdWIZb3xx1zSj
	LCzND4ujhB+WKgWJ4jei1rMSh6adcXdmzj7wQ26M32Y4lw5R31otiaA7AOyZ/f6dsBfxL17PyR2
	8bC2d6W34EakztRTPUcoGLhvnTexm8WrLP2rBeqcwxrB0T4oio6d2rTlvMP7CGhS96w7wzbeDh2
	k7xnVmfBJYNrGDlASLR0lX6+QxuAro9/0gTz2kC7K6yPymmRmCw4MXEv1o7N3elHAiLia9YWyi/
	Vo4uN1rnM7mri2qucV04trsseqJcPywDHgd7JJxLOng1aSxYA9cJJM6QE0Q3ebBtOtXGoEIRoFd
	H3wyBnCrKYmgCcfst3RdhrC2KZ71zK15P6XXM/FYnued4stvexuqjinMRMjKNqJL/PAijgFcBpM
	HUWqk6nxz/
X-Google-Smtp-Source: AGHT+IErZyV3AXFVhyKoyCbBtMfXSf07isejz/aGGQIZRu0pVdlKjcUPzr8HfnBOtnGWXU36ZXLjnQ==
X-Received: by 2002:a05:6a00:2e23:b0:7ff:e3ae:58e7 with SMTP id d2e1a72fcca58-7ffe3ae595amr8361296b3a.9.1766391824782;
        Mon, 22 Dec 2025 00:23:44 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:23:44 -0800 (PST)
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
Subject: [PATCH v7 13/31] dyndbg: replace classmap list with a vector
Date: Mon, 22 Dec 2025 21:20:30 +1300
Message-ID: <20251222082049.1782440-14-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002347_195798_36C6E779 
X-CRM114-Status: GOOD (  22.91  )
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  1 -
 lib/dynamic_debug.c           | 62 ++++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index c4ae79f934d9..51ed26e42032 100644
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
index db0559763e60..e882e951d585 100644
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
@@ -226,7 +227,7 @@ static int ddebug_change(const struct ddebug_query *query,
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
 	struct ddebug_class_map *map = NULL;
-	int __outvar valid_class;
+	int valid_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -1133,9 +1134,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 
 static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map;
+	struct ddebug_class_map *map = iter->table->classes;
+	int i, nc = iter->table->num_classes;
 
-	list_for_each_entry(map, &iter->table->maps, link)
+	for (i = 0; i < nc; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1219,30 +1221,31 @@ static const struct proc_ops proc_fops = {
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
@@ -1274,10 +1277,9 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dt->num_ddebugs = di->num_descs;
 
 	INIT_LIST_HEAD(&dt->link);
-	INIT_LIST_HEAD(&dt->maps);
 
 	if (di->classes && di->num_classes)
-		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
+		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
@@ -1390,8 +1392,8 @@ static void ddebug_remove_all_tables(void)
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
2.52.0


