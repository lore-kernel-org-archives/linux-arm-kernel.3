Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03446C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w11iTWBqUyUmFQ/xlqpJdlubct7P9lvcZ8FTN2uj0dc=; b=vH9liHwfHzxsWUGuYc6ad3NXaF
	w9UqtWqXCAAkGV3AAV05sHzEshumPx9wGuDUpBWVk8llIfbJytsVkWa34w4T3jyPMoAiSVSGSuBx3
	1kUXOdmKOO227K5hO0cB19zrXPhAvyiyADOvFLatbnXlNL94gdglx9ySsnxsjy+6p14DGy2ftaEo8
	yLdYODzs9tQdToJxLJFE+Y5gaPub+ns15ed70WwKauzjaZexqluAqcIjlYCzzvMS2rh8dgbBUnt4Q
	zSjbOvwfq/8pSUXdovbyQ3x6JQMuC/VaKA3O4I3D+h8a1aKMvua5uwo4LL/ovUwlPb+dWC+Ay+lPI
	bGlxx77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQEp-00000008BpQ-26i2;
	Sun, 03 Aug 2025 04:22:23 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPrx-0000000882W-0ulA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:58:46 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3da73df6b6bso9002415ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193524; x=1754798324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w11iTWBqUyUmFQ/xlqpJdlubct7P9lvcZ8FTN2uj0dc=;
        b=fpfgc7OZx7sN+jdcNMlez0p/Kb/tZLcYu6I82BAjqTK09gMJ7ZiCeVFOm5wX1/H58Z
         Gqcdl3SNTlfuo7zvOlIsD5hzE5DUBM0YUHH0uU2fPGLJJnjSjJb9gtKoPKUSbAAjOnmm
         J9OilYrTmqjkH/Os/xtimZqkmT5lFDMO/3J2O59B7AU2dS/szC9jdbE5953HenI1in+x
         zOb4MkvGrGh1R3SUuBV1/JCaqY+YQHygPgFZpvZfxi7hUMo5jXygTfCpvM09DnX1RLQo
         M1aAJb342Kd58YmlYW1/1Y+PE1Xt2qyTz5F9KpQ5cadno6iEgMeigCB2MHoms/tNnWS4
         E47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193524; x=1754798324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w11iTWBqUyUmFQ/xlqpJdlubct7P9lvcZ8FTN2uj0dc=;
        b=nr4CJ6VKTguE9CnaVY7cGbQ2hsJOv1ORNyOObPNpzoQI8UfDYav8k2KMI/jnpu2JQP
         sLuuBkNM0ti9HO35j7zX7Lg1/epZtAxtdGsSUFJ/cYEKojhtrave/f/nrm95v00shG4H
         xGI8myOZG7GQVm2v/1GtsUFqOZ+nImGlIYxplhE821RguU5Lj9qR6NerN2qpM2graMd+
         h+7fWZ0yEziA9dyFsLPnieem+q6zD7XpOzQNSNFK2y6ydxldCGOM/2Yrk3J237rkBzeN
         B5ZK65oSZbh9SXopQO5FF1s/iilxqyjbikqYg67N+fOtvDNrCdbQoHvU4juEfNqxtS9r
         OLrw==
X-Forwarded-Encrypted: i=1; AJvYcCXzqCEIKydrI5HxlsV3HIxJEC4Ixd4HVPp2GglqXTLe/JEQN9xMQg0VcAdQ86fu7DeIPic3hlYoDGD3qDwWohbB@lists.infradead.org
X-Gm-Message-State: AOJu0YzKH3jvxgzIThj1bZ1sgd8NpsE4o+jK7TAU16zXLJ9lQcXnGPf5
	aIkSVUmcmBjWB6XFvH03Q6OI4qmwFbxkDx3FsHZC7d+A0jYy63W7Tq+c
