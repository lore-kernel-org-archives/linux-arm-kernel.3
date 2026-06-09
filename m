Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BB1CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 21:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vD6M+PWiN+Y/gqC8odOLN0+OnegpcgUZO20uPCwVPYw=; b=tW/BEslwYNEf0vcD4MufNDhglv
	LeDnf67qqBpeTw4nd+57PZhG4R/1CQ3Dm0+731pmm0zCR0wrM59c3O1CDWX4PK7KnGl7HiPPdxYyp
	TN5Rh1SWFt9JEnO4Eb5p3cHkI1kb3xWQPnKk9CqcTEZp11Y/ZuntQkh06plTmZA4ZpurabewsquG6
	x7OhmY9SZkMG7h6mwNK0clyw8biyiCFANfUm8bsbRWiNHhm93aV07eoTaecA2+bTXUHvHH5LsZmf/
	i8oR1YJ1N7iNl77uWUPbVqezKm0hSjj1pU616UJq9XEXuJBAmeGgVP8r1gI0R++ejVB5pU4CvGN1f
	SBpoDXEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4LZ-00000006PjB-3s5z;
	Tue, 09 Jun 2026 21:50:57 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4LU-00000006PeS-2d66
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 21:50:55 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2bf004bf8beso70026625ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 14:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781041851; x=1781646651; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vD6M+PWiN+Y/gqC8odOLN0+OnegpcgUZO20uPCwVPYw=;
        b=RAz7UfWUDGje433WzYbUlPtUX+cgqB48FhKMch6C4n/mcfFJmYf7CTvmA3QccMYZr+
         5Kc4iFKSTSO5ZGYjQxrQYdz4pJXXXHjw3WYip15Sab5Xu/59eQX9TBMBhY/utF1GVaOb
         p4/llrpM0fDrTxXSzxqkTuKjjj6dqntrZyCYeU0M8EruTn85l0lBZxiYJvtk6vA3yLy1
         varXQo5BMM2KFFt5tc3J72ahjPJivH1V4DMqpAOBSktl3YOUzPY7aA0SQBmkzFCo2Frt
         l/o5Pczs26cIYBDQrZTbqC9/lo0Rk4mJhjLGJpRmc2zIQ5YktaPorTBgQZzXPNmBAlXl
         Y89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781041851; x=1781646651;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vD6M+PWiN+Y/gqC8odOLN0+OnegpcgUZO20uPCwVPYw=;
        b=MpAd94tNzIEKZT3VTaxIpliLbnrkTrzKRL0obXvcFwqIgbPFhOGizU7Z+T0qs6qpZB
         0mDVGLOuDPyuqjguESaqz7+iwQb/0uAQeNO/EKP5rQfca+wcYdBJSk7O/8KFg3PsivRA
         GFuH9YBhN6fqcMxxTrL64MGsnt9k3gnvCDti3pRYkfQ2jHXwhyUv/ICOFrarkWH43mbp
         vddGJ2jZSI3OIrqljVW7Xx55bX5g4mhtfhBGhnmJLwusp7PjvgFTRZJUg9SbSlwIS6ak
         t6BjbCQvrR4k2cHqVPLwsAEp5jdqrZOaJfjZBq3gmUyOn31dYsByfJQr9/vdhcNN2I0A
         y/sw==
X-Forwarded-Encrypted: i=1; AFNElJ8nHsQ3gCmSiVTGMZLJ2qIBH7pIGOEyNwh6B4qnCefI9ICSOiYZmRwRWoqW2cTGUUpvYBuQG4NfmbZ8LGUj+Q+M@lists.infradead.org
X-Gm-Message-State: AOJu0YyboY6NRkN/Q/5eFoTqHhN2+Qau1UQnkiKH5KiZr4NSqj0oasuI
	qp7Ne/AHNYbTd6YH5rLC9Hkan5BC3aPiXyf9LghGYmsz6eaVwuXmrze7zUQTWNWlrmHamTMo2/S
	KuRpb2w==
X-Received: from plblh6.prod.google.com ([2002:a17:903:2906:b0:2bd:c5f9:e27b])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef0a:b0:2bf:2e28:db28
 with SMTP id d9443c01a7336-2c1e8232ec8mr275652575ad.29.1781041850759; Tue, 09
 Jun 2026 14:50:50 -0700 (PDT)
Date: Tue,  9 Jun 2026 14:50:41 -0700
In-Reply-To: <20260609215046.2391903-1-ctshao@google.com>
Mime-Version: 1.0
References: <20260609215046.2391903-1-ctshao@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260609215046.2391903-3-ctshao@google.com>
Subject: [PATCH v1 2/6] perf vendor events intel: Update emeraldrapids events
 from 1.23 to 1.24
From: Chun-Tse Shao <ctshao@google.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org
Cc: alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, james.clark@linaro.org, afaerber@suse.de, 
	mani@kernel.org, dapeng1.mi@linux.intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, Chun-Tse Shao <ctshao@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_145052_664416_6F52949E 
X-CRM114-Status: GOOD (  11.41  )
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

The updated events were published in:
https://github.com/intel/perfmon/commit/3f1d40d1953193e75c6b5a559638cf1f67bacaed

Signed-off-by: Chun-Tse Shao <ctshao@google.com>
---
 tools/perf/pmu-events/arch/x86/emeraldrapids/cache.json | 9 +++++++++
 tools/perf/pmu-events/arch/x86/mapfile.csv              | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/arch/x86/emeraldrapids/cache.json b/tools/perf/pmu-events/arch/x86/emeraldrapids/cache.json
index ff6071d7728e..a44e1f027c1d 100644
--- a/tools/perf/pmu-events/arch/x86/emeraldrapids/cache.json
+++ b/tools/perf/pmu-events/arch/x86/emeraldrapids/cache.json
@@ -368,6 +368,15 @@
         "SampleAfterValue": "200003",
         "UMask": "0x40"
     },
+    {
+        "BriefDescription": "Cycles when L1D is locked",
+        "Counter": "0,1,2,3",
+        "EventCode": "0x42",
+        "EventName": "LOCK_CYCLES.CACHE_LOCK_DURATION",
+        "PublicDescription": "This event counts the number of cycles when the L1D is locked. It is a superset of the 0x1 mask (BUS_LOCK_CLOCKS.BUS_LOCK_DURATION).",
+        "SampleAfterValue": "2000003",
+        "UMask": "0x2"
+    },
     {
         "BriefDescription": "Core-originated cacheable requests that missed L3  (Except hardware prefetches to the L3)",
         "Counter": "0,1,2,3,4,5,6,7",
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-events/arch/x86/mapfile.csv
index 613881d04a9a..0f39073805ba 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -9,7 +9,7 @@ GenuineIntel-6-4F,v23,broadwellx,core
 GenuineIntel-6-55-[56789ABCDEF],v1.25,cascadelakex,core
 GenuineIntel-6-DD,v1.02,clearwaterforest,core
 GenuineIntel-6-9[6C],v1.05,elkhartlake,core
-GenuineIntel-6-CF,v1.23,emeraldrapids,core
+GenuineIntel-6-CF,v1.24,emeraldrapids,core
 GenuineIntel-6-5[CF],v13,goldmont,core
 GenuineIntel-6-7A,v1.01,goldmontplus,core
 GenuineIntel-6-B6,v1.12,grandridge,core
-- 
2.54.0.1099.g489fc7bff1-goog


