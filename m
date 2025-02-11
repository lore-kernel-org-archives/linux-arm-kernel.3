Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA82C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ns/V2ADUqMSxt3YHcakyh9LzE9Qcn5jobsve+9Hj5Bs=; b=xxpWdhHcGJ28Ot8WkeBIrwkYGi
	UoAKawx4SkgAI11/+uIhEn2kPRa/RoWZICC4UelA9sMfAgqJNxQiosWl7IEYuv9YDS02tJC9gzokK
	+m2vqcAz+P3Du0S7Ibezzs52e8e0wjUDozw6uk2OIwSHNSeSFAK/cZrjKguWQnoMgY4TuWdE4FA/S
	szVUvauvtzLlNzJUYtPM9hQhUg5Ha0FtJEtLoWu78fBB/IjIy8vfzRUHzyGPlOE4O8CFgQsAepSsz
	VAzhSE+ugFLvzUsBTQHJgEw3dR6RH3z0uZQPVSTR/6xmphRuEOVC2KCHz8BuPpWJZ9S3zsUTkPyOB
	nbEjFOXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuNR-00000004kSR-16AB;
	Tue, 11 Feb 2025 17:48:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuKt-00000004k6L-3JTM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:46:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 90236A40B20;
	Tue, 11 Feb 2025 17:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A42C4CEDD;
	Tue, 11 Feb 2025 17:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739295974;
	bh=4bWCQgq6wE2a3T0Qy5XzYaE2anG4zZm9WC4XUKvmajU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZcrCSPmlaB/tYdBAf+u3i+Q22uPyV5tZ3MrFzjw4HdRxRADGAUIM8IcFdQxl3KlP5
	 2v9uqMCLN3NtFrg+dFYz6tqB2r8MiyoETdn1Ibc+0mnCWUc3lAW2iDV0nZiRlLeGo9
	 lZelCnXID3Z3YTYM5xGdpcZZT5aWLKkqfCbVNt+Hn1bu1t/miAoixrmL6aCJqdriBJ
	 HoGFlWPR4ZiaBD1knaHIiv6KEWlIL9Ah0Tx5RGT8gvtNIbSdJdW+K0BYZp4Q5O379y
	 g+CNBASjEwDJgUeVtLZKMZI87FVsRMFCI6zS4CeFQBCZ5+OBDjjSwKtD+JrpbLtN42
	 qjJB2lSvxnP/w==
Date: Tue, 11 Feb 2025 09:46:11 -0800
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
Message-ID: <Z6uM48_IJa-AEzEI@google.com>
References: <20250113194345.1537821-1-irogers@google.com>
 <CAP-5=fVoQRhd-8jyXfjc2dCuwt7_o1sU208aADT1FriwCNa9qw@mail.gmail.com>
 <Z6q7EZxAvskBE4H3@google.com>
 <CAP-5=fUTBJ_15f1WFuHjZzbWDwsAo3d90WX_hobfVWPjSOe3Vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fUTBJ_15f1WFuHjZzbWDwsAo3d90WX_hobfVWPjSOe3Vw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_094615_961509_357185C2 
X-CRM114-Status: GOOD (  26.63  )
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

On Mon, Feb 10, 2025 at 08:43:40PM -0800, Ian Rogers wrote:
> On Mon, Feb 10, 2025 at 6:51 PM Namhyung Kim <namhyung@kernel.org> wrote:
> >
> > On Mon, Feb 10, 2025 at 10:15:22AM -0800, Ian Rogers wrote:
> > > On Mon, Jan 13, 2025 at 11:43 AM Ian Rogers <irogers@google.com> wrote:
> > > >
> > > > The struct dump_regs contains 512 bytes of cache_regs, meaning the two
> > > > values in perf_sample contribute 1088 bytes of its total 1384 bytes
> > > > size. Initializing this much memory has a cost reported by Tavian
> > > > Barnes <tavianator@tavianator.com> as about 2.5% when running `perf
> > > > script --itrace=i0`:
> > > > https://lore.kernel.org/lkml/d841b97b3ad2ca8bcab07e4293375fb7c32dfce7.1736618095.git.tavianator@tavianator.com/
> > > >
> > > > Adrian Hunter <adrian.hunter@intel.com> replied that the zero
> > > > initialization was necessary and couldn't simply be removed.
> > > >
> > > > This patch aims to strike a middle ground of still zeroing the
> > > > perf_sample, but removing 79% of its size by make user_regs and
> > > > intr_regs optional pointers to zalloc-ed memory. To support the
> > > > allocation accessors are created for user_regs and intr_regs. To
> > > > support correct cleanup perf_sample__init and perf_sample__exit
> > > > functions are created and added throughout the code base.
> > >
> > > Ping. Given the memory savings and performance wins it would be nice
> > > to see this land. Andi Kleen commented on doing a reimplementation,
> > > which is fine but out-of-scope of what I'm doing here.
> >
> > Yeah, I like the core of the change.  Andi's concern is that it touches
> > too many places.  It'd be nice if we can do that without allocating
> > memory for regs and eliminating the perf_sample__{init,exit}.  But I'm
> > not if it's possible.
> 
> Moving from no allocations to 2 possible allocations means there has
> to be corresponding frees. Putting the frees into an __exit function
> is the norm for this kind of cleanup. I don't see how you can move to
> the approach presented without adding the frees and not introduce a
> memory leak. I don't see what's actionable for me to do here.

Right, I'm inclined to merge this patch.  But I need to think a bit more
about the Andi's approach before that.

Thanks,
Namhyung


