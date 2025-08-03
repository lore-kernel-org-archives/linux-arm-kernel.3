Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE595C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mklWiZZXeNw0IAiROdlhKulcLq5JIjmrYvDuK+b6IIw=; b=AbKtjJlns86CKyfsGV0Nzl7QRS
	dDef2jA42oibNq7Lw+GOREaLxEB+1dfIMZTtlpMGQ2VqlwfiYXGhZqF0OeSrrNXNW/EL8sO5IyIy2
	NlaGWsTVt4jUPx2lL+Fq4FKHZ+HGGtlIRBe+Z4N0W25R2mT/w/STRSFg1plqZjW2/v9KckiMjwSGa
	h1BJS7B6SNaLPvCG02DVtFQQpC+AyGVf4E4mnsTx8SKvMWfMy0boVYmv8sg8LJ/qn3xo8TuZcYcmu
	zJ7ejP3JSH3R+dJZ3/Nd0EMTkYeFRR+DUhBrKQv0mm22hqylLLpry5agmrOnlNTPj9WZZbeY0oumo
	FszUKulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQot-00000008Ick-1b0b;
	Sun, 03 Aug 2025 04:59:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsK-000000088Ib-17hI
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 03 Aug 2025 03:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mklWiZZXeNw0IAiROdlhKulcLq5JIjmrYvDuK+b6IIw=; b=oLoK+LiyGMGc3iIDzkK6OgmPKM
	CTWKnmBKPo7JqRmnLLuQI5prEoRddTCE4zEqFTxs/0zgzh8hUIwpjsmsFJY6AecbvjHmYfPLKozqT
	oTWPa/avQMo00VgHQGnmDeM7/T0JQnjKJE/42ruACP0nueeOBucIJA1/uxxjJl6hZij4/qckw8axe
	8hELjksKrBrTkxysoVewANUNF87WA5JuHa4Zzmnhdsrmz6/ejX9VihRAKJuiasih7JPakE+2lZve1
	1BkgSjVliVlCHALXozQOK1rT9V6gbSTIpS04zANb7Yoz3cMG/S5tGAV1sTlCaZDvgqjxL7mp7vZrb
	0RNLJdvA==;
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsH-0000000DXIQ-0pvO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:06 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3e406ca2d22so10975655ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193543; x=1754798343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mklWiZZXeNw0IAiROdlhKulcLq5JIjmrYvDuK+b6IIw=;
        b=KGSzAE9c1Ph3Nqr6C6WCsbpxXnlQzVCKtydhZi4x6UR3zWCPsBMjokbn1UknWnDcx3
         NttjA221POOjbVOacr8F5ERVQm7xAvDUXSZEhMZVIPZy297WnKv3yMtcPllxgLdZ4ro6
         jkEJ+8tQ3fyjEDgfVpaNOWal0AJEtR38pM0N1FxewQHWtFCZU3138Dd9wmB+/yfuJF6p
         hqd4GAuZ497ZGPpSQLI7pCBZjFdEIC9XL1kqhvxIuxDzFwqcHXugrOW+atC1xn3AIvvd
         Y3E9wehbA0Jyozi/Io/grtwsF18V+NHI2yO/U3Og2iRWi6mdtSUjy06d5CT1/jVlvb9v
         7KQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193543; x=1754798343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mklWiZZXeNw0IAiROdlhKulcLq5JIjmrYvDuK+b6IIw=;
        b=F7iK6IAIxgksEAulziNkMn9bjoDENcAaJhdQSCTVtPQDkVIhtzm/g82R2wbcrjrTzi
         XZGyGFalLkIrVH4R7deBaZeHS6nC9Zxjh29uMEkR2a2UoBcaP7GpPjVdjXrbgvnHL07N
         pCy1YrustnwS73Zu9WzIJ4vCNvyQpgFD4mIyhNbWaIJgTfoDJ20XikVuxD0aWXDmkqGy
         c657FvJzxa7AXPZDhIuRCOciPyDOQZqe1E684mngwi3Qxfyg8BEccWIWAO3uV9T6e6l6
         RBvbmSPGxX6T6VdM3ckgWvEocF2LR6NteKujTbgxHaj6d1Jdrg6ib1FTPTD7Y4vg70Cv
         yfCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdiePHo4hJlnV5UT/DPpFLZm9hdTlxJ3T77rO4leZosNa5tNbVmGpXpXPTHFyrfM5A0qHeSYaVKdGIAeEVSoP9@lists.infradead.org
X-Gm-Message-State: AOJu0Yyiag4bFK9SEkWW15a8nBtgRhEAuKEzYaIu9drSawfgpSYF1XiP
	5luIZtkcFVDnNGPPan2HnRp0Qd0mKnDgyo5b47k+zgMA3flqJ7eZNekW
