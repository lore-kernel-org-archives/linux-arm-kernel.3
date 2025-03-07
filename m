Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05768C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 20:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SH9MJgprxs3cl0psnq/WwzLvqyh6vz/UqBNIGhQZagg=; b=dGNQhGKVeYsCTGiumGfFlDUXvu
	qahf0EoHJHMULGZEI4k6vcnBahJTsM27LfDCsqzikKlSaae1XNlRrqdtyEzyKfpvRUtam+gl2q+d9
	0od7euhxlAsNd3iYjw3hsH5C3fgHGcgNP4oabmy6QETtPA6UVc3hk0zgPQsHrtT1xYUbz60IqwneT
	dt5rEtWGXcaJIZb1DoRTRb53hK7CVqAp9J5wfOQMPPfB0MIOA6QWBIRg3VLyDGCuPZmxA7KXXXVmd
	1IBhYQNMm6ciZLeE3YHYPBP2a/jwRbSdTxaEYXm6denkSXweJKJD1+DRrSE1PsrFT7CqTWOAITCb9
	ljxEpUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqeMh-0000000FUjq-2LWe;
	Fri, 07 Mar 2025 20:32:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqeF8-0000000FTrY-3Aod
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 20:24:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76D8122EA;
	Fri,  7 Mar 2025 12:24:38 -0800 (PST)
Received: from e128066.arm.com (unknown [10.57.40.70])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7F51C3F5A1;
	Fri,  7 Mar 2025 12:24:22 -0800 (PST)
From: mark.barnett@arm.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com
Cc: ben.gainey@arm.com,
	deepak.surti@arm.com,
	ak@linux.intel.com,
	will@kernel.org,
	james.clark@arm.com,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mark Barnett <mark.barnett@arm.com>
Subject: [PATCH v3 4/5] tools/perf: Modify event parser to support alt-period term
Date: Fri,  7 Mar 2025 20:22:46 +0000
Message-Id: <20250307202247.648633-5-mark.barnett@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250307202247.648633-1-mark.barnett@arm.com>
References: <20250307202247.648633-1-mark.barnett@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_122426_882438_EC78B57A 
X-CRM114-Status: GOOD (  17.98  )
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

From: Ben Gainey <ben.gainey@arm.com>

parse-events is modified, adding the "alt-period" term which can be used
to specify the alternative sampling period.

Signed-off-by: Ben Gainey <ben.gainey@arm.com>
Signed-off-by: Mark Barnett <mark.barnett@arm.com>
---
 tools/include/uapi/linux/perf_event.h             |  3 +++
 tools/perf/tests/shell/attr/base-record           |  3 ++-
 tools/perf/tests/shell/attr/base-record-spe       |  1 +
 tools/perf/tests/shell/attr/base-stat             |  3 ++-
 tools/perf/tests/shell/attr/system-wide-dummy     |  3 ++-
 .../tests/shell/attr/test-record-alt-period-term  | 12 ++++++++++++
 tools/perf/tests/shell/attr/test-record-dummy-C0  |  3 ++-
 tools/perf/tests/shell/lib/attr.py                |  1 +
 tools/perf/util/evsel.c                           |  1 +
 tools/perf/util/parse-events.c                    | 15 +++++++++++++++
 tools/perf/util/parse-events.h                    |  3 ++-
 tools/perf/util/parse-events.l                    |  1 +
 tools/perf/util/perf_event_attr_fprintf.c         |  1 +
 tools/perf/util/pmu.c                             |  1 +
 14 files changed, 46 insertions(+), 5 deletions(-)
 create mode 100644 tools/perf/tests/shell/attr/test-record-alt-period-term

diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 0524d541d4e3..499a8673df8e 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -379,6 +379,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6	120	/* add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7	128	/* add: sig_data */
 #define PERF_ATTR_SIZE_VER8	136	/* add: config3 */
