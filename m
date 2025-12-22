Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77ED2D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JUGCGjJm2Xj6X5n/nhoMCGHMBetXjpQki6LB/h6PNI=; b=gY2L5gN/eS8E+K/Doahdf3z3ZK
	F+NXES5VhuGuSth5URuXiLhYsRw/SoB7M9tHkhZ9sc9QfFqm111fBiTmYJd1+d87LIvTUr2toyG9A
	WmCYoEE5j8cJsvkOqID+51M/76tOqIL5X8e1WFEvGVzHV4+BkYLtbMg9LrOYfH4klJJjgCpIreDeB
	GRS6aUkcg5krt5Hpk/dVyNQTTB8cx3bEfRMYC6OkVsUOrjnqajOXDdCqNOEBrFrIqgPWaOxTAW9ph
	5C+byjSekC8UbwrVax4lNIxu7RbyGa8JjptuShR0qB8U75eYCH6E+NFLQ3/SUdnV6RV1IBYalWoWn
	akROG8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbIK-0000000DRfk-2VkD;
	Mon, 22 Dec 2025 08:29:32 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbII-0000000DRef-0yzN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:29:31 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so4456350b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766392169; x=1766996969; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JUGCGjJm2Xj6X5n/nhoMCGHMBetXjpQki6LB/h6PNI=;
        b=nJwwlI3QR57OKsJpdFxJd1Wjk3cOLzQtNH/KVgNkzBDD5mmd+VOpcxadaqlmul5Zh+
         B6rEKSEVOlvqwFhd6pdNWf9R3KgFhbjsYqYQC2JvNJm08IpC+ZKM5MfoB3yCjLTrIV5d
         1y81ofsOIhR/CL8Zo+IT8yEyDk+DwTcQMJU+8u+ey1zgw11uvP20veh31kjJjU2P26wS
         6wl3WzZvr5NL9PtfX8xMkNrV+mvmvBbBN4rzdWcDc8bYsEfJ9zyZSTI/SbJ9ch8AuBf1
         7KkZBajEd3u4GGA7KCjLNcsSiy+AJjHWUo9QVdjABBWxlO3dca1M8EB+kW2KtOmJE6AV
         /rjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392169; x=1766996969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6JUGCGjJm2Xj6X5n/nhoMCGHMBetXjpQki6LB/h6PNI=;
        b=nRSJIV3wcmgk5gwfo4llWfmQyCS/xmH9ef27i3EBZN5BcmnZDjBrTR3ZaeujdZdScI
         rosQOHNy+Tfz1nS09j47Qk3uWgw3er/J0wGbhYBBhF8tR7a/ACnimCknHO/eccCxo/ga
         KOhuEtBFEXCELk/uwCLsWtK+Rbo2T/Z3i/J1lwTtORqkSaovhAZZeNqiYB1DJHITl/ty
         yRe+/rjzXtcp1d6xH7jGAObvj6U/7UE5waZm0v1jnj9z4WCOtaQtAFHQu+1nXpJOE/Hd
         +DxIyJiCOl//oUmfRgYnNupJsbAPK/8NXUS1xqESeLfUdM+/hD3tMDUALOW+QzDW7Pyj
         mT6g==
X-Forwarded-Encrypted: i=1; AJvYcCWFpnC4zhabZJpapifftuDzY5SGlwvba3+Jg5cCFHiPMBfTIvR3/CdoaSPnaoYePe4c7CiijBKS3C0pqXTKenXK@lists.infradead.org
X-Gm-Message-State: AOJu0YxN2uESQj3Cf5PlHKt+jI3UUZNITZDvu7srSu1meXg6zal0g1kg
	S09+kL1rqAqHQ6cRoPEmAJtK2xdE4Hu7pyqg/2xyXIsOl9xKv6YlOSAl
X-Gm-Gg: AY/fxX7M3kI1uVzFEaEW8MjskS7m1JhTkUFBl+iHJvdHE+WJXpI88+YRmyjWTLDAsnw
	RVFXuliMbLpYjBNq7Myjz9kSTAwSoxxVIk65Y59ayBH9eK2xwW2A7Tr4b5E4epaLbNzfNPAOi9F
	LD3RRmnl1CtxdzlQEqWKiM6nvnxligKRytnSByxG0DLJHXD2TVH27riBbINIh2bEnabvasnfjZM
	EJuy37Egr0n87UY3y4veeScXibqBppZiJuVncjURaftlOaGlVMp8lLBLzjNbe4JNQa+rx4xgkNb
	jZMcx1uqjChPG2PLF5IN9l3I4cMFFOiDLjl7TKl7J4w6LnmHbAZfrDQQpLepCLF7d6RYD3r77hQ
	CxSqsL5JMovsa3RGZjIC8NVFdKAzeCuKR3ENVT1rLBsVRjvGPKYME4gMwV6MZtHsfimYkkkdlXM
	pDAR8OpZO1
