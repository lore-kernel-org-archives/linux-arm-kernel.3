Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC1DD7789D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXvuPYQD/fisJzCKsA/DBraI1phkxdS4K0wIHG10zkI=; b=CKRD2JOh+AZW5PBfSSzdm0kGKt
	yVdD4zHor27b2W7UI/yK4rDzTjARVcPpR7naIqiVnJaSmZ3R8tUGBYaY31MrYkTyTrV44cj30uiPM
	G6rIPCZsKWECrCLiKc/aLuM/8AiUajSyGlVvPkQ+1xfD1EIeFaxNJNKF1mYTepXM2F8WWHKVJN3Lp
	7O5QbIBn8WrDRE/VqiH9f1E0OtTQvQ8Zygw2schraclk5CUR1cTXEQpuBnge9FBmuJr0mUA+5h+Ot
	/OjoeCyQiJoS3+ccInRmoJNl80qbw4T6nwCn0A+sPBgRcU2XgPHFNgHcYwpoLcwSflWvmXlOZD38I
	jdjmTV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLFb-00000009J3w-1h6W;
	Fri, 23 Jan 2026 17:47:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLFZ-00000009J3n-3euv;
	Fri, 23 Jan 2026 17:47:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EAE8460147;
	Fri, 23 Jan 2026 17:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E4DC4CEF1;
	Fri, 23 Jan 2026 17:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769190432;
	bh=Fvul9cTQTipTMlqs6XhjhLKNYQVXUkoZrLxvwUon1vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EnJs6i5cTHOlKaNlU87cLSBa8KHPBnahqPMdwuu7AmNbJl+0lAV32DFm2xxVfJ+s1
	 M2VjiYN269iF/Fz1hKsagkuBCbTtBLNmI4o76vHdDNuWy/vP5qfM2NmJrjsyIOGpPz
	 oTtEljWa8LRkKv211KZkl0aIhoPn1LelEFGMrNm/2rbvJtBG7YzZmU8K7BwP43X2yn
	 1wBqL6mh9sWW8eYykQfWb4HzEVFhMmOcgdtcmohtx/ru/FspacPOjG336TlE1GCTPo
	 coPzT9tMq0lspF7y77DhDjko2h+ZmGKtWz/GJJj+42BGTI1U9g+GPumXQVn5Jhy7gw
	 sGkBR+CQRM/Lw==
Date: Fri, 23 Jan 2026 14:47:09 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Zecheng Li <zecheng@google.com>, Tianyou Li <tianyou.li@intel.com>,
	Thomas Falcon <thomas.falcon@intel.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>,
	Athira Rajeev <atrajeev@linux.ibm.com>,
	Aditya Bodkhe <aditya.b1@linux.ibm.com>,
	Howard Chu <howardchu95@gmail.com>,
	Krzysztof =?utf-8?Q?=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Shimin Guo <shimin.guo@skydio.com>,
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 11/12] perf disasm: Refactor arch__find and
 initialization of arch structs
Message-ID: <aXO0Hao8t-McaAU3@x1>
References: <20260122213516.671089-1-irogers@google.com>
 <20260122213516.671089-12-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260122213516.671089-12-irogers@google.com>
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

On Thu, Jan 22, 2026 at 01:35:15PM -0800, Ian Rogers wrote:
> Switch arch__find to using an ELF machine number rather than a
> string. Rather than an array of fixed size arch structs turn the init
> functions into new functions indexed by the ELF machine they
> correspond to. This allows data to be stored with a struct arch with
> the container_of trick, so the priv variable can be removed. Switch to
> using the thread to find the arch rather than the evsel as the evsel
> only has limited notions of the running thread upon which disassembly
> is performed. Factor out the e_machine and e_flags into their own
> struct to make them easier to pass around.

Added:

⬢ [acme@toolbx perf-tools-next]$ git diff
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 46740d1e58580004..4f60726247d62764 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -1,5 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <ctype.h>
+#include <elf.h>
+#ifndef EF_CSKY_ABIMASK
+#define EF_CSKY_ABIMASK        0XF0000000
+#endif
 #include <errno.h>
 #include <fcntl.h>
 #include <inttypes.h>


With:

    [ Include elf.h for EM_CSKY and friends and also conditionally define EM_CSKY_ABIMASK for old distros ]


