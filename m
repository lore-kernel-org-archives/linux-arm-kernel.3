Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ED4C5CFE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcFhjwes9A89zvUuGgSpPmP9VQvVv75EU6Q8BfuMsS4=; b=jzuoJt5znYUPz+BtHH2rYa+ghz
	OGBeVfLMVT8njHnvOh/1Zn5raXRcLHWFRGrkVzhXE10JAkhH7CUPLd+GNxqC3J9ZeM9g1aTQGPbnf
	UTNBvWRkbxiA0qv0WtzOUfrlFi3XZhMe0MIdmQHiIcNq+vMUZDCAcZPqktWeze3KFZqz/aFXz4gh7
	kLypIm40aNOpbd1PpjjqCEYeQp+09+RMF01WDz5/I7+MUOKCexdwab4KRugG7PqC65z4qK9zCseYp
	CgeOEt6PewgWZZtkFBiYuuXwJNz3XkpzNmyFUoeWMA3Kv6jQyTQtuZAzuSws7WwmsFujdL4SZYVlW
	ht7yTN0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRQ-0000000EKE9-2DCd;
	Tue, 11 Aug 2026 15:31:00 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRL-0000000EKB4-3eH1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:30:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so26616505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 08:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462254; x=1787067054; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcFhjwes9A89zvUuGgSpPmP9VQvVv75EU6Q8BfuMsS4=;
        b=DMJE+FjAuODe1n89VyQQpXperomobRrgGij+2G3gZmhAEXR+usC+o6+DrKup6TBfLB
         1HkVsbYvWfH4x458AsFVQqTZ9CaUHNORBUB+2nwgwGUs29mPHSY6xeOaeUnfpQfyYiwb
         3HrN5gW2+FJpc8Z/swI7VLv6wIh2VIbgFqkFYqnAcVxqteppbkisQJTSgukXRlF6XS0W
         MHvFd6x9sy8V0fDFC7lnyLri2hXbrjFdQmzsbCLcdLt4CjhwL2QBuyl/JaxAEfa//NjF
         P5P3++uVpRA9yrrl7ZqQINRh5g5WIhj2H4LkPLfema5yfYO6NpXoNiXnb2Mx25PaXM9d
         65aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462254; x=1787067054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcFhjwes9A89zvUuGgSpPmP9VQvVv75EU6Q8BfuMsS4=;
        b=Ts38tYDZACHExGRRl+ySN3XhKmMV7J6ltvcIWbE3dz/owP1NHs3d60/iOPDDvPWQMT
         L13Y4mDR/cNsMLBtCDp+agaUrLNAA04oQPl2zwjFNvRw8DSxeAiogeYqOdP3R/uHM4nl
         3zQQWzyFaAvBaVN4wOcxFLW8wf+0YxZ2iaUOpB4L/iWWE3tGSr4FwS1CqVfI7m4gZz8i
         ZY1HXJpMi2tvIatFauoBRKk5fEfnh1+ijH4d3sBIRamcu+NY30UJIFKDYyCFCY2+g6tD
         9meXuU11jRop7kIsLpjDdOZbnUtflghCO9lcSBVAV8W6CKzfE6SAesrzO1TTZIDQx5F2
         vMlQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEFVQw9KhC+uELCohC4rqS83Gw6xTkTStZPtocwkIKu9w89qekswbb0LibWGSfdOmN2L+OgIpRwI7hCfHJHzRD@lists.infradead.org
X-Gm-Message-State: AOJu0YyBvpLh0pPTia4z/qHPSey9SMHT7oW+g9Lfi3BP03Pzw4x9divC
	mye3Rfg24j9l00hv8oCyCOg2DvpD0bIUpymD2mLAw8Q4+T2Pv1aG1dyjVihVWGr+fQ4=
X-Gm-Gg: AR+sD11I/GSDwUdWmvgkiCdS+LNGwi4/MSWab8Ki8CF8h+Sk6rRJZYAiKngbP1tb1nZ
	f35KQN0omHqCmUUTGLT43enkGo5oKNyfHAz18cJfPetc9X/KOHl8ZBmCPGhthcI7QZYMMbtRzYI
	/0QpDsHrSfn/n5AV6Tx4UTy9mUCmGwMZPTUysvYu4M0yVIBUtsg2erYN0cPopyxyZQGHd3CdG7g
	WLoEjPJiuuyuQObdDpxRFx4Xs/0FkZDYD2+6z5qCKHZoO2ly7gQA3LCpKH1gG0BooV8AnYR2pFI
	ZDnHj2L3//bRgT8d/i3PIThe4m1o1AwMXnrW2nzizOWSA+c24hyGuJDFQPLc//jIy++tV58jseQ
	kNd1KmEsqMv0E8BbeDKSGR3Hn6dP5mcdutcFDXE8r+oS01FkHCWHD4dytQjtq4sd7zA5Lcp6/8I
	Z2lBXeHAR8arEEHb79/aWhhk0YVg372/7KDdRaU0iYeGcgrf/RWb1OrwTTjybaIUY6R794FQ==
X-Received: by 2002:a05:600c:8219:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-4997842db6cmr72514755e9.4.1786462253990;
        Tue, 11 Aug 2026 08:30:53 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:30:52 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:08 +0100
Subject: [PATCH 05/14] perf cs-etm: Increase default timestamp generation
 period
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-5-90565318f5f8@linaro.org>
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
X-CRM114-CacheID: sfid-20260811_083055_956033_057F117F 
X-CRM114-Status: GOOD (  16.05  )
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

The original purpose of timestamps in per-CPU mode was to roughly emit
samples in the order they occurred across multiple CPUs, rather than
emit all the trace from CPU 1 followed by all from CPU 2 etc.
Previously there was no way to change the interval from the minimum of 1
cycle, but custom intervals are now supported by the driver.

Drastically reduce the number of timestamps emitted by increasing the
interval, which is more than enough to interleave sample generation.
This reduces the size of the trace generated.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index d0486a164a70..d36b7e41399b 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -70,6 +70,9 @@ static const char * const metadata_ete_ro[] = {
 
 enum cs_etm_version { CS_NOT_PRESENT, CS_ETMV3, CS_ETMV4, CS_ETE };
 
+/* Default timestamp period of 256 cycles (2 ^ (9 - 1) = 256). */
+#define DEFAULT_TS	9
+
 static bool cs_etm_is_ete(struct perf_pmu *cs_etm_pmu, struct perf_cpu cpu);
 static int cs_etm_get_ro(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path, __u64 *val);
 static bool cs_etm_pmu_path_exists(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path);
@@ -458,7 +461,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 		 * Timestamps are required to interleave samples from different
 		 * CPUs.
 		 */
-		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", DEFAULT_TS);
 		/* Context IDs are required to associate trace to a process */
 		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
 	} else {
@@ -477,7 +480,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 * timestamp tracing.
 	 */
 	if (opts->sample_time_set)
-		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", DEFAULT_TS);
 
 	/* Add dummy event to keep tracking */
 	err = parse_event(evlist, "dummy:u");

-- 
2.43.0


