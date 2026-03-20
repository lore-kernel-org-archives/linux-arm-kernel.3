Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B691108B8F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 11:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGDefxZ5QwmKyWmVOeCNJHElQsdaA4FPjy6SGsoLJaw=; b=SAue/fgb5VE2szUH8w6U6pSXHx
	JdemTk4ZcSCDPX3fZ+1PCVcw1/pHlOLJWuxd0qt9wo7zw0ItbEpK6fQWrzlaGECqV0WwvbkaKbi3N
	KvBiDNQufoLcMJ5aC/FzqSlDzwU2Mtulrs2pP34Wwr+9p7ppgGXaNl/TilzHdCCvWEzG7xWKbXzqv
	8JRatsWxsd5uPjnlBapHMG2thNkKjwYAB0nbTTo70TmtRUhacUD3fX7viicsuH7vabyJqsHZHBRW3
	G0oTFOFAelWSr3Z/MDGUolkbmHilX/rWTDM87W52Dte1t0RXGONKVxo4Y+Q0P467ISjlOMT5QXC+v
	PmN55YLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Xko-0000000Cg1V-1101;
	Fri, 20 Mar 2026 11:10:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Xkm-0000000Cg1L-3xXU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 11:10:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD3AD60121;
	Fri, 20 Mar 2026 11:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF24C4CEF7;
	Fri, 20 Mar 2026 11:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774005054;
	bh=+y+avXhMzYG0CBSofwymbat0oAWsHpSMzB8CErtsq08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aP54ksD2KLlfd/RAHI2AlfY5DDKcULhMSgnNeFgDLAuwJx7SxqNxPraPv2X2MMTBS
	 +CC7wsCzXIBwShmRmAorCvj/8C6UbvJbpqJ+iCTuaszJvi/mRBbZx8v0gi96MH8XSu
	 twIN9Vk20aRzFC1xs42ApKcy62aTfeRTbCCTzkiCEndOJfHNrtKomwT+6WZeYymBkD
	 EYpekVGyJCkqsZ9YzJ2sAUakSZbWoCwbZhnkbFgmUoTVSN+XTDFHIkAYiyGn3s/CZp
	 sl9KFu4/A4WkCOO7uOdWHVrv+JdC/KzsQ0hA/cPldiPc0WIEowDCwEnUEU3iEPfHqf
	 zCs77tai9JULg==
Date: Fri, 20 Mar 2026 11:10:50 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: suspend: Remove forcing error from suspend
 finisher
Message-ID: <20260320-spirited-gentle-swift-86f50e@sudeepholla>
References: <20260316-suspend_ret-v1-1-1a30b110bb7d@oss.qualcomm.com>
 <20260319-tiny-coucal-of-tranquility-ce0bd4@sudeepholla>
 <20260319-ruddy-fierce-honeybee-8fc7b9@sudeepholla>
 <ab0dtAC+bPtc9gdT@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab0dtAC+bPtc9gdT@lpieralisi>
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

