Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F6DCCF2D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pk+482C5QT64UqLIfTHE0exsRm+80jWHxmqcZbu6Fsg=; b=sE0seyAXU9FlvhcNDID1U1vvf4
	Pg/2vUBZBYZrW8P5NLoX62dt3QaSLEffOg4BUgayr3m515M+E2EmhmMIk2EmbCtqYRgxPV1YO0SlO
	B1p5dgveOgHD9qwtVG+c+HqH3IbTkO2wQYBbc4fmk3ZqmCUyvlbDwmeV99IZ9zGEC3W8iP6XvURJd
	A1PsfhwrZpwGLt5YPbSNuzoGAGKbG+a32aYKI37dPFueOM0D9aNwdmrF7XXTI0pJ/6CGt1KBSYeqm
	UrezFlHZSJxTsLGb4ijL1ayD5mmXr1rA3hrHmqwW+IXtVNNftIBh0BRcTIUY91Ch8z8CLUa3gbFPs
	BEZ+OqAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmLZ-00000001k9l-3CXX;
	Mon, 19 Jan 2026 10:18:57 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmLV-00000001k7i-2eSa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:18:54 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so3591881f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768817932; x=1769422732; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pk+482C5QT64UqLIfTHE0exsRm+80jWHxmqcZbu6Fsg=;
        b=aTWMbtXzl/mpvch2J8tI7uPEXXqNOqLGdSN/BSInz6dYQCk6sf7T0D8VJYhZCcDpp4
         qzaRJOCrXcgQLtKyGlCqfbID3wytPKkq+K/tlZK5GKlpI11PejlEMQlOuMow3utXazsr
         tHNJ0cbgcltzmUJ6vVYyv8AfjBjZzWmWxXfkuypMTXoVCgxeVFj6pmeAPquKlgvnbns4
         QXhUh3vk+Lef7x31y1LW9LGlhxAeN86ZdYYkRQseDpDJvqYeUs3u/JVrYSghpszmsufb
         XbLoMLmBamWp7Sy4qZ+5+NV6U7MhviGLbtRtOWc81zpDqAJUpG8jLUM6Lde1F6uDmZxN
         0tTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817932; x=1769422732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pk+482C5QT64UqLIfTHE0exsRm+80jWHxmqcZbu6Fsg=;
        b=aFuCNOsDmWlGyADSP4ZKO9o7sF/eA3DP7ue61MBQjFyN1s2QR2VX3tM+B0jo6Yik4C
         7XqV4fTcYaDo9UscRsj5IteLk3Xl8+pgsn029FeB6k04hpOnCnPtGober+wMR7wDXSAx
         NkoBK4Y/JIj+vuF9Xv6V5MwtTw8v975ee649BBOkAztdG2zK1c/hDz9m4C7dvWlI1UEy
         VvKHG3tG2djKDqu73IAcPYiEuNjCe7Kie+iRfznLGEaUapKW5Bh5qYwI/pW62cpMeBx3
         Dufw1BtLTNzbFN6S7orkfVZvgFfAqqTg5GjkSiRmun3MD64h6hD3ZT6Gz+8R3gHtTv5W
         nf/A==
X-Forwarded-Encrypted: i=1; AJvYcCVZu3wLVfoFlr5GSQQZUeFjjxBZu1viXzP4SD9O0Qh77G37YNkfo8+uWhDky1DagsRvHQ964TxdLvUrXa7H/3+E@lists.infradead.org
X-Gm-Message-State: AOJu0YzEguVJopZiFObY2A5LGUufw+SsBEdBy9/6bRb7XAj1YV50z//j
	gzKNCPk8TDtJ+43m3WucoEf7pGMRmmXMSTigpFH1mc4w53RB2PGym7Si5xAOZTFJjXw=
X-Gm-Gg: AZuq6aJWh4i64f1CFCdWaEVtlv3ZQfxAotTFJXaK9j9beeEVT0r4DGkIElIosXBAOuM
	7x86l4Tl0kHnAK+onjPGO2PS1Ci4PBEqNlAjPzrcMXn5OPdU3JiuLH22t7L9jeWi4l7qAVCE9N2
	xhBONCC3Y6ieOaOIsNDP/cnFLfS7UdPi8KwYQbN31Rqrrs6Q3gfeoNgNFey78MVoQ/oBqbLXP1R
	FiWtu2Se0O2mJIB5krsZ+o4ka1QiKyEuZvloGsHKxf4y31BNgVO9Gl0B9Lax24Rp/uE6Em8mSzV
	5AMT6En8K4JxzZgrDw9+t9Miniiw7Y7Dzb8R3bJ5nsUrRSglkITWO7bS89/8lM6VZMxmJVBbWJ4
	mbHqeCFIQroBvV4QWlu0tpOu55AD5CLfEOtCL0LET3cB+Eg0L8M4Fqyu/Dre8kDvUujjOUddXMV
	1af5OV8NknfnFRmp/bPG2l
X-Received: by 2002:a5d:5c84:0:b0:432:aa5a:3916 with SMTP id ffacd0b85a97d-4356a0773b9mr14896581f8f.40.1768817931588;
        Mon, 19 Jan 2026 02:18:51 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6cdsm23286150f8f.31.2026.01.19.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:18:51 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 19 Jan 2026 10:18:35 +0000
