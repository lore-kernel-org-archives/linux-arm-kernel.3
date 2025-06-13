Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB69CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=is8IIgn4P9O+PGGsfZRlmKBjfaWHnB6Gxpp4hE49spw=; b=GcDuaoZ067f9+zh9Cjh3J4b6my
	IzigPCHBIVbovyy+kIsWEOXbUUmC/hP/SAya6MTJ8oxhPoCOhie7zvsrPEBOTxJEd2jmcOgiAHiMe
	o8IUnlIKGx2mamtyDpuQiAODwR7ZZ1ea0qvnzIHcq0yuUwCIB465B1Q6pP+azCgr+YmY69nQgJp4p
	sR3n/oVOCNEQA22f3Y079/TYfK3FKDSZoMG8WID1VxN34ACsmbK8hpB4t7xuPf0gz2qiH9oXpPcqY
	ufj4qC5hkprOqg1BTaSpWEocez3t8Jf+5JkNHhXpxvDcmRw/QJhutv/eVNPfRqFktIqNb2lZbtqTF
	ARs4zI4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8xM-0000000HFsU-2Ut3;
	Fri, 13 Jun 2025 18:16:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6jb-0000000Gy41-22ew
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 15:54:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54D71204C;
	Fri, 13 Jun 2025 08:54:05 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E14003F59E;
	Fri, 13 Jun 2025 08:54:23 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 13 Jun 2025 16:53:38 +0100
Subject: [PATCH 05/12] perf arm_spe: Decode event types for new features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-5-6faecf0a8775@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749830053; l=2646;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=eshcdLLlNIy+/NOBSwdTwt3N0IPW+kbq82UNKpVsUkY=;
 b=24E85IjtczNmy1LsdabPH1xmXzGlquF5YwgJhwVhbuQcPfFAXTfy8Z7bhUgwGNIboky/hvivD
 NLTmgxbtBcLAnkXS8Zu6rI1JLhIitV0V2B4cm2aRoaQL2J0nqvX91BA
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_085427_729614_6A7F639F 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

Decode new event types introduced by FEAT_SPEv1p4, FEAT_SPE_SME and
FEAT_SPE_SME.

The printed event names don't strictly follow the naming in the Arm ARM.
For example, the "Cache data modified" event is shown as "HITM", and the
"Data snooped" event is printed as "SNOOPED". Shorter names are easier
to read and review while preserving core meanings.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c | 14 ++++++++++++++
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index 13cadb2f1ceac7a90e359c4d6aa1d5fc5169e142..80561630253dd5c46f7e99b24fc13b99f346459f 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -314,6 +314,20 @@ static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
 		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SVE-PARTIAL-PRED");
 	if (payload & BIT(EV_EMPTY_PREDICATE))
 		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SVE-EMPTY-PRED");
+	if (payload & BIT(EV_L2D_ACCESS))
+		arm_spe_pkt_out_string(&err, &buf, &buf_len, " L2D-ACCESS");
+	if (payload & BIT(EV_L2D_MISS))
+		arm_spe_pkt_out_string(&err, &buf, &buf_len, " L2D-MISS");
+	if (payload & BIT(EV_CACHE_DATA_MODIFIED))
+		arm_spe_pkt_out_string(&err, &buf, &buf_len, " HITM");
+	if (payload & BIT(EV_RECENTLY_FETCHED))
+		arm_spe_pkt_out_string(&err, &buf, &buf_len, " LFB");
+	if (payload & BIT(EV_DATA_SNOOPED))
+		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SNOOPED");
+	if (payload & BIT(EV_STREAMING_SVE_MODE))
+		arm_spe_pkt_out_string(&err, &buf, &buf_len, " STREAMING-SVE");
+	if (payload & BIT(EV_SMCU))
+		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SMCU");
 
 	return err;
 }
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
index 2cdf9f6da2681244291445d54c5b13fe8a2e9d9a..d00c2481712dcc457eab2f5e9848ffc3150e6236 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
@@ -108,6 +108,13 @@ enum arm_spe_events {
 	EV_TRANSACTIONAL	= 16,
 	EV_PARTIAL_PREDICATE	= 17,
 	EV_EMPTY_PREDICATE	= 18,
+	EV_L2D_ACCESS		= 19,
+	EV_L2D_MISS		= 20,
+	EV_CACHE_DATA_MODIFIED	= 21,
+	EV_RECENTLY_FETCHED	= 22,
+	EV_DATA_SNOOPED		= 23,
+	EV_STREAMING_SVE_MODE	= 24,
+	EV_SMCU			= 25,
 };
 
 /* Operation packet header */

-- 
2.34.1


