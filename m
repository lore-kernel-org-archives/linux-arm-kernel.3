Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5233CE9B249
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHwIF4V+Sfi2Dx/bo9vGSSFFbaqINJ//nOO1nfy3NhA=; b=BJUCVh9Ut6z0dRJyfQO+g4pekK
	fjTDIQnKlDrVq92NugQw4jg1jmHnboWVBanKBGHG6j7Yz1JjITgA7Xi5d2ZrDJT6nAiB6P3UJ2crW
	ZJ85kI9tGBsp+sfBN6neQtSXZZN/aJzcpngVjxuHIQmozyT524Q4TesfPMwdzjCsQc6G6zhsvI6Jl
	nMWcE14hO4mzyrILYyjfJJHn7W33mL4S+iLcyqe1mB3hRhfoQEasFymMj6FQAG9H+z1tZ05X1cvyB
	Ea12wVwSnZBQViSNzYVD70DOZE/C4D6ZEuoeuoQiq1v6Bpl6rnA7C/t74/8Q4bCPbxZoDT1dS+zen
	qBZQtqhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuprG-00000001s0l-1xeq;
	Tue, 24 Feb 2026 10:41:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuprG-00000001s0d-0IE8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Feb 2026 10:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bHwIF4V+Sfi2Dx/bo9vGSSFFbaqINJ//nOO1nfy3NhA=; b=YxkdXSBfv2J0CfNjCaNSNGxjsW
	HimhZAuJW4NO5YY8NK+llCUJeoqBRJ6Vn99JrFQjLTPSc32v5+H796fnEtoAEERJu7CHuuyt5Cq8q
	mgkfSXvXgGGNAMbbP68DvycGfejyRyfC64MxJw9nNRjI0SvikEy3mWLxWQSe7Gu6xvJjU6HWvmk74
	ChIW3W7MiMNHXPnbNOiICk5WzeaKFt1R0vsVGtgLzbNfJya6kUHttZIABiuipFnYmSVOIcKpFmkzN
	iY/HvUJjMn6/HhwyMGbK/YmZ1wOzC70WbrcIRbXBS9kJQEVEjXPYuE6ykoiI3MMcHusmIGp+/IeDl
	CVZfzgXw==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuprD-0000000Gh6J-17U0;
	Tue, 24 Feb 2026 10:41:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0DEC930075A; Tue, 24 Feb 2026 11:41:34 +0100 (CET)
Date: Tue, 24 Feb 2026 11:41:34 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-perf-users@vger.kernel.org
Subject: Re: [RFC V1 04/16] perf/events: Replace READ_ONCE() with standard
 pgtable accessors
Message-ID: <20260224104134.GW1395266@noisy.programming.kicks-ass.net>
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-5-anshuman.khandual@arm.com>
 <aZ14lUwuA86aiOH-@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ14lUwuA86aiOH-@J2N7QTR9R3>
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

On Tue, Feb 24, 2026 at 10:08:21AM +0000, Mark Rutland wrote:
> On Tue, Feb 24, 2026 at 10:41:41AM +0530, Anshuman Khandual wrote:
> > Replace READ_ONCE() with standard page table accessors i.e pxdp_get() which
> > anyways default into READ_ONCE() in cases where platform do not override.
> 
> For each of the patches where you make this sort of change, please
> explain in the commit message *why* it is necessary to do this.
> 
> IIUC the entire point of this is that in subsequent patches, arm64 will
> need to use something other than READ_ONCE() for all pXX levels in order
> to support D128 translation tables.
> 
> Spelling that out in the commit message makes it much easier for
> reviewers to see what's going on, and to focus any discussion/questions,
> e.g. *why* won't READ_ONCE() work?

That, and only being sent *one* patch, I have no clue what the rest of
them are doing. Didn't even get 0/n.

I hate people sending me just one patch; just send the whole series
already.

