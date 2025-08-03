Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5E2C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LKFK2FQkGbRBipMPdzUP2qSKsnxzgWO8ffhfoPvu04=; b=O2iGCT1U+RV4jEfIFuBebz3OhS
	QmA8kSvFWesfp6u6msKLDetBO1tEyN7YrG67oDlzoQ2iYWoH77pXBGtUjQjs12tJ/SvpXPLSXQcF4
	yKkCEm5dH3e93O4znS+5LSj0lQXMvOUOeA0l4jsxsWJbqdMLouu3I85uhbWkAkEZ7HMQWKGd9dyTx
	2ZL1noYZvfVEp8CZ2+6C4sCCtkgbg7t0aYwW+U06W5l5j1wk26U+37aR9lGDgyo5l/BFadzk6ulcM
	b3NMnCzAePl5pZUQkLE4qNj6LGy5qwIhxtkuDMGKh1pwITKLyc0m+IIwvnYH5vZD+bYF3ivD/V1Gp
	XFIw6yjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQCH-00000008BhU-2haL;
	Sun, 03 Aug 2025 04:19:45 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPrv-0000000880m-3hBY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:58:45 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3e3c34a9b4cso38292835ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193523; x=1754798323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LKFK2FQkGbRBipMPdzUP2qSKsnxzgWO8ffhfoPvu04=;
        b=CUuUQ4iv+s0K6keZnkr8Jv+HkAGRA+xWYCFsw5WJQPazEKhO4mVQfBIfGEni6S1wPc
         aadGjzHqdjaETh2HDOqYjsiSlr38GuVI4EzEq9Fg2LgMFEgVyyPf7RZowyj5BgPBHNlh
         ou0DWTUH21FXcd83EgO90fziwPo01wdoexUTX/CjazjN7ESwMZei8pY/j3mvnE18jOJ+
         BD4pZi5XQgiLTDX01od1aJss3p6WgzcgY+SeJ6lgrbhhufLHpfC5erm28L8b6C+Av3qs
         PQ4CGZ7Z1adGC5Rp1ARM4vZv5bxGsqxmSDzzxqpHtHnaqnpIXz15H8SpxkisCtepMTmp
         ZlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193523; x=1754798323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LKFK2FQkGbRBipMPdzUP2qSKsnxzgWO8ffhfoPvu04=;
        b=vOQWawlAtT28rUx1lGRLrDXvF2TzWlUgSnNyquXjraCOkctfihrQ31kMxejCqx8WB0
         M9pEju99H6SrlRvhTbRVVgnzXyC8pMObNOvDmkZvhjc5zbUBhi+7E2QjqhA9JdoktmrS
         sK3dImP1yygx9imjMwfZW5vkKxnW6vB3spqb0gPiTa0+D1k4YlFS58BWsQn6PaBArvV3
         hK1d0NzAy60J5f53/xEWKywZeXwgqturfqmZc3C4DlziZmVSIhH66UIYnmuZCDPxonCl
         ZKJyZ8665mONXWsg/PsRxZs08TBxpuAxVqZxc3yCFjDov7/EoWQBq4klueqj13yv0oaT
         ql1w==
X-Forwarded-Encrypted: i=1; AJvYcCU/YkNezZYjJCdxHVs1oqprqZYtP50Gfq9pH6Z2qiUAV1ido15CXu76W9m75jFNXvpH0G4RLz0sX4GNuGsq9zSr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx49OKT6C2h3nenQY9vzzcn40z6hgnUzUAKtJHNQepbrB45GBdZ
	JrtBE4df3R7lq90dj7S6XNtV99HS1ngmGboFoiFKDzPi4lqGoNRZ4cuC
X-Gm-Gg: ASbGncv3g8crNCwb+clWugidy4sq3YGeTaXdnyEN7M2Wqs7fa1Za4JcikbSJ8anizyr
	8cp36akbOMHMWxs3gLMlGouvBsASiFEbOa2r66r6xAJ9WG0/FQKVOsEp5B9lXgvW2FXOPqnZpWJ
	3b7boEsRl3U6kJsUwYKgPMIE0kOShZu+DaiquL7tm/QNN7kViiCaJEk8OjsMMzVLZzIlf6pYerU
	CADtYPOVrzBheiUI816t1x36suCf9Wju9WnKNhZHWSvr41bkjotDm1yPrjqfwoiMb9aENHbGgsM
	J3MvARgSuRz+tlVsxbwNaZ+HqNRahmf6fcGMc7F8Ys/y1pas1JDZitMAXxmT+1SlHU8lVYfSXNO
	+XcetcCGNSsOrR9w4EHsxqhXr5pk8nvvfDZIn/MtmnpevpdlZa1VAcOq8HMwiYW4Uj1JCwwzdkh
	0addSG/USfaJd1u0/QoE+BAQ4=
X-Google-Smtp-Source: AGHT+IEK8/vwYm1R/fsAxFG9PU2vcozrYZR6RghCEJBk18PG9+D3j285L0ye3PQbY3Q2FqB5Lv0cRw==
X-Received: by 2002:a05:6e02:2220:b0:3e4:1162:6761 with SMTP id e9e14a558f8ab-3e416128e06mr102803815ab.9.1754193523038;
        Sat, 02 Aug 2025 20:58:43 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:42 -0700 (PDT)
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
Subject: [PATCH v4 07/58] dyndbg: tweak pr_fmt to avoid expansion conflicts
Date: Sat,  2 Aug 2025 21:57:25 -0600
Message-ID: <20250803035816.603405-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205843_942832_C8C47B26 
X-CRM114-Status: GOOD (  11.17  )
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

Disambiguate pr_fmt(fmt) arg, by changing it to _FMT_, to avoid naming
confusion with many later macros also using that argname.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 55df35df093b0..2751056a5240d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -11,7 +11,7 @@
  * Copyright (C) 2013 Du, Changbin <changbin.du@gmail.com>
  */
 
-#define pr_fmt(fmt) "dyndbg: " fmt
+#define pr_fmt(_FMT_) "dyndbg: " _FMT_
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.50.1


