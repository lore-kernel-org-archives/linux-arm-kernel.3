Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913A6CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 18:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQaVBBzUZkCmBZPymf0rd/3Xlb0DfPX14p5A0ZE2QAM=; b=kX1QoSPvMg6Fd6/OlJfF6uE4lP
	6i7ReoaWRjGR7kxcAPTSYqLEidIgSG2lNJs0PGhfchI61d7oVEwt4dfxB75iBPcD2hdEKaGPF1si/
	SlcpKk4YGaT05OR3KN2uxKv4hvvU8jwXC+QZSQgLIMvyRVp3a/XVp6gPkEiv8fdKHvkH2gq9MfKur
	Nv9MGicaYID9KaWOdmyFLpO7F3DKI+Muf9LpNGK7frDyglG97NQW7eo/LQErvi+9DmSeAdZpasL92
	QEPMIOREEorWMTEMDqfGYNcA0QVehtRi4XMlkLXIpHq3nvNp2Qe1WnTdYJRHTMwGrnO81vsBSssCd
	qbw+/K5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgKE-0000000C3uI-3HLD;
	Fri, 02 Oct 2026 16:41:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgKC-0000000C3tt-37zs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 16:41:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D630C1476;
	Fri,  2 Oct 2026 09:41:27 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EC943F86F;
	Fri,  2 Oct 2026 09:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790959291; bh=VswTKosr4+CIPNkf4Cim6yES97oV1guMS+tLxqNuPIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WV6uCLcNITRHBmckvczxE8IpoHmahqcBQSdAXesNVir5OZ8RKGBUqo1A+ctrKjDRW
	 1u8rzLZ6hc9RIv6fbyw/e6gBr4qSOj5O3nhHxt9b4kLhuzTuy/CWBdQFYBKEdqlwro
	 vqGhSJi4NDsSbQSlHpSR6DLWBTUuFiL1yqJZCdNw=
Date: Fri, 2 Oct 2026 17:41:27 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Rodolfo Giometti <giometti@enneenne.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Optimise ktime_get_snapshot_id() for capture latency
Message-ID: <ar_et83fB9sI16Zi@J2N7QTR9R3.cambridge.arm.com>
References: <20261002151938.69857-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002151938.69857-1-dwmw2@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_094132_821947_FD02620A 
X-CRM114-Status: GOOD (  20.49  )
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

On Fri, Oct 02, 2026 at 04:19:36PM +0100, David Woodhouse wrote:
> Commit 2e27beeb66e4 ("timekeeping: Allow inlining clocksource::read()")
> allows an architecture's primary implementation of clocksource::read()
> to be inlined, apparently because the out-of-line function calls get
> expensive on x86 with certain speculation mitigations. Use the inline
> read in tk_clock_read_snapshot(), and wire it up for arm64 too.
> 
> Also bias the clock_id switch() in ktime_get_snapshot_id() for the
> likely() case of CLOCK_REALTIME.
> 
> Measured on a Cortex-A53 at 1.35GHz (12.5MHz arch counter), with
> inlined clocksource reads enabled: the interval from a raw counter
> read in the caller to the counter read in ktime_get_snapshot_id()
> drops from 49.9ns to 41.2ns with the inline read, and to 38.8ns with
> the dispatch bias, mean of 1M iterations.
> 
> This is unashamedly a microbenchmark but it actually captures a real
> world use case: The time it takes for ktime_get_snapshot_id() to read
> the counter is critical to some users, especially 1PPS signal
> capture. Every nanosecond helps, and for the inline clocksource read,
> the actually *complex* part is already in place; this is just using
> the infrastructure that's already there.

When I mentioned this on IRC, my complaint about complexity wasn't about
the core code, My conern was with the subtle interactions *within* the
timer driver, and between the timer driver and arch code.

I don't think it's fair to say that the core code is the singular
complex part.

Does this show up on any top-level workload, or is the benefit purely
limited to microbenchmarks and timer synchronization?

Mark.

