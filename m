Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E39D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgioQELFSWboGT8e1NJA/uyXbHTLXVSWlCnIL2Rpr+0=; b=SXvlnnC/62/WYWK34H/eP2ux88
	m5fyhRbN5TT007eIxANgojpx+srG+EbMN+qYpqDj0+SGKYXHB4b11iFfH66HTbaPXkNA1L98Wlty2
	Twhdy0OZQhfMB31eUhQhNIjxqf70kC5JX16etZPBPBdJ6G3x0K6Yxp/J0nYsl2C7u9sUZkBoVzSVp
	6OUepDO95zPY50j6+YUfa3DaIDgdf60cy4Wtujp/qlcUxOmhtRLeEWH7CwCHT6L24zJVCTOyM+Qt6
	ZkK0LndiwVFwknRs0GWzODwGwKMzFii+/JYXRu8dK2BOaITcq6sKNam7zAdXvYQlQjRThfaBMzyvJ
	nnxzeh2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbDT-0000000DPvQ-0D2U;
	Mon, 22 Dec 2025 08:24:31 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbDP-0000000DPsp-1y23
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:24:29 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-8035e31d834so1072942b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391866; x=1766996666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgioQELFSWboGT8e1NJA/uyXbHTLXVSWlCnIL2Rpr+0=;
        b=VAYQD6yxEic5pc2BxOhNkllixJROhaq5bi9Uj2W14CpBFJkS9pcwaveQP/BoF55B4i
         /UW/7K9Br9p/wIB05JySsxLx+mx+BFw0T5HvPZrqFnUxyyNBoJexSwWVuhwkUCuhb8+z
         KJlmD7DIlnLdH0WBrogwpeMA0mJnJfOCJqQ+IYi90QIoLRkg1W5Y9kPmLwlKBp1UQGFE
         9aRfq66DMmUr+11WkPSd4oqx9ojHYLtlKGwkKIKNhZ7/uoIf6ctRf/62MI4BBa4V11pq
         lKYl4o/423+G9Nj8wH28f9EpL3kjU/w6H2UsTM/3bhKo4VSJwiHOEYdlDvJsRQj6Wgf0
         Oi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391866; x=1766996666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IgioQELFSWboGT8e1NJA/uyXbHTLXVSWlCnIL2Rpr+0=;
        b=EnePF2A8bBKVOUYvoTyrjkUvYsgZ6sToW1qXA6+F4l89GaEFzCaQlSf5WmNVijiIiz
         ooMm0aCOT+ychbQHPY3fPp3gswCaBXCmGGYHlKGHBFOmAGsp6KBIi9//UDrEZ6WoGPM2
         VUWbkb7Ao6xej0tUSgPS4VuKOOIEl6WsUYiBChfy319bf0/OOxRSRJkpQxEiNDtiF24R
         jh5rEsHsCAJ+Ta+mskpJWGO2B49+kKgkFl6CbFER/0OreHmT57yqHcLBJd8cxVpE6gQv
         Dm0pFaXcMDlr18f7oMjYmoRwnj1bGbhvo2B7PPhSGlRxGMRmLYaZVSiXQivOej4naw2Q
         idsw==
X-Forwarded-Encrypted: i=1; AJvYcCV6n7p9UvCdyAVmaG9Wos2pbFySUV35wOE3hKpBCbEnkGy+e9dVOYBCHhl0AnPvspRcxtqfDA1hKFZmDaie/zg8@lists.infradead.org
X-Gm-Message-State: AOJu0YxbI35/GKAYq3KQiMpGubZc6BwI9+rK6kgHjutsAFcT8eUSPNIG
	Y55ECECLo9nKwQiDEpaRCVlwIUKywb1NN7eIRZP7B1QiyyXL/nmEJiX4
X-Gm-Gg: AY/fxX5L1vM7rdWzgDf9xk4sF8alqZRzUWL5dYGMCC9hkTV99mKIP6rhIwkMgTDBx38
	JEtRU0xzfULKaJv62wbymdTqN8EbXTuEqPZ/nMToOO8FmP9t4CySaZ33BsVre4Iu1yh2eKiyroG
	yGQLqqZo6T/Oof2tUFD1D2byTtj1dwIA8i0my3ZpliqvK2myebwU0GPDc8CyjMk5av+u/qyKnLn
	t7mUF4RHv8LTxjtcW5FWJLWxiPZLUEEANJJeZmGh6+IOdP+P/w475p8+d+DTFo3rj7KOXjprC32
	rSHCYUCv2AtA9aZaj9bbwwnp9zVQDRegqKi4GmM7Q8Kr6nQyCoEt1E2K1SCnj3+woDXhN8PEvj1
	eeKY3Iwhbli8JFObc8m7RRxUGmU/JHXLLp3bcXZlSh6EShcfzOF+4dOzpmJQGmpAvg20FGGQwhl
	MTs4QA9YGN
