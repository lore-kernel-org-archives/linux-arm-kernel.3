Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F871061B18
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 18:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Id/JX8ZzT6/RTBB8BMhECGA5xtXraEplaGEd8yW6CM=; b=Hk6Iv8+34qiLmcrzdQKUmcU2qD
	H4cIy3pqlZMu91BEB8Hyx19XvB8pBS+OFHRNUFFTSlOpdeHOlE1PetHKnzp+oITcMkfhGoZ9YCqmX
	2np5gbd04eo5RdJiGm/h+RG17XZ/rXdRu651B1bcSryhoPXw7StZiq/WX0z9bJFHFAnLYVUJ0RrRk
	a4ix6/jFLUOjrKJVZ1DzBhWsf6SeKNHNEz2VhfbEX0UhiX7T1dtgBbq3pV2ddvLFJOyJzoBA3MugF
	J6l7OtaIBX8KQGv6ulvP3rhabJbCxa/IstBxr+uDSdeyzqblCgpmUkgRqb8qwFrFl/L06DiUTnL62
	JHKdhYfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Hfn-0000000BkLu-453J;
	Mon, 30 Mar 2026 18:49:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Hfm-0000000BkLa-0bfl;
	Mon, 30 Mar 2026 18:49:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED25760120;
	Mon, 30 Mar 2026 18:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C60C4CEF7;
	Mon, 30 Mar 2026 18:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774896552;
	bh=8Nm/1L5pkcNmWQAXmMT+fbxFBk8UnQjXHBqgXHaaHgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tyWJNud7VTB0Kze7DFHOX6R1mGabF5cICm9Wqxrz7xdeh6RWsSepDjX70jfbiprIW
	 FirODeC5ftC0ly5hvgFC5ddpc1Ikv+m+gHd0g/u376HR7zVDiSZ3e3E/ob61YCSTfE
	 B4Y04uuiAS9kdYUKHydxzvjuJ4hMaVAG8M9YHOI0IhxY3vR0Z03vkAPD//3+NtX+9Y
	 irudrODOVYvyy1PZmVFR9dJPzr8/gLmhdYkmhV2wyKKNJbK/bn//f0W9waEK5sMbRl
	 AFDnXYTItUorwOwaHG9MFib1ROV3arzXFmYUlraOcscwlNdLOMpvJJrw5Dpa51dHiD
	 hTyw3hJ1zid/g==
Date: Mon, 30 Mar 2026 15:49:09 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Namhyung Kim <namhyung@kernel.org>, 9erthalion6@gmail.com,
	adrian.hunter@intel.com, alex@ghiti.fr,
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu, atrajeev@linux.ibm.com,
	blakejones@google.com, ctshao@google.com,
	dapeng1.mi@linux.intel.com, howardchu95@gmail.com,
	james.clark@linaro.org, john.g.garry@oracle.com, jolsa@kernel.org,
	leo.yan@linux.dev, libunwind-devel@nongnu.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org,
	pjw@kernel.org, shimin.guo@skydio.com, tglozar@redhat.com,
	tmricht@linux.ibm.com, will@kernel.org, amadio@gentoo.org,
	yuzhuo@google.com
Subject: Re: [PATCH v1 0/2] perf build: Remove libunwind support
Message-ID: <acrFpcLxvHNOcQ8N@x1>
References: <abxs-2rozL1tBEO1@google.com>
 <20260321234220.848859-1-irogers@google.com>
 <acW4Z2KJbyPZM1SG@google.com>
 <acbjjwc-WCk1CwtF@x1>
 <CAP-5=fXmBpqP86FT85sA_BZYRnzwbZ5joYLogCqON6fjXCkRHQ@mail.gmail.com>
 <acbxyzN4XKczgpLg@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acbxyzN4XKczgpLg@x1>
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

On Fri, Mar 27, 2026 at 06:08:27PM -0300, Arnaldo Carvalho de Melo wrote:
> On Fri, Mar 27, 2026 at 01:37:20PM -0700, Ian Rogers wrote:
> > On Fri, Mar 27, 2026 at 1:07 PM Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> > > This is an area that is tricky and since we _already_ have two
> > > implementations, the good thing for regression testing would be the
> > > compare their results until libunwind becomes completely rotten and
> > > unusable?
> > 
> > My series:
> > https://lore.kernel.org/lkml/20260305221927.3237145-1-irogers@google.com/
> > makes libdw and libunwind supported together:
> > https://lore.kernel.org/lkml/20260305221927.3237145-2-irogers@google.com/
> > """
> > This commit refactors the DWARF unwind post-processing to be
> > configurable at runtime via the .perfconfig file option
> > 'unwind.style', or using the argument '--unwind-style' in the commands
> > 'perf report', 'perf script' and 'perf inject', in a similar manner to
> > the addr2line or the disassembler style.
> > """
> > That series cleans up several other issues, which is why I think it is
> > worth landing while we wait for libdw to become stable.
> 
> Cool, I'll try and review/test it this weekend.
> 
> Thanks for pointint it out!

Pointing, looking at it now, one comment so far, remove that new blank
line, testing...

⬢ [acme@toolbx perf-tools-next]$        git am ./v2_20260305_irogers_perf_libunwind_multiple_remote_support.mbx
Applying: perf unwind: Refactor get_entries to allow dynamic libdw/libunwind selection
.git/rebase-apply/patch:128: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: perf build loongarch: Remove reference to missing file
Applying: tools build: Deduplicate test-libunwind for different architectures
Applying: perf build: Be more programmatic when setting up libunwind variables
Applying: perf unwind-libunwind: Make libunwind register reading cross platform
Applying: perf unwind-libunwind: Move flush/finish access out of local
Applying: perf unwind-libunwind: Remove libunwind-local
Applying: perf unwind-libunwind: Add RISC-V libunwind support
⬢ [acme@toolbx perf-tools-next]$

