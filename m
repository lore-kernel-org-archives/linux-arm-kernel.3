Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75CBD49222
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWrK6iaUM91cpZWoXCVCbIySh2Y3SPLxqzoIpea0AOs=; b=HCUBH0wzuX4k/KVjBOW0fRC51j
	viV37+f6FmEmeY4G5UPFLsote62UotB2rVM0fdDgR2L/n3n1+4pDFYZ7ubxGwDT1sx3NKJqUtW9Ax
	hsgT/Cia5hRtInLX6aJNR/YGXYs5JFjEHxgZ70nPbvPXo5xtOR2KCchNGvrAYMm/0p3dEWdJvR+MV
	H3Hs+1f+SRRRVKKIIW4QhRUuqvwlXZfPt9yYbQ9IefaNL9zOdzBaVE28zMcS7cuhou79SkdH5hcmK
	qinf38DznTQgXxOaKWOBT/69I9M5pq1rGfYVf9VipZTAl/uQbs/RxnzITibkrmQ0GzfeTEUfty+3Q
	GyN5u4pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU2VS-00000000XFd-0M81;
	Fri, 12 Dec 2025 12:44:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU2VN-00000000XEQ-3m8Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 12:44:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A6C81063;
	Fri, 12 Dec 2025 04:44:10 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5983A3F762;
	Fri, 12 Dec 2025 04:44:15 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 12 Dec 2025 12:44:03 +0000
Subject: [PATCH 1/2] perf mem: Simplify Arm SPE event config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-perf_c2c_update_event-v1-1-29a26c7a949b@arm.com>
References: <20251212-perf_c2c_update_event-v1-0-29a26c7a949b@arm.com>
In-Reply-To: <20251212-perf_c2c_update_event-v1-0-29a26c7a949b@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Al Grant <al.grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765543453; l=1229;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=sp+2q6qeoU0+pjYU9fNG2ACBWigW5kP1p4wDjC597s0=;
 b=WtTBLg90hz4iozrcKt/DR2JMlbDo5seVwB0gJbLVV0qhcSov+byYDDyNoEyXcWhI2r4ETJVrm
 RLh5i2/PnzyC6mySa4WrVn0Yv1krPhLQ894CyHDDjowSTMbFaN/xKH5
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_044417_977750_82CE856C 
X-CRM114-Status: GOOD (  10.25  )
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

Since configuration fields default to zero, the zero assignments are
redundant, remove them.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/arch/arm64/util/mem-events.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/arch/arm64/util/mem-events.c b/tools/perf/arch/arm64/util/mem-events.c
index 9f8da7937255cc9b14c3c58a1119b40bd0c76f6b..eaf00e0609c6c1b7d939a02fe3794471d1ed119b 100644
--- a/tools/perf/arch/arm64/util/mem-events.c
+++ b/tools/perf/arch/arm64/util/mem-events.c
@@ -6,7 +6,7 @@
 #define E(t, n, s, l, a) { .tag = t, .name = n, .event_name = s, .ldlat = l, .aux_event = a }
 
 struct perf_mem_event perf_mem_events_arm[PERF_MEM_EVENTS__MAX] = {
-	E("spe-load",	"%s/ts_enable=1,pa_enable=1,load_filter=1,store_filter=0,min_latency=%u/",	NULL,	true,	0),
-	E("spe-store",	"%s/ts_enable=1,pa_enable=1,load_filter=0,store_filter=1/",			NULL,	false,	0),
+	E("spe-load",	"%s/ts_enable=1,pa_enable=1,load_filter=1,min_latency=%u/",	NULL,	true,	0),
+	E("spe-store",	"%s/ts_enable=1,pa_enable=1,store_filter=1/",			NULL,	false,	0),
 	E("spe-ldst",	"%s/ts_enable=1,pa_enable=1,load_filter=1,store_filter=1,min_latency=%u/",	NULL,	true,	0),
 };

-- 
2.34.1


