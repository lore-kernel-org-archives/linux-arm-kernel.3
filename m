Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379E6CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 02:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYNpgaxYr9MlZk30mWjRSK58SsiELIzEwxN73M2+bsg=; b=GUQYyAy5oQxi95Nug1Lqc6pNG9
	DRjhyauCsymx/dF8CnUfD7rjwG59LP/Ha8up6yJAghUEIVOYZwrE4RnN06Rlu0FkwdE0HrV+y4jvO
	R99fT195x928hyBv3ckpCKXEsSSdmAG/Fh3itCLR+GqMTV+vhIVnqAPo7pf+xrkAGNmQI/TcSrgos
	ip+Onzybyvuk2S5M5c0JwPw4/AGqqZsy9YlYnLHU1sEYw2WN5APKZUw9Vv5Mx0/+x3tMCI5ze1exb
	HScCo20xJo5kXMIvAon6gPAk5ONYA05SOt7IlUmujoHAxk3p9V2A0+izQBuWHHzWoFY2WzKlpTTIL
	c2iZomww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9a0b-00000006OVq-3hLF;
	Fri, 17 Oct 2025 02:15:57 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9a0Z-00000006OU6-0vqP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 02:15:57 +0000
X-UUID: 309e54e0aaff11f0a38c85956e01ac42-20251017
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:503234ec-d232-42f3-a237-b433a00c9253,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:3ffe33a261b424441a311a096a81b706,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 309e54e0aaff11f0a38c85956e01ac42-20251017
X-User: tanze@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <tanze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 139055187; Fri, 17 Oct 2025 10:15:45 +0800
From: tanze <tanze@kylinos.cn>
To: james.clark@linaro.org,
	leo.yan@linux.dev,
	irogers@google.com,
	john.g.garry@oracle.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	graham.woodward@arm.com,
	mike.leach@linaro.org,
	tanze <tanze@kylinos.cn>
Subject: [PATCH v2] perf arm_spe: Add a macro definition to handle offset value
Date: Fri, 17 Oct 2025 10:15:40 +0800
Message-Id: <20251017021540.45930-1-tanze@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251016083019.27935-1-tanze@kylinos.cn>
References: <20251016083019.27935-1-tanze@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_191555_557614_9D1C1776 
X-CRM114-Status: GOOD (  12.48  )
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

Add a macro definition SPE_SYNTH_ID_OFFSET to handle the offset value
and improve readability.

Signed-off-by: tanze <tanze@kylinos.cn>
---
Hi, Leo Yan

Thank you for your guidance and suggestions. I have made revisions according to your requirements. 
Do you have any further suggestions?
---
Changes in v2:
- Migrate the macro definitions to the synthetic-events.h file
- Add modifications to other source files that use the offset value
---
 tools/perf/util/arm-spe.c          | 2 +-
 tools/perf/util/cs-etm.c           | 2 +-
 tools/perf/util/intel-bts.c        | 2 +-
 tools/perf/util/intel-pt.c         | 2 +-
 tools/perf/util/powerpc-vpadtl.c   | 3 ++-
 tools/perf/util/synthetic-events.h | 2 ++
 6 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 71be979f5077..b082cb1666a6 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -1732,7 +1732,7 @@ arm_spe_synth_events(struct arm_spe *spe, struct perf_session *session)
 	attr.sample_period = spe->synth_opts.period;
 
 	/* create new id val to be a fixed offset from evsel id */
-	id = evsel->core.id[0] + 1000000000;
+	id = evsel->core.id[0] + PERF_SYNTH_EVENT_ID_OFFSET;
 
 	if (!id)
 		id = 1;
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 30f4bb3e7fa3..46902f7b69f1 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1726,7 +1726,7 @@ static int cs_etm__synth_events(struct cs_etm_auxtrace *etm,
 	attr.read_format = evsel->core.attr.read_format;
 
 	/* create new id val to be a fixed offset from evsel id */
-	id = evsel->core.id[0] + 1000000000;
+	id = evsel->core.id[0] + PERF_SYNTH_EVENT_ID_OFFSET;
 
 	if (!id)
 		id = 1;
diff --git a/tools/perf/util/intel-bts.c b/tools/perf/util/intel-bts.c
index 3625c6224750..98b928eca724 100644
--- a/tools/perf/util/intel-bts.c
+++ b/tools/perf/util/intel-bts.c
@@ -777,7 +777,7 @@ static int intel_bts_synth_events(struct intel_bts *bts,
 	attr.sample_id_all = evsel->core.attr.sample_id_all;
 	attr.read_format = evsel->core.attr.read_format;
 
-	id = evsel->core.id[0] + 1000000000;
+	id = evsel->core.id[0] + PERF_SYNTH_EVENT_ID_OFFSET;
 	if (!id)
 		id = 1;
 
diff --git a/tools/perf/util/intel-pt.c b/tools/perf/util/intel-pt.c
index 9b1011fe4826..4fb9600a7369 100644
--- a/tools/perf/util/intel-pt.c
+++ b/tools/perf/util/intel-pt.c
@@ -3987,7 +3987,7 @@ static int intel_pt_synth_events(struct intel_pt *pt,
 	attr.sample_id_all = evsel->core.attr.sample_id_all;
 	attr.read_format = evsel->core.attr.read_format;
 
-	id = evsel->core.id[0] + 1000000000;
+	id = evsel->core.id[0] + PERF_SYNTH_EVENT_ID_OFFSET;
 	if (!id)
 		id = 1;
 
diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
index 39a3fb3f1330..5ce5d2bf4c6c 100644
--- a/tools/perf/util/powerpc-vpadtl.c
+++ b/tools/perf/util/powerpc-vpadtl.c
@@ -15,6 +15,7 @@
 #include "powerpc-vpadtl.h"
 #include "sample.h"
 #include "tool.h"
+#include "util/synthetic-events.h"
 
 /*
  * Structure to save the auxtrace queue
@@ -656,7 +657,7 @@ powerpc_vpadtl_synth_events(struct powerpc_vpadtl *vpa, struct perf_session *ses
 	attr.config = PERF_SYNTH_POWERPC_VPA_DTL;
 
 	/* create new id val to be a fixed offset from evsel id */
-	id = evsel->core.id[0] + 1000000000;
+	id = evsel->core.id[0] + PERF_SYNTH_EVENT_ID_OFFSET;
 	if (!id)
 		id = 1;
 
diff --git a/tools/perf/util/synthetic-events.h b/tools/perf/util/synthetic-events.h
index ee29615d68e5..c8a1fe7a3fa4 100644
--- a/tools/perf/util/synthetic-events.h
+++ b/tools/perf/util/synthetic-events.h
@@ -39,6 +39,8 @@ enum perf_record_synth {
 };
 #define PERF_SYNTH_ALL  (PERF_SYNTH_MAX - 1)
 
+#define PERF_SYNTH_EVENT_ID_OFFSET	(1000000000ULL)
+
 int parse_synth_opt(char *str);
 
 typedef int (*perf_event__handler_t)(const struct perf_tool *tool, union perf_event *event,
-- 
2.25.1