X-Google-Smtp-Source: AGHT+IF+KaYFdeN4pnc8jVOwLwBdDe1Ay4y8vjxtIpuGDaNQD1P00mPetARGOEojrEyFvSnKgXRWEw==
X-Received: by 2002:a05:6a00:1d19:b0:7e8:43f5:bd29 with SMTP id d2e1a72fcca58-7ff6795ad53mr9717563b3a.62.1766391866317;
        Mon, 22 Dec 2025 00:24:26 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:24:25 -0800 (PST)
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
Subject: [PATCH v7 17/31] dyndbg: move mod_name down from struct ddebug_table to _ddebug_info
Date: Mon, 22 Dec 2025 21:20:34 +1300
Message-ID: <20251222082049.1782440-18-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002427_545065_B6FE0392 
X-CRM114-Status: GOOD (  22.21  )
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

struct _ddebug_info already has most of dyndbg's info for a module;
push debug_table.mod_name down into it, finishing the encapsulation.

This allows refactoring several callchains, passing &_ddebug_info
instead of &ddebug_table, and hoisting the "&dt->info" deref up
instead of repeating it thru the callchans

ddebug_table contains a _ddebug_info member, so its users keep access
to mod_name, just now with "->info." added in.

In static ddebug_add_module(&di), reinforce the cursor-model by
dropping the modname arg, and setting di->mod_name at each caller.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  1 +
 lib/dynamic_debug.c           | 50 ++++++++++++++++++-----------------
 2 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4775f66e96dd..10f1a2a1bee4 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -107,6 +107,7 @@ struct _ddebug_class_maps {
 };
 
 struct _ddebug_info {
+	const char *mod_name;
 	struct _ddebug_descs descs;
 	struct _ddebug_class_maps maps;
 };
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d668140794ac..77972da271ee 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -46,7 +46,6 @@ extern struct _ddebug_class_map __stop___dyndbg_class_maps[];
 
 struct ddebug_table {
 	struct list_head link;
-	const char *mod_name;
 	struct _ddebug_info info;
 };
 