Subject: [PATCH v2 1/2] perf cs-etm: Fix decoding for sparse CPU maps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-james-perf-coresight-cpu-map-segfault-v2-1-56b956a629ee@linaro.org>
References: <20260119-james-perf-coresight-cpu-map-segfault-v2-0-56b956a629ee@linaro.org>
In-Reply-To: <20260119-james-perf-coresight-cpu-map-segfault-v2-0-56b956a629ee@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Thomas Falcon <thomas.falcon@intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_021853_688309_831653FB 
X-CRM114-Status: GOOD (  17.34  )
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

The ETM decoder incorrectly assumed that auxtrace queue indices were
equivalent to CPU number. This assumption is used for inserting records
into the queue, and for fetching queues when given a CPU number. This
assumption held when Perf always opened a dummy event on every CPU, even
if the user provided a subset of CPUs on the commandline, resulting in
the indices aligning.

For example:

  # event : name = cs_etm//u, , id = { 2451, 2452 }, type = 11 (cs_etm), size = 136, config = 0x4010, { sample_period, samp>
  # event : name = dummy:u, , id = { 2453, 2454, 2455, 2456 }, type = 1 (PERF_TYPE_SOFTWARE), size = 136, config = 0x9 (PER>

  0 0 0x200 [0xd0]: PERF_RECORD_ID_INDEX nr: 6
  ... id: 2451  idx: 2  cpu: 2  tid: -1
  ... id: 2452  idx: 3  cpu: 3  tid: -1
  ... id: 2453  idx: 0  cpu: 0  tid: -1
  ... id: 2454  idx: 1  cpu: 1  tid: -1
  ... id: 2455  idx: 2  cpu: 2  tid: -1
  ... id: 2456  idx: 3  cpu: 3  tid: -1

Since commit 811082e4b668 ("perf parse-events: Support user CPUs mixed
with threads/processes") the dummy event no longer behaves in this way,
making the ETM event indices start from 0 on the first CPU recorded
regardless of its ID:

  # event : name = cs_etm//u, , id = { 771, 772 }, type = 11 (cs_etm), size = 144, config = 0x4010, { sample_period, sample>
  # event : name = dummy:u, , id = { 773, 774 }, type = 1 (PERF_TYPE_SOFTWARE), size = 144, config = 0x9 (PERF_COUNT_SW_DUM>

  0 0 0x200 [0x90]: PERF_RECORD_ID_INDEX nr: 4
  ... id: 771  idx: 0  cpu: 2  tid: -1
  ... id: 772  idx: 1  cpu: 3  tid: -1
  ... id: 773  idx: 0  cpu: 2  tid: -1
  ... id: 774  idx: 1  cpu: 3  tid: -1

This causes the following segfault when decoding:

  $ perf record -e cs_etm//u -C 2,3 -- true
  $ perf report

  perf: Segmentation fault
  -------- backtrace --------
  #0 0xaaaabf9fd020 in ui__signal_backtrace setup.c:110
  #1 0xffffab5c7930 in __kernel_rt_sigreturn [vdso][930]
  #2 0xaaaabfb68d30 in cs_etm_decoder__reset cs-etm-decoder.c:85
  #3 0xaaaabfb65930 in cs_etm__get_data_block cs-etm.c:2032
  #4 0xaaaabfb666fc in cs_etm__run_per_cpu_timeless_decoder cs-etm.c:2551
  #5 0xaaaabfb6692c in (cs_etm__process_timeless_queues cs-etm.c:2612
  #6 0xaaaabfb63390 in cs_etm__flush_events cs-etm.c:921
  #7 0xaaaabfb324c0 in auxtrace__flush_events auxtrace.c:2915
  #8 0xaaaabfaac378 in __perf_session__process_events session.c:2285
  #9 0xaaaabfaacc9c in perf_session__process_events session.c:2442
  #10 0xaaaabf8d3d90 in __cmd_report builtin-report.c:1085
  #11 0xaaaabf8d6944 in cmd_report builtin-report.c:1866
  #12 0xaaaabf95ebfc in run_builtin perf.c:351
  #13 0xaaaabf95eeb0 in handle_internal_command perf.c:404
  #14 0xaaaabf95f068 in run_argv perf.c:451
  #15 0xaaaabf95f390 in main perf.c:558
  #16 0xffffaab97400 in __libc_start_call_main libc_start_call_main.h:74
  #17 0xffffaab974d8 in __libc_start_main@@GLIBC_2.34 libc-start.c:128
  #18 0xaaaabf8aa8f0 in _start perf[7a8f0]

Fix it by inserting into the queues based on CPU number, rather than
using the index.

Fixes: 811082e4b668 ("perf parse-events: Support user CPUs mixed with threads/processes")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 25d56e0f1c07..12b55c2bc2ca 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3086,7 +3086,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 
 	if (aux_offset >= auxtrace_event->offset &&
 	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
-		struct cs_etm_queue *etmq = etm->queues.queue_array[auxtrace_event->idx].priv;
+		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, auxtrace_event->cpu);
 
 		/*
 		 * If this AUX event was inside this buffer somewhere, create a new auxtrace event
@@ -3095,6 +3095,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 		auxtrace_fragment.auxtrace = *auxtrace_event;
 		auxtrace_fragment.auxtrace.size = aux_size;
 		auxtrace_fragment.auxtrace.offset = aux_offset;
+		auxtrace_fragment.auxtrace.idx = etmq->queue_nr;
 		file_offset += aux_offset - auxtrace_event->offset + auxtrace_event->header.size;
 
 		pr_debug3("CS ETM: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64

-- 
2.34.1


