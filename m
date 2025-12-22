Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527EDD711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=saj8Myj0AXkSu5hKZJBWN47Kb5BefKCe0HbhKcuaxLQ=; b=V7kpbgICDJsEQNBs9ElfTwaUJr
	iQb0zgqJgSFQBq7QNsXX1il/spr1pCPumQkI8oXC4njJKbCVbZtQ+o72ZQ3FfIEVy5rvJCZG27fbK
	RbkssbQO03W7Jpw4mYAxI2qXF05M+aVGOJP/v9yGcEEvmiyEAr1yT/zzBThHsa7JnJb0P9JQ0vV5c
	G+FarBWmZZUvDurIKR9+P4QnNsxd7DDkaEvkQCuyhojQCaSZ0/X3OvmgHLjfiqlVYPGTkO9outJ29
	SmaCGLXMsUuECZBYNdpYOvxTUwVWD53vWL2WcEDVaWTmlpz2vrV1XlmBYWCOT91h+0of1Hnu77khy
	EBMS8+Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbDK-0000000DPpJ-3xSL;
	Mon, 22 Dec 2025 08:24:22 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbDF-0000000DPm1-1Yqg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:24:18 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso4172654b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391856; x=1766996656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saj8Myj0AXkSu5hKZJBWN47Kb5BefKCe0HbhKcuaxLQ=;
        b=Z/oVeL7+pdyandMj+JPgYJt64BTogp0LCJINBK9+UehjCFrt5vfDAyckQ103vZWgkx
         zN6CzLfmL9GZD6XDxvQlDEV8TWtRQ4FdE7iMn51902Bnh4HAQXC6jCfPj5jfx+nvylCC
         LXYpekhvOq8lsWg0f7vj47Gg/iQRj3FRNThtIDCX08Bt5UvpdWEUGx0kQxRDoQYK6NPH
         UkcpgDBWTBEN+Q00qsBhRkO5B7vyxw/NyDVJTgHIuoYt2HPQPsbYtpfjdRrOzFsVOE5Y
         QLU1TxKWG8jyQ+Tsu5w2HWAgZe3aXYO7bJECcS4m8SXOK4ygRTyECpkcAO8pVfIm6TpP
         hPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391856; x=1766996656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=saj8Myj0AXkSu5hKZJBWN47Kb5BefKCe0HbhKcuaxLQ=;
        b=eicGZzwC9AoQK78QR3plmLbNVNcwTgXyTB6C3yIP7cTFVm7ApujeEmKrkuMBkLFAqO
         K3Vv2glxA4PMnldGqoaKK1D99UoNeE4biyAv1IujkanH86JSu1SAbyZ62SaTwSI1MJlJ
         PItDT7E/qDLu4MdY5Gy4IY3XuVnlM+4PAO4HOpcNKfpAiYrQu8PpwgvOsLcNbNkoT/l3
         qRn1CUoeEK1dtPLisEpa+PUnhp2J7unwdWPTgvELwuOxCXkuyE1X2qwuYrfAZRMSBGWf
         +8ZPZrvZFwdnmosWmhaNAWEPGJRY4wGYbahlNyk2w4XYrKyg5VtJlnl8ldVnMZLsIcZn
         0a5w==
X-Forwarded-Encrypted: i=1; AJvYcCWyd3Q/MZT4+cd5duEhXL9dA5+T7U6ticxgQ1cBNDaOa6vXve7LJDJzH/aND+P8xucoAo7enI/aGEBh4pgYOr/n@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd2co1CBOXyVzphE4ho4L2eYHjxfiywewtCcXUy+gk8v6f8KTi
	/t9lkdy1HeohxuAVPlvURcGmjgZ5XaXv7xAVXnluOUnC774u+KywAv1e
X-Gm-Gg: AY/fxX4X3IkBxttCLRiC3/IbCtdTCTWbs1XsjkOYlUhnA7xerOVkUP7HKIhGxsWkwsR
	69Pfz+BcuJSReUkHM63sGKOtQEzk/iAtvUWD/3BxEYVUVLH7OL5Lqjc+6HIe8oECvd7c3jWeyLG
	/vuB6QVaWLJLjwUCabTswLda9fhBHj1IfHwKkImipf8rAaJFiX79DliS/l086rnaKxxBWUmhbNw
	7e1gy/zP4Wey6q5ExAOefCsChRcUrgly1WLRCOviRCrb+bzUybueZdy+Ufyu+AAG87ie8Z2RGZ3
	9auLYAf/j/6//TUDtwAVGayPrpQncPCVawFXsl7IBSmP/xiBQlJQ9IdbQCa1QVXPqb3B82RL8EQ
	VwLI4XRi8AORsivK8lTkSNDdSZxqoUBsO4m2AVc9PryfpDIpe75d0yRBtm6w+aLuCcOl771gGAH
	SeYaGj5nyt
