Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3920D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxdE6+GTYqwM0IzjlMegZ9h6k5RpMRRS5FRcIzbLHHk=; b=qbKD8i/sMYnNqC30JSoWbB/bKP
	KvfuACpGT7C2k6kdbgIYj30MgonQzJXhZ/ZRX6k/gT1VS5clAbG/ToZeon1wFkW5bogzRR+e2xTTN
	UepaJTgLUBFBAdLonGAeBRKVvU7h++uFkRJzb1JzgAj0KQCJdILsmQJJiflitAHjUP0pOVcx6eWr8
	Fv9nZqJ2AK8PeVFabJgKyedosfU7Pg+wsFfWtzjK7n4P2h8aYGAfQMgoEvUAu5BILQFqGMomQx2GV
	M7vAxUrBc2+hqfEBmkeU4hGQl7iAqzDYJ0eD2VrkMSfWJDijKJBXSis9prjDwWouB+rcJIkqeMHVt
	j2L5GVyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbD1-0000000DPci-1WXd;
	Mon, 22 Dec 2025 08:24:03 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbCt-0000000DPZ3-3cHZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:23:59 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7f0db5700b2so3372679b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391835; x=1766996635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxdE6+GTYqwM0IzjlMegZ9h6k5RpMRRS5FRcIzbLHHk=;
        b=cp5byuIys+1xV1coRlG/lWouQRDmnmgLvi2PLRA+NTDeWPxwePCYMEiWH6q+tPGE8R
         GTrQgfw2dssjjvtpV9Zci51csz5zFUOhToUyYTGY1FHAioH0I7MTMQK1dyeijgzNZ/s9
         GMfLPXgy/uDyrRrXZFcvNzJkyP1Kb8M1NHwHmZSYlAzwUkULesvISuj7SwfATdJe4jdW
         bQ/K2QqzD3aGBxNkj9OdcJOtdCOxATy6J4jO7KtPk65PyYXCPXuPLDRuSswAAYpjYJcQ
         uxawsf+V5BOyEBl2vNS1beFIWYiLqb69P0l9HAoA6WLaTIgP/p4qRYhodK5YIVG55207
         4PSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391835; x=1766996635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BxdE6+GTYqwM0IzjlMegZ9h6k5RpMRRS5FRcIzbLHHk=;
        b=L+BMgX0xtaVJMq0HxpVT9DbNe+QUAsE24YbVbLol9VkDmw9WTDJ3/RKiQR7JV78Jgq
         6EeHy3iObiS3fbFmNcg/5/yBBDxqecSz3bY+iu22GCd/R9/TcQU+aq5Xx4RD/0F5gGmy
         YbqdG28Pf2kVqXNBGWirSyEFPVsUHON+dDXYnmD7M4/VbS02+oAfEPBiBvDF5tXXLr30
         6BYz5HpryxG7i9mKqurK0+h9SKf8nISE+h6Ev4StMw7Uu9vrq0XCsOsj+FzxAGu6NiFQ
         5XjGQd/SbdzXadTthYWYbaRlaI7wPCA8804fyNjJQkqxn859Hp7qVziJBdZtMP2OWHz/
         a8yg==
X-Forwarded-Encrypted: i=1; AJvYcCWW/fSBMpAQ4kpY1xusQ7xf77v4urJk9eaQOymnME/xCcWwM8qFqHtulzc4Oyy52aGrTiRZaiBUIAmY0e5olXxG@lists.infradead.org
X-Gm-Message-State: AOJu0YwvYxXw+aIHCbrH1ntD7WxzwMAEen3cME7yj423LNx20MlY+Gr5
	17gjdSw92jOrU/VMDHxJJuSoMgv9LlYN7NQxtrVoz8v3JY2aFJCXMp01
X-Gm-Gg: AY/fxX7uPwA9zUOxUEvLCOlvRP4xbWVGO1ENdfnY7yDP3KH4mMrkYGwMmOD1IgfGhwL
	XLakxmAh9cTw3C4Nk7GfE1isrfk9gjSAW47bqvJTJRYVDRacg66PupyPT0UxPU2SKzkfxAsc/K7
	j9AlwHVC8FFIr/0BZ7o8grJiqnYZbbCe2O3T4hyLkMElBO79/1QlLc5/VjesXmpenTbk1gSkgdG
	/CkjyafNqeQxNWpZfyBldgLqP+ZYu1cGw0gPa90ByGQdxSd1M8PVtXJLl743+9AsbeoQ3XFY2Nz
	j2Og5qDgHezGaVOznDiL1ME+xR96JY5bTrR+iEjsq+oJSJZsp0Fnmi3C/piO1a8Xt0AI/NQ/p/u
	5TCl2Pr383X5FJ1DgicwAD2WcKiS5R5yo096EQJWxEi8oBIvZXystJ5KiimZ9KFuL6+EyS8y2kg
	vPEEhMPFLC
