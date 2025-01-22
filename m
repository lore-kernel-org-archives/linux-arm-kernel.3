Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0D9C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 16:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ipnamBnA9xnGXJ0eEKVyYuEh0wGSuZn3Ia7iQAJ03U4=; b=wp4qPB4K0Z/2/99rOZx/nyOlhq
	jfY4fSrvnFpUz646xJPbKkBbiFvruzNKqoTXRqjNjn82CPeTxhkw0YeNlxhFDzOJQABNAZrUL3C4L
	swjPjMzDfHlc0RW9ru1wOCNyTPMVfUsi3KcM0Nf3m8yu7W5hrRCNs2nRcm87eTt8RKr/+S/0B/l7P
	+stIL7uBjSlvK8COv/z3qUGG9ZPZNB4oBTqlWZeeAekUBUZ66nrJaBunHzn6WbHRdi/lf4zyxiVFf
	oj7zMZb7zyK7Ol6gP1/UYSzgmTSTsb3nz7BApuOve5JZAaWW6Mnllezyi9thDJzL3zG4FR+unAAia
	oXqhzkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tadjE-0000000AjR1-0ejb;
	Wed, 22 Jan 2025 16:37:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tadhv-0000000AjEK-0QQy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 16:36:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso7722925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 08:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737563756; x=1738168556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ipnamBnA9xnGXJ0eEKVyYuEh0wGSuZn3Ia7iQAJ03U4=;
        b=OUeB9f5JgkqS8ObZ2XgPs+jMA936gyD/x+UgaLfly8LH3hbXPRdfngzCIACmTYY+nv
         oP5D5nvdsdMv8p5inMh8XmVB1digitDWypdtnJmyeXsGczYd5vlEdTZpvXYvBVgBx+4n
         p0uORD0qWn17t9R4K5m163bvjmC0lzP3af+y05VmwJkHJtawVzB76AeHkVRBX1VmNrUy
         Xb+Yw7Steoq7e2op9MxKpi7tTXxZJq7A4veBFbueC6TCYSCQrchbRMOdbiJgqdI4LyLY
         DRRJ59Hch7a9VckfGDTfOhj6LdCkVrAuuAvYvZG11Ji3y1BadXIyc+DZ+eiuAMv6WxOr
         KO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737563756; x=1738168556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipnamBnA9xnGXJ0eEKVyYuEh0wGSuZn3Ia7iQAJ03U4=;
        b=eGODiQByA6OE0BynVc0GZ+nt7Yc9ELgv3kvx0Xb9NqaM0Y1tq5hhB/JkiAbpFzJex0
         8G0rqBNhCkq5W//BUnBOhrv5bGLdcQjpY1XZgusAfDnTHbCglwBBo8HqYbilLV7pzBVv
         jDzhdbtwJ9KmcN7to/nMhYRU9NoFnxjfibTwC9Q2un6G8guhrKvldZ1OPdep8mMZNzgv
         rsJds+pMWK1XQvYPiI/lhqBMyYNSbGlClEH5HhVB+2OfvRyeUrStKT0Ynf/eLAxSf+EP
         MzaVu75bhvyi2xZh42DR+36MbPUs2ZjLI4WWMxbTNxn/Q+jJlrIWzMA2nvfzV1FgkVsp
         vKTA==
X-Forwarded-Encrypted: i=1; AJvYcCWBSQlPEHz6U/o05tqaSJ2TYk8IzDmtOCc2GMwwRCEr/shNXM570LGlTIylr3K1ZUsC35VVObKv8z87u8AEinXs@lists.infradead.org
X-Gm-Message-State: AOJu0YyTTLfV0X3pN0Iv60g18NPU5LQXLC+/go8LleFxugrTzOl4BGSo
	I1G8grayYaPRCJ4jIp8cgOeiw6RbAN4lJtevsNB15OdxDvLSz7jpJwAvqvEGc34=
X-Gm-Gg: ASbGncs2b+XJT9hiwgzVr1/bDJmZh8MckqvHxg9oo1W1sNLY/0w0Gk0qAFM7yev49hi
	L44o7emBmcaEl9twhVB/TYudGdU4JlecJ1+h2/8w+AhR55kMasnSQwdUGP+dIoi04G/qaLZ/8qu
	xNpLvOupWtby2yCV2ltWvGngAbuJc1n6kxfsfGosyIfNuckLSlkrzV2P8P0TC5+3+ybcmYGijKe
	/88ueJIwobDCAPd45YLa2J3QzfuzEy//5KQjt242oz8IV9Yw0xD5kk4uki/86U0UB26xQ==
X-Google-Smtp-Source: AGHT+IEjsJ3miTtjbqVNbItDAuSuPcc9ffd9sOK73oYVQvHYD9lipqEM4HVnFQKkdvuYoIbVxN0pnw==
X-Received: by 2002:a05:600c:3b83:b0:434:e69c:d338 with SMTP id 5b1f17b1804b1-438918c5e28mr171505425e9.5.1737563755801;
        Wed, 22 Jan 2025 08:35:55 -0800 (PST)
