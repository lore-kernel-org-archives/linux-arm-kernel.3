Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E951C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ljl1gBR7+UIKg5IqmwYt7Tk9aInCmAtj7plXT47ZdI=; b=099rafp6DsvEc9RaCMmb7S7xjq
	SQ6D/x7TlHG+fC2uXcqhDEPgyFn4Jes4FKbArQvIKLkIKCH8kzL+szxbEUez4HJFy6/66y/nHA6Pi
	crLdpCLhAfGW+uhpqV5YC3KCsQjm8rvzRZMPdsxlCeLZ61NEo4ZGD6ScPt76HyN0YUFvUgYSykJZa
	m+qUCnrjsoP8AEilsjjRFtZhBocAWatUMOYTbq5XAvjHxPzgO/mVeIEXUilrCj4FOr6YUtMzvr7Rm
	OG4ybYkVhF0QXKeJ12pVQKKAf87+sTsoTEnd8v/IT0NXSaSGq/FD4CLeTOQtrRFHPa5COQQqRKpXK
	XJnKteMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8xP-0000000HFxw-0kHo;
	Fri, 13 Jun 2025 18:16:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6jc-0000000Gy4G-0lYs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 15:54:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48B5C2050;
	Fri, 13 Jun 2025 08:54:07 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7CF73F59E;
	Fri, 13 Jun 2025 08:54:25 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 13 Jun 2025 16:53:39 +0100
Subject: [PATCH 06/12] perf arm_spe: Add "events" entry in meta data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-6-6faecf0a8775@arm.com>
References: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com>
In-Reply-To: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749830053; l=2662;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=e14Ol5RavTrNgLPniyJeuNuf8/Ip83vtr531yiy2a4o=;
 b=81W8fDYV1wYjxiKqrCuNlfDW4llrj0cZ02Fvaq2GRQTwCEraWzlCH8uJjkvtoMUgRIP1c/7rg
 oJhUjRL6ytiDHfPNUgub/dzN9t7NtbGr/0t95ZdN+A8pgSuDhwLCl5y
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_085428_407267_2B6A83F8 
X-CRM114-Status: GOOD (  12.04  )
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

Add a new "events" entry in the meta data and dump it in raw data mode.

After:

  # perf script -D
  ...

  0 0 0x470 [0x1f0]: PERF_RECORD_AUXTRACE_INFO type: 4
    Header version     :2
    Header size        :4
    PMU type v2        :11
    CPU number         :8
      Magic            :0x1010101010101010
      CPU #            :0
      Num of params    :4
      MIDR             :0x410fd0f0
      PMU Type         :11
      Min Interval     :256
      Events           :0xffff000003fefffe

  ...

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/arch/arm64/util/arm-spe.c | 5 +++++
 tools/perf/util/arm-spe.c            | 1 +
 tools/perf/util/arm-spe.h            | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index 4f2833b62ff55f3fd1dff3f032d6e06528460939..5cce5f29d8c7936cc4f424a09d50536644c17be9 100644
--- a/tools/perf/arch/arm64/util/arm-spe.c
+++ b/tools/perf/arch/arm64/util/arm-spe.c
@@ -121,12 +121,17 @@ static int arm_spe_save_cpu_header(struct auxtrace_record *itr,
 		/* No Arm SPE PMU is found */
 		data[ARM_SPE_CPU_PMU_TYPE] = ULLONG_MAX;
 		data[ARM_SPE_CAP_MIN_IVAL] = 0;
+		data[ARM_SPE_CAP_EVENTS] = 0;
 	} else {
 		data[ARM_SPE_CPU_PMU_TYPE] = pmu->type;
 
 		if (perf_pmu__scan_file(pmu, "caps/min_interval", "%lu", &val) != 1)
 			val = 0;
 		data[ARM_SPE_CAP_MIN_IVAL] = val;
+
+		if (perf_pmu__scan_file(pmu, "caps/events", "%lu", &val) != 1)
+			val = 0;
+		data[ARM_SPE_CAP_EVENTS] = val;
 	}
 
 	free(cpuid);
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index fdef6f743cf3c76b1dcdd57f5a2c297642fdd21a..55b8391990467c8b7818bb63de3545d94d021bb7 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -1532,6 +1532,7 @@ static const char * const metadata_per_cpu_fmts[] = {
 	[ARM_SPE_CPU_MIDR]		= "    MIDR             :0x%"PRIx64"\n",
 	[ARM_SPE_CPU_PMU_TYPE]		= "    PMU Type         :%"PRId64"\n",
 	[ARM_SPE_CAP_MIN_IVAL]		= "    Min Interval     :%"PRId64"\n",
+	[ARM_SPE_CAP_EVENTS]		= "    Events           :0x%"PRIx64"\n",
 };
 
 static void arm_spe_print_info(struct arm_spe *spe, __u64 *arr)
diff --git a/tools/perf/util/arm-spe.h b/tools/perf/util/arm-spe.h
index 390679a4af2fb61419bc881b5dc43c01f1dd77d7..a47d3d8fc97e07d1bb41a6776133d0676c335613 100644
--- a/tools/perf/util/arm-spe.h
+++ b/tools/perf/util/arm-spe.h
@@ -47,6 +47,8 @@ enum {
 	ARM_SPE_CPU_PMU_TYPE,
 	/* Minimal interval */
 	ARM_SPE_CAP_MIN_IVAL,
+	/* Supported events */
+	ARM_SPE_CAP_EVENTS,
 	ARM_SPE_CPU_PRIV_MAX,
 };
 

-- 
2.34.1


