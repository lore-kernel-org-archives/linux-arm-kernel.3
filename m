Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFCAD64099
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 23:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzvCoj1xeTqTB7wBlJpyRYc+Iy1lxysKbVEC5FnZGzs=; b=N1nY61OjZopEskPcvS7co+E0D0
	pxZ5PgoIiLNrLDN1dj9zuuHARTi0aQ7mUJ1tzfruTZOSDOt1ahOjW0jCIB2Hb38heDc1YcHT1JXZF
	QHdXd4xyGVYFfnmzGbrVhKbCAaBIuyuu7VgYI386IWSr+FB45qe395knt7n9QULmwlAdCRBYKBE/8
	pMa8Q86RrmcCOXV7rifn5ErP5Q0E12qKWmsgJKe1DkX7zEJBX7CLzYLUMf9vUwFI/M6F84ShfmSp3
	ESTB+ElzLMLLY1Fg7WGKzPFZtf/S+KwuyaeDSIUfuB4nEWZNil5c7kNWKgywdifOSWaqLNpYx78MC
	0OD3wvKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Yjs-0000000CGC9-3qbm;
	Fri, 08 Nov 2024 23:50:04 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9YgA-0000000CEws-10bR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 23:46:15 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e376aa4586so54940107b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 15:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731109572; x=1731714372; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DzvCoj1xeTqTB7wBlJpyRYc+Iy1lxysKbVEC5FnZGzs=;
        b=WDWqrFAVE9+c7+0+/T4aMEuqOO1w3uX21qvQNgQJuyepWLLNzHUvReyIcDdsNcdWIx
         frNsm6s4moOy28D45PKyDDJQWGnYzcg7+rwQzZEqTWBOC5Wr3+KDrWtHdaxjxQXBKwbD
         vm9fR3AQsnDlRD8/r/XKZbdv8cyytwCYHupOGACqsjoSC2lZ0mrDj+2bWfoGpTV53RZ/
         UzQKguY8biPRWOOhVrZVo1QeCcQwOcu3PRStjC06djoVm2O4UCsgnAx8wiWbXoqAUynX
         vA8E0CC8s7bwrkJJ68d7h0mGuA423zWeoVVzn+dGRi+giv9awyk6har+QvI/t/CnIZLw
         P1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731109572; x=1731714372;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DzvCoj1xeTqTB7wBlJpyRYc+Iy1lxysKbVEC5FnZGzs=;
        b=OvZlBPTRWWcHNHizYYQJ6+LfBVbSAXZFEbo4QeDEqKPau1Eq//anAK81oFesVK/u+a
         UWGDQmKKHr6lLGTvl1nINXSRN8aYmTEHO9d3HFYuaaHQShpYsrg6bw3JbGiLg8Z2Bk+2
         BEEAuivEL1+VmS+lULKWSmSMta527b4W7TJhDhzBow1VgXJcZ75WZzhJXpBExfnFbp5H
         WR2x56FfFah4zqL2BkTFVt4dUSF2uMnByms6XNXqIhoN0RLjSibfKY374VYiinDX8Hh4
         6AmyT1GD1dD4A5cKQUviyjYcNdIDWy4IYxVeX5+9BirLhkBp4S4fg6ydU3mHl3/V9Zmi
         ZLUA==
X-Forwarded-Encrypted: i=1; AJvYcCWHgg+v/J+gRMZqQz2PUniiEjpgxGSlt6P7W0b4kAJst+0Qz8NnyaCDKHIKNr1D2pE7jv0ZOH+TO8o858+CMdWy@lists.infradead.org
X-Gm-Message-State: AOJu0YzTuUl5aU18TfHUgbwufdr5JCBdER/DSBjafREILM0peg/C5F+d
	A/eCs9pBgfXWFZglh5seUcLWaDRitYBKzNz+kcaCTxFHOXc6mJIA3RUeWuhovqyIkRG7zvOxRVg
	qLkC6EA==
X-Google-Smtp-Source: AGHT+IGiEURxVyZkRgDVPez0reOEsDnj5mtQIuymDAi91H+shA48+bNTCoiPk5eRO07f4EEtxrSuPDE6Z9oo
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:6fd2:1e36:6d8c:7c49])
 (user=irogers job=sendgmr) by 2002:a0d:ed43:0:b0:6ea:7c90:41f2 with SMTP id
 00721157ae682-6eaddfbb341mr180017b3.6.1731109572636; Fri, 08 Nov 2024
 15:46:12 -0800 (PST)
Date: Fri,  8 Nov 2024 15:45:46 -0800
In-Reply-To: <20241108234606.429459-1-irogers@google.com>
Message-Id: <20241108234606.429459-2-irogers@google.com>
Mime-Version: 1.0
References: <20241108234606.429459-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Subject: [PATCH v4 01/20] perf bpf-prologue: Remove unused file
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Changbin Du <changbin.du@huawei.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Atish Patra <atishp@rivosinc.com>, Shenlin Liang <liangshenlin@eswincomputing.com>, 
	Anup Patel <anup@brainfault.org>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_154614_289923_7411FF8E 
X-CRM114-Status: GOOD (  12.62  )
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

Commit 4a73fca22692 ("perf bpf-prologue: Remove unused file") missed
cleaning up the header file. The code was unnecessary as Commit
3d6dfae88917 ("perf parse-events: Remove BPF event support") removed
building bpf-prologue.c.

Fixes: 4a73fca22692 ("perf bpf-prologue: Remove unused file")
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf-prologue.h | 37 ----------------------------------
 1 file changed, 37 deletions(-)
 delete mode 100644 tools/perf/util/bpf-prologue.h

diff --git a/tools/perf/util/bpf-prologue.h b/tools/perf/util/bpf-prologue.h
deleted file mode 100644
index 66dcf751ef65..000000000000
--- a/tools/perf/util/bpf-prologue.h
+++ /dev/null
@@ -1,37 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2015, He Kuang <hekuang@huawei.com>
- * Copyright (C) 2015, Huawei Inc.
- */
-#ifndef __BPF_PROLOGUE_H
-#define __BPF_PROLOGUE_H
-
-struct probe_trace_arg;
-struct bpf_insn;
-
-#define BPF_PROLOGUE_MAX_ARGS 3
-#define BPF_PROLOGUE_START_ARG_REG BPF_REG_3
-#define BPF_PROLOGUE_FETCH_RESULT_REG BPF_REG_2
-
-#ifdef HAVE_BPF_PROLOGUE
-int bpf__gen_prologue(struct probe_trace_arg *args, int nargs,
-		      struct bpf_insn *new_prog, size_t *new_cnt,
-		      size_t cnt_space);
-#else
-#include <linux/compiler.h>
-#include <errno.h>
-
-static inline int
-bpf__gen_prologue(struct probe_trace_arg *args __maybe_unused,
-		  int nargs __maybe_unused,
-		  struct bpf_insn *new_prog __maybe_unused,
-		  size_t *new_cnt,
-		  size_t cnt_space __maybe_unused)
-{
-	if (!new_cnt)
-		return -EINVAL;
-	*new_cnt = 0;
-	return -ENOTSUP;
-}
-#endif
-#endif /* __BPF_PROLOGUE_H */
-- 
2.47.0.277.g8800431eea-goog