Received: from pop-os.. ([212.105.145.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf321508esm16983562f8f.10.2025.01.22.08.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 08:35:55 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: irogers@google.com,
	linux-perf-users@vger.kernel.org,
	namhyung@kernel.org
Cc: James Clark <james.clark@linaro.org>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Yoshihiro Furudera <fj5100bi@fujitsu.com>,
	Akio Kakuno <fj3333bs@aa.jp.fujitsu.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] perf vendor events arm64: Add N3 events/metrics
Date: Wed, 22 Jan 2025 16:35:01 +0000
Message-Id: <20250122163504.2061472-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_083559_154188_F2A925F3 
X-CRM114-Status: GOOD (  11.94  )
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

Changes since V1:
  * The generator script wasn't adding new common events properly and
    also wasn't generating groups for N3 and V3. I've fixed up the
    script and regenerated.

James Clark (2):
  perf vendor events arm64: Add N3 events/metrics
  perf vendor events arm64: Add V3 events/metrics

 .../arch/arm64/arm/neoverse-n3/bus.json       |  18 +
 .../arch/arm64/arm/neoverse-n3/exception.json |  62 +++
 .../arm64/arm/neoverse-n3/fp_operation.json   |  22 +
 .../arch/arm64/arm/neoverse-n3/general.json   |  10 +
 .../arch/arm64/arm/neoverse-n3/l1d_cache.json |  50 ++
 .../arch/arm64/arm/neoverse-n3/l1i_cache.json |  14 +
 .../arch/arm64/arm/neoverse-n3/l2_cache.json  |  78 +++
 .../arch/arm64/arm/neoverse-n3/l3_cache.json  |  26 +
 .../arch/arm64/arm/neoverse-n3/ll_cache.json  |  22 +
 .../arch/arm64/arm/neoverse-n3/memory.json    |  54 +++
 .../arch/arm64/arm/neoverse-n3/metrics.json   | 457 ++++++++++++++++++
 .../arch/arm64/arm/neoverse-n3/retired.json   |  90 ++++
 .../arch/arm64/arm/neoverse-n3/spe.json       |  42 ++
 .../arm64/arm/neoverse-n3/spec_operation.json |  90 ++++
 .../arch/arm64/arm/neoverse-n3/stall.json     |  86 ++++
 .../arch/arm64/arm/neoverse-n3/sve.json       |  50 ++
 .../arch/arm64/arm/neoverse-n3/tlb.json       |  74 +++
 .../arch/arm64/arm/neoverse-n3/trace.json     |  42 ++
 .../arch/arm64/arm/neoverse-v3/brbe.json      |   6 +
 .../arch/arm64/arm/neoverse-v3/bus.json       |  18 +
 .../arch/arm64/arm/neoverse-v3/exception.json |  62 +++
 .../arm64/arm/neoverse-v3/fp_operation.json   |  22 +
 .../arch/arm64/arm/neoverse-v3/general.json   |  40 ++
 .../arch/arm64/arm/neoverse-v3/l1d_cache.json |  74 +++
 .../arch/arm64/arm/neoverse-v3/l1i_cache.json |  62 +++
 .../arch/arm64/arm/neoverse-v3/l2_cache.json  |  78 +++
 .../arch/arm64/arm/neoverse-v3/ll_cache.json  |  10 +
 .../arch/arm64/arm/neoverse-v3/memory.json    |  58 +++
 .../arch/arm64/arm/neoverse-v3/metrics.json   | 457 ++++++++++++++++++
 .../arch/arm64/arm/neoverse-v3/retired.json   |  98 ++++
 .../arch/arm64/arm/neoverse-v3/spe.json       |  42 ++
 .../arm64/arm/neoverse-v3/spec_operation.json | 126 +++++
 .../arch/arm64/arm/neoverse-v3/stall.json     | 124 +++++
 .../arch/arm64/arm/neoverse-v3/sve.json       |  50 ++
 .../arch/arm64/arm/neoverse-v3/tlb.json       | 138 ++++++
 .../arch/arm64/common-and-microarch.json      | 310 ++++++++++++
 tools/perf/pmu-events/arch/arm64/mapfile.csv  |   2 +
 37 files changed, 3064 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/bus.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/exception.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/fp_operation.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/general.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/l1d_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/l1i_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/l2_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/l3_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/ll_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/memory.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/metrics.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/retired.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/spe.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/spec_operation.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/stall.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/sve.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/tlb.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/trace.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/brbe.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/bus.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/exception.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/fp_operation.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/general.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/l1d_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/l1i_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/l2_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/ll_cache.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/memory.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/metrics.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/retired.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/spe.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/spec_operation.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/stall.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/sve.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/tlb.json

-- 
2.34.1


