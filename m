Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8975C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 04:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eo/rbNrUh+dY1RhXItutV4jy+BHk08ApaaY0cRkTOUY=; b=qfE7eyEU2bPPj7J/DDAvrZgbp+
	9YZQbW/w4VGieTrrjMcp7tzjotgYhkKUmI6ng/je20O0bMwrvDw6LGU6t8MrJiIAJCd5yFniVVfSD
	p5hqFFuSGD1H6wIKpbzEu1ijKWoqSb+sEvq3FbB47H4QoD1c4K+gNbP1ixE115TbJtTDbZUD0Rxlf
	nj9aKaB5b19bp4RGnHHPgms9dlS4Xw8Wff8sK9B+uhC7fB3XRW6PztjHsiDae/FQBvt6pTQKdz9Ef
	FtyfeQxDxKAy7leYwElu+Eprmn5Wo2bLWRAZjiPK5Rm+HV15BQNh6yryEzLUAbW9Tgx3gGcZobcOM
	Wv2piuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiQVb-00000009fgb-2li8;
	Thu, 13 Feb 2025 04:07:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiQUA-00000009fPK-07Gi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 04:05:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D6E96A41DFF;
	Thu, 13 Feb 2025 04:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6EEC4CED1;
	Thu, 13 Feb 2025 04:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739419556;
	bh=u0CEnCfaVdP25a8GNpqFlUn1aE+Tvo2eIuxsK/SLlkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKusks44ebGPBvDKT5blKuv+vNUXh25zFAzyvz2dvr7IGAVLx72bzJknEEkGrJ3C/
	 9rdudCWVHQYDoJpvIvfNxg+it2HbDVR50DZ6b+B85a33SxbXIqK8lcqAWca7b1FXAv
	 MRLZAS8MLBQyVuUSfBM0PskgbriS24jrLpewZK82vb665iW50HaIk7DRttDOdav0CX
	 dm+5Z/bcHLrmVJswW2YpuehBcsLBauX7Er5OsZHyQnEmkXCpxclelToAoBQ4kOQ4d0
	 EsUY3RuqK7fMIjoG8QrbzDsCshxEjFt3MEWwBlckzMD8XdQkyQrbnGzIAmueqmMLbX
	 S9Xi1zr9sN/Nw==
Date: Wed, 12 Feb 2025 20:05:54 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Tavian Barnes <tavianator@tavianator.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andi Kleen <ak@linux.intel.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	Michael Petlan <mpetlan@redhat.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org
Subject: Re: [PATCH v1] perf sample: Make user_regs and intr_regs optional
Message-ID: <Z61vosIP67VMUJAS@google.com>
References: <20250113194345.1537821-1-irogers@google.com>
 <CAP-5=fVoQRhd-8jyXfjc2dCuwt7_o1sU208aADT1FriwCNa9qw@mail.gmail.com>
 <Z6q7EZxAvskBE4H3@google.com>
 <CAP-5=fUTBJ_15f1WFuHjZzbWDwsAo3d90WX_hobfVWPjSOe3Vw@mail.gmail.com>
 <Z6uM48_IJa-AEzEI@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6uM48_IJa-AEzEI@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_200558_196529_A70EAD40 
X-CRM114-Status: GOOD (  29.69  )
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

On Tue, Feb 11, 2025 at 09:46:11AM -0800, Namhyung Kim wrote:
> On Mon, Feb 10, 2025 at 08:43:40PM -0800, Ian Rogers wrote:
> > On Mon, Feb 10, 2025 at 6:51 PM Namhyung Kim <namhyung@kernel.org> wrote:
> > >
> > > On Mon, Feb 10, 2025 at 10:15:22AM -0800, Ian Rogers wrote:
> > > > On Mon, Jan 13, 2025 at 11:43 AM Ian Rogers <irogers@google.com> wrote:
> > > > >
> > > > > The struct dump_regs contains 512 bytes of cache_regs, meaning the two
> > > > > values in perf_sample contribute 1088 bytes of its total 1384 bytes
> > > > > size. Initializing this much memory has a cost reported by Tavian
> > > > > Barnes <tavianator@tavianator.com> as about 2.5% when running `perf
> > > > > script --itrace=i0`:
> > > > > https://lore.kernel.org/lkml/d841b97b3ad2ca8bcab07e4293375fb7c32dfce7.1736618095.git.tavianator@tavianator.com/
> > > > >
> > > > > Adrian Hunter <adrian.hunter@intel.com> replied that the zero
> > > > > initialization was necessary and couldn't simply be removed.
> > > > >
> > > > > This patch aims to strike a middle ground of still zeroing the
> > > > > perf_sample, but removing 79% of its size by make user_regs and
> > > > > intr_regs optional pointers to zalloc-ed memory. To support the
> > > > > allocation accessors are created for user_regs and intr_regs. To
> > > > > support correct cleanup perf_sample__init and perf_sample__exit
> > > > > functions are created and added throughout the code base.
> > > >
> > > > Ping. Given the memory savings and performance wins it would be nice
> > > > to see this land. Andi Kleen commented on doing a reimplementation,
> > > > which is fine but out-of-scope of what I'm doing here.
> > >
> > > Yeah, I like the core of the change.  Andi's concern is that it touches
> > > too many places.  It'd be nice if we can do that without allocating
> > > memory for regs and eliminating the perf_sample__{init,exit}.  But I'm
> > > not if it's possible.
> > 
> > Moving from no allocations to 2 possible allocations means there has
> > to be corresponding frees. Putting the frees into an __exit function
> > is the norm for this kind of cleanup. I don't see how you can move to
> > the approach presented without adding the frees and not introduce a
> > memory leak. I don't see what's actionable for me to do here.
> 
> Right, I'm inclined to merge this patch.  But I need to think a bit more
> about the Andi's approach before that.

Probably we can use a global (or per-thread) variable, but I think it
could grow to another pain point in the future.  Using __init/exit will
make it easier for potential future changes.

Thanks,
Namhyung


