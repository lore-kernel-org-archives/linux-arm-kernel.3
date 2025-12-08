Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76374D3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 14:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sW5CVG6fTovVK5pm5F0b9TUqJDd0mR5nCkkwbSDkjc=; b=Mgvk3upF8F3jk2F8PDIvT+yeba
	4z9AQa+uM3aIaPXEfuX6AmI/57WitAzsxbkRJLUc5JvQInXWpzs4y3EC+wjAP8l5jTIokPIatR2Xx
	tQ8/kjrEbKmMy6eYt1icf/8vvI/WSVMFfP/LQDkFfPMX06GvMaCWfJMixYaHJnNfVcZyQRFU4xRfs
	AlaYulmcV88noHwmvGxtTfUjbHxlTNYR6Lhn5kVSqVkbuOBJ7HeGR4/nB7s24R1FaqVchfjzO4VNx
	8k4CKzL2aoswAwXXzfjXw34BljGbX3U377gDQhuFMwekbjAjwSuaucLTko7xRbMLN7k3P/pyZ3Y6U
	FbzMlEVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc95-0000000DB3w-2hyM;
	Mon, 08 Dec 2025 14:23:25 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc92-0000000DB2U-36aA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 14:23:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47774d3536dso42812445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 06:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765203799; x=1765808599; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sW5CVG6fTovVK5pm5F0b9TUqJDd0mR5nCkkwbSDkjc=;
        b=Nnkaom24xqF1fYO1Ubz4tKrCsSsJFSfQSAxJJbJT/GsTXl/5HnKDCaQusS3vOCVfxM
         40Skof6ZQkskhIyzWybBcJXR1QR7jP+j46HwXdachTEBdSJt+FIkOGw4QI9eI0JGtEpo
         TsSSxNLe/xEMEKZCiKV742oG9qk9hYDsP8F2Ckx34x0665XAzfQcVqUlKYO/Bl1fKx00
         NiXCnXHwvxbeks1+rDb5c4yALSCz269SMRN6jcWOGcrOZLLXx4MAZyxAc2YQPYvh4Lgn
         grj71GX1hVVDXjEQQKKymn2KjsYBZLuoKLp7IBxvukC7jOW0Ks9mZiztn4evjQulEkqA
         OG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203799; x=1765808599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2sW5CVG6fTovVK5pm5F0b9TUqJDd0mR5nCkkwbSDkjc=;
        b=M28n0yEKdsMP4FdJY+82UCbEaAdOJ+Ng4huiUpvuqcSYX/L5HHigknHCMhscKLQuEo
         RNlQbMXBVcF/4kvuCIyCFUVCW9LN1mkwVsm4NXxwclQDscDFHIW11Qd4GAqlrhmH+3et
         NEaZiF8mskGGSVFvKRXnWqlGMgbjiSkjzfC2Rt2JVx5pqUtRdn4kwy/U4YtZsv/0YwTj
         nxmoWmp6s/2LLTpMWhE4an71H1meWmWfXyLY+6XYNSTc1OoJSMvQGBdzneYTKISsQwAa
         96KYfwAP/lpUGwu1ZX/KyeaVcxoGLFXzRrYN2tsarOtwIULsWOLTeHoUKmLrZ3snDyAR
         JgQg==
X-Forwarded-Encrypted: i=1; AJvYcCUWk+4w/v2LnrCrE6FuI2Oq0/kr/YkOy/Q/tfjjnwZ1zRRb9cR80dbGTMtmUcBtOjKYYZEzOtoIQ4/7rDbPymYB@lists.infradead.org
X-Gm-Message-State: AOJu0YwCmyh9X8WhMxyjwHf3b6FytKgdZC3Lxap3oc55qfuqSEdBYA2o
	K5NJkvXwVAqbgYCMv5l2Pqrq5oWJOXYCgxX2pVlfSfeXQEA+k89YqhfAMKVA1SOnJrxwB8YuMPg
	m2ySy
