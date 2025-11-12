Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB55CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4/fJLZENDtvS5J98U1xQRkgCGJbnGa0twDW00i6rIE=; b=GIN+NCnviyG3NBZBZLyfcrMAWU
	8MyBkQBuubLq8/kCupKQbr4JY0Ypp9wsBT8nP8CqTL7lbL5iXk8KqRFaFwV1GvEfRSzhvQsZDzRcD
	QDG54nFADkcroZFWYHHgSZDT8aNUq5evX6x1do63B4MGfWOm4Z3snD0cDXXWxovYqs8v6z1zNXbfQ
	00pE2m4ILBEWE/7pxDpX/dRS+8i/jmGFn+fZzXjXOoahyLmR0WcZz/SjZy6O8BgA5JRt9nkTQ3lk0
	S+auuzEQRxUkqwX4KEvnTzv9bOJgVV8emQL6vamwG8JIOBoCfap1of/uBbFqg9jt60Hf9rcUzJ2+5
	VLXLozVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9Up-00000008jF9-09jM;
	Wed, 12 Nov 2025 11:58:43 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9Ul-00000008jEn-2hOd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:58:41 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8b21fa7b91bso79040785a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 03:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762948718; x=1763553518; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4/fJLZENDtvS5J98U1xQRkgCGJbnGa0twDW00i6rIE=;
        b=c530rLGtl5cC0chBQ7nk0DmiE9aP8DcGtsWHokxg+pAcenQOSMske/02dz9z4PVa+X
         kjrvItyZx/3oEuIUzw3JkTAtA4/pBtWmbGq6N8sTxu/zGDNv5SZo+Nlp4vlWrv34ZuWJ
         RhAdJww0eKUIXy5+YPAgxibbJJ33xVfQbQfomWGIcrLe0ydqv49AbXtgHO5Hz4o4j2d/
         uNrl4TbDyFI/m8IcHnVB8ReKGxw8qggr3fVjzP4w4I8n60XgCzHBZYTb2okpzyQVKFwr
         PKCpHy/NEKhuGrF0xGm7clskQ3G3Ds2BYNUggKiifruQLweTjTMBk5ZeE0cZTMdJtSOX
         ksXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762948718; x=1763553518;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4/fJLZENDtvS5J98U1xQRkgCGJbnGa0twDW00i6rIE=;
        b=b35WhYMZF0aToQRS30ZFnriVyegr1M0jV/5X3x8YJcUH7dZ10U1CwGXuh0w+INaY59
         E0W8yW6eshVO58oAvFjVyh8/YoXg9iI3RmSDVIwcPVeDak5VWY2b2BxHPE7hdrmwGvMa
         B6hS1HBtXlbPccYTopX+/JxGKZHnr9EJYs3SW89O6cB8exUJSWISQa+dLBOzv/bOxa76
         uCUiCgj+9OQT2nqXVO5gMLgpfBzZbf06dD97X52OHym0jmDqVlgXnql6w/ajItHDPMdG
         TNmEx0nWgBFVenkZV+Vtsak8IHdJ4icVbFUZGWemZ5YLGbBVhyopi+AcmOPy5KfuA30G
         0uxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3/mkzI/KzCpamOhdRdDX7S/yDv4op2iDyMv1WwZcg8dnz0cDuDM8jedCyJPR3d7RZf9kEoRdVYOSmUtleakjU@lists.infradead.org
X-Gm-Message-State: AOJu0YydupRxj+q/8U8Fi+c/Eu7eWsjV0lsz10CV27ivti612zADi6w4
	NZZIMjIgw4IUy/uhZ9dGLFVDPcAxpLSFrd5d7Z1nMBgP8L2zohCbOBf3QH91RUEDUmrE0xKe83x
	pvHAGARpWQotT9l9dOwagl5TVREqzj0lMVOBJLNXn+g==
X-Gm-Gg: ASbGncs3fmGMhfVTk33MVTcUKL3serXXWKrp+4fpnFKTJmhkNIqIetbkEZGNoF2w2lj
	jH6miLFtAyQb95jS4NLj9Qw+p8NG3XXAmG/w0OiZc5a8/GtN9UN6IpREBkKAIEqTv1gluvKwhIQ
	wC97//aWXh47ebSqMaj5ojcJ9Gy2WOTK0jh3/7qM4jRb5Nm3asmLc8gQeUOL5kLq3drKAXezUyZ
	poPl8LNA78GJwCst9KKgksBACV1dhwVt3C8HnggN7nCg+pIkzUTOTXK3CaOYSh50906BEALlcOd
	A0FwQEiL9NU3Tt8jFQ==
