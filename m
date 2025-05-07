Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE318C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 18:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ab0z/F9w7QZP+evG5akeK0TKh6nX5z62iRNswb/WdEg=; b=DO/6LMBaYMFdCRMEpbmws+55IL
	BSobO59oQrdnwCtW7tqr312h5DmQpa9I0u3uyPE7tKnBsvxAURC0QT7HErOWYq7Xt43As1UKDJT7g
	ECigETIxRPvca3m8/+25V1H2njE+LrBgtztNLKct1C3EWfn0Tqik6BH3KBtZRo7xRjDX9ZVVs6rrg
	mGG3Zjn1IjGcAF103iTuo0tzSxxIDIsZzJC3Z032Z2Ia93/9Pcw83S2rhrKTvulu49CuyzyAzp7Xw
	crC4X0Q8svRVf6yVG72ecBY+ieJe6pcpOkSTQHNgUb54gZOIDHWib0QpRdFcYbBd7y0NRbqYY87TQ
	pU0jTnmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjJ9-0000000GRlP-2tTT;
	Wed, 07 May 2025 18:15:51 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjHC-0000000GRct-2fio
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 18:13:51 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-30ab450d918so209319a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 11:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746641629; x=1747246429; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ab0z/F9w7QZP+evG5akeK0TKh6nX5z62iRNswb/WdEg=;
        b=2ZZiLA+XG2BPcPY+pRNF3Jrs9qMVNFMovh/ddcYxIzMJb5muuqfvMIDvOZgV3Ni2na
         Tnegx5/ETRhPqis11EhX3qRRJIoBgnqkp79clAdS44IuwaXLlgGm3XyY7UHxbrAFzR9D
         Ndf4LVUKRX22cI2JyPvw2EQf2K0ySFlZTFxQdmlxkScuiM5/aC3SvCdaVc5YwEST6VVs
         nne/XOATiAw/NnYMFLRV9YoJxPvi2tp/JeFtU9MdSeQN3o4NJr3bP2bD59dTe/D2WRja
         A3xDxUkBFQmvv7VjdhIManPai+vyqGboIqVhhjUsgDtTt8u7UxZv2sq/+7iMpGlCcTJk
         Jgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746641629; x=1747246429;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ab0z/F9w7QZP+evG5akeK0TKh6nX5z62iRNswb/WdEg=;
        b=twDphUHe1CI+p7UV8Yq0Ks8jMSwqzOv5pWkNgKMZ9wAPb3L22E+ndhlVlE0JkqvgzO
         4lXMl55twZwFIxkdo/oaCqfZc4XhZJsVJV8qXxaTTWziobFgrChXDHg3ebtvyFyLttSi
         FlUcciEAGmJ1A+UwfLMFxHQrLhkArP+rc9lgk0QvlasnK4zlB5UV8C0fvcRrLKTl9HLm
         G+nfq/Jtx6tq2L1o5oIB4cfMMl9EJisH2WtfSAbxxb5kbYbDX9Hl8YmfHZLZ+CPFR1uA
         RXreiREeVWaWkrOpvy6vHlTgIcuDz6l9ueRSOAGCwBiyu1GBZbtPmHegm4Uk2PmTseBr
         PIMw==
X-Forwarded-Encrypted: i=1; AJvYcCVMuEI6IyX0d65oykVOM81R1w/vb8vC43eECxR8QnXt94xtrzUKqOq9W+tFF0BWwD9fUSE4AeDX1cL/4SAfWSd1@lists.infradead.org
X-Gm-Message-State: AOJu0YzHvXaaY0z1hEZ6bsHlsLGHEFUsEPSP/gP28vLn7Cm76GKqFgt/
	WAONVxMoGltXUmXxNzWwEEu++XqHDdPoQEoblThYMVNnCj4FLWydP9LBjhRI7OJh6ZiYwU+Iuat
	n
X-Google-Smtp-Source: AGHT+IGpLtQq0H5iCUdoOPsdCAt5VRS4YQpvIHWiOc6SQmamTL+NGw8aOW9RqwiZ2NDkrnrpMD7IjSLJbok=
X-Received: from pjbpv17.prod.google.com ([2002:a17:90b:3c91:b0:301:2679:9aa])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7c8:b0:2f4:432d:250d
 with SMTP id 98e67ed59e1d1-30b3a6715b7mr207404a91.21.1746641629056; Wed, 07
 May 2025 11:13:49 -0700 (PDT)
Date: Wed,  7 May 2025 11:13:46 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250507181346.1892103-1-yabinc@google.com>
Subject: [PATCH v4] perf: Allocate non-contiguous AUX pages by default
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Anshuman Khandual <anshuman.khandual@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_111350_680622_034B32F8 
X-CRM114-Status: GOOD (  22.65  )
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
Changes since v3:
Add comments and a local variable to explain max_order value
changes in rb_alloc_aux().

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
 kernel/events/ring_buffer.c | 33 ++++++++++++++++++++++++---------
 3 files changed, 27 insertions(+), 9 deletions(-)

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
index 5130b119d0ae..69c90ea1b79a 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -679,7 +679,19 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
 {
 	bool overwrite = !(flags & RING_BUFFER_WRITABLE);
 	int node = (event->cpu == -1) ? -1 : cpu_to_node(event->cpu);
-	int ret = -ENOMEM, max_order;
+	/*
+	 * True if the PMU needs a contiguous AUX buffer (CAP_AUX_NO_SG) or
+	 * prefers large contiguous pages (CAP_AUX_PREFER_LARGE).
+	 */
+	bool use_contiguous_pages = event->pmu->capabilities & (
+		PERF_PMU_CAP_AUX_NO_SG | PERF_PMU_CAP_AUX_PREFER_LARGE);
+	/*
+	 * Initialize max_order to 0 for page allocation. This allocates single
+	 * pages to minimize memory fragmentation. This is overriden if
+	 * use_contiguous_pages is true.
+	 */
+	int max_order = 0;
+	int ret = -ENOMEM;
 
 	if (!has_aux(event))
 		return -EOPNOTSUPP;
@@ -689,8 +701,8 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
 
 	if (!overwrite) {
 		/*
-		 * Watermark defaults to half the buffer, and so does the
-		 * max_order, to aid PMU drivers in double buffering.
+		 * Watermark defaults to half the buffer, to aid PMU drivers
+		 * in double buffering.
 		 */
 		if (!watermark)
 			watermark = min_t(unsigned long,
@@ -698,16 +710,19 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
 					  (unsigned long)nr_pages << (PAGE_SHIFT - 1));
 
 		/*
-		 * Use aux_watermark as the basis for chunking to
-		 * help PMU drivers honor the watermark.
+		 * If using contiguous pages, use aux_watermark as the basis
+		 * for chunking to help PMU drivers honor the watermark.
 		 */
-		max_order = get_order(watermark);
+		if (use_contiguous_pages)
+			max_order = get_order(watermark);
 	} else {
 		/*
-		 * We need to start with the max_order that fits in nr_pages,
-		 * not the other way around, hence ilog2() and not get_order.
+		 * If using contiguous pages, we need to start with the
+		 * max_order that fits in nr_pages, not the other way around,
+		 * hence ilog2() and not get_order.
 		 */
-		max_order = ilog2(nr_pages);
+		if (use_contiguous_pages)
+			max_order = ilog2(nr_pages);
 		watermark = 0;
 	}
 
-- 
2.49.0.1045.g170613ef41-goog


