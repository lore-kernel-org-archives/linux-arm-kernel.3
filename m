Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB32C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JChZIjAU7+USVRGiGiVr4WOFlmx1AN0tqDn5UCQfXA=; b=CpT2P+N2tFblnclLmhtQj/tyI4
	w+8Gu9L5pjAKHWK1vvrGNl2Kg2ySyEnYlyovVl3vvm7923ge70D99t67mJIA0yUmqRMGJ0oAn2gaY
	4zyzqfAE54l48b5PAj+Lo6hPkieVCgV0dEmHMV75yfJeZj1wYwVMKSW4LPhoHFOpdcqG53aIzVj55
	CML10VTmfE+0KHO7sxjet04Wwpn7PH6CPnm6x8bUnPOjwT7dqXyfO05R6fXztnZGkN6gkwVm6wgAg
	dICvTCZr9/izYRc7nhxHbvo4TpI3M8uqWC8KaprWDsZiziHpz2lQt4qSOY8Fw5uCIyUz1updzvUZm
	cTL2//pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiR1p-00000008LV0-1V6q;
	Sun, 03 Aug 2025 05:13:01 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsR-000000088Ne-18sd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:16 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-880f2623a6dso170414239f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193554; x=1754798354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JChZIjAU7+USVRGiGiVr4WOFlmx1AN0tqDn5UCQfXA=;
        b=hot3DjXiO1ixqmKGNZQ7MRvIfR2uzA+yOpOn1UzPfLLkNIKfPrH1VJSM5degBDDj2J
         qj3uK+vB5kj69lDe1ZyqMgRG33uXhxupR3JawiYnl+XyGDkSIgtXKwzWmL8YmcD7Tb0M
         Tp3jGaIxH6rFExOI+NFGCYkyrsW9hKEvql6eBSbloeU9Q5EeW0VlKc4DjbpzbWfq3wEn
         SWsnSEhLf2/7F1myURdmt0pronW3DCx3p1tFZqtyW6kRBN+pgRB/83kJJNFB7U++5Aoq
         5/A+ZYgwI7zehum30Pdz/D5V9eNS5nCWN2qw+LjFVLzRR2ylTV+ycBfin/pwj4RZ6hnE
         SqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193554; x=1754798354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JChZIjAU7+USVRGiGiVr4WOFlmx1AN0tqDn5UCQfXA=;
        b=BSRI+hkrw7qx780p61CaHdEXQRldnDgq33QNJyigbawINzcYyLNsHsavNrCR5BH2jp
         jL6Fq+f1uHIa8HsZ9g7JBMPLjb6vYHCHl6Hfdxj70APIXOxnODfVyari8uQ4nx6Euxlv
         vktEHMS2Vy93jEQo7b1Wd+yBLUuYclcDuC/o/9QyiTlgQ2yHNVwvAegCywgaqH1NNE5G
         nVZWZ7Ar70QiwfxqWx8S1paH7Pnibs8t3mJ4jJDaGuMopkFPfZ0auOarsdzFnFzWNKeD
         zXDQHySyy1JOyRPI8sUsviwz6S+w6SLCZR/ku/9o3UrMyMJdiMcVWiyhws5jC0fMYWzt
         /6kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv+zeGlz8BFlClZc/BBCtUYGGcNYlcbD6ZWLLwka5HTQis6oDu5aQNMcPLdXU2WZHrw6T+uqDsw72jYh//wkZd@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlkra/MKrld/GW3Izzs5i58piYM2zTiDBakHbEw4gkaOa8aGyf
	KObX1fDO64Fk34+MGIqwer1HDCLRex3TQQv/Msljvybj+t68aSbDNti8
X-Gm-Gg: ASbGncs/WlDvPCN0YRPB4MQDrwZuP/XYIgMbnXKPDl1abaVEf5Cf2arGjNAvSamT9FY
	ZHCWxe5Xd5DqdryYwUy/VDaPT566NF0tqrEk6vhkCR5UUHB0QsZFDPp/TOyNFo9b3DmxW+Q1/N4
	M8FXkbOMQldHIFYujhsSEuN42lhb0ymDX8GF9ED5XpYKhFCQldI99SxweimlJJYPj3p9XdVKIkg
	/xvrLqA8uOC0UYyjMCYWIQ2WhVPOLiQT7RNUbnd/Q3/nkXVqxdKcz6keWy0ZU7rGW1z3bHBqdgk
	cFhX62xfwURK452xpSoQycotgLnCaPZgWYCdk6q6T7dYJ/bSiSicfDpYGITv1JtsWyywn6K/p0C
	XdTFm2eoE8HhbXP6xkuP5AcaaxBK2sPOBgZZyHqrNhaxdTN+bm45XQwc7EYz+1K3ib23+sX79Ya
	jF9Q==
