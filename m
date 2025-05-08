Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBD5C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 23:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rfYEy/9sSy/8XsGJmMn2Ylxn/3RsXCzZGABntdj6U60=; b=hbRHK8juVrMn5Ak+cuCOimZ5Fn
	Li+dEM+duxIZXNPD0n2fHMaeQNw7KBAdPNrxaNKK8YH9xNS7r9xVLAyT2xGRb3ur8dPCdSoXovhl9
	JSDSzOSkCZ0CyFT+/r06Ciir28Q8Uk7wv8TpQgU4Uor3tng2kyEj6TSd2PxI5JGgw9zYnl5fE55Ve
	eTwUaG9HgCEWsuuzyqnX+j1fLVC6Yy2QVAqUBbizzAnt4MZA4l20dHUh4dNQQRvNYScsubiV4wxi4
	MpKrIoBeS10uR4JJcUiQBt/txn1JYC6Hl1qwRH3rfg8VGhs7KZy52JPffKie0XQeGoLGjtoisYnQH
	HrrAWFdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDAfb-00000001zUY-1Ap3;
	Thu, 08 May 2025 23:28:51 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDAdb-00000001z1m-1Evj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 23:26:48 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-30ad9303655so2371597a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 16:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746746806; x=1747351606; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rfYEy/9sSy/8XsGJmMn2Ylxn/3RsXCzZGABntdj6U60=;
        b=Z5P22O5yz82pCUc8zQ8nTE6RIMv63mFTD3d5MwPnJnqnRzpAiqKJhhlkZhjT8AIeRr
         dUqKIDHA1gRfccBqORvQ646fbf+XdvlJu/tUQcgd077gjIH3EBh4rZ2GjxvyNY9hsZBP
         oT0AxXKuOyXBfuH2VUPLmRROpI84fSdP29qJwPkZYJTHFUB/JHP1H6YrYILd9hpMiBJW
         BvY7zhx96WYnxi6C+h6M0phzV8wx3ON4KpVMFjGaJBqARgC0VN3MYLYiOXJQDoKFE6JY
         VU7TSC/nND1eE+o0evyGhFioH1VKsodvUY3xwaA0Zj30GteO/DxxBTMSlBDyHJBW1lIh
         A9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746746806; x=1747351606;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rfYEy/9sSy/8XsGJmMn2Ylxn/3RsXCzZGABntdj6U60=;
        b=lw+uhrDIfYT6CsMu3rMZum/doSD7kZh3pqT10Qp+NgUy/T/3+B1f3LTTZaHqExO8Fs
         rPROsKfPaf/IaxfP3r+P+Qx2WO76i3dylrdLiLF1D6m+KJ5qORmdiXgrF4DBjM4Dx+8r
         Hq4O5LpCGx9UBV60mjsJCbmseoJ8cSIirPZhqd4JtHvjsTODD4yd3KMlQAxKNak10zdl
         MwbqCiIkcRVt8a2zqb1Ezt4jztMrTZUTJaOFgAyocx+ICvNojg9WaUu/fAuKDpDEo+7C
         oKkPgEfV2rT84pJofwj8Wdo+eYEaMkYITQFzLEacnV0Wv2rQ5WuQ1b8vtqEOU/h+GGRQ
         8qKA==
X-Forwarded-Encrypted: i=1; AJvYcCUx6wc1Lu7uJQNCQtZ14lLBmx+/RiGMiLxci8ZlhyruUoo/aN0V7+xpnRY5rxjVvoFcIVssWo5NJOipw5G3Pb0e@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0cNEmjSPLmkDZ79jjcaQPHjmTzwvP0dSZlep7y8zOZ8p00wPz
	74G8MgIIYuHpWz90KU0WY9UeutKr9Epz24I9b2bf427pRQnWzC2AJdjRGausa2GjBee+qmK4HgB
	/
X-Google-Smtp-Source: AGHT+IG97FSz9yCXWd8j63Cw6gLHn4U28B3RdLV5MKzUOQOfQIsxT/Hlwd4/TrJ6C1SkwKVNQYtvAQqeplI=
X-Received: from pjbph5.prod.google.com ([2002:a17:90b:3bc5:b0:30a:7da4:f075])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:52c5:b0:2ff:72f8:3708
 with SMTP id 98e67ed59e1d1-30c3d3e87d2mr2693183a91.17.1746746805843; Thu, 08
 May 2025 16:26:45 -0700 (PDT)
Date: Thu,  8 May 2025 16:26:42 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250508232642.148767-1-yabinc@google.com>
Subject: [PATCH v5] perf: Allocate non-contiguous AUX pages by default
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
X-CRM114-CacheID: sfid-20250508_162647_333853_950C8820 
X-CRM114-Status: GOOD (  21.40  )
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
Reviewed-by: James Clark <james.clark@linaro.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Change since v4:
Fix typo. Remove too verbose comment. Add Reviewed-bys.

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
 kernel/events/ring_buffer.c | 29 ++++++++++++++++++++---------
 3 files changed, 23 insertions(+), 9 deletions(-)

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
index 5130b119d0ae..d2aef87c7e9f 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -679,7 +679,15 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
 {
 	bool overwrite = !(flags & RING_BUFFER_WRITABLE);
 	int node = (event->cpu == -1) ? -1 : cpu_to_node(event->cpu);
-	int ret = -ENOMEM, max_order;
+	bool use_contiguous_pages = event->pmu->capabilities & (
+		PERF_PMU_CAP_AUX_NO_SG | PERF_PMU_CAP_AUX_PREFER_LARGE);
+	/*
+	 * Initialize max_order to 0 for page allocation. This allocates single
+	 * pages to minimize memory fragmentation. This is overridden if the
+	 * PMU needs or prefers contiguous pages (use_contiguous_pages = true).
+	 */
+	int max_order = 0;
+	int ret = -ENOMEM;
 
 	if (!has_aux(event))
 		return -EOPNOTSUPP;
@@ -689,8 +697,8 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
 
 	if (!overwrite) {
 		/*
-		 * Watermark defaults to half the buffer, and so does the
-		 * max_order, to aid PMU drivers in double buffering.
+		 * Watermark defaults to half the buffer, to aid PMU drivers
+		 * in double buffering.
 		 */
 		if (!watermark)
 			watermark = min_t(unsigned long,
@@ -698,16 +706,19 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
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
2.49.0.1015.ga840276032-goog


