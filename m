Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A26CCA0FE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeRV0fCZInpvBFeIqpbtu5LsqQSf6syUhTop8jBWx7k=; b=x37op1hQNH1N7Tn/ThbeewGImL
	nCYEN8wRavkpzVMuw2Dk2R4ECFx0hFlMTC9+haxK+3XTHNLJhKRSSZu1e1Ps40EJmTQ5ymGoBEEOH
	f9X7yOdKwnUpIQXkixDG2YH1KtIEVMgOkWLty9RctEcATTJ5kV8ZjMds1rsoKIkTy6jF8zyTHVU7B
	zbnvENEkUqlX+WVEQBnq78PDpmfHv4sBAttm/N7PkuDZH7L5h4Za2j3UChWaAMf7PpPJPjuYNzJ52
	+HFaDaOEJffVqluH20WgNd3sCOgCIyCSjYRb7W1Sy3dVOhG/6I0VzEJo2Cg6cmR1XH9Y6BhspLYYa
	mk1e661g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8a3-0000000Hb3a-1HE8;
	Thu, 21 Aug 2025 16:56:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4lO-0000000Gxac-0qim
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 12:51:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83DDB152B;
	Thu, 21 Aug 2025 05:51:19 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59AD33F63F;
	Thu, 21 Aug 2025 05:51:27 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:51:25 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Levi Yun <yeoreum.yun@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v2 02/28] coresight: etm4x: Always set tracer's device
 mode on target CPU
Message-ID: <20250821125125.GA745921@e132581.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-2-23ebb864fcc1@arm.com>
 <751030d7-444e-46e6-b56f-0b72206969fc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <751030d7-444e-46e6-b56f-0b72206969fc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_055130_319262_F294FC23 
X-CRM114-Status: GOOD (  17.27  )
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

On Thu, Aug 21, 2025 at 10:45:10AM +0100, James Clark wrote:

[...]

> > The flow is updated with this change:
> > 
> >   CPU0                                    CPU1
> >   etm4_enable()
> >    ` etm4_enable_sysfs()
> >       ` smp_call_function_single() ---->  etm4_enable_hw_smp_call()
> >                                            ` coresight_take_mode(SYSFS)
> > 	                                    Failed, set back to DISABLED
> >                                            ` coresight_set_mode(DISABLED)
> > 
> >                                            CPU idle:
> >                                            etm4_cpu_save()
> >                                             ` coresight_get_mode()
> >                                                ^^^
> >                                                Read out the DISABLED mode
> 
> There's no lock though, so can't it do this:
> 
>  CPU0                                    CPU1
>  etm4_enable()
>    ` etm4_enable_sysfs()
>       ` smp_call_function_single() --->  etm4_enable_hw_smp_call()
>                                              `coresight_take_mode(SYSFS)
> 
>                                          CPU idle:
>                                          etm4_cpu_save()
>                                            ` coresight_get_mode()
>                                           ^^ Intermediate SYSFS mode

No.

The point is a target CPU will execute etm4_enable_hw_smp_call() and CPU
idle flow sequentially. It is no chance for the idle flow to preempt the
ETM flow. This is why using the target CPU to set the ETM state machine
will dismiss the race condition.

> This is why I was voting for changing the compare and swap mode stuff to
> spinlocks so we can be sure it's correct. The lock shouldn't be released
> until the mode is at its final value.

The question is a spinlock usage. If both initiate CPUs and target CPU
try to acquire the spinlock, the low level's CPU idle flow
(etm4_cpu_save() / etm4_cpu_restore()) needs to wait for high level's
SysFS operation to complete - which is what we try to avoid.

If we move the state machine on the target CPU - the operation and its
state transition on the same CPU so that dismiss a race condition. And
the idle flow is sequential to the ETM enabling/disabling, then, we can
achieve lockless approach.

A global picture is ETM's state is used in multiple places (Sysfs knobs,
ETM enabling / disabling, CPU idle and hotplug flow), if we start to use
spinlock for exclusively access the statch machine, then everywhere will
use it. This is why this series wants to do reliable state transition
based on appropriate atomic APIs (it also can promise atomicity and
ordering but lockless).

Thanks,
Leo

