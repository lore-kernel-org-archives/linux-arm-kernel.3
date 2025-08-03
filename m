Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF14C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORK9k3QUZJtuVsIu7FqLBNLHVp4N+O4ijcv5dzF1jJc=; b=J78aWuweHMXraGP3gHBMpgj7hy
	c83eeiKMjjjmyPG2tveFQtheBZRF0KmHxiIPY4dkczNl5+fL6+Gm+FsNzq8R7HeNBFxYrh8ENleSs
	UD+WqS/ErGF6tdLxQ0y/bQ+ket5DSKL6o+6hVtLITvg0CmaEKug5q2flwYwh2zDc/UmMm5tHYi6ED
	hmjj5VaTkjxGOPQadQjCvYpNx6IdSbKCOB8cJjLzowJUIokTdQ4amzwqNZ+FMD7rLAcahtCvJGf9/
	ZV5xgSVWdbxFmCSi8wT8zACmWRyf3OPtoQ7tco2i3HS1yuBUfk/dO/oRRC6hSrhusulTDtI579DPP
	MbbcxDgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQWm-00000008Eh4-2NkD;
	Sun, 03 Aug 2025 04:40:56 +0000
Received: from mail-il1-f171.google.com ([209.85.166.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPs8-000000088AV-2yNS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:58:57 +0000
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3e3d31a9ac7so12933965ab.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193535; x=1754798335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORK9k3QUZJtuVsIu7FqLBNLHVp4N+O4ijcv5dzF1jJc=;
        b=jcRG/Kco9WW01odryEaRFTUN41pIjZmX/nDtyloj52EpN5iHbMqc/qGbNtiPxrMCf9
         GW9qEgb6Mtljv1fkbIT9UzM5N2Q767tAr5wxjhQbmDsLcURsVj3jbm2yQn1VAIJRUQnQ
         CbozKvksJMbTWkeaVTnGG6IFdeEqGKpam1AXe9/grmVBvXXFA5MF/pUvhh7FS8Qdocvx
         6EC5Oqec1mRjnAvJHH7Z5/bTWvumYbzcvV6+ClpAMsVS6Xun9Q7iQZCrTuBlkJLoejl5
         fyhL1NJElvmq5tjl06AM7TBUc6VD0DYp92PCln9hJoAhEm8lF3PrSzZGjfhRd9F/SL9m
         c21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193535; x=1754798335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORK9k3QUZJtuVsIu7FqLBNLHVp4N+O4ijcv5dzF1jJc=;
        b=WUt8vPePNrvc7ya4wTyl+eEz/yiG4HIh5vOeIBUssKo/6wgFm2OrJddALmnTq/5d2W
         L44VOX5YyGj23+aUdvQiPsBlQwx6d9T1ZQMh1c85w+xRowhMIE5JnIfla/HwUbA4mpua
         mchyf0UMhCMbPp2Xo14MPaXNH9fmKGmRvS3ct43fYqR/lHS0GCyVyK+pIG64YjZ1TVXh
         iUIufnfuB5TN2QHr4tBlyA7wR2qYCZ51m/xMfd1vHasue6Q5+qUtXVl7OFtyQLcnaj1D
         W02jCLKXT4D7UdKM10qwr1jMpyAqYzmjt8tIBMpALfNmLrTdO+Tz2SXKsTv9vnoUv/Y3
         8yAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ8oDGGMC1q6Odug8aYCa05XviReK0HRNnXdHrYIcKp6woWVbOD0YZHGCLMRd/ApapDD3EfbyLv+YYHjDdLZJh@lists.infradead.org
X-Gm-Message-State: AOJu0Yws3wqZprz+Wn+Kcsu+8lI0fX/LPLYZmie6K00FkUsE9SM7BUjO
	5ZgwXW+G4/zV6CaoMMhgAfvjyQDyNQamv9Sd2BEn/D6kB6jzMSWtWHht
X-Gm-Gg: ASbGncvh31l5opYV4t7k9DXngzSSXuZGbaRttflI3zvuT8Ytg0NyS/K4WJvFz8XHm2+
	lssmMDI1Z5QjbWAQM6pYGhVSydz8jqSZlw8R0G8ftlSAErhwbr23O2K879jcNKPuJ0YRT8AzoNe
	LirSZVFeTR1CSg7eudsM8bYvca1tHjtHEsd0WeHvvZ2ob3sA3sAEjKZ0nS2Zx4WFx6pOAtp4THq
	9Vmq0Wb0sHMANNs18x+PRyWMUj0MDEq7rthVallFQsrKQq8CRLay0WpBZLTREKjI9xWSdDqp1gR
	xYG38ksw8MioTEgAWo21ZniSUjEsQlNzxe1zqGpuo2VZ73GzeHQ57U0jwQaityAnEilbFjyVtEs
	yFQ6ca0PvadsvAzD8gyu7huAx5lDJH7u3TlRzRwST1nL76RkOUDDMze1uuUBQEwouoncUW0NtAr
	INUA==
X-Google-Smtp-Source: AGHT+IEbSdNNbc1zVnKCCJZUuETqTQtoaGj2TcDdJPLDVMJba4Vzk2kJH+A6WzY4odoJMJfDdZ0nxg==
X-Received: by 2002:a92:ca4b:0:b0:3df:4159:8fe5 with SMTP id e9e14a558f8ab-3e4162bc725mr89515755ab.4.1754193535436;
        Sat, 02 Aug 2025 20:58:55 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:55 -0700 (PDT)
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
Subject: [PATCH v4 15/58] dyndbg: ddebug_table.mod_name down to _ddebug_info
Date: Sat,  2 Aug 2025 21:57:33 -0600
Message-ID: <20250803035816.603405-16-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205856_751419_E7E032E5 
X-CRM114-Status: GOOD (  20.06  )
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
instead of &ddebug_table, and hoisting the "&dt->info" deref up.

ddebug_table contains a _ddebug_info member, so its users keep access
to mod_name, just now with "->info." added in.

In static ddebug_add_module(&di), reinforce the cursor-model by
dropping the modname arg, and setting di->mod_name at each caller.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
-v3 more s/dt/di/ internal interface changes
---
 include/linux/dynamic_debug.h |  1 +
 lib/dynamic_debug.c           | 45 ++++++++++++++++++-----------------
 2 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 9d282e2444e18..f4d1d08cd5a7c 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -126,6 +126,7 @@ struct _ddebug_class_maps {
 } __packed;
 
 struct _ddebug_info {
+	const char *mod_name;
 	struct _ddebug_descs descs;
 	struct _ddebug_class_maps maps;
 } __packed;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index bbbdb8aba0716..09f19155d7f02 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -46,7 +46,6 @@ extern struct _ddebug_class_map __stop___dyndbg_class_maps[];
 
 struct ddebug_table {
 	struct list_head link;
-	const char *mod_name;
 	struct _ddebug_info info;
 };
 
@@ -201,7 +200,7 @@ static int ddebug_change(const struct ddebug_query *query,
 
 		/* match against the module name */
 		if (query->module &&
-		    !match_wildcard(query->module, dt->mod_name))
+		    !match_wildcard(query->module, dt->info.mod_name))
 			continue;
 
 		if (query->class_string) {
@@ -269,7 +268,7 @@ static int ddebug_change(const struct ddebug_query *query,
 #endif
 			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
 				  trim_prefix(dp->filename), dp->lineno,
-				  dt->mod_name, dp->function,
+				  dt->info.mod_name, dp->function,
 				  ddebug_describe_flags(dp->flags, &fbuf),
 				  ddebug_describe_flags(newflags, &nbuf));
 			dp->flags = newflags;
@@ -1133,12 +1132,12 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 #define class_in_range(class_id, map)					\
 	(class_id >= map->base && class_id < map->base + map->length)
 
-static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
+static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp)
 {
 	struct _ddebug_class_map *map;
 	int i;
 
-	for_subvec(i, map, &dt->info, maps)
+	for_subvec(i, map, di, maps)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1166,13 +1165,13 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 
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
@@ -1224,7 +1223,7 @@ static const struct proc_ops proc_fops = {
 
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
-	vpr_info("module:%s attached %d classes\n", dt->mod_name, dt->info.maps.len);
+	vpr_info("module:%s attached %d classes\n", dt->info.mod_name, dt->info.maps.len);
 }
 
 /*
@@ -1241,7 +1240,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 #define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({		\
 	int nc = 0;							\
 	for_subvec(_i, _sp, _box, _vec) {				\
-		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+		if (!strcmp((_sp)->mod_name, (_dst)->info.mod_name)) {	\
 			if (!nc++)					\
 				(_dst)->info._vec.start = (_sp);	\
 		} else {						\
@@ -1256,7 +1255,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
  */
-static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
+static int ddebug_add_module(struct _ddebug_info *di)
 {
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
@@ -1265,20 +1264,19 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
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
@@ -1292,7 +1290,7 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
+	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
 	return 0;
 }
 
@@ -1355,7 +1353,7 @@ static int ddebug_remove_module(const char *mod_name)
 
 	mutex_lock(&ddebug_lock);
 	list_for_each_entry_safe(dt, nextdt, &ddebug_tables, link) {
-		if (dt->mod_name == mod_name) {
+		if (dt->info.mod_name == mod_name) {
 			ddebug_table_free(dt);
 			ret = 0;
 			break;
@@ -1375,7 +1373,8 @@ static int ddebug_module_notify(struct notifier_block *self, unsigned long val,
 
 	switch (val) {
 	case MODULE_STATE_COMING:
-		ret = ddebug_add_module(&mod->dyndbg_info, mod->name);
+		mod->dyndbg_info.mod_name = mod->name;
+		ret = ddebug_add_module(&mod->dyndbg_info);
 		if (ret)
 			WARN(1, "Failed to allocate memory: dyndbg may not work properly.\n");
 		break;
@@ -1473,7 +1472,8 @@ static int __init dynamic_debug_init(void)
 			mod_ct++;
 			di.descs.len = mod_sites;
 			di.descs.start = iter_mod_start;
-			ret = ddebug_add_module(&di, modname);
+			di.mod_name = modname;
+			ret = ddebug_add_module(&di);
 			if (ret)
 				goto out_err;
 
@@ -1484,7 +1484,8 @@ static int __init dynamic_debug_init(void)
 	}
 	di.descs.len = mod_sites;
 	di.descs.start = iter_mod_start;
-	ret = ddebug_add_module(&di, modname);
+	di.mod_name = modname;
+	ret = ddebug_add_module(&di);
 	if (ret)
 		goto out_err;
 
-- 
2.50.1


