Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2268E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kB9XGvfi6ObodyigSZBf40IoYnb1xkrL/FFwh/sfSnM=; b=YBgYD4Q3s0djFDohfh15j0XvAr
	yA2JbSpR2GCla/gm0n7RCvFs9NfL3hWr/CnmQhcEwlcBSay5QSirmd+TBlqmdnu68OHgIbca2kl+b
	ZZt0XIFbD/putCESpu0uGrMwsT/SbR9Z+S1OlMaeqAB9mFJiUfZxsYdr9uGs3CwTB1QWYYqHhJUgj
	mqbSmM1E7/+f+2nwmGr8CYGLwruxffJmfZW745CJ1CkbDXSq3OeoqJ11MidG0sFwKdYUzIdGd6krd
	caulm//G0JdEAi85HhTIkHfUhkeoVLtJyydWedXLMCbeNZXBtr8lUyfh8zQi4SHwUAjOn79nyx1bZ
	EX3igCIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbCE-0000000DPDN-1VGG;
	Mon, 22 Dec 2025 08:23:14 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbCB-0000000DPAS-3Nzt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:23:13 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7f121c00dedso5006854b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391791; x=1766996591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kB9XGvfi6ObodyigSZBf40IoYnb1xkrL/FFwh/sfSnM=;
        b=gopuVndufTrk7R3Wb36K1Xc/qFlMHFvNqjxJYDtoNnmnOfyBPh3ZJpRYBE+wqJBHn/
         6mEumurejfcPWhnXbCZfV2WLHblAN+hdxx9rp2bUc6zoZvfKAroMbV7QFQo4WGhuO5zc
         mvOuscInzG7Of3LLWErBmNSPThRyXIxBe9nwd8ZB31SYFbzXoIyyyfHAkIHWcaFvkXx/
         qr8YCm3eC2KydRwcrvrHmWBjYWyaPi1DSV7xEqn47LWqttw9ZWslQ/Hh6o2/bSIcSxd5
         +w5S3VdqjKbzqyZQV5pVMGvxYWqwxc1dedQ8xTskj9pWEwd991HamXD42rv7sjOVg5CH
         Jwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391791; x=1766996591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kB9XGvfi6ObodyigSZBf40IoYnb1xkrL/FFwh/sfSnM=;
        b=phGTfto1QYkD+dEJFIkumSKrCoJbQMCDlMGMJtRvuhwxNJ1MQP1qUZJ++W4AAksWB6
         yW6btDlR1LqUKRTVo6XlP6+KFnrh3Dj1KiJfCdkP5T/fGdVsbFFn4fQgXQGZqSwXHzFm
         2IzPYMTZOqdzyYIBJH98OogqZAwgUGoMHFJIrRkOOiUhL+t1ehdsQ/JiLUWlMPBT31lj
         Esz8uDLyUh4Icccks1xqOX3Jygtev0JeTDV3iB/5usWp2Hv7QrpdgbCB8a1bbgcl75tG
         enI56IsvhjtrxdmTOBcyuncaThuyxJQqu5tyPxbKIHy47ubbEY/7/wf4gWxEK+Ps9zCb
         Axdg==
X-Forwarded-Encrypted: i=1; AJvYcCXkT1YwdNvGcBIfdxg2owSARwDnxOqEdGTGCWvqClOfVM+FoHs3XmMlH/DKQlrcILl4Xg7IPAVvK27gX4zR/noh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw67dsd/utBrb13tiqSPowd2e/EmLC5X5kmdQ9HIw3Vg6I6DOYr
	Tq/mdO6xWhX2VOEGISqqYe3adFi234O4Lb33FB7M9tZgkNyCI1pq6IEZ
X-Gm-Gg: AY/fxX7WHBmKBhj2BIEzMXE3GQt5aX5jxcbZ9vJkfAJsK+MRNepmF+f6YiNJHuna/X0
	7O5hISUl4bu+L6rsZCI7BTvuQuDa3lJfmVC9UiThv4ELzCut9XJA96vZi75JXX7eKuiMeurG7Eq
	rP0WjeWfUt2B2rWxkD0PAyZ13c9ePK0k4bnYYh4ATLbcMClPC1FzDUM+/vp9fvLtOJ5lkxC4S2L
	mG/QZ+4CPcQ6zmADX7WY6pI6Q5ISymlJQ/vv0We2BLfcSepT77aGhs/q5oe+RPA3MUOTN024kQQ
	q6fsBq08Bf6UuL3s3HtKAv7RP+tDfffH0c0MO4UwRN3jjkhDXGamUaiGJt0oApB3bzUlcPBVUVW
	cHXykayWdgUM6yqAF3qbnsL5CSeLdREbkjv3qB+ysSA+QF0huim32BFOLcvnrRgJGHV3v35EYGY
	ltOTKODyvg
X-Google-Smtp-Source: AGHT+IGznpKTz6ixXv+s26nHooFtLIG4Ke1AWMjy0/WKJaDBXTq6iXxKo6TPfotRdJtMkjnB8IbN1A==
X-Received: by 2002:a05:6a20:b905:b0:366:14b0:1a3b with SMTP id adf61e73a8af0-376ab2e4dd1mr7445280637.73.1766391790723;
        Mon, 22 Dec 2025 00:23:10 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:23:10 -0800 (PST)
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
Subject: [PATCH v7 10/31] dyndbg: reduce verbose/debug clutter
Date: Mon, 22 Dec 2025 21:20:27 +1300
Message-ID: <20251222082049.1782440-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002311_890321_FDD4F6E3 
X-CRM114-Status: GOOD (  14.02  )
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 21c1db7e8705..1db2f627237a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -275,9 +275,6 @@ static int ddebug_change(const struct ddebug_query *query,
 	}
 	mutex_unlock(&ddebug_lock);
 
-	if (!nfound && verbose)
-		pr_info("no matches for query\n");
-
 	return nfound;
 }
 
@@ -510,7 +507,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -524,7 +520,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -540,7 +535,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -550,7 +545,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
 #define MAXWORDS 9
-	int nwords, nfound;
+	int nwords;
 	char *words[MAXWORDS];
 
 	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
@@ -568,10 +563,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
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
@@ -1245,11 +1237,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
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
2.52.0


