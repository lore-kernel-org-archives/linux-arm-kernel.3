Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6A9C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 11:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaB9zjJJf1lkvcUrXACl1LaqEcDbvmCXCZVlOwFJpjk=; b=gkLi82cayODCjgr1KXKLgSqeDT
	/hNe+NkgB5iIwwNZ8TwcA0KUmnnE748maRTWRJYxvavnORUjPwB5AeJg1BaetYzCT7L6tBSlnb66S
	6XGCb/3LPUYZi32pikA6QQeDqRjQF0ppKeSyYEOcdCr8RHLob1LpbNWt3SSUc98sesGzlIz9NPWWq
	lHaiNhMQKqCY71eXJmgQAv4qUv6Hap0x533mqptAnrtxvd/5tadePvEi+TLJtCUHNRT3hbvwlgdEN
	digm6MinUXI7krFjqVyrYSEDUenkvaBhx2enAmykcS7GVgFcSt0yoeU2/BAdk/5qwwYQvANvasjKA
	+NATbjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjZg-00000004kz4-0zWP;
	Tue, 28 Jan 2025 11:16:08 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjXv-00000004kc3-2sJ0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 11:14:21 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50SBE8xm1951268
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jan 2025 05:14:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738062849;
	bh=PaB9zjJJf1lkvcUrXACl1LaqEcDbvmCXCZVlOwFJpjk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CjLUuY5gVLXfuB/N5oPB5Hy6DKS1ul4QdAh56ZC4if4GiuWN2kTZtfxJkUh7BjCfE
	 Ge8wr+E1MxbqobYs2RuwWQ0dtiSKcftyaFKPnP5/oLRaLIGFPXRG19p+775xapS0ZB
	 WjU9/WaPw5HxrBcRGQOGvo/lg4XamXfiz/RbsUgs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50SBE8H0002142
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 Jan 2025 05:14:08 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 Jan 2025 05:14:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 Jan 2025 05:14:08 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50SBE7JV125661;
	Tue, 28 Jan 2025 05:14:08 -0600
Date: Tue, 28 Jan 2025 16:44:07 +0530
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
Message-ID: <20250128111407.6hbefatwhuomstzo@lcpd911>
References: <CAO6a-9_aPLCx2CqecQBGbK78_=+-tT44RepPkrBjpkWSvjj4Tg@mail.gmail.com>
 <CAO6a-98cdSvyd7jgAyGNmsC2nxmRSyr3GppxvZU9yHU1xqwz3g@mail.gmail.com>
 <20241211055052.gbxnyqpui3t3zpw5@lcpd911>
 <20241211121825.GA2054801@bogus>
 <20241211143428.kaoovhiwar74dy6x@lcpd911>
 <Z1rbLdWW75KQw5cl@bogus>
 <CAO6a-98XFxbCnOMp5ARwPssjYomyNKWjT=WTk=z2+ZKyOAQ0jQ@mail.gmail.com>
 <20250128094720.sgk7gyr5oawzxbez@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250128094720.sgk7gyr5oawzxbez@bogus>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_031419_811784_D4C3D251 
X-CRM114-Status: GOOD (  31.74  )
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

Hi Sudeep and Vivek,

On Jan 28, 2025 at 09:47:20 +0000, Sudeep Holla wrote:
> On Mon, Jan 27, 2025 at 10:47:28PM +0530, Vivek yadav wrote:
> > Hi @Dhruva Gole,
> > 
> > Q.1. Does your CA-53 properly go into CPUIdle state and come out of
> > sleep state ?
> 
> Yes, well tested on other SoCs. Seems like system integration issue.

Yes, with the local-timer-stop property removed, all A53 cores do enter
idle in TF-A at the same time.

> > As of now I made some changes in the DT node. After making changes in
> > latency (which is mentioned below).
> > 
> >  idle-states {
> >        entry-method = "psci";
> >         cpu_ret_l: cpu-retention-l {
> >           compatible = "arm,idle-state";
> >           arm,psci-suspend-param = <0x00000000>;
> >           local-timer-stop;
> >           entry-latency-us = <300000>; # 300ms
> >            exit-latency-us = <300000>; # 300ms
> >            min-residency-us = <1000000>; # 1 sec
> >      };
> >  };
> >
> 
> Does these align with expectation of PSCI implementation in the firmware ?

Just to add here, value of that parameter has some encoded
meaning and is given in the PSCI standard:
Table 7 power_state parameter bit fields in Original format
https://developer.arm.com/documentation/den0022/fb/?lang=en

> 
> 
> > I can see that  CA-55 went into a sleep state (state1) using command
> > ``cat /sys/devices/system/cpu/cpu*/cpuidle/state*/time``.
> > As you mention earlier in a multicore system (2 or more) at least one
> > core keeps working and does not go into sleep state. It should happen
> > as per theory and other developers' case.
> > 
> > In my case, after some time, both CPUs (CPU0 and CPU1) go into sleep
> > state (state1). Hence the system console hangs.
> > 
> > My expectations are,
> > If I type anything on keyboard. UART interrupt should take out CPUs
> > from sleep state and execute commands. OR some periodic timer should
> > take the CPU out of sleep. Which is not happening as of now.
> > As you said  we can safely remove`` local-timer-stop``. It means local
> > timers are working for the CPUs and triggering interrupts ?
> > 
> 
> Please go the thread and understand when and why you need local-timer-stop and
> how it is related to the arm,psci-suspend-param value(especially the state
> context loss bit)

Yes this is the important bit, if you know that on your platform the
A53s are just not going to power off or stop timers upon entering idle
then you must remove the local-timer-stop property from your DT
cpu_ret_l.
However, if you do have a scenario where the timer would be getting
stopped or modified in idle scenario, then linux needs to be able to use
another timer that is routed to the GIC and is unaffected while the
system is in idle.

This is what my understanding is so far, I am yet to do experiments with
local-timer-stop + different timer in the case of idle.

> 
> I have not got response to my questions. You can just play with DT and get
> things working here if the firmware expectation, hardware functionality
> and DT properties don't align.

I have responded to the thread now, sorry for not getting back earlier!

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

