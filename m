Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D30D59D79
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 17:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cuvcv2lbWvYVuRSYmt56lNMq7JGP2eQh2fFRiG9NcI=; b=1d0sGRKReDycaMIE7DNE+O0OZE
	8wepxQGkmygLZuQNT+sIDI9uLTR4NlNXEdXZMDgqxbb8+hSB0pLdmwA/3AfbaTdqUxpeYBDwxtetm
	9yJIF/BWDLtUgR2AV+hJMsaexts21vTrqbMTpVth5eSKBDuh5EkSgOl/3TbNv2HjoFtZ8YMpTG4Qz
	pzpRJFw64SYfsgkh3Sli/wzuvG7Cf3yR0GpwcKZfYN4hCS36AuKoYagOfJNmZJRc45OzPSXtxQCxd
	D35oFqA9LFqXYccH68WLL/kKQe2Pn5Z0vP7iy8Yu1JCkLibIsdWM0ixszDgnxrHQIriHKLJwqpgiS
	+fl0P59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU6tH-00000000tCS-2ZZl;
	Fri, 12 Dec 2025 17:25:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU6tD-00000000tAz-1KoR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 17:25:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 058681575;
	Fri, 12 Dec 2025 09:25:02 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5746D3F762;
	Fri, 12 Dec 2025 09:25:07 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 12 Dec 2025 17:24:59 +0000
Subject: [PATCH v2 1/2] perf mem: Simplify Arm SPE event config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-perf_c2c_update_event-v2-1-27df9a6cb1d4@arm.com>
References: <20251212-perf_c2c_update_event-v2-0-27df9a6cb1d4@arm.com>
In-Reply-To: <20251212-perf_c2c_update_event-v2-0-27df9a6cb1d4@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Al Grant <al.grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765560304; l=1280;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=BVRuC5QKnJ/z2ZEeUzEx34gL2ArjI7gvoGzXbqZSg4o=;
 b=ehFYhgtqv1Aud4+MWUfiqUzamXtqM/R2Bar0O1Q9w3ZWUlOdPu2h26e0Qwj6E46PjqeERCN6L
 jo5jJ0d1JE4CY2QkoKiTcz5Z0UXPPRZ9rrqpTccVedQ56tCC+ptV15B
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_092511_590830_10781D8E 
X-CRM114-Status: GOOD (  10.46  )
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

Reviewed-by: James Clark <james.clark@linaro.org>
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


