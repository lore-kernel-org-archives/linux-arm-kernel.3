Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD6CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fra4QsSYjDMwyZi3lLxbiw6DVPjIesBWQaWVxigd5Uw=; b=RvV49+lxikHhTWQTp2/JY0tSIq
	s1/CZiA+Nrso+w1Ghzz9fSH2icv8QhJEQFI7k8+XcO8L/SFxj1vemQ1c0ObuwsDiSfhOhiNU2oxcr
	AxdpXWYW5eKdWWiNfI2FUe3ZFOJrNbDQZUCkqqJVhw3ev/fmFztPJ+kiWb0rQ4TBdDcfiWp6Vumfl
	qzyB+31fdNc34GjE9IeC5G9g0L/bKtYWYSKHWc7dcEj48nStr5X7h/dk2hm9QFKAhKVa7Oepk198P
	mapbpMSKthv2WbCR6NFvuS4GXdXZ0f/9WTYFTY+WLyW7BsaTtil3dx4BgBZe/gQsfKOmgKeTAbAzs
	y/mmPQkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8sr-00000008g42-0oqt;
	Wed, 12 Nov 2025 11:19:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8so-00000008g25-1EqZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:19:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D112D1515;
	Wed, 12 Nov 2025 03:19:17 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 233943F66E;
	Wed, 12 Nov 2025 03:19:25 -0800 (PST)
Date: Wed, 12 Nov 2025 11:19:23 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 11/11] coresight: etm4x: Reuse normal enable and
 disable logic in CPU idle
Message-ID: <20251112111923.GG281971@e132581.arm.com>
References: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
 <20251111-arm_coresight_power_management_fix-v6-11-f55553b6c8b3@arm.com>
 <CAJ9a7VjpmWdethzwpKuo8mvGxU69HjZieGh+6iqTN6aSEow5gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VjpmWdethzwpKuo8mvGxU69HjZieGh+6iqTN6aSEow5gA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_031926_410670_EBC9A543 
X-CRM114-Status: GOOD (  39.14  )
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

Hi Mike,

On Wed, Nov 12, 2025 at 09:16:46AM +0000, Mike Leach wrote:
> Hi Leo,
> 
> The save/restore sequence is only used if the ETM is active at the
> time of power down.
> 
> However, by removing the specific save/restore structure, and using
> the existing drvdata->config structure, the actual state can be
> changed by sysfs from another PE, as the sysfs accesses only write to
> the drvdata->config structure and not the actual hardware.  Thus this
> change permits the corruption of the saved state, which will result in
> restore != saved..
> 
>  While using the same code is a good idea avoiding lots of
> duplication, it may be necessary to have a copy of the drvdata->config
> passed in to the relevant functions.
> 
> We have considered in the past if it might be worthwhile isolating the
> sysfs and perf config settings in the etm - it may be worth
> re-visiting this again with a save restore copy in mind to.

Yes, Levi reminded me he already has some patches [1] to address the
issue.  Basically, the series returns -EBUSY if trying to write sysfs
knobs but the device has been enabled.

Actually, we have another solution (credits to Levi who has worked on
it with some internal discussion).  Let me elaberate at here:

Similiar to you suggested "isolating sysfs and perf config setting",
but isolate in a different way:

  User's config: it is a set parameters stored for setting from user
  space. It can come from sysfs knobs or from cscfs parameters.

  Hardware's config: it is a set parameters for setting hardware
  registers (we can simply use drvdata->config for this purpose).

As a result, every time when a session is enabled (it can be a sysfs
session or perf session), we apply user's config for updating
hardware's config (e.g., in etm4_enable_sysfs() / etm4_enable_perf()),
afterwards, when invoke etm4_disable_hw() / etm4_enable_hw(), we
only use hardware's config for register setting.

This can naturally resolve the mismatched issue you mentioned in CPU
PM save and restore, and this can benefit us for later consolidating
cscfg parameters.

I prefer we can use a separate patch series to address this issue (I
should review Levi's patch series so can make things proceed). At the
meantime, I would say this patch is still valid.

As a side topic, actually we have found issues for the config is
reset when start a session so the user's config does not take affect at
all (see etm4_set_default_config()).

[1] https://lore.kernel.org/linux-arm-kernel/20241221165934.1161856-2-yeoreum.yun@arm.com/

> On Tue, 11 Nov 2025 at 18:59, Leo Yan <leo.yan@arm.com> wrote:
> >
> > The etm4_enable_trace_unit() function is almost identical to the restore
> > flow, with a few differences listed below:
> >
> > 1) TRCQCTLR register
> >
> >    The TRCQCTLR register is saved and restored during CPU idle, but it
> >    is never touched in the normal flow. Given the Q element is not
> >    enabled (TRCCONFIGR.QE bits), it is acceptable to omit saving and
> >    restoring this register during idle.
> >
> > 2) TRCSSCSRn.STATUS bit
> >
> >    The restore flow does not explicitly clear the TRCSSCSRn.STATUS bit
> >    but instead directly loads the saved value. In contrast, the normal
> >    flow clears this bit to 0 when re-enabling single-shot control.
> >
> >    Therefore, the restore function passes the restart_ss argument as
> >    false to etm4_enable_hw() to avoid re-enabling single-shot mode.
> >
> > 3) Claim Tag Handling
> >
> >    The claim tag is acquired and released in normal flow, on the other
> >    hand, the claim protocol is not applied in CPU idle flow - it simply
> >    restores the saved value.
> >
> >    The claim bits serve two purpose:
> >
> >    * Exclusive access between the kernel driver and an external
> >      debugger. During CPU idle, the kernel driver locks the OS Lock,
> >      ensuring that the external debugger cannot access the trace unit.
> >      Therefore, it is safe to release the claim tag during idle.
> >
> >    * Notification to supervisory software to save/restore context for
> >      external debuggers. The kernel driver does not touch the external
> >      debugger's claim bit (ETMCLAIM[0]).
> >
> >    Based on this, it is safe to acquire and release claim tag in the
> >    idle sequence.
> >
> > 4) OS Lock Behavior
> >
> >    The OS Lock should be locked during CPU idle states. This differs
> >    from the normal flow, which unlock it. This special handling remains
> >    in the CPU save path.
> >
> > This commit reuses the normal enable and disable logic in the CPU idle
> > path. The common disable logic is moved into a new function
> > __etm4_disable_hw(), which omits the etm4_cs_{unlock|lock}() pairs and
> > is convenient to call from the save callback.
> >
> 
> Why omit cs lock/unlock? Not unlocking the software lock prevents the
> claim tag registers from being written, which contradicts 3) above,
> and prevents other writes during the disable sequence.

Sorry for confusion.
 
I will update the commit log:

  Split the hardware disable sequence into a new function
  __etm4_disable_hw(), which performs the common disable
  logic without the CoreSight lock.

  __etm4_cpu_save() has its own CoreSight lock handling, it
  calls __etm4_disable_hw() so without duplicate lock issues.

Thanks,
Leo

