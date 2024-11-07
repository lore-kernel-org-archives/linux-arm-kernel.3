Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6E5D5AE6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 07:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JtSX1ivElzP67Gy896L9Ack6oYznxDX7izzc96bZIU=; b=KASOLv+hF4qpQZEvDnFHJYZW9X
	AGfqZ+52HfSRHLwhn/swp6l+EJdQ+aixT9W7KRjQLeSvY3/Ku/MbikuCJjuwwuhrwzKGBWi70Z5AW
	xwLYlV6w62hcD4FydWzbkxPeAi/jKLLD/kTC6Ke5JsI+BaAYZLMOhROWO4tQpIHlTkNMLl9c3JbYt
	sgsH4CUHF52yVwLiHvdaiih6NXenOFet1vnjgThRZXXybFejb2vDuPKPSArDSjz180EW+L5Y0pPpB
	GVyp66seQfaEf5c3qD82mWzptJ2s7Z9VnZwm0Fj5G+pztEqDkU9vH5yuQmu46cJMOC+Eh8y+QBv4a
	TSLm3piA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wtM-00000005yu7-02Gq;
	Thu, 07 Nov 2024 07:25:20 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wkX-00000005wtQ-35MC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 07:16:15 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6eaae8b12bfso12308107b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 23:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730963772; x=1731568572; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JtSX1ivElzP67Gy896L9Ack6oYznxDX7izzc96bZIU=;
        b=M6Mwkd+VahDYznbfuGc4G9oIQrtPLHuoF/ZS1jqX/Fj6BXwL+bsqv/bs+Ix7H3VCtQ
         uLPBXdpUqCA3iBAzaf9LxkKuu+tjmHl7o/iGDBxSZy4K544yor+djJhF4DLJQS0l9RYJ
         3T5wnyrm4gYtl+b0JgNdZ7bzzQewPrz/TPmxO+DP2TvVc601cpRNm4JEFSxXG6clWnMJ
         BdXgY3WNdlbhpChYKOKUFwIWU2WvyGQ8OL26jlbZMWcDI3ht9+aGZRwhNp9MNydrTzcu
         EOtMfW9HOfMm5fcPPbzUkLtlAeF3+OI4U4sT9U70gU1fOed3/VdQVwOOsUkJbXbYy76F
         rmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963772; x=1731568572;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JtSX1ivElzP67Gy896L9Ack6oYznxDX7izzc96bZIU=;
        b=UJdDct7Vo9nRuVyjwVpGT9r3w9nHHG5/ttLkedPUEWxCOZYgVSf453Pb3C2tDHvWJD
         Q0pgvSDg3ZEpxkZUP1IqrCHwmeHDSWNpSPtyLCaQdQ0cIf+GL8G2IjaeKNpbOaUmvOw3
         0in+qZQOjEYyhMBDXSjxATawlgJwG4YGK+rbKGrakrKY/gOjWcQO6ZxPf4qts3GUgemG
         lvHoepx66HQHnRAAnhs6fIoDO/wpFx5dc9qfjxb/uDbHfYxtRRNT5KtIAKJ0AQzIh/72
         CqFRfK8fxSBhitMXtj965f2DcFZ4yE2iEEYgBq5r/LeiCUPhwk9KE61wjnU1FTYSvbgl
         qv4w==
X-Forwarded-Encrypted: i=1; AJvYcCUkdwRqyOVVSo4U630OjtWGUOGlHmldOTcn/EOHPuh688ZBIjVHutJUOFB4ZrzVrZUcKp2kF4zJpjfLshga4xY1@lists.infradead.org
X-Gm-Message-State: AOJu0Yxju7bgII+aMLIJ5OjkuAj1jnzACZhIcklhQn+xleWyoN7IbfVa
	joc15l7KKuufWPPtn/r4dJUeppap8cWElLQK/5RPbtvBZbewBOiZe2ywUBSEJs2u+YwQ43yPvgF
	14/8mPg==
X-Google-Smtp-Source: AGHT+IHo4j7jX9RyogLzkobNcoqsPX4PHdOeTPc0u8XD0m/LH7jjhm2PFEQw7af1FfiKXF3NPlnJLAyyNQZP
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:acc7:bda:7167:18d8])
 (user=irogers job=sendgmr) by 2002:a05:690c:60c6:b0:6ea:71c3:6cc3 with SMTP
 id 00721157ae682-6ead60ddc27mr1107b3.8.1730963772515; Wed, 06 Nov 2024
 23:16:12 -0800 (PST)
Date: Wed,  6 Nov 2024 23:15:57 -0800
In-Reply-To: <20241107071600.9082-1-irogers@google.com>
Message-Id: <20241107071600.9082-5-irogers@google.com>
Mime-Version: 1.0
References: <20241107071600.9082-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v1 4/7] perf header: Avoid transitive PMU includes
From: Ian Rogers <irogers@google.com>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Sandipan Das <sandipan.das@amd.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, 
	"=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=" <clement.legoffic@foss.st.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Dima Kogan <dima@secretsauce.net>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_231613_940210_2D3E5EF1 
X-CRM114-Status: GOOD (  11.50  )
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

Currently satisfied via header.h. Note, pmu.h includes parse-events.h.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/expr.c       | 2 ++
 tools/perf/util/env.c         | 1 +
 tools/perf/util/probe-event.c | 1 +
 3 files changed, 4 insertions(+)

diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
index e3aa9d4fcf3a..d60f1ac1d720 100644
--- a/tools/perf/tests/expr.c
+++ b/tools/perf/tests/expr.c
@@ -4,6 +4,8 @@
 #include "util/expr.h"
 #include "util/hashmap.h"
 #include "util/header.h"
+#include "util/pmu.h"
+#include "util/pmus.h"
 #include "util/smt.h"
 #include "tests.h"
 #include <math.h>
diff --git a/tools/perf/util/env.c b/tools/perf/util/env.c
index 93cabdd7ff43..e2843ca2edd9 100644
--- a/tools/perf/util/env.c
+++ b/tools/perf/util/env.c
@@ -12,6 +12,7 @@
 #include <sys/utsname.h>
 #include <stdlib.h>
 #include <string.h>
+#include "pmu.h"
 #include "pmus.h"
 #include "strbuf.h"
 #include "trace/beauty/beauty.h"
diff --git a/tools/perf/util/probe-event.c b/tools/perf/util/probe-event.c
index a580aa2cd512..d399c7e03341 100644
--- a/tools/perf/util/probe-event.c
+++ b/tools/perf/util/probe-event.c
@@ -40,6 +40,7 @@
 #include "session.h"
 #include "string2.h"
 #include "strbuf.h"
+#include "parse-events.h"
 
 #include <subcmd/pager.h>
 #include <linux/ctype.h>
-- 
2.47.0.199.ga7371fff76-goog