X-Google-Smtp-Source: AGHT+IETIp8W4pYxCmoKGbnmNOx2PtUmKSkUiZhwZvG6VokOSDI54INQTv4wAyukhcSWp2FphLvXTzu6ti6fFFTE9eQ=
X-Received: by 2002:a05:620a:2a11:b0:8b1:2fab:30c9 with SMTP id
 af79cd13be357-8b29b76607amr296337985a.2.1762948718128; Wed, 12 Nov 2025
 03:58:38 -0800 (PST)
MIME-Version: 1.0
References: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
 <20251111-arm_coresight_power_management_fix-v6-11-f55553b6c8b3@arm.com>
 <CAJ9a7VjpmWdethzwpKuo8mvGxU69HjZieGh+6iqTN6aSEow5gA@mail.gmail.com> <20251112111923.GG281971@e132581.arm.com>
In-Reply-To: <20251112111923.GG281971@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 12 Nov 2025 11:58:26 +0000
X-Gm-Features: AWmQ_bllvW6tc9--v9PPqeo6mvAU06uhRKKZA8XxUfe1qYJ2VOyyDn6srs8YIr0
Message-ID: <CAJ9a7Vjj_KXA0aSvDPatg3eN-PJ3Q878n2RF53aKJK1r53d8SA@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] coresight: etm4x: Reuse normal enable and
 disable logic in CPU idle
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_035839_729766_CDE164BF 
X-CRM114-Status: GOOD (  57.23  )
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

Hi Leo

On Wed, 12 Nov 2025 at 11:19, Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Mike,
>
> On Wed, Nov 12, 2025 at 09:16:46AM +0000, Mike Leach wrote:
> > Hi Leo,
> >
> > The save/restore sequence is only used if the ETM is active at the
> > time of power down.
> >
> > However, by removing the specific save/restore structure, and using
> > the existing drvdata->config structure, the actual state can be
> > changed by sysfs from another PE, as the sysfs accesses only write to
> > the drvdata->config structure and not the actual hardware.  Thus this
> > change permits the corruption of the saved state, which will result in
> > restore != saved..
> >
> >  While using the same code is a good idea avoiding lots of
> > duplication, it may be necessary to have a copy of the drvdata->config
> > passed in to the relevant functions.
> >
> > We have considered in the past if it might be worthwhile isolating the
> > sysfs and perf config settings in the etm - it may be worth
> > re-visiting this again with a save restore copy in mind to.
>
> Yes, Levi reminded me he already has some patches [1] to address the
> issue.  Basically, the series returns -EBUSY if trying to write sysfs
> knobs but the device has been enabled.
>

This does solve the problem and as such should become part of this set
rather than have it as a separate set, or must precede this set so no
potential issue is created using this set.

> Actually, we have another solution (credits to Levi who has worked on
> it with some internal discussion).  Let me elaberate at here:
>
> Similiar to you suggested "isolating sysfs and perf config setting",
> but isolate in a different way:
>
>   User's config: it is a set parameters stored for setting from user
>   space. It can come from sysfs knobs or from cscfs parameters.
>
>   Hardware's config: it is a set parameters for setting hardware
>   registers (we can simply use drvdata->config for this purpose).
>
> As a result, every time when a session is enabled (it can be a sysfs
> session or perf session), we apply user's config for updating
> hardware's config (e.g., in etm4_enable_sysfs() / etm4_enable_perf()),
> afterwards, when invoke etm4_disable_hw() / etm4_enable_hw(), we
> only use hardware's config for register setting.
>

Has this set been sent to the coresight mailing list - I do not
believe I have seen it?

> This can naturally resolve the mismatched issue you mentioned in CPU
> PM save and restore, and this can benefit us for later consolidating
> cscfg parameters.
>

What consolidation of cscfg parameters? Not seen anything on this either?