X-Google-Smtp-Source: AGHT+IG3YmZUn1fIw8AIHp6/BoEQn6TWZyV7OX1XFc8bda2F0fMuKJyfzHy5p7UhK8SexT3coe1cvg==
X-Received: by 2002:a05:6a00:302a:b0:7a2:7458:7fc8 with SMTP id d2e1a72fcca58-7ff6421511amr9110070b3a.13.1766391834813;
        Mon, 22 Dec 2025 00:23:54 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:23:54 -0800 (PST)
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
Subject: [PATCH v7 14/31] dyndbg: macrofy a 2-index for-loop pattern
Date: Mon, 22 Dec 2025 21:20:31 +1300
Message-ID: <20251222082049.1782440-15-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002357_872780_2F833F8C 
X-CRM114-Status: GOOD (  16.16  )
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

dynamic-debug currently has 2 __sections (__dyndbg, __dyndb_classes),
struct _ddebug_info keeps track of them both, with 2 members each:
_vec and _vec#_len.

We need to loop over these sections, with index and record pointer,
making ref to both _vec and _vec_len.  This is already fiddly and
error-prone, and will get worse as we add a 3rd section.

Lets instead embed/abstract the fiddly-ness in the `for_subvec()`
macro, and avoid repeating it going forward.

This is a for-loop macro expander, so it syntactically expects to
precede either a single statement or a { block } of them, and the
usual typeof or do-while-0 tricks are unavailable to fix the
multiple-expansion warning.

The macro needs a lot from its caller: it needs 2 local vars, 1 of
which is a ref to a contained struct with named members.  To support
these requirements, add:

1. __ASSERT_IS_LVALUE(_X):
   ie: ((void)sizeof((void)0, &(x)))

2. __ASSERT_HAS_VEC_MEMBERS(_X, _Y):
   compile-time check that the _Y "vector" exists
   ie: _X->_Y and _X->num##_Y are lvalues.

The for_subvec() macro then invokes these before the for-loop itself;
they disappear at runtime.  They do cause a "complex macro" CHECK from
checkpatch --strict.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e882e951d585..94d05d09a128 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -128,6 +128,28 @@ do {								\
 #define v3pr_info(fmt, ...)	vnpr_info(3, fmt, ##__VA_ARGS__)
 #define v4pr_info(fmt, ...)	vnpr_info(4, fmt, ##__VA_ARGS__)
 
+/*
+ * simplify a repeated for-loop pattern walking N steps in a T _vec
+ * member inside a struct _box.  It expects int i and T *_sp to be
+ * declared in the caller.
+ * @_i:  caller provided counter.
+ * @_sp: cursor into _vec, to examine each item.
+ * @_box: ptr to a struct containing @_vec member
+ * @_vec: name of a member in @_box
+ */
+#define __ASSERT_IS_LVALUE(x) ((void)sizeof((void)0, &(x)))
+#define __ASSERT_HAS_VEC_MEMBER(_box, _vec) ({	\
+	(void)sizeof((_box)->_vec);		\
+	(void)sizeof((_box)->num_##_vec);	\
+})
+#define for_subvec(_i, _sp, _box, _vec)			\
+	__ASSERT_IS_LVALUE(_i);				\
+	__ASSERT_IS_LVALUE(_sp);			\
+	__ASSERT_HAS_VEC_MEMBER(_box, _vec);		\
+	for ((_i) = 0, (_sp) = (_box)->_vec;		\
+	     (_i) < (_box)->num_##_vec;			\
+	     (_i)++, (_sp)++)
+
 static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 {
 	/* trim any trailing newlines */
@@ -155,7 +177,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1231,8 +1253,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	 * the builtin/modular classmap vector/section.  Save the start
 	 * and length of the subrange at its edges.
 	 */
-	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
-
+	for_subvec(i, cm, di, classes) {
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			if (!nc) {
 				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-- 
2.52.0


