Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CF3C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 09:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DE1vzrZeR4hIEuAQRgsWG+7Il6P7kNa71PWVFiOJGBI=; b=RvVW6dBlAMSa/nRwasRmn5UQIS
	AEfxQYAZLruwEv8toRCB5VOO0pRSMIgBf2yRlosegvanQkhqAIReG8XsHuuzf0eHdG8Jhfug8mWkE
	zCvLg/mujSXN0SKK/EL/kqt17wst7sZan5f/o7Ymr8qeUh2HLeXWYWbFdZOfUA4p/7TwBeUNNO48q
	NVSp1JBCFqXfUsUmlrwR+3KMXX5wfyJlCWcJBH17EHrn3TGxfBKtAMIEzNYnxYZEtT5XNFF7WwhF4
	QETbpK04jWEY2kv6pjW0syxqYB4DyAtoCMaYje2GRskcMnFPRZ2X7T+VLuSut/ESRSsSlyVf3PWQ5
	97nbVxMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uirSn-0000000A4pR-2S7N;
	Mon, 04 Aug 2025 09:26:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uirB2-0000000A32d-0r8h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 09:08:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACBEF1C25;
	Mon,  4 Aug 2025 02:08:06 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 516E03F673;
	Mon,  4 Aug 2025 02:08:14 -0700 (PDT)
Date: Mon, 4 Aug 2025 10:08:12 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Levi Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/28] coresight: etm4x: Always set tracer's device
 mode on target CPU
Message-ID: <20250804090812.GI143191@e132581.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-2-23ebb864fcc1@arm.com>
 <09f9d195-7f3c-4cf1-95da-7e29c398ebcc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09f9d195-7f3c-4cf1-95da-7e29c398ebcc@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_020816_317020_8D315219 
X-CRM114-Status: GOOD (  28.33  )
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

On Tue, Jul 15, 2025 at 12:56:54PM +0530, Anshuman Khandual wrote:
> 
> On 01/07/25 8:23 PM, Leo Yan wrote:
> > When enabling a tracer via SysFS interface, the device mode may be set
> > by any CPU - not necessarily the target CPU. This can lead to race
> > condition in SMP, and may result in incorrect mode values being read.
> > 
> > Consider the following example, where CPU0 attempts to enable the tracer
> > on CPU1 (the target CPU):
> > 
> >  CPU0                                    CPU1
> >  etm4_enable()
> >   ` coresight_take_mode(SYSFS)
> >   ` etm4_enable_sysfs()
> >      ` smp_call_function_single() ---->  etm4_enable_hw_smp_call()
> >      			                /
> >                                        /  CPU idle:
> >                                       /   etm4_cpu_save()
> >                                      /     ` coresight_get_mode()
> > 	       Failed to enable h/w /         ^^^
> >   ` coresight_set_mode(DISABLED) <-'          Read the intermediate SYSFS mode
> 
> The problem is - CPU1's HW state and CPU1's sysfs mode state might not
> remain in sync if CPU1 goes into idle state just after an unsuccessful
> etm4_enable_sysfs() attempt from CPU0. In which case a subsequent read
> coresight_get_mode() on CPU1 might erroneously give us DISABLED state,

In this case, CPU1 reads an intermediate "SYSFS" state, even though it
failed in etm4_enable_hw_smp_call(). The current code defers setting
the state to DISABLED on CPU0. As a result, CPU1 will incorrectly save
and restore the ETM context based on the intermediate "SYSFS" state.

> which actually does not seem to be too bad as the earlier enablement
> attempt had failed anyway. Just trying to understand what is the real
> problem here.

The problem is CPU1 might get an intermediate state, it turns out a
stale value and might guide CPU idle flow to wrongly save and restore
ETM context.

> > In this case, CPU0 initiates the operation by taking the SYSFS mode to
> > avoid conflicts with the Perf mode. It then sends an IPI to CPU1 to
> > configure the tracer registers. If any error occurs during this process,
> 
> What kind of error can happen during this process ?

So far, it might fail to claim a device and return an error.

A similar issue might occur when CPU1 exits an idle state. For example,
if CPU0 initiates the ETM enabling flow and sets the SYSFS mode in
advance, once CPU1 is woken up from idle by an IPI, it reads the ETM
state (SYSFS mode) and then restores and enables the ETM. This can
happen even before CPU1 invokes etm4_enable_hw_smp_call() to complete
the ETM enable flow.

> > CPU0 rolls back by setting the mode to DISABLED.
> 
> Which seems OK.
> 
> > 
> > However, if CPU1 enters an idle state during this time, it might read
> > the intermediate SYSFS mode. As a result, the CPU PM flow could wrongly
> > save and restore tracer context that is actually disabled.
> 
> Right but CPU0 had marked the CPU1' state as DISABLED after the enable
> attempt had failed. So what is the problem ?

There is a race condition between CPU0 writing the state and CPU1
reading the state (during its CPU idle flow). CPU1 might read a state
that is inconsistent with the actual ETM hardware state, which causes
CPU1 to save and restore the ETM context incorrectly.

A wider view is this series heavily relies on the ETM state to decide
the linked path has been enabled and take action for saving and
restoring all components on the path (not for ETM device only). We need
a reliable state machine to reflect hardware state. To avoid any
intermediate state, we always set the state on the target CPU.

Thanks,
Leo

