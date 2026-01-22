Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C58D6CFA6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 21:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xlxy7gGNB7fnsuI8qX0WFdpap2bNeW5xmXABoxpIzho=; b=2VORnYl//0iHHlrFaPzEmW0xAO
	BNi/doCvDHlwB9QFX/dHqFSD/2edHw++SodRRyw4408Qc+Q1EuqyZspuE0YNKGeH9CvpilSOaP9Nw
	+GcPkGC15DV7Ak+95PcaxcVOGwyrOe249PZUREUzQU7YQW/fTgawEdBlF1k7ncrVYKGxSzC/LbSWT
	Dkh+iCi0cCnPafAzPJrxv8My1P+rqcySSbRhcSTF8FVhy+E9rZyv1//i9rPgF0iHE9RXnEiVJIbuI
	mshdwaLBsHjTq3ZZkW/orErA1f4eYd9xECjC0lm235Gx32O/Dh+oig7eCucgIfp+ZNo84qvphd5Mr
	t/bbZElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2LO-00000007mXr-2pLE;
	Thu, 22 Jan 2026 21:35:58 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2L8-00000007mP1-0fqb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 21:35:43 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b708fa4093so4324917eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 13:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769117741; x=1769722541; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xlxy7gGNB7fnsuI8qX0WFdpap2bNeW5xmXABoxpIzho=;
        b=i5GqIncXj45/38tHZN+1uL3tOf3RMALtO8ehBgHmU513M3GULQm3/T6QpqZ7mX5oXB
         qbiC5e33JIZ5tbRpqsCyYyqfGPtkaQkIp5EI/4e6FUxCeMl/APDAVjFm3O4sUuXJHIEO
         6yfBGuclzmmNpxGx0y+rGiJ4bPkGfbvLj9RPBnDyi1fLP40jLTrvRr7REhjInoOrRs7m
         9KYAM09fRIUmK70zetXBKY3rMZJneJAkrkc//3KVJEVh5YVLByzRfExqpH7kpbMIcCj3
         0nEI89SE8YR3jofppcBOtOD3izpLG++2uMjXMafJyD4YH+0yuJhk1eDa+B4IKGpv4LqT
         eFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769117741; x=1769722541;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xlxy7gGNB7fnsuI8qX0WFdpap2bNeW5xmXABoxpIzho=;
        b=ak89DfS0WFGwKS2B2rZhBr9R/kwttDKtNc+JqdyuPBOdVE7AzWIPNbNhV7+CUBgBtj
         UJDWr4naYWYeevbv4T6QqwNCBnSjUr1MSXOuDm/RuPT21Y5xy33Gsk4S7AF3YBJYxWFK
         5dRV2kk512n+QEZedz06jTcha8grTy6WHff1PGeMB2inntaFCQitUhrUJh0s2JRx7hfj
         8/P91MVFeEv9cLfj3P7HOTKOrvQUB/fwCOIQyJ+U4lOoN6IYVeyAm8dwLfydt+L9GI4W
         DXPheRtW4cHtqvmh+RDl8Vvkar12FkZePSYK+BeGExUGN+lwEI3//AQg0srWfjiAV5Y1
         k0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+fYyorcbKKFJZ3e9mVaA7MwAPKvkLAYqLAjiGoB4m8RhiZB6imv3d/bkDAzUB1ZbfeP1mOBkmubXGsHcN2D1a@lists.infradead.org
X-Gm-Message-State: AOJu0YyvIez6RWGw1ym0bXsYKrtDEhzUNHYWxgeT39G9Ol1n0Fz9yp2R
	DCDwfxouuCmDBIohMmJFnsE6kMplD8MiMUyja2WyJlwwsqqrfgRf+I48YITcneIzcfjKDTOxb63
	XcSAE+sYaKw==
X-Received: from dybqo12.prod.google.com ([2002:a05:7301:678c:b0:2b6:b6b8:7fee])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:578e:b0:2ae:53da:9787
 with SMTP id 5a478bee46e88-2b739beb0bamr355131eec.40.1769117740757; Thu, 22
 Jan 2026 13:35:40 -0800 (PST)
Date: Thu, 22 Jan 2026 13:35:13 -0800
In-Reply-To: <20260122213516.671089-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122213516.671089-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122213516.671089-10-irogers@google.com>
Subject: [PATCH v3 09/12] perf disasm: Refactor ins__is_call/jump to avoid
 exposing arch ins_ops
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Zecheng Li <zecheng@google.com>, 
	Tianyou Li <tianyou.li@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Suchit Karunakaran <suchitkarunakaran@gmail.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_133542_232415_5652BB93 
