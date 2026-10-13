Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2ECCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGss90kIqJSuKwZAQ6DLZisijObcQph2FKfXz/chjsA=; b=vNRhD2w0jhk8R88qpL9p+/W+5f
	Zi6t9PlAyysaugr+rVQ9+Z9nZ6hvGESCDZ6MqUJOLGENijTjzD9vEvNiC/pUnZOpI1mxWMh0QsB+s
	hV0bO3Zcf1QsYzZ3sOZ/U+/v6lIS/k6F3xyBsbiSn7wb+vjqys7zX3ZDb8KoKJNTiou9kZtAvz4+U
	vVZvQLrxwhdcmOR36YdngSt/shPlPLdtsDggRi27pv8SH/Jq3DYQWCf7dthBUDy5oB5qkAnXR9PiL
	F/CHQDKqBuMFjGE/LKNSrv5iYdg85p52pnZAnCmvibFg00JZG7DaBgvJujsWZMArZ9hTHZnmbhKsw
	dJLylpqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcBU-0000000CuJa-147o;
	Tue, 13 Oct 2026 13:04:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcBQ-0000000CuIE-2Wy7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:04:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B483169C;
	Tue, 13 Oct 2026 06:04:37 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBB333F66F;
	Tue, 13 Oct 2026 06:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791896680; bh=YWFi8pNw4Nk/CWDYcXcgcJeWhFMoeYs4kTjK55wIpDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HOhAS3wiU5y+6aEiONJoWcDCn4oDRByZB2qAH6ljvfPPsPCfqHec8sUcVw8adxsn/
	 cq3wP/gR563Tn8osdAUixj9C5c9QSh5oAPjmNl5S8sksmcuFbkmqOSdTLTmp/6INb0
	 6657orV2X/TJTY/B14QNQGovG4n26ksGxDmlcGZM=
Date: Tue, 13 Oct 2026 14:04:35 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Leonardo Bras <leo.bras@arm.com>, Linus Walleij <linusw@kernel.org>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v2] arm64: clear_page[s] using memset
Message-ID: <as4sY3Eq-B_59lW9@arm.com>
References: <20260916-aarch64-clear-pages-c-v2-1-0393769f7912@kernel.org>
 <aqq1sxdQNZ93oV9A@LeoBrasDK>
 <aqq7oZzutLP82WYB@LeoBrasDK>
 <arP619hd9Rx8Vlrx@arm.com>
 <ec298ee5-5080-494d-b735-7ba7bd20cdf0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec298ee5-5080-494d-b735-7ba7bd20cdf0@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_060444_731633_908D1058 
X-CRM114-Status: GOOD (  32.64  )
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

On Thu, Oct 08, 2026 at 02:30:20PM +0100, Muhammad Usama Anjum wrote:
> On 23/09/2026 5:14 pm, Catalin Marinas wrote:
> > On Wed, Sep 16, 2026 at 04:54:09PM +0100, Leonardo Bras wrote:
> >> On Wed, Sep 16, 2026 at 04:28:51PM +0100, Leonardo Bras wrote:
> >>> On Wed, Sep 16, 2026 at 12:03:56PM +0200, Linus Walleij wrote:
> >>>> There is no need to try to second-guess the compiler when
> >>>> clearing memory. Just call memset() like everyone else.
> >>>>
> >>>> Since memset() already has an architecture-local MOPS
> >>>> optimization, we do not need to do anything else to preserve
> >>>> the MOPS optimization.
> >>>>
> >>>> While at it, implement the shorthand for directly calling
> >>>> the new prototype clear_pages() for larger page chunks.
> >>>>
> >>>> No performance regressions can be seen, the fastpath
> >>>> benchmarks differences are in the noise.
> >>>>
> >>>> Usama Anjum tested next-20260821 with one warm-up and three repeats
> >>>> in four sessions, for a total of 12 measured runs. The commands were:
> >>>>
> >>>>   perf bench mem memset -k 1GB -f default -s 16GB
> >>>>   perf bench mem mmap -p 1GB -f demand -s 32GB -l 5
> >>>>   perf bench mem mmap -p 4KB -f demand -s 32GB -l 5
> >>>>
> >>>> The results were:
> >>>>
> >>>> aws-m7g.metal:
> >>>>   Benchmark    Base bytes/sec   Change with patch
> >>>>   memset 1GB   63932542232.12                1.92%
> >>>>   mmap 1GB     63272579168.03               -0.57%
> >>>>   mmap 4KB     49692830849.48               -1.11%
> >>>>
> >>>> cesw-aarch64-ampereone-1s-a192-32x:
> >>>>   Benchmark    Base bytes/sec   Change with patch
> >>>>   memset 1GB   33895562998.71                0.25%
> >>>>   mmap 1GB     34338454210.17                1.16%
> >>>>   mmap 4KB     25687107580.90               -0.85%
> > [...]
> >>> Looking on that, I see that the memset() implementation uses setp, setm, 
> >>> sete, while the clear_page()'s uses setpn, setmn, setn for the case with 
> >>> MOPS. But then, reading into the docs, the instructions seem pretty much 
> >>> the same thing. 
> > [...]
> >> Oh, I browsed a bit here, and IIUC none of the tested machines have 
> >> FEAT_MOPS, is that right?
> >>
> >> If that's the case, the tests are exactly to what is different between 
> >> patched and current versions. There should be no impact on MOPS version as 
> >> the instructions are basically the same.
> > 
> > Logically, yes, they are the same. From a performance perspective, there
> > may be a difference between the temporal and non-temporal variants,
> > depending on the usage.
> > 
> > I think it would be good to run the benchmarks with the current
> > implementation without DC ZVA. I don't think we have an easy way to do
> > this on the command line, so we can simply hard-code the DZP=1 check and
> > fall back to the STP or STNP in both cases.
> > 
> > Otherwise I'm fine with the patch as well, good clean-up.
> 
> 
> With DC ZVA bypassed, clear_page() STNP and patched memset() STP showed only
> 2 statistically significant regressions on AmpereOne machine.