On Fri, Mar 20, 2026 at 11:13:08AM +0100, Lorenzo Pieralisi wrote:
> On Thu, Mar 19, 2026 at 04:52:18PM +0000, Sudeep Holla wrote:
> > On Thu, Mar 19, 2026 at 03:14:01PM +0000, Sudeep Holla wrote:
> > > On Mon, Mar 16, 2026 at 02:18:18PM +0530, Maulik Shah wrote:
> > > > Successful cpu_suspend() may not always want to return to cpu_resume() to
> > > > save the work and latency involved.
> > > > 
> > > > consider a scenario,
> > > > 
> > > > when single physical CPU (pCPU) is used on different virtual machines (VMs)
> > > > as virtual CPUs (vCPUs). VM-x's vCPU can request a powerdown state after
> > > > saving the context by invoking __cpu_suspend_enter() whereas VM-y's vCPU is
> > > > requesting a shallower than powerdown state. The hypervisor aggregates to a
> > > > non powerdown state for pCPU. A wakeup event for VM-x's vCPU may want to
> > > > resume the execution at the same place instead of jumping to cpu_resume()
> > > > as the HW never reached till powerdown state which would have lost the
> > > > context.
> > > > 
> > > 
> > > Though I don't fully understand the intention/use-case for presenting the
> > > VMs with powerdown states ....
> > > 
> > > > While the vCPU of VM-x had latency impact of saving the context in suspend
> > > > entry path but having the return to same place saves the latency to restore
> > > > the context in resume path.
> > > > 
> > > 
> > > I understand the exit-latency aspect, though the register set involved is not
> > > very large unless the driver notifier list is sizable on some platforms. This
> > > is typically the case in Platform Coordinated mode.
> > > 
> > > > consider another scenario,
> > > > 
> > > > Newer CPUs include a feature called “powerdown abandon”. The feature is
> > > > based on the observation that events like GIC wakeups have a high
> > > > likelihood of happening while the CPU is in the middle of its powerdown
> > > > sequence (at wfi). Older CPUs will powerdown and immediately power back
> > > > up when this happens. The newer CPUs will “give up” mid way through if
> > > > no context has been lost yet. This is possible as the powerdown operation
> > > > is lengthy and a large part of it does not lose context [1].
> > > > 
> > > 
> > > When you say "large part" above, do you mean that none of the CPU context, as
> > > visible to software, is lost? Otherwise, we would need to discuss that "large
> > > part" in more detail. From the kernel point of view, this is a simple boolean:
> > > context is either lost or retained. Anything in between is not valid, as we do
> > > not support partial context loss.
> > > 
> > > > As the wakeup arrived after SW powerdown is done but before HW is fully
> > > > powered down. From SW view this is still a successful entry to suspend
> > > > and since the HW did not loose the context there is no reason to return at
> > > > entry address cpu_resume() to restore the context.
> > > > 
> > > 
> > > Yes, that may be worth considering from an optimization perspective. However,
> > > if the hardware aborts the transition, then returning success regardless of the
> > > software state should still be counted as a failure. That would keep the
> > > cpuidle entry statistics more accurate than returning success. And it is
> > > a failure as the OS expected to enter that powerdown state but there was
> > > as H/W abort.
> > > 
> > > > Remove forcing the failure at kernel if the execution does not resume at
> > > > cpu_resume() as kernel has no reason to treat such returns as failures
> > > > when the firmware has already filled in return as success.
> > > > 
> > > 
> > > This is not possible with the current PSCI spec:
> > > "Powerdown states do not return on success because restart is through the
> > > entry point address at wakeup."
> > > 
> > 
> > OK, my bad. Sorry for that.
> > For some reason, I read "do not return" as "must not return".
> > 
> > The spec allows this:
> >   |  The caller must not assume that a powerdown request will return using the
> >   |  specified entry point address. The powerdown request might not complete due,
> >   |  for example, to pending interrupts. It is also possible that, because of
> >   |  coordination with other cores, the actual state entered is shallower
> >   |  than the one requested. Because of this it is possible for an
> >   |  implementation to downgrade the powerdown state request to a standby
> >   |  state. In the case of a downgrade to standby, the implementation
> >   |  returns at the instruction following the PSCI call, at the Exception
> >   |  level of the caller, instead of returning by the specified entry point
> >   |  address. The return code in this case is SUCCESS. In the case of an
> >   |  early return due to a pending wakeup event, the implementation can
> >   |  return at the next instruction, with a return code of SUCCESS, or
> >   |  resume at the specified entry point address
> > 
> > So we need to dig and check if there was any reason for returning "NOT
> > SUPPORTED" when the call returned success.
> 
> Because we have no clue whatsoever about what happened. We need to get
> back to the cpu_suspend() caller and either say "we entered state X instead
> of Y" or report a failure (because an interrupted power down sequence *is* a
> failure for Linux - unless we want to make things up), we just can't know so
> to me the code seems good as it is (we can debate about the error code, yes
> but the gist does not change).
>

Completely agreed. The current code clearly survives a successful return, so,
in my opinion, nothing is broken. It is really just a matter of exploring
whether there is a better way to express this error condition. I doubt that is
possible, since it is either success or error; it cannot be both.

Just to clarify, my earlier comment was purely about the error code, not about
success versus error.

> Is that we want to tell CPUidle that entering the state was successful even if
> the power down sequence was interrupted or the state demoted ?

That sounds like the ask to me, but that would be incorrect.

> That's tantamount to lying IMO and would skew the power stats, no ?
>

Yes, I agree.

> Let me know, I am just trying to understand this patch's goal.
>

I will let Maulik present his opinion, as I am aligned with you, Lorenzo.

-- 
Regards,
Sudeep