+#define PERF_ATTR_SIZE_VER9	144	/* add: alt_sample_period */
 
 /*
  * Hardware event_id to monitor via a performance monitoring event:
@@ -531,6 +532,8 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+
+	__u64	alt_sample_period;
 };
 
 /*
diff --git a/tools/perf/tests/shell/attr/base-record b/tools/perf/tests/shell/attr/base-record
index b44e4e6e4443..28a7233f7bc1 100644
--- a/tools/perf/tests/shell/attr/base-record
+++ b/tools/perf/tests/shell/attr/base-record
@@ -5,7 +5,7 @@ group_fd=-1
 flags=0|8
 cpu=*
 type=0|1
-size=136
+size=144
 config=0|1
 sample_period=*
 sample_type=263
@@ -39,3 +39,4 @@ config2=0
 branch_sample_type=0
 sample_regs_user=0
 sample_stack_user=0
+alt_sample_period=0
diff --git a/tools/perf/tests/shell/attr/base-record-spe b/tools/perf/tests/shell/attr/base-record-spe
index 08fa96b59240..ad8eb72e655a 100644
--- a/tools/perf/tests/shell/attr/base-record-spe
+++ b/tools/perf/tests/shell/attr/base-record-spe
@@ -38,3 +38,4 @@ config2=*
 branch_sample_type=*
 sample_regs_user=*
 sample_stack_user=*
+alt_sample_period=0
diff --git a/tools/perf/tests/shell/attr/base-stat b/tools/perf/tests/shell/attr/base-stat
index fccd8ec4d1b0..2de92c5c300d 100644
--- a/tools/perf/tests/shell/attr/base-stat
+++ b/tools/perf/tests/shell/attr/base-stat
@@ -5,7 +5,7 @@ group_fd=-1
 flags=0|8
 cpu=*
 type=0
-size=136
+size=144
 config=0
 sample_period=0
 sample_type=65536
@@ -39,3 +39,4 @@ config2=0
 branch_sample_type=0
 sample_regs_user=0
 sample_stack_user=0
+alt_sample_period=0
diff --git a/tools/perf/tests/shell/attr/system-wide-dummy b/tools/perf/tests/shell/attr/system-wide-dummy
index a1e1d6a263bf..c0a17bb3c022 100644
--- a/tools/perf/tests/shell/attr/system-wide-dummy
+++ b/tools/perf/tests/shell/attr/system-wide-dummy
@@ -7,7 +7,7 @@ cpu=*
 pid=-1
 flags=8
 type=1
-size=136
+size=144
 config=9
 sample_period=1
 # PERF_SAMPLE_IP | PERF_SAMPLE_TID | PERF_SAMPLE_TIME |
@@ -50,3 +50,4 @@ config2=0
 branch_sample_type=0
 sample_regs_user=0
 sample_stack_user=0
+alt_sample_period=0
diff --git a/tools/perf/tests/shell/attr/test-record-alt-period-term b/tools/perf/tests/shell/attr/test-record-alt-period-term
new file mode 100644
index 000000000000..fcdb790adcd3
--- /dev/null
+++ b/tools/perf/tests/shell/attr/test-record-alt-period-term
@@ -0,0 +1,12 @@
+[config]
+command = record
+args    = --no-bpf-event -e cycles/period=3,alt-period=2/ -- kill >/dev/null 2>&1
+ret     = 1
+kernel_since = 6.11
+
+[event-10:base-record]
+sample_period=3
+alt_sample_period=2
+
+freq=0
+sample_type=7
diff --git a/tools/perf/tests/shell/attr/test-record-dummy-C0 b/tools/perf/tests/shell/attr/test-record-dummy-C0
index 91499405fff4..e6315918a95e 100644
--- a/tools/perf/tests/shell/attr/test-record-dummy-C0
+++ b/tools/perf/tests/shell/attr/test-record-dummy-C0
@@ -10,7 +10,7 @@ cpu=0
 pid=-1
 flags=8
 type=1
-size=136
+size=144
 config=9
 sample_period=4000
 # PERF_SAMPLE_IP | PERF_SAMPLE_TID | PERF_SAMPLE_TIME |
@@ -53,3 +53,4 @@ config2=0
 branch_sample_type=0
 sample_regs_user=0
 sample_stack_user=0
+alt_sample_period=0
diff --git a/tools/perf/tests/shell/lib/attr.py b/tools/perf/tests/shell/lib/attr.py
index 3db9a7d78715..04e95f76005a 100644
--- a/tools/perf/tests/shell/lib/attr.py
+++ b/tools/perf/tests/shell/lib/attr.py
@@ -91,6 +91,7 @@ class Event(dict):
         'branch_sample_type',
         'sample_regs_user',
         'sample_stack_user',
+        'alt_sample_period',
     ]
 
     def add(self, data):
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 4a0ef095db92..0657e580ea13 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -180,6 +180,7 @@ static int store_event(struct perf_event_attr *attr, pid_t pid, struct perf_cpu
 	WRITE_ASS(branch_sample_type, "llu");
 	WRITE_ASS(sample_regs_user,   "llu");
 	WRITE_ASS(sample_stack_user,  PRIu32);
+	WRITE_ASS(alt_sample_period,  "llu");
 
 	fclose(file);
 	return 0;
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 35e48fe56dfa..653d84080bc7 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -805,6 +805,7 @@ const char *parse_events__term_type_str(enum parse_events__term_type term_type)
 		[PARSE_EVENTS__TERM_TYPE_RAW]                   = "raw",
 		[PARSE_EVENTS__TERM_TYPE_LEGACY_CACHE]          = "legacy-cache",
 		[PARSE_EVENTS__TERM_TYPE_HARDWARE]              = "hardware",
+		[PARSE_EVENTS__TERM_TYPE_ALT_SAMPLE_PERIOD]	= "alt-period",
 	};
 	if ((unsigned int)term_type >= __PARSE_EVENTS__TERM_TYPE_NR)
 		return "unknown term";
@@ -833,6 +834,7 @@ config_term_avail(enum parse_events__term_type term_type, struct parse_events_er
 	case PARSE_EVENTS__TERM_TYPE_NAME:
 	case PARSE_EVENTS__TERM_TYPE_METRIC_ID:
 	case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
+	case PARSE_EVENTS__TERM_TYPE_ALT_SAMPLE_PERIOD:
 	case PARSE_EVENTS__TERM_TYPE_PERCORE:
 		return true;
 	case PARSE_EVENTS__TERM_TYPE_USER:
@@ -981,6 +983,16 @@ do {									   \
 			return -EINVAL;
 		}
 		break;
+	case PARSE_EVENTS__TERM_TYPE_ALT_SAMPLE_PERIOD:
+		CHECK_TYPE_VAL(NUM);
+		if (term->val.num == 0) {
+			parse_events_error__handle(err, term->err_val,
+						strdup("expected a non-zero value"),
+						NULL);
+			return -EINVAL;
+		}
+		attr->alt_sample_period = term->val.num;
+		break;
 	case PARSE_EVENTS__TERM_TYPE_DRV_CFG:
 	case PARSE_EVENTS__TERM_TYPE_USER:
 	case PARSE_EVENTS__TERM_TYPE_LEGACY_CACHE:
@@ -1108,6 +1120,7 @@ static int config_term_tracepoint(struct perf_event_attr *attr,
 	case PARSE_EVENTS__TERM_TYPE_RAW:
 	case PARSE_EVENTS__TERM_TYPE_LEGACY_CACHE:
 	case PARSE_EVENTS__TERM_TYPE_HARDWARE:
+	case PARSE_EVENTS__TERM_TYPE_ALT_SAMPLE_PERIOD:
 	default:
 		if (err) {
 			parse_events_error__handle(err, term->err_term,
@@ -1242,6 +1255,7 @@ do {								\
 		case PARSE_EVENTS__TERM_TYPE_RAW:
 		case PARSE_EVENTS__TERM_TYPE_LEGACY_CACHE:
 		case PARSE_EVENTS__TERM_TYPE_HARDWARE:
+		case PARSE_EVENTS__TERM_TYPE_ALT_SAMPLE_PERIOD:
 		default:
 			break;
 		}
@@ -1296,6 +1310,7 @@ static int get_config_chgs(struct perf_pmu *pmu, struct parse_events_terms *head
 		case PARSE_EVENTS__TERM_TYPE_RAW:
 		case PARSE_EVENTS__TERM_TYPE_LEGACY_CACHE:
 		case PARSE_EVENTS__TERM_TYPE_HARDWARE:
+		case PARSE_EVENTS__TERM_TYPE_ALT_SAMPLE_PERIOD:
 		default:
 			break;
 		}
diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
index e176a34ab088..d00bb6c5d9ab 100644
--- a/tools/perf/util/parse-events.h
+++ b/tools/perf/util/parse-events.h
@@ -80,7 +80,8 @@ enum parse_events__term_type {
 	PARSE_EVENTS__TERM_TYPE_RAW,
 	PARSE_EVENTS__TERM_TYPE_LEGACY_CACHE,
 	PARSE_EVENTS__TERM_TYPE_HARDWARE,
-#define	__PARSE_EVENTS__TERM_TYPE_NR (PARSE_EVENTS__TERM_TYPE_HARDWARE + 1)
+	PARSE_EVENTS__TERM_TYPE_ALT_SAMPLE_PERIOD,
+#define	__PARSE_EVENTS__TERM_TYPE_NR (PARSE_EVENTS__TERM_TYPE_ALT_SAMPLE_PERIOD + 1)
 };
 
 struct parse_events_term {
diff --git a/tools/perf/util/parse-events.l b/tools/perf/util/parse-events.l
index 7ed86e3e34e3..9c64434167b7 100644
--- a/tools/perf/util/parse-events.l
+++ b/tools/perf/util/parse-events.l
@@ -335,6 +335,7 @@ aux-output		{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_AUX_OUTPUT); }
 aux-action		{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_AUX_ACTION); }
 aux-sample-size		{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_AUX_SAMPLE_SIZE); }
 metric-id		{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_METRIC_ID); }
+alt-period		{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_ALT_SAMPLE_PERIOD); }
 cpu-cycles|cycles				{ return hw_term(yyscanner, PERF_COUNT_HW_CPU_CYCLES); }
 stalled-cycles-frontend|idle-cycles-frontend	{ return hw_term(yyscanner, PERF_COUNT_HW_STALLED_CYCLES_FRONTEND); }
 stalled-cycles-backend|idle-cycles-backend	{ return hw_term(yyscanner, PERF_COUNT_HW_STALLED_CYCLES_BACKEND); }
diff --git a/tools/perf/util/perf_event_attr_fprintf.c b/tools/perf/util/perf_event_attr_fprintf.c
index c7f3543b9921..e823240b7dd8 100644
--- a/tools/perf/util/perf_event_attr_fprintf.c
+++ b/tools/perf/util/perf_event_attr_fprintf.c
@@ -334,6 +334,7 @@ int perf_event_attr__fprintf(FILE *fp, struct perf_event_attr *attr,
 	PRINT_ATTRf(aux_start_paused, p_unsigned);
 	PRINT_ATTRf(aux_pause, p_unsigned);
 	PRINT_ATTRf(aux_resume, p_unsigned);
+	PRINT_ATTRf(alt_sample_period, p_unsigned);
 
 	return ret;
 }
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 57450c73fb63..7576fe35a869 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1804,6 +1804,7 @@ int perf_pmu__for_each_format(struct perf_pmu *pmu, void *state, pmu_format_call
 		"aux-output",
 		"aux-action=(pause|resume|start-paused)",
 		"aux-sample-size=number",
+		"alt-period=number",
 	};
 	struct perf_pmu_format *format;
 	int ret;
-- 
2.43.0


