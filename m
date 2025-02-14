Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461D6C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hnaS7lueWgUHjeHgUmwzyUsXFRClDRjGMAc7bfw+yM=; b=Bmsep762FWmn9vGm4jGQ6Mi3bA
	UXl1mLM9JzAhwOI31jyARFtj+QUHQAosyXo5UCwtAdV24v7d9mthEyR7Q3uecA/KGhJVJdQvC33/j
	AJyPpn3c7TR04OgMPdCT5+T81fgnB0xuZUfZVoK8impQbovbAugcLMWXqC2ZoywO2Rm3yPoIVmR3X
	yxkjxm1bxYZIGfAZws7K4gqL3MTZ7ptsFXN8sJpSAkf5ZKNsWQo+1iMvT1SSuEplQzvtWMr3IXm6D
	JKofbtqOCA5Yjz7sk9LZEWhY/LYOFrum0Nt+LsbgWrxNyF7wu8wYg0Euy3lhA4dJo0igj0Qu9e4tZ
	QzJsiqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titus-0000000EgS4-1zt4;
	Fri, 14 Feb 2025 11:31:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titjr-0000000Ee9A-1urj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:20:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A43D113E;
	Fri, 14 Feb 2025 03:20:27 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5EE0C3F6A8;
	Fri, 14 Feb 2025 03:20:04 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Graham Woodward <graham.woodward@arm.com>,
	Paschalis.Mpeis@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 07/11] perf arm-spe: Decode transactional event
Date: Fri, 14 Feb 2025 11:19:32 +0000
Message-Id: <20250214111936.15168-8-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250214111936.15168-1-leo.yan@arm.com>
References: <20250214111936.15168-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_032007_544479_B6872BB2 
X-CRM114-Status: GOOD (  10.08  )
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

The bit[16] in an event payload indicates an operation is in
transactional state.  Decode the bit.

Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c | 2 ++
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index 625834da7e20..13cadb2f1cea 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -308,6 +308,8 @@ static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
 		arm_spe_pkt_out_string(&err, &buf, &buf_len, " REMOTE-ACCESS");
 	if (payload & BIT(EV_ALIGNMENT))
 		arm_spe_pkt_out_string(&err, &buf, &buf_len, " ALIGNMENT");
+	if (payload & BIT(EV_TRANSACTIONAL))
+		arm_spe_pkt_out_string(&err, &buf, &buf_len, " TXN");
 	if (payload & BIT(EV_PARTIAL_PREDICATE))
 		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SVE-PARTIAL-PRED");
 	if (payload & BIT(EV_EMPTY_PREDICATE))
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
index 32d760ede701..2cdf9f6da268 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
@@ -105,6 +105,7 @@ enum arm_spe_events {
 	EV_LLC_MISS		= 9,
 	EV_REMOTE_ACCESS	= 10,
 	EV_ALIGNMENT		= 11,
+	EV_TRANSACTIONAL	= 16,
 	EV_PARTIAL_PREDICATE	= 17,
 	EV_EMPTY_PREDICATE	= 18,
 };
-- 
2.34.1


