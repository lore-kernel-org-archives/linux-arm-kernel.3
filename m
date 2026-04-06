Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6271E9D836
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 13:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntALtiS+qF1sJX7H2hdG3h61UJEWuvU1SPdmOVIdw08=; b=JIJ0jUu6sKk8kzPLvjl5jQ5WjM
	eFrqS9scUXIDKetx5cqk9sr6cMSOfXYFh+HTDycAypX9YRm9U9tdF4Tt+bYvD43SWemPkurdslZgx
	lQTDxA5CytbsPrEw35WDMem4h9RDsHeNM0yznNTkDhe4iCP4vNKq2o62XMnIGR/6GNXiP6UwBmVxA
	hYKR2sCo83r0WGqIIRGHPwFxf7MBX1efymS+b/4nFIa/9QL4wjT/WOnjoIgvUd4blxY8xPifFSbr5
	liqfXciMlLeDbX5SYDfrWov8N592Pz2/pVisHX49yOIKPMmwl2e/7zpjiOw6/DMnCTBku+IoiKuzF
	4TIw1BKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9kJv-00000005A8m-4BGZ;
	Mon, 06 Apr 2026 13:48:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9kJu-00000005A8f-0XkA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 13:48:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C85260123;
	Mon,  6 Apr 2026 13:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6931C4CEF7;
	Mon,  6 Apr 2026 13:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775483328;
	bh=4KAv/Y/r6B3QPbmOZXoUcCmGpPGusPnReZahnIGGELs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G6sTwJNDpDYZ037U4XfiYJjufNITO/f28GJg3G6pfaK6fcZpwKHKUvT3Is4uXqY6Y
	 4Bo5riiGZeRrKksE9xsTqcz+H3ydjdNnRVdSMlL3dgWTo0yUvJIgm5kuehx65HOSum
	 zlntl0U/JtgB5z3ThAZqHoKXQbeFJla1C0IFu1vGxy1LeiQSmKeOxz+EEhHz6SZay4
	 i9aP3kjTLmjBP1fztmkT/igt6MllIUT/jHsFEnayq759304m9LJHzAXozoNhU/M8aJ
	 JZgTdmJOqPcIUQUglZocFcpI8CqH8ByCXmTolpqYXRREfFGnu58bQ3s7RjvRqVAyiA
	 e8pKR/h7aOo4w==
Date: Mon, 6 Apr 2026 08:48:44 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	mark.rutland@arm.com, lpieralisi@kernel.org, bjorn.andersson@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
Message-ID: <adO1lS2g8Hewj0Ol@baldur>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
 <acrdFfk8al80dynq@baldur>
 <ces6pczk5yo2v5h6sga2dl2xuncqv4pmudunc7dhyeiy6swfh7@bk7vxdxrsrzz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ces6pczk5yo2v5h6sga2dl2xuncqv4pmudunc7dhyeiy6swfh7@bk7vxdxrsrzz>
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

On Tue, Mar 31, 2026 at 12:09:38PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Mar 30, 2026 at 03:48:05PM -0500, Bjorn Andersson wrote:
> > On Wed, Dec 31, 2025 at 09:51:26PM +0530, Manivannan Sadhasivam wrote:
> > > From: Konrad Dybcio <konradybcio@kernel.org>
> > > 
> > > PSCI specification defines the SYSTEM_SUSPEND feature which enables the
> > > firmware to implement the suspend to RAM (S2RAM) functionality by
> > > transitioning the system to a deeper low power state. When the system
> > > enters such state, the power to the peripheral devices might be removed.
> > 
> > What is the actual extent of "peripheral devices" in this definition?
> > 
> 
> All devices except the ones backing volatile memory (DDR).
> 

I do not agree that this should be the interpretation on a Qualcomm
platform.


We do have the corner case of DeepSleep, where this indeed is what will
happen (not sure if other resource votes in the system are ignored
though?). For all typical targets making the PSCI jump might result in
CX being turned off (unless something else votes for it...). 

State is still retained on a case-by-case basis and some parts of the
system are still functional when we enter such state - and that is the
system state we desire.

Making the interpretation that all SoC resources will be disabled will
result in a large amount of unnecessary save/restore work, in addition
to breaking many use cases.

