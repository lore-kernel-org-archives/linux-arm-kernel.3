Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192D1D77882
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IM87ouESUbD5jKURdNdSHTX7u7SAQZ/2S6gh331oGFU=; b=ZG6QYgP6lSmgSF7xWB+/swXUI2
	pLSrKLUlS+fwT+PXWchEI/C/Ip9Kgtp5Hbvzyf6hohfX5KOm1o4cZ8uh0rdapHZ8/4cROXrB/X5Bu
	9GxjacGMyoQm+vs0lbt/kKgxk/vSnscksAOPI9H6KNWS2RmW7kxWWba4j1aM89DpqJqfja3uTMUYk
	1WbSaV3f7ywHNESo8e+GF5KwYSs3xcs3zb4r0IhxFwCOBbQiyYUoHu8fTUA2hjJE7onwx4GM976aU
	yV7oHBUSrfOryQsIxBv6O7czWjfnz2kA1Xv/EuQ+LdAhHu2fCoRbUOW2MGOMLlslj0zdY3JrLV7vf
	wjTEFhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKK7-00000009Di1-3752;
	Fri, 23 Jan 2026 16:47:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKK5-00000009DhL-3pFI;
	Fri, 23 Jan 2026 16:47:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A625C4049C;
	Fri, 23 Jan 2026 16:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046ACC4CEF1;
	Fri, 23 Jan 2026 16:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769186868;
	bh=zveMAUf998ovbct5UpW7FmMJgR9EwAhf7mycVOrHXT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpCvrKvle/wO3axQQk4cdWRkKypLm8st7IFY/YlpE8SKHScW1sSzzZR1zFMaANOQB
	 8K5ipExhGsMSuT+EMrydSDXe1a29fmQARcfM0SQrrYjxA6RvUuMtkYd/PwRasYADkO
	 FMVN1K53McrG3o1OnEFJOHZ8QK/2SDGXQTbGjlKjSa135KAqDoaHfmR402ZVpveUzv
	 9TtRI4qoddL8mVW7AUxFgF9Vui8WHHIWT5UoV+k1WXKsirGrhA6QkZqjEuzshYDYrF
	 X217jX9p4TVGQKEo/LKvtifEB/TSW+Ci6G5SGUh1TFuT3+Hrj94eMVSrxSjuRIYImK
	 Z26OO/WncgeBg==
Date: Fri, 23 Jan 2026 13:47:45 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
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
Subject: Re: [PATCH v3 00/12] perf annotate arch clean up
Message-ID: <aXOmMc8W85u-AGxH@x1>
References: <20260122213516.671089-1-irogers@google.com>
 <1310a240-077a-49f6-b83a-a8a4fd52127b@linaro.org>
 <CAP-5=fWrJoej0XprvPmYg5qa7SRU2s3yeCF-hWgj+3MTdTZLzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fWrJoej0XprvPmYg5qa7SRU2s3yeCF-hWgj+3MTdTZLzQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_084749_989940_BAF676D6 
X-CRM114-Status: GOOD (  14.77  )
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

On Fri, Jan 23, 2026 at 08:30:22AM -0800, Ian Rogers wrote:
> On Fri, Jan 23, 2026 at 3:02 AM James Clark <james.clark@linaro.org> wrote:
> > On 22/01/2026 9:35 pm, Ian Rogers wrote:
> >
> > Reviewed-by: James Clark <james.clark@linaro.org>
> 
> Thanks James!
> 
> Arnaldo, it'd be nice for this to land so I can look into addressing
> the missing e_flags issue - namely, we should optionally read the
> e_flags along with the e_machine so that we have a proper e_flags
> value to make csky work properly (not an issue on anything else). At
> the same time I think some of the e_machine should be made more robust
> like with:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/commit/tools/perf?h=perf-tools-next&id=e99d544c7f3691eb321c88fdbadf04b777c114c4
> but here:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/util/thread.c?h=perf-tools-next#n452
> the code should probably be shared.
> Anyway, this series does enough without adding all that to it and
> waiting for more tags.

I just merged it and it is going on testing, I'll also check that fix
for the inject callchain on hybrid since I noticed it failing here as
well.

Thanks,

- Arnalod

