Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B35FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 23:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgCJheOFNNrmteKZk0wzRAtFXLDsAQbokdoxMYfFalE=; b=ODE0WV+6I/69B7hqhiOUFh5JIT
	OfkxEJAJnXUt/9jtHRl4XvLzYeQ+DM1RsiA6MToXYUdVuQA9QdANixL1ALZ8yHF3DrC2CvD8PMEQT
	f2564cbqOWtNO/h+6XIzgQD3WsIQ9900HazsW4a7X7Tj5Vd34leBAcckOwT5WW7wE84RVQNgEldPN
	X4vcDZqYXmQ2qpdt8DJc9m2Q6Tg6cCqeomF8WYzdzEMQMUAt+k5Qb01/wUpZ5A7h6vc0Xza9x1hhx
	0Z3p05cr85dSlXG9Fc7/oAVXXVtVBbzsafdNId96i9za5Lg6fii6R3BBTz4KlLvoBYjfH4wu7GZ7E
	04LIjswg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVf9x-0000000A7TA-1DH4;
	Wed, 08 Jan 2025 23:08:21 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVf8j-0000000A79v-1yOb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 23:07:06 +0000
Date: Wed, 8 Jan 2025 15:06:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736377576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vgCJheOFNNrmteKZk0wzRAtFXLDsAQbokdoxMYfFalE=;
	b=RoyE56dLBW3iwVFoe4/0jZuzFyNsE0AxyizsfrjApzlczaZ9iaQ4zVx1/j57m6P4c40Rgt
	C0rqUt+JRAMyK+uPEa6hg80NmzL/6IKYbtL95Hp9W+DU+SpiNvVt44EEujX4Tgfj4NnJiY
	01nr+YtvrbmxnICjtMV21yHlwbga2oo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/18] KVM: arm64: Support FEAT_PMUv3 on Apple hardware\
Message-ID: <Z38E4hRMlBp3CBz0@linux.dev>
References: <20241217212048.3709204-1-oliver.upton@linux.dev>
 <20250108123840.GA9197@willie-the-truck>
 <Z37cjxFu2CPi_xNr@linux.dev>
 <87jzb5q9nl.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzb5q9nl.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_150705_650547_DD67FD17 
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

On Wed, Jan 08, 2025 at 09:26:54PM +0000, Marc Zyngier wrote:
> On Wed, 08 Jan 2025 20:14:07 +0000,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > Hey Will,
> > 
> > On Wed, Jan 08, 2025 at 12:38:41PM +0000, Will Deacon wrote:
> > > What's your plan for this series? I started looking at it and I can take
> > > the first four apple_m1 patches if you like?
> > 
> > I plan on posting a respin of it by next week, which should look pretty
> > much the same besides cleaning up the build error I introduced :)
> > 
> > Besides that, I think we need to decide on the KVM side of things
> > whether or not we want to support an event counter in addition to the
> > PMU cycle counter. Janne's FEX use case would certainly benefit from it.
> 
> I think we should always be able to support *one* counter on top of
> the cycle counter. Doing more than that would result in inconsistent
> behaviours (some events only count on a single counter).
> 
> Unless we restrict ourselves to a very small set of events that we can
> always schedule on any counter, but this doesn't sound very promising.

I definitely agree that a single event counter is the way to go. Dealing
with this IMPDEF crud is gross already, and coping with event affinities
would only make it worse.

I was more wanting to test the idea that we want programmable event
counters at all, although it isn't that much of a burden on top of the
cycle counter.

I'll un-RFC the tail of the series in v2 then.

-- 
Thanks,
Oliver

