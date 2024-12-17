Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC577E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 12:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFM1q7jsB7Su3lAVmgr0rlaLhCHhfoFOEst7jXnFLG4=; b=S/M43D3vJdvppFmemccOL73Vwc
	bysvPfe4x6kvYgbkJMD2ifIxV37Q4BxXJE/FgZKiZdAIqTnry/jI+IMiQzJHomIJLL9gUY5iVcFqG
	zb5bUFyGUoZ3EAm+2tGGsN4LvrC++JvCBN+lPrCoXIdnBAg/P4LHEmCYKN+AreiqdJqQOZehpIDZd
	vZLC1ckorx3iRjUGH0cOlJXLy39PdZ3Z4BWjQti/cB0sbaD0Yt5pda5NQtQKRabqkteMsWCp13lGZ
	XE96VVppWI6Y1pcyQC1cCEtBT11WKDIIJUyhvN025qGykbTPpVRuJYuAWoIFXmAa0Kt4PAQxrtgjP
	SMd3NQEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWHw-0000000DKzz-1v3J;
	Tue, 17 Dec 2024 12:02:56 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWBu-0000000DJn8-2egu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 11:56:44 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso32288755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 03:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734436601; x=1735041401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFM1q7jsB7Su3lAVmgr0rlaLhCHhfoFOEst7jXnFLG4=;
        b=rJWdsFX+W5TvWwCjKhtGPxX5jyL5S/gu0OPTQ2Vk2jk+SoxWwHfXB+mN3dKYXGhmUj
         QseDzcnHgztl/ES+AiPFallMrQN2XJ3jgKwooGCJFQ/2EGNBCXhcQ+iYEFOjxGoJF5xR
         Iwq4p8P5P0beJjXYjf53AvrNw9R7bRZRtbXnIfNbONe4MTti9ItprubtS0sTIb//cqdq
         1n5ybSaDPWFEc3rou50sNj5Tqyvdk0oRWsS3E4na5M0+bl/ISmstRcy0NmqXtZcqkgTC
         nBrMyofk//eD4PFMaKUm/EmU12iSVYAdS1hcS8NkZ+vnmbTPsMf+UlmkrWEq11SipXOK
         Gqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734436601; x=1735041401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFM1q7jsB7Su3lAVmgr0rlaLhCHhfoFOEst7jXnFLG4=;
        b=fH/jm5Kg8leoxmgrUvuvkIOKeE7xyUZOFAXrCmpgZmceipXqemOXt6qs/gmnNzc1G0
         Sn6lxgZnEP6h8MBNOTJ1Y0Crg/X295RYBY9/7WUHkOrZ1oOrOZBN/l1EB/E49LSpOJ3d
         3FqVp23oUUi7JssogOhvGOT7QriQCUcC+ghbQmePUw5c3pZfWpcmIS/+MsdClMNoxVeM
         rszw1yDVf56OFG4EyUVo5kB4Sh7iWIPVl9GPY+xsy+txRJGokoMMlMWy8xlX+D2KzxpZ
         Dm1hZkqB7zpjrvLPrNY4SJX0z+idbACk8H7qD28nYxx8QxdEJlmVRqvD7ReCoWAvPgGe
         GWYg==
X-Gm-Message-State: AOJu0Yz9BEJb/pq2bcVwP8YqhpfV1MGZiK5ZcJBkAgJgCpA6q+pcUX+t
	DZi7Asa6XFjT4Afa2FcMcXhbgb7wNMItCi1ZwIPfN5/iLEuR3GbUf82MLY3FbDnjYZwBd/7i1ND
	t
X-Gm-Gg: ASbGncupMH1Pw12dWe4bhfVPVOPjvnBGVnvcU7yaYh0oteKcbYgNRlKHxoyexHi/5pv
	2p+foiofWOove1qAnIFgWkiPKX5P8o1VlxrGd379VTE6xD1qz6gazD0RcAGAXPmeSA1KcbVJqA+
	ylY3FbbDtMW052yGE55E8OoXMWQ/y7OxhVBYY+LnGaTr7xP7y3zg3ZxJq7NfuG5YGz503AJOZne
	Uuc//6ZJ9MIYAqEv8KC2tWvblBfyoyh7th75CeFDkmcmhw3E5wFyjDA
X-Google-Smtp-Source: AGHT+IGHK04q5y+mpaaNrdicK1T9ozCfgAnXqS1cmz3u3H1E5qAKa1r9yR6aB/fLQM8NPU3JxtkxJw==
X-Received: by 2002:a05:600c:3516:b0:436:1b77:b5aa with SMTP id 5b1f17b1804b1-4364815c7d6mr27745645e9.8.1734436601097;
        Tue, 17 Dec 2024 03:56:41 -0800 (PST)
Received: from pop-os.. ([145.224.66.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436360159aasm114935825e9.6.2024.12.17.03.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:56:40 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 5/5] perf docs: arm_spe: Document new discard mode
Date: Tue, 17 Dec 2024 11:56:08 +0000
Message-Id: <20241217115610.371755-6-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217115610.371755-1-james.clark@linaro.org>
References: <20241217115610.371755-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_035642_665244_C7E5590B 
X-CRM114-Status: GOOD (  12.98  )
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

Document the flag, hint what it's used for and give an example with
other useful options to get minimal output.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Documentation/perf-arm-spe.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/perf/Documentation/perf-arm-spe.txt b/tools/perf/Documentation/perf-arm-spe.txt
index de2b0b479249..588eead438bc 100644
--- a/tools/perf/Documentation/perf-arm-spe.txt
+++ b/tools/perf/Documentation/perf-arm-spe.txt
@@ -150,6 +150,7 @@ arm_spe/load_filter=1,min_latency=10/'
   pct_enable=1        - collect physical timestamp instead of virtual timestamp (PMSCR.PCT) - requires privilege
   store_filter=1      - collect stores only (PMSFCR.ST)
   ts_enable=1         - enable timestamping with value of generic timer (PMSCR.TS)
+  discard=1           - enable SPE PMU events but don't collect sample data - see 'Discard mode' (PMBLIMITR.FM = DISCARD)
 
 +++*+++ Latency is the total latency from the point at which sampling started on that instruction, rather
 than only the execution latency.
@@ -220,6 +221,16 @@ Common errors
 
    Increase sampling interval (see above)
 
+Discard mode
+~~~~~~~~~~~~
+
+SPE PMU events can be used without the overhead of collecting sample data if
+discard mode is supported (optional from Armv8.6). First run a system wide SPE
+session (or on the core of interest) using options to minimize output. Then run
+perf stat:
+
+  perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev/null &
+  perf stat -e SAMPLE_FEED_LD
 
 SEE ALSO
 --------
-- 
2.34.1


