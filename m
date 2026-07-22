Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E211C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqaNcojippwP+/CrI7F1CRsMmlmcCaO7uUGV2m6JH5A=; b=VJbgAJTW2XOz5hDmj2OeCROmDX
	4GZ56CEO9tg3o1sBDAKAiNeQAXSJksbUw64tO6n/9XwyGFFj1kcPJ5axHn0836tXOTU3sNRPkp4f9
	o3ncumxI6GMHTNHra279lyjCHDDhYml3mJ+fDT6pcVlgBrFhdlMYfPwNDdskiEXTLxr8khwkxLfZf
	I+ZOjbofHyt5o938bhx6Oj4/qWTvxwvfF/nfoSZRXJ7g/GaYxnqBaqSUGCsHebBHydW+Os5Y/6jvV
	5Lr3vMlRx1bShJKKcn7lcKrs0Q51tqQgcWheHOF8Dvl3t7NxWYNk7AOyD2tj4cY64Mxjr55LKknPx
	vdoT7+tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVGi-0000000BfT9-2D21;
	Wed, 22 Jul 2026 11:37:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVGg-0000000BfSl-1LiJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 11:37:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A60E1595;
	Wed, 22 Jul 2026 04:37:36 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A28A23F66F;
	Wed, 22 Jul 2026 04:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784720260; bh=fW7lrmD+q58SE5jmSO97rxr4Xexsu6S52JD2mEizFfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YT0/Jh5POL4D8ATaEQOkmJSkSSQ1D9q64sgAYSBISJ6U4RyQwkApWYwMQ27Qq/V+7
	 cKp6WHZsUNhTwtsgY+CcHXpHUQ4InrDBZO8hv66tKG3kHC7mf2y1U89DBlcyhlnT27
	 oS8D8gsVbKDw3sebegNfDHK81gZUAISlowqVQPpo=
Date: Wed, 22 Jul 2026 12:37:19 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Linu Cherian <linu.cherian@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] arm64: cpufeature: Extend bbml2_noabort support
 list
Message-ID: <amCrY9wdc_1JMUdw@J2N7QTR9R3>
References: <20260715053408.1950475-1-linu.cherian@arm.com>
 <20260715053408.1950475-4-linu.cherian@arm.com>
 <671d0b1e-65f1-461a-aec8-a031c40245bc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <671d0b1e-65f1-461a-aec8-a031c40245bc@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_043742_400468_98872D06 
X-CRM114-Status: GOOD (  14.87  )
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

On Thu, Jul 16, 2026 at 10:00:40AM +1000, Gavin Shan wrote:
> On 7/15/26 3:34 PM, Linu Cherian wrote:
> > C1-Ultra and C1-Premium both suffer from erratum 3683289,
> > where Break-Before-Make must be followed to avoid a livelock.
> > For both CPUs, the erratum is fixed from r1p1.
> > Hence we do not enable BBML2_NOABORT for CPU revisions <= r1p0.

> > @@ -2152,6 +2152,16 @@ bool cpu_supports_bbml2_noabort(void)
> >   		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
> >   		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> >   		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
> > +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520AE),
> > +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
> > +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
> > +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
> > +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N3),
> > +		MIDR_ALL_VERSIONS(MIDR_C1_NANO),
> > +		MIDR_ALL_VERSIONS(MIDR_C1_PRO),
> > +		/* Erratum 3683289 fixed in r1p1 */
> > +		MIDR_REV_RANGE(MIDR_C1_ULTRA, 1, 1, 0xf),
> > +		MIDR_REV_RANGE(MIDR_C1_PREMIUM, 1, 1, 0xf),
> 
> The revisions for C1_ULTRA and C1_PREMIUM have been limited to
> r1p1 to r1p15. How about r2p0 and the revisions after that? We
> probably won't get a chance to hit the ceiling? :-)

Yes, those should be:

	MIDR_RANGE(MIDR_C1_ULTRA, 1, 1, 0xf, 0xf),
	MIDR_RANGE(MIDR_C1_PREMIUM, 1, 1, 0xf, 0xf),

In general, MIDR_REV_RANGE() doesn't make much sense and should be
removed. I have a patch for that hidden in some other MIDR cleanup, so
I'll go revive that shortly...

Mark.

