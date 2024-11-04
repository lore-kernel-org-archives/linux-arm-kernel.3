Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EA7D132C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajKBdEU5PIQsMa8A/QqMB1RazFgS6G29bWopDu0bhc8=; b=31IiDe2Db2CP9mQAhX+s9y5jn+
	a6KlZycxVoREioEsY1dFEDSwROmt8q3KvnnTH0xLyaaSMZGMsrcdjBOPP5fVycmSRQV3nFg6+Txnq
	71BwQxyS0wP/Jkt0CbmIl3lJCr0AjBhiFRAyaffThFwYPTZpNVKrlssmAhaAdSdK2oYPExIl6YmDh
	YvCklCcZYVATWejsIjHEOqDLX04ZKZBAU9U7SACxA2N4YTN2bdWMHX6XzUrGgHU8IoXzqnp3t6uxB
	EP6cOQ7DEDw/RInP4scZrmgiasM7BUoVy4MZ7brCDOB9k/Hmni2gPf7XEDVd27YU3aMYdLGAWkvQk
	5Z4s07QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xBE-0000000DsAi-0Ig8;
	Mon, 04 Nov 2024 13:31:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x69-0000000Dqrv-0rwy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:26:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CCE96A42F5E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Nov 2024 13:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A906CC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Nov 2024 13:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730726783;
	bh=2npuqEnFVOpXdcm9SyHNNBtDUbAK48QR2TgxQxgOq6A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=heEWASTdPKalH4KWz6yWC0fw1k0Hvpx4eSRAXXtfjQI2Ta4s3XfORXm6PMlDu9obR
	 5soBOxU1UXpU7WVp/8xuac0DzXiOeSEuRe0yBN4MFfO5XztMmqqVybcxOaHdMEBvK2
	 jJZUDpcvNBMX2jlP3APzItgOrYUKyNdv1afZX1fmY01q9shp/7llhziS0c2YUvBDiC
	 CoLMCaCeU5MStfCSKmcBzLBWbhtJ28OPmtK4UH7xt68368RTedY2fa3UxfBzO1g4/K
	 3EToh1KPh6HSJV8WGgSzTzTioRs9xA7WIknyUTzoKl6Zd6N65XBn8XipMVGSPNsAan
	 GspCFnxOWaEug==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-288d70788d6so1919842fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:26:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX4PjyJciis++vrnz7iszG+wbJZWH85AlYUoUa9QJdN92Tt6pcdlAheczAGHg5ZlFAYbQUnkRD+4bm+tMBJFh9C@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5jdslHyyiyE1UEyCE4Gf5ZOdxAgBsuPPzZE+PKiiL7IxRJQH+
	H0oiqgFgoKwy4mpJbYBVeckFJ1uJ4nM5w4dYxF5baCwyOujTytwmU4GDrRMyjtGvicw4UtwXLFb
	iA8kawKUz8fGKFGB1B6gRNTG6nlc=
X-Google-Smtp-Source: AGHT+IEwFMFBr+iB4p24SxLNYDDx9k2+p4Ugv/iXpHNmlITDGQD35niXPFjoyq6b6OZ+jyJiLBzBOtQjvO8fTG5dhZE=
X-Received: by 2002:a05:6870:d203:b0:261:2072:7b5d with SMTP id
 586e51a60fabf-29051d77f8cmr26903985fac.29.1730726782995; Mon, 04 Nov 2024
 05:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20240913132944.1880703-1-beata.michalska@arm.com>
 <20240913132944.1880703-2-beata.michalska@arm.com> <20241029070429.m7q5dkumitoyqxq2@vireshk-i7>
 <CAJZ5v0i2KUPXfeAKhkimetOMpx+5opgt26URJF8cstnZsaeZwA@mail.gmail.com> <Zyh_PG1lAEC4Q3Hr@arm.com>
In-Reply-To: <Zyh_PG1lAEC4Q3Hr@arm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 4 Nov 2024 14:26:04 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gCRKzaFrwkoBpLHQUxoP_+jAyhMiCkLQaBUpduk9yxtA@mail.gmail.com>
Message-ID: <CAJZ5v0gCRKzaFrwkoBpLHQUxoP_+jAyhMiCkLQaBUpduk9yxtA@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
To: Beata Michalska <beata.michalska@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com, sudeep.holla@arm.com, 
	will@kernel.org, catalin.marinas@arm.com, sumitg@nvidia.com, 
	yang@os.amperecomputing.com, vanshikonda@os.amperecomputing.com, 
	lihuisong@huawei.com, zhanjie9@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_052625_428374_7E4BA178 
