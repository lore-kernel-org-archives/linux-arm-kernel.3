Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34DAC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TCvh4Vl2F2EFt/f91KAA0cLNnhh1VtUSP6qDYdHXzE=; b=nm/R9QCnb/ISnRpvEL2cOmqgWQ
	Z8z8Vz/+KyOJ8DLAg9YsStdNgpm774zhN1kSPHRcgKVavLjeHKq9a2v6NAaAar8ASUmyM7TNMgQwD
	lmpQIYdHlVmGOWSVbUFmDJJBhJCkZZXKwW+OAhkRdMuiF/4U6rhzhPYbM732zuw5Qazfq7/DwnWyz
	w0rgUHisUp1m+LT2F/H9HrU7mRiDAWfxtvMoyHtWGA7x7hapSzRCbkpjwy0lHPbk/2dRXijvQMsTz
	dCZPHPh8nqiX70ow2UltASLVOSgTBZaxJYWg+/++nBG8OY1ZPcIwHVtPNFmqtrcQRV4s7A7YnoR7V
	AVkJL6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysp-0000000FEy1-32QM;
	Sat, 17 Jan 2026 05:29:59 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysT-0000000FEUu-1Te1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:38 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2b6a8b32fa9so10173173eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 21:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627776; x=1769232576; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4TCvh4Vl2F2EFt/f91KAA0cLNnhh1VtUSP6qDYdHXzE=;
        b=AYCQLyiGAELZyZQTrYyzRqqE0jZVRR7d5JM27evt6gQ9+jblYwynUn0ffkcmxH3s4u
         T/UrQInD1zgnY0I3ePGhZ48EfVhVQi6UE9ZspFQRJrOPgdje6hUsjci0PJEv0tP58eUF
         2sXo+PNX0fgnSlrwewDLsmSQjnqVdVCPrpZiFtV60Y/AbCx1bBfxB5XnFbXfXVI+7Gow
         T7hOOqhegQoDObmwemmHzqLn2sFnNyn4C9ZV3Z9FuMO2d6ihgmbRIuTvZmMGGI7F1v5s
         R9FneuWCdtc6n+uFQAKZpPZOAbe4ITtI3v0zZ4Ru4Aw7fcsAmC9hLkPB8maQvacDb1kG
         JrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627776; x=1769232576;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4TCvh4Vl2F2EFt/f91KAA0cLNnhh1VtUSP6qDYdHXzE=;
        b=XrEqrZ7mX2CN2Pk3LrcUvVPnJxPhrh5hWtCBu5g1nKr/I32OgDFE8FOvdffEDQJztz
         PGp459DKR47dSllClsP6B6ZVZdT/KfTkD0Hw30pGDWChN/uJQCw/S20Us+uHpeKst1gh
         yMX2gUGh4GsVGnnyN83ktpGDPDI8BJogG/gfRdDrIxKGoCfd318unGMzvyAD1BT/ti/T
         /nup6kmYy1AHNiGhswUlc6m/qTNAnb2EB09CwXgBZuWD2XvTIj1SNdt0AZhA0kvUBibW
         xoiabECbSsRb6R5w3uMq5dfToJSnyHtoWEKBvkg8F9djzERVK7vSsPviTSDcuKdUvjaL
         vnpA==
X-Forwarded-Encrypted: i=1; AJvYcCVi4INyY3z76QqdWh6zkqXnTww67rvTErngXY7aUk06y4y3vTb1yHXuv4sqEzO6FD2aiwoPKlOZpWe3OQLRWjZ1@lists.infradead.org
X-Gm-Message-State: AOJu0YwfQU5uPLiougLA3INHXQNAEVxGoW4iQvny64UHLE4zOM4cvACA
	LDHt805egwQj+Paq1c6Dme5CulAqsTqVJOmRX/urJRcCLlIA29zbFkx6lDP3MmqAxS/UrC/w7g8
	58Gj2CScXKA==
X-Received: from dybut9.prod.google.com ([2002:a05:7301:e0c9:b0:2b6:c085:52ca])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:50c:b0:2b0:4c56:be16
 with SMTP id 5a478bee46e88-2b6b41016d0mr4300841eec.29.1768627775839; Fri, 16
 Jan 2026 21:29:35 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:35 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-10-irogers@google.com>
Subject: [PATCH v1 09/23] perf dwarf-regs: Add util/dwarf-regs-arch for
 consistency with perf-regs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dmitry Vyukov <dvyukov@google.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Chun-Tse Shao <ctshao@google.com>, 
	Aditya Bodkhe <aditya.b1@linux.ibm.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_212937_394237_1B9016A8 
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

perf_regs.h has cross architecture functions for operating with the
differing perf register constants. dwarf-regs.h is similar but for
cross architecture dwarf notions of registers. For consistency move
the arch parts of dwarf-regs out of util and into its own directory.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/Build                                      | 4 +---
 tools/perf/util/dwarf-regs-arch/Build                      | 3 +++
 tools/perf/util/{ => dwarf-regs-arch}/dwarf-regs-csky.c    | 0
 tools/perf/util/{ => dwarf-regs-arch}/dwarf-regs-powerpc.c | 0
 tools/perf/util/{ => dwarf-regs-arch}/dwarf-regs-x86.c     | 0
 5 files changed, 4 insertions(+), 3 deletions(-)
 create mode 100644 tools/perf/util/dwarf-regs-arch/Build
 rename tools/perf/util/{ => dwarf-regs-arch}/dwarf-regs-csky.c (100%)
 rename tools/perf/util/{ => dwarf-regs-arch}/dwarf-regs-powerpc.c (100%)
 rename tools/perf/util/{ => dwarf-regs-arch}/dwarf-regs-x86.c (100%)

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 5efec73be474..3cb1edd263cf 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -219,9 +219,7 @@ endif
 perf-util-$(CONFIG_LIBDW) += probe-finder.o
 perf-util-$(CONFIG_LIBDW) += dwarf-aux.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
-perf-util-$(CONFIG_LIBDW) += dwarf-regs-csky.o
-perf-util-$(CONFIG_LIBDW) += dwarf-regs-powerpc.o
-perf-util-$(CONFIG_LIBDW) += dwarf-regs-x86.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs-arch/
 perf-util-$(CONFIG_LIBDW) += debuginfo.o
 perf-util-$(CONFIG_LIBDW) += annotate-data.o
 perf-util-$(CONFIG_LIBDW) += libdw.o
diff --git a/tools/perf/util/dwarf-regs-arch/Build b/tools/perf/util/dwarf-regs-arch/Build
new file mode 100644
index 000000000000..98bec0032606
--- /dev/null
+++ b/tools/perf/util/dwarf-regs-arch/Build
@@ -0,0 +1,3 @@
+perf-util-$(CONFIG_LIBDW) += dwarf-regs-csky.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs-powerpc.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs-x86.o
diff --git a/tools/perf/util/dwarf-regs-csky.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
similarity index 100%
rename from tools/perf/util/dwarf-regs-csky.c
rename to tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
diff --git a/tools/perf/util/dwarf-regs-powerpc.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-powerpc.c
similarity index 100%
rename from tools/perf/util/dwarf-regs-powerpc.c
rename to tools/perf/util/dwarf-regs-arch/dwarf-regs-powerpc.c
diff --git a/tools/perf/util/dwarf-regs-x86.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c
similarity index 100%
rename from tools/perf/util/dwarf-regs-x86.c
rename to tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c
-- 
2.52.0.457.g6b5491de43-goog


