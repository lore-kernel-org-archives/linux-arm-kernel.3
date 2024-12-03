Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE32BE77161
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 22:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hW6mNNVP48/Mj7mfy3CFRZP/i3VCK2OWGnyJMzSgKV8=; b=zN/zktw9KllF36noF8H+lM70xS
	PhnuSzq4XBv3zamxVPfS3YFObcYXX+zEqRL9QGyBXfHuC/8tjuCGJNreFQm0ax1UsElrwXBh6PEmb
	ilYo+AjXBAO0aZDb9uKwWl84jGvD5Mg0DHzjaG2Ay0GY6h2cZR9Y1irxNJoctJVGczydqJZ313V4W
	729JntwtVAb8XbXtzAXChNgYNfMUhnmoj3G/JviEuu7tWKCyFWP9pSbOvKTHgdovx0Vx9bife7jQp
	/SUT7/Vqhun60EOJTuspcFPDFoMLNtxg7GScaoc3SrHzk0iS2igONpiTL4e4Ob781sua5EAnmg0lm
	nnYhtULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbSt-0000000AvpQ-1p4v;
	Tue, 03 Dec 2024 22:33:55 +0000
Received: from out-185.mta1.migadu.com ([2001:41d0:203:375::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbRs-0000000Avff-2ADL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 22:32:54 +0000
Date: Tue, 3 Dec 2024 14:32:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733265168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hW6mNNVP48/Mj7mfy3CFRZP/i3VCK2OWGnyJMzSgKV8=;
	b=lKeUpq1HixcYGhKHPIjBx5QNSGodFFQIQucOMLyelNmPqr3SCb6YdppIiid4Fl1hXAcTEX
	paJ1KXPjqk2uMXzF/3ifnchnBBeUQUhezqTLsRyfaCJIEhd+DDnQOw8HBeLP7nZTCdH73E
	mxQwVWdcMoCujqQhOH+fthdwYpPQL5k=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 05/14] KVM: arm64: Always allow fixed cycle counter
Message-ID: <Z0-HBsBgf6WB7x4R@linux.dev>
References: <20241203193220.1070811-1-oliver.upton@linux.dev>
 <20241203193220.1070811-6-oliver.upton@linux.dev>
 <87ldwwsbad.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldwwsbad.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_143252_831962_7BBC7E82 
X-CRM114-Status: GOOD (  14.66  )
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

On Tue, Dec 03, 2024 at 09:32:10PM +0000, Marc Zyngier wrote:
> On Tue, 03 Dec 2024 19:32:11 +0000,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > The fixed CPU cycle counter is mandatory for PMUv3, so it doesn't make a
> > lot of sense allowing userspace to filter it. Only apply the PMU event
> > filter to *programmed* event counters.
> 
> But that's a change in ABI, isn't it? We explicitly say in the
> documentation that the cycle counter can be filtered by specifying
> event 0x11.

Yeah... A bit of a dirty shortcut I took because I don't like the ABI,
but distaste isn't enough to break it :)

> More importantly, the current filtering works in terms of events, and
> not in terms of counters.
> 
> Instead of changing the ABI, how about simply not supporting filtering
> on such non-compliant HW? Surely that would simplify a few things.

Yeah, that sounds reasonable. Especially if we allow programmable event
counters where the event ID space doesn't match the architecture.

-- 
Thanks,
Oliver