I do however not think that such interpretation is necessary, the
pm_suspend_via_firmware() kernel-doc describes that the firmware might
perform actions to power down things, it isn't specific about the
extent, so I think that's fine - while equating this to DeepSleep (SoC
fully powered down) is too extreme.


What bothers me with this patch in itself is that the behavior in
relation to PCIe does match the description of pm_suspend_via_firmware()
- the firmware does things which causes PCIe to "break", but IMHO this
is merely because PCIe operates without voting for the resources that it
depends on. But you keep telling me that this can't be solved in the PCI
layer...

If we can agree that pm_suspend_via_firmware() relates to the state of
CX - and merely the implicit PCSI-owned vote thereof - then I think we
should merge this patch.


But regardless of this interpretation. If PCI/NVMe relies on the PSCI
implementation's implicit vote for CX and its absence breaks NVMe during
suspend, then we're faced with exactly the same problem if the user
chooses s2idle as their means of suspending the system.

I.e. on a Qualcomm platform, we should flag PM_SUSPEND_FLAG_FW_SUSPEND
in s2idle as well - because from PCI/NVMe's point of view, the relevant
resources will be gone in either configuration.

Regards,
Bjorn

> > > So
> > > the respective device drivers must prepare for the possible removal of the
> > > power by performing actions such as shutting down or resetting the device
> > > in their system suspend callbacks.
> > > 
> > 
> > Our typical interpretation of this state is that IP-blocks might be
> > non-functional during this time, but typically some state is retained.
> > 
> > Will the acceptance of this patch result in that we in the Qualcomm case
> > should start accepting/writing patches that implement save/restore of
> > state that is generally retained throughout the drivers - in the name of
> > "power might be removed"?
> > 
> 
> From the PSCI spec perspective, the underlying implementation of the
> SYSTEM_SUSPEND is implementation defined. So whether the vendor firmware retains
> the state or drops it completely, is out of the scope for PSCI. That's why
> *assuming* that the devices will loose power is the best possible approach.
> 
> For sure, assuming that the power will be lost always will result in some
> overhead with drivers saving and restoring the context unnecessarily if the
> power if retained. But I can't think of any other way to make the driver work
> across all firmware implementations.
> 
> > > The Linux PM framework allows the platform drivers to convey this info to
> > > device drivers by calling the pm_set_suspend_via_firmware() and
> > > pm_set_resume_via_firmware() APIs.
> > > 
> > > Hence, if the PSCI firmware supports SYSTEM_SUSPEND feature, call the above
> > > mentioned APIs in the psci_system_suspend_begin() and
> > > psci_system_suspend_enter() callbacks.
> > > 
> > 
> > With the right interpretation of what this means for us, I think this
> > patch looks good - but as we've discussed, I'm a bit worried about how
> > to deal with the alternative interpretations.
> > 
> 
> Just for the sake of clarity to others, 'alternative interpretations' is
> referring to Qcom DeepSleep firmware implementation, which cuts power to almost
> all components except DDR with no wakeup source other than PMIC.
> 
> > Specifically, if we fully adopt "power might be removed", we should to
> > take actions which will prevent a typical Qualcomm system from waking up
> > from sleep again.
> > 
> 
> I think for wakeup, the driver should just save the device context and call
> enable_irq_wake() if the user has configured the device as a wakeup source and
> assume that the device will wakeup the system from suspend/sleep.
> 
> The underlying firmware should honor the wakeup and not cut the power to the
> devices. But if it does, then wakeup will be broken anyway.
> 
> So from Qcom drivers perspective:
> 
> 1. They should save and restore the context if those drivers are going to be
> used in both PSCI SYSTEM_SUSPEND (power retained) and DeepSleep (power lost)
> firmware implementations.
> 
> 2. If the user has configured wakeup, they should enable wakeup using
> enable_irq_wake() during suspend. On PSCI SYSTEM_SUSPEND implementations, wakeup
> should just work, but on DeepSleep, it may not if the power is cut off
> completely. But that's the limitation on those platforms and the OS policy
> should ensure that wakeup is not configured for devices.
>  
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

