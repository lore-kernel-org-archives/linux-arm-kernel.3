Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F038C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 07:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuAcUlfLOH+Nmb5IOvdzZq6066CfyPFp8FPVv/E64Q8=; b=1Qi22XkoAmpiCdajoa+60Tkw/K
	ykM/EK1xkQIRPJYbbuNL6rlOArkwBUQzO8IHKf6pO8FACkzFHKR1JK9VFdDRcGd21KNgT+Bfwo85A
	7ESV2vIjttSTUVE+dVVur5AAWMBlPaoVDVj2Yhatye0koaBV5Es7mF6L5g+SfQCB5RnFxyOXZ1qaJ
	09zUUaqv7NtAdaUF5PO2dhE+bIfxirQAXl7jTLErs9oDmIiHYLbxqeBtA9FlDuD4YBlAySydsiFHN
	hJ4fIl+IK0wcTjgVLJv0yMuFGDstB/lzYK0mu3HZjA5bHRU13f+qLTWgZA2bKMUnkkPhRBUAAv/xA
	jMe2jHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAh-00000006YXW-1JGo;
	Thu, 22 Jan 2026 07:32:03 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAQ-00000006YCL-2BXj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 07:31:49 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-122008d48e5so1365803c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 23:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769067105; x=1769671905; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RuAcUlfLOH+Nmb5IOvdzZq6066CfyPFp8FPVv/E64Q8=;
        b=XukqaahIKOpOjUoVyICeF0gm/KrdtNav8rmLbeWm0LLoG+/kSoIBUkbAzytwojOi0h
         GmcwFsuRCBHowlGuQFmIeoh11iCoKHr/sNFSz3xGRrra6WqeAMCOCrXnIq+76sdYsY0d
         xME9RzjuQnS1Wg8Wyb4HnsAttajqwXKNg+f42/l1xoLaS3YnmFpkMLY0ZmUqS3l9yKCK
         yLUnDZ2pOTzHQvCHZ9zkp04+86lyXynOrsRQHj/byjjtoMEwK3gSq8rT5DfY9oRPpGcR
         ghIna9lB+mEeOt3QIWWtgdey9i5hsVRFDSEbIgNrP4SYrBBJtnBGL3nKAEdmkiabrbMe
         izqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067105; x=1769671905;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RuAcUlfLOH+Nmb5IOvdzZq6066CfyPFp8FPVv/E64Q8=;
        b=nqo3qxg5+/9BhJvDPUJ6niAG/ZgfQcv1nSS6v6TQIkPQBFqqsJLjzkmLy0ByKQa8hc
         A+69DytMR202hhABiWZiTkCd9L2LYVC8GZvBQhVDwUTfkzpkO7JKOz6dyMORSIWaN2nR
         xo4y9EySHgQRBHXO+gR2hA+oqw3Mdw47qWjPR7qhi/GokPVWpeViJz3m65MfKaW+fkKy
         Ie+91xbe0gyOC1Srw4UyULZ7sDvdo9kc/gYCJp51cBpHkzASUBoOm8YaVS8GKK/dDSfH
         JmhcNOlauXx175cDOFrQzCSXztrcGjsXkcKwwqyRAv1ZWWOXRrXhL8o5sVDAWZHGzgER
         HkHA==
X-Forwarded-Encrypted: i=1; AJvYcCVelLLvm9ZEHQyYJcVVFp6vQaAkYgVZ4o8zjrV8pt1e97SjwkQh83oR+7WykKd7NmH4xOkNWH5y/bLO5xd+cdq9@lists.infradead.org
X-Gm-Message-State: AOJu0YwWlj+c4sValLb3A3f6u0b/3Uiijsjt2q7nTrHK9J4VlagL0EO9
	hxmuF4I7K4DwBs0d4zPCWUjjjTNKuv62TAuGOGX0zTQeL++/NtLPjcGcBMcFBTm9fa9nHUBKAYa
	ZcDYc4t8wUA==
X-Received: from dlbep12.prod.google.com ([2002:a05:7022:108c:b0:11e:64d:cd3b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:eacf:b0:11a:fec5:d005
 with SMTP id a92af1059eb24-1246a95600emr5252743c88.10.1769067104935; Wed, 21
 Jan 2026 23:31:44 -0800 (PST)
Date: Wed, 21 Jan 2026 23:31:24 -0800
In-Reply-To: <20260122073127.375139-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122073127.375139-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122073127.375139-9-irogers@google.com>
Subject: [PATCH v1 08/11] perf disasm: Refactor ins__is_call/jump to avoid
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
X-CRM114-CacheID: sfid-20260121_233146_595368_DA90A667 
X-CRM114-Status: GOOD (  13.66  )
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
index 4bd651b63652..b95ae5d6657f 100644
--- a/tools/perf/util/annotate-arch/annotate-loongarch.c
+++ b/tools/perf/util/annotate-arch/annotate-loongarch.c
@@ -55,9 +55,10 @@ static int loongarch_call__parse(const struct arch *arch, struct ins_operands *o
 	return 0;
 }
 
-const struct ins_ops loongarch_call_ops = {
+static const struct ins_ops loongarch_call_ops = {
 	.parse	   = loongarch_call__parse,
 	.scnprintf = call__scnprintf,
+	.is_call   = true,
 };
 
 static int loongarch_jump__parse(const struct arch *arch, struct ins_operands *ops,
@@ -104,9 +105,10 @@ static int loongarch_jump__parse(const struct arch *arch, struct ins_operands *o
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
index c1d06caa5f77..6d1a1da277e2 100644
--- a/tools/perf/util/annotate-arch/annotate-s390.c
+++ b/tools/perf/util/annotate-arch/annotate-s390.c
@@ -54,9 +54,10 @@ static int s390_call__parse(const struct arch *arch, struct ins_operands *ops,
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
index c732b015f2e8..bc5323ecb5da 100644
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


