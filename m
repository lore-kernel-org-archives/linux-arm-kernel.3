Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6F0CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 16:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjqN4ueRqZqexMd/UC2F91JaRbtcP5EFWGVnLCd5ohg=; b=F9OxazA66jrrVOr7FQs3EQkS7t
	VeszF2eRdZ2glK6xc4ZKClz/bvpYyklz+L84qgH5EmkBvjJC93L+QSUEDGe4Sht+kfPHJiHOGo/tz
	BFGtmk/lVZ3CE70j06TX155JbeXbCqMNwzUYvB9f1XxqQLSYnV+2+sV9z8jkVMbT+BmXOmhAQJPkm
	aqrlTKoRly98nwD70BSDmHz09QuHP4IjwU3dA6y738Kge17vEMDQSr2cAPp1IssIaTs2QZsY8jDU/
	ogJbmnq9ECmsxiOVWuOdM1t9NQ2Ay/+Pg+u42ZmXGcXDfbs5DGrdrYhMh9I77khu8OSO9DaVZAPuq
	wVagrVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdOG-00000005yfH-3yGp;
	Thu, 28 May 2026 16:15:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdOE-00000005yes-3B63
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 16:15:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC59922EE;
	Thu, 28 May 2026 09:15:15 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B71573F905;
	Thu, 28 May 2026 09:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779984921; bh=OyK3X5e+Jhr/rucK+64U5W5SFILTwa7dTGV6a4I+o/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XguVli3rvLsVZObkksEwKLQr02pz/cMuUFg9r1ZA9V0cnJB3PmSaT1RNe/gKuyFgQ
	 p329VRvop7Hpl+R3GmJzoXO0jbHAWMSoLtm/pbTbVEwzCYLPSW5QNz+Kv+JN4B3J1D
	 seMMN7903aclPs8IRFc8OpcGRWDCZMkC/4RWr8p8=
Date: Thu, 28 May 2026 17:15:14 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 12/18] arm64: fpsimd: Move fpsimd save/restore inline
Message-ID: <ahhqEs1DhShRpgXF@J2N7QTR9R3.cambridge.arm.com>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-13-mark.rutland@arm.com>
 <0f666889-fabe-4cdd-9fd2-d87808329dbd@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f666889-fabe-4cdd-9fd2-d87808329dbd@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_091522_834675_BAD6B2CB 
X-CRM114-Status: GOOD (  20.52  )
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

On Tue, May 26, 2026 at 05:44:26PM +0100, Mark Brown wrote:
> On Thu, May 21, 2026 at 02:25:50PM +0100, Mark Rutland wrote:
> 
> > Note that I've used the SVE sequence for restoring FPCR, which uses an
> > unconditional write to FPCR. The plain FPSIMD assembly sequence used a
> > conditional write to FPCR since 2014 in commit:
> 
> >   5959e25729a5 ("arm64: fpsimd: avoid restoring fpcr if the contents haven't change")
> 
> > ... but this was not followed for the SVE assembly implemented in 2017
> > in commit:
> 
> >   1fc5dce78ad1 ("arm64/sve: Low-level SVE architectural state manipulation functions")
> 
> > ... so I've assumed that this doesn't actually matter in practice, and
> > I've erred in favour of the simpler sequence.
> 
> As I said on the earlier patch I'm a bit nervous about assuming this
> doesn't matter for anyone without verifying (though I wouldn't be
> surprised if that turned out to be the case) but that's internal to that
> patch and this is obviously a great improvement so:
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>

Based on that discussion on the last patch, I've updated the commit
message for this patch say:

  I've used the SVE sequence for restoring FPCR, which uses an
  unconditional write to FPCR, rather than the conditional write used by
  the FPSIMD assembly sequence. I believe that in practice, this doesn't
  matter to a real workload, and given it's possible for the
  mis-predicted branch to cost more than the necessary
  micro-architectural synchronization, I strongly suspect any
  performance impact is within the noise. 
  
  Looking at the history, the FPSIMD assembly sequence was changed to
  use a conditional write to FPCR since 2014 in commit:
  
    5959e25729a5 ("arm64: fpsimd: avoid restoring fpcr if the contents haven't change")
  
  ... as described in the commit message, this was based on an
  expectation of implementation style, and was not based on
  benchmarking.

Mark.

