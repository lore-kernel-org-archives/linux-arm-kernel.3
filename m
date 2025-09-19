Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062B8CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QsXIafW/VgjsiAW8R+NVNQPndfw9x15UwH8DtlZ7N4=; b=zuqYAfurrXMLEbjU6KFtqn1kez
	pLU/jveXhbI75j/AKxRFMvqNUnjwLBOK7X1RrdyNyupwnbBOR4PiN+bhazwIjhvVLSa2IpmLc7Xfs
	z1iXRMQFwq9SWUmzLfhMA5C2Bo9dzs8N1LiaF+RIs2FkxsMlGFx6lkdwkoKN79e+xGf0R8TtY8p+y
	d5F/JhtnSvEq3Zh9O7S4mdOoGwdIn+IsKDjPkM5FTtk8ved97nUpxk3u0XX/Padfcx5Mqa3pAWKei
	zuMevmVpx5lbu0JxkUK/EUkfKBVPnd/DHhmAFZO7f1+cfqrbNlrqqftAb+hzYOwtfvs7sj/X/o2j7
	2AhLSteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWMj-00000002EYS-40Qe;
	Fri, 19 Sep 2025 08:21:13 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWMh-00000002EXe-2pzk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 08:21:13 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-31d8778ce02so2122823fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 01:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758270069; x=1758874869; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QsXIafW/VgjsiAW8R+NVNQPndfw9x15UwH8DtlZ7N4=;
        b=ToK7tzB7MSVM4jfBTqfy7IjSm0mPfH3ClvIgFGG+r9acPm/02i0W+6XsPTXaW0Jy48
         7Kgv0W2PWgA5FRqp+lhyCVuHMKhpYucsBlrh6uMYq1qyQHQM45stPtPGCpbdqtg1K1d8
         DuptHq9VmkqzrFgdGBW37thY038Qn9ZuTspoT7ubgRyNZAccKMBP7jTD84T/nRbHp8Hu
         fvmTDdeKn9PqFM5PBCUmoSmrF8UX47fDga8he8QfRxSZzIxOFZ2P4vOKwHIUQ7tZYyRQ
         4SfD112wcbg13U/4U5Itwll9WpFAigKhDANs8N+snvk4VdXYJHZsSybsvpEMmb4C6V4U
         WKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758270069; x=1758874869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QsXIafW/VgjsiAW8R+NVNQPndfw9x15UwH8DtlZ7N4=;
        b=ZE6iZUlHZzrtlNn0Yw0JvVBw1MngRNmyaf/ETmjajxEQ5Su6z81CPa6ajp6Mj5CrJt
         0tt/PPRb6fXTbxpzPtPq7LlDStM2Wg1Jkg15FPPIOwYuo19ncDiGyr/noZSSMyWVxmOp
         f9N81WVRcDImbhX4vQ9Xr6jB0aRtQAnKwUH9rxIKoKibv7ed6NPboJu1qGMti4mjgfD3
         TdmnAa7vA4J7W4Cz2X46nZFFBY5tzWE8rMxOU3OC/QSmehp3m4uQR08nEoLvM1Ggza8A
         VAcjEH4sr9C656XrCllvx17YwkJiszjPdbPEmTSPfKYszi8Cou7Pkw7R0uHZQKFwyUxN
         wodw==
X-Forwarded-Encrypted: i=1; AJvYcCWMAEOA2ikfi8LzYZzaX/s4TyKBgETzpvKPmbVcPOQ+86UA0OKjzNIRop3nROGE1vqDNTzZ+kl51d9CIV6Y1kq5@lists.infradead.org
X-Gm-Message-State: AOJu0YyDU5kaKfI6iTx6f5xQXevUplKwthS6WILclwEaKLmRj+DPdOmt
	djTBpezGo3ONXGfsLBTeliD2PCHtYboali10hRLNpOjj5in4EH+QZZaFUNaDIflqBbSEPbaXr35
	PW5FNLVHmotYUlxZ8xVBoF5nZ8HrrVK+8Jwy/iY4oKA==
X-Gm-Gg: ASbGncsAozvnxSOy7iPPI6jrMo4YZkJOgHA7y0MpBJd1GpAjKtj2MVgWAJRkxb19gtl
	C7WwlIfObUhBGp5IiB2g6KwdWCapaG+CyqsXtnBc1j+fZknZqxwCVAO4lEAq78rQk6Y2hKaY4DH
	P3+XqZJsXV8+vLTbMSHJbMswemKvefmedMs6t50pKUWtoFo42TERz9fBP0WeAHd04zksOfRaudW
	NaYXQyuwCztRC/KgZNBxVA8
X-Google-Smtp-Source: AGHT+IG8MDbvqP7Z4uWyY7mx1dKn5VSE519bcmC2q5LzQP4FKQ7wmAtEdn+NNJhyCmX4j0+2p86HK7q3nMtqcWjj7lk=
X-Received: by 2002:a05:6871:408b:b0:30b:ae4c:2e82 with SMTP id
 586e51a60fabf-33bb5c70d8emr1442027fac.12.1758270069312; Fri, 19 Sep 2025
 01:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250918014828.78383-1-cuiyunhui@bytedance.com> <0020389a-676c-74ab-b68f-cd0a44538980@huawei.com>
In-Reply-To: <0020389a-676c-74ab-b68f-cd0a44538980@huawei.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 19 Sep 2025 16:20:57 +0800
X-Gm-Features: AS18NWBQkKaaj0cbpRW_fkTB0QLgsS2b6FygBacmr9FG4kBe5HSnPtFCJ0Xdufg
Message-ID: <CAEEQ3wnEF9BwJxMuHVteD_8-cWzkMEMw57o3KJFr6sEhjQ1vDA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] arch_topology: move parse_acpi_topology()
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
X-CRM114-CacheID: sfid-20250919_012112_009861_3734B3C1 
X-CRM114-Status: GOOD (  26.83  )
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

On Thu, Sep 18, 2025 at 5:23=E2=80=AFPM Yicong Yang <yangyicong@huawei.com>=
 wrote:
>
> On 2025/9/18 9:48, Yunhui Cui wrote:
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
> > index 1037169abb459..c22746b45d57a 100644
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
> > +     return !!is_threaded;
> > +}
> > +
>
> you seem to miss the comment here in v1. acpi_pptt_cpu_is_thread() may re=
turn
> -ENOENT, in which case the CPU shouldn't be threaded?

Oh, got it, okay.

>
> thanks.

Thanks,
Yunhui

