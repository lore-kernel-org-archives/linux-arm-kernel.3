Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B16D37E59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLNSFy2x/hIrhk0Ax93bLHz2woErNJIZ/GG5lWWV+fA=; b=d2AvaKgKdGo0onnLY/tLo/w+8K
	R3UdKngbv/QMNo45nhTsnIPbCVDlyCS7k8b2mkZppKpEVz/hOUgrusrihu5LZs+y4SGOeNV4eJTbE
	UG5c79ACstvJdGDO6v6bGJi66CgevvnjbQeewxxSKOiBuE8Uu9jh8juwtzE10QhY2soW+/rznuDdw
	2E28bhaEQSJH2YA3ayiLn8sLRAYHGtVhm0aG+osq2B7BadDVEplaRnXKdfckiI+OP+iP6z/KEZQzE
	YBFrFd4l8u+5qD3shlzX7DnIciR/nqZEwtQkHz95aHbtTFX+MVeONmK1OjAqDDT+80BhbXn+KNxAe
	+Z+NA+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fi-00000009o5O-47ME;
	Wed, 14 Jan 2026 15:57:46 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fb-00000009o0j-41mF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:57:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so16195595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768406258; x=1769011058; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLNSFy2x/hIrhk0Ax93bLHz2woErNJIZ/GG5lWWV+fA=;
        b=GacrOyem7dhhF6HL054rm7QeJlCwAjH2/5cQHd5CZoc9lNbe+KHH4W3PxspkVD/o9A
         ZIbKulgI/nsslB+l1u761SA3Uo1OAOlhwCvvXz6lQ9ygJGEMGeSY9ccQdRptNiZSCByU
         nsxLsd2gj008Z/Xbuw3+Al1to7J1TIn0uH6QQdAmfqeE4FbVl79WVudUXjQSDmD8oJxy
         dOwVqWcaBI7TBDuRuAJbt6l0cu+d6JktRskMIKjanxa8Z2bPhh6h7JP1sz8nhV74EnSm
         ZvVEbMOoV6kQd/aj9ptOpCYUuWdebI+4uELxfXq33X6GCtonqbnxSA9FCqCZ3WO1MF0F
         Q1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406258; x=1769011058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dLNSFy2x/hIrhk0Ax93bLHz2woErNJIZ/GG5lWWV+fA=;
        b=l7xnQxZG9H76JQ5ghWqKrTSYI0i8Fb5L19PhKt7F4KHjZ7hMkq8AIgEz5vXIt0qcIU
         9YWv5nbUCyU3ziPxhe+RORrkCYrJtzgTT+bOgLv8eTed2jt1E7YHBpQ9W2cXgk56SpqR
         1EOgWLcuIFyHJcHxOGAOuEWk7oHw9gWHfAiiiZvvcZdsDzdDrz2EE4oQbrieH1lf+zM/
         a04/Oc5S0F9KHrCFF79CXozVzDgPrvF5HCMB18CtNTGkyR2l9HNhquwBAEqCM0hPDovL
         mK/ptj12acD2T0pOO6GBB8u7exNZz3i1mSu+duftAgFYzw0DGSvcjXSqaov+vgUoYr2H
         +now==
X-Forwarded-Encrypted: i=1; AJvYcCWNhgl301k8Oigo5ciOzHwCG0u+W3lfcMgaIYNUpmChURRBLOB6PtWha56fPbP34lRyfwnpc8nESPPo3fYm0iSF@lists.infradead.org
X-Gm-Message-State: AOJu0YyxX0TEGLLt4toiYusouXRpiUvvTC7cEw4swk44nJpnF+2EXR0F
	KP1G8EG6Aa//qYI2plzu+VcPOVpSUAuYCtUMfV1o8zyQZJLemN5AU3NemZIszO2ch/Y=
X-Gm-Gg: AY/fxX424OgiNLVWWyOGK/0B6lUIAjidbZeZui5Z0aV017W5Qtl6CFGX66/UqIi8ZhT
	PGNrVR20ItpVc1Q8SFGg8JQiaHTrYmT0bv0XrPJKOvGSakDS1eBd4X0D6Kw/Wc6fJ0kbuF+TtFf
	lsoDrXE7tSOTSJGwwCmwD1am8FdORFBhOggBCf2IIbgLCh6GIue0nTn2rXNVy3Ed4gfPLuWTKlw
	FOEFXbM0CKlHsqaPD8NSd+rr8kd3fVS3bJpXaE+CUGHvNeSo6Uh4Sycotew4UeKosGYNbHxtfWv
	9LPvsd36A8CRafSIHHgFRWPlu42zZURU2vAaoaxAwCw8vOPmqMuDYsqyn7UtfnNnmbrIYpgoj8K
	Ik+iTKhjCTtJ/NS4WVdTt/fqyrLcnCqg2lZUGPVtBDBhQNPRtfdA6WudopNSJbR4Mm1hBQd9iHW
	mJxS0/7ZdT9U4uAA8AnhrAul0uyzDAsw4=
X-Received: by 2002:a05:600c:8b58:b0:47e:d943:ec08 with SMTP id 5b1f17b1804b1-47ee483adc2mr28644605e9.28.1768406257990;
        Wed, 14 Jan 2026 07:57:37 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee85e8807sm7426475e9.16.2026.01.14.07.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:57:37 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 14 Jan 2026 15:57:13 +0000
Subject: [PATCH v5 01/14] perf parse-events: Refactor get_config_terms() to
 remove macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-james-perf-config-bits-v5-1-0ef97aaf1ac0@linaro.org>
References: <20260114-james-perf-config-bits-v5-0-0ef97aaf1ac0@linaro.org>
In-Reply-To: <20260114-james-perf-config-bits-v5-0-0ef97aaf1ac0@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_075740_129171_62B51E98 
X-CRM114-Status: GOOD (  21.55  )
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

Running the Perf tests with "-fsanitize=undefined -fno-sanitize-recover"
results in no new issues as a result of this change.

Reviewed-by: Ian Rogers <irogers@google.com>
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
index 17c1c36a7bf9..46422286380f 100644
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
+		bool str_type = false;
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
+			str_type = true;
 			break;
 		case PARSE_EVENTS__TERM_TYPE_BRANCH_SAMPLE_TYPE:
-			ADD_CONFIG_TERM_STR(BRANCH, term->val.str, term->weak);
+			new_type = EVSEL__CONFIG_TERM_BRANCH;
+			str_type = true;
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
+			str_type = true;
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
+			str_type = true;
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
+			str_type = true;
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
+		if (str_type) {
+			new_term->val.str = strdup(term->val.str);
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


