Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CDDD3B7F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 14:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ls6iiYqzfm34lFVKKpOeVQLMElwj6qnMc/N2H8cTBM=; b=3wAIGcJb/rYRikvjEcScf/Infs
	HeyssUo1pVyky4Cdriv2knT4K5yL5A8+ICdUE0w9SPUY3ydz9tFbojkg7RgvITS+maX0grMWO8vw9
	zxDJ9AAA5VInNysiVLZ0VcpO0QPRe9aHE9kNlOm5mRH7e4yKtGIt3clliAH12qS5JgRojXIQCFcW9
	Ip60hSbteCNvIwwA7cIeu3REJFC8CivH3QyGTN41QVOAeRXERuLI/jBMGCRv98YKxrsc/nye3Y6AQ
	nIaS7sZYIJ8zQgQZHYkXQoiVUvK9umQQIzPBe+b0G/x/ToFCvBbi3aLWFEEhEMWmMbK2PkcpvSjAD
	wRTeh8Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9C-0000000DB8N-2tnD;
	Mon, 08 Dec 2025 14:23:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc99-0000000DB4s-0r0O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 14:23:28 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477aa218f20so28891345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 06:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765203805; x=1765808605; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ls6iiYqzfm34lFVKKpOeVQLMElwj6qnMc/N2H8cTBM=;
        b=Pe+T0xFeAwQBLf39s8Dyb2C9XNOYf9ycp9c2eDH/r0k5x2HcLa1K9HNl4USlKBzMD7
         v1CawMZBTsan3dJaXBsKmiLf9e1DiTtyBSAwcv/lUdQ5UQu7s8532y0hAR1jse0G1ePK
         JveUIN5UTU8KxcyZTm+Nt8G4Y51xNvM8kLNr527xlVxt4VuUxkXtSmJ2azsRSLT2MIiC
         LGhsMa34D5dzW5WAAwUgPfzNPMOfuNPD5MF2wohZdLRjrCWJObvo3bXB/3+LPeDcGROM
         H7ARKGfZJUtk85+/7nTvbbPdeXDnNk6rMhD+C4znxicTXGWBPW92bA6U7EvAd1paogEy
         bqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203805; x=1765808605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1ls6iiYqzfm34lFVKKpOeVQLMElwj6qnMc/N2H8cTBM=;
        b=V06FXhnHCxNdKEvXoKw5e8NKWVuHOhsKsp4/c5T2X5ZvwYn25TXfmXSmitoTwWLwA5
         hcOHJM4zSjDakvINftR406cEinWhS+5/uo3LkW8l27FrIh18Pq0wZapLIRltw00nmTMs
         vHc/v8Lggfq7NWzvVCiFJuNa9AG/bWCkYi/n2HyzI+zrFXj4DfZ2EMTFTC33Hu0zIVwP
         0WeXHllsT9akFySrHUcVr3A7PqSAfUmHrN5We6pXKFmwwNO1kJhiol7H1KSGsY7ImAqQ
         3TcStF4ZWjkjWGtVjWDMPunMH+eorwDi2XrB/NfxAOurk65wxN3f0YayfzURUk7kK2NA
         Wy2A==
X-Forwarded-Encrypted: i=1; AJvYcCWZ2DVFf1iZYoWlTNSIH0duoi70OMHiV+RlrcU75ImvnruJBg4QaUSqpp6TPb1dx78YzhFnKp0fgiSCnRAesHU6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4ppO3e/10qy93ivKwzdz09a8QpRIJSxFPAo3MJAYL1V9m4hmb
	4D8DFdO3+Iv9Iuj+bvsRkuO6XDcZBKb4BIStXgSZ2CCEHFV5Tz1X3KhwLT4Ubwz7vNuvBu4TvH0
	uOVMc
X-Gm-Gg: ASbGncvlvv+R/8I3IFSfBX1rJXcyqg0qQeMstlFX6owFDWk4db/afNJVhJdfsP4wJLw
	3MfX4RqArJ8mz8UGFaTWDJYl8GwSPDAR3zzENiyUFwx/FoZN4tgb8vUcYLzrbtkhK4etWNZvlUz
	R4Zyu6Mx0CN1oCtSm9QdsrR5QQWXcPsX9U7EIVrpgwlLhAdW1iScyUq3o77YeibGN6MQD8VmNmo
	Ts+VlZG9Y9gbiWvWL34WLfNgrh1fjcByeeA9nVSS07fCMxa+8VQTM8p4GeCbNPPh89ZS7Rk7ecC
	L6qylKWeB96eXcwfjqNN137OGyYY/GEkCtwyCuu7nyIZeB0CjASELLMoEHqpT27OcVl6sWwSag4
	1cnhvMaJbSZJmruxROw+nn2kOy51VBJ8yKe4Dor7zo+yqRaQX5GyCQ/c5HQJ/KhamQYqmdd3MHv
	EECq2ZGOe2k1KPSVlJuoxR
X-Google-Smtp-Source: AGHT+IGGTDdxCfCm0gM0xxGcrXYIAxTama8dQFiA46eg6cBGPBkKoqG9sjgcfOrOmOKxOesrQvK/gA==
X-Received: by 2002:a05:600c:4743:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-47939e246e0mr79324475e9.21.1765203805314;
        Mon, 08 Dec 2025 06:23:25 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930920e0dsm248561065e9.2.2025.12.08.06.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:23:24 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 08 Dec 2025 14:22:09 +0000
Subject: [PATCH v2 06/12] perf parse-events: Always track user config
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-james-perf-config-bits-v2-6-4ac0281993b0@linaro.org>
References: <20251208-james-perf-config-bits-v2-0-4ac0281993b0@linaro.org>
In-Reply-To: <20251208-james-perf-config-bits-v2-0-4ac0281993b0@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, leo.yan@arm.com
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_062327_268164_8EF63E5B 
X-CRM114-Status: GOOD (  18.39  )
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

Requiring the 'pmu->perf_event_attr_init_default' callback to be set to
track user changes is a bit of a trap to fall in. It's hard to see that
this is required when depending on the user change tracking.

It's possible to want all 0 defaults so not set it, but at the same time
still do some programmatic setting of configs with
evsel__set_config_if_unset(). Also if a PMU reverts to 0 defaults and
deletes its existing callback, it will silently break existing uses of
evsel__set_config_if_unset().

One way to fix this would be to assert in evsel__set_config_if_unset()
if the changes weren't tracked, but that would be a possibly untested
runtime failure. Instead, always track it as it's harmless and
simplifies testing too.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/parse-events.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 7a3a90377896..c58829004fb4 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1528,12 +1528,8 @@ static int parse_events_add_pmu(struct parse_events_state *parse_state,
 		return -ENOMEM;
 	}
 
-	/*
-	 * When using default config, record which bits of attr->config were
-	 * changed by the user.
-	 */
-	if (pmu->perf_event_attr_init_default &&
-	    get_config_chgs(pmu, &parsed_terms, &config_terms)) {
+	/* Record which bits of attr->config were changed by the user. */
+	if (get_config_chgs(pmu, &parsed_terms, &config_terms)) {
 		parse_events_terms__exit(&parsed_terms);
 		return -ENOMEM;
 	}

-- 
2.34.1