> I prefer we can use a separate patch series to address this issue (I
> should review Levi's patch series so can make things proceed). At the
> meantime, I would say this patch is still valid.
>
> As a side topic, actually we have found issues for the config is
> reset when start a session so the user's config does not take affect at
> all (see etm4_set_default_config()).
>

This code is used by the perf session - not the sysfs session. This is
deliberate to start from a stable state and add any configuration from
the perf command line.
The perf session deliberately ignores parameters set by sysfs - in
fact the first act in parsing the perf event structure in
etm4_parse_event_config(), is to completely zero out the entire config
structure. Then the default config is set - which guarantees trace is
captured, then any perf command line options are set in the registers
(e.g. timestamps, address filtering etc). After this if we have s
cscfg configuration active, this too is added in.

This ensures that the configuration run on all the ETMs used during
the perf session is identical - which cannot be guaranteed if we used
sysfs set parameters as part of the perf session, as each ETM might
have different parameters set by sysfs.This gives us predictable,
stable and repeatable perf configurations.

For sysfs sessions the config for a given etm is whatever has been set
using sysfs + any active cscfg config settings.Here it is adbantageous
to use a cscfg as this is applied to all etms being enabled by sysfs -
without the need to use the syfs files for each individual etm.

Regards

Mike.

> [1] https://lore.kernel.org/linux-arm-kernel/20241221165934.1161856-2-yeoreum.yun@arm.com/
>
> > On Tue, 11 Nov 2025 at 18:59, Leo Yan <leo.yan@arm.com> wrote:
> > >
> > > The etm4_enable_trace_unit() function is almost identical to the restore
> > > flow, with a few differences listed below:
> > >
> > > 1) TRCQCTLR register
> > >
> > >    The TRCQCTLR register is saved and restored during CPU idle, but it
> > >    is never touched in the normal flow. Given the Q element is not
> > >    enabled (TRCCONFIGR.QE bits), it is acceptable to omit saving and
> > >    restoring this register during idle.
> > >
> > > 2) TRCSSCSRn.STATUS bit
> > >
> > >    The restore flow does not explicitly clear the TRCSSCSRn.STATUS bit
> > >    but instead directly loads the saved value. In contrast, the normal
> > >    flow clears this bit to 0 when re-enabling single-shot control.
> > >
> > >    Therefore, the restore function passes the restart_ss argument as
> > >    false to etm4_enable_hw() to avoid re-enabling single-shot mode.
> > >
> > > 3) Claim Tag Handling
> > >
> > >    The claim tag is acquired and released in normal flow, on the other
> > >    hand, the claim protocol is not applied in CPU idle flow - it simply
> > >    restores the saved value.
> > >
> > >    The claim bits serve two purpose:
> > >
> > >    * Exclusive access between the kernel driver and an external
> > >      debugger. During CPU idle, the kernel driver locks the OS Lock,
> > >      ensuring that the external debugger cannot access the trace unit.
> > >      Therefore, it is safe to release the claim tag during idle.
> > >
> > >    * Notification to supervisory software to save/restore context for
> > >      external debuggers. The kernel driver does not touch the external
> > >      debugger's claim bit (ETMCLAIM[0]).
> > >
> > >    Based on this, it is safe to acquire and release claim tag in the
> > >    idle sequence.
> > >
> > > 4) OS Lock Behavior
> > >
> > >    The OS Lock should be locked during CPU idle states. This differs
> > >    from the normal flow, which unlock it. This special handling remains
> > >    in the CPU save path.
> > >
> > > This commit reuses the normal enable and disable logic in the CPU idle
> > > path. The common disable logic is moved into a new function
> > > __etm4_disable_hw(), which omits the etm4_cs_{unlock|lock}() pairs and
> > > is convenient to call from the save callback.
> > >
> >
> > Why omit cs lock/unlock? Not unlocking the software lock prevents the
> > claim tag registers from being written, which contradicts 3) above,
> > and prevents other writes during the disable sequence.
>
> Sorry for confusion.
>
> I will update the commit log:
>
>   Split the hardware disable sequence into a new function
>   __etm4_disable_hw(), which performs the common disable
>   logic without the CoreSight lock.
>
>   __etm4_cpu_save() has its own CoreSight lock handling, it
>   calls __etm4_disable_hw() so without duplicate lock issues.
>
> Thanks,
> Leo



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

