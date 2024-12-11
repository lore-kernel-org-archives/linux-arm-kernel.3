Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E942E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 14:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09tWTzLXgMYVzmambtubWygnDCYSWR6GEUqpPaUWrbc=; b=t+BEO0OW3nLGj7UbHUtJV0s9Bu
	uzG5FVJA14Nd9tN1wUCYHesLLFKrYk8trVTdcHW2z5njnDxuIHR2KBH3ZBIjvdZXVomjrWwYOUi7g
	Bc2lzBKKPswmwthaO+wxnF1Ew1BipVGphjEhwUCOh++8SfWDFG55k9108MiknSwKGFcZf2iebYare
	FOXBgm3mYDCprc7z/1mnrCMOUf1o//n/YbiZgqld+AdcAX5qQ25UQx1oHfuSsWeN5yH9VMMgjJvNl
	xmNRWP3Lry6V3/QOlKyrW12BIOO6fBA6UCcEyEUjZy3AZS9ytj85/ivXbR0WT9L89c/qZebR0Y6lr
	3mzzT/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNoa-0000000FAEJ-0x1A;
	Wed, 11 Dec 2024 14:35:48 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNnW-0000000FA8K-2d69
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 14:34:44 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BBEYUX83100973
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 11 Dec 2024 08:34:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733927670;
	bh=09tWTzLXgMYVzmambtubWygnDCYSWR6GEUqpPaUWrbc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Hxmncq2BDa8GLasoIUoLyn7fB7uhn0EstcLgRuxa7x0Hhl0xz0z0Bjrc7S8ty+XdO
	 N0E9CdAOnzHzgQirTCjwtaeZnNozlXKnNkUjuMe3x43V+D3OHVTu+kM8EPYDib9YRj
	 VmzfXm9hK48iEw3xcVMoirqoJNluC/4y5GE+CpF4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BBEYTCH025829;
	Wed, 11 Dec 2024 08:34:29 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Dec 2024 08:34:29 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Dec 2024 08:34:29 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BBEYSx6052706;
	Wed, 11 Dec 2024 08:34:29 -0600
Date: Wed, 11 Dec 2024 20:04:28 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: Vivek yadav <linux.ninja23@gmail.com>, <linux-newbie@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <daniel.lezcano@linaro.org>,
        <lpieralisi@kernel.org>, <krzk@kernel.org>, <christian.loehle@arm.com>,
        <quic_sibis@quicinc.com>, <cristian.marussi@arm.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <vigneshr@ti.com>, <khilman@ti.com>, <sebin.francis@ti.com>,
        <khilman@baylibre.com>
Subject: Re: Fwd: ARM64: CPUIdle driver is not select any Idle state other
 then WFI
Message-ID: <20241211143428.kaoovhiwar74dy6x@lcpd911>
References: <CAO6a-9_aPLCx2CqecQBGbK78_=+-tT44RepPkrBjpkWSvjj4Tg@mail.gmail.com>
 <CAO6a-98cdSvyd7jgAyGNmsC2nxmRSyr3GppxvZU9yHU1xqwz3g@mail.gmail.com>
 <20241211055052.gbxnyqpui3t3zpw5@lcpd911>
 <20241211121825.GA2054801@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241211121825.GA2054801@bogus>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_063442_756618_2107CBA6 
X-CRM114-Status: GOOD (  40.40  )
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

On Dec 11, 2024 at 12:18:25 +0000, Sudeep Holla wrote:
> On Wed, Dec 11, 2024 at 11:20:52AM +0530, Dhruva Gole wrote:
[...]
> > >
> > >
> > > Hi @all,
> > >
> > > I am working on one custom SoC. Where I add one CPUIdle state for
> > > ``arm,cortex-a55`` processor.
> >
> > Any further luck on this?
> >
> > I have also been working on something similar[1] but on an A53 core on
> > TI-K3 AM62x processor.
> 
> Does upstream DTS have support for this platform to understand it better ?
> Even reference to any complete DT file for the platform will help.

Yes, you can ref to the AM625 (CPU layout) DT here:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/ti/k3-am625.dtsi

The board/starter kit DT is:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/ti/k3-am625-sk.dts

The patches for idle state are not upstream, and only exist in this
patch of mine here:
https://github.com/DhruvaG2000/v-linux/commit/0fd088d624276a2e72b8dc6660d261ab6d194f4b

[...]
> > See this chunk in the kernel cpuidle driver:
> > 	if (broadcast && tick_broadcast_enter()) {
> >
> > When I dug deeper into tick_broadcast_enter it always returns something
> > non zero and hence in my case it was entering the if block and tried to
> > find a deepest state. Then the deepest state would always return WFI and
> > not the idle-state I had added.
> >
> > What we found out was on our kernel we end up using
> >
> > kernel/time/tick-broadcast-hrtimer.c
> >
> > This always seems to be keeping atleast 1 CPU busy and prevents idle.
> > If we remove the local-timer-stop it was helping us, but we still need
> > to dig into the full impact of what that entails and I am still
> > interested in finding out how so many other users of similar idle-state
> > implementation are able to do so without trouble.
> >
> 
> Interesting. So if the platform is functional removing local-timer-stop,
> I am bit confused. Either there is something else that is getting it out

Yes it was interesting to us too, as to how the RCU didn't kick in and
system continued to function as though nothing was wrong.

> from the idle state so, it should be fine and it could be just some

It's probably UART keypresses or some userspace processes that get
scheduled that bring the CPUs back out of TF-A's cpu_standby.
Is it possible that EL1 interrupts can bring EL3 out of WFI? Is yes then
it explains the behaviour. The arch timer could also be continuing to
tick and bringing the CPUs out of ATF WFI.

> misconfiguration.
> 
> > Arm64 recommends to use arch_timer instead of external timers. Once we
> > enter el3, timer interrupts to el1 is blocked and hence it's equivalent
> > to local-timer-stop, so it does make sense to keep this property, but
> > then how are others able to enter idle-states for all plugged CPUs at
> > the same time?
> >
> 
> Some systems have system timer that can take over as broadcast timer when
> CPUs enter deeper idle states where the local timers are stopped.

In CPUIdle we're not really clock gating anything so the timer does keep
ticking. So in this particular case it might make sense to remove the
local-timer-stop property from the idle-state.

However we're looking into taking this further and putting interconnect
and few other PLLs in bypass which could cause arch timer for eg. to
tick slower. In this case would it still make sense to omit the
property? We may even have some usecases planned where we may turn OFF
the CPU once it is in TF-A cpu_standby/ WFI. What would be the right
approach in such scenarios?

Could you provide any examples where the local-timer-stop property is
being used and an alternative timer can be configured once we enter the
idle-state where CPU CTX maybe lost or clocks maybe bypass? It would be
great if you could share some example implementation if you're aware.

I took a look at QCom / NXP DT's but I couldn't exactly figure out how
they were setting up alternate timers once CPU hit idle-state.

PS. If it helps atall here's also my hack TF-A code where we enter just
CPU RET state for now:
https://github.com/DhruvaG2000/tfa-dev/commit/2d4b441d2f4c6d9ee0d6a62d93920ee8ab77dd42#diff-4fa4f4f6a5faa221390928a8079f76392536559f66e420a0182dba8e5966f4c6R232

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