X-Google-Smtp-Source: AGHT+IHhfCBl2Gb658Wb5nP4VimtUGUrU6/VY0t3P4zkMX/95OPPHKG9Ys2L2e1xsI+aRFKPN12sQg==
X-Received: by 2002:a05:6a20:9189:b0:366:14ac:8c6c with SMTP id adf61e73a8af0-376ab2e8f52mr9605414637.66.1766391856304;
        Mon, 22 Dec 2025 00:24:16 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:24:15 -0800 (PST)
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
Subject: [PATCH v7 16/31] dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
Date: Mon, 22 Dec 2025 21:20:33 +1300
Message-ID: <20251222082049.1782440-17-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002417_430774_747791A8 
X-CRM114-Status: GOOD (  18.52  )
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

The body of ddebug_attach_module_classes() is dominated by a
code-block that finds the contiguous subrange of classmaps matching on
modname, and saves it into the ddebug_table's info record.

Implement this block in a macro to accommodate different component
vectors in the "box" (as named in the for_subvec macro).  We will
reuse this macro shortly.

And hoist its invocation out of ddebug_attach_module_classes() up into
ddebug_add_module().  This moves the filtering step up closer to
dynamic_debug_init(), which already segments the builtin pr_debug
descriptors on their mod_name boundaries.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
reordered params to match kdoc
---
 lib/dynamic_debug.c | 57 ++++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c9377a444fc8..d668140794ac 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -170,8 +170,8 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 }
 
 static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							const char *class_string,
-							int *class_id)
+							 const char *class_string,
+							 int *class_id)
 {
 	struct _ddebug_class_map *map;
 	int i, idx;
@@ -1247,30 +1247,35 @@ static const struct proc_ops proc_fops = {
 
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
-	struct _ddebug_class_map *cm;
-	int i, nc = 0;
-
-	/*
-	 * Find this module's classmaps in a subrange/wholerange of
-	 * the builtin/modular classmap vector/section.  Save the start
-	 * and length of the subrange at its edges.
-	 */
-	for_subvec(i, cm, di, maps) {
-		if (!strcmp(cm->mod_name, dt->mod_name)) {
-			if (!nc) {
-				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
-				dt->info.maps.start = cm;
-			}
-			nc++;
-		}
-	}
-	if (nc) {
-		dt->info.maps.len = nc;
-		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
-	}
+	vpr_info("module:%s attached %d classes\n", dt->mod_name, dt->info.maps.len);
 }
 
+/*
+ * Walk the @_box->@_vec member, over @_vec.start[0..len], and find
+ * the contiguous subrange of elements matching on ->mod_name.  Copy
+ * the subrange into @_dst.  This depends on vars defd by caller.
+ *
+ * @_i:   caller provided counter var, init'd by macro
+ * @_sp:  cursor into @_vec.
+ * @_box: contains member named @_vec
+ * @_vec: member-name of a type with: .start .len fields.
+ * @_dst: an array-ref: to remember the module's subrange
+ */
+#define dd_mark_vector_subrange(_i, _sp, _box, _vec, _dst) ({		\
+	typeof(_dst) __dst = (_dst);					\
+	int __nc = 0;							\
+	for_subvec(_i, _sp, _box, _vec) {				\
+		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+			if (!__nc++)					\
+				(__dst)->info._vec.start = (_sp);	\
+		} else {						\
+			if (__nc)					\
+				break; /* end of consecutive matches */ \
+		}							\
+	}								\
+	(__dst)->info._vec.len = __nc;					\
+})
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1278,6 +1283,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
+	struct _ddebug_class_map *cm;
+	int i;
 
 	if (!di->descs.len)
 		return 0;
@@ -1300,6 +1307,8 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	INIT_LIST_HEAD(&dt->link);
 
+	dd_mark_vector_subrange(i, cm, di, maps, dt);
+
 	if (di->maps.len)
 		ddebug_attach_module_classes(dt, di);
 
-- 
2.52.0


