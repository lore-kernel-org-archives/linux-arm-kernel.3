Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F01DC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PehfNGx1mNxRgN9BHnDwgkSZMR8L+TVhpX7WdRj9MNU=; b=4ppm4xaLOTr4PMZYcjBC163Z80
	uod5ES6kvyxRrTh/xWHANjjFjt74LEol5Tv0JSELJQJ9lABcCgiXfdgT3/4SL/4k50v7mbYHyYEB7
	4lE9wXg9ppTd9dW6m5EprgkL1p7ZHqnU4qzTM9EIva9uQ9ttifWIGbWGr/e8LVcxLqubiTQ3aJlCI
	POhw74URY1hDK13d/gdJHvkG98lGjvoEU1JdglppyxsTimj88mNLjWPZSdDoPAxs8Q8f5W8b8c32I
	ph6WQd6GkAVEColzxPbyCb7lizyitWiWs2H0oqcSxLlISW73puCh4FaES+KOYoQQxhk66GPhmiJJD
	qkWddXoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmB63-00000009bZk-0NN7;
	Tue, 21 Jul 2026 14:05:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmB61-00000009bZQ-2pcG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:05:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FD7540B55;
	Tue, 21 Jul 2026 14:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6419C1F00A3E;
	Tue, 21 Jul 2026 14:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784642720;
	bh=PehfNGx1mNxRgN9BHnDwgkSZMR8L+TVhpX7WdRj9MNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uy8XuX7yCRMYpQkrkEnTlTFFoP05gHXxaeW26pKb9iOdD8MHSVa8D5G4ByzfZsfM6
	 9AJbqCjygcqJgnZWZUNBbq+ruf5IVeYvApX3lidZePsL6Kk/xvju2mNehb6S6sIvWt
	 qV1d5x2+uhtW/FNtzmK6ta855Emy1iqIpzdz4pwANMPK5VvI73kjGg9XR+Q7byMuw2
	 DchREMsKibVBYYNuh9lFI2d4XpyDayyuifEBmWwaY3dyyQs3LlH3v1XPo0KYVU8vRa
	 uUdhoi2eqinCrWXrBEcmfT6K7hRFWdyVqckoCDncK1hXVDzqmEqmyesIVaZAdyIr+D
	 lXwKKWGrPnzgA==
Date: Tue, 21 Jul 2026 15:05:16 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
Message-ID: <20260721-towering-orchid-foxhound-d804bc@sudeepholla>
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
 <20260703-competent-adaptable-coot-f8daaf@sudeepholla>
 <4b7fe7e6-2531-4d26-9085-43f40a2ce2e0@oss.qualcomm.com>
 <20260706-practical-inchworm-of-experience-d4e0ed@sudeepholla>
 <05081037-9ed8-4e0d-8480-cfa45e950727@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05081037-9ed8-4e0d-8480-cfa45e950727@oss.qualcomm.com>
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

On Tue, Jul 21, 2026 at 02:58:49PM +0530, Sneh Mankad wrote:
> 
> 
> On 06-Jul-26 2:46 PM, Sudeep Holla wrote:
> > On Sat, Jul 04, 2026 at 08:43:39AM +0200, Daniel Lezcano wrote:
> >>
> >> Hi Sudeep,
> >>
> >> Le 03/07/2026 à 17:51, Sudeep Holla a écrit :
> >>> (It is always good to cc all PSCI maintainer for any ARM64 CPU
> >>> hotpug/suspend related changes)
> >>>
> >>> On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
> >>>> The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
> >>>> the SoC to ACPI S3 similar state where SoC is turned off and DDR is
> >>>> retained. The hardware design on these SoCs forces a constraint to suspend
> >>>> and resume the system on boot CPU / CPU0.
> >>>>
> >>> And you fail to explain why they have that constraint.
> >>>
> > 
> > I still need the above to understand the issue/constraint better.
> 
> Above mentioned SoCs have boot CPU fixed to CPU0 in HW, whenever SoC boots
> up/cold boots it starts with CPU0.
> 
> These SoCs support suspend to ram which leads to ACPI S3 similar state
> (where SoC is turned off and DDR is retained).
> PSCI SYSTEM_SUSPEND typically will be executed on boot core itself unless it
> is already offlined and non boot CPUs gets offlined using PSCI CPU_OFF.
> 
> As HW constraint always makes the SoC to boot with boot CPU, consider a
> scenario, where
> 
> Boot CPU is already disabled / offline => suspend to ram is triggered => SoC
> enters ACPI S3 similar state (only DDR is retained and rest of the SoC is
> off).
> <So far good>

Not really, see below ...

> 
> External wake up arrives (say power key press) => SoC starts booting with
> CPU0 => CPU0 becomes first one to "land" in kernel now.
> 

Ideally the firmware could have handled it by booting/waking the suspended
CPU and turning itself off even if it is some h/w limitation to ensure
the firmware is PSCI spec compliant.

> Kernel may later bring up other non-boot CPUs via PSCI CPU_ON calls.
> However Kernel had already marked CPU0 as disabled/ offline but same ended
> up in kernel without PSCI CPU_ON call.
> 

... You resumed back on a wrong CPU.


> To prevent this inconsistent state, before starting suspend to ram, need to
> make sure CPU0 is always online from kernel/ disable offlining of the boot CPU.
> 

At least not in the way this patch does. Kconfig is not an option. Why is
the firmware not handling it properly ? Just resuming random CPU into the
kernel is firmware bug which either needs to be handled as f/w errata
or good if the firmware can be fixed.

> Although the HW constraint needs boot CPU to be online only when suspend to
> ram is triggered, current patch disallows disabling it for simplicity.
> 

That's very strange, so it sounds like not a real h/w constrain to make CPU0
as non-hotpluggable. PSCI CPU_SUSPEND resume path must handle wake up on
wrong CPU correctly and land/resume on the correct CPU in the kernel.

> > 
> >>> Is it because some secure context is not allowed to migrate ?
> >>>
> >>> We already have a mechanism for that in place and this hack is not at all
> >>> required.
> >> Do you mean a mechanism for the secure context or for preventing CPU0 ?
> >>
> > 
> > I meant constraint based on secure context.
> > 
> 
> This is not because secure context not allowed to migrate but above
> mentioned HW constraints.
> 

Sure not secure context related but a HW constraint that secure/PSCI
firmware ignored to handle correctly.

Fix the firmware or explore ways to handle it as FW errata.

-- 
Regards,
Sudeep

