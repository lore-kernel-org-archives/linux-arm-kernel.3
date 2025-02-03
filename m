Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F12C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 22:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjOj+on6yu4dwVa8oTf97GqaTS3wmXioISpSFVx+uKs=; b=XbZ5/DYrj94oVMIMNhUzzim3CL
	4vnU35H9gOABGS+hIx7wf9DL3FYEEUN7LN2jyctazBWiTGJr6ck58V4V2WQqOiAizIY/SRZeq5/Bh
	kd0x9frL1AKRrU3SWSy+uZ3pxkyCkBYaPQSg06PAvHwg4bqJh8gCevbLxhtHBjC0EpLKVHuzDLAHO
	dNuFKwlf3xek4HNzaaaqQkfP/jOA8+hcrwEBhEKoZ5F6rvtnjTOdi7ggBH0Jfw638kYGeZRw6EXmb
	PtDzDtVrEIAfO35v9ljzPAPcGJrqFqUmLKRojiILVM2GmrmuiOS2k6u/bSmVOQSGRMHRaO6PHyFOX
	Nggo1GWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4oU-0000000Gm6m-0hZi;
	Mon, 03 Feb 2025 22:21:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4n9-0000000Glvb-1fRU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 22:19:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB0265C6928;
	Mon,  3 Feb 2025 22:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9842C4CED2;
	Mon,  3 Feb 2025 22:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738621182;
	bh=giaijWcNkRzjj6qgspJb+qrKbWsq04W28Ju8Hev8uDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bs6Fq4IyNDGPhgzRuTbnBSX44+k0YEZu6VeXRMVJPaxrMs81Zfb/B8yQ8A7Kuj5g1
	 k/iqXfLwM5fxD8kf2jKTHVJfyu5nBvzNfDv6+PfGHBrnIIm6Bc/Fk2d9+DdjO717Zw
	 Fx60J8qBSb8TN5rYrA/WqTodX/fL6vGzW+hZkCcXZs0hHv3eIxQGbQawtClrjbw63Q
	 +Hfi4pPbn1vBOcQdhriTTL1/FNFWVjnzv0ngE+8hz677fY9h3TlfvN/49pcBhQHGne
	 DkyKFuAf6hDJv0kNJUOCfDRW/5YbyBex2wkEsEc4W+OqBaxLEoKWh0VHLN2MZ+QgN9
	 26TEOEdY43DvQ==
Date: Mon, 3 Feb 2025 14:19:40 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Daniel Xu <dxu@dxuuu.xyz>
Subject: Re: [PATCH FOR-NEXT] perf tools: Expose quiet/verbose variables in
 Makefile.perf
Message-ID: <Z6FA_IEt3QN3aX3l@google.com>
References: <20250114-perf_make_test-v1-1-decc1c517b11@rivosinc.com>
 <Z6CMg7uNReyGTq4y@krava>
 <Z6ERcG6ZAqL1cFAo@ghost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z6ERcG6ZAqL1cFAo@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_141943_521087_3C7432F1 
X-CRM114-Status: GOOD (  29.61  )
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

Hello,

On Mon, Feb 03, 2025 at 10:56:48AM -0800, Charlie Jenkins wrote:
> On Mon, Feb 03, 2025 at 10:29:39AM +0100, Jiri Olsa wrote:
> > On Tue, Jan 14, 2025 at 11:35:44AM -0800, Charlie Jenkins wrote:
> > > The variables to make builds silent/verbose live inside
> > > tools/build/Makefile.build. Move those variables to the top-level
> > > Makefile.perf to be generally available.
> > > 
> > > Committer testing:
> > > 
> > > See the SYSCALL lines, now they are consistent with the other
> > > operations in other lines:
> > >   SYSTBL  /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_32.h
> > >   SYSTBL  /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_64.h
> > >   GEN     /tmp/build/perf-tools-next/common-cmds.h
> > >   GEN     /tmp/build/perf-tools-next/arch/arm64/include/generated/asm/sysreg-defs.h
> > >   PERF_VERSION = 6.13.rc2.g3d94bb6ed1d0
> > >   GEN     perf-archive
> > >   MKDIR   /tmp/build/perf-tools-next/jvmti/
> > >   MKDIR   /tmp/build/perf-tools-next/jvmti/
> > >   MKDIR   /tmp/build/perf-tools-next/jvmti/
> > >   MKDIR   /tmp/build/perf-tools-next/jvmti/
> > >   GEN     perf-iostat
> > >   CC      /tmp/build/perf-tools-next/jvmti/libjvmti.o
> > > 
> > > Reported-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > Tested-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> > > ---
> > >  tools/build/Makefile.build                | 20 -----------------
> > >  tools/perf/Makefile.perf                  | 37 ++++++++++++++++++++++++++++++-
> > >  tools/perf/tests/shell/coresight/Makefile |  2 +-
> > >  3 files changed, 37 insertions(+), 22 deletions(-)
> > > 
> > > diff --git a/tools/build/Makefile.build b/tools/build/Makefile.build
> > > index 5fb3fb3d97e0fd114e245805809e4fc926b4343e..e710ed67a1b49d9fda11db02821bbd8d36066b44 100644
> > > --- a/tools/build/Makefile.build
> > > +++ b/tools/build/Makefile.build
> > > @@ -12,26 +12,6 @@
> > >  PHONY := __build
> > >  __build:
> > >  
> > > -ifeq ($(V),1)
> > > -  quiet =
> > > -  Q =
> > > -else
> > > -  quiet=quiet_
> > > -  Q=@
> > > -endif
> > > -
> > > -# If the user is running make -s (silent mode), suppress echoing of commands
> > > -# make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.
> > > -ifeq ($(filter 3.%,$(MAKE_VERSION)),)
> > > -short-opts := $(firstword -$(MAKEFLAGS))
> > > -else
> > > -short-opts := $(filter-out --%,$(MAKEFLAGS))
> > > -endif
> > > -
> > > -ifneq ($(findstring s,$(short-opts)),)
> > > -  quiet=silent_
> > > -endif
> > > -
> > >  build-dir := $(srctree)/tools/build
> > 
> > hi,
> > if we move this out of here, we need to fix other tools that rely on that,
> > bpftool and resolve_btfids do not build quietly now

Sorry about the trouble.  I should've checked other builds.

> > 
> > but not sure what was the reason of moving it out, the code in Makefile.perf
> > seems same as the one above
> 
> perf/Makefile.syscalls wanted to support quiet building. Makefile.perf
> imports both Makefile.syscalls and Makefile.build, so I moved this quiet
> infrastructure into Makefile.perf so that both of these files could use
> it.
> 
> I was trying to move the quiet infrastructure higher up in the callchain
> so that the code did not need to be duplicated. Perhaps it is better to
> move this into a separate file that exports "quiet" and "Q" and then can
> be imported from bpf/Makefile, perf/Makefile.perf, and any other tool
> that wants to have quiet builds?

Makes sense.  Can you please send a patch for that?

Thanks,
Namhyung