X-CRM114-Status: GOOD (  36.18  )
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

On Mon, Nov 4, 2024 at 9:01=E2=80=AFAM Beata Michalska <beata.michalska@arm=
.com> wrote:
>
> On Tue, Oct 29, 2024 at 12:31:11PM +0100, Rafael J. Wysocki wrote:
> > On Tue, Oct 29, 2024 at 8:04=E2=80=AFAM Viresh Kumar <viresh.kumar@lina=
ro.org> wrote:
> > >
> > > Apologies for the delay from my side. September was mostly holidays
> > > for me and then I was stuck with other stuff plus email backlog and
> > > this series was always a painful point to return to :(
> > >
> > > On 13-09-24, 14:29, Beata Michalska wrote:
> > > > Currently the CPUFreq core exposes two sysfs attributes that can be=
 used
> > > > to query current frequency of a given CPU(s): namely cpuinfo_cur_fr=
eq
> > > > and scaling_cur_freq. Both provide slightly different view on the
> > > > subject and they do come with their own drawbacks.
> > > >
> > > > cpuinfo_cur_freq provides higher precision though at a cost of bein=
g
> > > > rather expensive. Moreover, the information retrieved via this attr=
ibute
> > > > is somewhat short lived as frequency can change at any point of tim=
e
> > > > making it difficult to reason from.
> > > >
> > > > scaling_cur_freq, on the other hand, tends to be less accurate but =
then
> > > > the actual level of precision (and source of information) varies be=
tween
> > > > architectures making it a bit ambiguous.
> > > >
> > > > The new attribute, cpuinfo_avg_freq, is intended to provide more st=
able,
> > > > distinct interface, exposing an average frequency of a given CPU(s)=
, as
> > > > reported by the hardware, over a time frame spanning no more than a=
 few
> > > > milliseconds. As it requires appropriate hardware support, this
> > > > interface is optional.
> > >
> > > From what I recall, the plan is to:
> > > - keep cpuinfo_cur_freq as it is, not expose for x86 and call ->get()
> > >   for ARM.
> >
> > Yes.
> That one indeed remains unchanged.
> >
> > > - introduce cpuinfo_avg_freq() and make it return frequency from hw
> > >   counters for both ARM and Intel and others who provide the API.
> >
> > Yes.
> Will add changes for Intel as well.
> >
> > > - update scaling_cur_freq() to only return the requested frequency or
> > >   error in case of X86
> >
> > Yes.
> >
> > Preferably, -ENOTSUPP for "setpolicy" drivers without the .get() callba=
ck.
> Right, my impression was that we want to leave that one as is.

For now, yes please.

> Will add appropriate changes.

In the future.

> > >   and update documentation to reflect the same.
> > >   Right now or after some time ? How much time ?
> >
> > After some time, I think at least two cycles, so people have the time
> > to switch over, but much more may be necessary if someone is stuck
> > with RHEL or similar user space.
> >
> > Anyway, x86 will be the only one affected and there may be a Kconfig
> > option even to allow it to be changed at the kernel build time.
> >
> So just for my clarification we want a config switch to control what
> scaling_cur_freq is to actually provide.

Something like:

    if (IS_ENABLED(CONFIG_CPUFREQ_CUR_FREQ_FROM_ARCH))) {
        freq =3D arch_freq_get_on_cpu(policy->cpu);
        if (freq)
            return sysfs_emit(buf, "%u\n", freq);
    }

    if (cpufreq_driver->setpolicy) {
        if (cpufreq_driver->get))
            return sysfs_emit(buf, "%u\n", cpufreq_driver->get(policy->cpu)=
);

        return -ENOTSUPP;
    }

    return sysfs_emit(buf, "%u\n", policy->cur);

And select CONFIG_CPUFREQ_CUR_FREQ_FROM_ARCH on x86 for now.

> It will keep the current behaviour as
> default until we are ready to flip it and ultimately drop that temporary =
config
> option ?

Yes.

> > The documentation for cpuinfo_avg_freq() needs to be added along with i=
t.
> That one is already provided unless you have smth else on mind ?
> Like updating scaling_cur_freq to reference the new sysfs attribute ?

I haven't checked super-thoroughly, but generally all documentation
needs to be consistent.

