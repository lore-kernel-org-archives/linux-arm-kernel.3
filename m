Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30893E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 10:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwyNoR0SnuVGySQmrh3vEyVb1ET66P1aG6x3YnivKGw=; b=BQlz8NqfA/QMyZynxvU1YqTlw0
	3crfGq5J9qbAn6/Eqz0efb/5IuptWFuACdCP7JeNQUADTPP8roJOh/g+cNLE+eHFEQpu6TFWh9QVa
	wTnFvI8o8nJl/DGm++FxUctsh3OVN2UsuxTz4yqcdtQpJjVF6pYfTO8jVzRbTfTxdmJIpoTr5XTNd
	BBz3yxoQ2m2Neh12uqI8qY8i+f9WJVG2i0QX0NXnadPRXtrSf3+fSoeKSqMTZrMxQ1gjeyeCkW0m5
	S1IRK8FqjryyVU2FT7Zzc0o34cVz4aj0w8e5XWEUo3wYlYm/y5Fh30RhOr7DFln1FLScfYxut8HeT
	8IiwqStQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2X9-0000000BonR-2j6n;
	Tue, 24 Dec 2024 10:53:03 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2PF-0000000BnG8-47QE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 10:44:55 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so3176013f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 02:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735037093; x=1735641893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwyNoR0SnuVGySQmrh3vEyVb1ET66P1aG6x3YnivKGw=;
        b=XfWBDBgoHeFfHAdMData8VXzmFPiUXWEEFeQ+e3+nVd79Q5fSVE22jUKYYBDZKE5Eg
         s51WNXVQlgtriwEKphuFcf4fnwm+Qb/H3ycMXIOsU1wwwMNuh/vSaaRJgiR46WwFJXGS
         sHw59oNGzVMT6mVGq2Iknq7rxQ/OuZz++zB0iRaqoc224n45brdXk7mSg+o0aohFOLle
         k/kF9YSay2yeBSTQ8QjEW/8NVzi968Pf7bmyYkK32x+P2Mq+ouHy2kiPxMSjljLQOIx9
         siWPjNTTD1YzlcSPfPt/gRyxnOtdtjafuuBb3UQp/FmipDFI+4zi6GgR4NP5ML6At41d
         b36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735037093; x=1735641893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwyNoR0SnuVGySQmrh3vEyVb1ET66P1aG6x3YnivKGw=;
        b=DleCEYGo0Un6KYbCu4HsNBEY767eFvPtiBtsbdD82oQcXZQgB8J3W0aYcSuFi/PaDL
         xDH6SbRMbGMNqm4EFCu720a0zWd4xA6r3k5RJzUinVE9/XeJNUKLnfbydoz3o3tnefE0
         fkTlCqCiI9zmeobZtcTBztA5mwZ3j5b2rpW82jtIIfJfLzxKwgeFiiGnfVlNbmjV2Wlt
         OfJUl96nGpJVEhM6oMn9JDG8vOng30PCZSEiBqjOhbZHudgIEhbk5b3vZE6mkOOSjHwT
         hq8d+dQQh50IRP0VzIWDf/O+vWhgo/NLWjyORnsMpBs6/hggODG/SyoeI9Pim2bOQGGH
         gEbg==
X-Gm-Message-State: AOJu0Yyq7CLoauYmqiCGucwn8NbbEdU30/YsuyjXR6ZRKIontuzvNf+E
	zRh6itZGotTVazRntqW8I2I3P4ePme9lURqfD8qM5KwqKsmvUFSPI+BqqvLf6b7ZgTHnAWcpIAv
	0
X-Gm-Gg: ASbGncsqTmGzGFemg890mv7dDDSz52vrlyF0+MYlVMBAYQw3YLqs/7MxiwQosCLTu0N
	wHXq3NRNiEoIMGd0o2Mu9a+L7jbeu+WfifDp3RrByeaVNU8tt90aJNJ4cM2xuijoFaq39D20GYC
	3gFNZrwo3QcnTi/19c3N3oKDC2EaE1F4ecYO8j8E9KCHQn7LOCG2qb8AoD3CBzreA7qj8Orl24u
	HOirM1aoFf63bFkuZhx0L3E6QlwP1UMVdmYWknUIaaSNGHzmTYCxCA=
X-Google-Smtp-Source: AGHT+IEHX62hM4cRXueG3YQu6eg84405e7WqgYcT9lFPGrHLB17v7HhSKT3GSKfbXrWS+gmH7kk2Dw==
X-Received: by 2002:a05:6000:794:b0:385:e013:b842 with SMTP id ffacd0b85a97d-38a221ea331mr12569563f8f.14.1735037092689;
        Tue, 24 Dec 2024 02:44:52 -0800 (PST)
Received: from pop-os.. ([145.224.66.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847714sm13938184f8f.54.2024.12.24.02.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:44:52 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	irogers@google.com,
	yeoreum.yun@arm.com,
	will@kernel.org,
	mark.rutland@arm.com
Cc: robh@kernel.org,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH v2 5/5] perf docs: arm_spe: Document new discard mode
Date: Tue, 24 Dec 2024 10:44:12 +0000
Message-Id: <20241224104414.179365-6-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224104414.179365-1-james.clark@linaro.org>
References: <20241224104414.179365-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_024454_022123_67811033 
X-CRM114-Status: GOOD (  16.13  )
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

Document the flag along with PMU events to hint what it's used for and
give an example with other useful options to get minimal output.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Documentation/perf-arm-spe.txt | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/perf/Documentation/perf-arm-spe.txt b/tools/perf/Documentation/perf-arm-spe.txt
index de2b0b479249..37afade4f1b2 100644
--- a/tools/perf/Documentation/perf-arm-spe.txt
+++ b/tools/perf/Documentation/perf-arm-spe.txt
@@ -150,6 +150,7 @@ arm_spe/load_filter=1,min_latency=10/'
   pct_enable=1        - collect physical timestamp instead of virtual timestamp (PMSCR.PCT) - requires privilege
   store_filter=1      - collect stores only (PMSFCR.ST)
   ts_enable=1         - enable timestamping with value of generic timer (PMSCR.TS)
+  discard=1           - enable SPE PMU events but don't collect sample data - see 'Discard mode' (PMBLIMITR.FM = DISCARD)
 
 +++*+++ Latency is the total latency from the point at which sampling started on that instruction, rather
 than only the execution latency.
@@ -220,6 +221,31 @@ Common errors
 
    Increase sampling interval (see above)
 
+PMU events
+~~~~~~~~~~
+
+SPE has events that can be counted on core PMUs. These are prefixed with
+SAMPLE_, for example SAMPLE_POP, SAMPLE_FEED, SAMPLE_COLLISION and
+SAMPLE_FEED_BR.
+
+These events will only count when an SPE event is running on the same core that
+the PMU event is opened on, otherwise they read as 0. There are various ways to
+ensure that the PMU event and SPE event are scheduled together depending on the
+way the event is opened. For example opening both events as per-process events
+on the same process, although it's not guaranteed that the PMU event is enabled
+first when context switching. For that reason it may be better to open the PMU
+event as a systemwide event and then open SPE on the process of interest.
+
+Discard mode
+~~~~~~~~~~~~
+
+SPE related (SAMPLE_* etc) core PMU events can be used without the overhead of
+collecting sample data if discard mode is supported (optional from Armv8.6).
+First run a system wide SPE session (or on the core of interest) using options
+to minimize output. Then run perf stat:
+
+  perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev/null &
+  perf stat -e SAMPLE_FEED_LD
 
 SEE ALSO
 --------
-- 
2.34.1


