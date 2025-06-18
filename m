Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B687C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rnc8zUV1GZnyFQWKml5tJhxFta5/uVCP4BIh6E4sHis=; b=PrbSlo2QZOJBxg0djiBUVTJLAq
	u8beMCharFBWAGL/fcJaTtB8LOmw4NZFE/sHXpgRMP9mjoEw36bPnEBXtMyUt3QLjd8eWxFuFqT+U
	YuIEuu8M+vEcJJfzZNU5L1Mx+vnaNGrMIWV8Pj6kLUU4mlLYeWYeuX/QNxrFzzVT1Pu9EXJO5/vfE
	cbU0hBT15cg9Jrl5MnRSas0vTqcfrCuvr/XtGe2J9TKQ9hGziUVz8nZtu8iRbCBMypWjuCbuCydg4
	/VAiArj9URe0GpZ3XUoZ+9fHhqnQxM4PgQf2/xSaExArFN+pMDmxeK6jytmmvUXKYYIZMMraTQSdG
	XHl1ZbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvag-0000000AixH-07G9;
	Wed, 18 Jun 2025 16:24:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtri-0000000ASOi-0B6P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 14:34:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A9AC14BF;
	Wed, 18 Jun 2025 07:33:51 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DD8B3F66E;
	Wed, 18 Jun 2025 07:34:11 -0700 (PDT)
Date: Wed, 18 Jun 2025 15:34:09 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>, Yabin Cui <yabinc@google.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 01/11] coresight: etm4x: Control the trace unit in CPU
 suspend
Message-ID: <20250618143409.GE794930@e132581.arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
 <20250516160742.1200904-2-leo.yan@arm.com>
 <f8ef3a37-2be2-4c07-bd88-888fedc4cd4d@linaro.org>
 <58fc37a9-37c4-4a8f-b1b3-6f18f2b67618@arm.com>
 <3766612b-b72d-4ef1-83e7-fe7639104b6c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3766612b-b72d-4ef1-83e7-fe7639104b6c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_073414_170710_94A326A4 
X-CRM114-Status: GOOD (  48.51  )
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

On Wed, Jun 04, 2025 at 11:50:44AM +0100, James Clark wrote:
> On 04/06/2025 10:48 am, Suzuki K Poulose wrote:

[...]

> > > > @@ -1820,6 +1820,11 @@ static int __etm4_cpu_save(struct
> > > > etmv4_drvdata *drvdata)
> > > >       state = drvdata->save_state;
> > > >       state->trcprgctlr = etm4x_read32(csa, TRCPRGCTLR);
> > > > +
> > > > +    /* Stop the trace unit if it is enabled */
> > > > +    if (state->trcprgctlr)
> > > 
> > > etm4_cpu_save() looks at coresight_get_mode() to determine enabled
> > > state. Seems a bit inconsistent to look directly at the enable bit
> > > right after checking coresight_get_mode().
> > 
> > May be this is due to AUX pause case ? The mode could still be PERF, but
> >   the ETM/ETE is disabled ?

Yes. It can be a case that device mode = PERF but the trace unit is
disabled.

> Disabling unconditionally would be harmless, and that's quite a bit of an
> edge case so it might be worth the simplification.

In new version, I will encapsulate most memory barriers and polling into
the trace unit enabling and disable functions.

So if the trace unit is disabled during the CPU idle flow, we can skip
to call the trace unit disabling and enabling, which can avoid the
latency caused by barriers and polling.

> Then __etm4_cpu_save() could remove the duplicate wait on
> TRCSTATR_PMSTABLE_BIT and multiple reads of TRCPRGCTLR. There are other
> inconsistencies like one does etm4x_relaxed_read32(csa, TRCPRGCTLR) and the
> other does etm4x_read32(csa, TRCPRGCTLR).

In __etm4_cpu_save(), tt is a typo for the second polling on
TRCSTATR_PMSTABLE_BIT. Actually it should be IDLE bit. This bug will
be fixed in the new series.

Regarding etm4x_read32() vs etm4x_relaxed_read32(), given the
registers are mapped as Device-nGnRnE, all readings are in order, and
the critical synchronization should have been covered in
etm4_disable_trace_unit(), so I think __etm4_cpu_save() should use
relaxed APIs for all readings.

> > > > +        etm4_disable_trace_unit(drvdata);
> > > > +
> > > 
> > > Section 3.4.1 in ARM IHI 0064H.b doesn't say that anything extra
> > > needs to be done here, and it implies that restoring to an enabled
> > > state should work. It might make sense to mention why it diverges
> > > from the published sequence. Or get the sequence updated?

For example, for ETE and TRF, the driver should firstly disable filter,
and then disable trace unit.

On old ETM IPs, the document suggests to acquire OS Lock to implicitly
disable the trace unit.

We need to consolidate the flow to support all these cases. Simply to
say, in the new patch, I will firstly disable filter and trace unit,
and grab the OS Lock. This can be compatible for all ETM versions. And
I assume anyway we need OS Lock to prevent external debugger's
connection.