@@ -253,10 +252,11 @@ static int ddebug_change(const struct ddebug_query *query,
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
 	list_for_each_entry(dt, &ddebug_tables, link) {
+		struct _ddebug_info *di = &dt->info;
 
 		/* match against the module name */
 		if (query->module &&
-		    !match_wildcard(query->module, dt->mod_name))
+		    !match_wildcard(query->module, di->mod_name))
 			continue;
 
 		if (query->class_string) {
@@ -268,8 +268,8 @@ static int ddebug_change(const struct ddebug_query *query,
 			valid_class = _DPRINTK_CLASS_DFLT;
 		}
 
-		for (i = 0; i < dt->info.descs.len; i++) {
-			struct _ddebug *dp = &dt->info.descs.start[i];
+		for (i = 0; i < di->descs.len; i++) {
+			struct _ddebug *dp = &di->descs.start[i];
 
 			if (!ddebug_match_desc(query, dp, valid_class))
 				continue;
@@ -289,7 +289,7 @@ static int ddebug_change(const struct ddebug_query *query,
 #endif
 			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
 				  trim_prefix(dp->filename), dp->lineno,
-				  dt->mod_name, dp->function,
+				  di->mod_name, dp->function,
 				  ddebug_describe_flags(dp->flags, &fbuf),
 				  ddebug_describe_flags(newflags, &nbuf));
 			dp->flags = newflags;
@@ -1156,12 +1156,12 @@ static bool ddebug_class_in_range(const int class_id, const struct _ddebug_class
 		class_id < map->base + map->length);
 }
 
-static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
+static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp)
 {
 	struct _ddebug_class_map *map;
 	int i;
 
-	for_subvec(i, map, &dt->info, maps)
+	for_subvec(i, map, di, maps)
 		if (ddebug_class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1189,13 +1189,13 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 
 	seq_printf(m, "%s:%u [%s]%s =%s \"",
 		   trim_prefix(dp->filename), dp->lineno,
-		   iter->table->mod_name, dp->function,
+		   iter->table->info.mod_name, dp->function,
 		   ddebug_describe_flags(dp->flags, &flags));
 	seq_escape_str(m, dp->format, ESCAPE_SPACE, "\t\r\n\"");
 	seq_putc(m, '"');
 
 	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
-		class = ddebug_class_name(iter->table, dp);
+		class = ddebug_class_name(&iter->table->info, dp);
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
@@ -1247,7 +1247,7 @@ static const struct proc_ops proc_fops = {
 
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
-	vpr_info("module:%s attached %d classes\n", dt->mod_name, dt->info.maps.len);
+	vpr_info("module:%s attached %d classes\n", dt->info.mod_name, dt->info.maps.len);
 }
 
 /*
@@ -1265,7 +1265,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	typeof(_dst) __dst = (_dst);					\
 	int __nc = 0;							\
 	for_subvec(_i, _sp, _box, _vec) {				\
-		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+		if (!strcmp((_sp)->mod_name, (__dst)->info.mod_name)) {	\
 			if (!__nc++)					\
 				(__dst)->info._vec.start = (_sp);	\
 		} else {						\
@@ -1280,7 +1280,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
  */
-static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
+static int ddebug_add_module(struct _ddebug_info *di)
 {
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
@@ -1289,20 +1289,19 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	if (!di->descs.len)
 		return 0;
 
-	v3pr_info("add-module: %s %d sites\n", modname, di->descs.len);
+	v3pr_info("add-module: %s %d sites\n", di->mod_name, di->descs.len);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-		pr_err("error adding module: %s\n", modname);
+		pr_err("error adding module: %s\n", di->mod_name);
 		return -ENOMEM;
 	}
 	/*
-	 * For built-in modules, name lives in .rodata and is
-	 * immortal. For loaded modules, name points at the name[]
-	 * member of struct module, which lives at least as long as
-	 * this struct ddebug_table.
+	 * For built-in modules, name (as supplied in di by its
+	 * callers) lives in .rodata and is immortal. For loaded
+	 * modules, name points at the name[] member of struct module,
+	 * which lives at least as long as this struct ddebug_table.
 	 */
-	dt->mod_name = modname;
 	dt->info = *di;
 
 	INIT_LIST_HEAD(&dt->link);
@@ -1316,7 +1315,7 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
+	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
 	return 0;
 }
 
@@ -1379,7 +1378,7 @@ static int ddebug_remove_module(const char *mod_name)
 
 	mutex_lock(&ddebug_lock);
 	list_for_each_entry_safe(dt, nextdt, &ddebug_tables, link) {
-		if (dt->mod_name == mod_name) {
+		if (dt->info.mod_name == mod_name) {
 			ddebug_table_free(dt);
 			ret = 0;
 			break;
@@ -1399,7 +1398,8 @@ static int ddebug_module_notify(struct notifier_block *self, unsigned long val,
 
 	switch (val) {
 	case MODULE_STATE_COMING:
-		ret = ddebug_add_module(&mod->dyndbg_info, mod->name);
+		mod->dyndbg_info.mod_name = mod->name;
+		ret = ddebug_add_module(&mod->dyndbg_info);
 		if (ret)
 			WARN(1, "Failed to allocate memory: dyndbg may not work properly.\n");
 		break;
@@ -1497,7 +1497,8 @@ static int __init dynamic_debug_init(void)
 			mod_ct++;
 			di.descs.len = mod_sites;
 			di.descs.start = iter_mod_start;
-			ret = ddebug_add_module(&di, modname);
+			di.mod_name = modname;
+			ret = ddebug_add_module(&di);
 			if (ret)
 				goto out_err;
 
@@ -1508,7 +1509,8 @@ static int __init dynamic_debug_init(void)
 	}
 	di.descs.len = mod_sites;
 	di.descs.start = iter_mod_start;
-	ret = ddebug_add_module(&di, modname);
+	di.mod_name = modname;
+	ret = ddebug_add_module(&di);
 	if (ret)
 		goto out_err;
 
-- 
2.52.0


