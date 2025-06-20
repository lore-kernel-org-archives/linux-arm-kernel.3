Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB930C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 14:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1fVwyLUNRRQLEW5jE16tOspIQXmMehXwXSn1BH4tOI=; b=Cm6R7z3GUrMnLIrBNvO/6K64wJ
	hIi4RhraePdWnN0LyEPgSNFCIB8c0ypKHXYnFXfn7rGN/Xj6q5l4+f3deVjbj1cyhJDtfKIRJr/re
	XAnB7dRD5VCsWp9iauI+qznKE0b6aamyQphIf5/WKmO31ysNvF5l3KV/rrqTMbSYgML5O8EHGF/g/
	pfTvNu4U0+TGQQv59o28yQnPmqPb5zT4lGn6oqemx2M6D5C90mgkn2qsDpiUOfEewz7ZTThGfPVRG
	Hyiuk+50tNIPENiHUfDCqeKRFQHkKCC3Oo2+EEkD4SLWQUfR+JHF/Dyw56hkQMzYxC2sGYnoMCJ5B
	wTacLspg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSchp-0000000Fqgd-12Lh;
	Fri, 20 Jun 2025 14:27:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScfa-0000000FqR1-16Ur
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 14:24:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8EC3106F;
	Fri, 20 Jun 2025 07:24:21 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBD5D3F58B;
	Fri, 20 Jun 2025 07:24:40 -0700 (PDT)
Date: Fri, 20 Jun 2025 15:24:39 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>, Yabin Cui <yabinc@google.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 05/11] coresight: Save activated path into source
 device
Message-ID: <20250620142439.GL794930@e132581.arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
 <20250516160742.1200904-6-leo.yan@arm.com>
 <788e698d-aa1a-47ba-829f-aef9cd4b7417@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <788e698d-aa1a-47ba-829f-aef9cd4b7417@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_072442_391559_03BB33D9 
X-CRM114-Status: GOOD (  27.20  )
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

On Tue, Jun 03, 2025 at 03:49:26PM +0100, James Clark wrote:

[...]

> > @@ -577,6 +583,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> >   		}
> >   	}
> > +	source = coresight_get_source(path);
> > +	if (coresight_is_percpu_source(source))
> > +		source->path = path;
> > +
> >   out:
> >   	return ret;
> >   err_disable_helpers:
> > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > index 64cee4040daa..cd9709a36b9c 100644
> > --- a/include/linux/coresight.h
> > +++ b/include/linux/coresight.h
> > @@ -265,6 +265,7 @@ struct coresight_trace_id_map {
> >    *		CS_MODE_SYSFS. Otherwise it must be accessed from inside the
> >    *		spinlock.
> >    * @orphan:	true if the component has connections that haven't been linked.
> > + * @path:	activated path pointer (only used for source device).
> >    * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
> >    *		by writing a 1 to the 'enable_sink' file.  A sink can be
> >    *		activated but not yet enabled.  Enabling for a _sink_ happens
> > @@ -291,6 +292,8 @@ struct coresight_device {
> >   	local_t	mode;
> >   	int refcnt;
> >   	bool orphan;
> > +	/* activated path (for source only) */
> > +	struct coresight_path *path;
> 
> This is probably cleaner if it's saved in the new global per-cpu you added
> in patch 2. It's even more specific than "for source only", it's actually
> only for per-cpu sources so it's not worth having it on every device.

We can maintain Coresight path pointers in a global per-CPU data
structure. These path pointers are set and cleared during path enable
and disable operations, respectively. Idle threads can then access
these pointers for power management purposes.

However, the challenge is how we can safely access the path pointer from
an idle thread - particularly because idle threads cannot acquire
coresight_mutex, which is a sleepable lock. Consider a race condition
scenario where SysFS knobs frequently enable and disable paths, while
the corresponding CPUs enter and exit idle states. In such cases, if
an idle thread attempts to access the path pointers, we would need to
use raw spinlocks to ensure safety. This is problematic, as it could
result in the CPU suspend/resume flow waiting on SysFS operations.

This is why it turns out to use lockless approach. Two key background
info:

- Path pointers are not guaranteed to be safe to access in CPU power
  management (PM) notifiers. In contrast, the coresight_device pointer
  of a source device (e.g., an ETM) is safe to access.

  A path's lifecycle begins and ends with SysFS enable and disable
  operations. OTOH, an ETM’s coresight_device pointer is initialized
  during the probe phase and cleared during module removal. Module
  loading and unloading trigger SMP calls for initialization and
  cleanup. These synchronized SMP calls ensure that it is safe for CPU
  PM notifiers to access the source device structure.

- Another factor is that the device mode is used to determine whether
  it is safe to access the path pointer. When a source device is
  enabled, we must ensure that its state transitions from DISABLED to
  an enabled state on the target CPU. This guarantees that the mode,
  and any subsequent operations dependent on it, follow a strictly
  sequential order.

  CPU0                                    CPU1
  etm4_enable()
   ` etm4_enable_sysfs()
      ` smp_call_function_single() ---->  etm4_enable_hw_smp_call()
                                           ` coresight_take_mode(SYSFS)

                                           CPU idle:
                                           etm4_cpu_save()
                                            ` coresight_get_mode()
                                               ^^^
                                               Read out the SYSFS mode
                                               Safely access coresight_device::path

Therefore, safe access to the Coresight path heavily relies on the
mode (as part of the state machine). This is why the patch adds the
path pointer to the same structure as the mode.

Thanks,
Leo

> >   	/* sink specific fields */
> >   	bool sysfs_sink_activated;
> >   	struct dev_ext_attribute *ea;
> 