This is confusing as I don't think Linus's patch regresses anything on
the platforms tested.

> Results for SUT Class aws-m7g.metal:
> 
> +-----------+------------------------------------------------+-----------------------+---------------------+--------------------+-------------------------+
> | Benchmark | Result Class                                   | next-20260922-vanilla | next-20260922-patch | next-20260922-stnp | next-20260922-patch_stp |
> +===========+================================================+=======================+=====================+====================+=========================+
> | perf/mem  | memset -k 1GB -f default -s 16GB (bytes/sec)   |        65367617364.09 |              -0.32% |              0.70% |                  -0.80% |
> |           | mmap -p 1GB -f demand -s 32GB -l 5 (bytes/sec) |        63750796288.65 |               0.59% |             -1.56% |                  -1.15% |
> |           | mmap -p 4KB -f demand -s 32GB -l 5 (bytes/sec) |        49588573632.22 |              -0.39% |             -0.40% |                  -0.93% |
> +-----------+------------------------------------------------+-----------------------+---------------------+--------------------+-------------------------+
> 
> Results for SUT Class cesw-aarch64-ampereone-1s-a192-32x:
> 
> +-----------+------------------------------------------------+-----------------------+---------------------+--------------------+-------------------------+
> | Benchmark | Result Class                                   | next-20260922-vanilla | next-20260922-patch | next-20260922-stnp | next-20260922-patch_stp |
> +===========+================================================+=======================+=====================+====================+=========================+
> | perf/mem  | memset -k 1GB -f default -s 16GB (bytes/sec)   |        35882584735.80 |              -0.36% |              0.43% |                  -0.00% |
> |           | mmap -p 1GB -f demand -s 32GB -l 5 (bytes/sec) |        36204572635.77 |              -1.17% |         (R) -2.07% |                   0.14% |
> |           | mmap -p 4KB -f demand -s 32GB -l 5 (bytes/sec) |        27149223683.79 |               0.54% |         (R) -2.48% |                  -0.13% |
> +-----------+------------------------------------------------+-----------------------+---------------------+--------------------+-------------------------+

Trying to make sense of the above. So based on -next of 22nd of
September, the table means:

vanilla		- next/master on that day (current clear_page())
patch		- memset()-based clear_page() patch (Linus's patch)
stnp		- vanilla clear_page() without DC ZVA
patch_stp	- memset()-based clear_page() patch without DC ZVA

I assume the vanilla vs patch columns are just noise. Well, there's a
-1.17% regression (not flagged) on Ampere but what's the standard
deviation for this column? Similarly for the -1.15% on the AWS patch_stp
test (vs stnp in the same test, it's no worse).

Vanilla vs stnp shows a regression on Ampere, however that's expected as
we no longer do the DC ZVA. Interestingly, the patch_stp result doesn't have
this regression, so I reckon DC ZVA behaves mostly in line with STP on
this hardware.

Basically I was looking for the stnp vs patch_stp results. If I read it
correctly, there's no significant change going from non-temporal to
temporal stores (and a small improvement for Ampere). Assuming future
FEAT_MOPS will have similar behaviour, moving clear_page() to memset()
shouldn't cause any regressions. Before FEAT_MOPS, we'll use DC ZVA here
anyway.

Thanks for running the tests.

-- 
Catalin

