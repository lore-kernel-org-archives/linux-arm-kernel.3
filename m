Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF84E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 14:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwyNoR0SnuVGySQmrh3vEyVb1ET66P1aG6x3YnivKGw=; b=HNDoxPSzJiUeaCyFrkoL/spFd6
	4WmNtwsEF4jupsIpubI51f+VCiIJFWM5jn5Vpozh79bWt6Tgoobmf6abuT8ZIKK/8elepCaQly6pZ
	cP4MEPlKkltFbGAQFhd1E7Ri3KL37Ypf0aAJY+iECV2YVTTQ9Rv0KF9eJQ4V1vw9c63Vx29x+qB9K
	LcNct4peD5T0F0xsiNZBpe9i+leukuYdbJibDTQFWu+JXRADo0pYXc9jdR+ePE2eblUPjEmt9wEhN
	VTIMB2tHymvdsBpF+Wkg+lshwR7AZ4xSsBz7KnBdJB1/DwV5zghkXrrkIhWsS8tDA61VpXbHi92el
	OFQbZe0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVX86-00000008oBG-2i7X;
	Wed, 08 Jan 2025 14:33:54 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVX4e-00000008nFP-02RV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 14:30:21 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3862d161947so8015804f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 06:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736346618; x=1736951418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwyNoR0SnuVGySQmrh3vEyVb1ET66P1aG6x3YnivKGw=;
        b=JaVUO1ic6wAp1AoTTt3FWzoeEQuUcMa+eGFBW28mDrX8WdfFkP4Y6MJdfLBVm+KHMb
         4IqQz962DVjpFaBDhGoSdEt4+3XKlY4fqyjApSGT0l7QdfZTSyR886k7I7Jpt+Tpytnn
         s+XbryrBAUkePPxMfkgh9iHL6TfBdpkBlbk2ZlOWDOCDDNX7el9I94X6sbB5DRjdwO/W
         1H1fk34dXqmOELPpzfXSV/RDyYGoJ86YNu1jvVilou6BM2W9r3U6HCLtHBLYKlfyrW2u
         aWk1vLG1YMmwUeFcI9+Q1BqDQTFHiDlC3foaMaX679sXeunzboxr5px939FPnLxEnJLu
         uc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346618; x=1736951418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwyNoR0SnuVGySQmrh3vEyVb1ET66P1aG6x3YnivKGw=;
        b=BK8Xb3WzuZ0sc0m3aFtxE5+ipYgugio3OsxqtYlIZHHE9f0GZoJi9uylqcaYMcILCg
         fZEXGg3hfZfA33Rs3ZCBoJ/GCBne+kB+XY5LywE3L2nINmF1eRiqw9hslorG+yqMs/0c
         3msO+kcJsyCGVJFbblXWmkBlyHzyzuLpyhUdt4B+p7DsW/u88IGEHjQodO8JL+ci8DVs
         xzy2ApaMWG6RrbPhAelu3rJU51vbAzwC/qLJ2TW6aotncjkIWOPpEc2+u+F8zKUhSilU
         YBdaegLlmNB7nEQQin0RueM71y5I/e2moNFzYKCay13tnWkPCKD2LNWtmxg5yCZLPeFv
         QBhw==
X-Gm-Message-State: AOJu0YxBFN856he+kKwBG8zJD8rqqDIR7Lxqirmb4NWm6Rhrq3UUPLoD
	3WSZYSSUNAw93bRIi8aJeX8HM8BqM70H/rBvUHRDRCiMdEfEOT3kLjHyXim92xCd/sQ0ItE9O3N
	4
X-Gm-Gg: ASbGncuRsr4cAEg9hH63aHqpyqmZjkZYbt7S2BU1mdipKdh2NRxw+/997rIvD5//96h
	yJX+dEi6SmlgfavR34c/3ZTH8gCBGaZSp89kBgYgBAZwi5cKM0e6iDQbhUKESwqSlR6qhxpQo/C
	UDA/BfY8MIFA8kurxjnOKi4JkeDPr+kuWEe2P+uJHBs/iD3scS8BM6/1iB1/RJu274rUZSiQzcb
	7dyUYh53zj2J1sfA3pIVeDZFsLWSGVcIgqQOlI1uLHZBQczPvEBOp67
X-Google-Smtp-Source: AGHT+IERlWXqo2ZT7VqdO/os7iGNqhnAktOupf4yL+hZB/qbP2byYeljw2KjaDqnGgNolCaFP0shlw==
X-Received: by 2002:a05:6000:712:b0:388:da10:ff13 with SMTP id ffacd0b85a97d-38a87306e8bmr2608823f8f.21.1736346618097;
        Wed, 08 Jan 2025 06:30:18 -0800 (PST)
Received: from pop-os.. ([145.224.90.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddccf4sm22836965e9.19.2025.01.08.06.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:30:17 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	irogers@google.com,
	yeoreum.yun@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	namhyung@kernel.org,
	acme@kernel.org
Cc: robh@kernel.org,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	Michael Petlan <mpetlan@redhat.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH v3 2/5] perf docs: arm_spe: Document new discard mode
Date: Wed,  8 Jan 2025 14:28:57 +0000
Message-Id: <20250108142904.401139-3-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108142904.401139-1-james.clark@linaro.org>
References: <20250108142904.401139-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_063020_047665_4C5D0923 
X-CRM114-Status: GOOD (  16.04  )
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


