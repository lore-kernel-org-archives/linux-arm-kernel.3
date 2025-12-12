Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041B6D59D91
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 20:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X58dL2IWFZzjAJ8OMKrqOWLypi+Oc2UPq6uMOm2meSs=; b=s8ptr4WSEb30ByKe7vDiL/mKJM
	DyfkpjmMsJ1Eo9bjb59utrn0fZsS5uBqJNF0cyuVDbwlycz+s9P+uYudurV8XdoMXz49QLnmYKA/w
	6t4OM4svryTwif4qx6A04nE//VId0VSdpVLKvWwbGtSK15jTjXNBlaFfWjhokmvkmGdcNsUcOvZbJ
	e0FgRPdIM/HwKQ39jrKIpn72SdWYvBKVqZy5hz3ah7Ps7+nudbV4iRRl91J9UnIeUDJP+wnfQ0qTm
	gktyd/WVsQcQ/Idvda2rvz/7otz+pOiH6hlfDN1kgEcwRyT09S2ZMv2DVXbw8LqGxMj+YzIq1q/Mp
	uzZ4LSsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9WQ-000000012QB-04dm;
	Fri, 12 Dec 2025 20:13:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9WN-000000012Po-29VZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 20:13:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4318943E40;
	Fri, 12 Dec 2025 20:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A13C4CEF1;
	Fri, 12 Dec 2025 20:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765570426;
	bh=CptzjZsJ11GinDWLop2KRHk+aVz9lz65MtSjPNuUcm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rkWGmbccj4gbS3fTyAx/o8NdyIZdSvZrec+egWHFAqRDFlfpyrSGhVt/MVABBSKdZ
	 ACazAe/o55xrak8LIE+lF5pyLq/H/0obhqc2FtFh1hg9GDOmL6HpXpdFU/dAZegICy
	 TyXv1696P/SQ3zpwsByIInIIYSqaNYnPaSVWWBtsG8skqk0JSSBQJ2jm7jbkEiu80F
	 7AtQsQhnAUPtRUU600FLFECIM0zCjQVIQGtyjatYJioTsA/LRjCPIj5X+q8zR9MUo5
	 ja1b8J032Wr8ksJ8d84e944tVJTnEdTsoaFwwiLpFUliv/Ii/p++zg3WUQYvDC2sLx
	 lq1ry+eWUb//g==
Date: Sat, 13 Dec 2025 05:13:40 +0900
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 00/10] arm64: Replace TLB invalidation preprocessor
 macros with C functions
Message-ID: <aTx3dM8XUMQMOf2-@google.com>
References: <20250711161732.384-1-will@kernel.org>
 <eb583fda-cbd1-4ef2-900a-a86e08a0b5d3@arm.com>
 <b40ee164-f533-43da-a4e2-068c9ae1e771@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b40ee164-f533-43da-a4e2-068c9ae1e771@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_121347_592840_E0F7939A 
X-CRM114-Status: GOOD (  20.62  )
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

On Fri, Dec 12, 2025 at 12:12:05PM +0000, Ryan Roberts wrote:
> On 10/12/2025 12:29, Ryan Roberts wrote:
> > On 11/07/2025 17:17, Will Deacon wrote:
> >> I cooked this series following a complaint from Linus back in March
> >> about our range-based TLB invalidation macro after we fixed an
> >> over-invalidation bug thanks to incorrect handling of its arguments:
> >>
> >>   https://lore.kernel.org/all/CAHk-=wgiX0q0WCL+SFwVCYtG7JR3=2Rshse-5J3AO2Y4AgT7Jw@mail.gmail.com/
> >>
> >> Once I started trying to rework the range macro into a C function, I
> >> spotted a few other opportunities for cleanup and so I've ended up with
> >> this series.
> >>
> >> Testing and feedback welcome.
> > 
> > Hi Will,
> > 
> > Did this go anywhere/are you planning to post a new version? There are a couple
> > of other cleanups I'd like to do in this area, and also I'd like to add tlbip
> > support. But I don't want to spend time on it if the baseline is going to
> > drastically change.
> > 
> > If you're not planning a v2, perhaps I could have a go then extend for the
> > extras I want to do?
> 
> Since I didn't hear back, I've reworked the series to include Linus's suggestion
> and am currently testing. Plan to post against -rc1.

Sorry, at LPC atm and have fallen behind. I was still planning to rework
this but I'm aware of other folks at Arm making changes here as well so
you should be wary of that too.

Regardless of macros or indirect branches, I was relatively happy with
some of the cleanup that fell out of this series so I'd be keen to land
it either way.

Will

