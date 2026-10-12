Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C18CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 11:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tG5qlxdcbQtqWMyFZ3jALOU2iR8y6jUOh+bffq+o7o8=; b=iKvc/4O641ebVJHtt9psYp0HE+
	bKnkl7uTYss9/o2bPf7TE0xsvMUhDh8Z05AWPWR3+lC2keUoyVTtrD4y4ih9Jz/e5wIGSrJQKEXX4
	ILLwJ1QUbt9Z296d21NZqLb1qBsGvxXLe3mCtS/XFJaAQSrBA6ugA9a8iptnLVZBdDIMR2fvfUI3V
	PecMiR1OahmxODSxECmLtKlCVEVOCPfbtKpa/O4u02Jm1T3M4SNo5nI9ukzRZiCrbTuPKr1SNWP3r
	l5NFIu2U2uMwgy++qTYGaZcU/qM+XHm1hD4Bw1eU+bDTarx+KLT9v7WpYBZLbp3JaAcj0SWCVhhEe
	cijjcbiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDuf-0000000AJnV-43XE;
	Mon, 12 Oct 2026 11:09:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDud-0000000AJmj-2u9q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 11:09:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22FAB1655;
	Mon, 12 Oct 2026 04:09:43 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAD993F882;
	Mon, 12 Oct 2026 04:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791803386; bh=MO6RazwbWNaL8jYLe/76SWOAe8FivbQvUlaCqhLF8/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HWjVFrhRwNTgoiqxHlG+YghM9F0LFtzxvTGKaVxC7mrhTKtOnQJWj17h0NvYOUuFo
	 ByMova5hsu/7dk+lalQsKUbm3mzvICOhr/t7s81i9bzjgnuU4u8Gk8sSfj6nSJOp0m
	 AD6/9CoR4CVvrC6jYYGazXnnwptQEuUYoYt5Enac=
Date: Mon, 12 Oct 2026 12:09:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] firmware: smccc: Pass only the required device probe
 arguments
Message-ID: <asy_9kA8-y-OjH6N@arm.com>
References: <20261010100249.643327-1-aneesh.kumar@kernel.org>
 <ebb8c99c-5f76-4c36-b3cd-c238b53b3d8a@arm.com>
 <yq5aecdwcqsg.fsf@kernel.org>
 <fa110c56-3faa-4819-bb94-0d82935c4ac5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa110c56-3faa-4819-bb94-0d82935c4ac5@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_040947_768531_19EE3F4A 
X-CRM114-Status: GOOD (  21.56  )
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

On Mon, Oct 12, 2026 at 10:39:14AM +0100, Suzuki K Poulose wrote:
> On 11/10/2026 14:25, Aneesh Kumar K.V wrote:
> > Suzuki K Poulose <suzuki.poulose@arm.com> writes:
> > > On 10/10/2026 11:02, Aneesh Kumar K.V (Arm) wrote:
> > > > The device probe passes zeroes for all seven argument registers to
> > > > arm_smccc_1_1_invoke(). On ARM32 Thumb-2, this binds an input to r7 and
> > > > GCC 8.5 reports "r7 cannot be used in asm here".
> > > > 
> > > > The current smccc_devices entries need at most one argument after the
> > > > function ID: TRNG_VERSION has none and RSI_ABI_VERSION takes a requested
> > > > version. Pass zero for that argument and omit the unused arguments,
> > > > avoiding the r7 constraint. Check argument requirements when adding new
> > > > probe functions to smccc_devices.
> > > 
> > > Is it safer to use x1-x3 to 0 as they could be the results that we
> > > get back from SMCCC v1.0 onwards ?
> > 
> > I'm not sure I follow. Passing additional zero arguments only
> > initializes the input registers; it should not affect how return values
> > are handled. arm_smccc_1_1_invoke() already declares x0-x3 as outputs.
> > Since these probe functions require no inputs in x2 or x3 and we only
> > inspect x0 on return, why do we need to initialize them to zero?
> 
> Agree, I meant, passing 0s for x0-x3 future proofs the new calls.
> We know that x0-x3 could get overwritten by these calls, and is
> safe to be zero'd on a call.
> 
> But agree, for the existing users just x1 is enough.

I'd keep it like this for now, it's pretty random anyway. The next time
we need a meaningful argument to pass, we'll probably add an args array
in struct smccc_device_info.

> Either way,
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks.

-- 
Catalin