X-Gm-Gg: ASbGnctAbAgaSvaT7sXIgKyBZPRx8Btf0Xdxr96AtwpTIGX2Gy75s4MoiXoVFa/GA3o
	1HIonXywKuow/PVOwpcSLd6Yknuz15EBMHb5Svys/u5VTAhHFhgQdf/6vroG21Q2TErMh5KBXXd
	hmLnXYcCWX6CECy7ArRz5SfbY68o5LRs14OGuKlgPPXxr0vpz3lyYMNmG6qqvLkICUQaiAFT/c5
	nr+a88INVdOh44HsrdRrW+hfRrFPlJEaUpQHI2+vjrvrNneKbaA2o2PbOjpx2gFruDDR7Yf9REL
	cbBaxCH6H9nbcm4ApAkxChIwWhvCOj/cWomMTrYoZlG34SMizDn8dozkpQSq3QT9OfYukNWY46Q
	CCnD0iltnmwtw544Bpb9Y44rg5aPQxpaMCkfY5yGDj2unZBIk7CJzOI+cAj67+9Z3DlnJoosTWq
	e+DDoKPoNpGhxg
X-Google-Smtp-Source: AGHT+IGMOals5COhIioa7WIuP+hDvHPdqL2k/g/lRnDo5cgFfZ32l9pYAvRqMJUqo71V4g8mlLwHfg==
X-Received: by 2002:a05:6e02:370d:b0:3e4:17c1:3fdb with SMTP id e9e14a558f8ab-3e417c142cfmr83851035ab.0.1754193524519;
        Sat, 02 Aug 2025 20:58:44 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:44 -0700 (PDT)
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
Subject: [PATCH v4 08/58] dyndbg: reduce verbose/debug clutter
Date: Sat,  2 Aug 2025 21:57:26 -0600
Message-ID: <20250803035816.603405-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205845_265283_A908AEA2 
X-CRM114-Status: GOOD (  14.15  )
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

currently, for verbose=3, these are logged (blank lines for clarity):

 dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"

 dyndbg: op='+'
 dyndbg: flags=0x1
 dyndbg: *flagsp=0x1 *maskp=0xffffffff

 dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: no matches for query
 dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: processed 1 queries, with 0 matches, 0 errs

That is excessive, so this patch:
 - shrinks 3 lines of 2nd stanza to single line
 - drops 1st 2 lines of 3rd stanza
   3rd line is like 1st, with result, not procedure.
   2nd line is just status, retold in 4th, with more info.

New output:

 dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"
 dyndbg: op='+' flags=0x1 *flagsp=0x1 *maskp=0xffffffff
 dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: processed 1 queries, with 0 matches, 0 errs

Also reduce verbose=3 messages in ddebug_add_module

When modprobing a module, dyndbg currently logs/says "add-module", and
then "skipping" if the module has no prdbgs.  Instead just check 1st
and return quietly.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
-v2 squash several verbose cleanups together
---
 lib/dynamic_debug.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 2751056a5240d..d9268d051a106 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -264,9 +264,6 @@ static int ddebug_change(const struct ddebug_query *query,
 	}
 	mutex_unlock(&ddebug_lock);
 
-	if (!nfound && verbose)
-		pr_info("no matches for query\n");
-
 	return nfound;
 }
 
@@ -499,7 +496,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -513,7 +509,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -529,7 +524,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -539,7 +534,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
 #define MAXWORDS 9
-	int nwords, nfound;
+	int nwords;
 	char *words[MAXWORDS];
 
 	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
@@ -557,10 +552,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 		return -EINVAL;
 	}
 	/* actually go and implement the change */
-	nfound = ddebug_change(&query, &modifiers);
-	vpr_info_dq(&query, nfound ? "applied" : "no-match");
-
-	return nfound;
+	return ddebug_change(&query, &modifiers);
 }
 
 /* handle multiple queries in query string, continue on error, return
@@ -1234,11 +1226,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
 
-	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
-	if (!di->num_descs) {
-		v3pr_info(" skip %s\n", modname);
+	if (!di->num_descs)
 		return 0;
-	}
+
+	v3pr_info("add-module: %s %d sites\n", modname, di->num_descs);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-- 
2.50.1


