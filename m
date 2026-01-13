Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A31D30CC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 20:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrFt18m7nvYeyUf2ExXpQpZ+HU8FRrMq2LVEHRjXWzo=; b=ppKvPjpFPgz2Uo9xukEn/cfBzP
	qUdOOnuFQmKsqxfm24Hk5E226CRxxm0VjGLEw6V+KMwakqIxZxRt1Lmu1i6dzzSRF4fUdW7iWb45q
	NSFzff9Z5SFiswEwk1j434Qx6qVP27seq/bZJAtJujlBtAShjVu8oHjA0wqee37uJDOpvxYWdmrVs
	W0OLkJiwEu8jWc7rS9dsnblT01klKqgAUbIq8/7tc5Y8NW50Y58AqpTw+hYymMIrVV0bmOFe8MqFZ
	3/NgXppLnYkAAd4jbzlOsDlCY2HM2wDONcyiG80L0AMOnf6p042pFEYXVwhohMwjdIkhlTLDUDWBU
	cJL+8HFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfl4G-00000007h52-2eSt;
	Tue, 13 Jan 2026 20:32:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfl4D-00000007h4g-2dPV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 20:32:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 55EEE4389E;
	Tue, 13 Jan 2026 20:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D85C116C6;
	Tue, 13 Jan 2026 20:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768336360;
	bh=H6PhnM2kCppM8aCBeFuEKsIPQgQaguqi5t6ulW9YN7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HCsXeInDtJ3LS6lqB9JbP2I+iXKQxPaFsV2mB+xnT2JM4kPJQQa1uw6n0GjSGKfBJ
	 8p459RTS77vabkXDF5tDCpmP7BV5usl+yl0q8HwNFkR+BsJqTj1ADn/8ZYGeZlyXj4
	 yzLyyRuDXyWZx8hcMaeS5mEEw/IvvkEfyYxXpX3dOvV3kJdFVFmCZt5pF+DyTxeDR9
	 /9h+EDm/6LOQm9ocnfsMWFaJe8cnOlhDY9YDOYZIrL+/Y10TtmkSsinlG8HSfId2ae
	 9CRQ/S3o6KaAwaxuxZO+Gj7zMUDDi555mdcIBixcMavTsUM8J1xJ1wqoyY9EZILgdm
	 s22cZ+XaKvHkA==
Date: Tue, 13 Jan 2026 17:32:37 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Akio Kakuno <fj3333bs@aa.jp.fujitsu.com>,
	Yoshihiro Furudera <fj5100bi@fujitsu.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] perf vendor events arm64: Remove uncountable events
Message-ID: <aWar5eUPISsiLA00@x1>
References: <20251231-james-perf-uncountable-events-v1-1-f2d9932999fd@linaro.org>
 <CAP-5=fUNJLoy25rS=diSXNR9h-h4m6EFPTy8M+KpTKxm6HtDSA@mail.gmail.com>
 <951f10c5-e1ac-45d4-b7ca-56aa32e57cd6@linaro.org>
 <CAP-5=fWQU59Vyb6y+W6ObOTh3nzFSofsn8sc6JzwZp7FiV+n6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fWQU59Vyb6y+W6ObOTh3nzFSofsn8sc6JzwZp7FiV+n6w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_123241_708742_1B2B0765 
X-CRM114-Status: GOOD (  15.77  )
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

On Sat, Jan 03, 2026 at 05:27:49PM -0800, Ian Rogers wrote:
> On Sat, Jan 3, 2026 at 8:38 AM James Clark <james.clark@linaro.org> wrote:
> > On 02/01/2026 3:29 pm, Ian Rogers wrote:
> > > On Wed, Dec 31, 2025 at 4:13 AM James Clark <james.clark@linaro.org> wrote:
> > >> These events are never countable by the PMU and are only intended to
> > >> be used as external inputs to trace. Therefore showing them in 'perf
> > >> list' is misleading so remove them.

> > > What does "trace" mean in this context?

> > CPU trace, Either ETE (Embedded Trace Extension) or ETM (Embedded Trace
> > Macrocell). You can select PMU events as inputs to the trace block to
> > make it do things like start and stop tracing.

> Ah ok, trace immediately makes me think of `perf trace` currently.
> Presumably there's no perf integration for ETE and ETM that somehow
> use these event encodings? Looks not and the changes make sense to me.
> 
> Reviewed-by: Ian Rogers <irogers@google.com>

Thanks, applied to perf-tools-next,

- Arnaldo