X-Gm-Gg: ASbGncspPVnZFywb5I2ov49OXYdhEJNWC4XRS36EsY7DeYO3lzC+wFRZ7fgUeE99giL
	uLfqdec6B4lhfiwrZO/Kzk2ENd6XXZCZIt1WzTk23A6ibNyhZkkxxgYUeB9h4GzQFFW9xi8++GM
	qn2SXGgYUatY2LK38K7S9uM9jlDMDpNaa4GiXdeeQhQOEWfTiaJcpU26ipyXvPZH42WZVZ5YWJK
	qOL6LhSN+y46jMKkbxZolVnElzbhQDklSnkBdPDvmTiUZ/WAJoGbEWc3KgWOi9jT3VpLQsMYyN9
	aAZ0HqZ0L+wASmAa0uXyDuwD0jRNKQhQR+85bKwiG557+25pLun6SgY9/ZjhMFcny5E3qdgym5A
	0fmvT8rWe6LSRwoRV6p8gOl7LqdBfMtlL+8BNninm1P2HAjfX7y68ZpLB6b8wf0/zL5bgcl1mxQ
	pyrA==
X-Google-Smtp-Source: AGHT+IFogGu9+LdtIzbyfZnfCUHN86E9vT1zZI6TQuyF240cWd9LVlFw1Za2fBbgX19XjcZHFKFMwQ==
X-Received: by 2002:a05:6e02:3e8b:b0:3e2:a472:2122 with SMTP id e9e14a558f8ab-3e416191f81mr84787815ab.14.1754193543320;
        Sat, 02 Aug 2025 20:59:03 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:02 -0700 (PDT)
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
Subject: [PATCH v4 20/58] dyndbg: detect class_id reservation conflicts
Date: Sat,  2 Aug 2025 21:57:38 -0600
Message-ID: <20250803035816.603405-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_045905_473612_5CDD7C1D 
X-CRM114-Status: GOOD (  15.92  )
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

If a module _DEFINEs + _USEs 2 or more classmaps, it must devise them
to share the per-module 0..62 class-id space; ie their respective
base,+length reservations cannot overlap.

To detect conflicts at modprobe, add ddebug_class_range_overlap(),
call it from ddebug_add_module(), and WARN and return -EINVAL when
they're detected.

test_dynamic_debug.c:

If built with -DFORCE_CLASSID_CONFLICT, the test-modules get 2 bad
DYNDBG_CLASS_DEFINE declarations, into parent and the _submod.  These
conflict with one of the good ones in the parent (D2_CORE..etc),
causing the modprobe(s) to warn

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 lib/dynamic_debug.c      | 29 +++++++++++++++++++++++++++++
 lib/test_dynamic_debug.c |  8 ++++++++
 2 files changed, 37 insertions(+)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index fa8d1ee214066..d6687623c5a96 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1267,6 +1267,22 @@ static void ddebug_apply_class_users(const struct _ddebug_info *di)
 	(_dst)->info._vec.len = nc;					\
 })
 
+static int __maybe_unused
+ddebug_class_range_overlap(struct _ddebug_class_map *cm,
+			   u64 *reserved_ids)
+{
+	u64 range = (((1ULL << cm->length) - 1) << cm->base);
+
+	if (range & *reserved_ids) {
+		pr_err("[%d..%d] on %s conflicts with %llx\n", cm->base,
+		       cm->base + cm->length - 1, cm->class_names[0],
+		       *reserved_ids);
+		return -EINVAL;
+	}
+	*reserved_ids |= range;
+	return 0;
+}
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1276,6 +1292,7 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
 	struct _ddebug_class_user *cli;
+	u64 reserved_ids = 0;
 	int i;
 
 	if (!di->descs.len)
@@ -1301,6 +1318,13 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	dd_mark_vector_subrange(i, dt, cm, di, maps);
 	dd_mark_vector_subrange(i, dt, cli, di, users);
 
+	for_subvec(i, cm, &dt->info, maps)
+		if (ddebug_class_range_overlap(cm, &reserved_ids))
+			goto cleanup;
+	for_subvec(i, cli, &dt->info, users)
+		if (ddebug_class_range_overlap(cli->map, &reserved_ids))
+			goto cleanup;
+
 	if (dt->info.maps.len)
 		ddebug_apply_class_maps(&dt->info);
 
@@ -1313,6 +1337,11 @@ static int ddebug_add_module(struct _ddebug_info *di)
 
 	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
 	return 0;
+cleanup:
+	WARN_ONCE("dyndbg multi-classmap conflict in %s\n", di->mod_name);
+	kfree(dt);
+	return -EINVAL;
+
 }
 
 /* helper for ddebug_dyndbg_(boot|module)_param_cb */
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 6c4548f635128..1ba4be9a403ae 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -128,6 +128,14 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 DYNAMIC_DEBUG_CLASSMAP_PARAM(disjoint_bits, p);
 DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
 
+#ifdef FORCE_CLASSID_CONFLICT
+/*
+ * Enable with -Dflag on compile to test overlapping class-id range
+ * detection.  This should warn on modprobes.
+ */
+DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
+#endif
+
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
 
 /*
-- 
2.50.1


