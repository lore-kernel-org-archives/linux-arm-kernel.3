Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBB6CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 02:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0QORqRcXwquGy41hfYPTm7m7eorswVdTE/ZANLL/sQ=; b=UZ98CqMrqpFPW8HqMf+jkMYhUC
	7Oj4fIDuwwJ0VYDt8Y2uaaCcwBsePbudg0KoVQ1gn5JvTlGzwcbIIYLMct75OBjgqil86t4hz3+N5
	GsJO6ZscDwnd9PTLdcJEHKtUn7FdN/AvGEZQoPz70PNDC1M3efkMZrm3MreLc7rmGdUNnc5rOoDQt
	4CfieGOjn4yxtPZElGy1acqR2xXTAcbN+irCFPMIZVjEDUbsWN8BrCa2KR+kjroe1Bh5yEpM2Ftu7
	twnhM3daxjDaXkPPiF7KLBYkg+PFLtov9Ywwc0FMUrcVFWphO3QIt6thBCHITmK87sJOL9bice750
	dBP3BLGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0W9A-00000008ay3-0tKD;
	Mon, 22 Sep 2025 02:19:20 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0W93-00000008av6-0wFC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 02:19:19 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-341f608661aso355283fac.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 19:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758507548; x=1759112348; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0QORqRcXwquGy41hfYPTm7m7eorswVdTE/ZANLL/sQ=;
        b=fLhHpObsqRwG440AYHxGiUldAowp2iXX+VDvp8IENQOocT/U7y0SEWDEX7dAcyZBqX
         /UdkloQYxI66OHbngJ/FINL9FwiFQ3MV3GIrnxzR40xzmxzkd6UZTBTSrVtFSObO51eg
         m22Cowiq7v9JGmEoh+C99By11tY3bl6+QWYkfEnAlNDm7gsCzSGiwZ2OSVKREeu0l645
         QVDdNBaFD/3yXQdZlpCu8+P1Hkuycj11G1wHuSm+ySx86x3d08JiiUgtx5y2RHv+0k6L
         hsQ/SNmtJPOfz+quvWKNYh8nKiGuBFxStBKAr2hLjfZalAFtkBUulY0xyugF06K9U5GA
         Z1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758507548; x=1759112348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0QORqRcXwquGy41hfYPTm7m7eorswVdTE/ZANLL/sQ=;
        b=tKD0ydxTGh/t5nWkXhEwijxAuH9yp6LZFzpkugiZCn9dEYJrei9W9WUnGuu7Z2awxe
         0EiU0PPhDyCKS7oYz2zx2bAltvhuQllOQTKbmWxAE6a4VW0+4w6mq2FpAMyMUmv3EAas
         9J/az0RlM223K9/txUHILNjdJ/T5I8lUx4lxh+MSr9ZVPE0npnENX7pfoPxs5dmQMG8A
         bCPwFVqJwF6eSYRNFdfpKEU0QW4A7Xn+Qv+cDojp0B6KG0lZnliwilEDXnDzeYsTmHF7
         yyTeWww9V8IzAzN4BEkY9QhE6y/EjsNInYnlcGJmg4FjYfz3tGYKABkhg6DfEwlmfcB5
         RNTA==
X-Forwarded-Encrypted: i=1; AJvYcCWVh+dD67wahfk6obMtIXs76qHi0mNsRc9uA7Z72w9qJxTx8pBI99rdURhKDHaVn5eA2WxZ7Q4DRn1Q6EoIsQH3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1HA19gFv7aj6l+QgZeXuBrkdwRyT87IV/4cYPIrMIngl5Nv+r
	t8yR9NQN6NmjU9FKgph5ALYtin3Bo/PeSauL5pFPOazNdBHGvK6gk8O/gDsngvMgr/WRxFOvDFW
	9r9D8/kF9oU3CXQY6apEvfr+A1Re7FEiT1mP5N1dK4g==
X-Gm-Gg: ASbGnct9duMpl0zdR6cxf6pvq8uHsnCyCyAiA2PkwNK0ai66Eg8wPZSCya27CX9v4cE
	cbV7RqDKu9W1p5YBXkjODgkvAKtvV0m8kosCikxP7riP4Lu3dD5sFSjOeitDesIDhuMN65lE1xz
	vBT1P2ht8dQuiP3A3AKQ3M6b8EVYpPpNxGjdhnukskaPt2FSa+lYAvaiCntamdgk0DKpiZ7FDME
	elMSMZ7BlHz7g==