X-Gm-Gg: ASbGncva7xPXgaXptCCro5XQ4xXFH8arKGL/ft4/VvjgoDtr38gwS/RUDEOFd5aLj50
	75ghbBKzLqTvrBCV82X+Lo3vSrDXJZMKFS/O5SPoIx7Ssr+ImFIEW0eL3E8tVidxeURO9LwkGDP
	TXVWD1dsu2t7Bnp4YLTz7BloQyw7uQIW2OKlCAtYC+tUd64vbVU7k3uDmu6Vx0O3PUlmIGKQLA1
	UUWvM835RovtlEUdELmZubtbAnbqviLe0iCkC7kDXQ7WfLAed5F5Q8hqpDqw+hspsqK2CJGARUK
	zjYOdhv3oM3XZVVKb3kNpTRtX2dmeIkyJn441xrEp51Z7XDsauD7XL1T81hYCHrftYY7jBinTQN
	66xziaVB6Pvx/JAB2DCIypjYifM+IqfMwLELrX7xqMVbk1k+ppTLTSgG8UwS1X7y0zcMc2yfchT
	NjzintNbmXZtS1nJ4SaDHbbKzlYpozjJdZPnkUfspjlw==
X-Google-Smtp-Source: AGHT+IGYLrvxfRv8u0L6Kyp8fUW21hbwdhdUTTfYsrMxGFHJNMXLnvGBImr+N7bTR/70pUVKkNbYZQ==
X-Received: by 2002:a05:600c:4f11:b0:46e:2815:8568 with SMTP id 5b1f17b1804b1-47939e2371fmr79357865e9.10.1765203798705;
        Mon, 08 Dec 2025 06:23:18 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930920e0dsm248561065e9.2.2025.12.08.06.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:23:18 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 08 Dec 2025 14:22:04 +0000
Subject: [PATCH v2 01/12] perf parse-events: Refactor get_config_terms() to
 remove macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-james-perf-config-bits-v2-1-4ac0281993b0@linaro.org>
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
X-CRM114-CacheID: sfid-20251208_062321_088483_08BBF68D 
X-CRM114-Status: GOOD (  21.72  )
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

The ADD_CONFIG_TERM() macros build the __type argument out of a partial
EVSEL__CONFIG_TERM_x enum name. This means that they can't be called
from a function where __type is a variable and it's also impossible to
grep the codebase to find usages of these enums as they're never typed
in full.

Fix this by removing the macros and replacing them with an
add_config_term() function. It seems the main reason these existed in
the first place was to avoid type punning and to write to a specific
field in the union, but the same thing can be achieved with a single
write to a u64 'val' field.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/evsel_config.h |   1 +
 tools/perf/util/parse-events.c | 146 ++++++++++++++++++++++++-----------------
 2 files changed, 86 insertions(+), 61 deletions(-)

diff --git a/tools/perf/util/evsel_config.h b/tools/perf/util/evsel_config.h
index bcd3a978f0c4..685fd8d5c4a8 100644
--- a/tools/perf/util/evsel_config.h
+++ b/tools/perf/util/evsel_config.h
@@ -50,6 +50,7 @@ struct evsel_config_term {
 		u64	      cfg_chg;
 		char	      *str;
 		int	      cpu;
+		u64	      val;
 	} val;
 	bool weak;
 };
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 17c1c36a7bf9..d5b009b4ebab 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1116,105 +1116,107 @@ static int config_attr(struct perf_event_attr *attr,
 	return 0;
 }
 
