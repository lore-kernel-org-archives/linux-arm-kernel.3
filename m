Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B76D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8i2B8ufAHD9sSahBAZkEx2yO1Ly/YjHLa83EmimubvQ=; b=uPEAkHCRDQFJR3bMqI4J95xCqb
	8qIfpoLWheRwYVpwCOpeAAmR1uWTXuxm4ETICSSmLFiNUp4G5CZSnv2fIRDiuAbdTn+Z6/gPkhhlV
	W/xx0SONtE+fFnt5nSyCJ6ALMMXSopvKG8Bp5MRbVXZJiX31fAfTGEu8DYiZYnD85fwPtfzHvclnD
	gDCQJZXtKdH2MP0C7ynytAJRjGh1r1qd1f7wXguNcRBvfw6CHHmze0qTKQ5Vw4c5aXCILMiOd4XzR
	1Pw8gZwzVDBqyYe8Cn0kt1vTTG1Ln1wRcysc0GjbnGq9hN9XrLh6qetBCUD76I/nTzJosJ8J2cQOp
	q8yOvbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbAS-0000000DOfp-1Twv;
	Mon, 22 Dec 2025 08:21:24 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbAP-0000000DOfT-1YUK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:21:22 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso4175402b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391680; x=1766996480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8i2B8ufAHD9sSahBAZkEx2yO1Ly/YjHLa83EmimubvQ=;
        b=cnte+zd7VtrmCiq/5kcl5QecGUj1gU5QiG0gu6UN2U98PHmAeUbyEBrUIiApjiZmo+
         r1cdri+Wve1k4Azzu8YrLZebc6N2lMaCpEffiHEjXL13qfrtomyYAXdWwMIaX4MyOw+K
         GjaulXs+K2Um0vo9EBPlTcX2e0izr4vicPLQfIr6M95EJfWVnMuLhpkvO7+6K9En5Wpe
         itvpIu5R8z+EqgfNZppeLsWOw+tG5V2G8Z70A4ZOszXj96hoYYJSCVxUG7vC88x+T1ME
         4+Y+mrIUxVxPVPtR5FVm+3bSORhYW9sEk72zPzJgQD8qyms5MoLH5ecaGnXHt1KkieGo
         +Utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391680; x=1766996480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8i2B8ufAHD9sSahBAZkEx2yO1Ly/YjHLa83EmimubvQ=;
        b=JumJugY4hDADPAzH50gxP2kQ2mFVlSBi554gQrYDCNcik/KXTbRzSX/cw70XW76dp2
         ixyzYV0N+756qd9iNEM46U8W3NKQ9jX97pxkoM96U0d0gN/Jiqz35SMF1F7uECTAtJpt
         uPDuuWlVSZO0ljbjB7FKRhUviGIjMR3YUCYnuchrdrnMsa2liq0SCJ5mbO1SNmNA3uvs
         fAqKbkyTOFs085t4FeFVByEEz38gsxav1hUQRl6VNYW6kymYZ3XRNhMfXox3L3u52qj0
         kYphkqaionvkJgEFg+FTWtA6oDEGQ62rWf0BO/g4iUcifa+JpREUd0dxV8Aemyf9YsTK
         wbRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGK0/1uaFkIKZZQGQlE3ASmRYS3OOWjzktnU1RD6bFeELFMIZzm+OTCVEoQ400SKbVi8BTABkrVha0MTgoHz1s@lists.infradead.org
X-Gm-Message-State: AOJu0YzXXeUXWnq7ODUEp8GNgWIddsLV5Xdw1zLUEEokt8h4SwdqOKk3
	9UJzzBO0qWn/ARnnNDzZA45x6RVrrBqdIoAfwGE9otQjq5AJH6O9DvtU
