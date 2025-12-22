Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252EED711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKljsU8Xmw+/foisR3SYsx7mqK9N8s1wNDUiE0Eb/VY=; b=xuR00BRZM+Qe9CiQ0gsU5I6NFk
	EVW5La6Zr643VJ/8aHY11crzNYh/h24xQ4br6TVH/NYem+wzjVJnppboqMHnKf7F1KbX6iJBcySFr
	mTJL2ap9Dg1AFIQW7VYsCKQmIlPrt1XHYLnpoRqzx/USaDZG5opBgQkBALWyLb1O57K0npghjMPWS
	QoL8JFX/aOjxZ8wSmRJBk0mlEhuNdaZsxn6IGvU42yLRlZ+P/tT+JSjc48TYqXEEKRC0DSe/3yRTv
	7R7Nw9Aox7zASheWCSIWYju8+IYOiy499rQL+TRa7hVN/m44n/nGDI+HIgB9qWpOCZkE0I1dotvfx
	u4kzts3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbBj-0000000DOwD-25pR;
	Mon, 22 Dec 2025 08:22:43 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbBh-0000000DOuM-042Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:22:42 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso5830100b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391759; x=1766996559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKljsU8Xmw+/foisR3SYsx7mqK9N8s1wNDUiE0Eb/VY=;
        b=KSoYbVAZ0W/Yo15c5G96EXJc9mibh/k81aWNV7oJdwHk2cxyWRgswoZBZmWgFlKSxV
         Py/UXPbZTzr5RZ9tpUbrpSPqsPHLghxxiqj3P1T183/X6HazaYAXiCZyhcKMLjdDsXmw
         LzHaoCi9Pj2/r55s9N0myqu654lgYl/Z2Z5SYJsj8VlTRWVbs9TA72Eac7mURf+ejJaX
         XDTPabj+FEEweLSRihdjcXA3hB+qul8dauYBrjCy30uNJ4/XbU8+KeYfLQMY70aFaO7R
         3EAHhjn6fYYBGCC9liARkI2erl0GTlVqkW/ZEBwN0XhE8jwgTf70pQhZTrSSA40uXdAl
         gErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391759; x=1766996559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pKljsU8Xmw+/foisR3SYsx7mqK9N8s1wNDUiE0Eb/VY=;
        b=umxom57hMc7IsP4MxLbXVA4chB2Cm68e9Vw3iay0cLMugkOS7F9FFTN8h3c92tGt7y
         u/JKvhzgq/Hr0fkqLGMHDjmosLHwgy2rIMDhgAZaVjFHBQ97Y+FDvFFuhfZ7ppuP3u8P
         tTUUaG6kiLCgf01fRuc682KJbGmQdU51D6eKJVma1SaaIcZi14vgc0/sF+y1xXa8JVS1
         Jzt/meTNf/HG6xGrUg6gqhi1oZ6EiT91ITCnxDMcVQKLsHyrjQ1rVtTH5zxjfEtWNgDE
         1NjD+1j4dMNJIxeQvLs5PcBKp66N2VglXcYONHMGvkCxi4e8qP5SaDA3KumPJBWimr+y
         jr7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgRl6Ft30SVlmq0cXlJIGLeZUSEKJ2xcRNP+SObe4fHhUuGmxPWPEWkJxgVQSSxxlN0X2x7VKTOXbqT6sndOcC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg547ZEE0MZcXsUY5752h9jOJf8SEw4e0Ch7TIkt4dLQqSiTsM
	KhJnpg9lUxrn5nNYuX5QU8sDRcxplJVkvdbucH1WDvIY67Ydo5m1qlsZ
X-Gm-Gg: AY/fxX6uBzoq36io7tGJkKJB3LMieTUhagNG9pyb58d5PtPJOQ06/SUEcBYHSmowZsB
	Xz2YYstSrhc4N4X4jd7HOqs3OtZvpHWs/nPa43RE/gd0eq9JVfAhtxad63leLk8M++wyX3e56So
	f+kSQTZw6onqj3xQ+ujbdq4JaKgJssTkvjNPSjQt74Rc3L5hTQxn4uYrmAeE4xYrEBfTJmggtc8
	rZMLo2rZyVrv0QJMXwizKWo8ROTtMAh1LcM8409YtafEIYrUpA2qswmk0ojmVZ19rr1sWu9/YbS
	zxcQMadHPCTByfyA8ciO4P/BDIcbG/hjXjkMS8/KAmfANTde0oGFMpjORHvYlGAKAqlKfH7nEm/
	2IanHvfScGPMAj0h2pYZJHSTJhWIBIUtJX4fgrYyAnpb+EQEqCzzCitq9K30BgotEKUbrDkIVLS
	9XLFgCfrV3
X-Google-Smtp-Source: AGHT+IEbn13GAc82azOlCQBzD0kgiJPbfq4yJfKj6lNc2cko7ljpTpb+ZvesmNM1IQ0X0cprC78m6A==
X-Received: by 2002:a05:6a21:3395:b0:366:2341:4980 with SMTP id adf61e73a8af0-376a81dd746mr9694106637.11.1766391759442;
        Mon, 22 Dec 2025 00:22:39 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:22:38 -0800 (PST)
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
Subject: [PATCH v7 07/31] dyndbg: make ddebug_class_param union members same size
Date: Mon, 22 Dec 2025 21:20:24 +1300
Message-ID: <20251222082049.1782440-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002241_485623_DFB3E067 
X-CRM114-Status: GOOD (  12.50  )
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

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 98a36e2f94b6..4b7c3b997657 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -103,7 +103,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index cb171088850c..d2ff203d0873 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -810,7 +810,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.52.0


