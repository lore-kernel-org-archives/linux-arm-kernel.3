Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82154CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YWsh4X3JS5vpUULV7xYsIb4PXB+83TSdZe8w5kOXJA=; b=5Az05GbpB5wIw0q4FUmyvrM7ma
	XQS2rX4OnBbh+wl5UgokY16KqWzxI+GolDHnUPF2N3+SFDUzu9S9smsAydgleoob0ZuOZ4IpY6OWa
	FFEIRoTn1mWssBiXorv8c//y1NaAtH9DRCGyr7zYi3RJ2Tpaz0rwHSTAJQsynyzBnE7viwFa+KV3N
	pnNGtAlC4utEeY5kVBou4Gqz+ucLEzmZXiQQ0804kOQphWXnEt1NFjAnr7mSDmyjtxAtL9u2HqHgo
	d5G7L7HqnsVqfGvS/GWVCK8U/VzAfC2aTM7J3zzvGP5glqu8rca4o0wGSW6/ApC/UOKrLa7ZfFkKG
	zQQFNQhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhy9-000000032RL-1Imz;
	Fri, 16 Oct 2026 13:27:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhy6-000000032QY-2e3c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:27:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E07A714BF;
	Fri, 16 Oct 2026 06:27:25 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26FFA3F673;
	Fri, 16 Oct 2026 06:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792157249; bh=gJL+Ig+PnJG4Ys4tk6ii6Z0DhYNYqk+8QqkSxXfINF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hlz+sTX/WZBD14pDUSYYkKwmv8GmcUxwHxVccqYoVMhG3esxdy6A3JvJgOwBi2JA6
	 ieAN1ymj8V+r0tdA69+KXVWQXF5ZKVBpDodL3Eko6E/WFPrI/moIeUIVupT+KvSRHv
	 64botKz15g5rDwrSMbdkTCYJidJSwkBlrGJXasS4=
Date: Fri, 16 Oct 2026 14:27:14 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: "Tomohiro Misono (Fujitsu)" <misono.tomohiro@fujitsu.com>
Cc: 'Catalin Marinas' <catalin.marinas@arm.com>,
	'Will Deacon' <will@kernel.org>, 'Jonathan Corbet' <corbet@lwn.net>,
	'Shuah Khan' <skhan@linuxfoundation.org>,
	'Randy Dunlap' <rdunlap@infradead.org>,
	'Marc Zyngier' <maz@kernel.org>,
	'Thomas Gleixner' <tglx@kernel.org>,
	'Radu Rendec' <radu@rendec.net>, 'Oliver Upton' <oupton@kernel.org>,
	'Fuad Tabba' <fuad.tabba@linux.dev>,
	'Joey Gouly' <joey.gouly@arm.com>,
	'Steffen Eiden' <seiden@linux.ibm.com>,
	'Suzuki K Poulose' <suzuki.poulose@arm.com>,
	'Zenghui Yu' <yuzenghui@huawei.com>,
	"Kohei Enju (Fujitsu)" <enju.kohei@fujitsu.com>,
	"'linux-arm-kernel@lists.infradead.org'" <linux-arm-kernel@lists.infradead.org>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
	"'linux-doc@vger.kernel.org'" <linux-doc@vger.kernel.org>,
	"'linux-perf-users@vger.kernel.org'" <linux-perf-users@vger.kernel.org>,
	"'kvmarm@lists.linux.dev'" <kvmarm@lists.linux.dev>
Subject: Re: [PATCH v2 3/4] perf: arm_pmu: Add workaround for FUJITSU-MONAKA
 Erratum E#030002
Message-ID: <atImMmlBmOYlY5T2@J2N7QTR9R3.cambridge.arm.com>
References: <20261016-monaka-fix-for-upstream-v2-0-fc7ede7f9f48@fujitsu.com>
 <20261016-monaka-fix-for-upstream-v2-3-fc7ede7f9f48@fujitsu.com>
 <atIT0dmeqAXLoThW@J2N7QTR9R3.cambridge.arm.com>
 <OSCPR01MB1573944ED57DC682897594F06E59B2@OSCPR01MB15739.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSCPR01MB1573944ED57DC682897594F06E59B2@OSCPR01MB15739.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_062730_839922_DE4256FA 
X-CRM114-Status: GOOD (  31.44  )
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

On Fri, Oct 16, 2026 at 01:00:13PM +0000, Tomohiro Misono (Fujitsu) wrote:
> > Subject: Re: [PATCH v2 3/4] perf: arm_pmu: Add workaround for FUJITSU-MONAKA Erratum E#030002
> > 
> > On Fri, Oct 16, 2026 at 07:00:47PM +0900, Tomohiro Misono wrote:
> > > FUJITSU-MONAKA Erratum E#030002 affects FUJITSU-MONAKA CPU.
> > >
> > > On affected FUJITSU-MONAKA CPUs, after a PMU event counter is
> > > stopped at a value just before overflow, an overflow might still
> > > be incorrectly detected, resulting interrupt storm in some case.
> > >
> > > For example, if the following conditions are met:
> > >   1) Running perf to count an event in user space only
> > >   2) The event can also occur in kernel space
> > >   3) The counter value is set just before the overflow
> > >      (when using the -F option, initial counter value is -1)
> > >
> > > when the kernel is about to return to user space after enabling
> > > the count, an overflow interrupt is incorrectly triggered by an
> > > event that occurred in kernel space. Since the counter value is
> > > not updated (correctly), the interrupt handler does nothing and
> > > returns with the same condition. This leads to another wrong interrupt
> > > and results in an interrupt storm and eventually a softlockup.
> > 
> > I don't fully understand this.
> > 
> > Surely the relevant PMOVS{CLR,SET}[n] bit set as if the counter n
> > overflowed?
> > 
> > If that bit is set, the handler will certainly do *something*.
> > 
> > If that bit is not set, the interrupt shouldn't be asserted at all. When
> > does it get de-asserted?
> 
> Sorry, my explanation wasn't clear. The interrupt will be de-asserted
> as usual.

I'm trying to work out which of the following happens due to the
erratum:

(a) When the erratum occurs, the HW sets a bit in PMOVS*. An overflow
    interrupt is asserted because PMOVS* is non-zero. The overflow
    handler will see that bit was set in PMOVS*. Clearing PMOVS*
    de-asserts the interrupt as usual.

(b) When the erratum occurs, the HW does not set a bit in PMOVS*, and
    asserts an overflow interrupt even if PMOVS* is clear.  The overflow
    handler might not see a bit set in PMOVS*.

(c) Something else.

Can you pleaes confirm what HW does with PMOVS* when the erratum occurs?
I assume (a), but you haven't explicitly stated that so far.

> The problem is that armpmu_event_set_period() will not update the counter
> value if, for example, the counter is -1. Therefore, false overflow detection will continue.
> With this patch, armpmu_event_set_period() will force the counter to -6 so that
> false overflow detection won't occur in the kernel, since the maximum event
> count at a time is 5.

I expected that were this to occur a number of times in quick
succession, the core perf code would throttle the event, and adjust the
period.

I am presumably missing some detail that prevents that.

I assume you've seen the issue in practice? i.e. you've actucally
triggered this with the perf tool on real hardware?

Mark.

