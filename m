Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1861E937FD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 19:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZhi9jmDFS3Wd+zCoNOXYsJPIyaXBmpcVnreCELz5Pw=; b=V/PdJTDjiwNHA5NE11yxrkAnMr
	jEMcHpj0hPzgIMCDsy9aS5DVASJ4bISjqcot7MwOwnSWwfdvtKnsdJuxNInsFX4xNdQuz/n8Pw9M8
	w5NvYOzcn2HixNwgqj7D7BsP64xHKevxyhhIlr6YsY9t+JkQ6lYegGaEssLca2JRwn79mRmrCKLUq
	crolhlmvnwT7N+v5a/f2/keLQ5SLPimdcvmB/9UHh8PpjZyaB0pW1J4dVebQAYywjgvVKsl+Jqg3W
	bkxNfCwPI26IbNjndKZhMkJ5KQLVljmP3dfCnFGQSLxDcFtiGMA8N3lV5beRv3wuiiBj2w9TbN3Da
	BCH4bbyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC0Jx-0000000Ecsv-2EUK;
	Sun, 12 Apr 2026 19:18:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC0Ju-0000000EcsW-2YNe;
	Sun, 12 Apr 2026 19:18:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 680E643943;
	Sun, 12 Apr 2026 19:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99BB4C19424;
	Sun, 12 Apr 2026 19:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776021486;
	bh=yellk67V+k6/B4H2k9kR6wZJu3FcR3ehf63oE9bnhSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZnKt7RbgwivElS/f3AFQ56bX4R/NE0FSJSAiy1su0vgf84BAYRn7YeERL6/R3dkw
	 Nx0Ruk0NQGL60D0vPPcY/yehUmNJNccUQaW0qSHxUEtg60/8C7MgsrmZQVbJi7buEp
	 G6ElYaE4dX5IUKeIe/lKM1FmBiwZtep346fnVvUgIZLR42A46qK83qbqTimjn8gxvh
	 aYhr5/6NgmgXFkNSZaIUf2xvDL08xA+YcnB1FGXWv+rcZo2Vn3BUfhGvrHQ5EFNPXj
	 9JYA2gEocew3xeVdvbdEpqsJMlctpAWIcKGZnLtQyIdm+Mx2mPmo8GTm1atR46s0RB
	 42af47d8qo1VQ==
Date: Sun, 12 Apr 2026 16:18:02 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: 9erthalion6@gmail.com, adrian.hunter@intel.com, alex@ghiti.fr,
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu, atrajeev@linux.ibm.com,
	blakejones@google.com, ctshao@google.com,
	dapeng1.mi@linux.intel.com, howardchu95@gmail.com,
	james.clark@linaro.org, john.g.garry@oracle.com, jolsa@kernel.org,
	leo.yan@linux.dev, libunwind-devel@nongnu.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com,
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com,
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org,
	yuzhuo@google.com
Subject: Re: [PATCH v3 0/8] perf libunwind multiple remote support
Message-ID: <advv6twWCEVBo_Hc@x1>
References: <20260305221927.3237145-1-irogers@google.com>
 <20260404054032.1538095-1-irogers@google.com>
 <CAP-5=fUz60Guq_gVV6wb_FfwhPs-fUN+PAbB3rQn3pycXbF3DA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fUz60Guq_gVV6wb_FfwhPs-fUN+PAbB3rQn3pycXbF3DA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_121810_699336_E0CBD184 
X-CRM114-Status: GOOD (  21.29  )
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

On Fri, Apr 10, 2026 at 06:04:57PM -0700, Ian Rogers wrote:
> On Fri, Apr 3, 2026 at 10:40 PM Ian Rogers <irogers@google.com> wrote:
> >
> > Fix the libunwind build for when libdw and libunwind are feature
> > detected, currently failing with a duplicate symbol.
> >
> > Refactor the libunwind support so that whenever a remote target is
> > available, perf functions using the ELF machine can use that remote
> > target regardless of what the host/local machine is. Migrate existing
> > libunwind supported architectures like powerpc, arm64 and loongarch so
> > that they can work in a cross-architecture way. Add support for
> > RISC-V. Make the code more regular in function names, etc. and avoid
> > including a C-file. This increases the lines of code. It is similar in
> > style to the unwind-libdw implementation. It is hoped that the more
> > uniform nature of the code with help with refactoring the perf
> > registers for SIMD/APX support.
> >
> > Aside from local host testing these patches are under tested, in part
> > as I'm failing to see how to build libunwind with support for multiple
> > remote targets. Please could I get help in testing.
> >
> > v3: Minor whitespace clean up and warn when a dynamic choice of libdw
> >     or libunwind is selected for unwinding and support is missing (Arnaldo).
> 
> Hi Arnaldo,
> 
> anything else outstanding from this series?

It is not applying, I did an attempt to refresh it but stomped at 7/8

⬢ [acme@toolbx perf-tools-next]$ patch -p1 < ./v3_20260403_irogers_perf_libunwind_multiple_remote_support.mbx
patching file tools/perf/util/Build
patching file tools/perf/util/libunwind-arch/libunwind-arch.c
patching file tools/perf/util/libunwind-arch/libunwind-arch.h
patching file tools/perf/util/libunwind-arch/libunwind-arm.c
patching file tools/perf/util/libunwind-arch/libunwind-arm64.c
patching file tools/perf/util/libunwind-arch/libunwind-i386.c
patching file tools/perf/util/libunwind-arch/libunwind-loongarch.c
patching file tools/perf/util/libunwind-arch/libunwind-mips.c
patching file tools/perf/util/libunwind-arch/libunwind-ppc32.c
patching file tools/perf/util/libunwind-arch/libunwind-ppc64.c
patching file tools/perf/util/libunwind-arch/libunwind-s390.c
patching file tools/perf/util/libunwind-arch/libunwind-x86_64.c
patching file tools/perf/util/libunwind/arm64.c
patching file tools/perf/util/libunwind/x86_32.c
patching file tools/perf/util/maps.c
patching file tools/perf/util/maps.h
patching file tools/perf/util/unwind-libunwind-local.c
Reversed (or previously applied) patch detected!  Assume -R? [n] ^C
⬢ [acme@toolbx perf-tools-next]$

Can you please take a look and maybe resubmit it so that Sashiko can
have a look at it?

Two other patches had to be refreshed before 7/8.

- Arnaldo

