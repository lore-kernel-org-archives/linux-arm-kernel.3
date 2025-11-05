Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3793ACCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 14:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mxcrYuWYR7KF5VJBf3GjJysE5p16lTR05PQnCozqXw=; b=qMM634XOYxUoIGBB0GBNvMac5X
	QS35W82QABjpCpvFTirGFMK7eeQfvLKZManewJeOEqARc+fwOJKk3ZxkHgazmqAczMf0f2kSN146K
	qNwMT7JU/X/BhhIlFjrvXDD8hjJ2cz8cRXaJNk6CIWZI8i1pNJHkYijlY8oexuQ/NEVBvwrqdnHxG
	9MMpzLA9gSQUiV1VD8kUQ4yDLZcbkb5MDG7qpFyLwf0vwFvo1QA87R3ht9FuJQPJcbJpwWcvmBJrr
	5iTTHt+Lh8xlnn0Ft7Ne/CpxdRuwssv1cq43srJVbcvMVHuZPc3IIAHQrUaODL9I4kmIKWm1phDFX
	ObIPgdvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGepX-0000000Ds2a-2dz6;
	Wed, 05 Nov 2025 14:49:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGepU-0000000Ds27-2LQU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 14:49:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2EDE1692;
	Wed,  5 Nov 2025 06:49:34 -0800 (PST)
Received: from arm.com (unknown [10.1.26.217])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCB163F694;
	Wed,  5 Nov 2025 06:49:41 -0800 (PST)
Date: Wed, 5 Nov 2025 14:49:39 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Willy Tarreau <w@1wt.eu>
Cc: Yicong Yang <yangyccccc@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <aQtkA0cOb6Fm9Mrc@arm.com>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <aQXtqoUEtDr-xUeS@arm.com>
 <3868c862-cf16-4259-829e-e9004028b3c1@gmail.com>
 <aQtQRSoL8GGVNrUQ@arm.com>
 <20251105134231.GF22848@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105134231.GF22848@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_064944_658645_26A8AD44 
X-CRM114-Status: GOOD (  19.97  )
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

On Wed, Nov 05, 2025 at 02:42:31PM +0100, Willy Tarreau wrote:
> On Wed, Nov 05, 2025 at 01:25:25PM +0000, Catalin Marinas wrote:
> > > But need to add the prefetch in per-cpu implementation as you've
> > > noticed above (didn't add it since no prefetch for LL/SC
> > > implementation there, maybe a missing?)
> > 
> > Maybe no-one stressed these to notice any difference between LL/SC and
> > LSE.
> 
> Huh ? I can say for certain that LL/SC is a no-go beyond 16 cores, for
> having faced catastrophic performance there on haproxy, while with LSE
> it continues to scale almost linearly at least till 64.

I was referring only to the this_cpu_add() etc. functions (until Paul
started using them). There definitely have been lots of benchmarks on
the scalability of LL/SC. That's one of the reasons Arm added the LSE
atomics years ago.

> But that does
> not mean that if some possibilities are within reach to recover 90% of
> the atomic overhead in uncontended case we shouldn't try to grab it at
> a reasonable cost!

I agree. Even for these cases, I don't think the solution is LL/SC but
rather better use of LSE (and better understanding of the hardware
behaviour; feedback here should go both ways).

> I'm definitely adding in my todo list to experiment more on this on
> various CPUs now ;-)

Thanks for the tests so far, very insightful. I think what's still
good to assess is how PRFM+STADD compares to LDADD (without PRFM) in
Breno's microbenchmarks. I suspect LDADD is still better.

FWIW, Neoverse-N1 has an erratum affecting the far atomics and they are
all forced near, so this explains the consistent results you got with
STADD on this CPU. On other CPUs, STADD would likely be executed far
unless it hits in the L1 cache.

-- 
Catalin

