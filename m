Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13938606C4FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J7Nxxt4g;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LGoShwCZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L2B9ns5uTBuNRhpXpJp6nynxxt5/vvxu22eFQQ/6ykM=; b=J7Nxxt4gfXKaNb
	OpoxbX6oHMQwQ8zDlx1tjo4vQJwnPT6tlq2mRAWGhgxmiYWokjlpcBlBWpIawxA+KnltiPS3Pnsr8
	bQdf/IxUsR1poiWbrcAhFA7Stb5l+w+oH75m7RsBdOLtxDK2qgO/WVna1QZwQoA5pyxSX7rS+BdBM
	zTkRP1pO/myH8ZkBUNWxPh9MGVfJ7HV73G9przKuGFq2NGOon72wSjY9v6QJlM7/+8M4qheuY09/1
	QlA2VQhnyDxWEZ1mkYox6PRbAhDeDIVwsVd84kdBYDI3APpNpGGAHxE86EQ6ikTl/aPKxeV6p6GEd
	MZZUwXylKh8gRUonyAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxC-0000000GQVx-2vnP;
	Mon, 02 Nov 2026 12:15:58 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqx2-0000000GQQ4-0JtK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:15:55 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so25866875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621746; x=1794226546; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2B9ns5uTBuNRhpXpJp6nynxxt5/vvxu22eFQQ/6ykM=;
        b=LGoShwCZxSQfH5+SoZMO4tBM/sj+X5i1vuvLVEaYaPXMkXD/yEc6RL+F7Yz9yEBiMi
         KsK9xwbsypGIWpn3BiQ+blsq39m/Jtq66JGhKvZSdPAli6W2G/noytHnqx06ntZHbQHp
         W/p2t8x6weMHiij++LjqAHa39ErDHP4QLzw/2sqXPmYJ4DKYT9cssvBvzJw1sdkomZL8
         71NXx8qAYSO9bRskTNrzL3e6SJ9I3Jakm+W+Umv4F9PX2aqqNLB9sHrWyEZh6/IJgXnz
         tFzcq6SYP3keJviDQw8eXzU8DbLBGRGFMc2zv/Cp7cEgOGveifktijMXO72s2i9e5VE5
         uQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621746; x=1794226546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2B9ns5uTBuNRhpXpJp6nynxxt5/vvxu22eFQQ/6ykM=;
        b=u80Q8ACDcpghMJbJlaX97an/q/CyZdCu51OfVRIhYr4JSzHjClLGm4MaDuCyG3k4c0
         q6CqB3hGkO5OGP8lngZRQdYqZwg6yBJhSgRHd41t/Ztuu5As9MdA9128OfzQeRVGAvPD
         M/n/I4xwg/j0+unHgIJlBzr7AhGPHScnUW1OZPdfiVeY0/EKXxB83Gl3A431Jchnp/BW
         VTtQzF2VOWoJk531e2dMldl4GUjynkGDpUF3gYEOYB+o2T32KHZqAsPRU/Jnf2mHxtiW
         DiA0FEe9t+m8pYG3E7Qt/xUEZWXGUPCMgo8JX+qmRHD2+gkufbMVr0qepYy0EaxI9k6C
         LdrQ==
X-Forwarded-Encrypted: i=1; AKwUvByyA02zGeXVIlS3arPVBoh5PaIjY3bG7ARg/ENfJlS2PGmoFrFVlz2xWAvtwBIWZDxU3gJy5Y3nJ/+J6o6muWM/@lists.infradead.org
X-Gm-Message-State: AFq9FYLVJpuLHv7a+cdZPIXSlaaAipmXOxGlo9gbNY94HS+6hbZhelct
	kgw3hFHeVZHv2C15XVu22bSbTSIM7ci/bb3a6i0lTtToN5lbEo6TssfZJz3wM9hJpZM=
X-Gm-Gg: AYBFou08eU4lAdnAXrNem6LtwqMydrGyW1QVjnd2PwmEN2n3Ns8ckRkRUKeGi9tvdUj
	lJZ4rtvWV+ABDlz/cmq0HbJNtGF2Y/6eYNS3FqtFfB57Zgad68G0bv/d1QqlR6pMhtWo7fgy/W1
	bCoZGJjp4h6hO8uT6m++on+1+608Ss9blpY6uTCqvGAaQuvGFiztA/5kl0xRtnBnO8/i5AbNEty
	euOJwKB15Y2YUao+JvLVs5kp/bVJ/29lZj/2ecC9AtOb1b/xfjWE4hRAFO7n0dRtf84IskSfYi+
	SKorjKAw3rctqiI3qlLmZpo+1k8+5ARa8RsV+yNFFcGqP++Fiti1jg+u/lQ6uBoNMLiYSrMgnNz
	lbFSjwImt04zNF7ESbKLedv5KHy5GVFR9mU0ycYTPdqHPJrGFAv1lSsQqxhvly12siYYtJ1RkfJ
	O92mCj4Uc2tGuBQcmYibMJ0pC8N+xwlw5qqAQ99spCkgbILt65DiqWQFL+dLswPUa68TveLr/Jm
	jiZf3C4ecceKpDAyz3bB5cJR4yTpdg20iuSQVLm+S+2ej5p7AqWk6GsEf+n2MUptK1bo6T/ijhs
	ANN4HlEB3dLyEpOc9Lmn5Zna0oLrc+nf
X-Received: by 2002:a05:600c:8b01:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ac16fa4f73mr240104835e9.8.1793621746179;
        Mon, 02 Nov 2026 04:15:46 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:45 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:17 +0000
Subject: [PATCH v3 03/18] perf cs-etm: Turn on context packet timestamps in
 per-thread mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-3-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_041548_207553_ED09FC3D 
X-CRM114-Status: GOOD (  16.96  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Practically this costs nothing and preempts future changes that will be
made to support decoding trace in order with Perf MMAP and JIT events.
It also helps keep samples in order when we add support for multiple
per-thread mode threads in the next commit.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index acfdb3f53821..47b4e386cc53 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -453,13 +453,26 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
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
+		 * Disable periodic timestamps but generate timestamps for trace
+		 * synchronization. Even in per-thread mode with a single
+		 * process we still need to correlate trace to a specific mmap
+		 * around execs, which can be done with only timestamps of trace
+		 * synchronization.
+		 *
+		 * Use MAX to support the kernel widening the field in the
+		 * future.
+		 */
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", UINT64_MAX);
 	}
 
 	/*

-- 
2.43.0


