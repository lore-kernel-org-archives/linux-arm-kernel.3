Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6709DD3B9B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktkZP1TSM5O+zshk14R/JTKvbWeVU6I7FikTokHf+NY=; b=CV5fYbC2hSAye0xwrGw8T5lFGU
	whPAK1winndX+K3OyJCNT+qQmJknSw/Fe+3j7FjxtjxHGlKjQkx0u6pSwEQlEAJBRZbexJXIEQ7EZ
	D6Ves894BIEFdOBKu0h/4DtJuEqhwC+YRDalrl7C1jX3eRaDYG0J93zo48p0Is3nkuCGizqJnyHTU
	wAd4SPrgw2o6gCcQK0bmxbBs9ciqHbNg1vPklSfFbmTh8V/rZTDeQ4GF7/fPP96CPiX/f+h/EmY5T
	xWoagLcuXd1L0dWC2V4tZNGZnBaO89O2ah/jlrL6WwtE3uugedymXEYOIz7G961Y1635+YdoDLFmv
	Brw1W1CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFyMu-0000000B9Rc-3tRf;
	Tue, 26 Nov 2024 16:24:52 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFyLv-0000000B9Fi-0EA3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 16:23:52 +0000
Date: Tue, 26 Nov 2024 08:23:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732638228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ktkZP1TSM5O+zshk14R/JTKvbWeVU6I7FikTokHf+NY=;
	b=fri7R9nF5gcARbgDooMqc2jGmEtlLuIBMa4n4Ih2zWgLKiu6Pw1kDhVs5mZTc6/0tKnP7F
	DkqycMW+TIz69cMh7xP1ngCKed5fXxO0nlSsd+RzkreovFRHVJz9h1oTQMPXsmbI7IFGAg
	LU/zSULINIm1hEoxLR9LxNaBEzStJBk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: James Clark <james.clark@linaro.org>
Cc: suzuki.poulose@arm.com, coresight@lists.linaro.org,
	kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shiqi Liu <shiqiliu@hust.edu.cn>, Fuad Tabba <tabba@google.com>,
	James Morse <james.morse@arm.com>, Mark Brown <broonie@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 11/12] KVM: arm64: Swap TRFCR on guest switch
Message-ID: <Z0X2BBBaDejFfATp@linux.dev>
References: <20241112103717.589952-1-james.clark@linaro.org>
 <20241112103717.589952-12-james.clark@linaro.org>
 <Zz4c5LmQnK2SD5HO@linux.dev>
 <5f2eb0fa-c7ca-4e25-b713-6a9bf3d355b9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f2eb0fa-c7ca-4e25-b713-6a9bf3d355b9@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_082351_442340_61020CD0 
X-CRM114-Status: GOOD (  36.59  )
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

On Thu, Nov 21, 2024 at 12:50:10PM +0000, James Clark wrote:
> 
> 
> On 20/11/2024 5:31 pm, Oliver Upton wrote:
> > On Tue, Nov 12, 2024 at 10:37:10AM +0000, James Clark wrote:
> > > +void kvm_set_trfcr(u64 host_trfcr, u64 guest_trfcr)
> > > +{
> > > +	if (kvm_arm_skip_trace_state())
> > > +		return;
> > > +
> > > +	if (has_vhe())
> > > +		write_sysreg_s(guest_trfcr, SYS_TRFCR_EL12);
> > > +	else
> > > +		if (host_trfcr != guest_trfcr) {
> > > +			*host_data_ptr(host_debug_state.trfcr_el1) = guest_trfcr;
> > 
> > Huh? That's going into host_debug_state, which is the dumping grounds
> > for *host* context when entering a guest.
> > 
> > Not sure why we'd stick a *guest* value in there...
> > 
> 
> Only to save a 3rd storage place for trfcr when just the register and one
> place is technically enough. But yes if it's more readable to have
> guest_trfcr_el1 separately then that makes sense.

Yeah, since this is all per-cpu data at this point rather than per-vCPU,
it isn't the end of the world to use a few extra bytes.

> That works, it would be nice to have it consistent and have it that way for
> filtering, like kvm_set_guest_trace_filters(bool kernel, bool user). But I
> suppose we can justify not doing it there because we're not really
> interpreting the TRFCR value just writing it whole.

Agreed, the biggest thing I'd want to see in the exported interfaces
like this is to have enable/disable helpers to tell KVM when a driver
wants KVM to start/stop managing a piece of state while in a guest.

Then the hypervisor code can blindly save/restore some opaque values to
whatever registers it needs to update.

> > What if trace is disabled in the guest or in the host? Do we need to
> > synchronize when transitioning from an enabled -> disabled state like we
> > do today?
> > 
> 
> By synchronize do you mean the tsb_csync()? I can only see it being
> necessary for the TRBE case because then writing to the buffer is fatal.
> Without TRBE the trace sinks still work and the boundary of when exactly
> tracing is disabled in the kernel isn't critical.

Ack, I had the blinders on that we cared only about TRBE here.

> > I took a stab at this, completely untested of course && punts on
> > protected mode. But this is _generally_ how I'd like to see everything
> > fit together.
> > 
> 
> Would you expect to see the protected mode stuff ignored if I sent another
> version more like yours below? Or was that just skipped to keep the example
> shorter?

Skipped since I slapped this together in a hurry.

> I think I'm a bit uncertain on that one because removing HAS_TRBE means you
> can't check if TRBE is enabled or not in protected mode and it will go wrong
> if it is.

The protected mode hypervisor will need two bits of information.
Detecting that the feature is present can be done in the kernel so long
as the corresponding static key / cpucap is toggled before we drop
privileges.

Whether or not it is programmable + enabled is a decision that must be
made by observing hardware state from the hypervisor before entering a
guest.

[...]

> > +void kvm_enable_trbe(u64 guest_trfcr)
> > +{
> > +	if (WARN_ON_ONCE(preemptible()))
> > +		return;
> > +
> > +	if (has_vhe()) {
> > +		write_sysreg_s(guest_trfcr, SYS_TRFCR_EL12);
> > +		return;
> > +	}
> > +
> > +	*host_data_ptr(guest_trfcr_el1) = guest_trfcr;
> > +	host_data_set_flag(HOST_TRBE_ENABLED);
> 
> FWIW TRBE and TRF are separate features, so this wouldn't do the filtering
> correctly if TRBE wasn't in use, but I can split it out into
> separate kvm_enable_trbe(void) and kvm_set_guest_filters(u64 guest_trfcr).

KVM manages the same piece of state (TRFCR_EL1) either way though right?

The expectation I had is that KVM is informed any time a trace session
(TRBE or otherwise) is enabled/disabled on a CPU, likely with a TRFCR_EL1
of 0 if guest mode is excluded.

The function names might need massaging, but I was hoping to have a
single set of enable/disable knobs to cover all bases here.

-- 
Thanks,
Oliver

