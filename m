Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9507FD37E56
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBr2BK5D27V/PcPYSFJv9kPkNc1DPU603R6WzfJnacE=; b=UjHoqk+V3W5nTmTFFtoGGXHZB4
	9GpiZm6/PdTOvZLTfZ1uyTnNilS8GmM33gUsDoSgrg6vp42mMWic+bIEoVXnDQOssWQoMF6s2i4cz
	49zMVjfr8Qz65ruvyAU8zaz8QQ1C1htfrwWJIzMDj+IQNkn1TmY6A1No1ATDFh5/R0ePhPPYrV03u
	oikAApzWzCvUZbzXOacWivZJJN03471XQcaWKYDv0pRDMugOlNSGgAbo+WxHCusZHbehOREHwdarl
	1AiKSgES6uunzEejZgTWQhWGrZBX3sJpJnjHceRL5J9dlYo2tV0edjvm/gZ0vE1ULp1UHVDFFMBOX
	z+FIZz1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg35l-00000009lfj-2D9t;
	Wed, 14 Jan 2026 15:47:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg35i-00000009lfM-3Gd3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:47:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1776A60122;
	Wed, 14 Jan 2026 15:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDF5C16AAE;
	Wed, 14 Jan 2026 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768405645;
	bh=StlWp9SlvJnlDU6iyBFhbKlgusG5Kwh8+x4EmYEVyRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fGGxtXsibtNTAMVb3D+xeu/7EtrYgBrlypiOS/VJ8u/q9bUzEBiorJ2izIQh/NS/z
	 3QsCsW+/hCmaksTrpfGA0DQ/EangxU+hCyC3Ez5bT55/GSaQF8oUfBJekvcCDJVRBR
	 2CY/3uBfPKU4Bv3WL1OLcqm4vlZ71ZwALutBrMsDw/TfbM2Saums5pM1/f5Abo0110
	 m8myOEkA7JcMOtpzJs2CmMOjBQtnQ0ymoOumuIUbRGfYtIbnH2IviP3ODGkGYDoqKu
	 9pVShB6PljaXL9ZHFHn9JkWrHkkiBe67hSGXH68yJ+47BN3RWHw1RoEjOWYCQBKKUj
	 imZCCx+wj1Dlg==
Date: Wed, 14 Jan 2026 12:47:22 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 02/14] perf evsel: Refactor
 evsel__set_config_if_unset() arguments
Message-ID: <aWe6igmKMq25GJP9@x1>
References: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
 <20251222-james-perf-config-bits-v4-2-0608438186fc@linaro.org>
 <aWbDg0kmo-isxkz2@x1>
 <4eda1bd6-ec36-4d0b-85de-ef0bd190e5e7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4eda1bd6-ec36-4d0b-85de-ef0bd190e5e7@linaro.org>
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

On Wed, Jan 14, 2026 at 12:14:43PM +0000, James Clark wrote:
> On 13/01/2026 10:13 pm, Arnaldo Carvalho de Melo wrote:
> > On Mon, Dec 22, 2025 at 03:14:27PM +0000, James Clark wrote:
> > > Make the evsel argument first to match the other evsel__* functions
> > > and remove the redundant pmu argument, which can be accessed via evsel.

> > I haven't checked if this is the exactly where this takes place but
> > should be in this series, 32-bit build is broken:

> >     3: almalinux:9-i386WARNING: image platform (linux/386) does not match the expected platform (linux/amd64)
> > WARNING: image platform (linux/386) does not match the expected platform (linux/amd64)
> >      21.72 almalinux:9-i386              : FAIL gcc version 11.4.1 20231218 (Red Hat 11.4.1-3) (GCC)
> >       1378 |         perf_pmu__format_pack(&bits, val, vp, /*zero=*/true);
> >            |                               ^~~~~
> >            |                               |
> >            |                               u64 * {aka long long unsigned int *}
> >      In file included from util/evsel.h:14,
> >                       from util/evsel.c:38:
> >      util/pmu.h:282:43: note: expected ‘long unsigned int *’ but argument is of type ‘u64 *’ {aka ‘long long unsigned int *’}
> >        282 | void perf_pmu__format_pack(unsigned long *format, __u64 value, __u64 *v,
> >            |                            ~~~~~~~~~~~~~~~^~~~~~
 
> > What I have is in perf-tools-next/tmp.perf-tools-next BTW, I'll try and
> > fix this tomorrow if you don't do it first. :-)
 
> Taking a look, but I'm wondering if this is already not working properly.
> There are existing "unsigned long"s in pmu.c that operate on the config bits
> which is what I copied.
 
> On this target an unsigned long is 32bits but struct
> perf_event_attr->configs are __u64. So it looks like it might leave the top
> bits unset sometimes.
 
> I'll look at a fix for that which should fix the compilation error at the
> same time.
 
> Another question is, do we actually care about this platform?

It failed for other 32-bit platforms too, so the question is if we care
about 32-bit at all.

- Arnaldo