-static int get_config_terms(const struct parse_events_terms *head_config,
-			    struct list_head *head_terms)
+static struct evsel_config_term *add_config_term(enum evsel_term_type type,
+						 struct list_head *head_terms,
+						 bool weak)
 {
-#define ADD_CONFIG_TERM(__type, __weak)				\
-	struct evsel_config_term *__t;			\
-								\
-	__t = zalloc(sizeof(*__t));				\
-	if (!__t)						\
-		return -ENOMEM;					\
-								\
-	INIT_LIST_HEAD(&__t->list);				\
-	__t->type       = EVSEL__CONFIG_TERM_ ## __type;	\
-	__t->weak	= __weak;				\
-	list_add_tail(&__t->list, head_terms)
-
-#define ADD_CONFIG_TERM_VAL(__type, __name, __val, __weak)	\
-do {								\
-	ADD_CONFIG_TERM(__type, __weak);			\
-	__t->val.__name = __val;				\
-} while (0)
+	struct evsel_config_term *t;
 
-#define ADD_CONFIG_TERM_STR(__type, __val, __weak)		\
-do {								\
-	ADD_CONFIG_TERM(__type, __weak);			\
-	__t->val.str = strdup(__val);				\
-	if (!__t->val.str) {					\
-		zfree(&__t);					\
-		return -ENOMEM;					\
-	}							\
-	__t->free_str = true;					\
-} while (0)
+	t = zalloc(sizeof(*t));
+	if (!t)
+		return NULL;
+
+	INIT_LIST_HEAD(&t->list);
+	t->type = type;
+	t->weak	= weak;
+	list_add_tail(&t->list, head_terms);
 
+	return t;
+}
+
+static int get_config_terms(const struct parse_events_terms *head_config,
+			    struct list_head *head_terms)
+{
 	struct parse_events_term *term;
 
 	list_for_each_entry(term, &head_config->terms, list) {
+		struct evsel_config_term *new_term;
+		enum evsel_term_type new_type;
+		char *str = NULL;
+		u64 val;
+
 		switch (term->type_term) {
 		case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
-			ADD_CONFIG_TERM_VAL(PERIOD, period, term->val.num, term->weak);
+			new_type = EVSEL__CONFIG_TERM_PERIOD;
+			val = term->val.num;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
-			ADD_CONFIG_TERM_VAL(FREQ, freq, term->val.num, term->weak);
+			new_type = EVSEL__CONFIG_TERM_FREQ;
+			val = term->val.num;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_TIME:
-			ADD_CONFIG_TERM_VAL(TIME, time, term->val.num, term->weak);
+			new_type = EVSEL__CONFIG_TERM_TIME;
+			val = term->val.num;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_CALLGRAPH:
-			ADD_CONFIG_TERM_STR(CALLGRAPH, term->val.str, term->weak);
+			new_type = EVSEL__CONFIG_TERM_CALLGRAPH;
+			str = term->val.str;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_BRANCH_SAMPLE_TYPE:
-			ADD_CONFIG_TERM_STR(BRANCH, term->val.str, term->weak);
+			new_type = EVSEL__CONFIG_TERM_BRANCH;
+			str = term->val.str;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_STACKSIZE:
-			ADD_CONFIG_TERM_VAL(STACK_USER, stack_user,
-					    term->val.num, term->weak);
+			new_type = EVSEL__CONFIG_TERM_STACK_USER;
+			val = term->val.num;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_INHERIT:
-			ADD_CONFIG_TERM_VAL(INHERIT, inherit,
-					    term->val.num ? 1 : 0, term->weak);
+			new_type = EVSEL__CONFIG_TERM_INHERIT;
+			val = term->val.num ? 1 : 0;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_NOINHERIT:
-			ADD_CONFIG_TERM_VAL(INHERIT, inherit,
-					    term->val.num ? 0 : 1, term->weak);
+			new_type = EVSEL__CONFIG_TERM_INHERIT;
+			val = term->val.num ? 0 : 1;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_MAX_STACK:
-			ADD_CONFIG_TERM_VAL(MAX_STACK, max_stack,
-					    term->val.num, term->weak);
+			new_type = EVSEL__CONFIG_TERM_MAX_STACK;
+			val = term->val.num;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_MAX_EVENTS:
-			ADD_CONFIG_TERM_VAL(MAX_EVENTS, max_events,
-					    term->val.num, term->weak);
+			new_type = EVSEL__CONFIG_TERM_MAX_EVENTS;
+			val = term->val.num;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_OVERWRITE:
-			ADD_CONFIG_TERM_VAL(OVERWRITE, overwrite,
-					    term->val.num ? 1 : 0, term->weak);
+			new_type = EVSEL__CONFIG_TERM_OVERWRITE;
+			val = term->val.num ? 1 : 0;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_NOOVERWRITE:
-			ADD_CONFIG_TERM_VAL(OVERWRITE, overwrite,
-					    term->val.num ? 0 : 1, term->weak);
+			new_type = EVSEL__CONFIG_TERM_OVERWRITE;
+			val = term->val.num ? 0 : 1;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_DRV_CFG:
-			ADD_CONFIG_TERM_STR(DRV_CFG, term->val.str, term->weak);
+			new_type = EVSEL__CONFIG_TERM_DRV_CFG;
+			str = term->val.str;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_PERCORE:
-			ADD_CONFIG_TERM_VAL(PERCORE, percore,
-					    term->val.num ? true : false, term->weak);
+			new_type = EVSEL__CONFIG_TERM_PERCORE;
+			val = term->val.num ? true : false;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_AUX_OUTPUT:
-			ADD_CONFIG_TERM_VAL(AUX_OUTPUT, aux_output,
-					    term->val.num ? 1 : 0, term->weak);
+			new_type = EVSEL__CONFIG_TERM_AUX_OUTPUT;
+			val = term->val.num ? 1 : 0;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_AUX_ACTION:
-			ADD_CONFIG_TERM_STR(AUX_ACTION, term->val.str, term->weak);
+			new_type = EVSEL__CONFIG_TERM_AUX_ACTION;
+			str = term->val.str;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_AUX_SAMPLE_SIZE:
-			ADD_CONFIG_TERM_VAL(AUX_SAMPLE_SIZE, aux_sample_size,
-					    term->val.num, term->weak);
+			new_type = EVSEL__CONFIG_TERM_AUX_SAMPLE_SIZE;
+			val = term->val.num;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_RATIO_TO_PREV:
-			ADD_CONFIG_TERM_STR(RATIO_TO_PREV, term->val.str, term->weak);
+			new_type = EVSEL__CONFIG_TERM_RATIO_TO_PREV;
+			str = term->val.str;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_USER:
 		case PARSE_EVENTS__TERM_TYPE_CONFIG:
@@ -1229,7 +1231,23 @@ do {								\
 		case PARSE_EVENTS__TERM_TYPE_RAW:
 		case PARSE_EVENTS__TERM_TYPE_CPU:
 		default:
-			break;
+			/* Don't add a new term for these ones */
+			continue;
+		}
+
+		new_term = add_config_term(new_type, head_terms, term->weak);
+		if (!new_term)
+			return -ENOMEM;
+
+		if (str) {
+			new_term->val.str = strdup(str);
+			if (!new_term->val.str) {
+				zfree(&new_term);
+				return -ENOMEM;
+			}
+			new_term->free_str = true;
+		} else {
+			new_term->val.val = val;
 		}
 	}
 	return 0;
@@ -1290,10 +1308,16 @@ static int get_config_chgs(struct perf_pmu *pmu, struct parse_events_terms *head
 		}
 	}
 
-	if (bits)
-		ADD_CONFIG_TERM_VAL(CFG_CHG, cfg_chg, bits, false);
+	if (bits) {
+		struct evsel_config_term *new_term;
+
+		new_term = add_config_term(EVSEL__CONFIG_TERM_CFG_CHG,
+					   head_terms, false);
+		if (!new_term)
+			return -ENOMEM;
+		new_term->val.cfg_chg = bits;
+	}
 
-#undef ADD_CONFIG_TERM
 	return 0;
 }
 

-- 
2.34.1


