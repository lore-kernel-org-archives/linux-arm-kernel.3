Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AC8CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 16:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXnUomiTnspBvqbztmPMYi4UgZJHZ57DR3HqyE7ktJ0=; b=HsQQyJSZAK8D/Um5A+zkg0Cs8n
	nL8tQmArgjQ9hFQvv4Fvc6FjvnTRsl7E8GJdzTO2ZkI5Y/lxZwl0MbImZKL6cOrDJFWv1HJuYSDlJ
	lMZocDTHlJOdwo2wuqsqZLPX0WQx+vVNIhuMh24yVlQGtvsk6LeDMpP0AGyXo510VJzr5zbTeTe9l
	dtRDTDJ3074W0g9+55KkvP+I91uzYAzOvdP41drJIl0otsw3UowXiIL+twonnCITn73eBz/SydS7t
	XJx6/Mo1ZsLwYiD+atZTjAKCB3p8r2bZeGWDcaa47outEn+5zz4FtzcOVEOfPkghV5lIHYUoxRr4+
	xxRqwiYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGtC-00000004TwA-3feW;
	Wed, 27 May 2026 16:13:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGt9-00000004TvD-0oik
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 16:13:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2B8D35B9;
	Wed, 27 May 2026 09:13:40 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 719913F905;
	Wed, 27 May 2026 09:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779898425; bh=H9lAPC4b+Y0olzRKTrAlbPR95IUAy5LD5nO5i4HFf+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ne8/SXk9dA3bVjW4sOSS5wevxc2rbEEbjiW5FFi5VZfREXfhXKbyxELDJH7EhGr/F
	 nEp7gZwyZmXXVCxrMz/+5gK6NtAHbiZWkT5SGuc+mLBxCh2Eh44Sxvdg/GGwGZdORg
	 B02N+98cWrDIcxrB/dbaYB5LToMV8v3OMaflbuGE=
Date: Wed, 27 May 2026 17:13:42 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 11/18] arm64: fpsimd: Split FPSR/FPCR from SVE
 save/restore
Message-ID: <ahcYNp1e0Mj_vRt2@J2N7QTR9R3.cambridge.arm.com>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-12-mark.rutland@arm.com>
 <0b72df66-2914-4537-811e-2080e0a7ce6c@sirena.org.uk>
 <ahb20fXkdWI7SljE@J2N7QTR9R3.cambridge.arm.com>
 <4bcf4ec4-6c82-4dc2-b96a-a3a76340ecfe@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bcf4ec4-6c82-4dc2-b96a-a3a76340ecfe@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_091347_327998_A19E8812 
X-CRM114-Status: GOOD (  33.65  )
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

On Wed, May 27, 2026 at 03:13:04PM +0100, Mark Brown wrote:
> On Wed, May 27, 2026 at 02:51:13PM +0100, Mark Rutland wrote:
> > On Tue, May 26, 2026 at 05:28:21PM +0100, Mark Brown wrote:
> > > On Thu, May 21, 2026 at 02:25:49PM +0100, Mark Rutland wrote:
> 
> > > > ... so I've assumed that this doesn't actually matter in practice, and
> > > > implemented the C version matching the existing SVE assembly.
> 
> > > There is a possibility that it only matters for older, FPSIMD only CPUs
> > > or just that nobody got round to benchmarking this on physical CPUs with
> > > SVE and in fact a similar optimisation is also useful there.
> 
> > All of that might be true, but that doesn't change my assessment that
> > this doesn't seem to matter in practice, and given that the overall goal
> > of this series is to *simplify* things, I'd much rather err towards that
> > than hypothetical performance concerns.
> 
> This could do with more clarification in the commit log, right now it
> just points to us not having done this for SVE but that's running on a
> rather shiner set of CPUs (and likely written without any physical
> implementation available) so that's a rather large jump.
> 
> > > I'm a bit wary of dropping the optimisation without any verification
> > > of the performance impact, but equally I'm not aware of a specific
> > > benchmark that showed the impact or even if there was one in the first
> > > place.  The changelog sounds like the optimisation might've been
> > > written based on inspection alone, I don't know if anyone will
> > > remember more than a decade later.
> 
> > From what I remember, the changes in commit 5959e25729a5 were made based
> > on intuition, inspired by a contemporary retrospective change to the
> > architecture that made FPCR self-synchronizing. Previously the
> > architecture required a context synchronization event for the write to
> > take effect, but implementations happened to be stronger.
> 
> > The conditional write isn't necessarily a win, because the cost of
> > recovering from a branch mispredict can be much larger than the cost of
> > micro-architectural mechanisms to ensure that FPCR is
> > self-synchronizing.
> 
> That seems likely from my read of the commit log there, it smells like
> something done from inspection rather than because there's an observed
> performance change.  It'd be good to put something like the above in the
> commit log since it's a much more relevant analysis than the comparison
> with the SVE path.

For now I'm going to delete that from this commit message, and leave the
next commit saying I've erred in favour of the simpler sequence.

Mark.

