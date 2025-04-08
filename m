Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5764EC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHpxg902UhhTEgJBUMLGuL15DgHQiEP+C6YOWUeF5k4=; b=Zmn3NBUR/3JHrIcd1SZaWbol6T
	/MiL7JBwxFu8v63OpGZ1TVMIa/cyquA+qQ3JGScKi0sD4Wj8PZSLIa6Ho6JEWEZSr65TB5cgt/030
	4B0+6bFgmc12IhDizR8KZnPbEIzsFuLWDjZE3SEXEkAIBFDQnsqREjW2dDyMsITuypJtBSu4OqIRR
	DpUa8/E0sh550SqljwcHsbD1JZTtlPTEtxEkQwv0YT5rV3wT2Ic3jH3KPvWxwn2QMX2L1GxyIgD0S
	F2JV9HRgvp0XTFtEcUjZFDblXb0IVGMCYjpBDqlovw18ciWKWZJir+5uM8bXiYs1+0yDjQt/oxsn+
	OcBX6oaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26sg-00000003oTk-218e;
	Tue, 08 Apr 2025 11:12:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26Tg-00000003j3o-1yFz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:46:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 923A61688;
	Tue,  8 Apr 2025 03:46:46 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A43C3F6A8;
	Tue,  8 Apr 2025 03:46:43 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:46:40 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Donghyeok Choe <d7271.choe@samsung.com>
Cc: Youngmin Nam <youngmin.nam@samsung.com>, Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, hajun.sung@samsung.com,
	joonki.min@samsung.com, ne.yoo@samsung.com
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in GICv3
 ITS driver
Message-ID: <20250408-transparent-daft-dog-ec2a74@sudeepholla>
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
 <Z+Nv8U/4P3taDpUq@perf>
 <8634f0mall.wl-maz@kernel.org>
 <Z+TEa8CVAYnbD/Tu@perf>
 <20250402-messy-wild-squid-7b4da9@sudeepholla>
 <Z+3kwsesiXyC0hbO@perf>
 <20250403-rare-wasp-of-management-9bce59@sudeepholla>
 <20250404041323.GA685160@tiffany>
 <20250407-amiable-perfect-hummingbird-06ad83@sudeepholla>
 <20250407225146.GA2858456@tiffany>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407225146.GA2858456@tiffany>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_034648_600661_8AB8C892 
X-CRM114-Status: GOOD (  31.66  )
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

On Tue, Apr 08, 2025 at 07:51:46AM +0900, Donghyeok Choe wrote:
> On Mon, Apr 07, 2025 at 10:17:43AM +0100, Sudeep Holla wrote:
> > On Fri, Apr 04, 2025 at 01:13:23PM +0900, Donghyeok Choe wrote:
> > > On Thu, Apr 03, 2025 at 10:18:54AM +0100, Sudeep Holla wrote:
> > > > /me more confused.
> > > > 
> > > > Are you saying you have some cpuidle platform specific logic inside
> > > > trace_android_vh_cpuidle_psci_enter(). I would assume it was just to
> > > > trace the entry into the state and nothing more.
> > > 
> > > If you have any further questions, feel free to reach out.
> > > 
> > 
> > I was trying to understand the difference in behaviour between normal
> > cpuidle entering the same deepest state that is entered in s2idle state.
> > I assume GIC doesn't loose power and no need for GIC ITS save/restore
> > in normal cpuidle path ?
> >
> > If so, what triggers the GIC suspend in s2idle path if syscore_ops is
> > not getting called ?
> >
> > Why would the firmware pull the plug on GIC ?
> 
> The GIC loses power. It is powered down to the same level as during suspend.
> Therefore, it became necessary to perform GIC ITS save/restore through
> a method other than the GIC ITS syscore path.
> To help with better understanding, I will write a pseudo code.
> 
> void mimic_syscore_suspend()
> {
> 	/* Perform the actions required to power off all cores. */
> 	...
> 	its_save_disable();
> }
> 
> void android_vh_cpuidle_psci_enter_handler(... bool s2idle)
> {
> 
> 	if (!s2idle)
> 		return;
> 
> 	set_cpu_powerdown_mark();
> 
> 	if (cpu != booting core)
> 		return;
> 
> 	/* only booting core here */
> 	mimic_syscore_suspend()
> }
> 
> void mimic_syscore_resume()
> {
> 	...
> 	its_restore_enable();
> }
> 
> void android_vh_cpuidle_psci_exit_handler(... bool s2idle)
> {
> 	if (!s2idle)
> 		return;
> 
> 	if (cpu == booting core)
> 		mimic_syscore_resume();
> 
> 	set_cpu_poweron_mark();
> }
> 
> All cores will be marked as powered down when the HVC/SMC call for
> CPU suspend is invoked. When all cores call the suspend function,
> the firmware will recognize the powerdown mark and transition
> the system into suspend. At this point, the entire GIC will also
> be powered off.
> In a cpuidle situation that is not s2idle, the cores do not mark
> CPU powerdown, so the GIC ITS save/restore operation is neither
> performed nor necessary.
> 

OK, I understood. In short, you create problems by hacking up or misusing
your trace handlers in ways it shouldn't be, and now you are t/crying to
solve those problems.

> > Do you use any suspend/resume logic in drivers/irqchip/irq-gic-pm.c ?
> No, there are parts of the GIC that require secure access, so the
> GIC save/restore is performed by the firmware.
> Since the GIC-ITS is entirely controlled as a non-secure IP,
> I think it is more efficient to perform save/restore in the kernel.
> 

I can understand that part, but my hacking up things the way you have
shown above, though you may think you have achieved some feature very
smartly, you have just dug up the hole with issues you are facing now.

The only reason IIUC s2idle info is used is to identify when the RPM
is disabled. You are using that info to manage GIC power state.

The CPU deepest idle states entered in the normal and s2idle must be
same. If you want to still achieve extra power save with GIC powerdown
make it completely transparent to the OS.

-- 
Regards,
Sudeep

