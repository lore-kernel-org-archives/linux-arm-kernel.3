Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC77E6817B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 12:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4X6FnEGsywt6pzYQS/rEIqvfs+4NN5kLaXHZi3YcK4=; b=Re3IBBu5t3E1/DV0hkMQOOYWgB
	KAHyTWBb+Jq9iRh5HKsMYy401qRwiRr+PyOd0xF+FWiDoKVXWBr+9His0MMSrwT8gjXuz1VEPZN0f
	a7A/hK8JfjQgE1Sk5xO157Qj7mBXAwTXhdrX1uLsbPW1AmNfggvuN+X7MnpMcwlLGCvEWZHPQ0NZx
	M5gv/pt1hUYwpFLochZtM2n7CcCjGWLsfPNuWp153YPEuVhUkw+BAZqvx24UmG+T4OpCOYdP4MkKF
	JWhGR1Jj1JX04rYMpk1woS3T7mljWwZ+X8ejP/Lcpz6jNIsskgWxhDCTqgy9a/r1mYnO/1EKJvI6E
	uJc0DoMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJxN-00000008B67-0Cau;
	Tue, 17 Feb 2026 12:13:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJxL-00000008B5q-2pzI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 12:13:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B84BB60128;
	Tue, 17 Feb 2026 12:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677B2C4CEF7;
	Tue, 17 Feb 2026 12:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771330410;
	bh=ZcmdwvD+Ytf9TvbpZjsGSZ51nONOOm22E5FYt3DLyfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJn+hUpU+jV0R3ilaDWttYT5aln5YTQ728AwNAt0nBQXNGeqHu0HGZIxD9Ql1Uh1m
	 57Iy/4YX4aBf5BKFF6ozfVJpX4YL9oq5wkqz6a3OCNPbVd6jk8vr96xaiyQOlTHVC7
	 m7EhutR+0ZqicUYngky1aAJqdMwNxLI0fB0tvIKrmnUPGe/gqHg6FujRkU5gW2MgZC
	 qYeK/68xhadA65dgJljteU6Ahy4J+y3lBdKrcjMAujU1uUc1SJigu6IBBTh/l3Zbpj
	 Z2ziZF/vbFopalBFwLPH20eMR+mZc0tmUTf8IRS3CjY5Lr61QZERmMGg1ssRSqh9JH
	 M7nyzzcnb80dg==
Date: Tue, 17 Feb 2026 12:13:24 +0000
From: Will Deacon <will@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
Message-ID: <aZRbZOT13aT60Z70@willie-the-truck>
References: <20260216130959.19317-1-will@kernel.org>
 <86a4x8bw38.wl-maz@kernel.org>
 <aZM9kv9X5KjeM94j@raptor>
 <aZNPdDAHiLpTvGnS@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZNPdDAHiLpTvGnS@willie-the-truck>
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

On Mon, Feb 16, 2026 at 05:10:17PM +0000, Will Deacon wrote:
> On Mon, Feb 16, 2026 at 03:53:54PM +0000, Alexandru Elisei wrote:
> > Hi,
> > 
> > On Mon, Feb 16, 2026 at 02:29:31PM +0000, Marc Zyngier wrote:
> > > On Mon, 16 Feb 2026 13:09:59 +0000,
> > > Will Deacon <will@kernel.org> wrote:
> > > > 
> > > > The nVHE world-switch code relies on zeroing TRFCR_EL1 to disable trace
> > > > generation in guest context when self-hosted TRBE is in use by the host.
> > > > 
> > > > Per D3.2.1 ("Controls to prohibit trace at Exception levels"), clearing
> > > > TRFCR_EL1 means that trace generation is prohibited at EL1 and EL0 but
> > > > per R_YCHKJ the Trace Buffer Unit will still be enabled if
> > > > TRBLIMITR_EL1.E is set. R_SJFRQ goes on to state that, when enabled, the
> > > > Trace Buffer Unit can perform address translation for the "owning
> > > > exception level" even when it is out of context.
> > > 
> > > Great. So TRBE violates all the principles that we hold true in the
> > > architecture. Does SPE suffer from the same level of brokenness?
> > 
> > I think not currently - I_JZRDG from DDI0487M.a.a says that after a PSB + DSB
> > 'no new memory accesses using the lower Exception level translation table
> > entries occur'.
> > 
> > But looks like the behaviour will be changed so that it will be similar to TRBE,
> > according to the Arm known issues document [1], added in D23136:
> > 
> > 'When the Proﬁling Buﬀer is enabled, proﬁling is not stopped, and Discard mode
> > is not enabled, the Statistical Proﬁling Unit might cause speculative
> > translations for the owning translation regime, including when the owning
> > translation regime is out-of-context'.
> 
> I think SPE is ok, as __debug_save_spe() clears PMSCR_EL1 and (unlike
> TRBE) PMSCR_EL1.ExSPE _are_ factored into whether or not profiling is
> "enabled".
> 
> So there's a funny asymmetry between SPE and TRBE, which I assume is due
> to the coresight much associated with the latter.

Urgh...

Alex and I spoke a bit about this on irc and we think SPE might suffer
from the same problem after all. It just uses different terminology, so
it's not as obvious to shake out from the TRBE example.

With TRBE the problem is that we have:

  * TRFCR_EL1 controls whether or not trace generation is "prohibited"

  * TRBLIMITR controls whether or not the trace buffer unit is "enabled"

With SPE we have:

  * PMSCR_EL1 controls whether or not *profiling* is "enabled"

  * PMBLIMITR controls whether or not the *profiling buffer* is "enabled"

Unlike TRBE, the SPE spec doesn't talk concretely about address
translation but I think it's safest to assume that the profiling buffer
being enabled means that it can translate out of context, similarly to
TRBE.

So we'll need to zap PMBLIMITR as well. I'll cook something for v2 but,
as before, I'm going to struggle to test this (I think SPE got whacked
at EL3 for a bunch of errata on the devices I have).

Will

