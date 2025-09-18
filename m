Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DD1CAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 01:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKNvdhWHFBO2LxeGbbJQCVnxFSJKdVJYeGTN3QpPNOg=; b=3cufRDvbkgFJt4gTOC3p8J/vN2
	KbvApBN7iB2LClOJ2ud7w0Xo1C9p+j7HvfTdswUHn/48O2aGRadztIHmfRoGlsi922ymcVobo6ceX
	p4EK96eAQGIGd5+G+g6uw7AMV5fye+5gvV20WrvxuYqg477XSxly9oUud3dtKkUAHZX5Mz+QRdooB
	zaLZtUQPhXQ3Mb0yQAK+vR6PJvzK3fT9lQcviX3QeDrZyPxzJC3fks53OaEY3jcA1qCkbFEq2+mEi
	yKOm8FlZkbIk24LqArIJH5d2QX1CyYjyfKg+qTr0FFwDDdpXOwoKPGxu2WuZ8VmjkmQiPv+2nvslN
	1ORaA/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz3O3-0000000Fv6L-2Bc8;
	Thu, 18 Sep 2025 01:24:39 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz3O0-0000000Fv5y-2sjM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 01:24:38 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-3318dd36a8fso521028fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 18:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758158674; x=1758763474; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKNvdhWHFBO2LxeGbbJQCVnxFSJKdVJYeGTN3QpPNOg=;
        b=h12OsYsdQgu06t5e9JBR0oABZkJa6YAkxl6kvwJdVsGf7wVlYaUlyExY3cmbryaaGz
         hrEgh94cXROkVJyKLN6x4IBY6k4NM/KssO027vy50K13u5XuxquoRn022bWA4D3YsyCM
         wKJF6Kugxrk1JRtF6H3R02GV1JUpCJCXcBeW4HEp4TCNuEqWqjh+rkg4CGpySYV8xkP3
         MTEq65UMz4CFiC06KrKoP/1Wn59Oh/oMoratLKDj72rcgVJbJv24l0SCxeeau4D9JVK2
         w55APTz00lvRf5ipxR9/wTkus5pRRR8OyH+dlhrADigSVhmcJ2d7B5HERurDpRdX5ceQ
         uwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758158674; x=1758763474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKNvdhWHFBO2LxeGbbJQCVnxFSJKdVJYeGTN3QpPNOg=;
        b=aeP5mLLTBBeOBTUYCh2Oxa4AbOLFZCuu2ROWFes5Xq/8XlW34jl9H1kdVbIi47J+V6
         7ag5mjAsUryTiG8zR6Z+XncXReTwkLJA7sT/I0b+jriCMSvnmh9HshWib7GTSjFIoyH1
         dTG8jaDWGLLMoz7hpSEUK3CODSese+5WNVySxlQivnueEPhGu9G2N8WBLaFBVPAG0mnH
         OvZlg0OEWrqGVGWE2i0T516/4Xlg7vahSAUJLjMq39Scb8bNGd8Lqgzbu/W0XnUe5a6T
         isfsFCvUXR37wDEeXfoeOKnBHAUdp6h6CCR1Lo7qhrVQ7EzMR7yY8HhwVLqdJjXDUkNp
         eulg==
X-Forwarded-Encrypted: i=1; AJvYcCWwHLd7+EOe9L5iPYHN2X9stLWimR81rlG6yyD1crqrdhSOIo9P50ggFtnKbmcZD0PLzm7LoCxE37/Cmm8mFLKH@lists.infradead.org
X-Gm-Message-State: AOJu0YyInKqpS2NbvLC4h4ZNIHmJldyrmsQV0hP170Ht6h3PNnMa3RPc
	Q61DUV1pQ0Ev9w/VdyDMbtgfzZ1nyO7q+I3gnCJzJU30/qT1AxZhShaubf2+dhvAJx1mQXfc7t9
	Q55+7Ha37nRzCcV54IyVPotKXIq0yskipaD8mSMVB9w==