X-Google-Smtp-Source: AGHT+IESga7w6Wf99SnDt7tdMXCevhJ5p2R1RhYk6MWzPIeMjshgBHSu9yatJ4O8NG1AQJuCdRaSODMV+K4WZ7Dfn8w=
X-Received: by 2002:a05:6870:d0c4:b0:344:5201:15a4 with SMTP id
 586e51a60fabf-34452011f45mr361519fac.16.1758507548141; Sun, 21 Sep 2025
 19:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250919085918.5442-1-cuiyunhui@bytedance.com>
 <20250919085918.5442-2-cuiyunhui@bytedance.com> <20250919-colossal-splendid-bettong-e5a0bd@sudeepholla>
In-Reply-To: <20250919-colossal-splendid-bettong-e5a0bd@sudeepholla>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 22 Sep 2025 10:18:57 +0800
X-Gm-Features: AS18NWCOurZMvR8qBP_HWSnFuyzm-oFke02otvNlqyB8VgAFda0Z_pS9f2f5cAo
Message-ID: <CAEEQ3wkRoX5Y5xQu22kVCFxEy8fgcUxKHEm=9Bpg7g-Np8b-SA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 1/1] arch_topology: move
 parse_acpi_topology() to common code
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, dakr@kernel.org, beata.michalska@arm.com, 
	ptsm@linux.microsoft.com, sumitg@nvidia.com, yangyicong@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_191913_389950_594D9C46 
X-CRM114-Status: GOOD (  33.77  )
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

Hi Sudeep,

On Fri, Sep 19, 2025 at 10:05=E2=80=AFPM Sudeep Holla <sudeep.holla@arm.com=
> wrote:
>
> On Fri, Sep 19, 2025 at 04:59:18PM +0800, Yunhui Cui wrote:
> > Currently, RISC-V lacks arch-specific registers for CPU topology
> > properties and must get them from ACPI. Thus, parse_acpi_topology()
> > is moved from arm64/ to drivers/ for RISC-V reuse.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >  arch/arm64/kernel/topology.c  | 87 +---------------------------------
> >  drivers/base/arch_topology.c  | 89 ++++++++++++++++++++++++++++++++++-
> >  include/linux/arch_topology.h |  1 +
> >  3 files changed, 90 insertions(+), 87 deletions(-)
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
> > index 1037169abb459..09f77fd549490 100644
> > --- a/drivers/base/arch_topology.c
> > +++ b/drivers/base/arch_topology.c
> > @@ -823,12 +823,99 @@ void remove_cpu_topology(unsigned int cpu)
> >       clear_cpu_topology(cpu);
> >  }
> >
> > +__weak bool __init acpi_cpu_is_threaded(int cpu)
> > +{
> > +     int is_threaded =3D acpi_pptt_cpu_is_thread(cpu);
> > +
>
> Just thinking if it makes sense keep acpi_cpu_is_threaded generic without
> the need for weak definition.
>
> Additional note: not sure why you haven't moved this under CONFIG_ARM64/R=
ISCV as
> done with other code.
>
> bool __init acpi_cpu_is_threaded(int cpu)
> {
>         int is_threaded =3D acpi_pptt_cpu_is_thread(cpu);
>
>         /*
>          * if the PPTT doesn't have thread information, check for archite=
cture
>          * specific fallback if available
>          */
>         if (is_threaded < 0)
>                 is_threaded =3D arch_cpu_is_threaded();
>
>         return !!is_threaded;
> }
>
> Then you can just have the define in
>
> #define arch_cpu_is_threaded() (read_cpuid_mpidr() & MPIDR_MT_BITMASK)
>
> in arch/arm64/include/asm/topology.h
>
> and
>
> +#ifndef arch_cpu_is_threaded
> +#define arch_cpu_is_threaded           (0)
> +#endif
>
> in include/linux/arch_topology.h
>
> Thoughts ?

If placed in include/linux/arch_topology.h, there is a possibility
that "arch_cpu_is_threaded" will be redefined.

include/linux/topology.h
    #include <linux/arch_topology.h>
        #ifndef arch_cpu_is_threaded
        #define arch_cpu_is_threaded()  (0)
        #endif
    #include <asm/topology.h>
        #define arch_cpu_is_threaded() (read_cpuid_mpidr() & MPIDR_MT_BITMA=
SK)

Therefore, it is better to place it in include/asm-generic/topology.h.
What do you think?

>
> --
> Regards,
> Sudeep

Thanks,
Yunhui

