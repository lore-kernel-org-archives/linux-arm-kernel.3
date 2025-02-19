Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AF6C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 19:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWbTsmkFNVzUKGQASgjUS1od0uhjMSBLNuVdbUo2uHQ=; b=g5M9xso3JBVSCG2cDfkrfOY12z
	SfcQNF+WrHIK9nXSTKoDb0RYpGxRkM3FEzS6YCUv0R5XnsvAPv/v8Q2Rs6WieeKlPS8UcyxbRj8Sr
	RypQ/RbxMN85jQUHvUwhubp8cRq1FdDAVwaSjb6lySlN68g4+943s27jw1sM0Rqw9rRwyp4/z53sf
	6jhUvoAYk6u84VZ/4Xt0zjgbOJ0XKJwfkAXMTUHIFTZFhUZ7ssiMdvdXtz2KdYJKMX5yHJuBKPxe0
	X4yP5qrAxLgbaghLBZEx3yEYsqdwvnI5t9o4BeZGVczMj+k7+mdKOf/mMx17ip96O64B2CkWjOV/W
	jWpyxsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpz6-0000000Ei7d-41SX;
	Wed, 19 Feb 2025 19:43:52 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkph5-0000000EbvA-2ElP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 19:25:16 +0000
Date: Wed, 19 Feb 2025 11:25:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739993112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YWbTsmkFNVzUKGQASgjUS1od0uhjMSBLNuVdbUo2uHQ=;
	b=HAo43khA9DU1uLsdSMUg9nTVrQVQR5iWPGhSRHK2Wp8bg/ugmPa8asiQlOuuhyqh54C2El
	P0Ec3ptzNRyg2MaUQjrQu3nWUclL3MWyd0WopanhROR742V2qiKu4g9fHcKmpvzW/7fYJq
	QFG4ENuIdGD3oxElJek7m3LHNJSXlG0=
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
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2 06/14] KVM: arm64: Remap PMUv3 events onto hardware
Message-ID: <Z7YwEptbRnX5s9Fw@linux.dev>
References: <20250203183111.191519-1-oliver.upton@linux.dev>
 <20250203183111.191519-7-oliver.upton@linux.dev>
 <865xl5sx20.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865xl5sx20.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_112515_715473_6E12166C 
X-CRM114-Status: GOOD (  24.32  )
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

On Wed, Feb 19, 2025 at 04:45:27PM +0000, Marc Zyngier wrote:
> On Mon, 03 Feb 2025 18:31:03 +0000,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > Use the provided helper to map PMUv3 event IDs onto hardware, if the
> > driver exposes such a helper. This is expected to be quite rare, and
> > only useful for non-PMUv3 hardware.
> > 
> > Tested-by: Janne Grunau <j@jannau.net>
> > Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> > ---
> >  arch/arm64/kvm/pmu-emul.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> > index 62349b670cf9..60cf973e2af9 100644
> > --- a/arch/arm64/kvm/pmu-emul.c
> > +++ b/arch/arm64/kvm/pmu-emul.c
> > @@ -673,6 +673,18 @@ static bool kvm_pmc_counts_at_el2(struct kvm_pmc *pmc)
> >  	return kvm_pmc_read_evtreg(pmc) & ARMV8_PMU_INCLUDE_EL2;
> >  }
> >  
> > +static u64 kvm_map_pmu_event(struct kvm *kvm, u64 eventsel)
> > +{
> > +	struct arm_pmu *pmu = kvm->arch.arm_pmu;
> > +	int hw_event;
> > +
> > +	if (!pmu->map_pmuv3_event)
> > +		return eventsel;
> > +
> > +	hw_event = pmu->map_pmuv3_event(eventsel);
> > +	return (hw_event < 0) ? eventsel : hw_event;
> 
> I find this a bit odd. If we can translate events, but failed to do
> so, we still install the originally requested event, and we have no
> idea what this maps to on the HW.
> 
> I'd rather we just don't install that event at all rather than
> counting something random.

Heh, this was a leftover party trick that I was using to try "raw"
events from inside a VM. Happy to limit things to the PMUv3 event space
though.

Thanks,
Oliver

