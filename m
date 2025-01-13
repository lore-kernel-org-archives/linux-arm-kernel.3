Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A23C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vPElJjdBIyvXysgwmuTEuhrSS5NfGy31HKmL/cX76vU=; b=1gp+sSJoSbEO2/jXCXKjlvDB1M
	W5InnmNhHhF5Xhaw3kVWOGl5cPoy6jMIHH8dRiak1CDd9LZ8YWHrSwLNHWAs0quenR5hOpHaI7WhS
	dc64XZ5CZ+uFvRsGmlpfXI8c9wuDqQ2iJ1I3p/npQCaP3wnsx/sxY+CoZdXQCr4RMcepoApPAVDy4
	krMs9m1pDPMPZuzuUXsk69ln9T/hwDrbaXiSW0MgSVNJ7CkzWo8E58Dhjy6In+1GIfVzwbGsZAOjP
	6Qx0HyZFOwZM5/kE5WMObwh6Gs242n+fXmHlwfFDSH175hA+NR4CiYdjLY9AdF61sgnDrQatb1+1T
	qwjj8V8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMVf-00000005frw-2OeZ;
	Mon, 13 Jan 2025 15:37:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLqM-00000005VCU-00mj;
	Mon, 13 Jan 2025 14:55:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A83405C5439;
	Mon, 13 Jan 2025 14:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB7AC4CEE2;
	Mon, 13 Jan 2025 14:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780105;
	bh=rMXm59SPTsrymD3C2yxFqEbLQ1YAvMyEOn3UiB05slc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ljKxA0aFAxh2ONCcjbhbD784GF9s1PYXJEEhRvReBgZEd6mDOgNWpdwwkyWfeJtFD
	 ms5xEGQtINBAIYgUytnrPynqhAUDRqfv74ujLH6UCshPh2cTPoJ8hPIZXvR3svIiA7
	 o7F2SGfoA9kSXA0z25eLW/4YvTTMEneP+GangqZLdQgRreaEQhitpVt0fc/v6k9WRZ
	 cHiPMwk4/ZkoSkgvizHC3Z1Z7DkSrh/HkjwDNIqWHODpNSrreAduK5Y/WeqkUAORaC
	 kmspZTxOCvVnKX0NexSwAos/8QKdXhniXRbJetXIy518kJYNu8Z9wNyrPdc2P/rmCr
	 sNZbLt631SwvQ==
Date: Mon, 13 Jan 2025 11:55:02 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 00/16] perf tools: Use generic syscall scripts for all
 archs
Message-ID: <Z4UpRqywqYPZSUM_@x1>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1>
 <Z4AoFA974kauIJ9T@ghost>
 <Z4A2Y269Ffo0ERkS@x1>
 <Z4BEygdXmofWBr0-@x1>
 <Z4BVK3D7sN-XYg2o@ghost>
 <Z4F1dXQLPGZ3JFI5@ghost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4F1dXQLPGZ3JFI5@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_065506_122436_807E560E 
X-CRM114-Status: GOOD (  18.63  )
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

On Fri, Jan 10, 2025 at 11:31:01AM -0800, Charlie Jenkins wrote:
> On Thu, Jan 09, 2025 at 03:00:59PM -0800, Charlie Jenkins wrote:
> > Ooh okay I see, the quiet commands were being ignored as-is. We could
> > add the lines to handle this to Makefile.syscalls, but I think the
> > better solution is to move the lines from Makefile.build to
> > Makefile.perf to be more generically available. Here is a patch for
> > that. I also added the comment from the kernel Makefile describing what
> > this does.

> > From 8dcec7f5d937ede3d33c687573dc2f1654ddc59e Mon Sep 17 00:00:00 2001
> > From: Charlie Jenkins <charlie@rivosinc.com>
> > Date: Thu, 9 Jan 2025 14:36:40 -0800
> > Subject: [PATCH] perf tools: Expose quiet/verbose variables in Makefile.perf
> > 
> > The variables to make builds silent/verbose live inside
> > tools/build/Makefile.build. Move those variables to the top-level
> > Makefile.perf to be generally available.

<SNIP applied patch>
 
> Let me know how you want to handle this, I can send this out as a
> separate patch if that's better.

I used the patch you provided above after hand editing the message
before feeding it to 'git am', added these comments:

    Committer testing:
    
    See the SYSCALL lines, now they are consistent with the other
    operations in other lines:
    
      SYSTBL  /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_32.h
      SYSTBL  /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_64.h
      GEN     /tmp/build/perf-tools-next/common-cmds.h
      GEN     /tmp/build/perf-tools-next/arch/arm64/include/generated/asm/sysreg-defs.h
      PERF_VERSION = 6.13.rc2.g3d94bb6ed1d0
      GEN     perf-archive
      MKDIR   /tmp/build/perf-tools-next/jvmti/
      MKDIR   /tmp/build/perf-tools-next/jvmti/
      MKDIR   /tmp/build/perf-tools-next/jvmti/
      MKDIR   /tmp/build/perf-tools-next/jvmti/
      GEN     perf-iostat
      CC      /tmp/build/perf-tools-next/jvmti/libjvmti.o
      CC      /tmp/build/perf-tools-next/jvmti/jvmti_agent.o
    
    Reported-by: Arnaldo Carvalho de Melo <acme@redhat.com>
    Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
    Tested-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Thanks,

- Arnaldo

