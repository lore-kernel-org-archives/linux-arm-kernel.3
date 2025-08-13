Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF42FC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zqPaz0acpSH3c3quLtrlZmoX4aThGp3mzoNckla2JY=; b=k5CM1uVGlMUdUQ6Tm/ePMu4Yoa
	pX3HCLGg+qb+jQ5QEiV6Ye9UpeSjZ3Z55IulD33XWIixCfSJ2rbnM9JHWOfxRoKrnEK5XL+a9qePm
	UICY5SpYq11XQYtytGQBXiCqIhPlLVq4KHJC9WQqZktEnO0L8zJKQGPg4ok84XKYb/6x/3Vrz1pdq
	hirPVQG2D/WfO3PE4/O/nkKgTPca5gxay1inHp5nmdYhu1XcW7sotFGlRpVnVluRyewGQB/s4bsYE
	ELOG/vgjjGl22NIbDDzJFn0KuJOrw0YkOdf2foOhKzqIaJGOAbKZxf9K76ROQHDVXinp//wZwqm6i
	6o8740Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBOm-0000000DkVM-1B7S;
	Wed, 13 Aug 2025 13:20:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAf5-0000000DeLH-1dI6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 12:33:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6AF212FC;
	Wed, 13 Aug 2025 05:32:50 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D37813F5A1;
	Wed, 13 Aug 2025 05:32:56 -0700 (PDT)
Date: Wed, 13 Aug 2025 13:32:54 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 0/4] clocksource: Add standalone MMIO ARM arch timer
 driver
Message-ID: <20250813-opalescent-boisterous-viper-d0061d@sudeepholla>
References: <20250807160243.1970533-1-maz@kernel.org>
 <20250813-macho-snobbish-alpaca-ff07fa@sudeepholla>
 <aJx4g8z3l438Qgnv@raptor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJx4g8z3l438Qgnv@raptor>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_053259_472230_716966EE 
X-CRM114-Status: GOOD (  29.48  )
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

On Wed, Aug 13, 2025 at 12:35:31PM +0100, Alexandru Elisei wrote:
> Hello,
> 
> On Wed, Aug 13, 2025 at 11:55:48AM +0100, Sudeep Holla wrote:
> > +Alexandru
> > 
> > On Thu, Aug 07, 2025 at 05:02:39PM +0100, Marc Zyngier wrote:
> > > For the past 10 years, both Mark and I have been lamenting about the
> > > sorry state of the badly named "arch_timer" driver, and about the way
> > > the MMIO part is intricately weaved into the system-register part.
> > > 
> > > The time has finally come to have a stab at it.
> > > 
> > > This small series simply creates a new timer driver for the MMIO arch
> > > timer, and only that. It is an actual driver, and not some kludge that
> > > has to run super early (that's what the per-CPU timers are for). This
> > > allows, in turn, a pretty large cleanup of the per-CPU driver, though
> > > there is more to come -- one thing at a time.
> > > 
> > > As an added bonus, we get a clocksource, which the original code
> > > didn't provide. Just in case it might be useful. The end-result is far
> > > more readable, and about 100 lines smaller.
> > > 
> > 
> > (Tested it on Juno R2 and FVP in both DT and ACPI boot)
> > 
> > Tested-by: Sudeep Holla <sudeep.holla@arm.com>
> > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > 
> > Alexandru found it useful(avoids some unexpected hang IIUC) in his setup
> > based on bootwrapper which doesn't initialise MMIO timers.
> 
> Just FYI, this is the testing that I did.
> 
> Without this series, if firmware (boot-wrapper-aarch64 in my testing) doesn't
> configure access to the memory-mapped timer:
> 
> [    0.000000] arch_timer: Unable to find a suitable frame in timer @ 0x000000002a810000
> [    0.000000] Failed to initialize '/timer@2a810000': -22
> ..
> [    0.528000] kvm [1]: kvm_arch_timer: uninitialized timecounter
> ..
> # ls /dev/kvm
> ls: cannot access '/dev/kvm': No such file or directory
> 
> With this series, if firmware doesn't configure access to the memory-mapped
> timer:
> 
> [    0.549399] kvm [1]: Hyp nVHE mode initialized successfully
> ..
> [    2.018050] arch-timer-mmio 2a810000.timer: Unable to find a suitable frame in timer @ 0x000000002a810000
> [    2.018123] arch-timer-mmio 2a810000.timer: probe with driver arch-timer-mmio failed with error -22
> ..
> # ls /dev/kvm
> /dev/kvm
> 

Thanks for the details. I misunderstood as some VM boot hang and was wondering
why I couldn't reproduce it(was failing gracefully though no KVM and hence
VM fails to launch).

-- 
Regards,
Sudeep

