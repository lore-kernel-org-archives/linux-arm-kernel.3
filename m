Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747C5C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 19:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LEDtKxpB5q8jrgOwnlyi/GDCV0Qp38aBfvEzIFJZGh4=; b=u3rEZ2/2JG4+Rzpu+PztdtmRxD
	qfbcYxg5RJ2zuzNUiTzCviLCBMjiVPUxxQ8s32DABqe9ulwPJdchNnI5om9k8yA9shcNafphPAlXA
	UlLn3tbcVtOlwtwWC+LA31yW1IZMIi/lYgHnemxyQd4OHRL5iyzQJdQxbAn+SQDm27xV20l8TynLc
	0tFxhOicJvxkdQScWiiBHeNjSmoEG9xfDmRniqeWV6PVvFnSwuDZZEk09g/Z94Gl61X6QfuuSLWDF
	4+luB7Pcmo03dOdC0fkyCjDXSGfSqYsHXNY8oRPnKRiwSrmzJiiPkqbkVyqiT1LPva8NOVYrbWIho
	NyG4nMQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAZkJ-0000000GVHB-43Ap;
	Thu, 01 May 2025 19:38:59 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAZhR-0000000GUqP-0pwK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 19:36:02 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b19226b5f7dso940116a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 12:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746128160; x=1746732960; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LEDtKxpB5q8jrgOwnlyi/GDCV0Qp38aBfvEzIFJZGh4=;
        b=Ik2dwqiDRZdq5Clt3B3VRPJJQqlHye9VTqqISIZFBBt/Mcnp9oEAduWCXsP21eKt//
         A8J0Kq+tXTPK3DY95CTUkW4H96dnHienWyJ7GxYqsZMRfUcgB6dQqqZJw92IsDJOVnh/
         rYQICpBI1ajvfYmvA2dJme/Ci2s40uYj5igRc8xwtCNnNFEeZOJKNK+mZX7MOO/rZ9ti
         lGvDP4yi2DOpSp3t00+bTQ/Lz05dYl58/DIEKSGxz4Oh2mJjhHA5G/2rhv+Jrzn+/wBT
         rHHN/kUA2UC7+UEvlcQLuNAJ+P/UdcgGK9Dk1wingnc1wqsEVEsahYUiy1ukjb1wThCi
         Lvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746128160; x=1746732960;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LEDtKxpB5q8jrgOwnlyi/GDCV0Qp38aBfvEzIFJZGh4=;
        b=kIPXz8pixmQByKzg9QikULwGGZWN97NOC9Zq8Uk4GrvMyAFpCnaERnMKfyL9yfvdyw
         upAMmH6NGngFu6NEWv+j7hGkB9V+K7sS7tqGhmBgURrqQin0CW/C281VgQQMhY47ePPk
         Dwl2xrYqxtGaNLuGamoqnmgI0G2gpCKVVBhMFerB8jEFb+9BG4grkyUbtkYqkpAbgH8R
         c90lGmJBQWFPy8Qfj63+fuDkG2uK+NtbzaxwLD2t93EyOQikvPsah/ka4b88UmYslf/l
         A/IdQN1X66o9Y88YhIpNioSjjWX0ITRyX6qKvZ7ymxyn9V/AagGnrViK1r1VfGS+kBrA
         lnsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0s7EoIUqUsr0O3L/I2atBCU31WACrsCvSwhCfEkHCj6Dg8x4uecRhCCDr4dCwOdU0qpZZklrWF5ltds2wtOA9@lists.infradead.org
X-Gm-Message-State: AOJu0YyGR1ipfuadb9xrsCzeOs1oNIJJht0JbGkmb/VoiqtXE+Z2Q2vt
	SlrLydF8rGMq308U/ztAShXX0u/qDYO6Isc5721ke9tBh43VD86oggfrgToEGfkzbpQyG935p5S
	1
X-Google-Smtp-Source: AGHT+IE6wxJc/MynCTvLfWmZg8sc0YNfmkiks/SPQUXxNJhz+FsSIYN9ja9GZU1NwfD/74dVeQ/ByWfKWww=
X-Received: from plhl18.prod.google.com ([2002:a17:903:1212:b0:22d:e49c:3cb])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3d07:b0:21f:2e:4e4e
 with SMTP id d9443c01a7336-22e1001e505mr6441495ad.5.1746128159641; Thu, 01
 May 2025 12:35:59 -0700 (PDT)
Date: Thu,  1 May 2025 12:35:56 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250501193556.23473-1-yabinc@google.com>
Subject: [PATCH v3] perf: Allocate non-contiguous AUX pages by default
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_123601_244432_F1C9F1F4 
X-CRM114-Status: GOOD (  20.33  )
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

