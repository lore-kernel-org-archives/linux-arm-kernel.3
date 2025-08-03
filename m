Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDBCC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=On0sP/gRX6jcjl/izeb41d+iaYm4WT2VrxWSOrwNZ0U=; b=QijW4UEJ3Z32I27noC4U7QFlPb
	g+1fBEdBqbQaaZwYTTcVJ1atabFe46arFLaSOmJQJHX+JMI9UdsrpkQfcq/FPM1YTs2FL01eRYqs6
	+fDmlQl+X98Zn789jONLLMRRrZ5cVq5R8G+8oI+LV7MAbVOCBz1Eq8bm3RG/tw+Z56Y7X5MRs9HDH
	Mez5o46Ppk8f61Ek7teef+MP5/qGCwaAdqkehB9YQA+79tfU+ME/4oUaTUH7NuNeirjKgWCRTaEYy
	8hKg4d5Cya3AQynpGymkXh8W1fcTOfX3dXp7XuHjuUI2WPr5uu9EIOJ+ScbZznGa9Mi3PNQ9cyb+t
	4jqdKAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQUD-00000008EHk-3D4R;
	Sun, 03 Aug 2025 04:38:17 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPs6-0000000888W-3IGH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:58:56 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3e3f449fa6fso30579325ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193534; x=1754798334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=On0sP/gRX6jcjl/izeb41d+iaYm4WT2VrxWSOrwNZ0U=;
        b=avSB7smuG6nDwwcX9+VZMCJjU75qI9o1OABMrtX6SFPQtgnVcWgavv5rlVCTJlJymS
         jUg9gkUS8QZdw2mYoPquuDOfQR53rhINhW///aSUJEAiZDOTbrFVHIklwwLu2KMKp0ms
         Q9btpHyj7KLUXLzZAAT/fn4aJ2TepVs9emAqJ41xwR4EeIaCkSNUwyaW5GncnYCJSeug
         JXdeMtx9io3q0sG0+w4gG2S764FByWOw7cmVZYpECk8RCoLI9TfC6fTv9u/YptIx6eoO
         g52sRNyNL8/P5+P770Om7EG0bm2XaWyxflU5QkwEYB8L41C44mC/2U7lNGxDNwXJOy3x
         xxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193534; x=1754798334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=On0sP/gRX6jcjl/izeb41d+iaYm4WT2VrxWSOrwNZ0U=;
        b=gY06g8pMCjQQCcc2SdwCjx2ooCtF+mj6n9Gb42Yz2usVoXQqhRRryUBbwBTtYtus/C
         ZSykfQblpo7w6MFVablRljGpaDkDi54ZCpFHpbyJju4cCnqvLdfvQ/BSr8H11n6Q8Fsp
         HnuK1XeH+FJvoLNS7OzSrQw4D9pi2xV/CPC6qMk75CnW3jcc8nMPQ1ixx5kziAGmXS58
         h9/YGRFAiXVUdYr2imQd7c2bk4Si84kI47lmanh8vuPp4tWi4wRZbMErPxO8TMMgEdo/
         OYj3SJaHufjLpZoPLSKvDQKHQ7+0h8XkMKT3U1UrJsbmQwAJp94KUVyBGFYTOLhmvqhw
         rNow==
X-Forwarded-Encrypted: i=1; AJvYcCXxuohJRTBrXEgUHxIBUsv8DJukH7qARmmoM7m40IBJ38mVAKq/cZV5yh5coiwk66KdtA8M+IqBTCnXleLQA2Jf@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf8uIQ5Vuwd0RT0yvpKv0swo+5EF6B7WKarPGEgD+kE3fQz2Ql
	YHFHLMKT3lCydG/A1JuzvLDp5PtjnC+x4vg4USMo0c25PAwVM2BFohOD
X-Gm-Gg: ASbGncup0pZUNL1I5wB2JSo/CuU0kd4i95vK5Hu2DxIaep2x/aU0IdsVIXNcHGMEMme
	75za/4xrd1jpyFgjlMtuDKLW6xDUqb3gneJ0WdFUKISIWxRq709D0CqY5R2vIh6W8vuxBqPARvR
	PNoyfwHLnvnGNZP2cdOFqowcQr3GRWp8/oFofxSYqlJl83R4O+Snlo1c5VXTcOoKaEGLkQqrqoC
	57Xl+5NldGRLS5AGj/w4eLaBiy+Tn8R9G0z/4GPFCpDYftnN9ppYKUAyKgAUdaevd0ykVS6XR+P
	/YrFvDt0xmk6iNE2DFXcPUi/VJOVZSJ+TTdY9bG7nIEsCL39FDflpaJn3z5Zc4e+mFf2+cV3ipr
	JCu1JnhWbWAcwh2d8fdoTPnWvMXINOO9avDgkWMQ5hfCuFBjqKYJU2Z6is+mm7+cbonB7zwluWY
	Q/Pg==
X-Google-Smtp-Source: AGHT+IFH+mtyxnkEPDbV4MUz0swiDqyakmO8hLW0D4nl3KXQPrEDdogoDGroqUg609kTHFJlSLTDsA==
X-Received: by 2002:a05:6e02:e:b0:3e3:fd25:f6a with SMTP id e9e14a558f8ab-3e41618bf21mr94866305ab.11.1754193533929;
        Sat, 02 Aug 2025 20:58:53 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:53 -0700 (PDT)
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
Subject: [PATCH v4 14/58] dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
Date: Sat,  2 Aug 2025 21:57:32 -0600
Message-ID: <20250803035816.603405-15-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205854_841602_C106158B 
X-CRM114-Status: GOOD (  19.43  )
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
vectors in the "box" (as named in the for_subvec macro).

And hoist its invocation out of ddebug_attach_module_classes() up into
ddebug_add_module().  This moves the filtering step up closer to
dynamic_debug_init(), which effectively does the same for builtin
pr_debug descriptors; segmenting them into subranges by modname.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 56 ++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 24 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 53ce282554266..bbbdb8aba0716 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -161,8 +161,8 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 }
 
 static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							const char *class_string,
-							int *class_id)
+							 const char *class_string,
+							 int *class_id)
 {
 	struct _ddebug_class_map *map;
 	int i, idx;
@@ -1224,30 +1224,34 @@ static const struct proc_ops proc_fops = {
 
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
+ * @_vec: an array-ref, with: .start .len fields.
+ * @_dst: an array-ref: to remember the module's subrange
+ */
+#define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({		\
+	int nc = 0;							\
+	for_subvec(_i, _sp, _box, _vec) {				\
+		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+			if (!nc++)					\
+				(_dst)->info._vec.start = (_sp);	\
+		} else {						\
+			if (nc)						\
+				break; /* end of consecutive matches */ \
+		}							\
+	}								\
+	(_dst)->info._vec.len = nc;					\
+})
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1255,6 +1259,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
+	struct _ddebug_class_map *cm;
+	int i;
 
 	if (!di->descs.len)
 		return 0;
@@ -1277,6 +1283,8 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	INIT_LIST_HEAD(&dt->link);
 
+	dd_mark_vector_subrange(i, dt, cm, di, maps);
+
 	if (di->maps.len)
 		ddebug_attach_module_classes(dt, di);
 
-- 
2.50.1