X-Google-Smtp-Source: AGHT+IEimmJ/Dttom6F34YWsdHH3XKVu5FJm4MVosU3HZTEdHiOovrYFxoO5oyh48i40FCdqR5InOQ==
X-Received: by 2002:a05:6a00:aa82:b0:7a9:c21a:55b4 with SMTP id d2e1a72fcca58-7ff657a6a53mr9194464b3a.28.1766392169447;
        Mon, 22 Dec 2025 00:29:29 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7af29dcfsm9640064b3a.17.2025.12.22.00.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:29:29 -0800 (PST)
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
Subject: [PATCH v7 01/31] dyndbg: factor ddebug_match_desc out from ddebug_change
Date: Mon, 22 Dec 2025 21:28:13 +1300
Message-ID: <20251222082843.1816701-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082843.1816701-1-jim.cromie@gmail.com>
References: <20251222082843.1816701-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002930_331946_70535E5B 
X-CRM114-Status: GOOD (  18.56  )
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

ddebug_change() is a big (~100 lines) function with a nested for loop.

The outer loop walks the per-module ddebug_tables list, and does
module stuff: it filters on a query's "module FOO*" and "class BAR",
failures here skip the entire inner loop.

The inner loop (60 lines) scans a module's descriptors.  It starts
with a long block of filters on function, line, format, and the
validated "BAR" class (or the legacy/_DPRINTK_CLASS_DFLT).

These filters "continue" past pr_debugs that don't match the query
criteria, before it falls through the code below that counts matches,
then adjusts the flags and static-keys.  This is unnecessarily hard to
think about.

So move the per-descriptor filter-block into a boolean function:
ddebug_match_desc(desc), and change each "continue" to "return false".
This puts a clear interface in place, so any future changes are either
inside, outside, or across this interface.

also fix checkpatch complaints about spaces and braces.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 83 +++++++++++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 36 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5a007952f7f2..eb5146bcfaca 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -171,6 +171,52 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
  * callsites, normally the same as number of changes.  If verbose,
  * logs the changes.  Takes ddebug_lock.
  */
+static bool ddebug_match_desc(const struct ddebug_query *query,
+			      struct _ddebug *dp,
+			      int valid_class)
+{
+	/* match site against query-class */
+	if (dp->class_id != valid_class)
+		return false;
+
+	/* match against the source filename */
+	if (query->filename &&
+	    !match_wildcard(query->filename, dp->filename) &&
+	    !match_wildcard(query->filename,
+			    kbasename(dp->filename)) &&
+	    !match_wildcard(query->filename,
+			    trim_prefix(dp->filename)))
+		return false;
+
+	/* match against the function */
+	if (query->function &&
+	    !match_wildcard(query->function, dp->function))
+		return false;
+
+	/* match against the format */
+	if (query->format) {
+		if (*query->format == '^') {
+			char *p;
+			/* anchored search. match must be at beginning */
+			p = strstr(dp->format, query->format + 1);
+			if (p != dp->format)
+				return false;
+		} else if (!strstr(dp->format, query->format)) {
+			return false;
+		}
+	}
+
+	/* match against the line number range */
+	if (query->first_lineno &&
+	    dp->lineno < query->first_lineno)
+		return false;
+	if (query->last_lineno &&
+	    dp->lineno > query->last_lineno)
+		return false;
+
+	return true;
+}
+
 static int ddebug_change(const struct ddebug_query *query,
 			 struct flag_settings *modifiers)
 {
@@ -203,42 +249,7 @@ static int ddebug_change(const struct ddebug_query *query,
 		for (i = 0; i < dt->num_ddebugs; i++) {
 			struct _ddebug *dp = &dt->ddebugs[i];
 
-			/* match site against query-class */
-			if (dp->class_id != valid_class)
-				continue;
-
-			/* match against the source filename */
-			if (query->filename &&
-			    !match_wildcard(query->filename, dp->filename) &&
-			    !match_wildcard(query->filename,
-					   kbasename(dp->filename)) &&
-			    !match_wildcard(query->filename,
-					   trim_prefix(dp->filename)))
-				continue;
-
-			/* match against the function */
-			if (query->function &&
-			    !match_wildcard(query->function, dp->function))
-				continue;
-
-			/* match against the format */
-			if (query->format) {
-				if (*query->format == '^') {
-					char *p;
-					/* anchored search. match must be at beginning */
-					p = strstr(dp->format, query->format+1);
-					if (p != dp->format)
-						continue;
-				} else if (!strstr(dp->format, query->format))
-					continue;
-			}
-
-			/* match against the line number range */
-			if (query->first_lineno &&
-			    dp->lineno < query->first_lineno)
-				continue;
-			if (query->last_lineno &&
-			    dp->lineno > query->last_lineno)
+			if (!ddebug_match_desc(query, dp, valid_class))
 				continue;
 
 			nfound++;
-- 
2.52.0


