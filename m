Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E21C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JCLCVuCy1Iq9Gw35PtEgUXRGWUdACaICRLzJa5akkQ=; b=W54VbxHEn67uN4y1hnA396PeR+
	IWnLe/iIqwinMsJjIL2Y48mJ8ViKHO+KvByloLj4lQj5biNWhct1sSC8pUyPzoLnqkCqU75zOwHHY
	4H7IfgQ1LKzUaltEHOJrThb0FUBt0p+E4OWCcfhew9tfdDMtzcfcINl0GblQyey1WNe632OLyJxCE
	m+T2Ft8drpuJ//EO3qoqe4bGqnepaxlD97XiA5A1SzmwLzqcJo1lQIQpts4Pg31vparzldtIiCbp0
	7dob6rw40aAC7Pz518hCC3jhuhONTZyoX7yUrKtPAKNiPCrNvqrdye3yxUVov3wWPzEga5sZDxPg2
	PMSFMuKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQP6-00000008DQ6-0axO;
	Sun, 03 Aug 2025 04:33:00 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPs3-0000000886H-35jx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:58:52 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3e3e926fdeaso12248205ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193531; x=1754798331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JCLCVuCy1Iq9Gw35PtEgUXRGWUdACaICRLzJa5akkQ=;
        b=BXhKCyeqYTQzUW6sHGcN6GUMt2WMg0igADDM/3+J+mHKTrKqaF4Tr8YK1zXcDRUzoA
         ClEjV4t3UfvZHHuz0Szg2tZpL7ntH03d26m1dC73won2Ky0j0YKLT6owVY+UHrj/M3WK
         OeydrOOZ4AaiSFFI1sBvJOT87nJAYCHDdvfp3IZi4jI+Q975cpWOBnU54NvsXMXR47fE
         s/vmszK4vzw/Qz8UKQRVyOU16PaWJWo1yLxwkPowxW8b1DlvdNeJzrLRH67v3CJJw5O+
         jUyUnFksADZSW4lc05pHo2WIztzQ5DbhGNXNT9d4+xDmVb/LFFAv2ZE3rY8kpxKEssxH
         F5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193531; x=1754798331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JCLCVuCy1Iq9Gw35PtEgUXRGWUdACaICRLzJa5akkQ=;
        b=Z2EHFgdofA+Ndt2xAET3UQcuR7K9SvBaLe7RuP8CpArFatpP2Rt3M+moTJPAyrc9jR
         axO8fTN0XsBXrDI4DOo9LcJs3H3ukYuaFH7V1YGyalkOTRDEWl+anND7TsaQDLN8B0BM
         DMXKQlH1bw5F/663R5zSCyhCHuKEb/KsBlesZRE6eInu8dJsFXlfpjJMIXe4dmEOYLZh
         f5Qk5FZSIo/hVdo9L1gnG7avdl1bnJC/e+QeO1O0XPNK0TuasANAMOLRJZWkJyHnl8n+
         BkGk5E6RpWB/NH3dD6fTdD8MLjvvjxGfS72p3hqIESCk9GrMaHGo07nRjWpNEuyS4GLK
         QoBw==
X-Forwarded-Encrypted: i=1; AJvYcCV6MDnGgEQnj/+iOwe2tIiojD2u9ZRB7JNy5PonH6Ft0xl+QqcJaM1byLbFXaWcm3jQaa9ZSBjM9jHLR+bOopCD@lists.infradead.org
X-Gm-Message-State: AOJu0YxWJRA/Rq4NxdLi1KbK3uy7SOzUBrRdYg83XQBs+sKyYYOqHFda
	ujxbY4bQCa3VpxPG82a+s2S1mybMW5FytQOLVijfidMrXvEdsu8+dddID9DIRsF7a6Y=
X-Gm-Gg: ASbGncs3AgB8HNJPlYoXnUs7MSa4SbHaemD70TaC9FhsTYScMxAuQkp+IVxmaBwPfHX
	PRCFUNPpcP2BqOiPhmmj+ryDeY0mETXEIBwNJ/ZelMwSo24EyJ8X6IRWVyM7Gdtg0FX6GJyWKD5
	Xnxm6wJoBQxr1TabxzjgQ0fS2qVXfcdpIBtS/WqS55U4oUcVhpVq3m+ySWjCym/B6iFWOgcd+qc
	VL7xhX8YFz3Su9pNsQfjVCrlQLfgEkl3t4hQGFNF6mZnYESCpplR3BsosPqkYM5ajcdJt8AOVOm
	F3AOD89jp1M3ZLO2FMHhZGymQ8b9pl6pssY5O0jvcn+KFEvEXXxgRP0H1ebFue2lfpMXcnIcear
	+BQvrrmDwk6+QyoKr8c4RKW7TeV3Zzbikik1oJOFKOfPEPIJMUWXK8DxoktntNAoI7MFTxT2J5v
	QYjA==
X-Google-Smtp-Source: AGHT+IELdpv7uUZAZBrGCo6vRMKsduTbeRMcIYAoxynvAlTrmV87SOcUm0eDA5nlXTZa0W/xhKLP5A==
X-Received: by 2002:a92:cda6:0:b0:3e2:a8d7:cbc0 with SMTP id e9e14a558f8ab-3e41610d612mr96883205ab.2.1754193530845;
        Sat, 02 Aug 2025 20:58:50 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:50 -0700 (PDT)
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
Subject: [PATCH v4 12/58] dyndbg: macrofy a 2-index for-loop pattern
Date: Sat,  2 Aug 2025 21:57:30 -0600
Message-ID: <20250803035816.603405-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205851_784271_116C7D53 
X-CRM114-Status: GOOD (  14.10  )
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

dynamic-debug has several __sections, each with <vecname>,
num_<vecname>, and it iterates over these with a 2-index for-loop.
These loops are fiddly with the 2 names.

We have only 2 such loops now, but are getting more soon; lets
embed/abstract the fiddlyness in the for_subvec() macro, and avoid
repeating it going forward.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 283926530a43b..7c5a1ae2c0a65 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -128,6 +128,21 @@ do {								\
 #define v3pr_info(fmt, ...)	vnpr_info(3, fmt, ##__VA_ARGS__)
 #define v4pr_info(fmt, ...)	vnpr_info(4, fmt, ##__VA_ARGS__)
 
+
+/*
+ * simplify a repeated for-loop pattern walking N steps in a T _vec
+ * member inside a struct _box.  It expects int i and T *_sp to be
+ * declared in the caller.
+ * @_i:  caller provided counter.
+ * @_sp: cursor into _vec, to examine each item.
+ * @_box: ptr to a struct containing @_vec member
+ * @_vec: name of a sub-struct member in _box, with array-ref and length
+ */
+#define for_subvec(_i, _sp, _box, _vec)				       \
+	for ((_i) = 0, (_sp) = (_box)->_vec;			       \
+	     (_i) < (_box)->num_##_vec;				       \
+	     (_i)++, (_sp)++)
+
 static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 {
 	/* trim any trailing newlines */
@@ -155,7 +170,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1220,8 +1235,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
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
2.50.1


