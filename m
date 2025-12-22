Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894B3E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6OB9Pa9Gle2V+EOSWrg2iFtsBZdBFQQ3jPBPibwDk8=; b=WNbi7+DPLtcHVEICfS0OH1FfAR
	Oyeia4SAD4pYP198FiqTn1jBUxv2tw/MiWUSsos1no0tmyldzNf+LgIgR7yZxIQuU9Tds/WCAcZ0b
	bK1sEhT1iahZpRnrVBncopkLzEY8PfSGzxOPYG0NagzPbK0bfP9arp1+NAszEixoRyA4NWaQhQSp2
	YqfOfqNMbdTC5woVOmbGOvHhFeP0pnG4GQLiByAEntR2Sozj78mdtVXe+MMtg4fLTf3BbMa6GI9KO
	rv0bzHXXW8j5UWtWYdSrw076d6Ql8023SHYBemul4OXugaH11vgYROO3bzRq+GqO8i8/tPBs+sib2
	k0CevtUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbEH-0000000DQOW-2CbV;
	Mon, 22 Dec 2025 08:25:21 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbEE-0000000DQMD-1DGy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:25:19 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-7b80fed1505so3931889b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391917; x=1766996717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6OB9Pa9Gle2V+EOSWrg2iFtsBZdBFQQ3jPBPibwDk8=;
        b=IHc5tR7Mleh9ztTwrs5/x9h3W26TEllxhWHuUoODWLCcyS0GcaDEUFpnfi0xuI0gh5
         qg/yprcixDYCeRRBOJcqNoXxwPBr5gX/yqTgVrhG0IIY374xE8GOj4aPil+aROJ37jiJ
         SmSDa4zOsKh7crLdJ4+bN6EiZEPazVBK2QQCLSfh7mQ6nQlAFs9TKkB/203mY4vG8e++
         hffxtmsMAZZG1BveA+zCpje/g9CkoboTyOTtauQ/fApS10RrSpbkBdsQgJyZU/yKdmdf
         jgKpJTpY/n/jajVmuvT40x79xfrbWv+nH4h3Y+SewxPVFJAvAWp6zlbk7qVijI8f6NcW
         BzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391917; x=1766996717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m6OB9Pa9Gle2V+EOSWrg2iFtsBZdBFQQ3jPBPibwDk8=;
        b=rBG/uAqSML6i7iKL4enETVhh98/Aq+cQXY8fnUnzvu9QIjtp5GbNXKJGk+4aREG1Rx
         fvYDKHCVyhkZ3PZVQ+H/21A/gyCxs2gXdW6VCxyGUKT+yIdyGa96j/1MtHTdPviqwz2Y
         f2di0lcJaX0a+XdpajCmIFFAIJwi4fPDjQMwzLraoCrVnJfabeMegke/obBk74Gx/sj5
         vYLkv3GxpGibOVpKOIKUh9Zuws4sm+T9tsceDfx5Cc1383S5cNjfPDh4M8UktVTrsBYe
         A1KCFu6+FnPjsE3Q+0SOYxFgD/KZMjvcG1We1RsSkFouB/x3J2FLRVGhk47FjznPTsMc
         mXgg==
X-Forwarded-Encrypted: i=1; AJvYcCUXhuieNIomClMrPF1lkd0Z2jFuDugC0de8zzpAa4gcl53g2mT2x4nU6hRkTbzYdBRki9azHxHRNEJO4Q7gJVA9@lists.infradead.org
X-Gm-Message-State: AOJu0YwkT4JxW+fL4oAElVfu6IdD36ahGvBh2nh8bNuIReWVjkXI2aup
	qHJJv09KkhsyCeosDd9whGNxeH32R/kVuMTDMMpE/v1qLFV5zPKVrIhQ
X-Gm-Gg: AY/fxX5NCi8YncUOHJHMtUVsluEYO20MGvEeCOrr/Qqi3jHQRze2HUGZqUd45HlRx6X
	DTE7529Zw0uR5RnRTFbXYY5g/O33ZhL3bF2o9sWtYCXkKW7fhiAki1nOszKE51zOln+iVWVsydL
	XmLIGx+h5WEkFqhnQFNeVTFIe6WZ2C8mO4qcfyT+sw0bp20j8GR/59V9J/deEzcz8EMyVxfAIOG
	pRyBu6sr7UVMdlM5BaxmMMiD5qWMqSTTH7mLQSAHQtdI+BMFR+vrsLMEhQ2teKbbLZL8ekSfBuc
	oG7MJlOMDbngDKpu3qWI8/ASa1Upe+JLiCwTsZg+xe0LAMySHvcc0eGKJ1M0PqIVDU22xlB2ohS
	NlkRPOdSG067WXfuWQzzSIATN9BpVqbTxLimGuGtpDCmtG70a7ht4MbuIIoEWG+lhOhfBinlada
	Mh1w9Zp8Yw
X-Google-Smtp-Source: AGHT+IHMhCJxcqdCZRWx/qONCBKUX17SaWR7PpHRxbERjSaUq38+8Dckg7eE7Aqa1nDG0nfGy3nZYg==
X-Received: by 2002:a05:6a00:2c85:b0:7ac:3529:afbb with SMTP id d2e1a72fcca58-7ff648e9b90mr8900885b3a.20.1766391917524;
        Mon, 22 Dec 2025 00:25:17 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:25:17 -0800 (PST)
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
Subject: [PATCH v7 22/31] dyndbg: detect class_id reservation conflicts
Date: Mon, 22 Dec 2025 21:20:39 +1300
Message-ID: <20251222082049.1782440-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002518_353291_8DD99C6B 
X-CRM114-Status: GOOD (  14.53  )
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

If a module _DEFINEs 2 or more classmaps, it must devise them to share
the per-module 0..62 class-id space; ie their respective base,+length
reservations cannot overlap.

To detect conflicts at modprobe, add ddebug_class_range_overlap(),
call it from ddebug_add_module(), and WARN and return -EINVAL when
they're detected.

This insures that class_id -> classname lookup has just 1 answer, so
the 1st-found search in find-class-name works properly.

test_dynamic_debug.c:

If built with -DFORCE_CLASSID_CONFLICT, the test-modules invoke 2
conflicting DYNAMIC_DEBUG_CLASSMAP_DEFINE() declarations, into parent
and the _submod.  These conflict with one of the good ones in the
parent (D2_CORE..etc), causing the modprobe(s) to warn

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c      | 10 ++++++++++
 lib/test_dynamic_debug.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c60c2142f8ac..e5a18a7d3780 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1317,6 +1317,7 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
 	struct _ddebug_class_user *cli;
+	u64 reserved_ids = 0;
 	int i;
 
 	if (!di->descs.len)
@@ -1341,6 +1342,11 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	dd_mark_vector_subrange(i, cli, &dt->info, users, dt);
 	/* now di is stale */
 
+	/* insure 2+ classmaps share the per-module 0..62 class_id space */
+	for_subvec(i, cm, &dt->info, maps)
+		if (ddebug_class_range_overlap(cm, &reserved_ids))
+			goto cleanup;
+
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
@@ -1353,6 +1359,10 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	vpr_info("%3u debug prints in module %s\n",
 		 dt->info.descs.len, dt->info.mod_name);
 	return 0;
+cleanup:
+	WARN_ONCE("dyndbg multi-classmap conflict in %s\n", di->mod_name);
+	kfree(dt);
+	return -EINVAL;
 }
 
 /* helper for ddebug_dyndbg_(boot|module)_param_cb */
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 6c4548f63512..1ba4be9a403a 100644
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
2.52.0


