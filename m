Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB974C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10nX1b+G8pVGnqE7UcWxwsl7ZijLx8E8+z9Eqx9Iw68=; b=I0K3t3LJ5j8MUtSqlhFQ3Vsq5S
	Y2o2qzGAgLfpsdhmMGG9vjopn1zL7msqFPE1L7mq1zIan5foTTo5bfOIUpjsFpTwy8USIVTAu3yrI
	GrpdNt4iMyHIoUu898z4/z/rlLnjFL/gah11MAFbAf5xpXqOsJkSWiGdNZHfKNG5lUfGNg9t9bFPA
	yQgAygSGtqyTSlkhOBuW/qVWyQwmz5f5f90gNUBqLoh1bHjToWaldbbiy3kDwoi2yJqmV0rrJR3g6
	g25RT7kZ8AdgEgvyZZdIzIqRS4TBZafWcmyEUB1HSfO2zm/Dox8WbzwWHfu1Ya5MF3emz31HPRq1l
	G2EBTM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIfO-0000000DfwM-0Hjq;
	Thu, 19 Jun 2025 17:03:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGN9-0000000DIFa-1SUw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 14:36:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25747113E;
	Thu, 19 Jun 2025 07:35:50 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 243363F66E;
	Thu, 19 Jun 2025 07:36:06 -0700 (PDT)
Date: Thu, 19 Jun 2025 15:36:04 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Koichi Okuno <fj2767dz@fujitsu.com>, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
Message-ID: <aFQgVPRvbrfcUrkY@J2N7QTR9R3>
References: <20250617102819.3685543-1-fj2767dz@fujitsu.com>
 <20250617102819.3685543-3-fj2767dz@fujitsu.com>
 <20250617103618.GT1613376@noisy.programming.kicks-ass.net>
 <aFQXU5rK_HJE9zq0@J2N7QTR9R3>
 <20250619140442.GH1613376@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619140442.GH1613376@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_073611_470302_2A2653C4 
X-CRM114-Status: GOOD (  19.96  )
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

On Thu, Jun 19, 2025 at 04:04:42PM +0200, Peter Zijlstra wrote:
> On Thu, Jun 19, 2025 at 02:57:55PM +0100, Mark Rutland wrote:
> > On Tue, Jun 17, 2025 at 12:36:18PM +0200, Peter Zijlstra wrote:
> > > On Tue, Jun 17, 2025 at 07:27:50PM +0900, Koichi Okuno wrote:
> > > > +	pcipmu->pmu = (struct pmu) {
> > > > +		.parent		= dev,
> > > > +		.task_ctx_nr	= perf_invalid_context,
> > > > +
> > > > +		.pmu_enable	= fujitsu_pci__pmu_enable,
> > > > +		.pmu_disable	= fujitsu_pci__pmu_disable,
> > > > +		.event_init	= fujitsu_pci__event_init,
> > > > +		.add		= fujitsu_pci__event_add,
> > > > +		.del		= fujitsu_pci__event_del,
> > > > +		.start		= fujitsu_pci__event_start,
> > > > +		.stop		= fujitsu_pci__event_stop,
> > > > +		.read		= fujitsu_pci__event_read,
> > > > +
> > > > +		.attr_groups	= fujitsu_pci_pmu_attr_grps,
> > > > +		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
> > > 
> > > Should these drivers not also have PERF_PMU_CAP_NO_INTERRUPT ? Per them
> > > being uncore they cannot generate samples.
> > 
> > These PMUs actually have an interrupt, so that might be a bit confusing.
> > That said, the counters seem to be 64-bit, so the interrupt doesn't seem
> > practically necessary today.
> 
> Yeah, I saw they had an interrupt. But them being uncore they must not
> sample, and NO_INTERRUPT means not being able to sample.
> 
> Naming urgh :-)

Yeah :)

FWIW, that came to mind due to:

  https://lore.kernel.org/lkml/20250618-perf-pmu-cap-docs-v1-1-0d34387d6e47@collabora.com/

... and if NO_INTERRUPT would be better-named as NO_SAMPLING, that might
be a good opportunity to clean that up.

> > Either way, the fujitsu_pci__event_init() function rejects sampling
> > events, so it correctly rejects sampling events.
> > 
> > IMO, it'd be a bit nicer to do the inverse, and have the perf core
> > reject sampling events by default for non-CPU PMUs.
> 
> Yeah, there's lots of cleanup to be done. Quite possibly also some
> unification between the various drivers.
> 
> Just need someone that knows what they're doing that has spare time,
> know anybody like that? :-)

I think a few folk likle that live in the nearest hall of mirrors...

If you're happy with that in concept, I can see about getting someone to
look at that -- the general idea has come up a few times.

Mark.