> > > I suppose
> > > that document doesn't include ETE and I see there is one extra
> > > register missing from __etm4_cpu_save() which is written to in
> > > etm4_disable_trace_unit().

The section K5.5 Context switching, Arm ARM (ARM DDI 0487 L.a) gives
details for context switching for ETE and TRBE.

> > > Plus we end up doing extra things like two waits on TRCSTATR.PMSTABLE.

This follows section 3.4.1 "The procedure when powering down the PE" of
ARM IHI0064H.b. As said, it is a typo for second polling on
TRCSTATR.PMSTABLE, it should be IDLE bit.

> > I guess, we need to stop the tracing before we reliably capture the
> > register states (similar to the disable/pause sequence).
> > 
> 
> Is that because the counters and comparators are changing? I'm not sure why
> we need to read everything anyway, etm4_enable_hw() is done entirely from
> drvdata, implying that everything we need is already saved.

The register context is defined in section 3.4.4 "Guidelines for trace
unit registers to be saved and restored", ARM IHI0064H.b. We can see
the driver exactly follows up the guidance for saving and restoring
registers.

> If there are only two things that might be different to drvdata (TRCSSCSRn
> and TRCCNTVRn) we could only save those in __etm4_cpu_save(). But then the
> function looks an awful lot like etm4_disable_hw() and I wonder if there
> isn't a way to share the code to show we're doing basically the same thing.
> 
> There are a few other small inconsistencies between disabling and saving
> like etm4_disable_hw() removes power first and __etm4_cpu_save() does it
> last. And __etm4_cpu_restore() doesn't follow the correct sequence to write
> to TRCCLAIMSET.

__etm4_cpu_save() and __etm4_cpu_restore() follow up the document for
operating CLAIM bit. See section 3.4.4 of ARM IHI0064H.b.

I am not sure if there have hole that if driver clears the CLAIM bit
before it is powered down. Seems to me, it is more safe to leave the
hardware to clear the claim bit when it power on the CPU.

Moreover, we can see the OS Lock is locked during CPU idle, this
differs from the enabling / disable flows.

> Could it look something like this:
> 
> void __etm4_cpu_save()
> {
>   etm4_disable_hw(drvdata);
>   drvdata->state_needs_restore = true;
> }
> 
> 
> void __etm4_cpu_restore()
> {
>   etm4_enable_hw(drvdata, false);
>   drvdata->state_needs_restore = false;
> }

Good point. This is a refactoring, except we need to take care each
configuration setting, we also need to consolidate:

- OS Lock;
- Claim bit;
- PowerUp request (TRCPDCR setting).

I have another patch series for refactoring PowerUp request and
pm_save_enable. So I would defer the refactoring in that series.

Thanks,
Leo

> Where the extra argument for enable stops clearing the comparator status:
> 
> void etm4_enable_hw(struct etmv4_drvdata *drvdata, bool clear_cmp)
> {
>   /* clear status bit on restart if using single-shot */
>   if (clear_cmp && (config->ss_ctrl[i] || config->ss_pe_cmp[i]))
>      config->ss_status[i] &= ~TRCSSCSRn_STATUS;

> 
> 
> > Suzuki
> > 
> > > 
> > > >       if (drvdata->nr_pe)
> > > >           state->trcprocselr = etm4x_read32(csa, TRCPROCSELR);
> > > >       state->trcconfigr = etm4x_read32(csa, TRCCONFIGR);
> > > > @@ -1951,7 +1956,6 @@ static void __etm4_cpu_restore(struct
> > > > etmv4_drvdata *drvdata)
> > > >       etm4_cs_unlock(drvdata, csa);
> > > >       etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
> > > > -    etm4x_relaxed_write32(csa, state->trcprgctlr, TRCPRGCTLR);
> > > >       if (drvdata->nr_pe)
> > > >           etm4x_relaxed_write32(csa, state->trcprocselr, TRCPROCSELR);
> > > >       etm4x_relaxed_write32(csa, state->trcconfigr, TRCCONFIGR);
> > > > @@ -2035,6 +2039,15 @@ static void __etm4_cpu_restore(struct
> > > > etmv4_drvdata *drvdata)
> > > >       /* Unlock the OS lock to re-enable trace and external
> > > > debug access */
> > > >       etm4_os_unlock(drvdata);
> > > > +
> > > > +    /*
> > > > +     * Re-enable the trace unit if it was enabled before suspend.
> > > > +     * Put it after etm4_os_unlock() as unlocking the OS lock is the
> > > > +     * prerequisite for enabling the trace unit.
> > > > +     */
> > > > +    if (state->trcprgctlr)
> > > > +        etm4_enable_trace_unit(drvdata);
> > > > +
> > > >       etm4_cs_lock(drvdata, csa);
> > > >   }
> > > 
> > 
> 

