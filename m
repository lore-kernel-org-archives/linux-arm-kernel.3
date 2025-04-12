Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD113C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 20:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjKYXxB4nXA7vPm6PfRcnm/szic9Q9M7UkVZTSkbrQU=; b=oD5fRSVeRLCrIAYsnZKzI61nKM
	0dfHRxKREvVsz27wqjOaCmBxPWCbAeZ2gCjq12U+55Qel2/ISceZBQ56EwnEs4fLv2yxLK59Jka6P
	lV1LUFliuv1X1KqKx9h3lJXIhYrA1h/1J8A3V7cig9MwO2rqGkiOx2xSMKr3HUfWO8Ctxx7fmAL7j
	MD+JpFGYcUjLxoN0noCmI59NsRMwBPz9cN8EBTCFLBuzVCKRMMN4s657tZBuVqWWdaQxK4kJzQaG/
	p7aErFTRWiYfU6EHu6N/nw3CJrgMwQEVs5g2Jprl0BCbXcgvQlX2cKlsWwVASPyDEK5cB93m/haPD
	TPi1EZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hu0-0000000GS4a-45Pp;
	Sat, 12 Apr 2025 20:56:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hgR-0000000GQvA-2aWB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 20:42:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EBAF61130;
	Sat, 12 Apr 2025 20:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC90C4CEE3;
	Sat, 12 Apr 2025 20:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744490553;
	bh=67nwnmAQRibIdssEsdv9dREv+MhzN5xv/2g8tq8XfiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9cM1Ak5DFmc1MALV8VTCx2DznegMuxrQRlrZ7p1gt+laVV3ehKGKitZ1/Knm2l3L
	 feqj+CXyUJQQcLjI8xtcKNJXLrrWvQBGHLeB/wlyNwmYumfwE1Cujt1YHKhEsJxWe9
	 QUu4vlgu/L8izyBcF6IAYVyJCAdls/jU7/R83CWjQWTfbHCNR3yMdi3qP4m+Q/1nTi
	 74gBspeJVkZeyn5N1Fm5hPumHYtdUPK7Ma1x3od0F0XkX9WuQZs9Hu74G0fGIF0w54
	 TtXIItXj4MpTyIpngSc+rOSQDI3L/JqvKjD9xKyr/Q/+7HbB68ra0wNA7aPrTDE3+5
	 Q6ldfHXaja1dw==
Date: Sat, 12 Apr 2025 22:42:27 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Mark Barnett <mark.barnett@arm.com>, peterz@infradead.org,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	ben.gainey@arm.com, deepak.surti@arm.com, ak@linux.intel.com,
	will@kernel.org, james.clark@arm.com, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	adrian.hunter@intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/5] A mechanism for efficient support for
 per-function metrics
Message-ID: <Z_rQMwKQDu6K66_r@gmail.com>
References: <20250408171530.140858-1-mark.barnett@arm.com>
 <Z_ZcRiHTGljxEEdN@gmail.com>
 <2fa741d8-13c7-49c0-a6c5-540a7c2cf3a7@arm.com>
 <CAP-5=fUukVQMRHUQ9Mpx38H-7VNLt4mDj-jaYgn8Tf4zjecD-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP-5=fUukVQMRHUQ9Mpx38H-7VNLt4mDj-jaYgn8Tf4zjecD-A@mail.gmail.com>
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


* Ian Rogers <irogers@google.com> wrote:

> I don't think work should be gated on cleaning up perf report, top, 
> etc. which still needs clean up for things like hybrid events. As the 
> histograms should use the sample's period then I believe things 
> should just work in much the same way as leader sampling can work. 
> It'd be worth checking.

Yeah, so I think burst-profiling is basically still a single-event 
profiling mode - with a tooling-side filter that skips the long-periods 
and includes the burst-periods, and transforms all the statistics and 
counts to make sense in the usual perf context.

Ie. I don't think it should be overly intrusive, and it could be a nice 
performance & profiling quality feature we'd consider using by default 
eventually.

Thanks,

	Ingo