X-Gm-Gg: ASbGnctcdIvYpeVXxiOS26j4ISFHvZ0T/UEULgSxXPhwSlYJM9Y+q+uOy72W0vIH37s
	YH88LTkDCxEuWipY0fGhSzCp60MbeHhNwDO2EUF4t5vBedHeefAtwH7UL/7yTxeW/HFGqKZpbb0
	dk2P31MuBBmmA/dxWOFHdEaz4oUjiEWFS2dVvgknpWntpx+VTynDGGZae2kal+u58gyPnb8wNIN
	vK0hUbFGqUW0e577fPiD7sjBEiOfLHs4bPxndT6HC5suDZLFQElrNnxPSI4
X-Google-Smtp-Source: AGHT+IF7Jz86Ss5xUsOAka6ZfidlIbp3iI6MRj0U1kuwvACRXQMFNLJnzIbP5GFFnb6wKl3sDJlW0BNwASJHgNKIss4=
X-Received: by 2002:a05:6871:7b85:b0:319:c3d3:21da with SMTP id
 586e51a60fabf-335be3b7fb8mr2433435fac.16.1758158674397; Wed, 17 Sep 2025
 18:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250917023007.97637-1-cuiyunhui@bytedance.com> <8863bbfb-326e-1914-4f97-0cc59558a602@huawei.com>
In-Reply-To: <8863bbfb-326e-1914-4f97-0cc59558a602@huawei.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 18 Sep 2025 09:24:23 +0800
X-Gm-Features: AS18NWC8xXQe0_3214vs8m1XMLOxfuglWltR5fxGmhMSH4Oe6OQuLiSS7oHdd1E
Message-ID: <CAEEQ3wmbHuyVMpiU_zaxjgS-Tm8Ve=rDVLgY7qoA-ZBZjx_hJg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] arch_topology: move parse_acpi_topology()
 to common code
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, sudeep.holla@arm.com, 
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	beata.michalska@arm.com, sumitg@nvidia.com, ptsm@linux.microsoft.com, 
	yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_182436_936000_0340A352 
X-CRM114-Status: GOOD (  35.09  )
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

Hi Yicong,

On Wed, Sep 17, 2025 at 2:43=E2=80=AFPM Yicong Yang <yangyicong@huawei.com>=
 wrote:
>
> On 2025/9/17 10:30, Yunhui Cui wrote:
> > Currently, RISC-V lacks arch-specific registers for CPU topology
> > properties and must get them from ACPI. Thus, parse_acpi_topology()
> > is moved from arm64/ to drivers/ for RISC-V reuse.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >  arch/arm64/kernel/topology.c  | 87 +----------------------------------
> >  drivers/base/arch_topology.c  | 85 +++++++++++++++++++++++++++++++++-
> >  include/linux/arch_topology.h |  6 +++
> >  3 files changed, 91 insertions(+), 87 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.=
c
> > index 5d07ee85bdae4..55650db53b526 100644
> > --- a/arch/arm64/kernel/topology.c
> > +++ b/arch/arm64/kernel/topology.c
> > @@ -26,7 +26,7 @@
> >  #include <asm/topology.h>
> >
> >  #ifdef CONFIG_ACPI
> > -static bool __init acpi_cpu_is_threaded(int cpu)
> > +bool __init acpi_cpu_is_threaded(int cpu)
> >  {
> >       int is_threaded =3D acpi_pptt_cpu_is_thread(cpu);
> >
> > @@ -39,91 +39,6 @@ static bool __init acpi_cpu_is_threaded(int cpu)
> >
> >       return !!is_threaded;
> >  }
> > -
> > -struct cpu_smt_info {
> > -     unsigned int thread_num;
> > -     int core_id;
> > -};
> > -
> > -/*
> > - * Propagate the topology information of the processor_topology_node t=
ree to the
> > - * cpu_topology array.
> > - */
> > -int __init parse_acpi_topology(void)
> > -{
> > -     unsigned int max_smt_thread_num =3D 1;
> > -     struct cpu_smt_info *entry;
> > -     struct xarray hetero_cpu;
> > -     unsigned long hetero_id;
> > -     int cpu, topology_id;
> > -
> > -     if (acpi_disabled)
> > -             return 0;
> > -
> > -     xa_init(&hetero_cpu);
> > -
> > -     for_each_possible_cpu(cpu) {
> > -             topology_id =3D find_acpi_cpu_topology(cpu, 0);
> > -             if (topology_id < 0)
> > -                     return topology_id;
> > -
> > -             if (acpi_cpu_is_threaded(cpu)) {
> > -                     cpu_topology[cpu].thread_id =3D topology_id;
> > -                     topology_id =3D find_acpi_cpu_topology(cpu, 1);
> > -                     cpu_topology[cpu].core_id   =3D topology_id;
> > -
> > -                     /*
> > -                      * In the PPTT, CPUs below a node with the 'ident=
ical
> > -                      * implementation' flag have the same number of t=
hreads.
> > -                      * Count the number of threads for only one CPU (=
i.e.
> > -                      * one core_id) among those with the same hetero_=
id.
> > -                      * See the comment of find_acpi_cpu_topology_hete=
ro_id()
> > -                      * for more details.
> > -                      *
> > -                      * One entry is created for each node having:
> > -                      * - the 'identical implementation' flag
> > -                      * - its parent not having the flag
> > -                      */
> > -                     hetero_id =3D find_acpi_cpu_topology_hetero_id(cp=
u);
> > -                     entry =3D xa_load(&hetero_cpu, hetero_id);
> > -                     if (!entry) {
> > -                             entry =3D kzalloc(sizeof(*entry), GFP_KER=
NEL);
> > -                             WARN_ON_ONCE(!entry);
> > -
> > -                             if (entry) {
> > -                                     entry->core_id =3D topology_id;
> > -                                     entry->thread_num =3D 1;
> > -                                     xa_store(&hetero_cpu, hetero_id,
> > -                                              entry, GFP_KERNEL);
> > -                             }
> > -                     } else if (entry->core_id =3D=3D topology_id) {
> > -                             entry->thread_num++;
> > -                     }
> > -             } else {
> > -                     cpu_topology[cpu].thread_id  =3D -1;
> > -                     cpu_topology[cpu].core_id    =3D topology_id;
> > -             }
> > -             topology_id =3D find_acpi_cpu_topology_cluster(cpu);
> > -             cpu_topology[cpu].cluster_id =3D topology_id;
> > -             topology_id =3D find_acpi_cpu_topology_package(cpu);
> > -             cpu_topology[cpu].package_id =3D topology_id;
> > -     }
> > -
> > -     /*
> > -      * This is a short loop since the number of XArray elements is th=
e
> > -      * number of heterogeneous CPU clusters. On a homogeneous system
> > -      * there's only one entry in the XArray.
> > -      */
> > -     xa_for_each(&hetero_cpu, hetero_id, entry) {
> > -             max_smt_thread_num =3D max(max_smt_thread_num, entry->thr=
ead_num);
> > -             xa_erase(&hetero_cpu, hetero_id);
> > -             kfree(entry);
> > -     }
> > -
> > -     cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> > -     xa_destroy(&hetero_cpu);
> > -     return 0;
> > -}
> >  #endif
> >
> >  #ifdef CONFIG_ARM64_AMU_EXTN
> > diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.=
c
> > index 1037169abb459..65ec1f3d2bd28 100644
> > --- a/drivers/base/arch_topology.c
> > +++ b/drivers/base/arch_topology.c
> > @@ -823,12 +823,95 @@ void remove_cpu_topology(unsigned int cpu)
> >       clear_cpu_topology(cpu);
> >  }
> >
> > +__weak bool __init acpi_cpu_is_threaded(int cpu)
> > +{
> > +     int is_threaded =3D acpi_pptt_cpu_is_thread(cpu);
> > +
> > +     return !!is_threaded;
> > +
>
> acpi_pptt_cpu_is_thread() could return an error which shouldn't be
> regarded as a threaded cpu.
>
> > +}
> > +
> > +#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
> > +/*
> > + * Propagate the topology information of the processor_topology_node t=
ree to the
> > + * cpu_topology array.
> > + */
> >  __weak int __init parse_acpi_topology(void)
> >  {
> > +     unsigned int max_smt_thread_num =3D 1;
> > +     struct cpu_smt_info *entry;
> > +     struct xarray hetero_cpu;
> > +     unsigned long hetero_id;
> > +     int cpu, topology_id;
> > +
> > +     if (acpi_disabled)
> > +             return 0;
> > +
> > +     xa_init(&hetero_cpu);
> > +
> > +     for_each_possible_cpu(cpu) {
> > +             topology_id =3D find_acpi_cpu_topology(cpu, 0);
> > +             if (topology_id < 0)
> > +                     return topology_id;
> > +
> > +             if (acpi_cpu_is_threaded(cpu)) {
> > +                     cpu_topology[cpu].thread_id =3D topology_id;
> > +                     topology_id =3D find_acpi_cpu_topology(cpu, 1);
> > +                     cpu_topology[cpu].core_id   =3D topology_id;
> > +
> > +                     /*
> > +                      * In the PPTT, CPUs below a node with the 'ident=
ical
> > +                      * implementation' flag have the same number of t=
hreads.
> > +                      * Count the number of threads for only one CPU (=
i.e.
> > +                      * one core_id) among those with the same hetero_=
id.
> > +                      * See the comment of find_acpi_cpu_topology_hete=
ro_id()
> > +                      * for more details.
> > +                      *
> > +                      * One entry is created for each node having:
> > +                      * - the 'identical implementation' flag
> > +                      * - its parent not having the flag
> > +                      */
> > +                     hetero_id =3D find_acpi_cpu_topology_hetero_id(cp=
u);
> > +                     entry =3D xa_load(&hetero_cpu, hetero_id);
> > +                     if (!entry) {
> > +                             entry =3D kzalloc(sizeof(*entry), GFP_KER=
NEL);
> > +                             WARN_ON_ONCE(!entry);
> > +
> > +                             if (entry) {
> > +                                     entry->core_id =3D topology_id;
> > +                                     entry->thread_num =3D 1;
> > +                                     xa_store(&hetero_cpu, hetero_id,
> > +                                              entry, GFP_KERNEL);
> > +                             }
> > +                     } else if (entry->core_id =3D=3D topology_id) {
> > +                             entry->thread_num++;
> > +                     }
> > +             } else {
> > +                     cpu_topology[cpu].thread_id  =3D -1;
> > +                     cpu_topology[cpu].core_id    =3D topology_id;
> > +             }
> > +             topology_id =3D find_acpi_cpu_topology_cluster(cpu);
> > +             cpu_topology[cpu].cluster_id =3D topology_id;
> > +             topology_id =3D find_acpi_cpu_topology_package(cpu);
> > +             cpu_topology[cpu].package_id =3D topology_id;
> > +     }
> > +
> > +     /*
> > +      * This is a short loop since the number of XArray elements is th=
e
> > +      * number of heterogeneous CPU clusters. On a homogeneous system
> > +      * there's only one entry in the XArray.
> > +      */
> > +     xa_for_each(&hetero_cpu, hetero_id, entry) {
> > +             max_smt_thread_num =3D max(max_smt_thread_num, entry->thr=
ead_num);
> > +             xa_erase(&hetero_cpu, hetero_id);
> > +             kfree(entry);
> > +     }
> > +
> > +     cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> > +     xa_destroy(&hetero_cpu);
> >       return 0;
> >  }
> >
> > -#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
> >  void __init init_cpu_topology(void)
> >  {
> >       int cpu, ret;
> > diff --git a/include/linux/arch_topology.h b/include/linux/arch_topolog=
y.h
> > index d72d6e5aa2002..50d33b5a78ccd 100644
> > --- a/include/linux/arch_topology.h
> > +++ b/include/linux/arch_topology.h
> > @@ -70,6 +70,11 @@ struct cpu_topology {
> >       cpumask_t llc_sibling;
> >  };
> >
> > +struct cpu_smt_info {
> > +     unsigned int thread_num;
> > +     int core_id;
> > +};
> > +
>
> this is only used in parse_acpi_topology() and seems no reason to make it=
 into
> the header.

Okay, I'll update it in v2.

>
> otherwise looks good to me. most acpi topology building code is not arm64
> specific and make sense to make it common.
>
> thanks.
>

Thanks,
Yunhui