X-Google-Smtp-Source: AGHT+IEXs1RKwGF33rL3y1Nq7WtmCCzyqjf3/JqP1fnRxFHeHfpiw5ELqGV5x4Tl+RUFiy+AkiHSIg==
X-Received: by 2002:a05:6602:6206:b0:881:7474:1b78 with SMTP id ca18e2360f4ac-88174741e8dmr448868439f.8.1754193554242;
        Sat, 02 Aug 2025 20:59:14 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:13 -0700 (PDT)
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
Subject: [PATCH v4 27/58] dyndbg: drop "protection" of class'd pr_debugs from legacy queries
Date: Sat,  2 Aug 2025 21:57:45 -0600
Message-ID: <20250803035816.603405-28-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205915_335640_619BB4F9 
X-CRM114-Status: GOOD (  22.12  )
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

Current classmap code protects class'd pr_debugs from unintended
changes by "legacy" unclassed queries:

  # this doesn't disable all of DRM_UT_* categories
  echo "-p" > /proc/dynamic_debug/control

  # name the class to change it - protective but tedious
  echo "class DRM_UT_CORE +p" > /proc/dynamic_debug/control

  # or do it the (old school) subsystem way
  echo 1 > /sys/module/drm/parameters/debug

This "name the class to change it" behavior gave a modicum of
protection to classmap users (ie DRM) so their debug settings aren't
trivially and unintentionally altered underneath them.

And by "symmetry", if they're not picked by "class FOO", then they're
excluded from adjustment.  This allowed all previously conceived
queries to work the way they always had; ie select the same set of
pr_debugs, despite the inclusion of whole new classes of pr_debugs.

That had 2 downsides:

1. "name the class to change it" means that every class must be
individually modified, quickly becoming long-winded and tedious to
adjust all the classes in a map via >control.

2. It made the class keyword special in some sense; the other keywords
skip only on explicit mismatch, otherwise the code falls thru to
adjust the pr-debug site.

So this patch reverts to the traditional view, it drops protection of
classes from default/legacy queries.

But it also refactors the skip/continue choice to allow the module
defining the classmap to protect its classes from unintended
alterations by legacy/class-less queries.

Next:

Author choice: use of DYNAMIC_DEBUG_CLASSMAP_PARAM() means they want
the drm.debug style control point.  We should presume they want it to
reflect whats set underneath, with only "class FOO" qualified queries
changing the callsites beneath.

CC: jbaron@akamai.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
--
v3- s/slctd_/selected_/
    pitch the PARAM control of protection.
---
 lib/dynamic_debug.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 73076709d169e..548a82a178d49 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -197,6 +197,17 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 	return NULL;
 }
 
+/*
+ * classmaps-v1 protected classes from changes by legacy commands
+ * (those selecting _DPRINTK_CLASS_DFLT by omission), v2 undoes that
+ * special treatment.  State so explicitly.  Later we could give
+ * modules the choice to protect their classes or to keep v2 behavior.
+ */
+static inline bool ddebug_client_module_protects_classes(const struct ddebug_table *dt)
+{
+	return false;
+}
+
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -211,7 +222,7 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
 	struct _ddebug_class_map *map = NULL;
-	int valid_class;
+	int selected_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -224,21 +235,25 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 
 		if (query->class_string) {
 			map = ddebug_find_valid_class(&dt->info, query->class_string,
-						      &valid_class);
+						      &selected_class);
 			if (!map)
 				continue;
 		} else {
-			/* constrain query, do not touch class'd callsites */
-			valid_class = _DPRINTK_CLASS_DFLT;
+			selected_class = _DPRINTK_CLASS_DFLT;
 		}
 
 		for (i = 0; i < dt->info.descs.len; i++) {
 			struct _ddebug *dp = &dt->info.descs.start[i];
 
-			/* match site against query-class */
-			if (dp->class_id != valid_class)
-				continue;
-
+			if (dp->class_id != selected_class) {
+				if (query->class_string)
+					/* site.class != given class */
+					continue;
+				/* legacy query, class'd site */
+				else if (ddebug_client_module_protects_classes(dt))
+					continue;
+				/* allow change on class'd pr_debug */
+			}
 			/* match against the source filename */
 			if (query->filename &&
 			    !match_wildcard(query->filename, dp->filename) &&
-- 
2.50.1


