Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2C3FF60CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 06:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6hwOQ9gGU76VoNZ6VKOCtuslYMUqq6TQcGYe3FVG7M=; b=QDPgHS/Alftx+INMpK2Nos0lTp
	FwKy8WLNsgnc1mJhqAh5dv1cILevFG3e4S6KnL4uC2Tkw53i/7JdwEics8s3xMVWBoEcBP2ZogLXv
	CQ275KTBC0uUMXrfrIpYmGQWOckk36fixHiUYj1UMJy5rvIdULaQUeXkksjhoecY0aJooqHuNxIgh
	Z2YG8is81hgAB5yIoDFQGnwuQjBP3DgU0dFnW9AK1L+zcv80AFqrOixYKr1cBLcwb69SQWcFJ7D7n
	6Lmb1p+NCU3CfAB9zwq4mxP4Y2KVeIWhRExowTrpNS7DadsvJnvhuBZSgf7r/giRWfTcs1FTwGRUL
	CSbYaymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7SlV-0000000CObP-47JJ;
	Tue, 31 Mar 2026 06:39:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7SlU-0000000COb9-1v4l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 06:39:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E8D8600CB;
	Tue, 31 Mar 2026 06:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EEB8C19423;
	Tue, 31 Mar 2026 06:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774939190;
	bh=oazAeuTA2Rvhj+fbcNcFFIPYHAWRe18CAIkeQipoU8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPug5fcbKrgBK6OBB8/Oq8F4KdAQuFNjtQgdmFwqw3wNSWk2udq8sgHA/kCRA81mx
	 miUTtaae6JjVD0u6h4tD7Z8Z6WRuF8pNQ797BaG90ilW9jr9ure8l7xNMw6MgARd/H
	 KsKw8JhBHEwfF2gqb8WTz4TaGxcze72oS4rkjnOwTpQTzmu7354kx7+rsu4z5ir40X
	 r6RslB/9SNBBPkPjucVcaNSpH4OD3dQZq/w6COdykRP/zuL1jyQ8tibSqK8Tutt8Wg
	 jcT2YCGiLg19JnuvJ5Phuak9FLAwcfGEOPinFYF6Zk+Il8XUKwiE3Ovy78TpH3p/hn
	 3fctfKs1R5BoQ==
Date: Tue, 31 Mar 2026 12:09:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	mark.rutland@arm.com, lpieralisi@kernel.org, bjorn.andersson@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
Message-ID: <ces6pczk5yo2v5h6sga2dl2xuncqv4pmudunc7dhyeiy6swfh7@bk7vxdxrsrzz>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
 <acrdFfk8al80dynq@baldur>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acrdFfk8al80dynq@baldur>
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

On Mon, Mar 30, 2026 at 03:48:05PM -0500, Bjorn Andersson wrote:
> On Wed, Dec 31, 2025 at 09:51:26PM +0530, Manivannan Sadhasivam wrote:
> > From: Konrad Dybcio <konradybcio@kernel.org>
> > 
> > PSCI specification defines the SYSTEM_SUSPEND feature which enables the
> > firmware to implement the suspend to RAM (S2RAM) functionality by
> > transitioning the system to a deeper low power state. When the system
> > enters such state, the power to the peripheral devices might be removed.
> 
> What is the actual extent of "peripheral devices" in this definition?
> 

All devices except the ones backing volatile memory (DDR).

> > So
> > the respective device drivers must prepare for the possible removal of the
> > power by performing actions such as shutting down or resetting the device
> > in their system suspend callbacks.
> > 
> 
> Our typical interpretation of this state is that IP-blocks might be
> non-functional during this time, but typically some state is retained.
> 
> Will the acceptance of this patch result in that we in the Qualcomm case
> should start accepting/writing patches that implement save/restore of
> state that is generally retained throughout the drivers - in the name of
> "power might be removed"?
> 

From the PSCI spec perspective, the underlying implementation of the
SYSTEM_SUSPEND is implementation defined. So whether the vendor firmware retains
the state or drops it completely, is out of the scope for PSCI. That's why
*assuming* that the devices will loose power is the best possible approach.

For sure, assuming that the power will be lost always will result in some
overhead with drivers saving and restoring the context unnecessarily if the
power if retained. But I can't think of any other way to make the driver work
across all firmware implementations.

> > The Linux PM framework allows the platform drivers to convey this info to
> > device drivers by calling the pm_set_suspend_via_firmware() and
> > pm_set_resume_via_firmware() APIs.
> > 
> > Hence, if the PSCI firmware supports SYSTEM_SUSPEND feature, call the above
> > mentioned APIs in the psci_system_suspend_begin() and
> > psci_system_suspend_enter() callbacks.
> > 
> 
> With the right interpretation of what this means for us, I think this
> patch looks good - but as we've discussed, I'm a bit worried about how
> to deal with the alternative interpretations.
> 

Just for the sake of clarity to others, 'alternative interpretations' is
referring to Qcom DeepSleep firmware implementation, which cuts power to almost
all components except DDR with no wakeup source other than PMIC.

> Specifically, if we fully adopt "power might be removed", we should to
> take actions which will prevent a typical Qualcomm system from waking up
> from sleep again.
> 

I think for wakeup, the driver should just save the device context and call
enable_irq_wake() if the user has configured the device as a wakeup source and
assume that the device will wakeup the system from suspend/sleep.

The underlying firmware should honor the wakeup and not cut the power to the
devices. But if it does, then wakeup will be broken anyway.

So from Qcom drivers perspective:

1. They should save and restore the context if those drivers are going to be
used in both PSCI SYSTEM_SUSPEND (power retained) and DeepSleep (power lost)
firmware implementations.

2. If the user has configured wakeup, they should enable wakeup using
enable_irq_wake() during suspend. On PSCI SYSTEM_SUSPEND implementations, wakeup
should just work, but on DeepSleep, it may not if the power is cut off
completely. But that's the limitation on those platforms and the OS policy
should ensure that wakeup is not configured for devices.
 
- Mani

-- 
மணிவண்ணன் சதாசிவம்

