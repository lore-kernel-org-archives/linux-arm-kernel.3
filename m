Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF4CC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 05:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kN0S+GBjOAD0OG2qYKmCRMuBk4r0QOq8VP04yVuXG9Q=; b=od5S1X0ZJWeRBnCwPgSCGLch3Q
	vnhuBfDA8PFDPLaTjqhcf/j9bp3/hA8NJ59t24882/gaeFVlRNeXNnLNrLPVAtDOP6w8HTVhp/OA8
	xCuf3/BOs7Eo2PtfERVRNNFsTYry1hHKVU9Ww1LhOpAiUcvHvsqX4vOyvDPKY6Ix3Y8fc7RJ/uxoG
	2hm6rEpO4E4gI7u3E9Z6D41M+OHBEkV8hXjJgSKkkTKj3lzFNuq9W8Cspe0H8+8K5dF+/nHb7e+jB
	35d82wuGEYaZVaCDHdxgFm8YKQcgh2Z5J2YI0BooHItOCjijVDX+WWJlCtpGiI4LlLmHRjUgCaAVE
	SG+6boQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsxtS-0000000D7uw-07SQ;
	Fri, 14 Mar 2025 05:47:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsxrl-0000000D7XB-2bKc;
	Fri, 14 Mar 2025 05:45:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C78F1A487DE;
	Fri, 14 Mar 2025 05:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40296C4CEE3;
	Fri, 14 Mar 2025 05:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741931152;
	bh=UIHoxzhPf3e+N6sft1joYHuPe2ZldXQM7xaEMHF8UQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g9V5wLKvvzdYnmDpHxzPOfq0AxNt5QiDf5RPSpD1Z9RQFIFrZI9gA6Ga/OC4vbrhF
	 zyDAK/ALK3zLwiZA6+/Q21+00Jl+xwDMvnbK9EKGk9+vsSta0y8nKGItKJlqK8TFK8
	 Zmt6h+ElRvf3Xdm+rk+dFeLAJn4QCe7tdd5Bcs7zqnaInu6fdUEwMmqvuSl7jzpzlk
	 y0LjtBD7LCjdJeUA0wCptEUIDygjsTNjui4I1ClM50r1tz72lQWQx5jEp6mYfhYszs
	 K0h3QOuxoRTchgjOR1QZXwOpfJDwG7nh3cJRlxEKdJeH0c8hGd77+eWDt9B5y6qNkZ
	 XKaU59OZuTVUg==
Date: Thu, 13 Mar 2025 22:45:49 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	guoren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 00/11] perf: Support multiple system call tables in
 the build
Message-ID: <Z9PCjQ8PhOadVGQ8@google.com>
References: <20250308003209.234114-1-irogers@google.com>
 <Z9KFLGpenwOP32q3@google.com>
 <Z9M24AJzui9lFbGo@x1>
 <Z9M9-YhDJg3NgiUy@x1>
 <Z9NEX3j_1RUvaFI0@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9NEX3j_1RUvaFI0@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_224553_785231_5D4DB955 
X-CRM114-Status: GOOD (  16.11  )
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

On Thu, Mar 13, 2025 at 05:47:27PM -0300, Arnaldo Carvalho de Melo wrote:
> On Thu, Mar 13, 2025 at 05:20:09PM -0300, Arnaldo Carvalho de Melo wrote:
> > Still building, but noticed this on x86_64:
> > 
> > 105: perf trace enum augmentation tests                              : FAILED!
> > 106: perf trace BTF general tests                                    : FAILED!
> > 107: perf trace exit race                                            : Ok
> > 108: perf trace record and replay                                    : FAILED!
> > 
> > 
> > The first doesn´t help that much with verbose mode, haven't checked if
> > before this series it was failing :-\
> > 
> > root@x1:~# perf test -vvv 105
> > 105: perf trace enum augmentation tests:
> > --- start ---
> > test child forked, pid 19411
> > Checking if vmlinux exists
> > Tracing syscall landlock_add_rule
> > ---- end(-1) ----
> > 105: perf trace enum augmentation tests                              : FAILED!
> > root@x1:~#
> 
> So:
> 
> root@x1:~# perf trace -e landlock_add_rule perf test -w landlock
> root@x1:~# 
> 
> But:
> 
> root@x1:~# perf trace perf test -w landlock |& grep landlock_add_rule
>     26.120 ( 0.002 ms): perf/19791 landlock_add_rule(ruleset_fd: 11, rule_type: LANDLOCK_RULE_PATH_BENEATH, rule_attr: 0x7ffde75e2680, flags: 45) = -1 EINVAL (Invalid argument)
>     26.124 ( 0.001 ms): perf/19791 landlock_add_rule(ruleset_fd: 11, rule_type: LANDLOCK_RULE_NET_PORT, rule_attr: 0x7ffde75e2690, flags: 45) = -1 EINVAL (Invalid argument)
> root@x1:~# 
> 
> -e is having some trouble, when no event is specified, then it works.
> 
> Something in the changes made to:
> 
> static int trace__parse_events_option(const struct option *opt, const char *str,
>                                       int unset __maybe_unused)

Thanks for the test, I think this should fix it:

Thanks,
Namhyung


---8<---
diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index ace66e69c1bcde1e..67a8ec10e9e4bc8d 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -76,7 +76,7 @@ int syscalltbl__id(int e_machine, const char *name)
 {
        const struct syscalltbl *table = find_table(e_machine);
        struct syscall_cmp_key key;
-       const int *id;
+       const uint16_t *id;
 
        if (!table)
                return -1;