perf always allocates contiguous AUX pages based on aux_watermark.
However, this contiguous allocation doesn't benefit all PMUs. For
instance, ARM SPE and TRBE operate with virtual pages, and Coresight
ETR allocates a separate buffer. For these PMUs, allocating contiguous
AUX pages unnecessarily exacerbates memory fragmentation. This
fragmentation can prevent their use on long-running devices.

This patch modifies the perf driver to be memory-friendly by default,
by allocating non-contiguous AUX pages. For PMUs requiring contiguous
pages (Intel BTS and some Intel PT), the existing
PERF_PMU_CAP_AUX_NO_SG capability can be used. For PMUs that don't
require but can benefit from contiguous pages (some Intel PT), a new
capability, PERF_PMU_CAP_AUX_PREFER_LARGE, is added to maintain their
existing behavior.

Signed-off-by: Yabin Cui <yabinc@google.com>
---
Changes since v2:
Let NO_SG imply PREFER_LARGE. So PMUs don't need to set both flags.
Then the only place needing PREFER_LARGE is intel/pt.c.

Changes since v1:
In v1, default is preferring contiguous pages, and add a flag to
allocate non-contiguous pages. In v2, default is allocating
non-contiguous pages, and add a flag to prefer contiguous pages.

v1 patchset:
perf,coresight: Reduce fragmentation with non-contiguous AUX pages for
cs_etm

 arch/x86/events/intel/pt.c  |  2 ++
 include/linux/perf_event.h  |  1 +
 kernel/events/ring_buffer.c | 20 +++++++++++++-------
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
index fa37565f6418..25ead919fc48 100644
--- a/arch/x86/events/intel/pt.c
+++ b/arch/x86/events/intel/pt.c
@@ -1863,6 +1863,8 @@ static __init int pt_init(void)
 
 	if (!intel_pt_validate_hw_cap(PT_CAP_topa_multiple_entries))
 		pt_pmu.pmu.capabilities = PERF_PMU_CAP_AUX_NO_SG;
+	else
+		pt_pmu.pmu.capabilities = PERF_PMU_CAP_AUX_PREFER_LARGE;
 
 	pt_pmu.pmu.capabilities		|= PERF_PMU_CAP_EXCLUSIVE |
 					   PERF_PMU_CAP_ITRACE |
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 0069ba6866a4..56d77348c511 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -301,6 +301,7 @@ struct perf_event_pmu_context;
 #define PERF_PMU_CAP_AUX_OUTPUT			0x0080
 #define PERF_PMU_CAP_EXTENDED_HW_TYPE		0x0100
 #define PERF_PMU_CAP_AUX_PAUSE			0x0200
+#define PERF_PMU_CAP_AUX_PREFER_LARGE		0x0400
 
 /**
  * pmu::scope
diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
index 5130b119d0ae..4d2f1c95673e 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -679,7 +679,7 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
 {
 	bool overwrite = !(flags & RING_BUFFER_WRITABLE);
 	int node = (event->cpu == -1) ? -1 : cpu_to_node(event->cpu);
-	int ret = -ENOMEM, max_order;
+	int ret = -ENOMEM, max_order = 0;
 
 	if (!has_aux(event))
 		return -EOPNOTSUPP;
@@ -689,8 +689,8 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
 
 	if (!overwrite) {
 		/*
-		 * Watermark defaults to half the buffer, and so does the
-		 * max_order, to aid PMU drivers in double buffering.
+		 * Watermark defaults to half the buffer, to aid PMU drivers
+		 * in double buffering.
 		 */
 		if (!watermark)
 			watermark = min_t(unsigned long,
@@ -698,16 +698,22 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
 					  (unsigned long)nr_pages << (PAGE_SHIFT - 1));
 
 		/*
-		 * Use aux_watermark as the basis for chunking to
+		 * For PMUs that need or prefer large contiguous buffers,
+		 * use aux_watermark as the basis for chunking to
 		 * help PMU drivers honor the watermark.
 		 */
-		max_order = get_order(watermark);
+		if (event->pmu->capabilities & (PERF_PMU_CAP_AUX_NO_SG |
+						PERF_PMU_CAP_AUX_PREFER_LARGE))
+			max_order = get_order(watermark);
 	} else {
 		/*
-		 * We need to start with the max_order that fits in nr_pages,
+		 * For PMUs that need or prefer large contiguous buffers,
+		 * we need to start with the max_order that fits in nr_pages,
 		 * not the other way around, hence ilog2() and not get_order.
 		 */
-		max_order = ilog2(nr_pages);
+		if (event->pmu->capabilities & (PERF_PMU_CAP_AUX_NO_SG |
+						PERF_PMU_CAP_AUX_PREFER_LARGE))
+			max_order = ilog2(nr_pages);
 		watermark = 0;
 	}
 
-- 
2.49.0.967.g6a0df3ecc3-goog


