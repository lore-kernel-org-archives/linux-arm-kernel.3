Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89176C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f88CVqVwH3EoaYY9ZjzBSzc+5VV8bsMvTs1N/tjI6Fk=; b=S8netUXMIIB/J7RQktVeN5SaP4
	8BK4pvcZHfYrGAdXTS9H9a4NKIVRFOgGyZNdbGzLRVK9zf50KrA7xKmoZCTZDa5MH9fng5Xude6hZ
	bD2gWt+JJ1uTuxbXyi9S7/YeLlRJ/iqSMnMpcavEY5dIQbcgh3wunMvy/xrRVZEk/cZIxwFK/SHRE
	yHgxTcdkxV0aJtTMFjSsAkAYMZze3Le1ZrktAaO31hbfmdGk087K4z+Uovm7jO0ufBDA4J4xotgSk
	lg/7/IeDOdt00u00I8zb40YZobEF2hIDFO/HhfMhuGcfu0ICtQlEo4lu4ksiCACUU2HX6T7f8KbTf
	4m6gO7Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Pc5-00000008qmF-11hP;
	Wed, 23 Sep 2026 16:14:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Pc4-00000008qm8-1z9x
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 16:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f88CVqVwH3EoaYY9ZjzBSzc+5VV8bsMvTs1N/tjI6Fk=; b=aZDJRN3r+76vQicCAi9K/LV4wu
	X204+EUKLtZqEGao6ONxIDHHd77Z64AtEhgNnOQ3l436FiEFCxFb9buGxB0VplyfyjMMdrA8ySPA4
	wuTCAy6cFcM/lDMZ9gLX2MctpkBvKNYq93nD4N76nWI5QNPAtcbMuweiJVMpVNAYJ40+dI+CuBC9E
	IZi7R+Kx9svMNqOVMBmsnRuMNaRCP9F9WI/fokWbnxAuvqElFGy/5UswT4F5AJw/RwM0vYGF7DfNk
	4BOQY6YXbkHfRXwww6wAHGqiGutZZ3r3BMP1Q+JQ4EDImpqpIqG9jEtv7/3oKdE+nhE8NOgYvxCJ5
	2isH7KfQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Pby-0000000EzzG-2cCD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:14:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECBAE1570;
	Wed, 23 Sep 2026 09:14:16 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5E003F86C;
	Wed, 23 Sep 2026 09:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790180060; bh=9EBIGd9e2m8HBAqkNbb+EjJdoUI8yMILNRtqw6GVPOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=feFCPkW3shidAGRi0gtGaIPg3jJgWeecq0pXz59fMYfi8toH2Aqe7aKu0CfWK44oP
	 rdyQJRrd761lAhO9YIBPaZxDGNYUb43W0pIcLL53BP5YZz8ZiFXjk9lM6W/bw5dIXS
	 U20QZqzwHUbjqAFoAi6n3VA4EwUl+Nb3TJo3eSs0=
Date: Wed, 23 Sep 2026 17:14:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Usama Anjum <usama.anjum@arm.com>
Subject: Re: [PATCH v2] arm64: clear_page[s] using memset
Message-ID: <arP619hd9Rx8Vlrx@arm.com>
References: <20260916-aarch64-clear-pages-c-v2-1-0393769f7912@kernel.org>
 <aqq1sxdQNZ93oV9A@LeoBrasDK>
 <aqq7oZzutLP82WYB@LeoBrasDK>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqq7oZzutLP82WYB@LeoBrasDK>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_171425_674894_4EB5FD5A 
X-CRM114-Status: GOOD (  26.00  )
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

On Wed, Sep 16, 2026 at 04:54:09PM +0100, Leonardo Bras wrote:
> On Wed, Sep 16, 2026 at 04:28:51PM +0100, Leonardo Bras wrote:
> > On Wed, Sep 16, 2026 at 12:03:56PM +0200, Linus Walleij wrote:
> > > There is no need to try to second-guess the compiler when
> > > clearing memory. Just call memset() like everyone else.
> > > 
> > > Since memset() already has an architecture-local MOPS
> > > optimization, we do not need to do anything else to preserve
> > > the MOPS optimization.
> > > 
> > > While at it, implement the shorthand for directly calling
> > > the new prototype clear_pages() for larger page chunks.
> > > 
> > > No performance regressions can be seen, the fastpath
> > > benchmarks differences are in the noise.
> > > 
> > > Usama Anjum tested next-20260821 with one warm-up and three repeats
> > > in four sessions, for a total of 12 measured runs. The commands were:
> > > 
> > >   perf bench mem memset -k 1GB -f default -s 16GB
> > >   perf bench mem mmap -p 1GB -f demand -s 32GB -l 5
> > >   perf bench mem mmap -p 4KB -f demand -s 32GB -l 5
> > > 
> > > The results were:
> > > 
> > > aws-m7g.metal:
> > >   Benchmark    Base bytes/sec   Change with patch
> > >   memset 1GB   63932542232.12                1.92%
> > >   mmap 1GB     63272579168.03               -0.57%
> > >   mmap 4KB     49692830849.48               -1.11%
> > > 
> > > cesw-aarch64-ampereone-1s-a192-32x:
> > >   Benchmark    Base bytes/sec   Change with patch
> > >   memset 1GB   33895562998.71                0.25%
> > >   mmap 1GB     34338454210.17                1.16%
> > >   mmap 4KB     25687107580.90               -0.85%
[...]
> > Looking on that, I see that the memset() implementation uses setp, setm, 
> > sete, while the clear_page()'s uses setpn, setmn, setn for the case with 
> > MOPS. But then, reading into the docs, the instructions seem pretty much 
> > the same thing. 
[...]
> Oh, I browsed a bit here, and IIUC none of the tested machines have 
> FEAT_MOPS, is that right?
> 
> If that's the case, the tests are exactly to what is different between 
> patched and current versions. There should be no impact on MOPS version as 
> the instructions are basically the same.

Logically, yes, they are the same. From a performance perspective, there
may be a difference between the temporal and non-temporal variants,
depending on the usage.

I think it would be good to run the benchmarks with the current
implementation without DC ZVA. I don't think we have an easy way to do
this on the command line, so we can simply hard-code the DZP=1 check and
fall back to the STP or STNP in both cases.

Otherwise I'm fine with the patch as well, good clean-up.

-- 
Catalin