X-Gm-Gg: AY/fxX5NjbzYEe9AlhQSOrYioJnokMzhulNRu+2n+z66C1emAW+JlUSrUCdIopvsstD
	SH2dc4mnMUD4n3+CktoXuYrOGyG5+t7s9gNRE9fwJnwj9tApPtxV5gsu7CFSrZPx+qUxn1IIV/4
	eJg7TWIo/MJwT2L+j2nIEbkrqNJF4fiX9gBkKhY/gMRwDvThCOSsd/cD0aAMFZOUhbooP4JdTdf
	Rd3c3xsBEkdlWJaWy+XceQRnhmFJu7D5Nw2Ureyc7qdZyb/MVyvCM35GB69RQ5QwMKxNjgZEzyK
	9K7TSZk1RQDUNzh3tVf6pbMFG4RtgQXB/mnzARZ+aDmzFqVcDV39Ao3cKDDsYMG0wkPrsnvfQtY
	nN2nzIetqsG+a/XrxzEze44ozJXP1nbGk4XqnzkGH/Qs33xyqTgzZXnWFxbLZSDsmWDcCz1UYnw
	UDsrabZOYTIf4nw5oxxY4=
X-Google-Smtp-Source: AGHT+IG7yTX9GcAzuJxjdZol8GNeVjpWx8TpHrMGtTszznm0lKmDxk6yQdOE7nvJLCN2Ii7oDSHoog==
X-Received: by 2002:a05:6a00:4295:b0:781:17fb:d3ca with SMTP id d2e1a72fcca58-7ff648e71c8mr8607801b3a.15.1766391679935;
        Mon, 22 Dec 2025 00:21:19 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:21:19 -0800 (PST)
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
Subject: [PATCH v7 02/31] dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
Date: Mon, 22 Dec 2025 21:20:19 +1300
Message-ID: <20251222082049.1782440-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002121_815284_7114B4A5 
X-CRM114-Status: GOOD (  12.43  )
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

Add the stub macro for !DYNAMIC_DEBUG builds, after moving the
original macro-defn down under the big ifdef.  Do it now so future
changes have a cleaner starting point.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 43 ++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ff44ec346162..98a36e2f94b6 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -92,27 +92,6 @@ struct ddebug_class_map {
 	enum class_map_type map_type;
 };
 
-/**
- * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
- * @_var:   a struct ddebug_class_map, passed to module_param_cb
- * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
- * @_base:  offset of 1st class-name. splits .class_id space
- * @classes: class-names used to control class'd prdbgs
- */
-#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
-	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
-	static struct ddebug_class_map __aligned(8) __used		\
-		__section("__dyndbg_classes") _var = {			\
-		.mod = THIS_MODULE,					\
-		.mod_name = KBUILD_MODNAME,				\
-		.base = _base,						\
-		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
-		.class_names = _var##_classnames,			\
-	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
-
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
 	struct _ddebug *descs;
@@ -137,6 +116,27 @@ struct ddebug_class_param {
 #if defined(CONFIG_DYNAMIC_DEBUG) || \
 	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
 
+/**
+ * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
+ * @_var:   a struct ddebug_class_map, passed to module_param_cb
+ * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
+ * @_base:  offset of 1st class-name. splits .class_id space
+ * @classes: class-names used to control class'd prdbgs
+ */
+#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
+	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	static struct ddebug_class_map __aligned(8) __used		\
+		__section("__dyndbg_classes") _var = {			\
+		.mod = THIS_MODULE,					\
+		.mod_name = KBUILD_MODNAME,				\
+		.base = _base,						\
+		.map_type = _maptype,					\
+		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.class_names = _var##_classnames,			\
+	}
+#define NUM_TYPE_ARGS(eltype, ...)				\
+	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
+
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
 
@@ -303,6 +303,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
 #define DYNAMIC_DEBUG_BRANCH(descriptor) false
+#define DECLARE_DYNDBG_CLASSMAP(...)
 
 #define dynamic_pr_debug(fmt, ...)					\
 	no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
-- 
2.52.0