X-CRM114-Status: GOOD (  13.41  )
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

Add booleans indicating whether and ins_ops are call or jump and
return it. This avoids exposing loongarch and s390 ins_ops for the
sake of matching.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/annotate-arch/annotate-loongarch.c | 6 ++++--
 tools/perf/util/annotate-arch/annotate-s390.c      | 3 ++-
 tools/perf/util/disasm.c                           | 6 ++++--
 tools/perf/util/disasm.h                           | 5 ++---
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/annotate-arch/annotate-loongarch.c b/tools/perf/util/annotate-arch/annotate-loongarch.c
index 32df10f6fed5..79dc116ade2f 100644
--- a/tools/perf/util/annotate-arch/annotate-loongarch.c
+++ b/tools/perf/util/annotate-arch/annotate-loongarch.c
@@ -57,9 +57,10 @@ static int loongarch_call__parse(const struct arch *arch, struct ins_operands *o
 	return 0;
 }
 
-const struct ins_ops loongarch_call_ops = {
+static const struct ins_ops loongarch_call_ops = {
 	.parse	   = loongarch_call__parse,
 	.scnprintf = call__scnprintf,
+	.is_call   = true,
 };
 
 static int loongarch_jump__parse(const struct arch *arch, struct ins_operands *ops,
@@ -106,9 +107,10 @@ static int loongarch_jump__parse(const struct arch *arch, struct ins_operands *o
 	return 0;
 }
 
-const struct ins_ops loongarch_jump_ops = {
+static const struct ins_ops loongarch_jump_ops = {
 	.parse	   = loongarch_jump__parse,
 	.scnprintf = jump__scnprintf,
+	.is_jump   = true,
 };
 
 static
diff --git a/tools/perf/util/annotate-arch/annotate-s390.c b/tools/perf/util/annotate-arch/annotate-s390.c
index 81db102b3e15..7b2d27b62e6b 100644
--- a/tools/perf/util/annotate-arch/annotate-s390.c
+++ b/tools/perf/util/annotate-arch/annotate-s390.c
@@ -57,9 +57,10 @@ static int s390_call__parse(const struct arch *arch, struct ins_operands *ops,
 	return 0;
 }
 
-const struct ins_ops s390_call_ops = {
+static const struct ins_ops s390_call_ops = {
 	.parse	   = s390_call__parse,
 	.scnprintf = call__scnprintf,
+	.is_call   = true,
 };
 
 static int s390_mov__parse(const struct arch *arch __maybe_unused,
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 845c2d0f39b1..8c3e9094600a 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -315,11 +315,12 @@ int call__scnprintf(const struct ins *ins, char *bf, size_t size,
 const struct ins_ops call_ops = {
 	.parse	   = call__parse,
 	.scnprintf = call__scnprintf,
+	.is_call   = true,
 };
 
 bool ins__is_call(const struct ins *ins)
 {
-	return ins->ops == &call_ops || ins->ops == &s390_call_ops || ins->ops == &loongarch_call_ops;
+	return ins->ops && ins->ops->is_call;
 }
 
 /*
@@ -469,11 +470,12 @@ const struct ins_ops jump_ops = {
 	.free	   = jump__delete,
 	.parse	   = jump__parse,
 	.scnprintf = jump__scnprintf,
+	.is_jump   = true,
 };
 
 bool ins__is_jump(const struct ins *ins)
 {
-	return ins->ops == &jump_ops || ins->ops == &loongarch_jump_ops;
+	return ins->ops && ins->ops->is_jump;
 }
 
 static int comment__symbol(char *raw, char *comment, u64 *addrp, char **namep)
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 83503c5075f9..b6a2a30fdf27 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -93,6 +93,8 @@ struct ins_ops {
 			struct disasm_line *dl);
 	int (*scnprintf)(const struct ins *ins, char *bf, size_t size,
 			 struct ins_operands *ops, int max_ins_name);
+	bool is_jump;
+	bool is_call;
 };
 
 struct annotate_args {
@@ -139,9 +141,6 @@ bool ins__is_fused(const struct arch *arch, const char *ins1, const char *ins2);
 bool ins__is_ret(const struct ins *ins);
 bool ins__is_lock(const struct ins *ins);
 
-extern const struct ins_ops s390_call_ops;
-extern const struct ins_ops loongarch_call_ops;
-extern const struct ins_ops loongarch_jump_ops;
 const struct ins_ops *check_ppc_insn(struct disasm_line *dl);
 
 struct disasm_line *disasm_line__new(struct annotate_args *args);
-- 
2.52.0.457.g6b5491de43-goog


