Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99071C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdlWRdH/H8iL8QSy1QmXwkvjy5+5wNnPwJoBbpgZwJA=; b=fg93qJL7QRKDGmDjyMao/yB4DX
	ToIzfNU4dABAqpYnYlMhdRDwcLN1gQDygpErJn6tBdKrrw+ypb0t6GymtERX6PYCMyfkacByfjynm
	cmY/LSjjb0mzXCnG57GInu+rwLgcikJWB0V8A4YWY9t6dHOwKivKQCMBwOLqX4E42sRqBqym/dnyt
	L24UGz4CZLA8rNMWSkQJ4IHYoSiHAT7dX45Tohn5YP9bWj+yz8bvDykaBhxY8SEu+y5EqEn7md7T7
	Z+eDxFFhkQKX7PWCl7eM0iuSbSHt8sdQ50MtpRqNTyAgGMc6jcEVQ4Pdz51tlF6tLBA47d/DQNEVO
	otB7E05A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRQ-0000000EKDk-1HKA;
	Tue, 11 Aug 2026 15:31:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRI-0000000EK8d-0QVN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:30:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so26615805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 08:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462250; x=1787067050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdlWRdH/H8iL8QSy1QmXwkvjy5+5wNnPwJoBbpgZwJA=;
        b=pc9IwUBu+IzsiKjwEDGX6ezaalbRjXgiKtrwryYMGDsTpijn3R8zOBYKqMR71O7IQv
         XB5+fPmDKBM6EpQV4qd/bgZf7RrfNrHAoKX8CymfaVvcr438bQEEI2GQKF6vN8gl5dEU
         Vm+jKDAo7Jz2dK7zi5SfjoZpZBMTSt1PuZkLEujmJOx/qDz9rALr/0BW7ftDbIeoS57V
         C1EKG/IBglzYRssf2qRJxzdnISHP5Wvd726FkUJ03ACtFL4CEQofQXgO8mpU1IhMJq3N
         b16O1TYtyy0I+wiq/C2FpZkgTJcy9zPRLMCZar/MrAOjmvmVKb40D5XCKNspFTWrrpKk
         b2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462250; x=1787067050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SdlWRdH/H8iL8QSy1QmXwkvjy5+5wNnPwJoBbpgZwJA=;
        b=XD4IA9TeNZvPqKAhVp60qyGdYp6JrwKVwNnxxwlCRvlgniiqwIHXRgMQSyrdD893vo
         EgMjwMWotlexC00S1p+dvY33s5s9SlvGpiaYRDgqYM1MsBr70kYtpDo75CQLoZVPNxtG
         xcVSU2t0RDXRv1YHsS6Msow3RMYed7063FdWm8LcBUDIFqE22BE/59tVDkNygcLFp5rN
         +7XyX6gX5vanasBt5lYMfCraZUz3Vbg5D4qP/b+/t3AlOS745FHK2uNYloJSNY5IjLDx
         NSJRqc4YhqSjgJjIhTA1So43VwBbJheKyT9d5jwzFOw2jtz8ztVvT0zPvTX29LGNrNRr
         achw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8E/fAMAxsIDyABODJDK4XG0WBkCSbF7Ta6Opyck6Hxt1Ucpr05ae+hW63wk3pgnZ7PVLtUlfczPhBf1PxIEZA@lists.infradead.org
X-Gm-Message-State: AOJu0YxiuP3eGZeZar6UvPxt1rqh/3j5aIa7aGJLK0ObKx7BPwuCLPrC
	X2csm1om7+fq37IlwE47k6aip9h9pNhUAdjtCYWh0wN1zy1CriEdYVkv9+Olxf0B7w8=
X-Gm-Gg: AR+sD11aFsjb+UbAh2GkIspBiwD7mmbVqdZzRTCw2opkMLKGfp1bW2qv7j/FVusgbda
	EjAh5iP3/GWu+8HBGG9RVUNjnR4/XgEgPxw2lS/XiNdOENw133HDr5Uqfk0o0Rg2c4LT+PzhOm1
	iQaQa423cYFcwp18I2yiS/dosLqSKrllQiMM1bKVq2CLgiYsuzuJR1LdsC0T6IbX9pWUfkhtWgD
	JnkZjJJjDLpmK3n3Kdsi/2mu0UviYB9gsN3v0ihkyE6DAOn8ajMyxOWqTh/87bvIzhDfVQhv4Df
	zyZe9u2ew5WRTzORlTZ4bBjEzIqau2y+6JOFguxAgcE/gaeCKC8SRlthAEqstoDQiw1LkxrsVRv
	13vhjhxqlHOlIXHI6+6mdXtZY0rcQdAxqitZgxJ89DoY71yT8705fxQSiklylHqdZlDWJt27XvK
	g/MyS7Df7NQfGP8Id2mbCVGr6a6WaGAqshRGX/8R3jJy6XdHe2Q06Nu0KhXHqR/LMQ
X-Received: by 2002:a05:600c:310f:b0:499:737c:ce4c with SMTP id 5b1f17b1804b1-4997843703cmr53727915e9.6.1786462250133;
        Tue, 11 Aug 2026 08:30:50 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:30:49 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:06 +0100
Subject: [PATCH 03/14] perf cs-etm: Turn on context packet timestamps in
 per-thread mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-3-90565318f5f8@linaro.org>
References: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
In-Reply-To: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_083052_166535_00828BBB 
X-CRM114-Status: GOOD (  15.69  )
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

Practically this costs nothing and preempts future changes that will be
made to support decoding trace in order with Perf MMAP and JIT events.
It also helps keep samples in order when we add support for multiple
per-thread mode threads in the next commit.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index acfdb3f53821..d0486a164a70 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -453,13 +453,22 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 */
 	evsel__set_sample_bit(cs_etm_evsel, CPU);
 
-	/*
-	 * Also the case of per-cpu mmaps, need the contextID in order to be notified
-	 * when a context switch happened.
-	 */
 	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
+		/*
+		 * Timestamps are required to interleave samples from different
+		 * CPUs.
+		 */
 		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		/* Context IDs are required to associate trace to a process */
 		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
+	} else {
+		/*
+		 * Enable context packet timestamps only (no periodic
+		 * timestamps). Even in per-thread mode with a single process we
+		 * still need to correlate trace to a specific mmap around
+		 * execs, which can be done with just context packet timestamps.
+		 */
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", UINT64_MAX);
 	}
 
 	/*

-- 
2.43.0


